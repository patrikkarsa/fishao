package api.quests.init
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseQuestsInit extends ServerResp
   {
       
      
      private var _questsMap:Object;
      
      public function ResponseQuestsInit()
      {
         super();
         this._questsMap = {};
      }
      
      public function get questsMap() : Object
      {
         return this._questsMap;
      }
      
      public function set questsData(value:String) : void
      {
         this._questsMap = decodeJson(value);
      }
   }
}
