package api.furniture_factory.base
{
   import com.ax3.jss.requests.server.ServerResp;
   
   public class ResponseFurnitureFactoryBase extends ServerResp
   {
       
      
      public var skip_time_price_fishcoins:int;
      
      public var reward_time_left:int;
      
      public function ResponseFurnitureFactoryBase()
      {
         super();
      }
   }
}
