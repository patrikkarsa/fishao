package assets.common
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.common.PlingHistoryLine")]
   public dynamic class PlingHistoryLine extends MovieClip
   {
       
      
      public var action:MovieClip;
      
      public var message:TextField;
      
      public function PlingHistoryLine()
      {
         super();
      }
   }
}
