package api.monster_fishes
{
   import api.base.FscExtensionBase;
   import api.monster_fishes.init.RequestMonsterFishesInit;
   
   public class FscExtensionMonsterFishes extends FscExtensionBase
   {
       
      
      public function FscExtensionMonsterFishes()
      {
         super();
      }
      
      override public function loadInitData(callback:Function) : void
      {
         _connection.send(new RequestMonsterFishesInit(),callback);
      }
   }
}
