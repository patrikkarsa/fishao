const http = require('http');
const net = require('net');
const fs = require('fs');
const path = require('path');

// Configuration
const HTTP_PORT = 80;
const TCP_PORT = 9777;
const POLICY_PORT = 843;

// MIME types for static file serving
const MIME_TYPES = {
  '.html': 'text/html',
  '.css': 'text/css',
  '.js': 'application/javascript',
  '.json': 'application/json',
  '.png': 'image/png',
  '.jpg': 'image/jpeg',
  '.jpeg': 'image/jpeg',
  '.gif': 'image/gif',
  '.svg': 'image/svg+xml',
  '.swf': 'application/x-shockwave-flash',
  '.xml': 'application/xml',
  '.mp3': 'audio/mpeg',
  '.wav': 'audio/wav',
  '.ogg': 'audio/ogg',
  '.woff': 'font/woff',
  '.woff2': 'font/woff2',
  '.ttf': 'font/ttf',
  '.eot': 'application/vnd.ms-fontobject'
};

// Cross-domain policy for Flash
const CROSSDOMAIN_POLICY = `<?xml version="1.0"?>
<!DOCTYPE cross-domain-policy SYSTEM "http://www.adobe.com/xml/dtds/cross-domain-policy.dtd">
<cross-domain-policy>
  <allow-access-from domain="*" to-ports="*"/>
</cross-domain-policy>\0`;

// Store connected clients
const clients = new Map();
let clientIdCounter = 1;

// ============================================
// AMF3 DECODER - Parse Flash AMF3 binary format
// ============================================
class AMF3Decoder {
  constructor(buffer) {
    this.buffer = buffer;
    this.pos = 0;
    this.stringRefs = [];
    this.objectRefs = [];
    this.traitRefs = [];
  }

  readByte() {
    return this.buffer[this.pos++];
  }

  readU29() {
    let result = 0;
    for (let i = 0; i < 4; i++) {
      const byte = this.readByte();
      if (i < 3) {
        result = (result << 7) | (byte & 0x7F);
        if (!(byte & 0x80)) break;
      } else {
        result = (result << 8) | byte;
      }
    }
    return result;
  }

  readString() {
    const ref = this.readU29();
    if ((ref & 1) === 0) {
      return this.stringRefs[ref >> 1];
    }
    const len = ref >> 1;
    if (len === 0) return '';
    const str = this.buffer.toString('utf8', this.pos, this.pos + len);
    this.pos += len;
    this.stringRefs.push(str);
    return str;
  }

  readValue() {
    const marker = this.readByte();
    
    switch (marker) {
      case 0x00: // undefined
        return undefined;
      case 0x01: // null
        return null;
      case 0x02: // false
        return false;
      case 0x03: // true
        return true;
      case 0x04: // integer
        const i = this.readU29();
        return (i << 3) >> 3; // sign extend
      case 0x05: // double
        const dv = new DataView(this.buffer.buffer, this.buffer.byteOffset + this.pos, 8);
        this.pos += 8;
        return dv.getFloat64(0, false);
      case 0x06: // string
        return this.readString();
      case 0x08: // date
        const dateRef = this.readU29();
        if ((dateRef & 1) === 0) {
          return this.objectRefs[dateRef >> 1];
        }
        const dv2 = new DataView(this.buffer.buffer, this.buffer.byteOffset + this.pos, 8);
        this.pos += 8;
        const date = new Date(dv2.getFloat64(0, false));
        this.objectRefs.push(date);
        return date;
      case 0x09: // array
        return this.readArray();
      case 0x0A: // object
        return this.readObject();
      case 0x0C: // byte array
        return this.readByteArray();
      default:
        console.log(`[AMF3] Unknown marker: 0x${marker.toString(16)} at pos ${this.pos - 1}`);
        return null;
    }
  }

  readArray() {
    const ref = this.readU29();
    if ((ref & 1) === 0) {
      return this.objectRefs[ref >> 1];
    }
    const len = ref >> 1;
    const arr = [];
    this.objectRefs.push(arr);
    
    // Read associative portion (string keys)
    let key = this.readString();
    while (key !== '') {
      arr[key] = this.readValue();
      key = this.readString();
    }
    
    // Read dense portion
    for (let i = 0; i < len; i++) {
      arr.push(this.readValue());
    }
    
    return arr;
  }

