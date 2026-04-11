package assets.common
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.Fishbones")]
   public dynamic class Fishbones extends MovieClip
   {
       
      
      public function Fishbones()
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
