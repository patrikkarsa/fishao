package api.furniture_factory
{
   import api.base.FscExtensionBase;
   import api.furniture_factory.get_info.RequestFurnitureFactoryGetInfo;
   import api.furniture_factory.get_reward.RequestFurnitureFactoryGetReward;
   import api.furniture_factory.skip_time.RequestFurnitureFactorySkipTime;
   
   public class FscExtensionFurnitureFactory extends FscExtensionBase
   {
       
      
      public function FscExtensionFurnitureFactory()
      {
         super();
      }
      
      override public function loadInitData(callback:Function) : void
      {
         this.getInfo(callback);
      }
      
      public function getInfo(callback:Function = null) : void
      {
         _connection.send(new RequestFurnitureFactoryGetInfo(),callback);
      }
      
      public function skipTime(callback:Function = null) : void
      {
         _connection.send(new RequestFurnitureFactorySkipTime(),callback);
      }
      
      public function getReward(callback:Function = null) : void
      {
         _connection.send(new RequestFurnitureFactoryGetReward(),callback);
      }
   }
}
