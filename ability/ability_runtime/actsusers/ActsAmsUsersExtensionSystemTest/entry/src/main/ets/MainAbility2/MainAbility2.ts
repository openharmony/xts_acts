/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import Ability from '@ohos.application.Ability'
import commonEvent from "@ohos.commonEvent"

export default class MainAbility2 extends Ability {

  onCreate(want, launchParam) {
    console.log("MainAbility2 onCreate");
    globalThis.abilityContext2 = this.context
  }

  onDestroy() {
    console.log("MainAbility2 onDestroy");
  }

  onWindowStageCreate(windowStage) {
    console.log("MainAbility2 onWindowStageCreate");
    windowStage.setUIContent(this.context, "MainAbility/pages/index/second", null);
    commonEvent.publish("ACTS_InterfaceMultiUsersExtension_CommonEvent", () => {
      console.log("publish Publish ACTS_InterfaceMultiUsersExtension_CommonEvent callback")
      globalThis.abilityContext2.terminateSelf().then(() => {
        commonEvent.publish("ACTS_TerminateSelf_CommonEvent", ()=>{
          console.log('terminateSelf promise');
        });
      });
    })
  }

  onWindowStageDestroy() {
    console.log("MainAbility2 onWindowStageDestroy");
  }

  onForeground() {
    console.log("MainAbility2 onForeground");
  }

  onBackground() {
    console.log("MainAbility2 onBackground");
  }
};
