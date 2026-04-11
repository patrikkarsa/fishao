package api.events.members
{
   import api.events.data.EventMemberInfo;
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseEventMembers extends ServerResp
   {
       
      
      private var _members:Array;
      
      private var _position:uint;
      
      private var _length:uint;
      
      public function ResponseEventMembers()
      {
         super();
         this._members = [];
      }
      
      public function get members() : Array
      {
         return this._members;
      }
      
      public function set data_members(value:String) : void
      {
         var dataItem:Object = null;
         var item:EventMemberInfo = null;
         var dataList:Array = decodeJson(value) as Array;
         for each(dataItem in dataList)
         {
            item = new EventMemberInfo();
            item.deserialize(dataItem);
            this._members.push(item);
         }
      }
      
      public function get position() : uint
      {
         return this._position;
      }
      
      public function set position(value:uint) : void
      {
         this._position = value;
      }
      
      public function get length() : uint
      {
         return this._length;
      }
      
      public function set length(value:uint) : void
      {
         this._length = value;
      }
   }
}
