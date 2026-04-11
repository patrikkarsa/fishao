package api.clubs.page.info
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestClubsGetPageInfo extends ClientRequest
   {
       
      
      public var club_id:int;
      
      public function RequestClubsGetPageInfo()
      {
         super();
      }
   }
}
