import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';

globalThis.StartServiceAbility = () => {
  let want = {
    'deviceId': '',
    'bundleName': 'com.acts.attachdebugextensiontest',
    'abilityName': 'ServiceExtAbility'
  };
  globalThis.abilityContext.startServiceExtensionAbility(want, (error) => {
    console.log("Start service extension ability:  " + JSON.stringify(error))
  })
};

globalThis.StartServiceAbilityAbnormally = () => {
  let want = {
    'deviceId': '',
    'bundleName': 'com.acts.attachdebugextensiontest',
    'abilityName': 'ServiceExtAbility',
    'action': 'abnormal'
  };
  globalThis.abilityContext.startServiceExtensionAbility(want, (error) => {
    console.log("Start service extension ability abnormally:  " + JSON.stringify(error))
  })
}

globalThis.StopServiceAbility = () => {
  let want = {
    'deviceId': '',
    'bundleName': 'com.acts.attachdebugextensiontest',
    'abilityName': 'ServiceExtAbility'
  };
  globalThis.abilityContext.stopServiceExtensionAbility(want, (error) => {
    console.log("Stop service extension ability:  " + JSON.stringify(error));
  })
};

globalThis.StartAbility = () => {
  let want = {
    'deviceId': '',
    'bundleName': 'com.acts.attachdebugextensiontest',
    'abilityName': 'EntryAbility'
  };
  globalThis.abilityContext.startAbility(want, (error) => {
    console.log("Start UIAbility: " + JSON.stringify(error));
  })
}

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    globalThis.abilityContext = this.context;
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
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

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
