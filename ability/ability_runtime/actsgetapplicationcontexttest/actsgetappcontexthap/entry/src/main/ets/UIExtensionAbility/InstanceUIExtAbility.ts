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
import { Configuration } from '@ohos.app.ability.Configuration';
import hilog from '@ohos.hilog';
import UIExtensionAbility from '@ohos.app.ability.UIExtensionAbility';
import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession';
import Want from '@ohos.app.ability.Want';
import application from '@ohos.app.ability.application';
import commonEventManager from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';

const TAG: string = 'InstanceUIExtAbility'
let count: boolean = true;

export function getContextEntry(): common.UIAbilityContext {
  let context = AppStorage.get('context') as common.UIAbilityContext;
  console.info('getContext is ' + context);
  return context;
}

export default class InstanceUIExtAbility extends UIExtensionAbility {
  onCreate(launchParam: AbilityConstant.LaunchParam): void {
    console.log(TAG, `onCreate`);
    if(count)
    {
      try {
        hilog.info(0x0000, 'testTag', 'Ability onCreate');
        let context1 = application.getApplicationContext();
        hilog.info(0x0000, 'testTag', 'context1: 0800 %{public}s', JSON.stringify(context1));
        if (context1.applicationInfo.name == 'com.example.getapplicationcontexthap') {
          commonEventManager.publish('0800', (err, data)=>{
            hilog.info(0x0000, 'testTag', 'customData, 0800 msg, err=' + JSON.stringify(err));
            hilog.info(0x0000, 'testTag', 'customData, 0800 msg, data=' + JSON.stringify(data));
          })
        } else {
          hilog.info(0x0000, 'testTag', 'context1 failed');
        }
      } catch (err) {
        hilog.info(0x0000, 'testTag', 'context1: %{public}s', JSON.stringify(err));
      }
      count = false;
    }
  }

  onDestroy(): void {
    console.log(TAG, `onDestroy`);
  }

  onForeground() {
    hilog.info(0x0000, TAG, '[%{public}s] %{public}s', TAG, 'onForeground');
  }

  onBackground() {
    hilog.info(0x0000, TAG, '[%{public}s] %{public}s', TAG, 'onBackground');
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    let storage: LocalStorage = new LocalStorage({
      'session': session
    });
    session.loadContent('pages/InstanceExtension', storage);
  }

  onConfigurationUpdate(newConfig: Configuration): void {
    hilog.info(0x0000, TAG, '[%{public}s] %{public}s newConfig: %{public}s ', TAG, 'onConfigurationUpdate', JSON.stringify(newConfig));
  }
}