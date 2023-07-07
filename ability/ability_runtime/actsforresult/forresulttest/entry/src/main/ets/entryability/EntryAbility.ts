import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    console.info("====>another EntryAbility");

    if(want.action == 'AsyncCallback_0200') {
      console.info("====>EntryAbility want.action == 'AsyncCallback_0200':");
      AppStorage.SetOrCreate('want', {
        action: "AsyncCallback_0200",
        bundleName: 'com.example.forresulttestsecond',
        abilityName: 'UIExtAbility'
      });
    }

    if(want.action == 'AsyncCallback_0300') {
      console.info("====>EntryAbility want.action == 'AsyncCallback_0300':");
      AppStorage.SetOrCreate('want', {
        action: "AsyncCallback_0300",
        bundleName: 'com.example.forresulttestsecond',
        abilityName: 'UIExtAbility'
      });
    }

    if(want.action == 'Promise_0200') {
      console.info("====>EntryAbility want.action == 'Promise_0200':");
      AppStorage.SetOrCreate('want', {
        action: "Promise_0200",
        bundleName: 'com.example.forresulttestsecond',
        abilityName: 'UIExtAbility'
      });
    }
    if(want.action == 'Promise_0300') {
      console.info("====>EntryAbility want.action == 'Promise_0300':");
      AppStorage.SetOrCreate('want', {
        action: "Promise_0300",
        bundleName: 'com.example.forresulttestsecond',
        abilityName: 'UIExtAbility'
      });
    }
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
