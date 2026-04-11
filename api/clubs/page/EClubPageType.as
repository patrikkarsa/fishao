package api.clubs.page
{
   public class EClubPageType
   {
      
      public static const ECPT_CREATE:String = "create";
      
      public static const ECPT_GOALS:String = "goals";
      
      public static const ECPT_INFO:String = "info";
      
      public static const ECPT_LOGS:String = "logs";
      
      public static const ECPT_MANAGEMENT:String = "management";
      
      public static const ECPT_RANKINGS:String = "rankings";
      
      public static const ECPT_RECOMMENDED:String = "recommended";
      
      public static const ECPT_TOURNAMENT:String = "tournament";
       
      
      public function EClubPageType()
      {
         super();
      }
      
      public static function get all() : Array
      {
         return [ECPT_CREATE,ECPT_GOALS,ECPT_INFO,ECPT_LOGS,ECPT_MANAGEMENT,ECPT_RANKINGS,ECPT_RECOMMENDED,ECPT_TOURNAMENT];
      }
   }
}
