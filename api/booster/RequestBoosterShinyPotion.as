package api.booster
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestBoosterShinyPotion extends ClientRequest
   {
       
      
      public var boosterId:int;
      
      public function RequestBoosterShinyPotion(boosterId:int)
      {
         super();
         this.boosterId = boosterId;
      }
   }
}
