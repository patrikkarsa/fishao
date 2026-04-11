package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="gViewEventRow")]
   public dynamic class gViewEventRow extends MovieClip
   {
       
      
      public var labelCriteria:TextField;
      
      public var labelNameFish:TextField;
      
      public var labelNameUser:TextField;
      
      public var labelPosition:TextField;
      
      public var labelReward:TextField;
      
      public var viewBgCurrent:MovieClip;
      
      public var viewFishbucks:MovieClip;
      
      public var viewFishcoin:MovieClip;
      
      public function gViewEventRow()
      {
         super();
      }
   }
}
