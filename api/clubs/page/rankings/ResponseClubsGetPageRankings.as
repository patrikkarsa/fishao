package api.clubs.page.rankings
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseClubsGetPageRankings extends ServerResp
   {
       
      
      private var _rankingsData:Array;
      
      private var _rankingType:String;
      
      public function ResponseClubsGetPageRankings()
      {
         super();
      }
      
      public function get rankingsData() : Array
      {
         return this._rankingsData;
      }
      
      public function get rankingType() : String
      {
         return this._rankingType;
      }
      
      public function set rankings_data(value:String) : void
      {
         this._rankingsData = decodeJson(value);
      }
      
      public function set ranking_type(value:String) : void
      {
         this._rankingType = value;
      }
   }
}
