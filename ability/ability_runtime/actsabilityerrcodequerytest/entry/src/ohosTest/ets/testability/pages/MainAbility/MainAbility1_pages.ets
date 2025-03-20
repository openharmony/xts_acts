import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';

const TAG: string = '[Page_UIAbilityComponentsInteractive]';
const DOMAIN_NUMBER: number = 0xFF00;

@Entry
@Component
struct Page_UIAbilityComponentsInteractive {
  build() {
    Button('startAbilityForResult button')
      .onClick(() => {
        let context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext; // UIAbilityContext
        let want: Want = {
          deviceId: '',
          bundleName: 'com.test.actssuppressstartuptest',
          abilityName: 'MainAbility2',
        };
        context.startAbilityForResult(want).then((data) => {
          console.log(`success to start ability for result`)
        }).catch((err: BusinessError) => {
          hilog.error(DOMAIN_NUMBER, TAG, `Failed to start ability for result. Code is ${err.code}, message is ${err.message}`);
        });
      })
  }
}
