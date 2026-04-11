package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="gDialogSimpleWithTwoButtons")]
   public dynamic class gDialogSimpleWithTwoButtons extends MovieClip
   {
       
      
      public var buttonActionLeft:MovieClip;
      
      public var buttonActionRight:MovieClip;
      
      public var buttonClose:MovieClip;
      
      public var labelDescription:TextField;
      
      public var labelTitle:TextField;
      
      public function gDialogSimpleWithTwoButtons()
      {
         super();
      }
   }
}
