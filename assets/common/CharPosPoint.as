package assets.common
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.CharPosPoint")]
   public dynamic class CharPosPoint extends MovieClip
   {
       
      
      public var label:TextField;
      
      public function CharPosPoint()
      {
         super();
      }
   }
}
