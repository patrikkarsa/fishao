package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="gViewPrizeItem")]
   public dynamic class gViewPrizeItem extends MovieClip
   {
       
      
      public var bg:MovieClip;
      
      public var labelPrizePlace:TextField;
      
      public var labelRewardBig:TextField;
      
      public var labelRewardSmall:TextField;
      
      public var viewIconFishcoins:MovieClip;
      
      public var viewTournamentPrizeIcon:gViewTournamentPrizeIcon;
      
      public function gViewPrizeItem()
      {
         super();
      }
   }
}
