package api.clubs.page.recommended
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseClubsGetPageRecommended extends ServerResp
   {
       
      
      private var _clubsData:Array;
      
      public function ResponseClubsGetPageRecommended()
      {
         super();
      }
      
      public function get clubsData() : Array
      {
         return this._clubsData;
      }
      
      public function set clubs_data(value:String) : void
      {
         this._clubsData = decodeJson(value);
      }
   }
}
