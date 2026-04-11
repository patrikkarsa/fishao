package assets.common
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.WaterBubbles2")]
   public dynamic class WaterBubbles2 extends MovieClip
   {
       
      
      public function WaterBubbles2()
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
