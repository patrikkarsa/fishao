package asset.common
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="asset.common.ReloadDialogAsset")]
   public dynamic class ReloadDialogAsset extends MovieClip
   {
       
      
      public var message:TextField;
      
      public var reloadButton:MovieClip;
      
      public function ReloadDialogAsset()
      {
         super();
      }
   }
}
