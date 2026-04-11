package api.base
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseWithData extends ServerResp
   {
       
      
      public var data:Object;
      
      public function ResponseWithData()
      {
         super();
         this.data = {};
      }
      
      public function hasDataProperty(propertyName:String) : Boolean
      {
         return this.data != null && this.data.hasOwnProperty(propertyName);
      }
      
      public function getJsonData(propertyName:String) : Object
      {
         var result:Object = null;
         if(this.data[propertyName] != null)
         {
            result = decodeJson(this.data[propertyName]);
         }
         return result;
      }
      
      public function getArrayData(propertyName:String) : Array
      {
         var data:* = this.data[propertyName];
         if(data is String)
         {
            data = decodeJson(data);
         }
         return data;
      }
      
      public function getStringData(propertyName:String) : String
      {
         return this.data[propertyName];
      }
      
      public function getIntData(propertyName:String) : int
      {
         var value:* = this.data[propertyName];
         if(value is String)
         {
            return parseInt(value);
         }
         if(value is Number || value is int)
         {
            return value;
         }
         return -1;
      }
   }
}
