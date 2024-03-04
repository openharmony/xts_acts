/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import commonEvent from '@ohos.commonEventManager';

let setWant = (want) => {
  if (want.action === 'StartAbilityForResultAsCaller_0100') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.action == 'StartAbilityForResultAsCaller_0100':");
    AppStorage.SetOrCreate('want', {
      action: "StartAbilityForResultAsCaller_0100",
      bundleName: 'com.example.uiextensionforresultascaller',
      abilityName: 'UIExtAbility',
      parameters: {
        'ability.want.params.uiExtensionType': 'share'
      }
    });
  } else if (want.action === 'StartAbilityForResultAsCaller_0200') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.action == 'StartAbilityForResultAsCaller_0200':");
    AppStorage.SetOrCreate('want', {
      action: "StartAbilityForResultAsCaller_0200",
      bundleName: 'com.example.uiextensionforresultascaller',
      abilityName: 'UIExtAbility',
      parameters: {
        'ability.want.params.uiExtensionType': 'share'
      }
    });
  } else if (want.action === 'StartAbilityForResultAsCaller_0300') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.action == 'StartAbilityForResultAsCaller_0300':");
    AppStorage.SetOrCreate('want', {
      action: "StartAbilityForResultAsCaller_0300",
      bundleName: 'com.example.uiextensionforresultascaller',
      abilityName: 'UIExtAbility',
      parameters: {
        'ability.want.params.uiExtensionType': 'share'
      }
    });
  } else if (want.action === 'StartAbilityForResultAsCaller_0400') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.action == 'StartAbilityForResultAsCaller_0400':");
    AppStorage.SetOrCreate('want', {
      action: "StartAbilityForResultAsCaller_0400",
      bundleName: 'com.example.uiextensionforresultascaller',
      abilityName: 'UIExtAbility',
      parameters: {
        'ability.want.params.uiExtensionType': 'share'
      }
    });
  } else if (want.action === 'StartAbilityForResultAsCaller_0600') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.action == 'StartAbilityForResultAsCaller_0600':");
    AppStorage.SetOrCreate('want', {
      action: "StartAbilityForResultAsCaller_0600",
      bundleName: 'com.example.uiextensionforresultascaller',
      abilityName: 'UIExtAbility',
      parameters: {
        'ability.want.params.uiExtensionType': 'share'
      }
    });
  } else if (want.action === 'ohos.caller.test.action') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.type == '0600FromUIExtension':");
    let commonEventData = {
      parameters: {
        result: 0
      }
    }
    commonEvent.publish('0600', commonEventData, (err) => {
      console.debug('====>[UIExtensionForResultAsCallerUIAbility] 0600 publish err:' + JSON.stringify(err));
      globalThis.terminate('0600');
    })

  } else if (want.action === 'StartAbilityForResultAsCaller_0800') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.action == 'StartAbilityForResultAsCaller_0800':");
    AppStorage.SetOrCreate('want', {
      action: "StartAbilityForResultAsCaller_0800",
      bundleName: 'com.example.uiextensionforresultascaller',
      abilityName: 'UIExtAbility',
      parameters: {
        'ability.want.params.uiExtensionType': 'share'
      }
    });
  } else if (want.action === 'StartAbilityForResultAsCaller_0900') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.action == 'StartAbilityForResultAsCaller_0900':");
    AppStorage.SetOrCreate('want', {
      action: "StartAbilityForResultAsCaller_0900",
      bundleName: 'com.example.uiextensionforresultascallerbackground',
      abilityName: 'UIExtAbility',
      parameters: {
        'ability.want.params.uiExtensionType': 'share'
      }
    });
  } else if (want.action === 'StartAbilityForResultAsCaller_1100') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.action == 'StartAbilityForResultAsCaller_1100':");
    AppStorage.SetOrCreate('want', {
      action: "StartAbilityForResultAsCaller_1100",
      bundleName: 'com.example.uiextensionforresultascaller',
      abilityName: 'UIExtAbility',
      parameters: {
        'ability.want.params.uiExtensionType': 'share'
      }
    });
  } else if (want.action === 'StartAbilityForResultAsCaller_1300') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.action == 'StartAbilityForResultAsCaller_1300':");
    AppStorage.SetOrCreate('want', {
      action: "StartAbilityForResultAsCaller_1300",
      bundleName: 'com.example.uiextensionforresultascaller',
      abilityName: 'UIExtAbility',
      parameters: {
        'ability.want.params.uiExtensionType': 'share'
      }
    });
  }
}

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    console.info('====> [UIExtensionForResultAsCallerRely] onCreate.');
    globalThis.terminate = (str) => {
      this.context.terminateSelf().then(() => {
        console.info('====>terminateSelf' + JSON.stringify(str) + ' end');
      }).catch((err) => {
        console.info('====>terminateSelf ' + JSON.stringify(str) + ' err:' + JSON.stringify(err));
      });

    };
    setWant(want);
  }

  onNewWant(want, launchParam) {
    console.info('====> [UIExtensionForResultAsCallerRely] onNewWant.');
    setWant(want);
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
