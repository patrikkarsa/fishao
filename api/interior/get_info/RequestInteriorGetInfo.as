package api.interior.get_info
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestInteriorGetInfo extends ClientRequest
   {
       
      
      public var owner_nickname:String;
      
      public var is_decoration_shop:Boolean;
      
      public function RequestInteriorGetInfo()
      {
         super();
      }
   }
}
