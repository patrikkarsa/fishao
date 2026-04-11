package api.clubs.actions_leader.kick
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestClubsMemberKick extends ClientRequest
   {
       
      
      public var login:String;
      
      public function RequestClubsMemberKick()
      {
         super();
      }
   }
}
