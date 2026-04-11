package api.clubs.create
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestClubsCreate extends ClientRequest
   {
       
      
      public var requirement_level:int;
      
      public var type:String;
      
      public var emblem:int;
      
      public var name:String;
      
      public var description:String;
      
      public function RequestClubsCreate()
      {
         super();
      }
   }
}
