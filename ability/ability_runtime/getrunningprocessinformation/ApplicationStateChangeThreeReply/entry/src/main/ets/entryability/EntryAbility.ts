/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import Ability from '@ohos.app.ability.UIAbility';
import type Window from '@ohos.window';
import commonEvent from '@ohos.commonEvent';

const VALID_STATE = 1;
const INVALID_STATE = -1;
const TAG = 'getRunningProcess';
let commonStateArr;
let commonEventData = {
  parameters: {
    commonStateArr: commonStateArr
  }
};
let applicationStateChangeCallbackFir = {
  onApplicationForeground() {
    console.log(TAG, 'applicationStateChangeCallbackFir onApplicationForeground');
  },
  onApplicationBackground() {
    console.log(TAG, 'applicationStateChangeCallbackFir onApplicationBackground');
    console.info('Enter onApplicationForeground publish!');
    commonEventData.parameters.commonStateArr = VALID_STATE;
    commonEvent.publish('processState', commonEventData, (err) => {
    console.info('====>processState publish err: ' + JSON.stringify(err));
    });
  }
};
let foregroundTAG = INVALID_STATE;
export default class EntryAbility extends Ability {
  onCreate(want, launchParam) {
    foregroundTAG = INVALID_STATE;
    commonEventData.parameters.commonStateArr = INVALID_STATE;
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
    globalThis.abilityContext1 = this.context;
    globalThis.want1 = want;
    globalThis.applicationContext1 = this.context.getApplicationContext();
    globalThis.applicationContext1.on('applicationStateChange', applicationStateChangeCallbackFir);
  }

  onDestroy() {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: Window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.ERROR);
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    foregroundTAG++
    if (foregroundTAG === VALID_STATE) {
      commonEvent.publish('processState', commonEventData, (err) => {
          console.info('====>processState publish err: ' + JSON.stringify(err));
      })

    }
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
