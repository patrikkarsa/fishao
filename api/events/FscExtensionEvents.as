package api.events
{
   import api.base.FscExtensionBase;
   import api.events.data.EventInfo;
   import api.events.init.RequestEventsInit;
   import api.events.members.RequestEventMembers;
   import api.events.shown.RequestEventShown;
   
   public class FscExtensionEvents extends FscExtensionBase
   {
       
      
      public function FscExtensionEvents()
      {
         super();
      }
      
      public function onEventShown(event:EventInfo, callback:Function) : void
      {
         var request:RequestEventShown = new RequestEventShown();
         request.event_id = event.id;
         _connection.send(request,callback);
      }
      
      override public function loadInitData(callback:Function) : void
      {
         _connection.send(new RequestEventsInit(),callback);
      }
      
      public function updateMembers(callback:Function, offset:uint, length:uint) : void
      {
         var request:RequestEventMembers = new RequestEventMembers();
         request.offset = offset;
         request.length = length;
         _connection.send(request,callback);
      }
   }
}
