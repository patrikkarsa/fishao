package assets.common
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.LoaderTipsContainer")]
   public dynamic class LoaderTipsContainer extends MovieClip
   {
       
      
      public function LoaderTipsContainer()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}