  readObject() {
    const ref = this.readU29();
    if ((ref & 1) === 0) {
      return this.objectRefs[ref >> 1];
    }
    
    const obj = {};
    this.objectRefs.push(obj);
    
    const traitRef = ref >> 1;
    let traits;
    
    if ((traitRef & 1) === 0) {
      traits = this.traitRefs[traitRef >> 1];
    } else {
      traits = {
        className: this.readString(),
        dynamic: !!((traitRef >> 1) & 1),
        externalizable: !!((traitRef >> 1) & 2),
        properties: []
      };
      
      const propCount = traitRef >> 3;
      for (let i = 0; i < propCount; i++) {
        traits.properties.push(this.readString());
      }
      
      this.traitRefs.push(traits);
    }
    
    if (traits.className) {
      obj._className = traits.className;
    }
    
    // Read sealed properties
    for (const prop of traits.properties) {
      obj[prop] = this.readValue();
    }
    
    // Read dynamic properties
    if (traits.dynamic) {
      let propName = this.readString();
      while (propName !== '') {
        obj[propName] = this.readValue();
        propName = this.readString();
      }
    }
    
    return obj;
  }

  readByteArray() {
    const ref = this.readU29();
    if ((ref & 1) === 0) {
      return this.objectRefs[ref >> 1];
    }
    const len = ref >> 1;
    const bytes = this.buffer.slice(this.pos, this.pos + len);
    this.pos += len;
    this.objectRefs.push(bytes);
    return bytes;
  }
}

// ============================================
// AMF3 ENCODER - Encode to Flash AMF3 binary format
// ============================================
class AMF3Encoder {
  constructor() {
    this.chunks = [];
    this.stringRefs = new Map();
    this.objectRefs = new Map();
    this.traitRefs = new Map();
  }

  writeByte(byte) {
    this.chunks.push(Buffer.from([byte]));
  }

  writeU29(value) {
    if (value < 0x80) {
      this.writeByte(value);
    } else if (value < 0x4000) {
      this.writeByte(((value >> 7) & 0x7F) | 0x80);
      this.writeByte(value & 0x7F);
    } else if (value < 0x200000) {
      this.writeByte(((value >> 14) & 0x7F) | 0x80);
      this.writeByte(((value >> 7) & 0x7F) | 0x80);
      this.writeByte(value & 0x7F);
    } else {
      this.writeByte(((value >> 22) & 0x7F) | 0x80);
      this.writeByte(((value >> 15) & 0x7F) | 0x80);
      this.writeByte(((value >> 8) & 0x7F) | 0x80);
      this.writeByte(value & 0xFF);
    }
  }

  writeString(str) {
    if (str === '') {
      this.writeU29(1); // empty string, inline
      return;
    }
    
    if (this.stringRefs.has(str)) {
      this.writeU29(this.stringRefs.get(str) << 1);
      return;
    }
    
    this.stringRefs.set(str, this.stringRefs.size);
    const buf = Buffer.from(str, 'utf8');
    this.writeU29((buf.length << 1) | 1);
    this.chunks.push(buf);
  }

  writeValue(value) {
    if (value === undefined) {
      this.writeByte(0x00);
    } else if (value === null) {
      this.writeByte(0x01);
    } else if (value === false) {
      this.writeByte(0x02);
    } else if (value === true) {
      this.writeByte(0x03);
    } else if (typeof value === 'number') {
      if (Number.isInteger(value) && value >= -268435456 && value <= 268435455) {
        this.writeByte(0x04);
        this.writeU29(value & 0x1FFFFFFF);
      } else {
        this.writeByte(0x05);
        const buf = Buffer.alloc(8);
        buf.writeDoubleBE(value, 0);
        this.chunks.push(buf);
      }
    } else if (typeof value === 'string') {
      this.writeByte(0x06);
      this.writeString(value);
    } else if (Array.isArray(value)) {
      this.writeArray(value);
    } else if (value instanceof Date) {
      this.writeByte(0x08);
      this.writeU29(1); // inline
      const buf = Buffer.alloc(8);
      buf.writeDoubleBE(value.getTime(), 0);
      this.chunks.push(buf);
    } else if (typeof value === 'object') {
      this.writeObject(value);
    } else {
      this.writeByte(0x01); // null for unknown
    }
  }

