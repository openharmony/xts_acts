import Ability from '@ohos.app.ability.UIAbility'
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import { Hypium } from '@ohos/hypium'
import testsuite from '../test/List.test'

export default class MainAbility extends Ability {
    onCreate(want, launchParam) {
        console.log('MainAbility onCreate')
    }

    onDestroy() {
        console.log('MainAbility onDestroy')
    }

    onWindowStageCreate(windowStage) {
        console.log('MainAbility onWindowStageCreate')
        windowStage.setUIContent(this.context, 'MainAbility/pages/index', null)
    }

    onWindowStageDestroy() {
        console.log('MainAbility onWindowStageDestroy')
    }

    onForeground() {
        console.log('MainAbility onForeground')
        setTimeout(()=>{
            this.context.terminateSelf().then((data) => {
                console.info("com.example.actsabilityusertest MainAbility terminateSelf data = " + JSON.stringify(data));
            }).catch((err) => {
                console.info("com.example.actsabilityusertest MainAbility terminateSelf err = " + JSON.stringify(err));
            });
        }, 2000)
    }

    onBackground() {
        console.log('MainAbility onBackground')
    }
};