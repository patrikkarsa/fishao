package api.locations
{
   import api.base.FscExtensionBase;
   import api.locations.change_position.RequestLocationChangePosition;
   
   public class FscExtensionLocation extends FscExtensionBase
   {
       
      
      public function FscExtensionLocation()
      {
         super();
      }
      
      public function changePosition(positionNew:String, callback:Function = null) : void
      {
         var request:RequestLocationChangePosition = new RequestLocationChangePosition();
         request.position_new = positionNew;
         _connection.send(request,callback);
      }
   }
}
