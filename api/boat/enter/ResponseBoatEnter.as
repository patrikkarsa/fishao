package api.boat.enter
{
   import com.ax3.jss.requests.server.ServerResp;
   
   public class ResponseBoatEnter extends ServerResp
   {
       
      
      public var boatId:int;
      
      public var login:String;
      
      public function ResponseBoatEnter()
      {
         super();
      }
   }
}
