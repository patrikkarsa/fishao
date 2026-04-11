package
{
   import com.ax3.AnimatedCharacterLoader;
   import com.ax3.CharacterEditorSwfLoader;
   import com.ax3.config.ApplicationConfig;
   import com.ax3.display.dialog.SWFDialogConfig;
   import com.ax3.events.ErrorEvent;
   import com.ax3.events.FatalErrorEvent;
   import com.ax3.events.Listeners;
   import com.ax3.fishao.Config;
   import com.ax3.fishao.ECurrencyType;
   import com.ax3.fishao.ExecutionQueue;
   import com.ax3.fishao.FishaoFscModelManager;
   import com.ax3.fishao.IGameSwf;
   import com.ax3.fishao.ResourceType;
   import com.ax3.fishao.announcements.ManagerAnnouncements;
   import com.ax3.fishao.control.FullScreenController;
   import com.ax3.fishao.control.managers.FishaoSoundManager;
   import com.ax3.fishao.control.managers.GlobalGameHandlers;
   import com.ax3.fishao.control.managers.MouseCursorManager;
   import com.ax3.fishao.control.managers.SettingsManager;
   import com.ax3.fishao.control.managers.ToolTipManager;
   import com.ax3.fishao.core.FishaoApp;
   import com.ax3.fishao.core.FishaoDialogManager;
   import com.ax3.fishao.core.FishaoResourceManager;
   import com.ax3.fishao.debug.Debug;
   import com.ax3.fishao.debug.Watch;
   import com.ax3.fishao.display.dialogs.ConnectionLostDialog;
   import com.ax3.fishao.display.dialogs.FbLoginDialog;
   import com.ax3.fishao.display.dialogs.FishMarketAvailableSwfDialog;
   import com.ax3.fishao.display.dialogs.IconMessageDialog;
   import com.ax3.fishao.display.dialogs.IframeLoginDialog;
   import com.ax3.fishao.display.dialogs.IframeRegisterDialog;
   import com.ax3.fishao.display.dialogs.LoginDialog;
   import com.ax3.fishao.display.dialogs.MessageDialog;
   import com.ax3.fishao.display.dialogs.ShopSwfDialog;
   import com.ax3.fishao.display.dialogs.TradeDecorationSwfDialog;
   import com.ax3.fishao.display.dialogs.TradeFishSwfDialog;
   import com.ax3.fishao.entries.LocationUser;
   import com.ax3.fishao.events.PreloadEvent;
   import com.ax3.fishao.locations.EBoosterType;
   import com.ax3.fishao.locations.base.FactoryLocation;
   import com.ax3.fishao.locations.base.FactoryLocationModel;
   import com.ax3.fishao.locations.base.LocationConfig;
   import com.ax3.fishao.locations.base.LocationDialog;
   import com.ax3.fishao.locations.base.LocationModel;
   import com.ax3.fishao.locations.base.LocationModelOnVirtualWorld;
   import com.ax3.fishao.locations.base.daycycle.LocationDayCycleLayers;
   import com.ax3.fishao.locations.chars.KeyboardMoveStrategy;
   import com.ax3.fishao.locations.chars.PathMoveStrategy;
   import com.ax3.fishao.locations.privateHouse.LocationDialogPrivateHouse;
   import com.ax3.fishao.locations.privateHouse.LocationModelPrivateHouse;
   import com.ax3.fishao.managers.CharManager;
   import com.ax3.fishao.mediators.FscConnectionMediator;
   import com.ax3.fishao.model.CountryRecord;
   import com.ax3.fishao.model.SettingsModel;
   import com.ax3.fishao.model.info.BuildConfig;
   import com.ax3.fishao.model.pling.EPlingType;
   import com.ax3.fishao.players.ManagerPlayers;
   import com.ax3.fishao.quests.ManagerQuests;
   import com.ax3.fishao.tutorial.ETutorialType;
   import com.ax3.fishao.tutorial.ManagerTutorial;
   import com.ax3.fishao.tutorial.TutorialInfo;
   import com.ax3.fishao.tutorial.views.world_map.WorldMapTutorial;
   import com.ax3.fishao.utils.CheatProtection;
   import com.ax3.fishao.utils.I18n;
   import com.ax3.fishao.utils.Preloader;
   import com.ax3.fishao.utils.UtilsApp;
   import com.ax3.fishao.utils.UtilsArray;
   import com.ax3.fishao.utils.UtilsDialog;
   import com.ax3.fishao.vars.app;
   import com.ax3.fishao.view.dialogs.EmailActivationSwfDialog;
   import com.ax3.fishao.view.dialogs.FishaoBaseSwfDialog;
   import com.ax3.fishao.view.dialogs.InventorySwfDialog;
   import com.ax3.fishao.view.dialogs.InviteFriendsSwfDialog;
   import com.ax3.fishao.view.dialogs.PopupManager;
   import com.ax3.fishao.view.dialogs.ProfileSwfDialog;
   import com.ax3.fishao.view.dialogs.SettingsSwfDialog;
   import com.ax3.fishao.view.dialogs.WorldListSwfDialog;
   import com.ax3.fishao.view.dialogs.advertising.ManagerAdvertising;
   import com.ax3.fishao.view.dialogs.bank.energy.BuyEnergySwfDialog;
   import com.ax3.fishao.view.dialogs.bank.fishcoins.BuyFishcoinsSwfDialog;
   import com.ax3.fishao.view.dialogs.base.ManagerBase;
   import com.ax3.fishao.view.dialogs.boosters.ManagerBoosters;
   import com.ax3.fishao.view.dialogs.breeding.ManagerBreeding;
   import com.ax3.fishao.view.dialogs.club.model.ManagerClubs;
   import com.ax3.fishao.view.dialogs.collections.model.ManagerCollections;
   import com.ax3.fishao.view.dialogs.events.model.ManagerEvents;
   import com.ax3.fishao.view.dialogs.features.ManagerFeatures;
   import com.ax3.fishao.view.dialogs.featuresTemporary.ManagerFeaturesTemporary;
   import com.ax3.fishao.view.dialogs.fishes.ManagerFishes;
   import com.ax3.fishao.view.dialogs.fishingLine.model.ManagerFishingLine;
   import com.ax3.fishao.view.dialogs.fruits.ManagerFruits;
   import com.ax3.fishao.view.dialogs.furniture_factory.ManagerFurnitureFactory;
   import com.ax3.fishao.view.dialogs.holidays.model.ManagerHolidays;
   import com.ax3.fishao.view.dialogs.interior.ManagerInterior;
   import com.ax3.fishao.view.dialogs.location.ManagerLocation;
   import com.ax3.fishao.view.dialogs.maintenance.ManagerMaintenance;
   import com.ax3.fishao.view.dialogs.moneyTree.model.ManagerMoneyTree;
   import com.ax3.fishao.view.dialogs.monster_fishes.ManagerMonsterFishes;
   import com.ax3.fishao.view.dialogs.periodicFeatures.ManagerPeriodicFeatures;
   import com.ax3.fishao.view.dialogs.rankings.DialogRankings;
   import com.ax3.fishao.view.dialogs.sales.ManagerSales;
   import com.ax3.fishao.view.dialogs.simple.DialogSimpleWithButton;
   import com.ax3.fishao.view.dialogs.string.EStringTypeStubs;
   import com.ax3.fishao.view.dialogs.tournaments.ManagerTournaments;
   import com.ax3.fishao.view.dialogs.trade.model.ManagerTrade;
   import com.ax3.fishao.view.dialogs.wheel_of_fortune.ManagerWheelOfFortune;
   import com.ax3.fishao.view.dialogs.worlds.ManagerWorlds;
   import com.ax3.fishao.view.states.GuiState;
   import com.ax3.fishao.view.wrappers.FishaoAssetWrappersProcessor;
   import com.ax3.jss.FscConnection;
   import com.ax3.jss.ext.events.ChatFscExtensionEvent;
   import com.ax3.jss.ext.impl.LoginFscExtension;
   import com.ax3.jss.model.FishaoFscModel;
   import com.ax3.jss.model.states.FscModelState;
   import com.ax3.jss.requests.server.ServerResp;
   import com.ax3.net.BinaryLoaderRepeatable;
   import com.ax3.net.LoadHandler;
   import com.ax3.net.platform.EPaymentMenuType;
   import com.ax3.net.platform.IPlatform;
   import com.ax3.net.platform.PlatformManager;
   import com.ax3.net.platform.PlatformPageType;
   import com.ax3.net.platform.PlatformType;
   import com.ax3.net.platform.impl.FacebookPlatform;
   import com.ax3.net.platform.impl.SpilGamesPlatform;
   import com.ax3.net.platform.impl.base.PlatformBase;
   import com.ax3.net.platform.impl.yahoo.DialogYahooRegistration;
   import com.ax3.utils.Input;
   import com.ax3.utils.URLUtils;
   import com.ax3.utils.empty;
   import com.ax3.utils.log.CcLogger;
   import com.ax3.utils.log.globalLogger;
   import com.ax3.utils.timer.IUpdate;
   import com.ax3.utils.timer.UpdateGroup;
   import com.ax3.utils.timer.UpdateManager;
   import com.facebook.graph.Facebook;
   import com.junkbyte.console.Cc;
   import com.junkbyte.console.addons.displaymap.DisplayMapAddon;
   import com.junkbyte.console.addons.profiler.displaymap.ProfilerAddon;
   import com.junkbyte.console.addons.watcher.WatchAddon;
   import flash.display.LoaderInfo;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.display.StageAlign;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.UncaughtErrorEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.net.navigateToURL;
   import flash.system.Security;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.ContextMenu;
   import flash.utils.getQualifiedClassName;
   import flash.utils.setTimeout;
   import sr.BfgPaymentResp;
   import sr.FishCatchEmoticonResp;
   import sr.FishingResp;
   import sr.GetDataResp;
   import sr.LeaveLocationResp;
   import sr.LeaveSublocationResp;
   import sr.LoginErrorResp;
   import sr.LoginSuccessResp;
   import sr.UpdateResp;
   import sr.debugging.FishBlocksAtLakesDataResp;
   import sr.moderating.ReportChangeStateResp;
   
   public class GameSwf extends Sprite implements IGameSwf, IUpdate
   {
      
      public static const LOADING_CHANNEL:String = "Loading";
      
      public static var globalDispatcher:EventDispatcher = new EventDispatcher();
      
      public static var instance:GameSwf;
      
      public static var stage:Stage;
      
      private static var _worldMap:WorldMapTutorial;
      
      public static var charsManager:CharManager = new CharManager();
      
      public static const settings:SettingsManager = new SettingsManager();
      
      public static var radarType:uint = 0;
      
      public static var isDebugLakeCellsVisible:Boolean = false;
      
      public static var iframeFbRegistrationFlag:Boolean = false;
      
      public static var guiState:GuiState;
      
      public static var profileSwfDialog:ProfileSwfDialog = null;
      
      private static var _rankingsSwfDialog:DialogRankings = null;
      
      private static var _currentLocationDialog:LocationDialog;
      
      private static var _currentSublocationDialog:LocationDialog;
      
      private static var _privateHouseDialog:LocationDialogPrivateHouse;
       
      
      private var _emailActivationDialog:EmailActivationSwfDialog;
      
      private var _loginDialog:LoginDialog;
      
      private var _charEditorLoader:CharacterEditorSwfLoader;
      
      private var _settingsDialog:SettingsSwfDialog;
      
      private var _iFrameLoginDialog:IframeLoginDialog;
      
      private var _iFrameRegisterDialog:IframeRegisterDialog;
      
      private var _needSetPositionAfterExitVirtualLocation:Boolean;
      
      private var _fscModel:FishaoFscModel;
      
      private var _fscConnectionMediator:FscConnectionMediator;
      
      private var _animatedCharacter:AnimatedCharacterLoader;
      
      private var _lastLocationId:int;
      
      private var _lastEnterTournamentId:int;
      
      private var _lastVirtualLocationID:int;
      
      private var _managersInitLeft:int;
      
      private var _managers:Array;
      
      private var _managerAdvertising:ManagerAdvertising;
      
      private var _managerAnnouncements:ManagerAnnouncements;
      
      private var _managerFishingLine:ManagerFishingLine;
      
      private var _managerMoneyTree:ManagerMoneyTree;
      
      private var _managerEvents:ManagerEvents;
      
      private var _managerTournaments:ManagerTournaments;
      
      private var _managerMaintanence:ManagerMaintenance;
      
      private var _managerQuests:ManagerQuests;
      
      private var _managerWorlds:ManagerWorlds;
      
      private var _managerTrade:ManagerTrade;
      
      private var _managerCollections:ManagerCollections;
      
      private var _managerFishes:ManagerFishes;
      
      private var _managerFeatures:ManagerFeatures;
      
      private var _managerTutorial:ManagerTutorial;
      
      private var _managerPlayers:ManagerPlayers;
      
      private var _managerPeriodicFeatures:ManagerPeriodicFeatures;
      
      private var _managerFeaturesTemporary:ManagerFeaturesTemporary;
      
      private var _managerFruits:ManagerFruits;
      
      private var _managerSales:ManagerSales;
      
      private var _managerBreeding:ManagerBreeding;
      
      private var _managerClubs:ManagerClubs;
      
      private var _managerWheelOfFortune:ManagerWheelOfFortune;
      
      private var _managerBoosters:ManagerBoosters;
      
      private var _managerMonsterFishes:ManagerMonsterFishes;
      
      private var _managerHolidays:ManagerHolidays;
      
      private var _managerFurnitureFactory:ManagerFurnitureFactory;
      
      private var _managerInterior:ManagerInterior;
      
      private var _managerLocation:ManagerLocation;
      
      public var tradeDialog:TradeFishSwfDialog;
      
      private var _needStartTutorialAfterLoadData:Boolean;
      
      private var _openedPopups:Array;
      
      public function GameSwf()
      {
         super();
         Security.allowInsecureDomain("*");
         Security.allowDomain("*");
         if(stage)
         {
            this.init();
         }
         else
         {
            Listeners.addEventListener(this,this,Event.ADDED_TO_STAGE,this.init);
         }
      }
      
      public static function get currentLocationDialog() : LocationDialog
      {
         var currentLocation:LocationDialog = null;
         if(_privateHouseDialog != null)
         {
            currentLocation = _privateHouseDialog;
         }
         else if(_currentSublocationDialog != null)
         {
            currentLocation = _currentSublocationDialog;
         }
         else if(_currentLocationDialog != null)
         {
            currentLocation = _currentLocationDialog;
         }
         return currentLocation;
      }
      
      public static function get worldMap() : WorldMapTutorial
      {
         return _worldMap;
      }
      
      private static function onError(event:ErrorEvent) : void
      {
         var messageDialog:IconMessageDialog = null;
         if(event is FatalErrorEvent)
         {
            Cc.error(FatalErrorEvent(event).toString());
            messageDialog = app.dialogFactory.getIconMessageDialog();
            messageDialog.iconType = IconMessageDialog.ERROR_ICON;
            messageDialog.text = I18n.get("fatalError" + FatalErrorEvent(event).id);
            messageDialog.show();
         }
      }
      
      private static function onFishingResp(response:FishingResp) : void
      {
         var fishingLog:* = null;
         if(response.fishLength == -1)
         {
            fishingLog = response.data;
            fishingLog = "------- FISHING CALCULATION: ------------\n" + fishingLog + "\n-----------------------------------------";
            Cc.logch("fishing",fishingLog);
         }
      }
      
      private static function onFishCatchEmoticon(resp:FishCatchEmoticonResp) : void
      {
         var locationUser:LocationUser = null;
         var num:int = 0;
         if(currentLocationDialog != null && currentLocationDialog.isActive())
         {
            if(currentLocationDialog.locationModel != null)
            {
               locationUser = currentLocationDialog.locationModel.getLocationUser(resp.username);
               if(locationUser != null)
               {
                  if(currentLocationDialog.gui != null)
                  {
                     if(currentLocationDialog.userIsOnScreen(locationUser))
                     {
                        num = resp.emoticon;
                        if(num == 1)
                        {
                           locationUser.fieldChar.showSmallEmoticon();
                        }
                        else if(num == 2)
                        {
                           locationUser.fieldChar.showMediumEmoticon();
                        }
                        else if(num == 3)
                        {
                           locationUser.fieldChar.showLargeEmoticon();
                        }
                        else
                        {
                           locationUser.fieldChar.showFiveStarEmoticon();
                        }
                     }
                  }
               }
            }
         }
      }
      
      private static function onChatPublicMessage(event:ChatFscExtensionEvent) : void
      {
         var locationUser:LocationUser = null;
         var location:LocationDialog = null;
         if(currentLocationDialog != null && currentLocationDialog.isActive())
         {
            if(currentLocationDialog.locationModel != null)
            {
               locationUser = currentLocationDialog.locationModel.getLocationUser(event.data.senderLogin);
               if(locationUser != null)
               {
                  locationUser.fieldChar.message = event.data.msg;
                  Cc.log("Chat public message: " + event.data.msg);
                  location = currentLocationDialog;
                  if(location.gui != null)
                  {
                     if(currentLocationDialog.userIsOnScreen(locationUser))
                     {
                        location.gui.mainMenu.chatPanel.processChatMessage(event.data.senderLogin,event.data.msg);
                     }
                  }
               }
            }
         }
      }
      
      private static function showWorldMapOnLeaveResp(resp:ServerResp) : void
      {
         if(resp is LeaveSublocationResp || resp is LeaveLocationResp)
         {
            if(_currentLocationDialog != null)
            {
               _currentLocationDialog.close();
               _currentLocationDialog = null;
            }
            showWorldMap();
            worldMap.startMapUpdate();
         }
      }
      
      public static function showWorldMap(e:Event = null) : void
      {
         if(_worldMap == null)
         {
            _worldMap = app.dialogFactory.getWorldMapDialog();
         }
         _worldMap.show();
      }
      
      public static function paymentCallback(response:ServerResp) : void
      {
         var dialog:MessageDialog = new MessageDialog();
         var textKey:String = "pay_18";
         if(response is BfgPaymentResp && (response as BfgPaymentResp).success)
         {
            textKey = "pay_19";
         }
         dialog.setText(I18n.get(textKey));
         dialog.buttons = MessageDialog.CLOSE_BUTTON | MessageDialog.OK_BUTTON;
         dialog.closeOnOk = true;
         dialog.show();
      }
      
      private static function onLocationSuspendComplete(newLocationId:int, prevLocationID:int = -1) : void
      {
         var locationModel:LocationModel = null;
         Cc.log("onLocationSuspendComplete(newLocationId:" + newLocationId + ")");
         try
         {
            locationModel = FactoryLocationModel.createSublocationModel(newLocationId);
            locationModel.prevLocationID = prevLocationID;
            _currentSublocationDialog = FactoryLocation.createSublocation(newLocationId,locationModel);
         }
         catch(e:Error)
         {
            Cc.error("locationConstructor1 error",e);
            GameSwf.sendReportToServer("locaiton");
         }
         try
         {
            _currentSublocationDialog.show();
         }
         catch(e:Error)
         {
            Cc.error("_currentSublocationDialog.show error",e);
            GameSwf.sendReportToServer("locaiton");
         }
      }
      
      private static function onFocusIn(event:FocusEvent) : void
      {
         if(event.target is TextField && TextField(event.target).type == TextFieldType.INPUT && Config.FULLSCREEN == true && UtilsApp.getFlashPlayerVersion() < 11)
         {
            FullScreenController.getInstance().switchFullScreen();
         }
      }
      
      private static function onEnergyPriceListLoaded(response:GetDataResp) : void
      {
         var list:Array = null;
         var data:Object = null;
         var oneEnergyCost:Number = NaN;
         var energy:String = null;
         var i:int = 0;
         var buyEnergyDialog:BuyEnergySwfDialog = null;
         var price:int = 0;
         if(response.data.hasOwnProperty("energyPrices"))
         {
            list = [];
            data = JSON.parse(response.data.energyPrices);
            oneEnergyCost = 0;
            for(energy in data)
            {
               if(data.hasOwnProperty(energy))
               {
                  list.push({
                     "energyCount":energy,
                     "price":data[energy],
                     "free":0
                  });
               }
            }
            list.sortOn("energyCount",Array.NUMERIC);
            for(i = 1; i < list.length; i++)
            {
               price = int(String(list[i].price).split(":")[0]);
               if(oneEnergyCost == 0)
               {
                  oneEnergyCost = price / int(list[i].energyCount);
               }
               else
               {
                  list[i].free = int((int(list[i].energyCount) - price / oneEnergyCost) * 100 / int(list[i].energyCount));
               }
            }
            buyEnergyDialog = app.dialogFactory.getBuyEnergySwfDialog();
            buyEnergyDialog.setData(list);
            buyEnergyDialog.show();
         }
      }
      
      private static function onFishBlocksAtLakesDataResp(resp:FishBlocksAtLakesDataResp) : void
      {
         var locationDialog:LocationDialog = currentLocationDialog;
         if(locationDialog != null)
         {
            locationDialog.showFishBlocks(resp,radarType);
         }
      }
      
      private static function onDeactivate(event:Event) : void
      {
         Input.clear();
      }
      
      private static function onActivate(event:Event) : void
      {
         Input.clear();
      }
      
      public static function onBfgEmptyCookie() : void
      {
         var dialog:ConnectionLostDialog = app.dialogFactory.getConnectionLostDialog();
         dialog.text = I18n.get("emptyCookie");
         dialog.refreshButton.visible = false;
         dialog.show();
         PopupManager.GAME_FIELD_LAYER.visible = false;
         PopupManager.DIALOG_LAYER.visible = false;
         PopupManager.LOADING_SCREEN.visible = false;
      }
      
      public static function showRankingsDialog() : void
      {
         if(_rankingsSwfDialog == null)
         {
            _rankingsSwfDialog = app.dialogFactory.getRankingsDialog();
         }
         _rankingsSwfDialog.show();
      }
      
      public static function inspectGuestLockedAction() : Boolean
      {
         var managerTutorial:ManagerTutorial = null;
         var result:Boolean = Boolean(app.user.isGuest);
         if(result)
         {
            managerTutorial = instance._managerTutorial;
            if(managerTutorial == null || !managerTutorial.isAnyTutorialInProgress)
            {
               instance.showGuestBlockedActionDialog();
            }
         }
         return result;
      }
      
      public static function globalShowMessageFn(message:String, isList:Boolean, buttons:int, closeOnOk:Boolean) : void
      {
         var dialog:MessageDialog = app.dialogFactory.getMessageDialog();
         dialog.setText(message,isList);
         dialog.buttons = buttons;
         dialog.closeOnOk = closeOnOk;
         dialog.show();
      }
      
      public static function sendReportToServer(tag:String = null) : void
      {
         Cc.sendToServer(Config.BUG_REPORT_URL,true,tag);
      }
      
      public static function destroyCurrentLocations() : void
      {
         if(_currentSublocationDialog != null)
         {
            _currentSublocationDialog.destroy();
            _currentSublocationDialog = null;
         }
         if(_currentLocationDialog != null)
         {
            _currentLocationDialog.destroy();
            _currentLocationDialog = null;
         }
      }
      
      public static function closeCurrentLocation() : void
      {
         if(_currentSublocationDialog != null)
         {
            instance.closeSublocationDialog();
         }
      }
      
      private static function tryRemoveWidget(type:int) : void
      {
         if(_currentSublocationDialog != null)
         {
            _currentSublocationDialog.gui.removeWidgetByType(type);
         }
         if(_currentLocationDialog != null)
         {
            _currentLocationDialog.gui.removeWidgetByType(type);
         }
         if(_privateHouseDialog)
         {
            _privateHouseDialog.gui.removeWidgetByType(type);
         }
      }
      
      public static function tryUpdateGUI(type:String) : void
      {
         if(currentLocationDialog == null)
         {
            return;
         }
         if(currentLocationDialog.gui != null)
         {
            currentLocationDialog.gui.update(type);
         }
      }
      
      private static function initGlobal() : void
      {
         GlobalGameHandlers.showMessage = globalShowMessageFn;
         SWFDialogConfig.globalPostfix = "?r=" + BuildConfig.VERSION;
      }
      
      private static function handleGlobalErrors(event:UncaughtErrorEvent) : void
      {
         var report:String = null;
         var messageDialog:MessageDialog = null;
         var format:TextFormat = null;
         var string:String = null;
         if(BuildConfig.isProd())
         {
            if(event.error is Error)
            {
               Cc.error(event.error);
               report = String((event.error as Error).errorID) + " :: event.text: " + event.text;
               if(event.target is LoaderInfo)
               {
                  report += " :: event toString: " + event.toString();
                  report += " :: error getStackTrace: " + (event.error as Error).getStackTrace();
                  report += " :: error message: " + (event.error as Error).message;
                  report += " :: error toString: " + (event.error as Error).toString();
               }
               else
               {
                  report += " :: event.target: " + event.target + "stack trace: " + (event.error as Error).getStackTrace();
               }
               sendReportToServer(report);
            }
            Cc.log("Disconnect by handleGlobalError event.error=" + event.error);
            FishaoFscModelManager.fscModel.disconnect();
         }
         else
         {
            messageDialog = new MessageDialog();
            messageDialog.buttons = 0;
            messageDialog.messageField.selectable = true;
            format = messageDialog.messageField.defaultTextFormat;
            format.size = 11;
            messageDialog.messageField.defaultTextFormat = format;
            string = "";
            if(event.error is Error)
            {
               string = Cc.error(event.error);
               Cc.log((event.error as Error).getStackTrace());
               sendReportToServer(String((event.error as Error).errorID));
            }
            messageDialog.setText(string,false);
            messageDialog.show();
         }
      }
      
      private static function reportChangeStateRespHandler(resp:ReportChangeStateResp) : void
      {
         app.moderatorModel.parseReportChangeStateResp(resp);
      }
      
      private static function loadingLogger(... args) : void
      {
         Cc.logchArgs("load",args);
      }
      
      public static function waitForLoadLocation(callback:Function) : void
      {
         if(callback == null)
         {
            return;
         }
         var timeoutTime:int = 250;
         var location:LocationDialog = GameSwf.currentLocationDialog;
         if(location == null || !location.locationLoadComplete || location.locationModel == null || location.locationModel.getLocationUser(app.user.username) == null)
         {
            setTimeout(waitForLoadLocation,timeoutTime,callback);
            return;
         }
         callback();
      }
      
      public static function processErrors(errors:Array) : void
      {
         var string:String = null;
         var message:* = "";
         for each(string in errors)
         {
            if(message.length > 0)
            {
               message += "\n";
            }
            message += (errors.length > 1 ? "• " : "   ") + string;
         }
         processError(message);
      }
      
      public static function processError(message:String) : void
      {
         var dialog:MessageDialog = app.dialogFactory.getMessageDialog();
         dialog.setText(message,false);
         dialog.buttons = MessageDialog.CLOSE_BUTTON | MessageDialog.OK_BUTTON;
         dialog.closeOnOk = true;
         dialog.show();
      }
      
      public static function importYahooHelper() : void
      {
         var description:String;
         var callback:Function = function(e:* = null):void
         {
            var request:URLRequest = new URLRequest("http://www.fishao.com/play");
            navigateToURL(request,"_blank");
         };
         var dialog:DialogSimpleWithButton = UtilsDialog.showDialogInfoWithButton(I18n.get("dialog_yahoo_import_complete_title"),"",I18n.get("buttonPlayCapital"),callback);
         dialog.buttonClose.visible = false;
         description = I18n.get("dialog_yahoo_import_complete_action");
         description = description.replace(EStringTypeStubs.ESTS_USERNAME,app.user.username);
         dialog.description = description;
         dialog.labelDescription.y -= 40;
      }
      
      public function set needSetPositionAfterExitVirtualLocation(value:Boolean) : void
      {
         this._needSetPositionAfterExitVirtualLocation = value;
         if(!this._needSetPositionAfterExitVirtualLocation)
         {
            this.lastVirtualLocationID = 0;
         }
      }
      
      public function get needSetPositionAfterExitVirtualLocation() : Boolean
      {
         return this._needSetPositionAfterExitVirtualLocation;
      }
      
      public function get lastVirtualLocationID() : int
      {
         return this._lastVirtualLocationID;
      }
      
      public function set needStartTutorialAfterLoadData(value:Boolean) : void
      {
         this._needStartTutorialAfterLoadData = value;
      }
      
      public function get managerClubs() : ManagerClubs
      {
         return this._managerClubs;
      }
      
      public function get managerMonsterFishes() : ManagerMonsterFishes
      {
         return this._managerMonsterFishes;
      }
      
      public function get managerFurnitureFactory() : ManagerFurnitureFactory
      {
         return this._managerFurnitureFactory;
      }
      
      public function get managerInterior() : ManagerInterior
      {
         return this._managerInterior;
      }
      
      public function get managerLocation() : ManagerLocation
      {
         return this._managerLocation;
      }
      
      public function get managerAnnouncements() : ManagerAnnouncements
      {
         return this._managerAnnouncements;
      }
      
      public function get managerFishingLine() : ManagerFishingLine
      {
         return this._managerFishingLine;
      }
      
      public function get managerMoneyTree() : ManagerMoneyTree
      {
         return this._managerMoneyTree;
      }
      
      public function get managerEvents() : ManagerEvents
      {
         return this._managerEvents;
      }
      
      public function get managerTournaments() : ManagerTournaments
      {
         return this._managerTournaments;
      }
      
      public function get managerMaintanence() : ManagerMaintenance
      {
         return this._managerMaintanence;
      }
      
      public function get managerPlayers() : ManagerPlayers
      {
         return this._managerPlayers;
      }
      
      public function get managerWorlds() : ManagerWorlds
      {
         return this._managerWorlds;
      }
      
      public function get managerTrade() : ManagerTrade
      {
         return this._managerTrade;
      }
      
      public function get animatedCharacter() : AnimatedCharacterLoader
      {
         if(this._animatedCharacter == null)
         {
            this.initAnimatedCharacters();
         }
         return this._animatedCharacter;
      }
      
      public function get managerQuests() : ManagerQuests
      {
         return this._managerQuests;
      }
      
      public function get managerCollections() : ManagerCollections
      {
         return this._managerCollections;
      }
      
      public function get managerFishes() : ManagerFishes
      {
         return this._managerFishes;
      }
      
      public function get managerFeatures() : ManagerFeatures
      {
         return this._managerFeatures;
      }
      
      public function get managerFeaturesTemporary() : ManagerFeaturesTemporary
      {
         return this._managerFeaturesTemporary;
      }
      
      public function get managerTutorial() : ManagerTutorial
      {
         return this._managerTutorial;
      }
      
      public function get managerFruits() : ManagerFruits
      {
         return this._managerFruits;
      }
      
      public function get managerSales() : ManagerSales
      {
         return this._managerSales;
      }
      
      public function get managerAdvertising() : ManagerAdvertising
      {
         return this._managerAdvertising;
      }
      
      public function get managerPeriodicFeatures() : ManagerPeriodicFeatures
      {
         return this._managerPeriodicFeatures;
      }
      
      public function get managerBreeding() : ManagerBreeding
      {
         return this._managerBreeding;
      }
      
      public function get managerWheelOfFortune() : ManagerWheelOfFortune
      {
         return this._managerWheelOfFortune;
      }
      
      public function get managerBoosters() : ManagerBoosters
      {
         return this._managerBoosters;
      }
      
      public function get managerHolidays() : ManagerHolidays
      {
         return this._managerHolidays;
      }
      
      public function onPopupShown(popup:FishaoBaseSwfDialog) : void
      {
         this._openedPopups.push(popup);
      }
      
      public function onPopupClosed(popup:FishaoBaseSwfDialog) : void
      {
         UtilsArray.removeValue(this._openedPopups,popup);
      }
      
      public function onConnectToWorld() : void
      {
         var manager:ManagerBase = null;
         for each(manager in this._managers)
         {
            manager.onConnectToWorld();
         }
         if(this._needStartTutorialAfterLoadData)
         {
            this._needStartTutorialAfterLoadData = false;
            this._managerTutorial.tryStartTutorialCommon();
         }
      }
      
      private function onManagerDataLoaded(response:ServerResp) : void
      {
         --this._managersInitLeft;
         var className:String = getQualifiedClassName(response);
         Cc.log("manager initialized with response " + className);
         if(this._managersInitLeft == 0)
         {
            Cc.log("all managers initialized");
            this.onAllManagersInitialized();
         }
      }
      
      private function onAllManagersInitialized() : void
      {
         var woldListDialog:WorldListSwfDialog = app.dialogFactory.getWorldListSwfDialog();
         if(Debug.AUTO_SELECT_WORLD || this._managerWorlds.worldsList.length == 1)
         {
            woldListDialog.onButtonOkClicked(this._managerWorlds.firstAvailableWorld,false);
         }
         else if(this._managerTutorial.isTutorialCommonComplete)
         {
            woldListDialog.show();
         }
         else
         {
            woldListDialog.onButtonOkClicked(this._managerWorlds.firstAvailableWorld,false);
         }
      }
      
      public function onLoginByPlatform(response:ServerResp) : void
      {
         var needImport:Boolean = false;
         var canChangeNick:Boolean = false;
         var responseError:LoginErrorResp = null;
         var responseSuccess:LoginSuccessResp = null;
         var dialogYahooRegistration:DialogYahooRegistration = null;
         var fbLoginDialog:FbLoginDialog = null;
         var messageDialog:IconMessageDialog = null;
         if(PlatformManager.isYahoo())
         {
            needImport = false;
            canChangeNick = false;
            if(response is LoginErrorResp)
            {
               responseError = response as LoginErrorResp;
               if(responseError.descr == LoginErrorResp.ACCOUNT_ALREADY_IMPORTED)
               {
                  canChangeNick = false;
                  needImport = false;
               }
               else if(responseError.descr == LoginErrorResp.LOGIN_NOT_FOUND)
               {
                  needImport = true;
                  canChangeNick = true;
               }
               else
               {
                  needImport = false;
               }
            }
            else if(response is LoginSuccessResp)
            {
               responseSuccess = response as LoginSuccessResp;
               app.user.username = (response as LoginSuccessResp).login;
               needImport = true;
            }
            if(needImport)
            {
               dialogYahooRegistration = app.dialogFactory.getDialog(DialogYahooRegistration);
               dialogYahooRegistration.canChangeNick = canChangeNick;
               dialogYahooRegistration.show();
            }
            else
            {
               importYahooHelper();
            }
            return;
         }
         if(response is LoginErrorResp)
         {
            if(LoginErrorResp(response).descr == LoginErrorResp.LOGIN_NOT_FOUND)
            {
               fbLoginDialog = app.dialogFactory.getFbLoginDialog();
               fbLoginDialog.show();
               if(PopupManager.LOADING_SCREEN.visible)
               {
                  PopupManager.LOADING_SCREEN.removeAllIndicators();
               }
            }
            else
            {
               messageDialog = app.dialogFactory.getIconMessageDialog();
               messageDialog.iconType = IconMessageDialog.ERROR_ICON;
               messageDialog.text = I18n.get("reg_error_" + LoginErrorResp(response).descr);
               messageDialog.show();
            }
         }
         else if(response is LoginSuccessResp)
         {
            this.onLoginByPlatformSuccess(response as LoginSuccessResp);
         }
      }
      
      public function onLoginByPlatformSuccess(response:LoginSuccessResp) : void
      {
         app.user.onUserLoginedAsRegistered();
         app.sid = response.sid;
         app.user.username = response.login;
         app.user.unreadPMNumber = response.unreadPrivateMessages;
         this._fscModel.state = FscModelState.CONNECTED;
         this.onLoginSuccess(response);
         PlatformManager.sendPlatformAdditionalData();
      }
      
      private function onSidLogin(response:ServerResp) : void
      {
         if(response is LoginErrorResp)
         {
            globalDispatcher.dispatchEvent(new FatalErrorEvent(FatalErrorEvent.SESSION_ERROR,LoginErrorResp(response).descr));
         }
         else if(response is LoginSuccessResp)
         {
            this.onLoginSidSuccess(response as LoginSuccessResp);
         }
      }
      
      private function onLoginSidSuccess(response:LoginSuccessResp) : void
      {
         app.sid = response.sid;
         if(response.isGuest)
         {
            app.user.onUserLoginedAsGuest();
         }
         else
         {
            app.user.onUserLoginedAsRegistered();
         }
         app.user.username = response.login;
         app.user.isReferralsDisabled = response.referralsDisabled;
         app.user.emailActivation = response.emailActivation;
         app.user.unreadPMNumber = response.unreadPrivateMessages;
         this.onLoginSuccess(response);
      }
      
      public function onLoginSuccess(resp:LoginSuccessResp) : void
      {
         app.user.isReferralsDisabled = resp.referralsDisabled;
         app.user.emailActivation = resp.emailActivation;
         var currentLocation:LocationDialog = GameSwf.currentLocationDialog;
         if(currentLocation != null)
         {
            if(currentLocation.locationModel != null && currentLocation.locationModel.isSublocation)
            {
               GameSwf.instance.closeSublocationDialog();
            }
         }
         if(resp.lang != Config.LANGUAGE)
         {
            Config.LANGUAGE = I18n.inspectLanguageCodeForExists(resp.lang);
            I18n.init(Config.LANGUAGE,Config.LANGUAGE_URL);
         }
         if(GameSwf.worldMap != null)
         {
            GameSwf.worldMap.titleUpdate();
         }
         this.initManagers();
         this.loadInitData();
      }
      
      public function loadInitData() : void
      {
         var manager:ManagerBase = null;
         this._managersInitLeft = this._managers.length;
         for each(manager in this._managers)
         {
            manager.loadInitData(Preloader.waitForResponse(this.onManagerDataLoaded));
         }
         this._managerFishes.getFishdexData();
      }
      
      private function init(e:Event = null) : void
      {
         this._openedPopups = [];
         removeEventListener(Event.ADDED_TO_STAGE,this.init);
         stage.align = StageAlign.TOP_LEFT;
         stage.scaleMode = StageScaleMode.NO_SCALE;
         stage.addEventListener(FocusEvent.FOCUS_IN,onFocusIn);
         var applicationConfig:ApplicationConfig = new ApplicationConfig();
         applicationConfig.resourceManagerClass = FishaoResourceManager;
         applicationConfig.dialogManagerClass = FishaoDialogManager;
         applicationConfig.assetWrappersProcessor = new FishaoAssetWrappersProcessor(loaderInfo.applicationDomain);
         applicationConfig.swfDialogURL = Config.DIALOG_SERVER + "data/swf/dialogs/";
         app = new FishaoApp(applicationConfig);
         app.user.isGuest = Config.IS_GUEST;
         globalDispatcher.addEventListener(I18n.LANG_LOADED,this.onLangLoaded);
         Config.LANGUAGE = I18n.inspectLanguageCodeForExists(Config.LANGUAGE);
         I18n.init(Config.LANGUAGE,Config.LANGUAGE_URL);
         initGlobal();
      }
      
      private function initCheatProtection() : void
      {
         var onSpeedHack:Function = null;
         onSpeedHack = function(e:Event):void
         {
            if(Boolean(app.user.username) && FishaoFscModelManager.fscModel.isConnected())
            {
               Cc.log("Disconnect by handleGlobalError event.error=6060.B (" + app.user.username + ")");
               sendReportToServer("6060.B");
               FishaoFscModelManager.fscModel.disconnect();
            }
         };
         var wd:CheatProtection = new CheatProtection();
         wd.init();
         wd.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSpeedHack);
      }
      
      public function config(flashVars:Object) : void
      {
         PlatformManager.readFlashVars(flashVars);
      }
      
      private function initConfig() : void
      {
         var contextMenu:ContextMenu;
         var loginHandler:LoadHandler;
         var charEditorHandler:LoadHandler;
         var worldMapHandler:LoadHandler;
         this.initConsole(app);
         globalDispatcher.addEventListener(ErrorEvent.ERROR,onError);
         loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,handleGlobalErrors);
         Input.initialize(stage);
         stage.addEventListener(Event.DEACTIVATE,onDeactivate);
         stage.addEventListener(Event.ACTIVATE,onActivate);
         contextMenu = new ContextMenu();
         contextMenu.hideBuiltInItems();
         this.contextMenu = contextMenu;
         PlatformManager.init(PlatformType.getPlatformTypeByName(Config.PLATFORM_NAME),PlatformPageType.getByName(Config.PLATFORM_PAGE_TYPE));
         UpdateManager.getInstance().init(stage);
         UpdateManager.getInstance().createGroup(UpdateGroup.TIMER_10M,1000 * 60 * 10);
         UpdateManager.getInstance().createGroup(UpdateGroup.TIMER_30S,30000);
         UpdateManager.getInstance().createGroup(UpdateGroup.TIMER_10S,10000);
         UpdateManager.getInstance().createGroup(UpdateGroup.TIMER_2S,2000);
         UpdateManager.getInstance().createGroup(UpdateGroup.TIMER_1S,1000);
         UpdateManager.getInstance().createGroup(UpdateGroup.TIMER_500,500);
         UpdateManager.getInstance().createGroup(UpdateGroup.TIMER_200,200);
         UpdateManager.getInstance().createGroup(UpdateGroup.ENTER_FRAME);
         UpdateManager.getInstance().getGroup(UpdateGroup.TIMER_500).add(this);
         Cc.logch(LOADING_CHANNEL,"UpdateManager.init() COMPLETE");
         Cc.explodech("config",Config);
         Cc.explodech("config",Config.FB_USER_PROFILE);
         GameSwf.stage = this.stage;
         app.performanceManager.addStageActiveStateListeners(this.stage);
         instance = this;
         FishaoSoundManager.load();
         FishaoSoundManager.init();
         ToolTipManager.init(stage);
         MouseCursorManager.init(stage);
         addChild(PopupManager.GAME_FIELD_LAYER);
         addChild(PopupManager.DIALOG_LAYER);
         addChild(PopupManager.LOADING_SCREEN);
         addChild(PopupManager.TOP_LAYER);
         addChild(PopupManager.TUTORIAL_LAYER);
         addChild(ToolTipManager.TOOLTIP_LAYER);
         if(PlatformManager.isFbPlatform() && Config.FB_USER_PROFILE == null)
         {
            globalDispatcher.dispatchEvent(new FatalErrorEvent(FatalErrorEvent.FB_USER_DATA_IS_NULL_ERROR));
            throw new Error(FatalErrorEvent.FB_USER_DATA_IS_NULL_ERROR);
         }
         loginHandler = new LoadHandler(this.showLoginDialog,null,ExecutionQueue.LOGIN);
         if(!PlatformManager.isPartnerIframe())
         {
            ExecutionQueue.getInstance().addLoadHandler(loginHandler);
         }
         charEditorHandler = new LoadHandler();
         charEditorHandler.executor = function():void
         {
            showCharacterEditor(true,[]);
         };
         charEditorHandler.itemType = ExecutionQueue.CHARACTER_EDITOR;
         ExecutionQueue.getInstance().addLoadHandler(charEditorHandler);
         worldMapHandler = new LoadHandler();
         worldMapHandler.itemType = ExecutionQueue.MAP;
         worldMapHandler.executor = showWorldMap;
         ExecutionQueue.getInstance().addLoadHandler(worldMapHandler);
         dispatchEvent(new Event(PreloadEvent.RESOURCES_LOADED));
         ExecutionQueue.getInstance().doQueue();
         FishaoFscModelManager.getInstance().init();
         this._fscModel = FishaoFscModelManager.fscModel;
         this._fscModel.addEventListener(ChatFscExtensionEvent.PUBLIC_MESSAGE,onChatPublicMessage);
         this._fscModel.addRequestHandler(FishCatchEmoticonResp,onFishCatchEmoticon);
         FishaoFscModelManager.fscModel.addRequestHandler(UpdateResp,this.updateResponseHandle);
         FishaoFscModelManager.fscModel.addRequestHandler(FishingResp,onFishingResp);
         FishaoFscModelManager.fscModel.addRequestHandler(ReportChangeStateResp,reportChangeStateRespHandler);
         FishaoFscModelManager.fscModel.addRequestHandler(FishBlocksAtLakesDataResp,onFishBlocksAtLakesDataResp);
         this._fscConnectionMediator = new FscConnectionMediator();
         this._fscConnectionMediator.init(this._fscModel,app.dialogFactory);
         charsManager.init(this._fscModel);
         PopupManager.getInstance().init(globalDispatcher);
         FullScreenController.getInstance().init(globalDispatcher,stage,this);
         settings.init();
         if(PlatformManager.currentPlatformType == PlatformType.FB_PLATFORM && !FacebookPlatform.isInitOnFacebook)
         {
            if(ExternalInterface.available)
            {
               Cc.log("Call Facebook API init");
               Facebook.init(FacebookPlatform.APP_ID,this.onFBInited);
            }
         }
         dispatchEvent(new Event("initConfig"));
         this.initCheatProtection();
      }
      
      public function onFBInited(response:Object, fail:Object) : void
      {
         FacebookPlatform.isInitOnFacebook = true;
         if(response)
         {
            Cc.log("FB inited OK");
            Cc.log("----------->>>         ",response.toString());
            FacebookPlatform.signedInitResponse = response;
            dispatchEvent(new Event(FacebookPlatform.FACEBOOK_INITED));
         }
         else
         {
            Facebook.login(this.fbLoginHandler,{"scope":FacebookPlatform.SCOPE});
            Cc.warn("FB not inited");
         }
      }
      
      private function fbLoginHandler(success:Object, fail:Object) : void
      {
         if(success)
         {
            Cc.log("FB login OK");
            dispatchEvent(new Event(FacebookPlatform.FACEBOOK_INITED));
         }
         else
         {
            Cc.log("FB login Error!   Permissions not given");
         }
      }
      
      private function onLangLoaded(event:Event) : void
      {
         globalDispatcher.removeEventListener(I18n.LANG_LOADED,this.onLangLoaded);
         this.initConfig();
         if(_worldMap != null)
         {
            _worldMap.titleUpdate();
         }
      }
      
      private function updateResponseHandle(response:UpdateResp) : void
      {
         var data:Object = null;
         var property:String = null;
         var fishingLog:String = null;
         try
         {
            if(app.user != null && this._managerMaintanence != null)
            {
               this._managerMaintanence.checkAndProcessMaintanence(response);
            }
            data = response.data;
            if(data == null)
            {
               return;
            }
            for(property in data)
            {
               if(!data.hasOwnProperty(property))
               {
                  continue;
               }
               switch(property)
               {
                  case "toSunRise":
                     LocationDayCycleLayers.toSunRise = response.getIntData(property);
                     break;
                  case "toSunSet":
                     LocationDayCycleLayers.toSunSet = response.getIntData(property);
                     break;
                  case "dayState":
                     LocationDayCycleLayers.isDayState = response.getIntData(property);
                     break;
                  case "selectedBait":
                     app.user.baitInfoId = response.getIntData(property);
                     break;
                  case "selectedUserRodId":
                     app.user.userRodId = response.getIntData(property);
                     break;
                  case "inventory":
                     app.user.inventory.update(response.getJsonData(property) as Array);
                     break;
                  case "fishcoins":
                     app.user.fishcoins = response.getIntData(property);
                     break;
                  case "level":
                     app.user.level = response.getIntData(property);
                     if(app.user.level > 1)
                     {
                        app.user.oldLevel = app.user.level - 1;
                     }
                     break;
                  case "fishbucks":
                     app.user.fishbucks = response.getIntData(property);
                     break;
                  case "experience":
                     if(!response.hasDataProperty("fish_caught"))
                     {
                        app.user.experience = response.getIntData(property);
                     }
                     break;
                  case "settings":
                     settings.updateByResponse(response.getJsonData(property));
                     break;
                  case "amountOfNewReports":
                     app.moderatorModel.amountOfNewReports.value = response.getIntData(property);
                     break;
                  case "fishingLog":
                     fishingLog = response.getStringData(property);
                     fishingLog = "------- FISHING CALCULATION: ------------\n" + fishingLog + "\n-----------------------------------------";
                     Cc.logch("fishing",fishingLog);
                     break;
                  case "dailyQuestsComplete":
                     app.user.needToShowDailyQuestsComplete = true;
                     break;
                  case "unreadPrivateMessages":
                     app.user.unreadPMNumber = response.getIntData(property);
                     break;
                  case "spendings":
                     app.user.spendings = Number(response.getStringData("spendings"));
                     break;
               }
            }
            if(response.hasDataProperty("prevExpLimit") && response.hasDataProperty("nextExpLimit"))
            {
               app.user.nextExpLimit = response.getIntData("nextExpLimit");
               app.user.prevExpLimit = response.getIntData("prevExpLimit");
            }
         }
         catch(e:Error)
         {
            Cc.error("GameSwf.updateResponseHandle ERROR",e);
            sendReportToServer("updateResp");
         }
      }
      
      private function initConsole(app:FishaoApp) : void
      {
         if(BuildConfig.isProd())
         {
            Cc.startOnStage(this,"<fishadminconsoledebug>",true);
            Cc.config.enableKeystroke = true;
         }
         else
         {
            Cc.startOnStage(this," ",true);
            Cc.config.enableKeystroke = true;
         }
         FscConnection.slowConnectionEmulator = false;
         Cc.config.commandLineAllowed = true;
         Cc.config.tracing = true;
         Cc.commandLine = true;
         Cc.height = 200;
         Cc.width = 450;
         globalLogger = new CcLogger();
         DisplayMapAddon.addToMenu();
         ProfilerAddon.addToMenu();
         WatchAddon.addToMenu();
         CcCommands.initCommands(this);
         BinaryLoaderRepeatable.logger = loadingLogger;
         if(Debug.INCREASE_MOVEMENT_SPEED)
         {
            PathMoveStrategy.maxSpeed = KeyboardMoveStrategy.maxSpeed = 30;
         }
      }
      
      public function exitFromAllLocations() : void
      {
         var isSublocation:Boolean = false;
         var isTournament:Boolean = false;
         Cc.log("GameSwf::exitFromAllLocations()");
         if(_currentLocationDialog == null)
         {
            return;
         }
         if(worldMap != null)
         {
            worldMap.visible = true;
         }
         if(_currentSublocationDialog != null)
         {
            isSublocation = _currentSublocationDialog.locationModel.isSublocation;
            isTournament = _currentSublocationDialog.locationModel.isTournament;
            if(_currentSublocationDialog != null)
            {
               _currentSublocationDialog.close();
               _currentSublocationDialog = null;
            }
            if(isSublocation)
            {
               FishaoFscModelManager.locationExtension.leaveSublocation(false,Preloader.waitForResponse(showWorldMapOnLeaveResp));
            }
            if(isTournament)
            {
               FishaoFscModelManager.locationExtension.leaveLocation(Preloader.waitForResponse(showWorldMapOnLeaveResp));
            }
         }
         else
         {
            if(_currentLocationDialog != null)
            {
               _currentLocationDialog.close();
               _currentLocationDialog = null;
            }
            if(_privateHouseDialog != null)
            {
               _privateHouseDialog.close();
               _privateHouseDialog = null;
            }
            else
            {
               FishaoFscModelManager.locationExtension.leaveLocation(Preloader.waitForResponse(showWorldMapOnLeaveResp));
            }
         }
      }
      
      public function exitFromAllLocations2() : void
      {
         var isSublocation:Boolean = false;
         var isTournament:Boolean = false;
         Cc.log("GameSwf::exitFromAllLocations()");
         if(_currentLocationDialog == null)
         {
            return;
         }
         worldMap.visible = true;
         if(_currentSublocationDialog != null)
         {
            isSublocation = _currentSublocationDialog.locationModel.isSublocation;
            isTournament = _currentSublocationDialog.locationModel.isTournament;
            if(_currentSublocationDialog != null)
            {
               _currentSublocationDialog.close();
               _currentSublocationDialog = null;
            }
            if(isSublocation)
            {
               FishaoFscModelManager.locationExtension.leaveSublocation(false,Preloader.waitForResponse(showWorldMapOnLeaveResp));
            }
            if(isTournament)
            {
               FishaoFscModelManager.locationExtension.leaveLocation(Preloader.waitForResponse(showWorldMapOnLeaveResp));
            }
         }
         else
         {
            if(_currentLocationDialog != null)
            {
               _currentLocationDialog.close();
               _currentLocationDialog = null;
            }
            if(_privateHouseDialog != null)
            {
               _privateHouseDialog.close();
               _privateHouseDialog = null;
            }
            else
            {
               FishaoFscModelManager.locationExtension.leaveLocation(showWorldMapOnLeaveResp);
            }
         }
      }
      
      public function showLoginDialog() : void
      {
         var loginExt:LoginFscExtension = FishaoFscModelManager.loginFscExtension;
         if(PlatformManager.isFbPlatform())
         {
            loginExt.fbLogin(PlatformManager.currentPlatformType.name,PlatformManager.getFbPid(),PlatformManager.getSig(),Preloader.waitForResponse(this.onLoginByPlatform));
         }
         else if(PlatformManager.useSimplePlatformLogin)
         {
            loginExt.platformLogin(PlatformManager.getServerPtypeName(),PlatformManager.getPid(),PlatformManager.getSig(),Preloader.waitForResponse(this.onLoginByPlatform));
         }
         else if(PlatformManager.isFbConnectAuth() && empty(Config.SID) == true)
         {
            loginExt.fbLogin(PlatformType.FB_PLATFORM.name,PlatformManager.getFbPid(),PlatformManager.getSig(),Preloader.waitForResponse(this.onLoginByPlatform));
         }
         else if(PlatformManager.isSitePlatform() && !empty(Config.SID))
         {
            loginExt.sidLogin(Config.SID,Config.AFFILIATE_ID,Config.CAMPAIGN_ID,String(Config.CAMPAIGN_REC_ID),Config.PROMO_CODE,Config.LANGUAGE,Preloader.waitForResponse(this.onSidLogin));
            Config.SID = null;
         }
         else
         {
            this._loginDialog = app.dialogFactory.getLoginDialog();
            this._loginDialog.show();
            this._loginDialog.switchToLoginState();
         }
         showWorldMap();
         this.initAnimatedCharacters();
      }
      
      public function showIFrameLoginDialog() : void
      {
         if(PlatformManager.isPartnerIframe())
         {
            this._iFrameLoginDialog = app.dialogFactory.getIframeLoginDialog();
            this._iFrameLoginDialog.onCloseHandler = this.onIframeLoginDialogClose;
            this._iFrameLoginDialog.show();
            this.initAnimatedCharacters();
         }
      }
      
      public function showIFrameRegisterDialog() : void
      {
         if(PlatformManager.isPartnerIframe())
         {
            this._iFrameRegisterDialog = app.dialogFactory.getIframeRegisterDialog();
            this._iFrameRegisterDialog.show();
            this.initAnimatedCharacters();
         }
      }
      
      public function showGuestBlockedActionDialog() : void
      {
         if(this._loginDialog == null)
         {
            this._loginDialog = app.dialogFactory.getLoginDialog();
         }
         this._loginDialog.show();
         this._loginDialog.switchToGuestBlockedActionState();
      }
      
      private function initManagers() : void
      {
         this.tryCleanupManagers();
         this._managers = [];
         this._managerAdvertising = new ManagerAdvertising();
         this._managers.push(this._managerAdvertising);
         this._managerAnnouncements = new ManagerAnnouncements();
         this._managers.push(this._managerAnnouncements);
         this._managerClubs = new ManagerClubs();
         this._managers.push(this._managerClubs);
         this._managerMonsterFishes = new ManagerMonsterFishes();
         this._managers.push(this._managerMonsterFishes);
         this._managerFurnitureFactory = new ManagerFurnitureFactory();
         this._managers.push(this._managerFurnitureFactory);
         this._managerInterior = new ManagerInterior();
         this._managers.push(this._managerInterior);
         this._managerLocation = new ManagerLocation();
         this._managers.push(this._managerLocation);
         this._managerWorlds = new ManagerWorlds();
         this._managers.push(this._managerWorlds);
         this._managerFishingLine = new ManagerFishingLine();
         this._managers.push(this._managerFishingLine);
         this._managerMoneyTree = new ManagerMoneyTree();
         this._managers.push(this._managerMoneyTree);
         this._managerEvents = new ManagerEvents();
         this._managers.push(this._managerEvents);
         this._managerTournaments = new ManagerTournaments();
         this._managers.push(this._managerTournaments);
         this._managerMaintanence = new ManagerMaintenance();
         this._managers.push(this._managerMaintanence);
         this._managerFishes = new ManagerFishes();
         this._managers.push(this._managerFishes);
         this._managerFeatures = new ManagerFeatures();
         this._managers.push(this._managerFeatures);
         this._managerFeaturesTemporary = new ManagerFeaturesTemporary();
         this._managers.push(this._managerFeaturesTemporary);
         this._managerTrade = new ManagerTrade();
         this._managers.push(this._managerTrade);
         this._managerQuests = new ManagerQuests();
         this._managers.push(this._managerQuests);
         this._managerCollections = new ManagerCollections();
         this._managers.push(this._managerCollections);
         this._managerPlayers = new ManagerPlayers();
         this._managers.push(this._managerPlayers);
         this._managerSales = new ManagerSales();
         this._managers.push(this._managerSales);
         this._managerPeriodicFeatures = new ManagerPeriodicFeatures();
         this._managers.push(this._managerPeriodicFeatures);
         this._managerTutorial = new ManagerTutorial();
         this._managers.push(this._managerTutorial);
         this._managerFruits = new ManagerFruits();
         this._managers.push(this._managerFruits);
         this._managerBreeding = new ManagerBreeding();
         this._managers.push(this._managerBreeding);
         this._managerWheelOfFortune = new ManagerWheelOfFortune();
         this._managers.push(this._managerWheelOfFortune);
         this._managerBoosters = new ManagerBoosters();
         this._managers.push(this._managerBoosters);
         this._managerHolidays = new ManagerHolidays();
         this._managers.push(this._managerHolidays);
         this.postInit();
      }
      
      private function postInit() : void
      {
         var manager:ManagerBase = null;
         for each(manager in this._managers)
         {
            manager.postInit();
         }
      }
      
      public function showEmailActivationDialog() : void
      {
         if(this._emailActivationDialog == null)
         {
            this._emailActivationDialog = app.dialogFactory.getEmailActivationDialog();
         }
         this._emailActivationDialog.show();
      }
      
      public function showCharacterEditor(isNew:Boolean, colors:Object) : void
      {
         if(this._charEditorLoader == null)
         {
            this.initCharacterEditor(Config.CHARACTER_EDITOR_URL);
         }
         var isGuest:Boolean = Boolean(app.user.isGuest);
         var campaignRecId:int = Config.CAMPAIGN_REC_ID;
         if(isNew && campaignRecId != 0 && !isGuest)
         {
            app.user.useCampaignLeadClicktag.activate();
            this._charEditorLoader.addEventListener(Event.CLOSE,this.onCharacterEditorAsNewLeadClose);
         }
         this._charEditorLoader.show(this,isNew,colors);
      }
      
      public function updateCharacterEditor() : void
      {
         this._charEditorLoader.updateCharacterEditor();
      }
      
      private function onCharacterEditorAsNewLeadClose(event:Event) : void
      {
         this._charEditorLoader.removeEventListener(Event.CLOSE,this.onCharacterEditorAsNewLeadClose);
         app.user.inspectCampaignLeadClicktag();
      }
      
      public function showSettingsDialog() : void
      {
         var tutorialInfo:TutorialInfo = this._managerTutorial.getTutorial(ETutorialType.ETT_CHANGE_CHARACTER);
         if(tutorialInfo != null && tutorialInfo.isInProgress)
         {
            this._settingsDialog = app.dialogFactory.getSettingsDialogTutorial();
         }
         else
         {
            this._settingsDialog = app.dialogFactory.getSettingsDialog();
         }
         this._settingsDialog.show();
      }
      
      public function closeSettingsDialog() : void
      {
         if(this._settingsDialog != null && this._settingsDialog.isShowed)
         {
            this._settingsDialog.close();
         }
      }
      
      public function get charEditorLoader() : CharacterEditorSwfLoader
      {
         return this._charEditorLoader;
      }
      
      public function initAnimatedCharacters() : void
      {
         if(this._animatedCharacter == null || !this._animatedCharacter.isLoaded || !this._animatedCharacter.isLoading)
         {
            this._animatedCharacter = new AnimatedCharacterLoader(Config.ANIMATED_CHARACTERS_URL);
         }
      }
      
      public function showCharacterDialog(charViewData:Object, colors:Object, sid:String) : void
      {
         app.sid = sid;
         charViewData.isNew = charViewData.isNew == "true" || charViewData.isNew == true;
         app.user.handleCharViewDataIsNewStatus(charViewData.isNew);
         app.char.fromObject(charViewData);
         if(charViewData.isNew)
         {
            this.showCharacterEditor(charViewData.isNew,colors);
         }
         else if(!this._managerTutorial.isTutorialCommonComplete && !this._managerTutorial.tutorialCommon.isInProgress)
         {
            this._managerTutorial.tryStartTutorialCommon();
         }
      }
      
      public function initCharacterEditor(url:String) : void
      {
         this._charEditorLoader = new CharacterEditorSwfLoader(url);
      }
      
      public function enterToLocation(id:int) : void
      {
         Cc.log("GameSwf.enterToLocation(id=" + id + ")");
         if(_currentLocationDialog != null)
         {
            _currentLocationDialog.close();
            _currentLocationDialog = null;
         }
         var locationModel:LocationModel = FactoryLocationModel.createLocationModel(id);
         _currentLocationDialog = FactoryLocation.createLocation(id,locationModel);
         _currentLocationDialog.show();
         if(_worldMap != null && _worldMap.parent != null)
         {
            _worldMap.parent.removeChild(_worldMap);
         }
      }
      
      public function enterToTournament(locationId:int) : void
      {
         Cc.log("enterToTournament(locationId:" + locationId + ")");
         if(_currentSublocationDialog != null)
         {
            this._lastEnterTournamentId = locationId;
            if(_currentSublocationDialog != null)
            {
               _currentSublocationDialog.close();
               _currentSublocationDialog = null;
            }
            FishaoFscModelManager.locationExtension.leaveSublocation(true,Preloader.waitForResponse(this.onEnterToTournamentLeaveSublocationResp));
         }
         else if(_currentLocationDialog != null)
         {
            _currentLocationDialog.suspend(onLocationSuspendComplete,locationId);
         }
      }
      
      private function onEnterToTournamentLeaveSublocationResp(resp:ServerResp) : void
      {
         if(resp is LeaveSublocationResp)
         {
            _currentLocationDialog.wakeUp();
            if(_currentLocationDialog != null)
            {
               _currentLocationDialog.suspend(onLocationSuspendComplete,this._lastEnterTournamentId);
            }
         }
      }
      
      public function enterToSublocation(locationId:int, prevLocationID:int) : void
      {
         if(_currentLocationDialog != null)
         {
            if(locationId == -1)
            {
               if(_currentSublocationDialog != null)
               {
                  _currentSublocationDialog.close();
                  _currentSublocationDialog = null;
                  FishaoFscModelManager.locationExtension.leaveSublocation(false,Preloader.waitForResponse(this.onLeaveSublocationResp));
               }
            }
            else
            {
               _currentLocationDialog.suspend(onLocationSuspendComplete,locationId,prevLocationID);
            }
         }
         else
         {
            onLocationSuspendComplete(locationId,prevLocationID);
         }
      }
      
      private function onLeaveSublocationResp(resp:ServerResp) : void
      {
         if(resp is LeaveSublocationResp)
         {
            this.closeSublocationDialog();
         }
      }
      
      public function closeSublocationDialog() : void
      {
         if(_currentSublocationDialog != null)
         {
            _currentSublocationDialog.close();
            _currentSublocationDialog = null;
         }
         _currentLocationDialog.wakeUp();
      }
      
      public function showInventoryWindow(resourceType:ResourceType = null) : void
      {
         var dialog:InventorySwfDialog = null;
         if(this._managerTutorial.isAnyTutorialInProgress)
         {
            dialog = app.dialogFactory.getInventorySwfDialogTutorial();
         }
         else
         {
            dialog = app.dialogFactory.getInventorySwfDialog();
         }
         if(dialog != null)
         {
            if(resourceType == null)
            {
               dialog.show();
            }
            else
            {
               dialog.showTabByResType(resourceType);
            }
         }
      }
      
      public function showBuyEnergyWindow(event:MouseEvent = null) : void
      {
         if(GameSwf.inspectGuestLockedAction())
         {
            return;
         }
         FishaoFscModelManager.buyEnergyExtension.getPriceList(onEnergyPriceListLoaded);
      }
      
      public function showInviteFriendsDialog(event:MouseEvent = null) : void
      {
         var inviteFriendsSwfDialog:InviteFriendsSwfDialog = null;
         var platform:IPlatform = null;
         if(GameSwf.inspectGuestLockedAction())
         {
            return;
         }
         switch(PlatformManager.currentPlatformType)
         {
            case PlatformType.FB_PLATFORM:
               inviteFriendsSwfDialog = app.dialogFactory.getInviteFriendsSwfDialog();
               inviteFriendsSwfDialog.show();
               break;
            default:
               platform = PlatformManager.platform;
               if(platform is PlatformBase)
               {
                  (platform as PlatformBase).showInviteFriendsDialog();
               }
         }
      }
      
      public function update(timerMS:uint, timeLeftMS:uint) : void
      {
         Watch.change("fps.avg",app.performanceManager.fps);
         Watch.change("fps.exe",app.performanceManager.averageNumber);
         Watch.change("fps.time",app.performanceManager.lowQualityTime);
         Watch.change("isGuest",app.user.isGuest);
         Watch.change("isFirstLoginAfterRegistration",app.user.isFirstLoginAfterRegistration);
         Watch.change("CAMPAIGN_REC_ID",Config.CAMPAIGN_REC_ID);
      }
      
      public function showBuyFishcoinsDialog(event:MouseEvent = null) : void
      {
         this.showBuyCurrencyDialog(ECurrencyType.ECT_FISHCOINS,ResourceType.FISHCOINS.name);
      }
      
      public function showBuyFishbucksDialog(event:MouseEvent = null) : void
      {
         this.showBuyCurrencyDialog(ECurrencyType.ECT_FISHBUCKS,ResourceType.FISHBUCKS.name);
      }
      
      private function showBuyCurrencyDialog(currencyType:int, currencyName:String) : void
      {
         var buyFishcoinsDialog:BuyFishcoinsSwfDialog = null;
         if(GameSwf.inspectGuestLockedAction())
         {
            return;
         }
         var currentPlatformPaymentMenuType:String = PlatformManager.currentPlatformType.paymentMenuType;
         switch(currentPlatformPaymentMenuType)
         {
            case EPaymentMenuType.EPMT_FISHAO_GAME:
               buyFishcoinsDialog = app.dialogFactory.getBuyFishcoinsSwfDialog();
               buyFishcoinsDialog.mode = currencyType;
               buyFishcoinsDialog.show();
               break;
            case EPaymentMenuType.EPMT_FISHAO_SITE:
               this.openBuyCurrencyUrl(currencyType);
               break;
            case EPaymentMenuType.EPMT_NETWORK_SITE:
               FullScreenController.getInstance().exitFromFullscreen();
               switch(PlatformManager.currentPlatformType)
               {
                  case PlatformType.SPILGAMES_PLATFORM:
                     (PlatformManager.platform as SpilGamesPlatform).openPaymentDialog(currencyName);
               }
               break;
            default:
               Debug.assert(false,"Unsupported EPaymentMenuType on showBuyCurrencyDialog in GameSwf: " + currentPlatformPaymentMenuType);
         }
      }
      
      public function showTradeFishSwfDialog(event:MouseEvent = null) : void
      {
         if(GameSwf.inspectGuestLockedAction())
         {
            return;
         }
         this.tradeDialog = app.dialogFactory.getTradeFishSwfDialog();
         this.tradeDialog.show();
      }
      
      public function showTradeDecorationSwfDialog(event:MouseEvent = null) : void
      {
         if(GameSwf.inspectGuestLockedAction())
         {
            return;
         }
         if(event != null)
         {
            event.stopPropagation();
         }
         var dialog:TradeDecorationSwfDialog = app.dialogFactory.getTradeDecorationSwfDialog();
         dialog.show();
      }
      
      public function showAvailableFishMarketDialog(event:MouseEvent = null) : void
      {
         var dialog:FishMarketAvailableSwfDialog = app.dialogFactory.getFishMarketAvailableSwfDailog();
         dialog.show();
      }
      
      private function openBuyCurrencyUrl(gameCurrency:int) : void
      {
         FullScreenController.getInstance().exitFromFullscreen();
         var todayDate:Date = new Date();
         todayDate.setDate(todayDate.getDate() + 1);
         var tomorrowsDate:Date = new Date();
         tomorrowsDate.setDate(todayDate.getDate() + 2);
         var country:CountryRecord = app.countries.getCountryById(app.user.country);
         var url:String = Config.PAYMENT_URL;
         var request:URLRequest = new URLRequest(url);
         var variables:URLVariables = new URLVariables();
         variables.country = country.iso2;
         variables.userName = app.user.username;
         variables.language = Config.LANGUAGE;
         var email:String = settings.getSettings().email;
         if(!empty(email))
         {
            variables.email = email;
         }
         variables.gameCurrency = gameCurrency;
         request.data = variables;
         request.method = URLRequestMethod.POST;
         URLUtils.navigateToURLBlank(request);
      }
      
      public function showShopDialog(tabId:int = 0, itemId:int = 0) : void
      {
         var dialog:ShopSwfDialog = null;
         if(this._managerTutorial.isAnyTutorialInProgress)
         {
            dialog = app.dialogFactory.getShopSwfDialogTutorial();
         }
         else if(!GameSwf.inspectGuestLockedAction())
         {
            dialog = app.dialogFactory.getShopSwfDialog();
         }
         if(dialog != null)
         {
            dialog.selectTabIdOnLoad(tabId);
            dialog.selectItemIdOnLoad(itemId);
            dialog.show();
         }
      }
      
      public function get gameSettings() : SettingsModel
      {
         return settings.getSettings();
      }
      
      private function onIframeLoginDialogClose() : void
      {
         this.charEditorLoader.showCharEditorAfterLoading = true;
         this.charEditorLoader.iframeLoginIsShowed = false;
         this.showCharacterEditor(true,[]);
      }
      
      public function setNullIframeLoginDialogCloseHandler() : void
      {
         if(this._iFrameLoginDialog != null)
         {
            this._iFrameLoginDialog.onCloseHandler = null;
         }
      }
      
      public function stopFishing() : void
      {
         var locationDialog:LocationDialog = GameSwf.currentLocationDialog;
         if(locationDialog != null && locationDialog.isActive())
         {
            locationDialog.stopFishing();
         }
      }
      
      public function enterPrivateHouse(username:String, force:Boolean = false) : void
      {
         if(!force)
         {
            if(!this._managerTutorial.isTutorialCommonComplete)
            {
               return;
            }
         }
         if(_currentLocationDialog != null)
         {
            _currentLocationDialog.suspend(null);
         }
         if(username != app.user.username)
         {
            this.lastVirtualLocationID = 400;
         }
         else
         {
            this.lastVirtualLocationID = 300;
         }
         var privateHouse:LocationModelPrivateHouse = FactoryLocationModel.createSublocationModel(this._lastVirtualLocationID) as LocationModelPrivateHouse;
         privateHouse.setOwnerUsername(username);
         _privateHouseDialog = FactoryLocation.createSublocation(this._lastVirtualLocationID,privateHouse) as LocationDialogPrivateHouse;
         if(worldMap != null)
         {
            worldMap.stopMapUpdate();
            worldMap.visible = false;
         }
         _privateHouseDialog.show();
      }
      
      public function enterClubArea() : void
      {
         if(_currentLocationDialog != null)
         {
            _currentLocationDialog.suspend(null);
         }
         var id:int = LocationConfig.CLUB_AREA.id;
         var model:LocationModel = FactoryLocationModel.createSublocationModel(id);
         if(_currentLocationDialog != null)
         {
            model.prevLocationID = _currentLocationDialog.locationModel.id;
         }
         _currentSublocationDialog = FactoryLocation.createSublocation(id,model);
         if(worldMap != null)
         {
            worldMap.stopMapUpdate();
            worldMap.visible = false;
         }
         _currentSublocationDialog.show();
      }
      
      public function get lastLocationId() : int
      {
         return this._lastLocationId;
      }
      
      public function set lastVirtualLocationID(value:int) : void
      {
         this._lastVirtualLocationID = value;
      }
      
      public function set lastLocationId(value:int) : void
      {
         this._lastLocationId = value;
      }
      
      public function exitVirtualLocationThroughDoor(nextLocationID:int) : void
      {
         var locationModel:LocationModel = null;
         if(_currentLocationDialog == null)
         {
            locationModel = FactoryLocationModel.createLocationModel(nextLocationID);
            _currentLocationDialog = FactoryLocation.createLocation(nextLocationID,locationModel);
         }
         _currentLocationDialog.show();
         var model:LocationModelOnVirtualWorld = currentLocationDialog.locationModel as LocationModelOnVirtualWorld;
         if(model != null)
         {
            model.exitThroughTheDoor = true;
         }
         this.tryCloseVirtualLocation();
      }
      
      public function exitVirtualLocationViaMap() : void
      {
         if(_currentLocationDialog == null)
         {
            return;
         }
         var model:LocationModelOnVirtualWorld = currentLocationDialog.locationModel as LocationModelOnVirtualWorld;
         if(model != null)
         {
            model.exitThroughTheDoor = false;
         }
         this.tryCloseVirtualLocation();
      }
      
      private function tryCloseVirtualLocation() : void
      {
         if(_privateHouseDialog != null)
         {
            _privateHouseDialog.close();
            _privateHouseDialog = null;
         }
         else if(_currentSublocationDialog != null)
         {
            _currentSublocationDialog.close();
            _currentSublocationDialog = null;
         }
      }
      
      public function enterToLocationAfterLeavingVirtual() : void
      {
         if(_worldMap == null)
         {
            return;
         }
         _worldMap.stopMapUpdate();
         FishaoSoundManager.stopCurrentAmbientMusic();
         if(_currentLocationDialog != null)
         {
            _currentLocationDialog.wakeUp();
            this.needSetPositionAfterExitVirtualLocation = true;
            this.setPositionAfterExitVirtualLocation();
         }
         if(_worldMap.parent != null)
         {
            _worldMap.parent.removeChild(_worldMap);
         }
         _worldMap.deactivate();
      }
      
      public function setPositionAfterExitVirtualLocation() : void
      {
         _currentLocationDialog.setPositionAfterExitVirtualLocation(this._lastVirtualLocationID);
      }
      
      public function stopBoosterEffect(boosterType:String, needShowPling:Boolean) : void
      {
         var plingType:uint = 0;
         if(!app.user.isInfluencedOf(boosterType))
         {
            return;
         }
         app.user.setIsInfluencedOf(boosterType,false);
         var boosterID:int = ResourceType.getBoosterResourceID(boosterType);
         tryRemoveWidget(boosterID);
         if(boosterType == EBoosterType.EBT_RADAR)
         {
            radarType = 0;
            if(_currentSublocationDialog != null)
            {
               _currentSublocationDialog.removeFishingZones();
            }
            if(_currentLocationDialog != null)
            {
               _currentLocationDialog.removeFishingZones();
            }
            if(_privateHouseDialog != null)
            {
               _privateHouseDialog.removeFishingZones();
            }
         }
         if(needShowPling)
         {
            plingType = EPlingType.getBoosterEndPlingType(boosterType);
            FishaoFscModelManager.useItemsExtension.showPlingEndBooster(plingType);
         }
         GameSwf.instance.managerBoosters.removeBoosterByType(boosterType);
      }
      
      public function getOpenedPopup(classType:Class) : FishaoBaseSwfDialog
      {
         var popup:FishaoBaseSwfDialog = null;
         var result:FishaoBaseSwfDialog = null;
         for each(popup in this._openedPopups)
         {
            if(popup is classType)
            {
               result = popup;
               break;
            }
         }
         return result;
      }
      
      private function tryCleanupManagers() : void
      {
         var manager:ManagerBase = null;
         if(this._managers == null)
         {
            return;
         }
         for each(manager in this._managers)
         {
            manager.cleanup();
         }
         this._managers = null;
      }
   }
}
