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
        const jsonStr = packetData.toString('utf8');
        console.log(`[TCP] Client ${clientId} -> Server: ${jsonStr}`);
        
        const packet = JSON.parse(jsonStr);
        const response = handlePacket(packet, clientId, (login) => { playerLogin = login; });
        
        if (response) {
          sendResponse(socket, response, clientId);
        }
      } catch (err) {
        console.log(`[TCP] Error parsing packet from client ${clientId}: ${err.message}`);
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
// SEND RESPONSE - 4-byte length prefix
// ============================================
function sendResponse(socket, data, clientId) {
  const jsonStr = JSON.stringify(data);
  const jsonBuffer = Buffer.from(jsonStr, 'utf8');
  
  // Create packet with 4-byte length prefix
  const packet = Buffer.alloc(4 + jsonBuffer.length);
  packet.writeUInt32BE(jsonBuffer.length, 0);
  jsonBuffer.copy(packet, 4);
  
  console.log(`[TCP] Server -> Client ${clientId}: ${jsonStr}`);
  socket.write(packet);
}

// ============================================
// PACKET HANDLER - Route packets to handlers
// ============================================
function handlePacket(packet, clientId, setLogin) {
  const cmd = packet.c || packet.cmd || packet.command;
  
  if (!cmd) {
    console.log(`[TCP] Unknown packet structure from client ${clientId}:`, packet);
    return null;
  }
  
  console.log(`[TCP] Handling command: ${cmd}`);
  
  switch (cmd) {
    // ================== LOGIN ==================
    case 'cr.LoginReq':
      const login = packet.p?.login || packet.login || 'guest';
      setLogin(login);
      return {
        c: 'sr.LoginSuccessResp',
        p: {
          login: login,
          sid: 'LOCAL-SID-12345',
          lang: 'en',
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
              name: 'Test World',
              onlinePlayers: 1,
              capacity: 100
            }
          ],
          selectedWorldId: 1,
          player: {
            id: 1,
            login: 'test',
            level: 1,
            xp: 0,
            gold: 1000,
            cash: 100,
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
  
  console.log('\n========================================');
  console.log('  FISHAO Local Server Started!');
  console.log('========================================');
  console.log(`  Web Interface: http://127.0.0.1:${HTTP_PORT}`);
  console.log(`  Game TCP Port: ${TCP_PORT}`);
  console.log(`  Policy Port:   ${POLICY_PORT}`);
  console.log('========================================\n');
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
