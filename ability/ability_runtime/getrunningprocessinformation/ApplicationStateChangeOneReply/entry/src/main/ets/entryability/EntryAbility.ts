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
const ONE_SECOND = 1000;
const FIVE_HUNDRED_MILLISECOND = 500;
const VALID_STATE = 1;
const INVALID_STATE = -1;
const TAG = 'StateChangeTestTAG';
let commonStateArr: number[] = [-1, -1, -1, -1];
let commonEventData = {
  parameters: {
    commonStateArr: commonStateArr
  }
};
let onForeGroundTAG = INVALID_STATE;
let applicationStateChangeCallbackFir = {
  onApplicationForeground() {
    console.log(TAG, 'applicationStateChangeCallbackFir onApplicationForeground');
    commonEventData.parameters.commonStateArr[0] = VALID_STATE;

    setTimeout(() => {
      console.info('Enter onApplicationForeground publish!');
      commonEvent.publish('processState', commonEventData, (err) => {
        console.info('====>processState publish err: ' + JSON.stringify(err));
      });
    }, ONE_SECOND);
  },
  onApplicationBackground() {
    console.log(TAG, 'applicationStateChangeCallbackFir onApplicationBackground');
    commonEventData.parameters.commonStateArr[1] = VALID_STATE;

    if (globalThis.want.action === 'NeedBackGroundOff' || globalThis.want.action === 'MultiAppRegister' ||
    globalThis.want.action === 'DoubleRegisterOff') {
      console.info('entered needbackgroundoff!');
      globalThis.applicationContext.off('applicationStateChange', applicationStateChangeCallbackFir);
    }
  }
};

let applicationStateChangeCallbackSec = {
  onApplicationForeground() {
    console.log(TAG, 'applicationStateChangeCallbackSec onApplicationForeground');
    commonEventData.parameters.commonStateArr[2] = VALID_STATE;
  },
  onApplicationBackground() {
    console.log(TAG, 'applicationStateChangeCallbackSec onApplicationBackground');
    commonEventData.parameters.commonStateArr[3] = VALID_STATE;
    if (globalThis.want.action === 'doubleNeedBackGroundOff') {
      setTimeout(() => {
        globalThis.applicationContext.off('applicationStateChange', applicationStateChangeCallbackSec);
      }, FIVE_HUNDRED_MILLISECOND);
    }
    else if (globalThis.want.action === 'DoubleRegisterOff') {
      setTimeout(() => {
        console.info('entered DoubleRegisterOff');
        globalThis.applicationContext.off('applicationStateChange');
      }, FIVE_HUNDRED_MILLISECOND);
    }
  }
}
export default class EntryAbility extends Ability {
  onCreate(want, launchParam) {
    onForeGroundTAG = INVALID_STATE;
    for (let i = 0; i < 4; i++) {
      commonStateArr[i] = INVALID_STATE;
    }
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
    globalThis.abilityContext = this.context;
    globalThis.want = want;
    globalThis.applicationContext = this.context.getApplicationContext();
    if (globalThis.want.action === 'RegisterOnOffOn') {
      globalThis.applicationContext.on('applicationStateChange', applicationStateChangeCallbackFir);
      globalThis.applicationContext.off('applicationStateChange', applicationStateChangeCallbackFir);
    }
    globalThis.applicationContext.on('applicationStateChange', applicationStateChangeCallbackFir);
    if (globalThis.want.action === 'doubleRegister' || globalThis.want.action === 'doubleNeedBackGroundOff'
    || globalThis.want.action === 'DoubleRegisterOff') {
      console.info('double in action is logic entered!');
      globalThis.applicationContext.on('applicationStateChange', applicationStateChangeCallbackSec);
    }
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
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Abilityone onForeground');
    onForeGroundTAG++;
    if (onForeGroundTAG === VALID_STATE && (globalThis.want.action === 'NeedBackGroundOff' || globalThis.want.action === 'MultiAppRegister'
    || globalThis.want.action === 'DoubleRegisterOff')) {
      setTimeout(() => {
        commonEvent.publish('processState', commonEventData, (err) => {
          console.info('====>processState publish err: ' + JSON.stringify(err));
        })
      }, 2000);
    }
  }

  onBackground() {
    // Ability has back to background
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Abilityone onBackground');
  }
}
