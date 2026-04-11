package api.tournaments.members
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseTournamentMembers extends ServerResp
   {
       
      
      private var _membersInfo:Object;
      
      public function ResponseTournamentMembers()
      {
         super();
      }
      
      public function get membersInfo() : Object
      {
         return this._membersInfo;
      }
      
      public function set members_info(value:String) : void
      {
         this._membersInfo = decodeJson(value);
      }
   }
}
