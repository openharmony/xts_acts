import hilog from '@ohos.hilog';
import Ability from '@ohos.app.ability.UIAbility'
import Window from '@ohos.window'
import commonEvent from '@ohos.commonEvent'


let TAG = 'getRunningProcess'
let commonStateArr
let commonEventData = {
    parameters:{
        commonStateArr: commonStateArr
    }
}
let ApplicationStateChangeCallbackFir = {
    onApplicationForeground() {
        console.log(TAG,'ApplicationStateChangeCallbackFir onApplicationForeground')
    },
    onApplicationBackground() {
        console.log(TAG,'ApplicationStateChangeCallbackFir onApplicationBackground')
        setTimeout(() => {
            console.info('Enter onApplicationForeground publish!')
            commonEventData.parameters.commonStateArr = 1
            commonEvent.publish('processState',commonEventData, (err) => {
                console.info("====>processState publish err: " + JSON.stringify(err))
            })
        },1000)
    }
}
let ForegroundTAG = -1
export default class EntryAbility extends Ability {
    onCreate(want, launchParam) {
        ForegroundTAG = -1
        commonEventData.parameters.commonStateArr = -1
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
        hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
        hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
        globalThis.abilityContext1 = this.context
        globalThis.want1 = want
        globalThis.applicationContext1 = this.context.getApplicationContext();
        globalThis.applicationContext1.on('applicationStateChange', ApplicationStateChangeCallbackFir)

    }

    onDestroy() {
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    }

    onWindowStageCreate(windowStage: Window.WindowStage) {
        // Main window is created, set main page for this ability
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

        windowStage.loadContent('pages/Index', (err, data) => {
            if (err.code) {
                hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.ERROR);
                hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
                return;
            }
            hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
            hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
        });
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
    }

    onForeground() {
        // Ability has brought to foreground
        ForegroundTAG++
        if(ForegroundTAG == 1) {
            setTimeout(() => {
                commonEvent.publish('processState',commonEventData, (err) => {
                    console.info("====>processState publish err: " + JSON.stringify(err))
                })
            },3000)

        }
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    }

    onBackground() {
        // Ability has back to background
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
    }
}
