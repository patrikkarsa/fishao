package api.tournaments.end
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseTournamentEnd extends ServerResp
   {
       
      
      public var isNotEnoughMembers:Boolean;
      
      private var _results:Object;
      
      public function ResponseTournamentEnd()
      {
         super();
      }
      
      public function get results() : Object
      {
         return this._results;
      }
      
      public function set results_info(value:String) : void
      {
         this._results = decodeJson(value);
      }
   }
}
