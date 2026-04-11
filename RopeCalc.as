package
{
   import sample.Box2D.*;
   import sample.Box2D.swig.*;
   
   public class RopeCalc
   {
       
      
      public var swigCPtr:int;
      
      public function RopeCalc()
      {
         super();
      }
      
      public static function create() : RopeCalc
      {
         var _loc1_:* = new RopeCalc();
         _loc1_.swigCPtr = _wrap_new_RopeCalc();
         return _loc1_;
      }
      
      public function destroy() : void
      {
         _wrap_delete_RopeCalc(swigCPtr);
      }
      
      public function set joinsCount(param1:int) : void
      {
         _wrap_RopeCalc_joinsCount_set(swigCPtr,param1);
      }
      
      public function get joinsCount() : int
      {
         return _wrap_RopeCalc_joinsCount_get(swigCPtr);
      }
      
      public function set scale(param1:Number) : void
      {
         _wrap_RopeCalc_scale_set(swigCPtr,param1);
      }
      
      public function get scale() : Number
      {
         return _wrap_RopeCalc_scale_get(swigCPtr);
      }
      
      public function set gravityCoef(param1:Number) : void
      {
         _wrap_RopeCalc_gravityCoef_set(swigCPtr,param1);
      }
      
      public function get gravityCoef() : Number
      {
         return _wrap_RopeCalc_gravityCoef_get(swigCPtr);
      }
      
      public function set gravity(param1:Number) : void
      {
         _wrap_RopeCalc_gravity_set(swigCPtr,param1);
      }
      
      public function get gravity() : Number
      {
         return _wrap_RopeCalc_gravity_get(swigCPtr);
      }
      
      public function set speed(param1:Number) : void
      {
         _wrap_RopeCalc_speed_set(swigCPtr,param1);
      }
      
      public function get speed() : Number
      {
         return _wrap_RopeCalc_speed_get(swigCPtr);
      }
      
      public function set speedCoef(param1:Number) : void
      {
         _wrap_RopeCalc_speedCoef_set(swigCPtr,param1);
      }
      
      public function get speedCoef() : Number
      {
         return _wrap_RopeCalc_speedCoef_get(swigCPtr);
      }
      
      public function set speedFinal(param1:Number) : void
      {
         _wrap_RopeCalc_speedFinal_set(swigCPtr,param1);
      }
      
      public function get speedFinal() : Number
      {
         return _wrap_RopeCalc_speedFinal_get(swigCPtr);
      }
      
      public function set SPEED_INERTION(param1:Number) : void
      {
         _wrap_RopeCalc_SPEED_INERTION_set(swigCPtr,param1);
      }
      
      public function get SPEED_INERTION() : Number
      {
         return _wrap_RopeCalc_SPEED_INERTION_get(swigCPtr);
      }
      
      public function set FLEX_SOFT_COEF(param1:Number) : void
      {
         _wrap_RopeCalc_FLEX_SOFT_COEF_set(swigCPtr,param1);
      }
      
      public function get FLEX_SOFT_COEF() : Number
      {
         return _wrap_RopeCalc_FLEX_SOFT_COEF_get(swigCPtr);
      }
      
      public function set flexibilityCoef(param1:Number) : void
      {
         _wrap_RopeCalc_flexibilityCoef_set(swigCPtr,param1);
      }
      
      public function get flexibilityCoef() : Number
      {
         return _wrap_RopeCalc_flexibilityCoef_get(swigCPtr);
      }
      
      public function set SOFT_ROPE(param1:Number) : void
      {
         _wrap_RopeCalc_SOFT_ROPE_set(swigCPtr,param1);
      }
      
      public function get SOFT_ROPE() : Number
      {
         return _wrap_RopeCalc_SOFT_ROPE_get(swigCPtr);
      }
      
      public function set autoLengthCoef(param1:Number) : void
      {
         _wrap_RopeCalc_autoLengthCoef_set(swigCPtr,param1);
      }
      
      public function get autoLengthCoef() : Number
      {
         return _wrap_RopeCalc_autoLengthCoef_get(swigCPtr);
      }
      
      public function set lengthTotal(param1:Number) : void
      {
         _wrap_RopeCalc_lengthTotal_set(swigCPtr,param1);
      }
      
      public function get lengthTotal() : Number
      {
         return _wrap_RopeCalc_lengthTotal_get(swigCPtr);
      }
      
      public function set joinLength(param1:Number) : void
      {
         _wrap_RopeCalc_joinLength_set(swigCPtr,param1);
      }
      
      public function get joinLength() : Number
      {
         return _wrap_RopeCalc_joinLength_get(swigCPtr);
      }
      
      public function set pX(param1:int) : void
      {
         _wrap_RopeCalc_pX_set(swigCPtr,param1);
      }
      
      public function get pX() : int
      {
         return _wrap_RopeCalc_pX_get(swigCPtr);
      }
      
      public function set pY(param1:int) : void
      {
         _wrap_RopeCalc_pY_set(swigCPtr,param1);
      }
      
      public function get pY() : int
      {
         return _wrap_RopeCalc_pY_get(swigCPtr);
      }
      
      public function set prevX(param1:int) : void
      {
         _wrap_RopeCalc_prevX_set(swigCPtr,param1);
      }
      
      public function get prevX() : int
      {
         return _wrap_RopeCalc_prevX_get(swigCPtr);
      }
      
      public function set prevY(param1:int) : void
      {
         _wrap_RopeCalc_prevY_set(swigCPtr,param1);
      }
      
      public function get prevY() : int
      {
         return _wrap_RopeCalc_prevY_get(swigCPtr);
      }
      
      public function set aX(param1:int) : void
      {
         _wrap_RopeCalc_aX_set(swigCPtr,param1);
      }
      
      public function get aX() : int
      {
         return _wrap_RopeCalc_aX_get(swigCPtr);
      }
      
      public function set aY(param1:int) : void
      {
         _wrap_RopeCalc_aY_set(swigCPtr,param1);
      }
      
      public function get aY() : int
      {
         return _wrap_RopeCalc_aY_get(swigCPtr);
      }
      
      public function set tmpDx(param1:Number) : void
      {
         _wrap_RopeCalc_tmpDx_set(swigCPtr,param1);
      }
      
      public function get tmpDx() : Number
      {
         return _wrap_RopeCalc_tmpDx_get(swigCPtr);
      }
      
      public function set tmpDy(param1:Number) : void
      {
         _wrap_RopeCalc_tmpDy_set(swigCPtr,param1);
      }
      
      public function get tmpDy() : Number
      {
         return _wrap_RopeCalc_tmpDy_get(swigCPtr);
      }
      
      public function set tmpD(param1:Number) : void
      {
         _wrap_RopeCalc_tmpD_set(swigCPtr,param1);
      }
      
      public function get tmpD() : Number
      {
         return _wrap_RopeCalc_tmpD_get(swigCPtr);
      }
      
      public function set tmpDiff(param1:Number) : void
      {
         _wrap_RopeCalc_tmpDiff_set(swigCPtr,param1);
      }
      
      public function get tmpDiff() : Number
      {
         return _wrap_RopeCalc_tmpDiff_get(swigCPtr);
      }
      
      public function set startPointX(param1:Number) : void
      {
         _wrap_RopeCalc_startPointX_set(swigCPtr,param1);
      }
      
      public function get startPointX() : Number
      {
         return _wrap_RopeCalc_startPointX_get(swigCPtr);
      }
      
      public function set startPointY(param1:Number) : void
      {
         _wrap_RopeCalc_startPointY_set(swigCPtr,param1);
      }
      
      public function get startPointY() : Number
      {
         return _wrap_RopeCalc_startPointY_get(swigCPtr);
      }
      
      public function set endPointX(param1:Number) : void
      {
         _wrap_RopeCalc_endPointX_set(swigCPtr,param1);
      }
      
      public function get endPointX() : Number
      {
         return _wrap_RopeCalc_endPointX_get(swigCPtr);
      }
      
      public function set endPointY(param1:Number) : void
      {
         _wrap_RopeCalc_endPointY_set(swigCPtr,param1);
      }
      
      public function get endPointY() : Number
      {
         return _wrap_RopeCalc_endPointY_get(swigCPtr);
      }
      
      public function GetPx(param1:int) : Number
      {
         return _wrap_RopeCalc_GetPx(swigCPtr,param1);
      }
      
      public function GetPy(param1:int) : Number
      {
         return _wrap_RopeCalc_GetPy(swigCPtr,param1);
      }
      
      public function Create() : void
      {
         _wrap_RopeCalc_Create(swigCPtr);
      }
      
      public function Update() : void
      {
         _wrap_RopeCalc_Update(swigCPtr);
      }
      
      public function AddGraviry() : void
      {
         _wrap_RopeCalc_AddGraviry(swigCPtr);
      }
      
      public function UpdatePositionGiveSpeed() : void
      {
         _wrap_RopeCalc_UpdatePositionGiveSpeed(swigCPtr);
      }
      
      public function RecalculateAll(param1:int) : Boolean
      {
         return _wrap_RopeCalc_RecalculateAll(swigCPtr,param1);
      }
      
      public function Recalculate() : void
      {
         _wrap_RopeCalc_Recalculate(swigCPtr);
      }
   }
}
