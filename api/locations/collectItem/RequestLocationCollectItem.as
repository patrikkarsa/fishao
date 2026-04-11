package api.locations.collectItem
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestLocationCollectItem extends ClientRequest
   {
       
      
      public var type:int;
      
      public var id:int;
      
      public var x:int;
      
      public var y:int;
      
      public function RequestLocationCollectItem()
      {
         super();
      }
   }
}
