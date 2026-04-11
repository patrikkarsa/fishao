package assets.common
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.WaterCircles2")]
   public dynamic class WaterCircles2 extends MovieClip
   {
       
      
      public function WaterCircles2()
      {
         super();
         addFrameScript(26,this.frame27);
      }
      
      internal function frame27() : *
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}
