import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    console.info("====>another EntryAbility");

    if(want.action == 'AsyncCallback_0600') {
      console.info("====>EntryAbility want.action == 'AsyncCallback_0600':");
      AppStorage.SetOrCreate('want', {
        action: "AsyncCallback_0600",
        bundleName: 'com.example.forresulttestthrid',
        abilityName: 'UIExtAbility'
      });
    }

    if(want.action == 'AsyncCallback_0700') {
      console.info("====>EntryAbility want.action == 'AsyncCallback_0700':");
      AppStorage.SetOrCreate('want', {
        action: "AsyncCallback_0700",
        bundleName: 'com.example.forresulttestthrid',
        abilityName: 'UIExtAbility'
      });
    }





    if(want.action == 'Promise_0600') {
      console.info("====>EntryAbility want.action == 'Promise_0600':");
      AppStorage.SetOrCreate('want', {
        action: "Promise_0600",
        bundleName: 'com.example.forresulttestthrid',
        abilityName: 'UIExtAbility'
      });
    }

    if(want.action == 'Promise_0700') {
      console.info("====>EntryAbility want.action == 'Promise_0700':");
      AppStorage.SetOrCreate('want', {
        action: "Promise_0700",
        bundleName: 'com.example.forresulttestthrid',
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

  onNewWant(want, launchParams) {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');

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
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
