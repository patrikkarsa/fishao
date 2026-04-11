package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="gViewCountdown")]
   public dynamic class gViewCountdown extends MovieClip
   {
       
      
      public var buttonMaximize:MovieClip;
      
      public var buttonMinimize:MovieClip;
      
      public var labelDescription:TextField;
      
      public var labelTime:TextField;
      
      public var viewIcon:MovieClip;
      
      public var viewMaximized:MovieClip;
      
      public var viewMinimized:MovieClip;
      
      public var viewProgress:MovieClip;
      
      public function gViewCountdown()
      {
         super();
      }
   }
}
