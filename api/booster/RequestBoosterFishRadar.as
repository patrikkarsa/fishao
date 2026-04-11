package api.booster
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestBoosterFishRadar extends ClientRequest
   {
       
      
      public var fishRadarType:int;
      
      public function RequestBoosterFishRadar(sishRadarType:int)
      {
         super();
         this.fishRadarType = sishRadarType;
      }
   }
}
