package assets.common
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.MissionsWidget")]
   public dynamic class MissionsWidget extends MovieClip
   {
       
      
      public var notifierAnimation:MovieClip;
      
      public var tooltip:MovieClip;
      
      public function MissionsWidget()
      {
         super();
      }
   }
}
