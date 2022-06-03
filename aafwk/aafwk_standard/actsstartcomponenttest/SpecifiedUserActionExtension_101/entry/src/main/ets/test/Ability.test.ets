/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index"
import commonEvent from '@ohos.commonevent'
import osaccount from '@ohos.account.osAccount'


var ACTS_ABILITYCONTEX = {
  events: ["ABILITYCONTEX_Start_CommonEvent"]
};

const START_ABILITY_TIMEOUT = 3000;
console.debug("====>in Ability.test====>");

export default function abilityTest(abilityContext) {
  console.debug("====>in ACTS_InterfaceMultiUsers====>");
  describe('ACTS_StartService', function () {
     beforeAll(function(done) {
      var osAccountManager = osaccount.getAccountManager();
      console.debug("====>get AccountManager finish====");
      osAccountManager.activateOsAccount(100, (err)=>{
        console.debug("====>activateOsAccount localId: 100 err:" + JSON.stringify(err));
        setTimeout(()=>{
        osAccountManager.queryActivatedOsAccountIds((err,data1)=>{
          console.debug("====>getOsAccountLocalIdFromProcess100" + " err:" + JSON.stringify(err));
          console.debug("====>getOsAccountLocalIdFromProcess100" + " data:" + JSON.stringify(data1));
           globalThis.ACCOUNT_ID100 = data1[0];
            osAccountManager.activateOsAccount(101, (err)=>{
              console.debug("====>activateOsAccount localId: 101 err:" + JSON.stringify(err));
              setTimeout(()=>{
              osAccountManager.queryActivatedOsAccountIds((err,data2)=>{
                console.debug("====>getOsAccountLocalIdFromProcess101" + " err:" + JSON.stringify(err));
                console.debug("====>getOsAccountLocalIdFromProcess101" + " data:" + JSON.stringify(data2));
                globalThis.ACCOUNT_ID101 = data2[0];
                  osAccountManager.activateOsAccount(102, (err)=>{
                    console.debug("====>activateOsAccount localId: 102 err:" + JSON.stringify(err));
                    osAccountManager.queryActivatedOsAccountIds((err,data3)=>{
                      console.debug("====>getOsAccountLocalIdFromProcess102" + " err:" + JSON.stringify(err));
                      console.debug("====>getOsAccountLocalIdFromProcess102" + " data:" + JSON.stringify(data3));
                      globalThis.ACCOUNT_ID102 = data3[0];
                      osAccountManager.activateOsAccount(101, (err)=>{
                        console.debug("====>activateOsAccount localId: 100 err:" + JSON.stringify(err));
                        done();
                      })
                    })
                  })
                })
              },3000)
            })
          })
        },3000)
      })
    })

    /*
     * @tc.number    : ACTS_StartServiceAbilityWithAccount_0200
     * @tc.name      : In multi-user non-concurrent mode
     * @tc.desc      : System application, in multi-user non-concurrent mode,
     *                 the specified user is not equal to the current user,
     *                 and the user's task list exists, call Promise
     */
    it('ACTS_StartServiceAbilityWithAccount_0200', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 1;
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        expect(data.event == "ABILITYCONTEX_Start_CommonEvent").assertTrue();
        console.debug("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
        if (data.event == "ABILITYCONTEX_Start_CommonEvent") {
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(false);
        abilityContext.disconnectAbility(globalThis.number).then((err) => {
          console.debug("====>err is====>" + JSON.stringify(err));
        })
        console.log('====>disconnectAbility finish');
        setTimeout(() => {
          done();
        }, 1000)
      }

      function onConnectCallback(element, remote) {
        console.log('ACTS_StartServiceAbilityWithAccount_0200 onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_StartServiceAbilityWithAccount_0200 onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(() => {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if (flag == true) {
            console.debug('ACTS_StartServiceAbilityWithAccount_0200 - timeout');
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          }
        }, 1000);
      }

      function onDisconnectCallback(element) {
        console.log('onDisconnectCallback====> element=' + JSON.stringify(element));
      }

      function onFailedCallback(code) {
        console.log('onFailedCallback====> code=' + JSON.stringify(code))
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo) => {
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>0200start connectAbility====>");
          globalThis.number = await abilityContext.connectAbility(
            {
              bundleName: 'com.example.actsspecifieduseractionextensiononetest',
              abilityName: 'com.example.actsspecifieduseractionextensiononetest.ServiceAbility'
            }, {
            onConnect: onConnectCallback,
            onDisconnect: onDisconnectCallback,
            onFailed: onFailedCallback
          })
          console.debug("====>number is====>" + JSON.stringify(globalThis.number));
        })
      })
    })

    /*
     * @tc.number    : ACTS_StartServiceAbilityWithAccount_0800
     * @tc.name      : In multi-user non-concurrent mode
     * @tc.desc      : System application, in multi-user non-concurrent mode,
     *                 the specified user is not equal to the current user,
     *                 and the user's task list exists, call Promise
     */
    it('ACTS_StartServiceAbilityWithAccount_0800', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 2;
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        expect(data.event == "ABILITYCONTEX_Start_CommonEvent").assertTrue();
        console.debug("====>0800 Subscribe CallBack data:====>" + JSON.stringify(data));
        if (data.event == "ABILITYCONTEX_Start_CommonEvent") {
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(false);
        abilityContext.disconnectAbility(globalThis.number).then((err) => {
          console.debug("====>err is====>" + JSON.stringify(err));
        })
        console.log('====>disconnectAbility finish');
      done();
      }

      function onConnectCallback(element, remote) {
        console.log('ACTS_StartServiceAbilityWithAccount_0800 onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_StartServiceAbilityWithAccount_0800 onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(() => {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if (flag == true) {
            console.debug('ACTS_StartServiceAbilityWithAccount_0800 - timeout');
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          }
        }, 1000);
      }

      function onDisconnectCallback(element) {
        console.log('onDisconnectCallback====> element=' + JSON.stringify(element));
      }

      function onFailedCallback(code) {
        console.log('onFailedCallback====> code=' + JSON.stringify(code))
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo) => {
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>0800start connectAbility====>");
          globalThis.number = await abilityContext.connectAbility(
            {
              bundleName: 'com.example.actsspecifieduseractionextensiononetest',
              abilityName: 'com.example.actsspecifieduseractionextensiononetest.ServiceAbility'
            }, {
            onConnect: onConnectCallback,
            onDisconnect: onDisconnectCallback,
            onFailed: onFailedCallback
          })
          console.debug("====>number is====>" + JSON.stringify(globalThis.number));
        })
      })
    })

    /*
     * @tc.number    : ACTS_ConnectServiceAbilityWithAccount_0200
     * @tc.name      : In multi-user non-concurrent mode
     * @tc.desc      : System application, in multi-user non-concurrent mode,
     *                 the specified user is not equal to the current user,
     *                 and the user's task list exists
     */
    it('ACTS_ConnectServiceAbilityWithAccount_0200', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 3;
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        expect(data.event == "ABILITYCONTEX_Start_CommonEvent").assertTrue();
        console.debug("====>ACTS_ConnectServiceAbilityWithAccount_0200  Subscribe CallBack data:====>" + JSON.stringify(data));
        if (data.event == "ABILITYCONTEX_Start_CommonEvent") {
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      function UnSubscribeCallback() {
        console.debug("====>ACTS_ConnectServiceAbilityWithAccount_0200 UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(false);
        abilityContext.disconnectAbility(globalThis.number).then((err) => {
          console.debug("====>err is====>" + JSON.stringify(err));
        })
        console.log('====>ACTS_ConnectServiceAbilityWithAccount_0200 disconnectAbility finish');
        setTimeout(() => {
          done();
        }, 1000)
      }

      function onConnectCallback(element, remote) {
        console.log('ACTS_ConnectServiceAbilityWithAccount_0200 onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_ConnectServiceAbilityWithAccount_0200 onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(() => {
          console.log('====>ACTS_ConnectServiceAbilityWithAccount_0200 in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if (flag == true) {
            console.debug('ACTS_ConnectServiceAbilityWithAccount_0200 - timeout');
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          }
        }, 1000);
      }

      function onDisconnectCallback(element) {
        console.log('ACTS_ConnectServiceAbilityWithAccount_0200 onDisconnectCallback====> element=' + JSON.stringify(element));
      }

      function onFailedCallback(code) {
        console.log('ACTS_ConnectServiceAbilityWithAccount_0200 onFailedCallback====> code=' + JSON.stringify(code))
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("====>ACTS_ConnectServiceAbilityWithAccount_0200 Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo) => {
          console.debug("====>ACTS_ConnectServiceAbilityWithAccount_0200 SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>ACTS_ConnectServiceAbilityWithAccount_0200 0200start connectAbility====>");
          globalThis.number = await abilityContext.connectAbility(
            {
              bundleName: 'com.example.actsspecifieduseractionextensiononetest',
              abilityName: 'com.example.actsspecifieduseractionextensiononetest.ServiceAbility'
            }, {
            onConnect: onConnectCallback,
            onDisconnect: onDisconnectCallback,
            onFailed: onFailedCallback
          })
          console.debug("====>ACTS_ConnectServiceAbilityWithAccount_0200 number is====>" + JSON.stringify(globalThis.number));
        })
      })
    })

    /*
     * @tc.number    : ACTS_StartServiceAbilityWithAccount_1000
     * @tc.name      : In multi-user non-concurrent mode
     * @tc.desc      : System application, in multi-user non-concurrent mode,
     *                 when the specified user is equal to the current user,
     *                 and the user's task list exists, call AsyncCallback
     */
    it('ACTS_StartServiceAbilityWithAccount_1000', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 4;
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);

      function SubscribeCallBack(err, data) {
        expect(data.event == "ABILITYCONTEX_Start_CommonEvent").assertTrue();
        console.debug("====>1000 Subscribe CallBack data:====>" + JSON.stringify(data));
        if (data.event == "ABILITYCONTEX_Start_CommonEvent") {
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(true);
        abilityContext.disconnectAbility(globalThis.number).then((err) => {
          console.debug("====>err is====>" + JSON.stringify(err));
        })
        console.log('====>disconnectAbility finish');
        setTimeout(() => {
          done();
        }, 1000)
      }

      function onConnectCallback(element, remote) {
        console.log('ACTS_StartServiceAbilityWithAccount_1000 onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_StartServiceAbilityWithAccount_1000 onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(() => {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if (flag == true) {
            console.debug('ACTS_StartServiceAbilityWithAccount_1000 - timeout');
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          }
        }, 1000);
      }

      function onDisconnectCallback(element) {
        console.log('onDisconnectCallback====> element=' + JSON.stringify(element));
      }

      function onFailedCallback(code) {
        console.log('onFailedCallback====> code=' + JSON.stringify(code))
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo) => {
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>1000start connectAbility====>");
          globalThis.number = await abilityContext.connectAbility(
            {
              bundleName: 'com.example.actsspecifieduseractionextensiononetest',
              abilityName: 'com.example.actsspecifieduseractionextensiononetest.ServiceAbility'
            }, {
            onConnect: onConnectCallback,
            onDisconnect: onDisconnectCallback,
            onFailed: onFailedCallback
          })
          console.debug("====>number is====>" + JSON.stringify(globalThis.number));
        })
      })
    })

    /*
     * @tc.number    : ACTS_StartServiceAbilityWithAccount_0400
     * @tc.name      : In multi-user non-concurrent mode
     * @tc.desc      : System application, in multi-user non-concurrent mode,
     *                 when the specified user is equal to the current user,
     *                 and the user's task list exists, call AsyncCallback
     */
    it('ACTS_StartServiceAbilityWithAccount_0400', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 5;
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);

      function SubscribeCallBack(err, data) {
        expect(data.event == "ABILITYCONTEX_Start_CommonEvent").assertTrue();
        console.debug("====>0400 Subscribe CallBack data:====>" + JSON.stringify(data));
        if (data.event == "ABILITYCONTEX_Start_CommonEvent") {
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(true);
        abilityContext.disconnectAbility(globalThis.number).then((err) => {
          console.debug("====>err is====>" + JSON.stringify(err));
        })
        console.log('====>disconnectAbility finish');
        setTimeout(() => {
          done();
        }, 1000)
      }

      function onConnectCallback(element, remote) {
        console.log('ACTS_StartServiceAbilityWithAccount_0400 onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_StartServiceAbilityWithAccount_0400 onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(() => {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if (flag == true) {
            console.debug('ACTS_StartServiceAbilityWithAccount_0400 - timeout');
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          }
        }, 1000);
      }

      function onDisconnectCallback(element) {
        console.log('onDisconnectCallback====> element=' + JSON.stringify(element));
      }

      function onFailedCallback(code) {
        console.log('onFailedCallback====> code=' + JSON.stringify(code))
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo) => {
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>0400start connectAbility====>");
          globalThis.number = await abilityContext.connectAbility(
            {
              bundleName: 'com.example.actsspecifieduseractionextensiononetest',
              abilityName: 'com.example.actsspecifieduseractionextensiononetest.ServiceAbility'
            }, {
            onConnect: onConnectCallback,
            onDisconnect: onDisconnectCallback,
            onFailed: onFailedCallback
          })
          console.debug("====>number is====>" + JSON.stringify(globalThis.number));
        })
      })
    })
  })
}