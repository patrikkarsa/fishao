package api.clubs.init
{
   import api.clubs.base.ResponseWithClubInfo;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseClubsInit extends ResponseWithClubInfo
   {
       
      
      private var _levelsData:Array;
      
      private var _createCost:int;
      
      public function ResponseClubsInit()
      {
         super();
         this._levelsData = [];
      }
      
      public function get levelsData() : Array
      {
         return this._levelsData;
      }
      
      public function get createCost() : int
      {
         return this._createCost;
      }
      
      public function set levels_data(value:String) : void
      {
         this._levelsData = decodeJson(value);
      }
      
      public function set create_cost(value:int) : void
      {
         this._createCost = value;
      }
   }
}
