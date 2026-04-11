package api.interior.save
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestInteriorSave extends ClientRequest
   {
       
      
      public var interior_json:String;
      
      public function RequestInteriorSave()
      {
         super();
      }
   }
}
