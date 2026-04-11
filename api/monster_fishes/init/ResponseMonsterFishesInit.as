package api.monster_fishes.init
{
   import com.ax3.fishao.debug.Debug;
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseMonsterFishesInit extends ServerResp
   {
       
      
      private var _fishesInfo:Array;
      
      private var _fishesProgress:Array;
      
      public function ResponseMonsterFishesInit()
      {
         super();
      }
      
      public function set data(value:String) : void
      {
         var dataObject:Object = decodeJson(value);
         var fishesInfoData:Object = Debug.assertProperty(dataObject,"info");
         this._fishesInfo = decodeJson(fishesInfoData) as Array;
         var fishesProgressData:Object = Debug.assertProperty(dataObject,"progress");
         this._fishesProgress = decodeJson(fishesProgressData) as Array;
      }
      
      public function get fishesInfo() : Array
      {
         return this._fishesInfo;
      }
      
      public function get fishesProgress() : Array
      {
         return this._fishesProgress;
      }
   }
}
