package api.sales.start
{
   import com.ax3.jss.requests.server.ServerResp;
   
   public class ResponseSaleStart extends ServerResp
   {
       
      
      private var _sale:String;
      
      public function ResponseSaleStart()
      {
         super();
      }
      
      public function get sale() : String
      {
         return this._sale;
      }
      
      public function set sale(value:String) : void
      {
         this._sale = value;
      }
   }
}
