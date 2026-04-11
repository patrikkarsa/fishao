package api.worlds.init
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseWorldsInit extends ServerResp
   {
       
      
      private var _worldsList:Array;
      
      public function ResponseWorldsInit()
      {
         super();
         this._worldsList = [];
      }
      
      public function get worldsList() : Array
      {
         return this._worldsList;
      }
      
      public function set list(value:Object) : void
      {
         var worldIndex:String = null;
         var worldDataJson:String = null;
         var worldData:Object = null;
         this._worldsList = [];
         for(worldIndex in value)
         {
            worldDataJson = String(value[worldIndex]);
            worldData = decodeJson(worldDataJson);
            this._worldsList.push(worldData);
         }
      }
   }
}
