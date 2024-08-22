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
import { BusinessError } from '@ohos.base';
import commonEventManager from '@ohos.commonEventManager';
import { Configuration } from '@ohos.app.ability.Configuration';
import hilog from '@ohos.hilog';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';

const TAG: string = 'AbilityA';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, TAG, '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(0x0000, TAG, '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, TAG, '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err: BusinessError) => {
      if (err.code) {
        hilog.error(0x0000, TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, TAG, 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, TAG, '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, TAG, '%{public}s', 'onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, TAG, '%{public}s', 'onBackground');
    commonEventManager.publish(
      'RelyA_Ability_OnBackground', (err: BusinessError) => {
      if (err) {
        hilog.info(0x0000, TAG,
          'RelyA_Ability_OnBackground publish failed, Cause: %{public}s', JSON.stringify(err) ?? '');
      } else {
        hilog.info(0x0000, TAG, '%{public}s', 'RelyA_Ability_OnBackground publish successful');
      }
    })
  }

  onConfigurationUpdate(newConfig: Configuration): void {
    hilog.info(0x0000, TAG, '%{public}s', 'onConfigurationUpdate');
    let publishData: commonEventManager.CommonEventPublishData = {
      parameters: newConfig
    };
    hilog.info(0x0000, TAG, 'publishData: %{public}s', JSON.stringify(publishData.parameters) ?? '');
    commonEventManager.publish(
      'RelyA_Ability_ConfigurationUpdateEvent', publishData, (err: BusinessError) => {
      if (err) {
        hilog.info(0x0000, TAG,
          'RelyA_Ability_ConfigurationUpdateEvent publish failed, Cause: %{public}s', JSON.stringify(err) ?? '');
      } else {
        hilog.info(0x0000, TAG, '%{public}s', 'RelyA_Ability_ConfigurationUpdateEvent publish successful');
      }
    });
  }
}
