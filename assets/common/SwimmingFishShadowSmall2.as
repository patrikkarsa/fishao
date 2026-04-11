package assets.common
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.SwimmingFishShadowSmall2")]
   public dynamic class SwimmingFishShadowSmall2 extends MovieClip
   {
       
      
      public function SwimmingFishShadowSmall2()
      {
         super();
         addFrameScript(149,this.frame150);
      }
      
      internal function frame150() : *
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}
