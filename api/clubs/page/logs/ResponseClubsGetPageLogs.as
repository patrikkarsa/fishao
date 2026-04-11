package api.clubs.page.logs
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseClubsGetPageLogs extends ServerResp
   {
       
      
      private var _logsData:Array;
      
      public function ResponseClubsGetPageLogs()
      {
         super();
      }
      
      public function get logsData() : Array
      {
         return this._logsData;
      }
      
      public function set logs_data(value:String) : void
      {
         this._logsData = decodeJson(value);
      }
   }
}
