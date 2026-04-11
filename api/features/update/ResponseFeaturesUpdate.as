package api.features.update
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseFeaturesUpdate extends ServerResp
   {
       
      
      private var _features:Array;
      
      public function ResponseFeaturesUpdate()
      {
         super();
      }
      
      public function get features() : Array
      {
         return this._features;
      }
      
      public function set featuresJson(value:String) : void
      {
         this._features = decodeJson(value) as Array;
      }
   }
}
