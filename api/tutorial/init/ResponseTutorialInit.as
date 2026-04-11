package api.tutorial.init
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseTutorialInit extends ServerResp
   {
       
      
      private var _tutorialsData:Array;
      
      public function ResponseTutorialInit()
      {
         super();
         this._tutorialsData = [];
      }
      
      public function get tutorialsData() : Array
      {
         return this._tutorialsData;
      }
      
      public function set list(value:String) : void
      {
         this._tutorialsData = decodeJson(value) || [];
      }
   }
}
