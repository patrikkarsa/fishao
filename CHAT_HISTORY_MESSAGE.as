package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="CHAT_HISTORY_MESSAGE")]
   public dynamic class CHAT_HISTORY_MESSAGE extends MovieClip
   {
       
      
      public var separatorLine:MovieClip;
      
      public var userMessage:TextField;
      
      public var username:TextField;
      
      public function CHAT_HISTORY_MESSAGE()
      {
         super();
      }
   }
}
