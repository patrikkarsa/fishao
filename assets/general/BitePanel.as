package assets.general
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.general.BitePanel")]
   public dynamic class BitePanel extends MovieClip
   {
       
      
      public var colorBar:MovieClip;
      
      public var descriptionField:TextField;
      
      public var leftButton:MovieClip;
      
      public var pointer:MovieClip;
      
      public var progressBar:MovieClip;
      
      public var progressField:TextField;
      
      public var rightButton:MovieClip;
      
      public var titleField:TextField;
      
      public function BitePanel()
      {
         super();
      }
   }
}
