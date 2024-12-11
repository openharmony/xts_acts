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
import application from '@ohos.app.ability.application';
import commonEventManager from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';

export function getContextEntry(): common.UIAbilityContext {
  let context = AppStorage.get('context') as common.UIAbilityContext;
  console.info('getContext is ' + context);
  return context;
}

export default class MultipleAbility extends UIAbility {
  onCreate(want, launchParam) {
    console.info('====> testTag  MultipleAbility start');
    try {
      hilog.info(0x0000, 'testTag', 'Ability onCreate');
      let context1 = application.getApplicationContext();
      hilog.info(0x0000, 'testTag', 'context1: %{public}s', JSON.stringify(context1));
      let context2 = getContextEntry().getApplicationContext();
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
        commonEventManager.publish('0600', (err, data)=>{
          hilog.info(0x0000, 'testTag', 'customData, 0600 msg, err=' + JSON.stringify(err));
          hilog.info(0x0000, 'testTag', 'customData, 0600 msg, data=' + JSON.stringify(data));
        })
      } else {
        hilog.info(0x0000, 'testTag', 'context1 failed');
      }
    } catch (err) {
      hilog.info(0x0000, 'testTag', 'context1: %{public}s', JSON.stringify(err));
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

  async onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
