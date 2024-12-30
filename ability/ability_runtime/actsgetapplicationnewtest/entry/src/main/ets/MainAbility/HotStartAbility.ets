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
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { application } from '@kit.AbilityKit';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import common from '@ohos.app.ability.common';

export function getContext(): common.UIAbilityContext {
  let context = AppStorage.get('context') as common.UIAbilityContext;
  console.info('getContext is ' + context);
  return context;
}

export default class HotStartAbility extends UIAbility {

  onCreate(want:Want, launchParam: AbilityConstant.LaunchParam) {
    try {
      AppStorage.setOrCreate('context', this.context);
    } catch (err) {
      console.log('AppStorage error: ', JSON.stringify(err));
    }
    hilog.info(0x0000, 'testTag', 'HotStartAbility onCreate');
  }

  onDestroy(){
    hilog.info(0x0000, 'testTag ', 'HotStartAbility onDestroy');
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag ', 'HotStartAbility onNewWant');
    let context1 = application.getApplicationContext();
    hilog.info(0x0000, 'testTag', 'HotStartAbility context1: %{public}s', JSON.stringify(context1));
  }

  onWindowStageCreate(windowStage: window.WindowStage){
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', 'HotStartAbility onWindowStageCreate');
    windowStage.loadContent('pages/HotPage', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onForeground(){
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', 'HotStartAbility onForeground');
  }

  onBackground(){
    // Ability has back to background
    hilog.info(0x0000, 'testTag', 'HotStartAbility onBackground');
  }
}
