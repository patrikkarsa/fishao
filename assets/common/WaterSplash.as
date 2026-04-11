package assets.common
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.WaterSplash")]
   public dynamic class WaterSplash extends MovieClip
   {
       
      
      public function WaterSplash()
      {
         super();
         addFrameScript(17,this.frame18);
      }
      
      internal function frame18() : *
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}
