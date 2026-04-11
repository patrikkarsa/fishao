package api.fishingLine.init
{
   import api.fishingLine.data.FishingLineLevelInfo;
   import api.improvable.ResponseImprovable;
   
   public class ResponseFishingLineInit extends ResponseImprovable
   {
       
      
      private var _color:String;
      
      public function ResponseFishingLineInit()
      {
         super();
      }
      
      public function get color() : String
      {
         return this._color;
      }
      
      public function set color(value:String) : void
      {
         this._color = value;
      }
      
      override protected function get levelInfoClass() : Class
      {
         return FishingLineLevelInfo;
      }
   }
}
