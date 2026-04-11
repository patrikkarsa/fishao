package api.clubs.actions_member.join
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestClubsJoin extends ClientRequest
   {
       
      
      public var club_id:int;
      
      public function RequestClubsJoin()
      {
         super();
      }
   }
}
