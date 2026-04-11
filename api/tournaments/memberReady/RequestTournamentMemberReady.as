package api.tournaments.memberReady
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestTournamentMemberReady extends ClientRequest
   {
       
      
      public var tournament_id:String;
      
      public function RequestTournamentMemberReady()
      {
         super();
      }
   }
}
