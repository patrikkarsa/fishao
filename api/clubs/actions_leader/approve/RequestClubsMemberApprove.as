package api.clubs.actions_leader.approve
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestClubsMemberApprove extends ClientRequest
   {
       
      
      public var login:String;
      
      public function RequestClubsMemberApprove()
      {
         super();
      }
   }
}
