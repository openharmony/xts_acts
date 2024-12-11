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

import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import hilog from '@ohos.hilog';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import { UIContext } from '@ohos.arkui.UIContext';
import application from '@ohos.app.ability.application';
import commonEventManager from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';

const DEFAULT_CODE = 0;
const SUCCESS_CODE = 1;
const FAILURE_CODE = -1;

let BUNDLE_NAME = 'com.example.getapplicationcontexthap'
let ABILITY_NAME = 'ServiceExtensionAbility'

export function getContextEntry(): common.UIAbilityContext {
  let context = AppStorage.get('context') as common.UIAbilityContext;
  console.info('getContext is ' + context);
  return context;
}

globalThis.StartServiceExtensionAbility = () => {
  console.log('testTag start service inner')
  globalThis.code = DEFAULT_CODE;
  globalThis.message = '';
  try {
    let want: Want = {
      deviceId: '',
      bundleName: BUNDLE_NAME,
      abilityName: ABILITY_NAME
    }
    globalThis.StartServiceExtensionAbility(want)
      .then(()=>{
        globalThis.code = SUCCESS_CODE;
      })
      .catch((err:BusinessError)=>{
        globalThis.code = FAILURE_CODE;
        console.error(`testTag startServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
      })
  } catch (err) {
    let message = (err as BusinessError).message;
    globalThis.message.append(message)
  }
}

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    AppStorage.link('uiContext')
    AppStorage.setOrCreate('context', this.context);
    try {
      hilog.info(0x0000, 'testTag', 'Ability onCreate');
      let context1 = application.getApplicationContext();
      hilog.info(0x0000, 'testTag', 'context1: %{public}s', JSON.stringify(context1));
      let context2 = this.context.getApplicationContext();
      hilog.info(0x0000, 'testTag', 'context2: %{public}s', JSON.stringify(context2));
      if (context1.applicationInfo.name == context2.applicationInfo.name &&
          context1.cacheDir == context2.cacheDir &&
          context1.tempDir == context2.tempDir &&
          context1.filesDir == context2.filesDir &&
          context1.databaseDir == context2.databaseDir &&
          context1.preferencesDir == context2.preferencesDir &&
          context1.bundleCodeDir == context2.bundleCodeDir &&
          context1.distributedFilesDir == context2.distributedFilesDir &&
          context1.resourceDir == context2.resourceDir &&
          context1.cloudFileDir == context2.cloudFileDir
      ) {
        commonEventManager.publish('0100', (err, data)=>{
          hilog.info(0x0000, 'testTag', 'customData, 0100 msg, err=' + JSON.stringify(err));
          hilog.info(0x0000, 'testTag', 'customData, 0100 msg, data=' + JSON.stringify(data));
        })
      } else {
        hilog.info(0x0000, 'testTag', 'context1 failed');
      }
    } catch (err) {
      hilog.info(0x0000, 'testTag', 'context1: %{public}s', JSON.stringify(err));
    }
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });

    let context1 = application.getApplicationContext();
    hilog.info(0x0000, 'testTag', 'context1: %{public}s', JSON.stringify(context1));
    commonEventManager.publish('0110', (err, data)=>{
      hilog.info(0x0000, 'testTag', 'customData, 0110 msg, err=' + JSON.stringify(err));
      hilog.info(0x0000, 'testTag', 'customData, 0110 msg, data=' + JSON.stringify(data));
    })
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    let context1 = application.getApplicationContext();
    hilog.info(0x0000, 'testTag', 'context1: %{public}s', JSON.stringify(context1));
    commonEventManager.publish('0120', (err, data)=>{
      hilog.info(0x0000, 'testTag', 'customData, 0120 msg, err=' + JSON.stringify(err));
      hilog.info(0x0000, 'testTag', 'customData, 0120 msg, data=' + JSON.stringify(data));
    })
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
