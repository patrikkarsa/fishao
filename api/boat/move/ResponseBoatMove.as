package api.boat.move
{
   import com.ax3.jss.requests.server.ServerResp;
   
   public class ResponseBoatMove extends ServerResp
   {
       
      
      public var boatId:int;
      
      public var x:int;
      
      public var y:int;
      
      public var rotation:int;
      
      public function ResponseBoatMove()
      {
         super();
      }
   }
}
