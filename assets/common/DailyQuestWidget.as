package assets.common
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.DailyQuestWidget")]
   public dynamic class DailyQuestWidget extends MovieClip
   {
       
      
      public var tooltip:MovieClip;
      
      public function DailyQuestWidget()
      {
         super();
      }
   }
}