  writeArray(arr) {
    this.writeByte(0x09);
    this.writeU29((arr.length << 1) | 1);
    this.writeString(''); // empty key terminates associative portion
    for (const item of arr) {
      this.writeValue(item);
    }
  }

  writeObject(obj) {
    this.writeByte(0x0A);
    
    const keys = Object.keys(obj).filter(k => k !== '_className');
    const className = obj._className || '';
    
    // Write traits inline, dynamic
    // Format: U29 = (propCount << 4) | (dynamic << 3) | (externalizable << 2) | 0b11
    const traitInfo = (0 << 4) | (1 << 3) | (0 << 2) | 0b11;
    this.writeU29(traitInfo);
    this.writeString(className);
    
    // Write dynamic properties
    for (const key of keys) {
      this.writeString(key);
      this.writeValue(obj[key]);
    }
    this.writeString(''); // empty string terminates dynamic properties
  }

  getBuffer() {
    return Buffer.concat(this.chunks);
  }
}

// ============================================
// HTTP SERVER - Serves static files
// ============================================
const httpServer = http.createServer((req, res) => {
  let filePath = req.url === '/' ? '/index.html' : req.url;
  
  // Remove query strings
  filePath = filePath.split('?')[0];
  
  // Security: prevent directory traversal
  filePath = path.normalize(filePath).replace(/^(\.\.[\/\\])+/, '');
  
  const fullPath = path.join(__dirname, filePath);
  const ext = path.extname(fullPath).toLowerCase();
  const contentType = MIME_TYPES[ext] || 'application/octet-stream';
  
  fs.readFile(fullPath, (err, content) => {
    if (err) {
      if (err.code === 'ENOENT') {
        console.log(`[HTTP] 404 Not Found: ${filePath}`);
        res.writeHead(404, { 'Content-Type': 'text/plain' });
        res.end('404 Not Found');
      } else {
        console.log(`[HTTP] 500 Error: ${err.message}`);
        res.writeHead(500, { 'Content-Type': 'text/plain' });
        res.end('500 Internal Server Error');
      }
    } else {
      console.log(`[HTTP] 200 OK: ${filePath}`);
      res.writeHead(200, { 
        'Content-Type': contentType,
        'Access-Control-Allow-Origin': '*'
      });
      res.end(content);
    }
  });
});

// ============================================
// POLICY SERVER - Returns crossdomain.xml
// ============================================
const policyServer = net.createServer((socket) => {
  console.log('[POLICY] Client connected');
  
  socket.on('data', (data) => {
    const request = data.toString();
    console.log(`[POLICY] Received: ${request.trim()}`);
    
    if (request.includes('policy-file-request')) {
      console.log('[POLICY] Sending crossdomain policy');
      socket.write(CROSSDOMAIN_POLICY);
    }
  });
  
  socket.on('close', () => {
    console.log('[POLICY] Client disconnected');
  });
  
  socket.on('error', (err) => {
    console.log(`[POLICY] Error: ${err.message}`);
  });
});

