package api.clubs.page.goals
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseClubsGetPageGoals extends ServerResp
   {
       
      
      private var _completedGoalsCount:int;
      
      private var _uncompletedGoals:Array;
      
      public function ResponseClubsGetPageGoals()
      {
         super();
      }
      
      public function get completedGoalsCount() : int
      {
         return this._completedGoalsCount;
      }
      
      public function get uncompletedGoals() : Array
      {
         return this._uncompletedGoals;
      }
      
      public function set uncompleted_goals(value:String) : void
      {
         this._uncompletedGoals = decodeJson(value);
      }
      
      public function set completed_goals_count(value:int) : void
      {
         this._completedGoalsCount = value;
      }
   }
}
