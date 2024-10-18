/*
* Copyright (c) 2022 Huawei Device Co., Ltd.
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
import Ability from '@ohos.app.ability.UIAbility'
import commonEvent from '@ohos.commonEvent'

let TERMINATE_SELF_TIME = 2000;
let EVENT_TIME = 500;

function PublishCallBack() {
  console.debug("====>Publish CallBack ====>");
}

export default class MainAbility3 extends Ability {
  onCreate(want, launchParam) {
    console.log("[Demo] MainAbility3 onCreate")
    globalThis.abilityWant = want;
    globalThis.abilityContext = this.context
  }

  onDestroy() {
    console.log("[Demo] MainAbility3 onDestroy")
    globalThis.abilityContext = undefined;
  }

  onWindowStageCreate(windowStage) {
    // Main window is created, set main page for this ability
    console.log("[Demo] MainAbility3 onWindowStageCreate")

    windowStage.setUIContent(this.context, "pages/Index3", null)
    setTimeout(() => {
      globalThis.abilityContext.terminateSelf().then(() => {
        console.log("====>MainAbility3 in terminateSelf====>");
      })
    }, TERMINATE_SELF_TIME);
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log("[Demo] MainAbility3 onWindowStageDestroy")
  }

  onForeground() {
    // Ability has brought to foreground
    console.log("[Demo] MainAbility3 onForeground")
    setTimeout(() => {
      commonEvent.publish("MainAbility3_foreground", PublishCallBack);
    }, EVENT_TIME);
  }

  onBackground() {
    // Ability has back to background
    console.log("[Demo] MainAbility3 onBackground")
  }
};
