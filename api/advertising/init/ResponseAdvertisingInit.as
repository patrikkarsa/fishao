package api.advertising.init
{
   import com.ax3.jss.requests.server.ServerResp;
   
   public class ResponseAdvertisingInit extends ServerResp
   {
       
      
      private var _data:String;
      
      public function ResponseAdvertisingInit()
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
