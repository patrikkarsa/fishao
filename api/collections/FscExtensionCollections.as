package api.collections
{
   import api.base.FscExtensionBase;
   import api.collections.init.RequestCollectionsInit;
   
   public class FscExtensionCollections extends FscExtensionBase
   {
       
      
      public function FscExtensionCollections()
      {
         super();
      }
      
      override public function loadInitData(callback:Function) : void
      {
         _connection.send(new RequestCollectionsInit(),callback);
      }
   }
}
