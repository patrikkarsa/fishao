package api.moneyTree.init
{
   import api.improvable.ResponseImprovable;
   import api.moneyTree.data.MoneyTreeLevelInfo;
   
   public class ResponseMoneyTreeInit extends ResponseImprovable
   {
       
      
      private var _timeToNextGenerate:int;
      
      private var _fishcoinsLeft:int;
      
      private var _fishbucksLeft:int;
      
      public function ResponseMoneyTreeInit()
      {
         super();
      }
      
      public function get timeToNextGenerate() : int
      {
         return this._timeToNextGenerate;
      }
      
      public function set timeToNextGenerate(value:int) : void
      {
         this._timeToNextGenerate = value;
      }
      
      public function get fishcoinsLeft() : int
      {
         return this._fishcoinsLeft;
      }
      
      public function set fishcoinsLeft(value:int) : void
      {
         this._fishcoinsLeft = value;
      }
      
      public function get fishbucksLeft() : int
      {
         return this._fishbucksLeft;
      }
      
      public function set fishbucksLeft(value:int) : void
      {
         this._fishbucksLeft = value;
      }
      
      override protected function get levelInfoClass() : Class
      {
         return MoneyTreeLevelInfo;
      }
   }
}
