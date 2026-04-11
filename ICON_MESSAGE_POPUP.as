package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="ICON_MESSAGE_POPUP")]
   public dynamic class ICON_MESSAGE_POPUP extends MovieClip
   {
       
      
      public var closeButton:MovieClip;
      
      public var icon:MovieClip;
      
      public var messageField:TextField;
      
      public function ICON_MESSAGE_POPUP()
      {
         super();
      }
   }
}
