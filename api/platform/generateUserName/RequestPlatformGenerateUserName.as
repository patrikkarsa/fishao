package api.platform.generateUserName
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestPlatformGenerateUserName extends ClientRequest
   {
       
      
      public var name_first:String;
      
      public var platform_type:String;
      
      public function RequestPlatformGenerateUserName()
      {
         super();
      }
   }
}
