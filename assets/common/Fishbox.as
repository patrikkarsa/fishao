package assets.common
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.Fishbox")]
   public dynamic class Fishbox extends MovieClip
   {
       
      
      public function Fishbox()
      {
         super();
         addFrameScript(59,this.frame60);
      }
      
      internal function frame60() : *
      {
         gotoAndStop(1);
      }
   }
}
