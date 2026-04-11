package api.clubs.actions_leader.reject
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestClubsMemberReject extends ClientRequest
   {
       
      
      public var login:String;
      
      public function RequestClubsMemberReject()
      {
         super();
      }
   }
}
