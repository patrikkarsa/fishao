package api.sales
{
   import api.sales.init.RequestSalesInit;
   import com.ax3.jss.ext.BaseFscExtension;
   
   public class FscExtensionSales extends BaseFscExtension
   {
       
      
      public function FscExtensionSales()
      {
         super();
      }
      
      public function getDataInit(callback:Function = null) : void
      {
         var request:RequestSalesInit = new RequestSalesInit();
         _connection.send(request,callback);
      }
   }
}
