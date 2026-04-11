include "sample/Box2D/ptr2fun_init.as";
include "sample/Box2D/ptr2funInit.as";
include "sample/Box2D/domainClass.as";
include "sample/Box2D/mutexClass.as";
include "sample/Box2D/conditionClass.as";
include "sample/Box2D/workerDomainClass.as";
include "sample/Box2D/workerClass.as";
include "sample/Box2D/threadId.as";
include "sample/Box2D/realThreadId.as";
include "sample/Box2D/threadArbMutex.as";
include "sample/Box2D/threadArbConds.as";
include "sample/Box2D/threadArbLockDepth.as";
include "sample/Box2D/threadArbMutexLock.as";
include "sample/Box2D/threadArbMutexUnlock.as";
include "sample/Box2D/threadArbCondsNotify.as";
include "sample/Box2D/threadArbCondWait.as";
include "sample/Box2D/yieldCond.as";
include "sample/Box2D/yield.as";
include "sample/Box2D/workerInits.as";
include "sample/Box2D/newThread.as";
include "sample/Box2D/ram_init.as";
include "sample/Box2D/throwWhenOutOfMemory.as";
include "sample/Box2D/sbrk.as";
include "sample/Box2D/stackSize.as";
include "sample/Box2D/stackAlign.as";
include "sample/Box2D/pageSize.as";
include "sample/Box2D/ESP_init.as";
include "sample/Box2D/inf.as";
include "sample/Box2D/nan.as";
include "§__force_ordering_ns_a8886df5-2177-40b7-bf39-f7ff153a4bf9§/§6§.as";


{
   §__force_ordering_ns_a8886df5-2177-40b7-bf39-f7ff153a4bf9§;
   if(!ptr2fun_init.length)
   {
      ptr2fun_init[0] = function():void
      {
         throw new Error("null function pointer called");
      };
      ptr2fun_init.length = 1;
   }
   ram_init;
   this;
   ram_init.endian = Endian.LITTLE_ENDIAN;
   if(ram_init.length < domainClass.MIN_DOMAIN_MEMORY_LENGTH)
   {
      ram_init.length = domainClass.MIN_DOMAIN_MEMORY_LENGTH;
   }
   var _loc1_:* = domainClass.currentDomain.domainMemory = ram_init;
   return _loc1_;
}
