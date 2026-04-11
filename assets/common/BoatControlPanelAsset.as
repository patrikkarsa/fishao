package assets.common
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.BoatControlPanelAsset")]
   public dynamic class BoatControlPanelAsset extends MovieClip
   {
       
      
      public var hit:MovieClip;
      
      public var switcher_1:MovieClip;
      
      public var switcher_2:MovieClip;
      
      public var title:TextField;
      
      public function BoatControlPanelAsset()
      {
         super();
      }
   }
}
