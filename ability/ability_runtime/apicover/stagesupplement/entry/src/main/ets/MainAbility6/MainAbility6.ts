import Ability from '@ohos.application.Ability'
import commonEvent from '@ohos.commonEvent';

var printLog6 = "Stage:MainAbility6:";
var listPush6 = "Stage_MainAbility6_";
export default class MainAbility6 extends Ability {
    onCreate(want, launchParam) {
        console.info(printLog6 + "onCreate = " + want.flags)

        var flags = {
            parameters: {
                flags: want.flags
            }
        }
        commonEvent.publish(listPush6 + "onCreate", flags, (err) => {
            console.info(printLog6 + listPush6 + "onCreate");
        });

        setTimeout(()=>{
            this.context.terminateSelf().then((data) => {
                console.info(printLog6 + "terminateSelf data = " + JSON.stringify(data));
            }).catch((err) => {
                console.info(printLog6 + "terminateSelf err = " + JSON.stringify(err));
            });
        }, 3000)
    }

    onDestroy() {
        console.info(printLog6 + "onDestroy")

        commonEvent.publish(listPush6 + "onDestroy", (err) => {
            console.info(printLog6 + listPush6 + "onDestroy");
        });
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.info(printLog6 + "onWindowStageCreate")

        windowStage.setUIContent(this.context, "pages/index", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.info(printLog6 + "onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.info(printLog6 + "onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.info(printLog6 + "onBackground")
    }
};
