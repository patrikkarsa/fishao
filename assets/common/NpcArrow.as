package assets.common
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.NpcArrow")]
   public dynamic class NpcArrow extends MovieClip
   {
       
      
      public function NpcArrow()
      {
         super();
         addFrameScript(20,this.frame21);
      }
      
      internal function frame21() : *
      {
         gotoAndPlay(1);
      }
   }
}
