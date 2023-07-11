import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';

export default class MainAbility extends UIAbility {
    onCreate(want, launchParam) {
        globalThis.commonList1 = [];
        console.log('testTag', '%{public}s', 'Ability onCreate');
        globalThis.commonList1.push('common MainAbility onCreate');
    }

    onDestroy() {
        console.log('testTag', '%{public}s', 'Ability onDestroy');
        globalThis.commonList1.push('common MainAbility onDestroy');
    }

    onWindowStageCreate(windowStage: window.WindowStage) {
        // Main window is created, set main page for this ability
        console.log('testTag', '%{public}s', 'Ability onWindowStageCreate');
        globalThis.commonList1.push('common MainAbility onWindowStageCreate');
        globalThis.commonAbilityContext = this.context;

        windowStage.loadContent('pages/Index', (err, data) => {
            if (err.code) {
                console.log('testTag', '%{public}s', 'Ability onWindowStageCreate');
                return;
            }
            console.log('testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
        });
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log('testTag', '%{public}s', 'Ability onWindowStageDestroy');
        globalThis.commonList1.push('common MainAbility onWindowStageDestroy');
    }

    onForeground() {
        // Ability has brought to foreground
        console.log('testTag', '%{public}s', 'Ability onForeground');
        globalThis.commonList1.push('common MainAbility onForeground');
        setTimeout(function () {
            console.log("[Demo] MainAbility onForeground after 1500ms")
            globalThis.commonAbilityContext.terminateSelf()
                .then((data) => {
                    console.info('[Demo] MainAbility terminateself succeeded: ' + data);
                }).catch((error) => {
                console.error('[Demo] MainAbility terminateself failed. Cause: ' + error);
            })
        }, 1500);
    }

    onBackground() {
        // Ability has back to background
        console.log('testTag', '%{public}s', 'Ability onBackground');
        globalThis.commonList1.push('common MainAbility onBackground');
    }
}
