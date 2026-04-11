package api.miniGameBob.start
{
   import com.ax3.jss.requests.server.ServerResp;
   
   public class ResponseMiniGameBobStart extends ServerResp
   {
       
      
      public var timeLeftSec:int;
      
      public var positions:String;
      
      public function ResponseMiniGameBobStart()
      {
         super();
      }
      
      public function getPositions() : Object
      {
         return JSON.parse(this.positions);
      }
   }
}
