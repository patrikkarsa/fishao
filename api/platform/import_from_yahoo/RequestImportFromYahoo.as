package api.platform.import_from_yahoo
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestImportFromYahoo extends ClientRequest
   {
       
      
      public var nickname:String;
      
      public var password:String;
      
      public var email:String;
      
      public var pid:String;
      
      public var platform_type:String;
      
      public var already_registered:Boolean;
      
      public function RequestImportFromYahoo()
      {
         super();
      }
   }
}
