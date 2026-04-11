package assets.common
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.WaterCircles1")]
   public dynamic class WaterCircles1 extends MovieClip
   {
       
      
      public function WaterCircles1()
      {
         super();
         addFrameScript(23,this.frame24);
      }
      
      internal function frame24() : *
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}
