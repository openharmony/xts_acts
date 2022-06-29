import Ability from '@ohos.application.Ability'
import commonEvent from '@ohos.commonEvent';
import AbilityConstant from '@ohos.application.AbilityConstant';
import distributedObject from '@ohos.data.distributedDataObject';
import accessControl from '@ohos.abilityAccessCtrl';
import bundle from '@ohos.bundle';

var BUNDLE_NAME = 'ohos.acts.aafwk.test.stagesupplement'
var PERMISSION_REJECT = -1
var printLog2 = "Stage:MainAbility2:";
var listPush2 = "Stage_MainAbility2_";
class ContentStorage {

}
var g_object = distributedObject.createDistributedObject({name:undefined});
export default class MainAbility2 extends Ability {
    contentStorage : ContentStorage
    sessionId : string;
    statusCallback(sessionId, networkid, status) {
        // @ts-ignore
        console.info(printLog2 + `continuation object status change, sessionId: ${sessionId}, status: ${status}, g_object.name: ${g_object.name}`)
    }
    onCreate(want, launchParam) {
        console.info(printLog2 + "onCreate = " + launchParam.launchReason)

        if (launchParam.launchReason == AbilityConstant.LaunchReason.CONTINUATION) {
            let input = want.parameters.input // get user data from want params
            // @ts-ignore
            AppStorage.SetOrCreate<string>('ContinueInput', input)
            console.info(printLog2 + `onCreate for continuation sessionId:  ${this.sessionId}`)

            this.contentStorage = new ContentStorage();
            this.context.restoreWindowStage(this.contentStorage);
        }
    }

    onDestroy() {
        console.info(printLog2 + "onDestroy")

        commonEvent.publish(listPush2 + "onDestroy", (err) => {
            console.info(printLog2 + listPush2 + "onDestroy");
        });
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.info(printLog2 + "onWindowStageCreate")

//        this.requestPermissions()
        windowStage.setUIContent(this.context, "pages/index", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.info(printLog2 + "onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.info(printLog2 + "onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.info(printLog2 + "onBackground")
    }

    onContinue(wantParam : {[key: string]: any}) {
        console.info(printLog2 + "onContinue")
        // set user input data into want params
        // @ts-ignore
        wantParam["input"] = AppStorage.Get<string>('ContinueInput');
        console.info(printLog2 + `onContinue input = ${wantParam["input"]}`);
        return AbilityConstant.OnContinueResult.AGREE
    }

    // @ts-ignore
    onNewWant(want, launchParam) {
        console.info(printLog2 + "onNewWant = " + launchParam.launchReason)

        if (launchParam.launchReason == AbilityConstant.LaunchReason.CONTINUATION) {
            // get distributed data object session id from want params
            this.sessionId = want.parameters.session
            // @ts-ignore
            g_object.name = undefined;
            // @ts-ignore
            g_object.on("status", this.statusCallback);
            // set session id, so it will sync data from remote device
            g_object.setSessionId(this.sessionId);

            this.contentStorage = new ContentStorage();
            this.context.restoreWindowStage(this.contentStorage);
        }
    }

    onWindowStageRestore(windowStage) {
        console.info(printLog2 + "onWindowStageCreate")
//        this.requestPermissions()

        commonEvent.publish(listPush2 + "onWindowStageRestore", (err) => {
            console.info(printLog2 + listPush2 + "onWindowStageRestore");
        });

        setTimeout(()=>{
            this.context.terminateSelf().then((data) => {
                console.info(printLog2 + "terminateSelf data = " + JSON.stringify(data));
            }).catch((err) => {
                console.info(printLog2 + "terminateSelf err = " + JSON.stringify(err));
            });
        }, 3000)
    }

    requestPermissions = async () => {
        let permissions: Array<string> = [
            "ohos.permission.DISTRIBUTED_DATASYNC"
        ];
        let needGrantPermission = false
        let accessManger = accessControl.createAtManager()
        console.info(printLog2 + "app permission get bundle info")
        let bundleInfo = await bundle.getApplicationInfo(BUNDLE_NAME, 0, 100)
        console.info(printLog2 + `app permission query permission ${bundleInfo.accessTokenId.toString()}`)
        for (const permission of permissions) {
            console.info(printLog2 + `app permission query grant status ${permission}`)
            try {
                let grantStatus = await accessManger.verifyAccessToken(bundleInfo.accessTokenId, permission)
                if (grantStatus === PERMISSION_REJECT) {
                    needGrantPermission = true
                    break;
                }
            } catch (err) {
                console.info(printLog2 + `app permission query grant status error ${permission} ${JSON.stringify(err)}`)
                needGrantPermission = true
                break;
            }
        }
        if (needGrantPermission) {
            console.info(printLog2 + "app permission needGrantPermission")
            try {
                await this.context.requestPermissionsFromUser(permissions)
            } catch (err) {
                console.info(printLog2 + `app permission ${JSON.stringify(err)}`)
            }
        } else {
            console.info(printLog2 + "app permission already granted")
        }
    }
};
