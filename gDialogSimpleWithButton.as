package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="gDialogSimpleWithButton")]
   public dynamic class gDialogSimpleWithButton extends MovieClip
   {
       
      
      public var buttonAction:MovieClip;
      
      public var buttonClose:MovieClip;
      
      public var labelDescription:TextField;
      
      public var labelTitle:TextField;
      
      public function gDialogSimpleWithButton()
      {
         super();
      }
   }
}
