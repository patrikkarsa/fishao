package api.periodicFeatures
{
   import api.base.FscExtensionBase;
   import api.periodicFeatures.init.RequestPeriodicFeaturesInit;
   
   public class FscExtensionPeriodicFeatures extends FscExtensionBase
   {
       
      
      public function FscExtensionPeriodicFeatures()
      {
         super();
      }
      
      override public function loadInitData(callback:Function) : void
      {
         _connection.send(new RequestPeriodicFeaturesInit(),callback);
      }
   }
}
