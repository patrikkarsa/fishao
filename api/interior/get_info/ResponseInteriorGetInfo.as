package api.interior.get_info
{
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseInteriorGetInfo extends ServerResp
   {
       
      
      private var _interiorItems:Array;
      
      private var _isDecorationShop:Boolean;
      
      public function ResponseInteriorGetInfo()
      {
         super();
      }
      
      public function get interiorItems() : Array
      {
         return this._interiorItems;
      }
      
      public function get isDecorationShop() : Boolean
      {
         return this._isDecorationShop;
      }
      
      public function set interior_json(value:String) : void
      {
         this._interiorItems = decodeJson(value) as Array;
      }
      
      public function set is_decoration_shop(value:Boolean) : void
      {
         this._isDecorationShop = value;
      }
   }
}
