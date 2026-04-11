package api.announcements.init
{
   import com.ax3.fishao.debug.Debug;
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   
   public class ResponseAnnouncements extends ServerResp
   {
       
      
      private var _list:Array;
      
      public function ResponseAnnouncements()
      {
         super();
         this._list = [];
      }
      
      public function get list() : Array
      {
         return this._list;
      }
      
      public function set data(value:String) : void
      {
         var dataItem:Object = null;
         var item:AnnouncementInfo = null;
         var dataObj:Object = decodeJson(value);
         var dataList:Array = Debug.assertProperty(dataObj,"list",Array);
         for each(dataItem in dataList)
         {
            item = new AnnouncementInfo();
            item.deserialize(dataItem);
            this._list.push(item);
         }
      }
   }
}
