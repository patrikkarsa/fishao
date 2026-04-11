package api.advertising
{
   import api.advertising.click.RequestAdvertisingClick;
   import api.advertising.init.RequestAdvertisingInit;
   import api.advertising.shown.RequestAdvertisingShown;
   import api.base.FscExtensionBase;
   import com.ax3.fishao.Config;
   
   public class FscExtensionAdvertising extends FscExtensionBase
   {
       
      
      public function FscExtensionAdvertising()
      {
         super();
      }
      
      override public function loadInitData(callback:Function) : void
      {
         var request:RequestAdvertisingInit = new RequestAdvertisingInit();
         request.isSecureConnectionProtocol = Config.IS_SECURE_CONNECTION_PROTOCOL;
         _connection.send(request,callback);
      }
      
      public function show(place:String, callback:Function = null) : void
      {
         var request:RequestAdvertisingShown = new RequestAdvertisingShown();
         request.place = place;
         _connection.send(request,callback);
      }
      
      public function click(advertisementId:int, offerId:int, callback:Function = null) : void
      {
         var request:RequestAdvertisingClick = new RequestAdvertisingClick();
         request.advertisement_id = advertisementId;
         request.offer_id = offerId;
         _connection.send(request,callback);
      }
   }
}
