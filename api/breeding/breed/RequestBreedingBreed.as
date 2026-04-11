package api.breeding.breed
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestBreedingBreed extends ClientRequest
   {
      
      public static const ACTION_BREED_FISHCOINS:String = "breedCoins";
      
      public static const ACTION_BREED_FISHBUCKS:String = "breedBucks";
      
      public static const DECREASE_BREEDING_TIME:String = "decTime";
      
      public static const INCREASE_BREEDING_CHANCE:String = "incChance";
       
      
      public var fishId:Number;
      
      public var action:String;
      
      public function RequestBreedingBreed(action:String, fishId:Number = 0)
      {
         super();
         this.fishId = fishId;
         this.action = action;
      }
   }
}