// ============================================
// GAME TCP SERVER - Handles game packets
// ============================================
const tcpServer = net.createServer((socket) => {
  const clientId = clientIdCounter++;
  clients.set(clientId, socket);
  
  console.log(`[TCP] Client ${clientId} connected from ${socket.remoteAddress}`);
  
  let buffer = Buffer.alloc(0);
  let playerLogin = 'guest';
  
  socket.on('data', (data) => {
    // Append incoming data to buffer
    buffer = Buffer.concat([buffer, data]);
    
    // Process complete packets (2-byte length prefix from client)
    while (buffer.length >= 2) {
      const packetLength = buffer.readUInt16BE(0);
      
      if (buffer.length < 2 + packetLength) {
        // Not enough data yet
        break;
      }
      
      // Extract packet data
      const packetData = buffer.slice(2, 2 + packetLength);
      buffer = buffer.slice(2 + packetLength);
      
      try {
        // Decode AMF3 packet
        const decoder = new AMF3Decoder(packetData);
        const packet = decoder.readValue();
        
        console.log(`[TCP] Client ${clientId} -> Server:`, JSON.stringify(packet, null, 2));
        
        const response = handlePacket(packet, clientId, (login) => { playerLogin = login; });
        
        if (response) {
          sendResponse(socket, response, clientId);
        }
      } catch (err) {
        console.log(`[TCP] Error parsing AMF3 packet from client ${clientId}: ${err.message}`);
        console.log(`[TCP] Raw packet hex: ${packetData.toString('hex')}`);
      }
    }
  });
  
  socket.on('close', () => {
    console.log(`[TCP] Client ${clientId} (${playerLogin}) disconnected`);
    clients.delete(clientId);
  });
  
  socket.on('error', (err) => {
    console.log(`[TCP] Client ${clientId} error: ${err.message}`);
    clients.delete(clientId);
  });
});

// ============================================
// SEND RESPONSE - 4-byte length prefix + AMF3
// ============================================
function sendResponse(socket, data, clientId) {
  const encoder = new AMF3Encoder();
  encoder.writeValue(data);
  const amfBuffer = encoder.getBuffer();
  
  // Create packet with 4-byte length prefix
  const packet = Buffer.alloc(4 + amfBuffer.length);
  packet.writeUInt32BE(amfBuffer.length, 0);
  amfBuffer.copy(packet, 4);
  
  console.log(`[TCP] Server -> Client ${clientId}:`, JSON.stringify(data, null, 2));
  socket.write(packet);
}

