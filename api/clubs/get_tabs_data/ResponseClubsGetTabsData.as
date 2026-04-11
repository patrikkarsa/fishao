package api.clubs.get_tabs_data
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseClubsGetTabsData extends ServerResp
   {
       
      
      private var _tabsData:Object;
      
      public function ResponseClubsGetTabsData()
      {
         super();
         this._tabsData = {};
      }
      
      public function get tabsData() : Object
      {
         return this._tabsData;
      }
      
      public function set tabs_data(value:String) : void
      {
         this._tabsData = decodeJson(value);
      }
   }
}
