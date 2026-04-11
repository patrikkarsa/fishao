package api.advertising.click
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestAdvertisingClick extends ClientRequest
   {
       
      
      public var advertisement_id:int;
      
      public var offer_id:int;
      
      public function RequestAdvertisingClick()
      {
         super();
      }
   }
}
