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

import ServiceExtensionAbility from '@ohos.application.ServiceExtensionAbility'
import commonEvent from "@ohos.commonevent"

export default class ServiceAbility extends ServiceExtensionAbility {
  onCreate(want) {
    console.log('ServiceAbility onCreate');
  }
  onDestory(){
    console.log('ServiceAbility onDestory');
  }
  onRequest(want,startId) {
    console.log('ServiceAbility onRequest');
    commonEvent.publish("ACTS_InterfaceMultiUsers_0100_Start_CommonEvent", () => {
      console.log(" Publish ACTS_InterfaceMultiUsersExtension_CommonEvent callback")
      this.context.terminateSelf().then(()=>{
        console.log(" terminateSelf callback")
      })
    })
  }

  onConnect(want) {
    console.log('ServiceAbility onConnect');
  }

  onDisconnect(want) {
    console.log('ServiceAbility onDisconnect');
  }

  onDestroy() {
    console.log('ServiceAbility onDestroy');
  }
}