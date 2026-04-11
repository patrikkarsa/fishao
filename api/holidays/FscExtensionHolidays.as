package api.holidays
{
   import api.base.FscExtensionBase;
   import api.holidays.init.RequestHolidaysInit;
   
   public class FscExtensionHolidays extends FscExtensionBase
   {
       
      
      public function FscExtensionHolidays()
      {
         super();
      }
      
      override public function loadInitData(callback:Function) : void
      {
         _connection.send(new RequestHolidaysInit(),callback);
      }
   }
}
