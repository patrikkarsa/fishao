package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="gDialogSimple")]
   public dynamic class gDialogSimple extends MovieClip
   {
       
      
      public var buttonClose:MovieClip;
      
      public var labelDescription:TextField;
      
      public var labelTitle:TextField;
      
      public function gDialogSimple()
      {
         super();
      }
   }
}
