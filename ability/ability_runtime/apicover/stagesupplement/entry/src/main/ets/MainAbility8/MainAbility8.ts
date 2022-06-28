import Ability from '@ohos.application.Ability'
import commonEvent from '@ohos.commonEvent';

var printLog8 = "Stage:MainAbility8:";
var listPush8 = "Stage_MainAbility8_";
export default class MainAbility8 extends Ability {
    onCreate(want, launchParam) {
        console.info(printLog8 + "onCreate = " + want.flags)

        var flags = {
            parameters: {
                flags: want.flags
            }
        }
        commonEvent.publish(listPush8 + "onCreate", flags, (err) => {
            console.info(printLog8 + listPush8 + "onCreate");
        });

        setTimeout(()=>{
            this.context.terminateSelf().then((data) => {
                console.info(printLog8 + "terminateSelf data = " + JSON.stringify(data));
            }).catch((err) => {
                console.info(printLog8 + "terminateSelf err = " + JSON.stringify(err));
            });
        }, 3000)
    }

    onDestroy() {
        console.info(printLog8 + "onDestroy")

        commonEvent.publish(listPush8 + "onDestroy", (err) => {
            console.info(printLog8 + listPush8 + "onDestroy");
        });
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.info(printLog8 + "onWindowStageCreate")

        windowStage.setUIContent(this.context, "pages/index", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.info(printLog8 + "onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.info(printLog8 + "onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.info(printLog8 + "onBackground")
    }
};
