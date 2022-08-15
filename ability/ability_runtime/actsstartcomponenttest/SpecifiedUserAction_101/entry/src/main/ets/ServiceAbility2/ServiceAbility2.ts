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

import ServiceExtension from '@ohos.application.ServiceExtensionAbility'
import commonEvent from "@ohos.commonEvent"
import rpc from '@ohos.rpc';
class Stub extends rpc.RemoteObject {
  constructor(des) {
    super(des);
  }
  // process client's request
  onRemoteRequest(code, data, reply, option) {
    reply.writeNoException();
    reply.writeString("success");
    return true;
  }
}
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
  }

  onConnect(want) {
    let extensionContext = this.context
    console.log('ServiceAbility2 onConnect');
    if (want.action == 'StartAbilityPromise') {
      console.log('stub StartAbilityPromise OnConnect start ');
      commonEvent.publish("ABILITYCONTEX_Start_CommonEvent",() => {
        console.log("publish Publish ABILITYCONTEX_Start_CommonEvent callback")
        extensionContext.terminateSelf();
        console.log("====> StartAbilityPromise End=====>")
      });

      var myStub = new Stub("com.example.actsspecifieduseractiononetest.MainAbility");
      console.log('ThirdAbility onConnect before return:')
      return myStub;
    }
  }

  onDisconnect(want) {
    console.log('ServiceAbility2 onDisconnect, want:' + want.abilityName);
  }

  onDestroy() {
    console.log('ServiceAbility2 onDestroy');
  }
}