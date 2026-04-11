package api.features
{
   import api.base.FscExtensionBase;
   import api.features.update.RequestFeaturesUpdate;
   
   public class FscExtensionFeatures extends FscExtensionBase
   {
       
      
      public function FscExtensionFeatures()
      {
         super();
      }
      
      override public function loadInitData(callback:Function) : void
      {
         _connection.send(new RequestFeaturesUpdate(),callback);
      }
   }
}
