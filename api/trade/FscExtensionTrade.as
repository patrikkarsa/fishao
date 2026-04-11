package api.trade
{
   import api.trade.accept.RequestTradeAccept;
   import api.trade.cancel.RequestTradeCancel;
   import api.trade.offerConfirm.RequestTradeOfferConfirm;
   import api.trade.offerReview.RequestTradeOfferReview;
   import api.trade.offerUpdate.RequestTradeOfferUpdate;
   import api.trade.start.RequestTradeStart;
   import com.ax3.jss.ext.BaseFscExtension;
   
   public class FscExtensionTrade extends BaseFscExtension
   {
       
      
      public function FscExtensionTrade()
      {
         super();
      }
      
      public function startTrade(targetName:String, targetType:String, callback:Function = null) : void
      {
         var request:RequestTradeStart = new RequestTradeStart(-1);
         request.target_name = targetName;
         request.trade_type = targetType;
         _connection.send(request,callback);
      }
      
      public function acceptTrade(tradeId:int, callback:Function = null) : void
      {
         _connection.send(new RequestTradeAccept(tradeId),callback);
      }
      
      public function cancelTrade(tradeId:int, callback:Function = null) : void
      {
         _connection.send(new RequestTradeCancel(tradeId),callback);
      }
      
      public function updateOffer(tradeId:int, products:Array, callback:Function = null) : void
      {
         var request:RequestTradeOfferUpdate = new RequestTradeOfferUpdate(tradeId);
         request.items = JSON.stringify(products);
         _connection.send(request,callback);
      }
      
      public function reviewOffer(tradeId:int, callback:Function = null) : void
      {
         var request:RequestTradeOfferReview = new RequestTradeOfferReview(tradeId);
         request.is_agree = true;
         _connection.send(request,callback);
      }
      
      public function resetOffer(tradeId:int, callback:Function = null) : void
      {
         var request:RequestTradeOfferReview = new RequestTradeOfferReview(tradeId);
         request.is_agree = false;
         _connection.send(request,callback);
      }
      
      public function confirmOffer(tradeId:int, callback:Function = null) : void
      {
         _connection.send(new RequestTradeOfferConfirm(tradeId),callback);
      }
   }
}
