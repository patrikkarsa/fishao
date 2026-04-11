package api.moneyTree.data
{
   import api.improvable.ImprovableLevelInfo;
   import com.ax3.fishao.core.ISerializable;
   import com.ax3.fishao.debug.Debug;
   
   public class MoneyTreeLevelInfo extends ImprovableLevelInfo implements ISerializable
   {
       
      
      private var _fishbucksPerDay:uint;
      
      private var _fishcoinsPerDay:uint;
      
      public function MoneyTreeLevelInfo()
      {
         super();
      }
      
      public function get fishbucksPerDay() : uint
      {
         return this._fishbucksPerDay;
      }
      
      public function get fishcoinsPerDay() : uint
      {
         return this._fishcoinsPerDay;
      }
      
      override public function deserialize(data:Object) : void
      {
         super.deserialize(data);
         this._fishcoinsPerDay = Debug.assertProperty(data,"fishcoins_per_day");
         this._fishbucksPerDay = Debug.assertProperty(data,"fishbucks_per_day");
      }
   }
}
