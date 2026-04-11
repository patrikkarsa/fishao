package api.clubs.update_info
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestClubsUpdateInfo extends ClientRequest
   {
       
      
      public var emblem_id:int;
      
      public var description:String;
      
      public var club_type:String;
      
      public var required_level:int;
      
      public function RequestClubsUpdateInfo()
      {
         super();
      }
   }
}
