package api.holidays.init
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseHolidaysInit extends ServerResp
   {
       
      
      private var _holidays:Array;
      
      public function ResponseHolidaysInit()
      {
         super();
      }
      
      public function set data(value:String) : void
      {
         this._holidays = decodeJson(value) as Array;
      }
      
      public function get holidays() : Array
      {
         return this._holidays;
      }
   }
}