// ============================================
// PACKET HANDLER - Route packets to handlers
// ============================================
function handlePacket(packet, clientId, setLogin) {
  if (!packet || typeof packet !== 'object') {
    console.log(`[TCP] Invalid packet from client ${clientId}:`, packet);
    return null;
  }
  
  const cmd = packet.c || packet.cmd || packet.command;
  
  if (!cmd) {
    console.log(`[TCP] Unknown packet structure from client ${clientId}:`, packet);
    return null;
  }
  
  console.log(`[TCP] Handling command: ${cmd}`);
  
  // Get parameters (p field or the whole packet minus c)
  const params = packet.p || packet;
  
  switch (cmd) {
    // ================== LOGIN ==================
    case 'cr.LoginReq':
      const login = params.login || 'guest';
      setLogin(login);
      return {
        c: 'sr.LoginSuccessResp',
        p: {
          login: login,
          sid: 'LOCAL-SID-' + Date.now(),
          lang: params.lang || 'en',
          isGuest: false,
          needLog: true,
          unreadPrivateMessages: 0,
          emailActivation: 1,
          maintenanceIn: 0,
          maintenanceTime: 0,
          referralsDisabled: false
        }
      };
    
    // ================== WORLD INIT ==================
    case 'api.worlds.init.RequestWorldsInit':
      return {
        c: 'api.worlds.init.ResponseWorldsInit',
        p: {
          worlds: [
            {
              id: 1,
              name: 'Local World',
              onlinePlayers: 1,
              capacity: 100
            }
          ],
          selectedWorldId: 1,
          player: {
            id: 1,
            login: 'Player',
            level: 1,
            xp: 0,
            gold: 10000,
            cash: 1000,
            energy: 100,
            maxEnergy: 100,
            location: {
              worldId: 1,
              mapId: 1,
              x: 100,
              y: 100
            },
            inventory: [],
            equipment: {},
            clothes: [],
            stats: {}
          }
        }
      };
    
    // ================== FISHING LINE ==================
    case 'api.fishingLine.init.RequestFishingLineInit':
      return {
        c: 'api.fishingLine.init.ResponseFishingLineInit',
        p: {}
      };
    
    // ================== FEATURES ==================
    case 'api.features.update.RequestFeaturesUpdate':
      return {
        c: 'api.features.update.ResponseFeaturesUpdate',
        p: {
          features: []
        }
      };
    
    case 'api.featuresTemporary.init.RequestFeaturesTemporaryInit':
      return {
        c: 'api.featuresTemporary.init.ResponseFeaturesTemporaryInit',
        p: {}
      };
    
    // ================== COLLECTIONS ==================
    case 'api.collections.init.RequestCollectionsInit':
      return {
        c: 'api.collections.init.ResponseCollectionsInit',
        p: {
          collections: []
        }
      };
    
    // ================== TUTORIAL ==================
    case 'api.tutorial.init.RequestTutorialInit':
      return {
        c: 'api.tutorial.init.ResponseTutorialInit',
        p: {
          completed: true
        }
      };
    
    // ================== WHEEL OF FORTUNE ==================
    case 'api.wheel_of_fortune.init.RequestWheelOfFortuneInit':
      return {
        c: 'api.wheel_of_fortune.init.ResponseWheelOfFortuneInit',
        p: {}
      };
    
    // ================== FISHES ==================
    case 'api.fishes.getRelevant.RequestFishesGetRelevant':
      return {
        c: 'api.fishes.getRelevant.ResponseFishesGetRelevant',
        p: {
          fishes: []
        }
      };
    
    // ================== ADVERTISING ==================
    case 'api.advertising.init.RequestAdvertisingInit':
      return {
        c: 'api.advertising.init.ResponseAdvertisingInit',
        p: {}
      };
    
    // ================== ANNOUNCEMENTS ==================
    case 'api.announcements.init.RequestAnnouncements':
      return {
        c: 'api.announcements.init.ResponseAnnouncements',
        p: {
          announcements: []
        }
      };
    
    // ================== CLUBS ==================
    case 'api.clubs.init.RequestClubsInit':
      return {
        c: 'api.clubs.init.ResponseClubsInit',
        p: {
          clubs: []
        }
      };
    
    // ================== FURNITURE FACTORY ==================
    case 'api.furniture_factory.get_info.RequestFurnitureFactoryGetInfo':
      return {
        c: 'api.furniture_factory.get_info.ResponseFurnitureFactoryGetInfo',
        p: {}
      };
    
    // ================== QUESTS ==================
    case 'api.quests.init.RequestQuestsInit':
      return {
        c: 'api.quests.init.ResponseQuestsInit',
        p: {
          quests: []
        }
      };
    
    // ================== EVENTS ==================
    case 'api.events.init.RequestEventsInit':
      return {
        c: 'api.events.init.ResponseEventsInit',
        p: {
          events: []
        }
      };
    
    // ================== SALES ==================
    case 'api.sales.init.RequestSalesInit':
      return {
        c: 'api.sales.init.ResponseSalesInit',
        p: {
          sales: []
        }
      };
    
    // ================== HOLIDAYS ==================
    case 'api.holidays.init.RequestHolidaysInit':
      return {
        c: 'api.holidays.init.ResponseHolidaysInit',
        p: {
          holidays: []
        }
      };
    
    // ================== PERIODIC FEATURES ==================
    case 'api.periodicFeatures.init.RequestPeriodicFeaturesInit':
      return {
        c: 'api.periodicFeatures.init.ResponsePeriodicFeaturesInit',
        p: {
          periodicFeatures: []
        }
      };
    
    // ================== MONEY TREE ==================
    case 'api.moneyTree.init.RequestMoneyTreeInit':
      return {
        c: 'api.moneyTree.init.ResponseMoneyTreeInit',
        p: {}
      };
    
    // ================== MONSTER FISHES ==================
    case 'api.monster_fishes.init.RequestMonsterFishesInit':
      return {
        c: 'api.monster_fishes.init.ResponseMonsterFishesInit',
        p: {}
      };
    
    // ================== TOURNAMENTS ==================
    case 'api.tournaments.getRelevant.RequestTournamentGetRelevant':
      return {
        c: 'api.tournaments.getRelevant.ResponseTournamentGetRelevant',
        p: {
          tournaments: []
        }
      };
    
    // ================== INTERIOR ==================
    case 'api.interior.get_info.RequestInteriorGetInfo':
      return {
        c: 'api.interior.get_info.ResponseInteriorGetInfo',
        p: {}
      };
    
    // ================== BREEDING ==================
    case 'api.breeding.getCurrent.RequestBreedingGetCurrent':
      return {
        c: 'api.breeding.getCurrent.ResponseBreedingGetCurrent',
        p: {}
      };
    
    // ================== PLATFORM ==================
    case 'api.platform.generateUserName.RequestPlatformGenerateUserName':
      return {
        c: 'api.platform.generateUserName.ResponsePlatformGenerateUserName',
        p: {
          userName: 'Player' + Math.floor(Math.random() * 10000)
        }
      };
    
    // ================== LOCATION ==================
    case 'api.locations.change_position.RequestLocationChangePosition':
      return {
        c: 'api.locations.change_position.ResponseLocationChangePosition',
        p: {}
      };
    
    // ================== PING/HEARTBEAT ==================
    case 'ping':
    case 'heartbeat':
      return {
        c: 'pong',
        p: {
          timestamp: Date.now()
        }
      };
    
    // ================== DEFAULT ==================
    default:
      console.log(`[TCP] Unhandled command: ${cmd}`);
      // Return a generic OK response for unknown commands
      return {
        c: cmd.replace('Request', 'Response'),
        p: {}
      };
  }
}

