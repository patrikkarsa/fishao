package api.trade.cancel
{
   import api.trade.base.ResponseTradeBase;
   
   public class ResponseTradeCancel extends ResponseTradeBase
   {
       
      
      private var _description:String;
      
      private var _initiatorLogin:String;
      
      public function ResponseTradeCancel()
      {
         super();
      }
      
      public function get description() : String
      {
         return this._description;
      }
      
      public function get initiatorLogin() : String
      {
         return this._initiatorLogin;
      }
      
      public function set description(value:String) : void
      {
         this._description = value;
      }
      
      public function set initiator_login(value:String) : void
      {
         this._initiatorLogin = value;
      }
   }
}
