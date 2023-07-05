import hilog from '@ohos.hilog';
import Ability from '@ohos.app.ability.UIAbility'
import Window from '@ohos.window'
import commonEvent from '@ohos.commonEvent'

let commonStateArr: number[] = [2,2,2,3,3,3]
let commonEventData={
    parameters:{
        "commonStateArr": commonStateArr
    }
}
let TAG = 'Runningprocessinformation'

export default class EntryAbility extends Ability {
    onCreate(want, launchParam) {
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
        hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
        hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');

        globalThis.want = want
        globalThis.abilityContext = this.context
        globalThis.applicationContext = this.context.getApplicationContext();

        if (globalThis.want.action == 'Callback') {
            globalThis.applicationContext.getRunningProcessInformation((err,data) => {
                if (err) {
                    console.log(TAG,`getRunningProcessInformation err: ` + JSON.stringify(err));
                }
                else {
                    console.log(TAG,'Oncreate Callback State: ' + JSON.stringify(data[0].state));
                    commonStateArr[0] = data[0].state
                }
            })
        }
        else if (globalThis.want.action == 'Promise') {
            globalThis.applicationContext.getRunningProcessInformation().then((data) => {
                console.log(TAG,'Oncreate Promise State: ' + JSON.stringify(data[0].state));
                commonStateArr[0] = data[0].state
            }).catch((err) => {
                console.log(TAG,`getRunningProcessInformation err: ` + JSON.stringify(err));
            });
        }
    }

    onDestroy() {
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');

        if (globalThis.want.action == 'Callback') {
            globalThis.applicationContext.getRunningProcessInformation((err,data) => {
                if (err) {
                    console.log(TAG,'Ondestroy Callback State: ' + JSON.stringify(err));
                }
                else {
                    console.log(TAG,'Ondestroy Callback State: ' + JSON.stringify(data[0].state));
                    commonStateArr[5] = data[0].state

                    commonEvent.publish('processState',commonEventData, (err) => {
                        console.info("====>processState publish err: " + JSON.stringify(err))
                    })
                }
            })
        }
        else if (globalThis.want.action == 'Promise') {
            globalThis.applicationContext.getRunningProcessInformation().then((data) => {
                console.log(TAG,'Ondestroy Promise State: ' + JSON.stringify(data[0].state));
                commonStateArr[5] = data[0].state
                commonEvent.publish('processState',commonEventData, (err) => {
                    console.info("====>processState publish err: " + JSON.stringify(err))
                })
            }).catch((err) => {
                console.log(TAG,`getRunningProcessInformation err: ` + JSON.stringify(err));
            });
        }
    }
    onWindowStageCreate(windowStage: Window.WindowStage) {
        // Main window is created, set main page for this ability
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

        if (globalThis.want.action == 'Callback') {
            globalThis.applicationContext.getRunningProcessInformation((err,data) => {
                if (err) {
                    console.log(TAG,`getRunningProcessInformation err: ` + JSON.stringify(err));
                }
                else {
                    console.log(TAG,'Onwindowstagecreate Callback State: ' + JSON.stringify(data[0].state));
                    commonStateArr[1] = data[0].state
                }
            })
        }
        else if (globalThis.want.action == 'Promise') {
            globalThis.applicationContext.getRunningProcessInformation().then((data) => {
                console.log(TAG,'Onwindowstagecreate Promise State: ' + JSON.stringify(data[0].state));
                commonStateArr[1] = data[0].state
            }).catch((err) => {
                console.log(TAG,`getRunningProcessInformation err: ` + JSON.stringify(err));
            });
        }

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

    async onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');

        if (globalThis.want.action == 'Callback') {
            globalThis.applicationContext.getRunningProcessInformation((err,data) => {
                if (err) {
                    console.log(TAG,`getRunningProcessInformation err: ` + JSON.stringify(err));
                }
                else {
                    console.log(TAG,'Onwindowstagedestroy Callback State: ' + JSON.stringify(data[0].state));
                    commonStateArr[4] = data[0].state
                }
            })
        }
        else if (globalThis.want.action == 'Promise') {
            await globalThis.applicationContext.getRunningProcessInformation().then((data) => {
                console.log(TAG,'Onwindowstagedestroy Promise State: ' + JSON.stringify(data[0].state));
                commonStateArr[2] = data[4].state
            }).catch((err) => {
                console.log(TAG,`getRunningProcessInformation err: ` + JSON.stringify(err));
            });
        }
    }

    async onForeground() {
        // Ability has brought to foreground
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');

        if (globalThis.want.action == 'Callback') {
           globalThis.applicationContext.getRunningProcessInformation((err,data) => {
                if (err) {
                    console.log(TAG,`getRunningProcessInformation err: ` + JSON.stringify(err));
                }
                else {
                    console.log(TAG,'Onforeground Callback State: ' + JSON.stringify(data[0].state));
                    commonStateArr[2] = data[0].state
                    globalThis.abilityContext.terminateSelf((err) => {
                        console.log(TAG,'terminateSelf result:' + JSON.stringify(err));
                    });
                }
            })
        }
        else if (globalThis.want.action == 'Promise') {
            await globalThis.applicationContext.getRunningProcessInformation().then((data) => {
                console.log(TAG,'Onforeground Promise State: ' + JSON.stringify(data[0].state));
                commonStateArr[2] = data[0].state
            }).catch((err) => {
                console.log(TAG,`getRunningProcessInformation err: ` + JSON.stringify(err));
            });
        }
        await setTimeout(() => {
            globalThis.abilityContext.terminateSelf((err) => {
                console.log(TAG,'terminateSelf result:' + JSON.stringify(err));
            });
        },4000)
    }

    async onBackground() {
        // Ability has back to background
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
        if (globalThis.want.action == 'Callback') {
            globalThis.applicationContext.getRunningProcessInformation((err,data) => {
                if (err) {
                    console.log(TAG,`getRunningProcessInformation err: ` + JSON.stringify(err));
                }
                else {
                    console.log(TAG,'Onbackground Callback State: ' + JSON.stringify(data[0].state));
                    commonStateArr[3] = data[0].state
                }
            })
        }
//        else if (globalThis.want.action == 'Promise') {
            await globalThis.applicationContext.getRunningProcessInformation().then((data) => {
                console.log(TAG,'Onbackground Promise State: ' + JSON.stringify(data[0].state));
                commonStateArr[3] = data[0].state
            }).catch((err) => {
                console.log(TAG,`getRunningProcessInformation err: ` + JSON.stringify(err));
            });
//        }
    }
}
