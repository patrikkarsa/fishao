package api.fishingLine.data
{
   import api.improvable.ImprovableLevelInfo;
   import com.ax3.fishao.debug.Debug;
   
   public class FishingLineLevelInfo extends ImprovableLevelInfo
   {
       
      
      private var _lineLength:uint;
      
      private var _availableColors:Array;
      
      public function FishingLineLevelInfo()
      {
         super();
         this._availableColors = [];
      }
      
      public function get lineLength() : uint
      {
         return this._lineLength;
      }
      
      public function get availableColors() : Array
      {
         return this._availableColors;
      }
      
      override public function deserialize(data:Object) : void
      {
         super.deserialize(data);
         this._lineLength = Debug.assertProperty(data,"line_length");
         this._availableColors = Debug.assertProperty(data,"available_colors",Array);
      }
   }
}
