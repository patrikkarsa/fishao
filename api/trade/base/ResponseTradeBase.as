package api.trade.base
{
   import com.ax3.jss.requests.server.ServerResp;
   
   public class ResponseTradeBase extends ServerResp
   {
       
      
      private var _tradeId:int;
      
      public function ResponseTradeBase()
      {
         super();
      }
      
      public function get tradeId() : int
      {
         return this._tradeId;
      }
      
      public function set trade_id(value:int) : void
      {
         this._tradeId = value;
      }
   }
}
