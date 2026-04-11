package api.tournaments
{
   import api.tournaments.canSignUp.RequestTournamentCanSignUp;
   import api.tournaments.enter.RequestTournamentEnter;
   import api.tournaments.getRelevant.RequestTournamentGetRelevant;
   import api.tournaments.memberFinish.RequestTournamentMemberFinish;
   import api.tournaments.memberReady.RequestTournamentMemberReady;
   import api.tournaments.sign_up.RequestTournamentSignUp;
   import com.ax3.jss.ext.BaseFscExtension;
   
   public class FscExtensionTournaments extends BaseFscExtension
   {
       
      
      public function FscExtensionTournaments()
      {
         super();
      }
      
      public function enterToLocationTournament(id:String, callback:Function) : void
      {
         var request:RequestTournamentEnter = new RequestTournamentEnter();
         request.tournament_id = id;
         _connection.send(request,callback);
      }
      
      public function signUpOnCurrent(callback:Function) : void
      {
         _connection.send(new RequestTournamentSignUp(),callback);
      }
      
      public function canSignUpOnCurrent(callback:Function) : void
      {
         _connection.send(new RequestTournamentCanSignUp(),callback);
      }
      
      public function sendReadyState(id:String, callback:Function) : void
      {
         var request:RequestTournamentMemberReady = new RequestTournamentMemberReady();
         request.tournament_id = id;
         _connection.send(request,callback);
      }
      
      public function getRelevantTournament(callback:Function) : void
      {
         _connection.send(new RequestTournamentGetRelevant(),callback);
      }
      
      public function sendTournamentFinish(id:String, callback:Function) : void
      {
         var request:RequestTournamentMemberFinish = new RequestTournamentMemberFinish();
         request.tournament_id = id;
         _connection.send(request,callback);
      }
   }
}
