import Ability from '@ohos.application.Ability'
export default class MainAbility extends Ability {
    onCreate(want, launchParam) {
        console.log("jws onCreate");
    }

    onDestroy() {
        console.log("jws onDestroy");
    }

    onWindowStageCreate(windowStage) {
        console.log("jws onWindowStageCreate");
    }

    onWindowStageDestroy() {
        console.log("jws onWindowStageDestroy");
    }

    onForeground() {
        console.log("jws onForeground");
    }

    onBackground() {
        console.log("jws onBackground");
    }

    call(){

    }
}