package api.locations.enterPrivateHouse
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestLocationsEnterPrivateHouse extends ClientRequest
   {
       
      
      public var ownerUsername:String;
      
      public function RequestLocationsEnterPrivateHouse(ownerUsername:String)
      {
         super();
         this.ownerUsername = ownerUsername;
      }
   }
}
