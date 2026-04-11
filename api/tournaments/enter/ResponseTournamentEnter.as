package api.tournaments.enter
{
   import com.ax3.jss.requests.server.ServerResp;
   
   public class ResponseTournamentEnter extends ServerResp
   {
       
      
      public var state:String;
      
      public var timeLeftToSignUp:int;
      
      public var timeLeftToStart:int;
      
      public var timeLeftToEnd:int;
      
      public var duration:int;
      
      public function ResponseTournamentEnter()
      {
         super();
      }
   }
}
