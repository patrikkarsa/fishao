package api.trade.offerReview
{
   import api.trade.base.RequestTradeBase;
   
   public class RequestTradeOfferReview extends RequestTradeBase
   {
       
      
      public var is_agree:Boolean;
      
      public function RequestTradeOfferReview(tradeId:int)
      {
         super(tradeId);
      }
   }
}
