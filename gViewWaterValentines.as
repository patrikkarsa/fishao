package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="gViewWaterValentines")]
   public dynamic class gViewWaterValentines extends MovieClip
   {
       
      
      public function gViewWaterValentines()
      {
         super();
         addFrameScript(21,this.frame22);
      }
      
      internal function frame22() : *
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}
