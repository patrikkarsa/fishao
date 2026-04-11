package api.featuresTemporary
{
   import api.base.FscExtensionBase;
   import api.featuresTemporary.init.RequestFeaturesTemporaryInit;
   
   public class FscExtensionFeaturesTemporary extends FscExtensionBase
   {
       
      
      public function FscExtensionFeaturesTemporary()
      {
         super();
      }
      
      override public function loadInitData(callback:Function) : void
      {
         _connection.send(new RequestFeaturesTemporaryInit(),callback);
      }
   }
}
