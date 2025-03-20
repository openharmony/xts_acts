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
let lifeList: string[] = [];
export default class EntryAbility1 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onCreate');
    globalThis.entryAbilityContext1 = this.context;
    globalThis.lifeCycleList = [];
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onCreate ' + JSON.stringify(lifeList));
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onDestroy');
    globalThis.lifeCycleList.push('onDestroy');
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onDestroy ' + JSON.stringify(lifeList));
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onWindowStageCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onWindowStageCreate ' + JSON.stringify(lifeList));
    windowStage.loadContent('pages/Index2', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onWindowStageDestroy');
    globalThis.lifeCycleList.push('onWindowStageDestroy');
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onWillForeground ' + JSON.stringify(lifeList));
  }
  onWillForeground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onWillForeground');
    globalThis.lifeCycleList.push('onWillForeground');
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onWillForeground ' + JSON.stringify(lifeList));
  }
  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onForeground');
    globalThis.lifeCycleList.push('onForeground');
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onForeground ' + JSON.stringify(lifeList));
  }
  onDidForeground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onDidForeground');
    globalThis.lifeCycleList.push('onDidForeground');
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onDidForeground ' + JSON.stringify(lifeList));
  }
  onWillBackground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onWillBackground');
    globalThis.lifeCycleList.push('onWillBackground');
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onWillBackground ' + JSON.stringify(lifeList));
  }
  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onBackground');
    globalThis.lifeCycleList.push('onBackground');
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onBackground ' + JSON.stringify(lifeList));
  }
  onDidBackground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onDidBackground');
    globalThis.lifeCycleList.push('onDidBackground');
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility1 onDidBackground ' + JSON.stringify(lifeList));
  }
}
