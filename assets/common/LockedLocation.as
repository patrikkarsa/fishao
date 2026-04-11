package assets.common
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.LockedLocation")]
   public dynamic class LockedLocation extends MovieClip
   {
       
      
      public var buttonBuy:MovieClip;
      
      public var reasone:TextField;
      
      public var reasoneBg:MovieClip;
      
      public var title:MovieClip;
      
      public function LockedLocation()
      {
         super();
      }
   }
}
