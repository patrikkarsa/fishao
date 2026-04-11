package assets.common
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.NpcDialogWindow")]
   public dynamic class NpcDialogWindow extends MovieClip
   {
       
      
      public var message:TextField;
      
      public var mouse:MovieClip;
      
      public var nextButton:MovieClip;
      
      public var noButton:MovieClip;
      
      public var npcName:TextField;
      
      public var npcNameBack:MovieClip;
      
      public var yesButton:MovieClip;
      
      public function NpcDialogWindow()
      {
         super();
      }
   }
}
