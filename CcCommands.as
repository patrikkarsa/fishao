package
{
   import com.ax3.events.Listeners;
   import com.ax3.fishao.Config;
   import com.ax3.fishao.FishaoFscModelManager;
   import com.ax3.fishao.debug.Profiler;
   import com.ax3.fishao.entries.LocationUser;
   import com.ax3.fishao.locations.base.LocationDialog;
   import com.ax3.fishao.locations.chars.KeyboardMoveStrategy;
   import com.ax3.fishao.locations.chars.PathMoveStrategy;
   import com.ax3.fishao.locations.entries.FieldChar;
   import com.ax3.fishao.model.info.BuildConfig;
   import com.ax3.fishao.model.missions.Mission;
   import com.ax3.fishao.utils.I18n;
   import com.ax3.fishao.vars.app;
   import com.ax3.fishao.view.dialogs.features.EUserFeature;
   import com.ax3.fishao.view.dialogs.missions.MissionCompletedSwfDialog;
   import com.ax3.fishao.view.dialogs.trade.model.ETradeType;
   import com.ax3.jss.requests.server.ServerResp;
   import com.ax3.net.platform.IPlatform;
   import com.ax3.net.platform.PlatformManager;
   import com.ax3.net.platform.impl.base.PlatformBase;
   import com.ax3.utils.MemoryController;
   import com.demonsters.debugger.MonsterDebugger;
   import com.junkbyte.console.Cc;
   import com.junkbyte.console.KeyBind;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.ui.Keyboard;
   import flash.utils.setTimeout;
   
   public class CcCommands
   {
       
      
      public function CcCommands()
      {
         super();
      }
      
      public static function initCommands(gameSwfInstance:GameSwf) : void
      {
         Cc.addSlashCommand("cp",Profiler.clear,"Clear Profiler");
         Cc.addSlashCommand("i18n",I18n.get,"get translation of a term");
         Cc.addSlashCommand("bfgPayment",function():void
         {
            var data:Object = {
               "sku":"Gamovation.Fishao.fishcoins.7",
               "receipt":"w6zX0lJ8ubVvPsRBSKQIt1qGFTjqtg489NcRCf-u1b1usWL5eToCIsPOyvFR7h7ZqS5Hg6Ug8JWfM_BFnfYlRSe0AVnzT5EGFH03sfyQyvAucV_V8pfn1KE976Q429NIf3mf9QVpwtLMmksxc5OPTQ"
            };
            FishaoFscModelManager.paymentExtension.bfgPayment(data.sku,data.receipt,PlatformManager.bfgPlatform.getWrappingID(),function(resp:ServerResp):void
            {
               GameSwf.paymentCallback(resp);
            });
         },"text bfg payment");
         Cc.addSlashCommand("mtrackClear",MemoryController.clearTrack);
         Cc.addSlashCommand("decoshopState",function(value:Number):void
         {
            GameSwf.currentLocationDialog.locationLayersBase.changeDecorationMarketDoorState(Boolean(value));
         });
         Cc.logch("config","BuildConfig.VERSION: " + BuildConfig.VERSION);
         Cc.logch("config","BuildConfig.BUILD_TYPE: " + BuildConfig.BUILD_TYPE);
         Cc.addSlashCommand("md",function():void
         {
            MonsterDebugger.initialize(gameSwfInstance);
         });
         Cc.addSlashCommand("k",function(value:Number):void
         {
            KeyboardMoveStrategy.maxSpeed = value;
         },"Change movement speed by keyboard (Default: " + KeyboardMoveStrategy.maxSpeed + ")");
         Cc.addSlashCommand("sleepMode",function(value:int):void
         {
            app.performanceManager.sleepMode = value != 0;
         });
         Cc.addSlashCommand("newMovement",function(value:int):void
         {
            LocationDialog.NEW_MOVEMENT = value;
         });
         Cc.addSlashCommand("perfManager",function(value:int):void
         {
            app.performanceManager.enabled = value > 0;
         });
         Cc.addSlashCommand("testFbSend",function(value:int):void
         {
            PlatformManager.fbPlatform.sendRequestFriend(PlatformManager.getFbPid(),[1,2,3,4,5,6,7,8,9,10,11,12,13]);
         });
         Cc.addSlashCommand("bfgGetProducts",function():void
         {
            PlatformManager.bfgPlatform.getProducts(null);
         });
         if(!BuildConfig.isProd())
         {
            Cc.bindKey(new KeyBind(Keyboard.NUMBER_1,true,true,true),function():void
            {
               KeyboardMoveStrategy.maxSpeed = 4;
            });
            Cc.bindKey(new KeyBind(Keyboard.NUMBER_2,true,true,true),function():void
            {
               KeyboardMoveStrategy.maxSpeed = 10;
            });
            Cc.bindKey(new KeyBind(Keyboard.NUMBER_3,true,true,true),function():void
            {
               KeyboardMoveStrategy.maxSpeed = 20;
            });
            Cc.bindKey(new KeyBind(Keyboard.NUMBER_4,true,true,true),function():void
            {
               KeyboardMoveStrategy.maxSpeed = 30;
            });
         }
         Cc.addSlashCommand("p",function(value:Number):void
         {
            PathMoveStrategy.maxSpeed = value;
         },"Change movement speed by keyboard (Default: " + PathMoveStrategy.maxSpeed + ")");
         Cc.addSlashCommand("animationCoef",function(value:Number):void
         {
            FieldChar.CHAR_ANIMATION_SPEED = value;
         },"Change animation speed coefficient (Default: " + FieldChar.CHAR_ANIMATION_SPEED + ")");
         Cc.addSlashCommand("syncDebug",function(value:Number):void
         {
            Config.SYNC_DEBUG = value != 0;
         });
         Cc.addSlashCommand("debugDrawLocation",function(value:Number):void
         {
            Config.DEBUG_DRAW_LOCATION = value != 0;
         });
         Cc.addSlashCommand("debugDrawVisibility",function(value:Number):void
         {
            Config.DEBUG_DRAW_VISIBILITY = value != 0;
         });
         Cc.addSlashCommand("clearDrawVisibility",function(value:Number):void
         {
            Config.CLEAR_DRAW_VISIBILITY = value != 0;
         });
         Cc.addSlashCommand("leaveLocation",gameSwfInstance.exitFromAllLocations);
         Cc.addSlashCommand("debugDrawPath",function(value:Number):void
         {
            Config.DEBUG_DRAW_PATH = value != 0;
         },"Change animation speed coefficient (Default: " + FieldChar.CHAR_ANIMATION_SPEED + ")");
         Cc.addSlashCommand("getBlockInfo",function():void
         {
            if(GameSwf.currentLocationDialog != null)
            {
               GameSwf.isDebugLakeCellsVisible = !GameSwf.isDebugLakeCellsVisible;
               GameSwf.currentLocationDialog.startFishBlockUpdate();
            }
         },"Send blocks info reguest");
         Cc.addSlashCommand("loadershow",PlatformManager.showLoader);
         Cc.addSlashCommand("loaderhide",PlatformManager.hideLoader);
         Cc.addSlashCommand("miniplayGetProducts",function():void
         {
            PlatformManager.miniplayPlatform.getProducts(function():void
            {
               Cc.log("miniplayGetProducts callback function");
            });
         });
         Cc.addSlashCommand("miniplayPayment",function():void
         {
            var data:Object = {
               "sku":"Gamovation.Fishao.fishcoins.7",
               "receipt":"w6zX0lJ8ubVvPsRBSKQIt1qGFTjqtg489NcRCf-u1b1usWL5eToCIsPOyvFR7h7ZqS5Hg6Ug8JWfM_BFnfYlRSe0AVnzT5EGFH03sfyQyvAucV_V8pfn1KE976Q429NIf3mf9QVpwtLMmksxc5OPTQ"
            };
            FishaoFscModelManager.paymentExtension.bfgPayment(data.sku,data.receipt,PlatformManager.bfgPlatform.getWrappingID(),function(resp:ServerResp):void
            {
               GameSwf.paymentCallback(resp);
            });
         },"text bfg payment");
         Cc.addSlashCommand("send",function():void
         {
            var variables:URLVariables = new URLVariables();
            variables.log = Cc.getAllLog();
            var request:URLRequest = new URLRequest(Config.SERVER + "bug_report.php");
            request.data = variables;
            request.method = URLRequestMethod.POST;
            var loader:URLLoader = new URLLoader();
            loader.load(request);
         });
         Cc.addSlashCommand("listenenrs",function():void
         {
            Cc.log(Listeners.createListenersReport());
         });
         Cc.addSlashCommand("connectionInfo",function():void
         {
            Cc.log("Connection response time = " + FishaoFscModelManager.fscModel.getAverageTimeMS().toFixed(2) + " ms for " + FishaoFscModelManager.fscModel.getAverageCount().toFixed(2) + " requests");
         });
         Cc.logch(GameSwf.LOADING_CHANNEL,"1. Main.init()");
         Cc.logch(GameSwf.LOADING_CHANNEL,"UpdateManager.init()");
         Cc.addSlashCommand("error",function():void
         {
            setTimeout(function():void
            {
               throw new Error("Test error");
            },1000);
         });
         Cc.addSlashCommand("suspendLocation",function():void
         {
            GameSwf.currentLocationDialog.suspend(null);
         });
         Cc.addSlashCommand("wakeupLocation",function():void
         {
            gameSwfInstance.closeSublocationDialog();
         });
         Cc.addSlashCommand("showFishingTimes",function(value:Boolean):void
         {
            Config.showFishingTimes = value;
         });
         Cc.addSlashCommand("obstacleCheat",function(value:int):void
         {
            Config.OBSTACLE_CHEAT = Boolean(value);
         });
         Cc.addSlashCommand("charSin",function(value:Number):void
         {
            KeyboardMoveStrategy.SIN_45 = value;
         });
         Cc.addSlashCommand("fps",function(value:Number):void
         {
            GameSwf.stage.frameRate = value;
         });
         Cc.addSlashCommand("showFishEmoticon",function(value:Number):void
         {
            var locationUser:LocationUser = null;
            if(GameSwf.currentLocationDialog != null && GameSwf.currentLocationDialog.isActive())
            {
               if(GameSwf.currentLocationDialog.locationModel != null)
               {
                  locationUser = GameSwf.currentLocationDialog.locationModel.getLocationUser(app.user.username);
                  if(locationUser != null)
                  {
                     if(value == 1)
                     {
                        locationUser.fieldChar.showSmallEmoticon();
                     }
                     else if(value == 2)
                     {
                        locationUser.fieldChar.showMediumEmoticon();
                     }
                     else if(value == 3)
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
         });
         Cc.addSlashCommand("isShinyAvailable",function():void
         {
            Cc.log("Shiny feature available: " + GameSwf.instance.managerFeatures.isFeatureEnabled(EUserFeature.EUF_SHINY_FISH));
         });
         Cc.addSlashCommand("showMissionCompleteDialog",function():void
         {
            var missionCompletedDialog:MissionCompletedSwfDialog = null;
            if(app.user.completedMissionData.length)
            {
               missionCompletedDialog = app.dialogFactory.getMissionCompletedSwfDialog();
               missionCompletedDialog.setMission(new Mission(app.user.completedMissionData.pop()));
               missionCompletedDialog.show();
            }
         });
         Cc.addSlashCommand("postOnWallNk1",function():void
         {
            var platform:IPlatform = PlatformManager.platform;
            if(platform is PlatformBase)
            {
               (platform as PlatformBase).postOnWall("Level up! blabla");
            }
         });
         Cc.addSlashCommand("chatTest",function():void
         {
            var chatMessage:Function = function(... messages):void
            {
               FishaoFscModelManager.chatFscExtension.sendPublicMessage(messages.join(" "));
            };
            chatMessage(1);
            chatMessage(2);
            chatMessage(3);
            chatMessage(4);
            chatMessage(5);
            setTimeout(function():void
            {
               chatMessage(6);
               chatMessage(7);
               chatMessage(8);
               chatMessage(9);
               chatMessage(10);
            },500);
            setTimeout(function():void
            {
               chatMessage(11);
               chatMessage(12);
               chatMessage(13);
               chatMessage(14);
               chatMessage(15);
            },2000);
            setTimeout(function():void
            {
               chatMessage(16);
               chatMessage(17);
               chatMessage(18);
               chatMessage(19);
               chatMessage(20);
            },5000);
         });
         Cc.addSlashCommand("visit",function(value:*):void
         {
            gameSwfInstance.enterPrivateHouse(value);
         });
         Cc.addSlashCommand("reduceBreedingTime",function(value:*):void
         {
         });
         Cc.addSlashCommand("startTradeWithVasiliy",function():void
         {
            GameSwf.instance.managerTrade.startTradeWith("Vasiliy",ETradeType.ETT_NPC);
         });
         Cc.addSlashCommand("enterSublocation",function(value:int):void
         {
            GameSwf.instance.enterToSublocation(value,-1);
         });
      }
   }
}
