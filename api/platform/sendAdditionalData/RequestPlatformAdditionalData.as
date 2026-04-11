package api.platform.sendAdditionalData
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestPlatformAdditionalData extends ClientRequest
   {
       
      
      public var userToken:String;
      
      public var platformApiUrl:String;
      
      public function RequestPlatformAdditionalData()
      {
         super();
      }
   }
}
