package api.tutorial
{
   import api.base.FscExtensionBase;
   import api.tutorial.init.RequestTutorialInit;
   import api.tutorial.step_complete.RequestTutorialStepComplete;
   import com.ax3.jss.FscConnection;
   import com.ax3.jss.model.IFscModel;
   import flash.events.IEventDispatcher;
   
   public class FscExtensionTutorial extends FscExtensionBase
   {
       
      
      public function FscExtensionTutorial()
      {
         super();
      }
      
      override public function init(dispatcher:IEventDispatcher, connection:FscConnection, fscModel:IFscModel) : void
      {
         super.init(dispatcher,connection,fscModel);
      }
      
      override public function loadInitData(callback:Function) : void
      {
         _connection.send(new RequestTutorialInit(),callback);
      }
      
      public function saveStep(tutorialType:String, stepCurrent:int, callback:Function = null) : void
      {
         var request:RequestTutorialStepComplete = new RequestTutorialStepComplete();
         request.tutorial_type = tutorialType;
         request.step_current = stepCurrent;
         _connection.send(request,callback);
      }
   }
}
