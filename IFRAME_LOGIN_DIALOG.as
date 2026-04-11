package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="IFRAME_LOGIN_DIALOG")]
   public dynamic class IFRAME_LOGIN_DIALOG extends MovieClip
   {
       
      
      public var loginPassField:TextField;
      
      public var loginPassLabel:TextField;
      
      public var dialogBg:MovieClip;
      
      public var loginUsernameLabel:TextField;
      
      public var loginTitle:TextField;
      
      public var loginFbButton:MovieClip;
      
      public var loginForgotPassLabel:TextField;
      
      public var closeButton:MovieClip;
      
      public var loginButton:MovieClip;
      
      public var loginUsernameField:TextField;
      
      public var loginElementBg:MovieClip;
      
      public function IFRAME_LOGIN_DIALOG()
      {
         super();
      }
   }
}
