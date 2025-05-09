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

export default class UiAbility06 extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility06 onCreate');
    commonEventManager.publish('ACTS_LIFE_CYCLE', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility06 publish ACTS_LIFE_CYCLE');
    });
    globalThis.uiAbilityContext6 = this.context
    hilog.info(0x0000, 'testTag', '%{public}s', `UiAbility06 want is, ${JSON.stringify(want)}`);
  }

  onDestroy() {
    console.info('UiAbility06 onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility06 onWindowStageCreate');
    commonEventManager.publish('ACTS_LIFE_CYCLE', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility06 publish ACTS_LIFE_CYCLE');
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
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility06 onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility06 onForeground');
    commonEventManager.publish('ACTS_LIFE_CYCLE', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility06 publish ACTS_LIFE_CYCLE');
    });
    commonEventManager.publish('ACTS_TEST_START03', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility06 publish ACTS_TEST_START03');
    });
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility06 onBackground');
    commonEventManager.publish('ACTS_LIFE_CYCLE', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility06 publish ACTS_LIFE_CYCLE');
    });
    let options = {
      parameters: {
        result: 'onBackground'
      }
    };
    commonEventManager.publish('ACTS_TEST_ONBACKGROUND', options, function () {
      console.info('UiAbility05 publish ACTS_TEST_ONBACKGROUND');
      globalThis.uiAbilityContext6.terminateSelf();
    });
  }
}
