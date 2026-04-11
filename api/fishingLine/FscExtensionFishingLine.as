package api.fishingLine
{
   import api.fishingLine.init.RequestFishingLineInit;
   import api.fishingLine.updateColor.RequestFishingLineUpdateColor;
   import api.fishingLine.upgradeByTime.RequestFishingLineUpgradeLevelByTime;
   import api.fishingLine.upgradeLevel.RequestFishingLineUpgradeLevel;
   import api.fishingLine.upgradeLevelEarly.RequestFishingLineUpgradeLevelEarly;
   import api.improvable.FscExtensionImprovable;
   
   public class FscExtensionFishingLine extends FscExtensionImprovable
   {
       
      
      public function FscExtensionFishingLine()
      {
         super();
      }
      
      public function updateFishingLineColor(callback:Function, color:String) : void
      {
         var request:RequestFishingLineUpdateColor = new RequestFishingLineUpdateColor();
         request.color = color;
         _connection.send(request,callback);
      }
      
      override public function loadInitData(callback:Function) : void
      {
         _connection.send(new RequestFishingLineInit(),callback);
      }
      
      override public function upgradeLevel(callback:Function) : void
      {
         _connection.send(new RequestFishingLineUpgradeLevel(),callback);
      }
      
      override public function upgradeLevelEarly(callback:Function) : void
      {
         _connection.send(new RequestFishingLineUpgradeLevelEarly(),callback);
      }
      
      override public function upgradeLevelByTime(callback:Function) : void
      {
         _connection.send(new RequestFishingLineUpgradeLevelByTime(),callback);
      }
   }
}
