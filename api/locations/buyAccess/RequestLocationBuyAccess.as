package api.locations.buyAccess
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestLocationBuyAccess extends ClientRequest
   {
       
      
      public var locationId:int;
      
      public function RequestLocationBuyAccess()
      {
         super();
      }
   }
}
