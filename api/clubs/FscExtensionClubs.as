package api.clubs
{
   import api.base.FscExtensionBase;
   import api.clubs.actions_leader.approve.RequestClubsMemberApprove;
   import api.clubs.actions_leader.kick.RequestClubsMemberKick;
   import api.clubs.actions_leader.reject.RequestClubsMemberReject;
   import api.clubs.actions_member.join.RequestClubsJoin;
   import api.clubs.actions_member.leave.RequestClubsLeave;
   import api.clubs.create.RequestClubsCreate;
   import api.clubs.get_tabs_data.RequestClubsGetTabsData;
   import api.clubs.get_user_club.RequestClubsGetUserClub;
   import api.clubs.goal_history.RequestClubsGoalHistory;
   import api.clubs.init.RequestClubsInit;
   import api.clubs.page.EClubPageType;
   import api.clubs.page.goals.RequestClubsGetPageGoals;
   import api.clubs.page.info.RequestClubsGetPageInfo;
   import api.clubs.page.logs.RequestClubsGetPageLogs;
   import api.clubs.page.management.RequestClubsGetPageManagement;
   import api.clubs.page.rankings.RequestClubsGetPageRankings;
   import api.clubs.page.recommended.RequestClubsGetPageRecommended;
   import api.clubs.page.tournament.RequestClubsGetPageTournament;
   import api.clubs.tournament_history.RequestClubsTournamentHistory;
   import api.clubs.update_info.RequestClubsUpdateInfo;
   import api.clubs.upgrade_level.RequestClubsUpgradeLevel;
   import com.ax3.fishao.debug.Debug;
   import com.ax3.jss.requests.client.ClientRequest;
   import com.ax3.jss.requests.server.ServerResp;
   
   public class FscExtensionClubs extends FscExtensionBase
   {
       
      
      public function FscExtensionClubs()
      {
         super();
      }
      
      override public function loadInitData(callback:Function) : void
      {
         _connection.send(new RequestClubsInit(),callback);
      }
      
      public function createClub(name:String, description:String, requirementLevel:int, type:String, emblem:int, callback:Function) : void
      {
         var request:RequestClubsCreate = new RequestClubsCreate();
         request.requirement_level = requirementLevel;
         request.type = type;
         request.emblem = emblem;
         request.name = name;
         request.description = description;
         _connection.send(request,callback);
      }
      
      public function loadDataForTabsPages(clubID:int, callback:Function) : void
      {
         var request:RequestClubsGetTabsData = new RequestClubsGetTabsData();
         request.club_id = clubID;
         _connection.send(request,callback);
      }
      
      public function joinTo(clubID:int, callback:Function) : void
      {
         var request:RequestClubsJoin = new RequestClubsJoin();
         request.club_id = clubID;
         _connection.send(request,callback);
      }
      
      public function leaveFromClub(callback:Function) : void
      {
         _connection.send(new RequestClubsLeave(),callback);
      }
      
      public function upgradeClubLevel(callback:Function) : void
      {
         _connection.send(new RequestClubsUpgradeLevel(),callback);
      }
      
      public function updateInfo(emblemID:int, description:String, clubType:String, requiredLevel:int, callback:Function) : void
      {
         var request:RequestClubsUpdateInfo = new RequestClubsUpdateInfo();
         request.emblem_id = emblemID;
         request.description = description;
         request.club_type = clubType;
         request.required_level = requiredLevel;
         _connection.send(request,callback);
      }
      
      public function kickMember(login:String, callback:Function) : void
      {
         var request:RequestClubsMemberKick = new RequestClubsMemberKick();
         request.login = login;
         _connection.send(request,callback);
      }
      
      public function approveMember(login:String, callback:Function) : void
      {
         var request:RequestClubsMemberApprove = new RequestClubsMemberApprove();
         request.login = login;
         _connection.send(request,callback);
      }
      
      public function rejectMember(login:String, callback:Function) : void
      {
         var request:RequestClubsMemberReject = new RequestClubsMemberReject();
         request.login = login;
         _connection.send(request,callback);
      }
      
      public function getTournamentHistory(callback:Function) : void
      {
         _connection.send(new RequestClubsTournamentHistory(),callback);
      }
      
      public function getGoalHistory(callback:Function) : void
      {
         _connection.send(new RequestClubsGoalHistory(),callback);
      }
      
      public function getClubInfoFor(login:String, callback:Function) : void
      {
         var request:RequestClubsGetUserClub = new RequestClubsGetUserClub();
         request.login = login;
         _connection.send(request,callback);
      }
      
      public function loadDataForPage(pageType:String, callback:Function, params:Object = null) : void
      {
         var requestPageInfo:RequestClubsGetPageInfo = null;
         var requestPageRankings:RequestClubsGetPageRankings = null;
         var requestPageRecommended:RequestClubsGetPageRecommended = null;
         var request:ClientRequest = null;
         switch(pageType)
         {
            case EClubPageType.ECPT_CREATE:
               if(callback != null)
               {
                  callback(new ServerResp());
               }
               break;
            case EClubPageType.ECPT_GOALS:
               request = new RequestClubsGetPageGoals();
               break;
            case EClubPageType.ECPT_INFO:
               requestPageInfo = new RequestClubsGetPageInfo();
               requestPageInfo.club_id = Debug.assertProperty(params,"club_id");
               request = requestPageInfo;
               break;
            case EClubPageType.ECPT_LOGS:
               request = new RequestClubsGetPageLogs();
               break;
            case EClubPageType.ECPT_MANAGEMENT:
               request = new RequestClubsGetPageManagement();
               break;
            case EClubPageType.ECPT_RANKINGS:
               requestPageRankings = new RequestClubsGetPageRankings();
               requestPageRankings.ranking_type = Debug.assertProperty(params,"ranking_type");
               request = requestPageRankings;
               break;
            case EClubPageType.ECPT_RECOMMENDED:
               requestPageRecommended = new RequestClubsGetPageRecommended();
               requestPageRecommended.count = 6;
               request = requestPageRecommended;
               break;
            case EClubPageType.ECPT_TOURNAMENT:
               request = new RequestClubsGetPageTournament();
               break;
            default:
               Debug.assert(false,"unknown type " + pageType);
         }
         if(request != null)
         {
            _connection.send(request,callback);
         }
      }
   }
}
