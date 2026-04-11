package api.announcements.init
{
   import com.ax3.fishao.core.ISerializable;
   import com.ax3.fishao.debug.Debug;
   
   public class AnnouncementInfo implements ISerializable
   {
       
      
      private var _title:String;
      
      private var _description:String;
      
      private var _urlImage:String;
      
      private var _timeDiff:Number;
      
      public function AnnouncementInfo()
      {
         super();
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      public function get description() : String
      {
         return this._description;
      }
      
      public function get urlImage() : String
      {
         return this._urlImage;
      }
      
      public function get timeDiff() : Number
      {
         return this._timeDiff;
      }
      
      public function serialize() : Object
      {
         Debug.assert(false,"Not implemented");
         return null;
      }
      
      public function deserialize(data:Object) : void
      {
         this._title = Debug.assertProperty(data,"title");
         this._description = Debug.assertProperty(data,"description");
         this._urlImage = Debug.assertProperty(data,"url_image");
         this._timeDiff = Debug.assertProperty(data,"time_diff");
      }
   }
}
