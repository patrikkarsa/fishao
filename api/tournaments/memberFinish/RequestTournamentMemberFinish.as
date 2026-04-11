package api.tournaments.memberFinish
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestTournamentMemberFinish extends ClientRequest
   {
       
      
      public var tournament_id:String;
      
      public function RequestTournamentMemberFinish()
      {
         super();
      }
   }
}
