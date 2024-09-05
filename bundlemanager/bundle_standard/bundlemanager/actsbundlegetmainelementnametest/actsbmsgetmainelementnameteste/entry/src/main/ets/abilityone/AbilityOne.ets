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

import Ability from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';

export default class AbilityOne extends Ability {
  onCreate(want, launchParam) {
    // Ability is creating, initialize resources for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'onCreate');
    globalThis.abilityWant = want;
  }

  onDestroy() {
    // Ability is destroying, release resources for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'onDestroy');
  }

  onWindowStageCreate(windowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'onWindowStageCreate');
    globalThis.abilityContext = this.context;
  }

  onWindowStageDestroy() {
    //Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'onBackground');
  }
};