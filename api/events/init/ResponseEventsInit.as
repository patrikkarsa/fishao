package api.events.init
{
   import api.events.data.EventInfo;
   import com.ax3.fishao.debug.Debug;
   import com.ax3.jss.requests.server.ServerResp;
   import com.brokenfunction.json.decodeJson;
   import flash.utils.Dictionary;
   
   public class ResponseEventsInit extends ServerResp
   {
       
      
      private var _events:Array;
      
      private var _coefficients:Dictionary;
      
      public function ResponseEventsInit()
      {
         super();
         this._events = [];
         this._coefficients = new Dictionary(true);
      }
      
      public function set data(value:String) : void
      {
         var dataItem:Object = null;
         var item:EventInfo = null;
         var dataList:Array = decodeJson(value) as Array;
         for each(dataItem in dataList)
         {
            item = new EventInfo();
            item.deserialize(dataItem);
            this._events.push(item);
         }
      }
      
      public function get events() : Array
      {
         return this._events;
      }
      
      public function set data_coefficients(value:String) : void
      {
         var coefficientData:Object = null;
         var position:int = 0;
         var rewardPercent:Number = NaN;
         var coefficientsData:Array = decodeJson(value) as Array;
         for each(coefficientData in coefficientsData)
         {
            position = int(Debug.assertProperty(coefficientData,"position"));
            rewardPercent = Number(Debug.assertProperty(coefficientData,"reward_percent"));
            this._coefficients[position] = rewardPercent;
         }
      }
   }
}
