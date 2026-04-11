package api.events.data
{
   import com.ax3.fishao.core.ISerializable;
   import com.ax3.fishao.debug.Debug;
   import com.brokenfunction.json.decodeJson;
   
   public class EventMemberInfo implements ISerializable
   {
       
      
      private var _position:uint;
      
      private var _login:String;
      
      private var _criteria:Number;
      
      private var _additionalInfo:Object;
      
      private var _rewardFishcoins:uint;
      
      private var _rewardFishbucks:uint;
      
      public function EventMemberInfo()
      {
         super();
      }
      
      public function get position() : uint
      {
         return this._position;
      }
      
      public function get login() : String
      {
         return this._login;
      }
      
      public function get criteria() : uint
      {
         return this._criteria;
      }
      
      public function get rewardFishcoins() : uint
      {
         return this._rewardFishcoins;
      }
      
      public function set rewardFishcoins(value:uint) : void
      {
         this._rewardFishcoins = value;
      }
      
      public function get rewardFishbucks() : uint
      {
         return this._rewardFishbucks;
      }
      
      public function set rewardFishbucks(value:uint) : void
      {
         this._rewardFishbucks = value;
      }
      
      public function getAdditionalProperty(key:String) : String
      {
         var propertyValue:Object = {};
         if(this._additionalInfo != null && this._additionalInfo.hasOwnProperty(key))
         {
            propertyValue = this._additionalInfo[key];
         }
         else
         {
            propertyValue = "";
         }
         return propertyValue.toString();
      }
      
      public function serialize() : Object
      {
         return null;
      }
      
      public function deserialize(data:Object) : void
      {
         this._position = Debug.assertProperty(data,"position");
         this._login = Debug.assertProperty(data,"login");
         this._criteria = Debug.assertProperty(data,"criteria");
         var additionalInfo:String = String(Debug.getPropertyOrDefault(data,"additional_info",null));
         if(additionalInfo != null)
         {
            this._additionalInfo = decodeJson(additionalInfo);
         }
      }
   }
}
