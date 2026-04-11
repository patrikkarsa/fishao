package api.moneyTree.rewardCollect
{
   import com.ax3.jss.requests.client.ClientRequest;
   
   public class RequestMoneyTreeRewardCollect extends ClientRequest
   {
       
      
      public var fishcoinsCount:uint;
      
      public var fishbucksCount:uint;
      
      public function RequestMoneyTreeRewardCollect()
      {
         super();
      }
   }
}
