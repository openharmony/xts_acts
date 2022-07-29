import Ability from '@ohos.application.Ability'

export default class TestAbility extends Ability {
    onCreate(want, launchParam) {
        console.log('TestAbility onCreate')
    }

    onDestroy() {
        console.log('TestAbility onDestroy')
    }

    onWindowStageCreate(windowStage) {
        console.log('TestAbility onWindowStageCreate')
        windowStage.loadContent("TestAbility/pages/index", (err, data) => {
            if (err.code) {
                console.error('Failed to load the content. Cause:' + JSON.stringify(err));
                return;
            }
            console.info('Succeeded in loading the content. Data: ' + JSON.stringify(data))
        });

        globalThis.abilityContext = this.context;
    }

    onWindowStageDestroy() {
        console.log('TestAbility onWindowStageDestroy')
    }

    onForeground() {
        console.log('TestAbility onForeground')
    }

    onBackground() {
        console.log('TestAbility onBackground')
    }
};