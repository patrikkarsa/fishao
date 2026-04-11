package api.quests
{
   import api.base.FscExtensionBase;
   import api.quests.init.RequestQuestsInit;
   
   public class FscExtensionQuests extends FscExtensionBase
   {
       
      
      public function FscExtensionQuests()
      {
         super();
      }
      
      override public function loadInitData(callback:Function) : void
      {
         _connection.send(new RequestQuestsInit(),callback);
      }
   }
}
