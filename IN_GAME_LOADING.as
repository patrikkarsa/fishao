package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="IN_GAME_LOADING")]
   public dynamic class IN_GAME_LOADING extends MovieClip
   {
       
      
      public var bubbles:MovieClip;
      
      public var label:TextField;
      
      public var progressBar:MovieClip;
      
      public function IN_GAME_LOADING()
      {
         super();
      }
   }
}
