package assets.common
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.FbLoginDialog")]
   public dynamic class FbLoginDialog extends MovieClip
   {
       
      
      public var regCondLabel:TextField;
      
      public var regButton:MovieClip;
      
      public var regTitle:TextField;
      
      public var regUsernameField:TextField;
      
      public var regUsernameLabel:TextField;
      
      public var regUsernameFieldBg:MovieClip;
      
      public var regCondCheck:MovieClip;
      
      public function FbLoginDialog()
      {
         super();
      }
   }
}
