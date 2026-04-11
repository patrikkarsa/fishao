package api.interior.buy
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestInteriorBuy extends ClientRequest
   {
       
      
      public var item_id:int;
      
      public var currency_id:int;
      
      public function RequestInteriorBuy()
      {
         super();
      }
   }
}
