package api.friends.base
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestFriendsBase extends ClientRequest
   {
       
      
      public var login:String;
      
      public function RequestFriendsBase()
      {
         super();
      }
   }
}
