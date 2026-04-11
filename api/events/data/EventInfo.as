package api.events.data
{
   import com.ax3.fishao.core.ISerializable;
   import com.ax3.fishao.debug.Debug;
   import com.ax3.utils.timer.IUpdate;
   import com.ax3.utils.timer.UpdateGroup;
   import com.ax3.utils.timer.UpdateManager;
   import com.brokenfunction.json.decodeJson;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class EventInfo implements ISerializable, IUpdate
   {
       
      
      private var _id:int;
      
      private var _type:String;
      
      private var _timeLeft:int;
      
      private var _duration:uint;
      
      private var _rewardFishcoins:uint;
      
      private var _rewardFishbucks:uint;
      
      private var _rewards:Dictionary;
      
      private var _isShown:Boolean;
      
      private var _additionalInfo:Object;
      
      private var _timeLeftOnInit:int;
      
      private var _timeOnInit:int;
      
      public function EventInfo()
      {
         super();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get timeLeft() : int
      {
         return this._timeLeft;
      }
      
      public function get duration() : uint
      {
         return this._duration;
      }
      
      public function get rewardFishcoins() : uint
      {
         return this._rewardFishcoins;
      }
      
      public function get rewardFishbucks() : uint
      {
         return this._rewardFishbucks;
      }
      
      public function get isShown() : Boolean
      {
         return this._isShown;
      }
      
      public function get additionalInfo() : Object
      {
         return this._additionalInfo;
      }
      
      public function get timeStart() : int
      {
         var date:Date = new Date();
         var timestampCurrent:int = int(date.time / 1000);
         return timestampCurrent + this._timeLeft;
      }
      
      public function onEventShown() : void
      {
         Debug.assert(!this._isShown);
         this._isShown = true;
      }
      
      public function onEventInit() : void
      {
         this.timerStart();
      }
      
      public function update(timerMS:uint, timeLeftMS:uint) : void
      {
         var timePassed:int = int((timerMS - this._timeOnInit) / 1000);
         this._timeLeft = this._timeLeftOnInit - timePassed;
      }
      
      private function timerStart() : void
      {
         this.tryCleanupTimer();
         UpdateManager.getInstance().getGroup(UpdateGroup.TIMER_200).add(this);
      }
      
      private function tryCleanupTimer() : void
      {
         UpdateManager.getInstance().getGroup(UpdateGroup.TIMER_200).remove(this);
      }
      
      public function getPositionRewardAmount(position:int) : int
      {
         return int(this._rewards[position + 1]) || 0;
      }
      
      public function serialize() : Object
      {
         Debug.assert(false);
         return null;
      }
      
      public function deserialize(data:Object) : void
      {
         var rewardData:Object = null;
         var position:int = 0;
         var reward:int = 0;
         this._id = Debug.assertProperty(data,"id");
         this._timeLeftOnInit = this._timeLeft = Debug.assertProperty(data,"time_left");
         this._timeOnInit = getTimer();
         this._type = Debug.assertProperty(data,"type");
         this._duration = Debug.assertProperty(data,"duration");
         this._rewardFishcoins = Debug.assertProperty(data,"reward_fishcoins");
         this._rewardFishbucks = Debug.assertProperty(data,"reward_fishbucks");
         this._rewards = new Dictionary(true);
         var rewardsDistribution:String = String(Debug.assertProperty(data,"reward_distribution"));
         var rewardsData:Array = decodeJson(rewardsDistribution) as Array;
         for each(rewardData in rewardsData)
         {
            position = int(Debug.assertProperty(rewardData,"position"));
            reward = int(Debug.assertProperty(rewardData,"reward"));
            this._rewards[position] = reward;
         }
         this._isShown = Debug.assertProperty(data,"is_shown");
         this._additionalInfo = Debug.getPropertyOrDefault(data,"additional_info",null);
      }
   }
}
