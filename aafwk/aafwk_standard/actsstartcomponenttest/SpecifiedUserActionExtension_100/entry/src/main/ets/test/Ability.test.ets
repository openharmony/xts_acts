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
                      osAccountManager.activateOsAccount(100, (err)=>{
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
     * @tc.number  : ACTS_StartServiceAbilityWithAccount_0100
     * @tc.name    : In multi-user non-concurrent mode
     * @tc.desc    : In multi-user non-concurrent mode,
     *               the specified user is equal to the current user and the user's task list exists (promise)
     */
    it('ACTS_StartServiceAbilityWithAccount_0100', 0, async function (done) {
      let Subscriber
      var flag = true;
      var startresult = false;
      globalThis.startnum = 1;

      console.log('====>globalThis.startnum is====>' + globalThis.startnum);

      function SubscribeCallBack(err, data) {
        expect(data.event == "ABILITYCONTEX_Start_CommonEvent").assertTrue();
        console.debug("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        if (data.event == "ABILITYCONTEX_Start_CommonEvent") {
          startresult = true
        }
        abilityContext.disconnectAbility(globalThis.number).then((err) => {
          console.debug("====>err is====>" + JSON.stringify(err));
        })
        console.log('====>disconnectAbility finish');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      function onConnectCallback(element, remote) {
        console.log('ACTS_StartServiceAbilityWithAccount_0100 onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_StartServiceAbilityWithAccount_0100 onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(() => {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if (flag == true) {
            console.debug('ACTS_StartServiceAbilityWithAccount_0100 - timeout');
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
          console.debug("====>0100start connectAbility====>");
          globalThis.number = await abilityContext.connectAbility(
            {
              bundleName: 'com.example.actsspecifieduseractionextensionzerotest',
              abilityName: 'com.example.actsspecifieduseractionextensionzerotest.ServiceAbility'
            }, {
            onConnect: onConnectCallback,
            onDisconnect: onDisconnectCallback,
            onFailed: onFailedCallback
          })
          console.debug("====>number is====>" + JSON.stringify(globalThis.number));
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(true);
        setTimeout(() => {
          done()
        }, 1000)
      }

      function timeout() {
        console.debug('in ACTS_StartServiceAbilityWithAccount_0100 timeout');
        if (flag == true) {
          expect().assertFail();
          console.debug('ACTS_StartServiceAbilityWithAccount_0100 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_StartServiceAbilityWithAccount_0300
     * @tc.name    : In multi-user non-concurrent mode
     * @tc.desc    : System application, in multi-user non-concurrent mode,
     *               when the specified user does not have a task list (the user does not exist), call Promise
     */
    it('ACTS_StartServiceAbilityWithAccount_0300', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 2;
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        expect(data.event == "ABILITYCONTEX_Start_CommonEvent").assertTrue();
        console.debug("====>0300 Subscribe CallBack data:====>" + JSON.stringify(data));
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
        console.log('ACTS_StartServiceAbilityWithAccount_0300 onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_StartServiceAbilityWithAccount_0300 onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(() => {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if (flag == true) {
            console.debug('ACTS_StartServiceAbilityWithAccount_0300 - timeout');
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
          console.debug("====>0300start connectAbility====>");
          globalThis.number = await abilityContext.connectAbility(
            {
              bundleName: 'com.example.actsspecifieduseractionextensionzerotest',
              abilityName: 'com.example.actsspecifieduseractionextensionzerotest.ServiceAbility'
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
     * @tc.number  : ACTS_StartServiceAbilityWithAccount_0500
     * @tc.name    : In multi-user non-concurrent mode
     * @tc.desc    : System application, in multi-user non-concurrent mode,
     *               the specified user is not equal to the current user,
     *               and the user's task list exists, call AsyncCallback
     */
    it('ACTS_StartServiceAbilityWithAccount_0500', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 3;
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        expect(data.event == "ABILITYCONTEX_Start_CommonEvent").assertTrue();
        console.debug("====>0500 Subscribe CallBack data:====>" + JSON.stringify(data));
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
        // setTimeout(() => {
          
        // }, 1000)
      }

      function onConnectCallback(element, remote) {
        console.log('ACTS_StartServiceAbilityWithAccount_0500 onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_StartServiceAbilityWithAccount_0500 onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(() => {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if (flag == true) {
            console.debug('ACTS_StartServiceAbilityWithAccount_0500 - timeout');
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          }
        }, 1000);
      }

      function onDisconnectCallback(element) {
        console.log('onDisconnectCallback====> element=' + JSON.stringify(element));
        done();
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
          console.debug("====>0500start connectAbility====>");
          globalThis.number = await abilityContext.connectAbility(
            {
              bundleName: 'com.example.actsspecifieduseractionextensionzerotest',
              abilityName: 'com.example.actsspecifieduseractionextensionzerotest.ServiceAbility'
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
     * @tc.number  : ACTS_StartServiceAbilityWithAccount_0600
     * @tc.name    : In multi-user non-concurrent mode
     * @tc.desc    : System application, in multi-user non-concurrent mode,
     *               when the specified user does not have a task list (the user does not exist),
     *               call AsyncCallback
     */
    it('ACTS_StartServiceAbilityWithAccount_0600', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 4;
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        expect(data.event == "ABILITYCONTEX_Start_CommonEvent").assertTrue();
        console.debug("====>0600 Subscribe CallBack data:====>" + JSON.stringify(data));
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
        console.log('ACTS_StartServiceAbilityWithAccount_0600 onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_StartServiceAbilityWithAccount_0600 onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(() => {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if (flag == true) {
            console.debug('ACTS_StartServiceAbilityWithAccount_0600 - timeout');
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
          console.debug("====>0600start connectAbility====>");
          globalThis.number = await abilityContext.connectAbility(
            {
              bundleName: 'com.example.actsspecifieduseractionextensionzerotest',
              abilityName: 'com.example.actsspecifieduseractionextensionzerotest.ServiceAbility'
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
     * @tc.number  : ACTS_StartServiceAbilityWithAccount_0700
     * @tc.name    : In multi-user non-concurrent mode
     * @tc.desc    : System application, in multi-user non-concurrent mode,
     *               when the specified user is equal to the current user,
     *               and the user's task list exists, call Promise
     */
    it('ACTS_StartServiceAbilityWithAccount_0700', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 5;

      console.log('====>globalThis.startnum is====>' + globalThis.startnum);

      function SubscribeCallBack(err, data) {
        expect(data.event == "ABILITYCONTEX_Start_CommonEvent").assertTrue();
        console.debug("====>0700 Subscribe CallBack data:====>" + JSON.stringify(data));
        if (data.event == "ABILITYCONTEX_Start_CommonEvent") {
          startresult = true
        }
        abilityContext.disconnectAbility(globalThis.number).then((err) => {
          console.debug("====>err is====>" + JSON.stringify(err));
        })
        console.log('====>disconnectAbility finish');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo) => {
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>0700start connectAbility====>");
          globalThis.number = await abilityContext.connectAbility(
            {
              bundleName: 'com.example.actsspecifieduseractionextensionzerotest',
              abilityName: 'com.example.actsspecifieduseractionextensionzerotest.ServiceAbility'
            })
          console.debug("====>number is====>" + JSON.stringify(globalThis.number));
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(true);
        setTimeout(() => {
          done()
        }, 1000)
      }

      function timeout() {
        console.debug('in ACTS_StartServiceAbilityWithAccount_0700 timeout');
        if (flag == true) {
          expect().assertFail();
          console.debug('ACTS_StartServiceAbilityWithAccount_0700 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_StartServiceAbilityWithAccount_0900
     * @tc.name    : In multi-user non-concurrent mode
     * @tc.desc    : System application, in multi-user non-concurrent mode,
     *               when the specified user does not have a task list (the user does not exist),
     *               call Promise
     */
    it('ACTS_StartServiceAbilityWithAccount_0900', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 6;
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        expect(data.event == "ABILITYCONTEX_Start_CommonEvent").assertTrue();
        console.debug("====>0900 Subscribe CallBack data:====>" + JSON.stringify(data));
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
        console.log('ACTS_StartServiceAbilityWithAccount_0900 onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_StartServiceAbilityWithAccount_0900 onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(() => {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if (flag == true) {
            console.debug('ACTS_StartServiceAbilityWithAccount_0900 - timeout');
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
          console.debug("====>0900start connectAbility====>");
          globalThis.number = await abilityContext.connectAbility(
            {
              bundleName: 'com.example.actsspecifieduseractionextensionzerotest',
              abilityName: 'com.example.actsspecifieduseractionextensionzerotest.ServiceAbility'
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
     * @tc.number  : ACTS_StartServiceAbilityWithAccount_1100
     * @tc.name    : In multi-user non-concurrent mode
     * @tc.desc    : System application, in multi-user non-concurrent mode,
     *               the specified user is not equal to the current user,
     *               and the user's task list exists, call AsyncCallback
     */
    it('ACTS_StartServiceAbilityWithAccount_1100', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 7;
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        expect(data.event == "ABILITYCONTEX_Start_CommonEvent").assertTrue();
        console.debug("====>1100 Subscribe CallBack data:====>" + JSON.stringify(data));
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
        console.log('ACTS_StartServiceAbilityWithAccount_1100 onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_StartServiceAbilityWithAccount_1100 onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(() => {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if (flag == true) {
            console.debug('ACTS_StartServiceAbilityWithAccount_1100 - timeout');
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
          console.debug("====>1100start connectAbility====>");
          globalThis.number = await abilityContext.connectAbility(
            {
              bundleName: 'com.example.actsspecifieduseractionextensionzerotest',
              abilityName: 'com.example.actsspecifieduseractionextensionzerotest.ServiceAbility'
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
     * @tc.number  : ACTS_StartServiceAbilityWithAccount_1200
     * @tc.name    : In multi-user non-concurrent mode
     * @tc.desc    : System application, in multi-user non-concurrent mode,
     *               when the specified user does not have a task list (the user does not exist),
     *               call AsyncCallback
     */
    it('ACTS_StartServiceAbilityWithAccount_1200', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 8;
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        expect(data.event == "ABILITYCONTEX_Start_CommonEvent").assertTrue();
        console.debug("====>1200 Subscribe CallBack data:====>" + JSON.stringify(data));
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
        console.log('ACTS_StartServiceAbilityWithAccount_1200 onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_StartServiceAbilityWithAccount_1200 onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(() => {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if (flag == true) {
            console.debug('ACTS_StartServiceAbilityWithAccount_1200 - timeout');
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
          console.debug("====>1200start connectAbility====>");
          globalThis.number = await abilityContext.connectAbility(
            {
              bundleName: 'com.example.actsspecifieduseractionextensionzerotest',
              abilityName: 'com.example.actsspecifieduseractionextensionzerotest.ServiceAbility'
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
     * @tc.number  : ACTS_ConnectServiceAbilityWithAccount_0100
     * @tc.name    : In multi-user non-concurrent mode
     * @tc.desc    : System application, in multi-user non-concurrent mode,
     *               when the specified user is equal to the current user and the user's task list exists
     */
    it('ACTS_ConnectServiceAbilityWithAccount_0100', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 9;

      console.log('====>globalThis.startnum is====>' + globalThis.startnum);

      function SubscribeCallBack(err, data) {
        expect(data.event == "ABILITYCONTEX_Start_CommonEvent").assertTrue();
        console.debug("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        if (data.event == "ABILITYCONTEX_Start_CommonEvent") {
          startresult = true
        }
        abilityContext.disconnectAbility(globalThis.number).then((err) => {
          console.debug("====>err is====>" + JSON.stringify(err));
        })
        console.log('====>disconnectAbility finish');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo) => {
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>0100 ConnectServiceAbility connectAbility====>");
          globalThis.number = await abilityContext.connectAbility(
            {
              bundleName: 'com.example.actsspecifieduseractionextensionzerotest',
              abilityName: 'com.example.actsspecifieduseractionextensionzerotest.ServiceAbility'
            })
          console.debug("====>number is====>" + JSON.stringify(globalThis.number));
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(true);
        setTimeout(() => {
          done()
        }, 1000)
      }

      function timeout() {
        console.debug('in ACTS_ConnectServiceAbilityWithAccount_0100 timeout');
        if (flag == true) {
          expect().assertFail();
          console.debug('ACTS_ConnectServiceAbilityWithAccount_0100 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_ConnectServiceAbilityWithAccount_0300
     * @tc.name    : In multi-user non-concurrent mode
     * @tc.desc    : System application, in multi-user non-concurrent mode,
     *               when the specified user does not have a task list (the user does not exist)
     */
    it('ACTS_ConnectServiceAbilityWithAccount_0300', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 10;
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        expect(data.event == "ABILITYCONTEX_Start_CommonEvent").assertTrue();
        console.debug("====>0300 Subscribe CallBack data:====>" + JSON.stringify(data));
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
        console.log('ACTS_ConnectServiceAbilityWithAccount_0300 onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_ConnectServiceAbilityWithAccount_0300 onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(() => {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if (flag == true) {
            console.debug('ACTS_ConnectServiceAbilityWithAccount_0300 - timeout');
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
          console.debug("====>0300 ConnectServiceAbility connectAbility====>");
          globalThis.number = await abilityContext.connectAbility(
            {
              bundleName: 'com.example.actsspecifieduseractionextensionzerotest',
              abilityName: 'com.example.actsspecifieduseractionextensionzerotest.ServiceAbility'
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
