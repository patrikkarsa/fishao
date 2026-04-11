package api.moneyTree
{
   import api.improvable.FscExtensionImprovable;
   import api.moneyTree.init.RequestMoneyTreeInit;
   import api.moneyTree.rewardCollect.RequestMoneyTreeRewardCollect;
   import api.moneyTree.rewardGenerate.RequestMoneyTreeRewardGenerate;
   import api.moneyTree.upgradeByTime.RequestMoneyTreeUpgradeLevelByTime;
   import api.moneyTree.upgradeLevel.RequestMoneyTreeUpgradeLevel;
   import api.moneyTree.upgradeLevelEarly.RequestMoneyTreeUpgradeLevelEarly;
   
   public class FscExtensionMoneyTree extends FscExtensionImprovable
   {
       
      
      public function FscExtensionMoneyTree()
      {
         super();
      }
      
      public function collectReward(fishbucksCount:uint, fishcoinsCount:uint, callback:Function) : void
      {
         var request:RequestMoneyTreeRewardCollect = new RequestMoneyTreeRewardCollect();
         request.fishbucksCount = fishbucksCount;
         request.fishcoinsCount = fishcoinsCount;
         _connection.send(request,callback);
      }
      
      public function generateReward(callback:Function) : void
      {
         _connection.send(new RequestMoneyTreeRewardGenerate(),callback);
      }
      
      override public function loadInitData(callback:Function) : void
      {
         _connection.send(new RequestMoneyTreeInit(),callback);
      }
      
      override public function upgradeLevel(callback:Function) : void
      {
         _connection.send(new RequestMoneyTreeUpgradeLevel(),callback);
      }
      
      override public function upgradeLevelEarly(callback:Function) : void
      {
         _connection.send(new RequestMoneyTreeUpgradeLevelEarly(),callback);
      }
      
      override public function upgradeLevelByTime(callback:Function) : void
      {
         _connection.send(new RequestMoneyTreeUpgradeLevelByTime(),callback);
      }
   }
}
