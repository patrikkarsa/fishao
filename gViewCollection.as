package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="gViewCollection")]
   public dynamic class gViewCollection extends MovieClip
   {
       
      
      public var buttonNext:MovieClip;
      
      public var buttonPrev:MovieClip;
      
      public var labelProgress:TextField;
      
      public var labelReward:TextField;
      
      public var labelTitle:TextField;
      
      public var viewImageReward:MovieClip;
      
      public var viewLock:gViewLock;
      
      public function gViewCollection()
      {
         super();
      }
   }
}
