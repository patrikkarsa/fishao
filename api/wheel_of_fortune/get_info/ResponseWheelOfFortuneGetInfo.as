package api.wheel_of_fortune.get_info
{
   import com.ax3.jss.requests.server.ServerResp;
   
   public class ResponseWheelOfFortuneGetInfo extends ServerResp
   {
       
      
      public var spin_price_fishcoins:int;
      
      public var free_spin_time_left:int;
      
      public var is_unlocked_all_fishes:Boolean;
      
      public function ResponseWheelOfFortuneGetInfo()
      {
         super();
      }
   }
}
