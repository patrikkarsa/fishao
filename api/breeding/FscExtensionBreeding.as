package api.breeding
{
   import api.base.FscExtensionBase;
   import api.breeding.breed.RequestBreedingBreed;
   
   public class FscExtensionBreeding extends FscExtensionBase
   {
       
      
      public function FscExtensionBreeding()
      {
         super();
      }
      
      public function breedFishPayFishcoins(fishId:Number, callback:Function = null) : void
      {
         this.breedFish(RequestBreedingBreed.ACTION_BREED_FISHCOINS,fishId,callback);
      }
      
      public function breedFishPayFishbucks(fishId:Number, callback:Function = null) : void
      {
         this.breedFish(RequestBreedingBreed.ACTION_BREED_FISHBUCKS,fishId,callback);
      }
      
      public function decreaseBreedingTime(callback:Function = null) : void
      {
         this.breedFish(RequestBreedingBreed.DECREASE_BREEDING_TIME,0,callback);
      }
      
      public function increaseBreedingChance(callback:Function = null) : void
      {
         this.breedFish(RequestBreedingBreed.INCREASE_BREEDING_CHANCE,0,callback);
      }
      
      private function breedFish(action:String, fishId:Number = 0, callback:Function = null) : void
      {
         var req:RequestBreedingBreed = new RequestBreedingBreed(action,fishId);
         _connection.send(req,callback);
      }
   }
}
