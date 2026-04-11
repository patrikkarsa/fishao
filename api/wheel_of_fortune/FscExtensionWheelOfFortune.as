package api.wheel_of_fortune
{
   import api.base.FscExtensionBase;
   import api.wheel_of_fortune.get_info.RequestWheelOfFortuneGetInfo;
   import api.wheel_of_fortune.init.RequestWheelOfFortuneInit;
   import api.wheel_of_fortune.spin.RequestWheelOfFortuneSpin;
   
   public class FscExtensionWheelOfFortune extends FscExtensionBase
   {
       
      
      public function FscExtensionWheelOfFortune()
      {
         super();
      }
      
      override public function loadInitData(callback:Function) : void
      {
         _connection.send(new RequestWheelOfFortuneInit(),callback);
      }
      
      public function getInfo(callback:Function = null) : void
      {
         _connection.send(new RequestWheelOfFortuneGetInfo(),callback);
      }
      
      public function spin(isFreeSpin:Boolean, callback:Function = null) : void
      {
         var request:RequestWheelOfFortuneSpin = new RequestWheelOfFortuneSpin();
         request.is_free_spin = isFreeSpin;
         _connection.send(request,callback);
      }
   }
}
