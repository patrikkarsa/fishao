package api.wheel_of_fortune.spin
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseWheelOfFortuneSpin extends ServerResp
   {
       
      
      private var _rewardData:Object;
      
      public function ResponseWheelOfFortuneSpin()
      {
         super();
      }
      
      public function set reward_json(value:String) : void
      {
         this._rewardData = decodeJson(value);
      }
      
      public function get rewardData() : Object
      {
         return this._rewardData;
      }
   }
}
