package assets.common
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.PlingHistoryWin")]
   public dynamic class PlingHistoryWin extends MovieClip
   {
       
      
      public var actionHeader:TextField;
      
      public var closeButton:MovieClip;
      
      public var plingHeader:TextField;
      
      public var title:TextField;
      
      public var view:MovieClip;
      
      public function PlingHistoryWin()
      {
         super();
      }
   }
}
