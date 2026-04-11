package api.booster
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestBoosterExp extends ClientRequest
   {
       
      
      public var expBoosterType:int;
      
      public function RequestBoosterExp(expBoosterType:int)
      {
         super();
         this.expBoosterType = expBoosterType;
      }
   }
}
