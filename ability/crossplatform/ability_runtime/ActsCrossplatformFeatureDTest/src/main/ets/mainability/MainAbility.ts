import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';

export default class MainAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.log('testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy() {
    console.log('testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.log('testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err:BusinessError) => {
      if (err.code) {
        console.log('testTag', '%{public}s', 'Ability onWindowStageCreate');
        return;
      }
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log('testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    console.log('testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    console.log('testTag', '%{public}s', 'Ability onBackground');
  }
}
