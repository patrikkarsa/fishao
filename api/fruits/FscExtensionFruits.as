package api.fruits
{
   import api.fruits.crush.RequestFruitsCrush;
   import com.ax3.jss.ext.BaseFscExtension;
   
   public class FscExtensionFruits extends BaseFscExtension
   {
       
      
      public function FscExtensionFruits()
      {
         super();
      }
      
      public function crushFruits(items:Array, callback:Function = null) : void
      {
         var request:RequestFruitsCrush = new RequestFruitsCrush();
         request.items = JSON.stringify(items);
         _connection.send(request,callback);
      }
   }
}
