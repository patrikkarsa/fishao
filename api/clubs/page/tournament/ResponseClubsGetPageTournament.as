package api.clubs.page.tournament
{
   import com.ax3.fishao.debug.Debug;
   import com.ax3.fishao.utils.UtilsObject;
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseClubsGetPageTournament extends ServerResp
   {
       
      
      private var _type:String;
      
      private var _state:String;
      
      private var _timeLeftChangeState:int;
      
      private var _clubsInGroup:int;
      
      private var _clubsData:Object;
      
      private var _tournamentData:Object;
      
      private var _tournamentsPlayed:int;
      
      private var _data:Array;
      
      public function ResponseClubsGetPageTournament()
      {
         super();
         this._clubsData = {};
         this._tournamentData = {};
         this._data = [];
      }
      
      public function get data() : Array
      {
         return this._data;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get state() : String
      {
         return this._state;
      }
      
      public function get timeLeftChangeState() : int
      {
         return this._timeLeftChangeState;
      }
      
      public function get clubsInGroup() : int
      {
         return this._clubsInGroup;
      }
      
      public function get tournaments_played() : int
      {
         return this._tournamentsPlayed;
      }
      
      public function set state(value:String) : void
      {
         this._state = value;
      }
      
      public function set time_left_change_state(value:int) : void
      {
         this._timeLeftChangeState = value;
      }
      
      public function set clubs_data(value:String) : void
      {
         var data:Object = null;
         var key:String = null;
         if(value == null)
         {
            return;
         }
         var clubsDataList:Array = decodeJson(value);
         for each(data in clubsDataList)
         {
            key = String(Debug.assertProperty(data,"id").toString());
            this._clubsData[key] = data;
         }
      }
      
      public function set tournament_data(value:String) : void
      {
         var data:Object = null;
         var key:String = null;
         if(value == null)
         {
            return;
         }
         var tournamentDataList:Array = decodeJson(value);
         for each(data in tournamentDataList)
         {
            key = String(Debug.assertProperty(data,"club_id").toString());
            this._tournamentData[key] = data;
         }
      }
      
      public function set tournaments_played(value:int) : void
      {
         this._tournamentsPlayed = value;
      }
      
      public function set clubs_in_group(value:int) : void
      {
         this._clubsInGroup = value;
      }
      
      public function set type(value:String) : void
      {
         this._type = value;
      }
      
      public function mergeData() : void
      {
         var key:String = null;
         var tournamentData:Object = null;
         var clubData:Object = null;
         var mergedData:Object = null;
         for(key in this._tournamentData)
         {
            tournamentData = this._tournamentData[key];
            clubData = this._clubsData[key];
            mergedData = UtilsObject.mergeObjects(tournamentData,clubData);
            this._data.push(mergedData);
         }
         this._data.sortOn("position",Array.NUMERIC);
      }
   }
}
