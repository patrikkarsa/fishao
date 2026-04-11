package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="GAME_GUI")]
   public dynamic class GAME_GUI extends MovieClip
   {
       
      
      public var energyIndicator:MovieClip;
      
      public var fishbucksIndicator:MovieClip;
      
      public var fishcoinsIndicator:MovieClip;
      
      public var levelIndicator:MovieClip;
      
      public var mainMenu:MovieClip;
      
      public function GAME_GUI()
      {
         super();
      }
   }
}
