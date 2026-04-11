package assets.common
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.FbLoginDialogWithBetaKey")]
   public dynamic class FbLoginDialogWithBetaKey extends MovieClip
   {
       
      
      public var regBetaKeyField:TextField;
      
      public var regBetaKeyLabel:TextField;
      
      public var regCondLabel:TextField;
      
      public var regButton:MovieClip;
      
      public var regTitle:TextField;
      
      public var regUsernameField:TextField;
      
      public var regUsernameLabel:TextField;
      
      public var regCondCheck:MovieClip;
      
      public function FbLoginDialogWithBetaKey()
      {
         super();
      }
   }
}
