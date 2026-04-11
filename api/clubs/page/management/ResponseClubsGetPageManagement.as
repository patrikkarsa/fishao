package api.clubs.page.management
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseClubsGetPageManagement extends ServerResp
   {
       
      
      private var _requiredLevel:int;
      
      private var _description:String;
      
      private var _waitingForApprove:Array;
      
      public function ResponseClubsGetPageManagement()
      {
         super();
         this._waitingForApprove = [];
      }
      
      public function get description() : String
      {
         return this._description;
      }
      
      public function get waitingForApprove() : Array
      {
         return this._waitingForApprove;
      }
      
      public function get requiredLevel() : int
      {
         return this._requiredLevel;
      }
      
      public function set description(value:String) : void
      {
         this._description = value;
      }
      
      public function set waiting_approve_data(value:String) : void
      {
         this._waitingForApprove = decodeJson(value);
      }
      
      public function set required_level(value:int) : void
      {
         this._requiredLevel = value;
      }
   }
}
