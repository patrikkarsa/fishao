package api.clubs.tournament_history
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseClubsTournamentHistory extends ServerResp
   {
       
      
      private var _historyData:Array;
      
      public function ResponseClubsTournamentHistory()
      {
         super();
         this._historyData = [];
      }
      
      public function get historyData() : Array
      {
         return this._historyData;
      }
      
      public function set data(value:String) : void
      {
         this._historyData = decodeJson(value);
      }
   }
}
