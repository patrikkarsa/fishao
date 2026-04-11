package api.furniture_factory.get_reward
{
   import api.furniture_factory.base.ResponseFurnitureFactoryBase;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseFurnitureFactoryGetReward extends ResponseFurnitureFactoryBase
   {
       
      
      private var _rewardData:Object;
      
      public function ResponseFurnitureFactoryGetReward()
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
