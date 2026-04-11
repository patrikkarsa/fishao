package api.events.members
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestEventMembers extends ClientRequest
   {
       
      
      public var offset:uint;
      
      public var length:uint;
      
      public function RequestEventMembers()
      {
         super();
      }
   }
}
