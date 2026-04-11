package api.interior
{
   import api.base.FscExtensionBase;
   import api.interior.buy.RequestInteriorBuy;
   import api.interior.get_info.RequestInteriorGetInfo;
   import api.interior.save.RequestInteriorSave;
   
   public class FscExtensionInterior extends FscExtensionBase
   {
       
      
      public function FscExtensionInterior()
      {
         super();
      }
      
      public function buyItem(itemId:int, currencyId:int, callback:Function = null) : void
      {
         var request:RequestInteriorBuy = new RequestInteriorBuy();
         request.item_id = itemId;
         request.currency_id = currencyId;
         _connection.send(request,callback);
      }
      
      public function getInfo(ownerNickname:String, isDecoShop:Boolean, callback:Function = null) : void
      {
         var request:RequestInteriorGetInfo = new RequestInteriorGetInfo();
         request.owner_nickname = ownerNickname;
         request.is_decoration_shop = isDecoShop;
         _connection.send(request,callback);
      }
      
      public function save(interiorJson:String, callback:Function = null) : void
      {
         var request:RequestInteriorSave = new RequestInteriorSave();
         request.interior_json = interiorJson;
         _connection.send(request,callback);
      }
   }
}
