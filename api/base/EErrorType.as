package api.base
{
   public class EErrorType
   {
      
      public static const USER_LOGINED_FROM_ANOTHER_SOCKET:String = "1003";
      
      public static const SESSION_NOT_FOUND:String = "1005";
      
      public static const ENERGY_IS_EMPTY:String = "1013";
      
      public static const TRADE_ERROR:String = "1020";
      
      public static const TRADE_ID_WRONG:String = "1021";
      
      public static const TRADE_DATA_IS_WRONG:String = "1022";
      
      public static const CANT_FISH_IN_ICE:String = "1024";
      
      public static const NOT_ENOUGH_MONEY:String = "1025";
      
      public static const USER_BANNED:String = "1026";
      
      public static const TRADE_OPPONENT_OUT_OF_LOCATION:String = "1037";
      
      public static const TRADE_OPPONENT_IN_TRADING_NOW:String = "1038";
      
      public static const EMAIL_IN_USE:String = "1034";
      
      public static const TOURNAMENT_LEVEL_RESTRICTION:String = "1042";
      
      public static const TOURNAMENT_IP_RESTRICTION:String = "1043";
      
      public static const USER_IS_BIG_SPENDER:String = "3000";
      
      public static const LOCATION_NOT_CONTAINS_SHELLS:String = "6100";
      
      public static const LOCATION_NOT_CONTAINS_CURRENT_SHELL:String = "6101";
      
      public static const LOCATION_NOT_CONTAINS_FRUITS:String = "6200";
      
      public static const LOCATION_NOT_CONTAINS_CURRENT_FRUIT:String = "6201";
       
      
      public function EErrorType()
      {
         super();
      }
   }
}
