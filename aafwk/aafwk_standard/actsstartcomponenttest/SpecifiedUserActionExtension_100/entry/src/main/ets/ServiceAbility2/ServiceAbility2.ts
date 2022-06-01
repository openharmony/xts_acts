/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import ServiceExtensionAbility from '@ohos.application.ServiceExtensionAbility'
import commonEvent from "@ohos.commonevent"

export default class ServiceAbility2 extends ServiceExtensionAbility {
  onCreate(want) {
    console.log('ServiceAbility2 onCreate');
    globalThis.abilityWant = want;
  }

  onDestory(){
    console.log('ServiceAbility2 onDestory');
  }

  onRequest(want,startId) {
    console.log('ServiceAbility2 onRequest');
    commonEvent.publish("ABILITYCONTEX_Start_CommonEvent",() => {
      console.log("publish Publish ABILITYCONTEX_Start_CommonEvent callback")
      this.context.terminateSelf();
      console.log("====> terminateSelf End=====>")
    });
  }

  onConnect(want) {
    console.log('ServiceAbility2 onConnect');
    if (want.action == 'StartAbilityPromise') {
      console.log('stub StartAbilityPromise OnConnect start ');
      commonEvent.publish("ABILITYCONTEX_Start_CommonEvent",() => {
        console.log("publish Publish ABILITYCONTEX_Start_CommonEvent callback")
        this.context.terminateSelf();
        console.log("====> StartAbilityPromise End=====>")
      });
    }
  }

  onDisconnect(want) {
    console.log('ServiceAbility2 onDisconnect, want:' + want.abilityName);
  }

  onDestroy() {
    console.log('ServiceAbility2 onDestroy');
  }
}