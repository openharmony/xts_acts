import Ability from '@ohos.app.ability.UIAbility';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import {FloatWindowFun} from '../pages/model/FloatWindowFun';
import BundleManager from '../pages/model/BundleMangerUtils';
import Base from '@ohos.base';
import notification from '@ohos.notificationManager';
import consts from '../pages/Notification/CommonEvent/model/Consts';
import surveillanceEventsManager from '../pages/Notification/CommonEvent/model/SurveillanceEventsManager';

export default class MainAbility extends Ability {
    onCreate(want, launchParam) {
        globalThis.dir=this.context.filesDir;
        console.log("[Demo] MainAbility onCreate")
        globalThis.abilityWant = want;
        globalThis.abilityContext = this.context;
        globalThis.showFloatingWindow = false;
        BundleManager.getAppList().then(appList =>{
            globalThis.appList = appList
        })
        let settings: Map<string, number> = new Map();
        surveillanceEventsManager.surveillanceEvents.forEach((element: string) => {
          settings.set(element, consts.ENABLE_STATE_ALWAYS);
        });
        globalThis.settings = settings;
    }

    onDestroy() {
        console.log("[Demo] MainAbility onDestroy")
    }

    onWindowStageCreate(windowStage) {

        console.log("[Demo] MainAbility onWindowStageCreate")
        let AtManager = abilityAccessCtrl.createAtManager();
        AtManager.requestPermissionsFromUser(this.context,["ohos.permission.READ_MEDIA", "ohos.permission.WRITE_MEDIA",
          "ohos.permission.CAPTURE_SCREEN", "ohos.permission.INTERNET", "ohos.permission.CAMERA",
          "ohos.permission.MICROPHONE", "ohos.permission.START_INVISIBLE_ABILITY",
          "ohos.permission.SYSTEM_FLOAT_WINDOW", "ohos.permission.GET_BUNDLE_INFO_PRIVILEGED",
          "ohos.permission.GET_INSTALLED_BUNDLE_LIST",
          "ohos.permission.MEDIA_LOCATION","ohos.permission.WRITE_IMAGEVIDEO","ohos.permission.READ_IMAGEVIDEO","ohos.permission.LOCATION", "ohos.permission.APPROXIMATELY_LOCATION"]).then(() => {})
          try {
            notification.requestEnableNotification((err: Base.BusinessError) => {
              if (err) {
                console.error(`requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.info("requestEnableNotification success");
              }
            });
          } catch (err) {
            console.info(`enableNotification err ${JSON.stringify(err)}`);
          }
          windowStage.loadContent("pages/index", (err, data) => {
            if (err.code) {
                console.error('Failed to load the content. Cause:' + JSON.stringify(err));
                return;
            }
            console.info('Succeeded in loading the content. Data: ' + JSON.stringify(data))
        });
        windowStage.getMainWindow((err, data) => {
            if (err.code) {
                return;
            }
            globalThis.mainWindow = data;
        });
    }

    onWindowStageDestroy() {
        console.log("[Demo] MainAbility onWindowStageDestroy")
    }

    onForeground() {
        FloatWindowFun.initAllFun();
        console.log("[Demo] MainAbility onForeground")
    }

    onBackground() {
        console.log("[Demo] MainAbility onBackground")
    }
};