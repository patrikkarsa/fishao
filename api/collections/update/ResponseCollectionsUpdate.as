package api.collections.update
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseCollectionsUpdate extends ServerResp
   {
       
      
      private var _collectionID:int;
      
      private var _collectionData:Object;
      
      public function ResponseCollectionsUpdate()
      {
         super();
      }
      
      public function get collectionID() : int
      {
         return this._collectionID;
      }
      
      public function get collectionData() : Object
      {
         return this._collectionData;
      }
      
      public function set collectionID(value:int) : void
      {
         this._collectionID = value;
      }
      
      public function set data(value:String) : void
      {
         this._collectionData = decodeJson(value);
      }
   }
}
