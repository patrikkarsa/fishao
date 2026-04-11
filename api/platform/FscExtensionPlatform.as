package api.platform
{
   import api.platform.generateUserName.RequestPlatformGenerateUserName;
   import api.platform.sendAdditionalData.RequestPlatformAdditionalData;
   import com.ax3.jss.ext.BaseFscExtension;
   
   public class FscExtensionPlatform extends BaseFscExtension
   {
       
      
      public function FscExtensionPlatform()
      {
         super();
      }
      
      public function generateName(nameFirst:String, platformType:String, callback:Function) : void
      {
         var request:RequestPlatformGenerateUserName = new RequestPlatformGenerateUserName();
         request.name_first = nameFirst;
         request.platform_type = platformType;
         _connection.send(request,callback);
      }
      
      public function sendData(userToken:String, platformApiUrl:String, callback:Function = null) : void
      {
         var request:RequestPlatformAdditionalData = new RequestPlatformAdditionalData();
         request.userToken = userToken;
         request.platformApiUrl = platformApiUrl;
         _connection.send(request,callback);
      }
   }
}
