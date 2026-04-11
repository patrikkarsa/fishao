package api.periodicFeatures.init
{
   import com.ax3.jss.requests.server.ServerResp;
   
   public class ResponsePeriodicFeaturesInit extends ServerResp
   {
       
      
      private var _data:String;
      
      public function ResponsePeriodicFeaturesInit()
      {
         super();
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(value:String) : void
      {
         this._data = value;
      }
   }
}
