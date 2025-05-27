/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
import { commonEventManager } from '@kit.BasicServicesKit';

let testNum:number = 0;

export default class UiAbility08 extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 onCreate');
    commonEventManager.publish('UiAbility08_onCreate', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 publish UiAbility08_onCreate');
    });
    globalThis.uiAbilityContext8 = this.context
    hilog.info(0x0000, 'testTag', '%{public}s', `UiAbility08 want is, ${JSON.stringify(want)}`);
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 onDestroy');
    commonEventManager.publish('ACTS_TEST_DESTROY', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 publish ACTS_TEST_DESTROY');
    });
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 onWindowStageCreate');
    commonEventManager.publish('UiAbility08_onWindowStageCreate', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 publish UiAbility08_onWindowStageCreate');
    });
    windowStage.loadContent('testability/pages/UiAbility/UiAbility01', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });

  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 onWindowStageDestroy');
  }

  onForeground() {
    testNum++
    if (testNum === 1) {
      commonEventManager.publish('UiAbility08_onForeground_01', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 publish UiAbility08_onForeground_01');
      });
      try {
        globalThis.uiAbilityContext8.startAbility(
          {
            bundleName: 'com.acts.actsstartandterminateassisttest01',
            abilityName: 'AbilityTest01'
          }).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', `UiAbility08 start other hap AbilityTest01 end`);
        })
      } catch (err) {
        hilog.info(0x0000, 'testTag', '%{public}s', `UiAbility08 start other hap AbilityTest01 fail : ${err}`);
      }
    } else if (testNum === 2) {
      commonEventManager.publish('UiAbility08_onForeground_02', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 publish UiAbility08_onForeground_02');
      });
      setTimeout(() => {
        // destroy
        globalThis.uiAbilityContext8.terminateSelf();
      }, 500);
    };
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 onBackground');
    commonEventManager.publish('UiAbility08_onBackground', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility08 publish UiAbility08_onBackground');
    });
  }
}
