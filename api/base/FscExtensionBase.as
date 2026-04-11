package api.base
{
   import avmplus.getQualifiedClassName;
   import com.ax3.jss.ext.BaseFscExtension;
   import com.junkbyte.console.Cc;
   
   public class FscExtensionBase extends BaseFscExtension
   {
       
      
      public function FscExtensionBase()
      {
         super();
      }
      
      public function loadInitData(callback:Function) : void
      {
         Cc.warn(getQualifiedClassName(this) + " do not override loadInitData. Simulate response for this extension.");
         if(callback != null)
         {
            callback(null);
         }
      }
   }
}
