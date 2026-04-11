package api.improvable
{
   import com.ax3.fishao.core.ISerializable;
   import com.ax3.fishao.debug.Debug;
   
   public class ImprovableLevelInfo implements ISerializable
   {
       
      
      private var _number:uint;
      
      private var _timeUpgrade:uint;
      
      private var _priceUpgrade:uint;
      
      public function ImprovableLevelInfo()
      {
         super();
      }
      
      public function get number() : uint
      {
         return this._number;
      }
      
      public function get timeUpgrade() : uint
      {
         return this._timeUpgrade;
      }
      
      public function get priceUpgrade() : uint
      {
         return this._priceUpgrade;
      }
      
      public function serialize() : Object
      {
         return null;
      }
      
      public function deserialize(data:Object) : void
      {
         this._number = Debug.assertProperty(data,"number");
         this._timeUpgrade = Debug.assertProperty(data,"time_upgrade");
         this._priceUpgrade = Debug.assertProperty(data,"price_upgrade");
      }
   }
}
