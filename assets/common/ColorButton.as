package assets.common
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.ColorButton")]
   public dynamic class ColorButton extends MovieClip
   {
       
      
      public var bg:MovieClip;
      
      public var color:MovieClip;
      
      public function ColorButton()
      {
         super();
      }
   }
}
