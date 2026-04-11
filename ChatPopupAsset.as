package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="ChatPopupAsset")]
   public dynamic class ChatPopupAsset extends MovieClip
   {
       
      
      public var background:MovieClip;
      
      public var txt:TextField;
      
      public function ChatPopupAsset()
      {
         super();
      }
   }
}
