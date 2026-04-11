package api.locations.change_position
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestLocationChangePosition extends ClientRequest
   {
       
      
      public var position_new:String;
      
      public function RequestLocationChangePosition()
      {
         super();
      }
   }
}
