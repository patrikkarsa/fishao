package api.npc.talk
{
   import com.ax3.jss.requests.server.ServerResp;
   
   public class ResponseNpcTalk extends ServerResp
   {
       
      
      public var name:String;
      
      public var message:String;
      
      public var step:int;
      
      public var params:String;
      
      public function ResponseNpcTalk()
      {
         super();
      }
   }
}
