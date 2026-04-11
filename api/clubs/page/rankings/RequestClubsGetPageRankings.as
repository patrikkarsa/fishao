package api.clubs.page.rankings
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestClubsGetPageRankings extends ClientRequest
   {
       
      
      public var ranking_type:String;
      
      public function RequestClubsGetPageRankings()
      {
         super();
      }
   }
}
