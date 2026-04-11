package api.trade.cancel
{
   import api.trade.base.RequestTradeBase;
   
   public class RequestTradeCancel extends RequestTradeBase
   {
       
      
      public function RequestTradeCancel(tradeId:int)
      {
         super(tradeId);
      }
   }
}
