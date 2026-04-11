package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="PlingWindow")]
   public dynamic class PlingWindow extends MovieClip
   {
       
      
      public var bg:MovieClip;
      
      public var closeButton:MovieClip;
      
      public var messageField:TextField;
      
      public function PlingWindow()
      {
         super();
      }
   }
}
