package api.clubs.base
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseWithClubInfo extends ServerResp
   {
       
      
      private var _clubInfo:Object;
      
      public function ResponseWithClubInfo()
      {
         super();
      }
      
      public function get clubInfo() : Object
      {
         return this._clubInfo;
      }
      
      public function set club_info(value:String) : void
      {
         if(value == null)
         {
            return;
         }
         this._clubInfo = decodeJson(value);
         this.tryInitMembers();
      }
      
      private function tryInitMembers() : void
      {
         if(this._clubInfo == null || this._clubInfo["members"] == null)
         {
            return;
         }
         var membersString:String = String(this._clubInfo["members"]);
         var members:Array = decodeJson(membersString);
         members.sortOn("level",Array.DESCENDING | Array.NUMERIC);
         this._clubInfo["members"] = members;
      }
   }
}
