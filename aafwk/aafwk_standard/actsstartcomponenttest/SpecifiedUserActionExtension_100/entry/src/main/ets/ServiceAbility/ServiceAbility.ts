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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index"
import rpc from '@ohos.rpc';
import osaccount from '@ohos.account.osAccount'
globalThis.ACCOUNT_ID100;
globalThis.ACCOUNT_ID101;
globalThis.ACCOUNT_ID102;
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
export default class ServiceAbility extends ServiceExtensionAbility {
  onCreate(want) {
    console.log('ServiceAbility onCreate');
  }
  onDestory(){
    console.log('ServiceAbility onDestory');
  }
  onRequest(want,startId) {
    console.log('ServiceAbility onRequest');
  }

  onConnect(want) {
    console.log('ServiceAbility onConnect');
    console.log('globalThis.startnum is ' + globalThis.startnum);

    switch (globalThis.startnum) {
      case 1:
        console.log('ServiceAbility case 1');
        this.context.startAbilityWithAccount(
          {
            bundleName: 'com.example.actsspecifieduseractionextensionzerotest',
            abilityName: 'com.example.actsspecifieduseractionextensionzerotest.MainAbility2'
          },globalThis.ACCOUNT_ID100 ,{
          windowMode: 2,
          displayId: 1
           }).then(() => {
          console.log("====>end ACTS_StartServiceAbilityWithAccount_0100 ====>success!")
        })
        console.debug("====>case 1 end====>");
        var myStub = new Stub("com.example.actsspecifieduseractionextensionzerotest.MainAbility");
        console.log('ThirdAbility onConnect before return:')
        return myStub;
        break;
      case 2:
        console.log('ServiceAbility case 2');
        this.context.startAbilityWithAccount(
          {
            bundleName: 'com.example.actsspecifieduseractionextensionzerotest',
            abilityName: 'com.example.actsspecifieduseractionextensionzerotest.MainAbility2'
          },globalThis.ACCOUNT_ID102 ,{
          windowMode: 2,
          displayId: 1
           }).then(() => {
          console.log("====>end ACTS_StartServiceAbilityWithAccount_0300 ====>success!")
        })
        console.debug("====>case 2 end====>");
        var myStub = new Stub("com.example.actsspecifieduseractionextensionzerotest.MainAbility");
        console.log('ThirdAbility onConnect before return:')
        return myStub;
        break;
      case 3:
        console.log('ServiceAbility case 3');
        this.context.startAbilityWithAccount(
          {
            bundleName: 'com.example.actsspecifieduseractionextensiononetest',
            abilityName: 'com.example.actsspecifieduseractionextensiononetest.MainAbility2'
          },globalThis.ACCOUNT_ID101,((err, data) => {
          console.log("====>end ACTS_StartServiceAbilityWithAccount_0500====>fail!!!"+ JSON.stringify(err))
          console.log("====>end ACTS_StartServiceAbilityWithAccount_0500====>sunccess!"+ JSON.stringify(data))
        }))
        console.debug("====>case 3 end====>");
        var myStub = new Stub("com.example.actsspecifieduseractionextensionzerotest.MainAbility");
        console.log('ThirdAbility onConnect before return:')
        return myStub;
        break;
      case 4:
        console.log('ServiceAbility case 4');
        this.context.startAbilityWithAccount(
          {
            bundleName: 'com.example.actsspecifieduseractionextensionzerotest',
            abilityName: 'com.example.actsspecifieduseractionextensionzerotest.MainAbility2'
          },globalThis.ACCOUNT_ID102, {
          windowMode: 2,
          displayId: 1
           },((err, data) => {
            console.log("====>end ACTS_StartServiceAbilityWithAccount_0600====>fail!!!"+ JSON.stringify(err))
            console.log("====>end ACTS_StartServiceAbilityWithAccount_0600====>sunccess!"+ JSON.stringify(data))
          }))
        console.debug("====>case 4 end====>");
        var myStub = new Stub("com.example.actsspecifieduseractionextensionzerotest.MainAbility");
        console.log('ThirdAbility onConnect before return:')
        return myStub;
        break;
      case 5:
        console.log('ServiceAbility case 5');
        this.context.startAbilityWithAccount(
          {
            bundleName: 'com.example.actsspecifieduseractionextensionzerotest',
            abilityName: 'com.example.actsspecifieduseractionextensionzerotest.ServiceAbility2'
          },globalThis.ACCOUNT_ID100).then((data) => {
          console.log("====>end ACTS_StartServiceAbilityWithAccount_0700====>success!"+ JSON.stringify(data))
        })
        break;
      case 6:
        console.log('ServiceAbility case 6');
        this.context.startAbilityWithAccount(
            {
              bundleName: 'com.example.actsspecifieduseractionextensionzerotest',
              abilityName: 'com.example.actsspecifieduseractionextensionzerotest.ServiceAbility2'
            },globalThis.ACCOUNT_ID102,((err, data) => {
              console.log("====>end ACTS_StartServiceAbilityWithAccount_0900====>fail!!!")
              console.log("====>end ACTS_StartServiceAbilityWithAccount_0900====>sunccess!")
        }))
        console.debug("====>case 6 end====>");
        var myStub = new Stub("com.example.actsspecifieduseractionextensionzerotest.MainAbility");
        console.log('ThirdAbility onConnect before return:')
        return myStub;
        break;
      case 7:
        console.log('ServiceAbility case 7');
        this.context.startAbilityWithAccount(
          {
            bundleName: 'com.example.actsspecifieduseractionextensiononetest',
            abilityName: 'com.example.actsspecifieduseractionextensiononetest.ServiceAbility2'
          }, globalThis.ACCOUNT_ID101,((err, data) => {
          console.log("====>end ACTS_StartServiceAbilityWithAccount_1100====>fail!!!"+ JSON.stringify(err))
          console.log("====>end ACTS_StartServiceAbilityWithAccount_1100====>sunccess!"+ JSON.stringify(data))
        }))
        console.debug("====>case 7 end====>");
        var myStub = new Stub("com.example.actsspecifieduseractionextensionzerotest.MainAbility");
        console.log('ThirdAbility onConnect before return:')
        return myStub;
        break;
      case 8:
        console.log('ServiceAbility case 8');
        this.context.startAbilityWithAccount(
          {
            bundleName: 'com.example.actsspecifieduseractionextensionzerotest',
            abilityName: 'com.example.actsspecifieduseractionextensionzerotest.ServiceAbility2'
          }, globalThis.ACCOUNT_ID102,((err, data) => {
          console.log("====>end ACTS_StartServiceAbilityWithAccount_1200====>fail!!!"+ JSON.stringify(err))
          console.log("====>end ACTS_StartServiceAbilityWithAccount_1200====>sunccess!"+ JSON.stringify(data))
        }))
        console.debug("====>case 8 end====>");
        var myStub = new Stub("com.example.actsspecifieduseractionextensionzerotest.MainAbility");
        console.log('ThirdAbility onConnect before return:')
        return myStub;
        break;
      case 9:
        console.log('ServiceAbility case 9');
        this.context.connectAbilityWithAccount(
          {
            bundleName: 'com.example.actsspecifieduseractionextensionzerotest',
            abilityName: 'com.example.actsspecifieduseractionextensionzerotest.ServiceAbility2',
            action: "StartAbilityPromise"
          }, globalThis.ACCOUNT_ID100)
        break;
      case 10:
        console.log('ServiceAbility case 10');
        this.context.connectAbilityWithAccount(
          {
            bundleName: 'com.example.actsspecifieduseractionextensionzerotest',
            abilityName: 'com.example.actsspecifieduseractionextensionzerotest.ServiceAbility2',
            action: "StartAbilityPromise"
          },globalThis.ACCOUNT_ID102)

        console.debug("====>case 10 end====>");
        var myStub = new Stub("com.example.actsspecifieduseractionextensionzerotest.MainAbility");
        console.log('ThirdAbility onConnect before return:')
        return myStub;
        break;
      default:
        console.log("====> ServiceAbility end default =====>")
        break;
    }
  }
  onDisconnect(want) {
    console.log('ServiceAbility onDisconnect, want:' + want.abilityName);
  }

  onDestroy() {
    console.log('ServiceAbility onDestroy');
  }
}