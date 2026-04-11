package assets.common
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.WaterBubbles1")]
   public dynamic class WaterBubbles1 extends MovieClip
   {
       
      
      public function WaterBubbles1()
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
