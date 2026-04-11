package api.locations.change_position
{
   import com.ax3.jss.requests.server.ServerResp;
   
   public class ResponseLocationChangePosition extends ServerResp
   {
       
      
      public var login:String;
      
      public var position_new:String;
      
      public function ResponseLocationChangePosition()
      {
         super();
      }
   }
}
