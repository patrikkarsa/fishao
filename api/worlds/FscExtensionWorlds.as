package api.worlds
{
   import api.base.FscExtensionBase;
   import api.worlds.init.RequestWorldsInit;
   import com.ax3.jss.FscConnection;
   import com.ax3.jss.model.IFscModel;
   import flash.events.IEventDispatcher;
   
   public class FscExtensionWorlds extends FscExtensionBase
   {
       
      
      public function FscExtensionWorlds()
      {
         super();
      }
      
      override public function init(dispatcher:IEventDispatcher, connection:FscConnection, fscModel:IFscModel) : void
      {
         super.init(dispatcher,connection,fscModel);
      }
      
      override public function loadInitData(callback:Function) : void
      {
         _connection.send(new RequestWorldsInit(),callback);
      }
   }
}
