package api.events.shown
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestEventShown extends ClientRequest
   {
       
      
      public var event_id:int;
      
      public function RequestEventShown()
      {
         super();
      }
   }
}
