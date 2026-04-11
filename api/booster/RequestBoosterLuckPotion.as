package api.booster
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestBoosterLuckPotion extends ClientRequest
   {
       
      
      public var luckPotionType:int;
      
      public function RequestBoosterLuckPotion(luckPotionType:int)
      {
         super();
         this.luckPotionType = luckPotionType;
      }
   }
}
