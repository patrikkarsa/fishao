package api.improvable
{
   import com.ax3.fishao.debug.Debug;
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseImprovable extends ServerResp
   {
       
      
      private var _currentLevel:int;
      
      private var _timeToNextUpgrade:int;
      
      private var _levelsInfo:Array;
      
      public function ResponseImprovable()
      {
         super();
         this._levelsInfo = [];
      }
      
      public function get currentLevel() : int
      {
         return this._currentLevel;
      }
      
      public function set currentLevel(value:int) : void
      {
         this._currentLevel = value;
      }
      
      public function get timeToNextUpgrade() : int
      {
         return this._timeToNextUpgrade;
      }
      
      public function set timeToNextUpgrade(value:int) : void
      {
         this._timeToNextUpgrade = value;
      }
      
      public function get levelsInfo() : Array
      {
         return this._levelsInfo;
      }
      
      public function set levelsData(value:String) : void
      {
         var dataLevel:Object = null;
         var levelInfo:ImprovableLevelInfo = null;
         var dataObj:Object = decodeJson(value);
         Debug.assert(dataObj is Array);
         var dataLevels:Array = dataObj as Array;
         var levelInfoClass:Class = this.levelInfoClass;
         for each(dataLevel in dataLevels)
         {
            levelInfo = new levelInfoClass();
            levelInfo.deserialize(dataLevel);
            this._levelsInfo.push(levelInfo);
         }
      }
      
      protected function get levelInfoClass() : Class
      {
         Debug.assert(false,"Please override");
         return null;
      }
   }
}
