package assets.common
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.ConnectionLostPopup")]
   public dynamic class ConnectionLostPopup extends MovieClip
   {
       
      
      public var closeButton:MovieClip;
      
      public var label:TextField;
      
      public var refreshButton:MovieClip;
      
      public function ConnectionLostPopup()
      {
         super();
      }
   }
}
