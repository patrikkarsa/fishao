package assets.common
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.WaterCircles3")]
   public dynamic class WaterCircles3 extends MovieClip
   {
       
      
      public function WaterCircles3()
      {
         super();
         addFrameScript(38,this.frame39);
      }
      
      internal function frame39() : *
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}
