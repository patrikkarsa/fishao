package api.tournaments.enter
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestTournamentEnter extends ClientRequest
   {
       
      
      public var tournament_id:String;
      
      public function RequestTournamentEnter()
      {
         super();
      }
   }
}
