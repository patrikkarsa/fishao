package api.announcements
{
   import api.announcements.init.RequestAnnouncements;
   import api.base.FscExtensionBase;
   
   public class FscExtensionAnnouncements extends FscExtensionBase
   {
       
      
      public function FscExtensionAnnouncements()
      {
         super();
      }
      
      override public function loadInitData(callback:Function) : void
      {
         _connection.send(new RequestAnnouncements(),callback);
      }
   }
}
