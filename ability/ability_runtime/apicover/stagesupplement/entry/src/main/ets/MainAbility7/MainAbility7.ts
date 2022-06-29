import Ability from '@ohos.application.Ability'
import commonEvent from '@ohos.commonEvent';

var printLog7 = "Stage:MainAbility7:";
var listPush7 = "Stage_MainAbility7_";
export default class MainAbility7 extends Ability {
    onCreate(want, launchParam) {
        console.info(printLog7 + "onCreate = " + want.flags)

        var flags = {
            parameters: {
                flags: want.flags
            }
        }
        commonEvent.publish(listPush7 + "onCreate", flags, (err) => {
            console.info(printLog7 + listPush7 + "onCreate");
        });

        setTimeout(()=>{
            this.context.terminateSelf().then((data) => {
                console.info(printLog7 + "terminateSelf data = " + JSON.stringify(data));
            }).catch((err) => {
                console.info(printLog7 + "terminateSelf err = " + JSON.stringify(err));
            });
        }, 3000)
    }

    onDestroy() {
        console.info(printLog7 + "onDestroy")

        commonEvent.publish(listPush7 + "onDestroy", (err) => {
            console.info(printLog7 + listPush7 + "onDestroy");
        });
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.info(printLog7 + "onWindowStageCreate")

        windowStage.setUIContent(this.context, "pages/index", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.info(printLog7 + "onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.info(printLog7 + "onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.info(printLog7 + "onBackground")
    }
};
