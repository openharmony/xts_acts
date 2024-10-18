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
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import type window from '@ohos.window';

const CUMULATIVE = 2;

export default class OtherAbility extends UIAbility {
  circulate: number = 0;

  onCreate(want, launchParam) {
    console.log('=====> OtherAbility onCreate =====>');
  }

  onDestroy() {
    console.log('=====> OtherAbility onDestroy =====>');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.log('=====> OtherAbility onWindowStageCreate =====>');
    windowStage.loadContent('pages/IndexTwo', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log('=====> OtherAbility onWindowStageDestroy =====>');
  }

  onForeground() {
    console.log('=====> OtherAbility onForeground =====>');
    this.circulate++;
    console.log(`=====> OtherAbility circulate count: ${this.circulate}`);
    if (this.circulate === CUMULATIVE) {
      this.context.terminateSelfWithResult({
        resultCode: 0,
        want: {
          parameters: {
            action: 'ACTION'
          }
        }
      }, (err) => {
        console.log('=====> OtherAbility CalledAbilityCallBack terminateSelfWithResult =====>' + err.code);
      });
    }
  }

  onBackground() {
    // Ability has back to background
    console.log('=====> OtherAbility onBackground =====>');
  }
}
