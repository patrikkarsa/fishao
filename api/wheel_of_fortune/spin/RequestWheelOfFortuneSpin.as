package api.wheel_of_fortune.spin
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestWheelOfFortuneSpin extends ClientRequest
   {
       
      
      public var is_free_spin:Boolean;
      
      public function RequestWheelOfFortuneSpin()
      {
         super();
      }
   }
}
