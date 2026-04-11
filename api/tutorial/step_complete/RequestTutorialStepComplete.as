package api.tutorial.step_complete
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestTutorialStepComplete extends ClientRequest
   {
       
      
      public var tutorial_type:String;
      
      public var step_current:int;
      
      public function RequestTutorialStepComplete()
      {
         super();
      }
   }
}
