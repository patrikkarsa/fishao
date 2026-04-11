package api.miniGameBob.collect
{
   import com.ax3.geom.GraphPoint;
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestMiniGameBobCollect extends ClientRequest
   {
       
      
      public var x:int;
      
      public var y:int;
      
      public function RequestMiniGameBobCollect(position:GraphPoint)
      {
         super();
         this.x = position.x;
         this.y = position.y;
      }
   }
}
