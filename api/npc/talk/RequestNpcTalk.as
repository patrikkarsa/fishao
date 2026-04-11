package api.npc.talk
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestNpcTalk extends ClientRequest
   {
       
      
      public var name:String;
      
      public var step:int;
      
      public var answer:String;
      
      public var x:int;
      
      public var y:int;
      
      public function RequestNpcTalk()
      {
         super();
      }
   }
}
