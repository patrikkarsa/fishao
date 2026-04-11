package api.events.start
{
   import com.ax3.jss.requests.server.ServerResp;
   
   public class ResponseEventStart extends ServerResp
   {
       
      
      private var _eventID:String;
      
      private var _timeLeft:uint;
      
      public function ResponseEventStart()
      {
         super();
      }
      
      public function get eventID() : String
      {
         return this._eventID;
      }
      
      public function get timeLeft() : uint
      {
         return this._timeLeft;
      }
      
      public function set event_id(value:String) : void
      {
         this._eventID = value;
      }
      
      public function set time_left(value:uint) : void
      {
         this._timeLeft = value;
      }
   }
}