// ============================================
// START ALL SERVERS
// ============================================
function startServers() {
  console.log('\n========================================');
  console.log('  FISHAO Local Server Started!');
  console.log('========================================');
  console.log(`  Web Interface: http://127.0.0.1:${HTTP_PORT}`);
  console.log(`  Game TCP Port: ${TCP_PORT}`);
  console.log(`  Policy Port:   ${POLICY_PORT}`);
  console.log('========================================\n');
  
  // Start HTTP server
  httpServer.listen(HTTP_PORT, () => {
    console.log(`[HTTP] Server running on http://127.0.0.1:${HTTP_PORT}`);
  });
  
  // Start Policy server
  policyServer.listen(POLICY_PORT, () => {
    console.log(`[POLICY] Server running on port ${POLICY_PORT}`);
  });
  
  // Start TCP game server
  tcpServer.listen(TCP_PORT, () => {
    console.log(`[TCP] Game server running on port ${TCP_PORT}`);
  });
}

// Handle errors for ports that might require elevated privileges
httpServer.on('error', (err) => {
  if (err.code === 'EACCES') {
    console.error(`[ERROR] Port ${HTTP_PORT} requires elevated privileges.`);
    console.error('        Run with: sudo node server.js');
    console.error('        Or change HTTP_PORT to a higher number (e.g., 8080)');
  } else if (err.code === 'EADDRINUSE') {
    console.error(`[ERROR] Port ${HTTP_PORT} is already in use.`);
  } else {
    console.error(`[ERROR] HTTP Server error: ${err.message}`);
  }
  process.exit(1);
});

policyServer.on('error', (err) => {
  if (err.code === 'EACCES') {
    console.error(`[ERROR] Port ${POLICY_PORT} requires elevated privileges.`);
    console.error('        Policy server will not be available.');
  } else if (err.code === 'EADDRINUSE') {
    console.error(`[ERROR] Port ${POLICY_PORT} is already in use.`);
  } else {
    console.error(`[ERROR] Policy Server error: ${err.message}`);
  }
});

tcpServer.on('error', (err) => {
  if (err.code === 'EADDRINUSE') {
    console.error(`[ERROR] Port ${TCP_PORT} is already in use.`);
  } else {
    console.error(`[ERROR] TCP Server error: ${err.message}`);
  }
  process.exit(1);
});

// Graceful shutdown
process.on('SIGINT', () => {
  console.log('\n[SERVER] Shutting down gracefully...');
  
  // Close all client connections
  clients.forEach((socket, id) => {
    console.log(`[TCP] Closing connection for client ${id}`);
    socket.destroy();
  });
  
  httpServer.close();
  policyServer.close();
  tcpServer.close();
  
  console.log('[SERVER] Goodbye!');
  process.exit(0);
});

// Start the servers
startServers();
