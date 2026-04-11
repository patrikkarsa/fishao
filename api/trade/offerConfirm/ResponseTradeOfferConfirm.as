package api.trade.offerConfirm
{
   import api.trade.base.ResponseTradeBase;
   
   public class ResponseTradeOfferConfirm extends ResponseTradeBase
   {
       
      
      private var _login:String;
      
      public function ResponseTradeOfferConfirm()
      {
         super();
      }
      
      public function get login() : String
      {
         return this._login;
      }
      
      public function set login(value:String) : void
      {
         this._login = value;
      }
   }
}
