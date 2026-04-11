package api.clubs.get_tabs_data
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestClubsGetTabsData extends ClientRequest
   {
       
      
      public var club_id:int;
      
      public function RequestClubsGetTabsData()
      {
         super();
      }
   }
}
