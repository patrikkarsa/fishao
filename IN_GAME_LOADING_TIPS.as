package
{
   import assets.common.LoaderTipsContainer;
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="IN_GAME_LOADING_TIPS")]
   public dynamic class IN_GAME_LOADING_TIPS extends MovieClip
   {
       
      
      public var background:MovieClip;
      
      public var dialogBaloon:MovieClip;
      
      public var progressBar:MovieClip;
      
      public var tipsImageContainer:LoaderTipsContainer;
      
      public function IN_GAME_LOADING_TIPS()
      {
         super();
      }
   }
}
