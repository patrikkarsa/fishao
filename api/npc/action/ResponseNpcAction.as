package api.npc.action
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseNpcAction extends ServerResp
   {
       
      
      private var _npcName:String;
      
      private var _actionType:String;
      
      private var _actionParams:Object;
      
      public function ResponseNpcAction()
      {
         super();
         this._actionParams = {};
      }
      
      public function get npcName() : String
      {
         return this._npcName;
      }
      
      public function get actionType() : String
      {
         return this._actionType;
      }
      
      public function get params() : Object
      {
         return this._actionParams;
      }
      
      public function set npcName(value:String) : void
      {
         this._npcName = value;
      }
      
      public function set actionType(value:String) : void
      {
         this._actionType = value;
      }
      
      public function set actionParams(value:String) : void
      {
         if(value != null)
         {
            this._actionParams = decodeJson(value);
         }
      }
   }
}
