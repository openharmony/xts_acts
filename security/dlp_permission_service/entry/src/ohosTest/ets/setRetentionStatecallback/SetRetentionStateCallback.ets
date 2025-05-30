/**
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
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import dlpPermission from '@ohos.dlpPermission';
import { terminateSelfWithResult } from '../common/utils';
import { BusinessError } from '@ohos.base';

const TAG = "DLP_XTS_SetRetentionStateCallback";

export default class SetRetentionStateCallback extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    globalThis.context = this.context;
    globalThis.want = want;
  }

  onDestroy() {
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    let success = globalThis.want.parameters['ohos.dlp.params.success'] as boolean;
    let number = globalThis.want.parameters['ohos.dlp.params.number'] as number;
    let uriArray: string[] = [];
    if (success) {
      uriArray = ['uri'];
    }
    if (number == 2) {
      uriArray = ['uri', 'uri2'];
    }
    dlpPermission.setRetentionState(uriArray, async (error: BusinessError) => {
      if (error) {
        console.error(TAG, "SetRetentionState callback fail", error.code, error.message);
        terminateSelfWithResult(error.code);
      } else {
        console.info(TAG, "SetRetentionState callback pass");
        terminateSelfWithResult(0);
      }
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
  }

  onForeground() {
    // Ability has brought to foreground
  }

  onBackground() {
    // Ability has back to background
  }
}
