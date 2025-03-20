/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { commonEventManager } from '@kit.BasicServicesKit';

export default class applicationContext05 extends UIAbility {
  onCreate(want) {
    console.info('applicationContext05 onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    globalThis.applicationContext05 = this.context
    console.info('applicationContext05 JSON.stringify(want) is', JSON.stringify(want));
    console.info('applicationContext05 JSON.stringify(want) is', JSON.stringify(want.parameters));
  };


  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.info('applicationContext05 onWindowStageCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    windowStage.loadContent('testability/pages/UiAbility12', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
    globalThis.applicationContext05.terminateSelfWithResult(
      {
        resultCode: 100,
        want: {
          parameters: {
            keyString: 'NextCase',
          }
        }
      }, () => {
      console.log("====>terminateSelfWithResult success====>")
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    console.info('applicationContext05 onForeground');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    console.info('applicationContext05 onBackground');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
