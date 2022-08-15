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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index"
import commonEvent from '@ohos.commonEvent'

var ACTS_ABILITYCONTEX = {
  events: ["ABILITYCONTEX_Start_CommonEvent"]
};

const START_ABILITY_TIMEOUT = 3000;
console.debug("====>in Ability.test====>");

export default function abilityTest(abilityContext) {
  console.debug("====>in ACTS_ThirdPartyInterfaceMultiUsers====>");
  describe('ACTS_ThirdPartyStartService', function () {

    /*
     * @tc.number    : ACTS_ThirdPartyStartServiceAbilityWithAccount_0200
     * @tc.name      : In multi-user non-concurrent mode
     * @tc.desc      : System application, in multi-user non-concurrent mode,
     *                 the specified user is not equal to the current user,
     *                 and the user's task list exists, call Promise
     */
    it('ACTS_ThirdPartyStartServiceAbilityWithAccount_0200', 0, async function (done) {
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
        console.log('ACTS_ThirdPartyStartServiceAbilityWithAccount_0200 onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_ThirdPartyStartServiceAbilityWithAccount_0200 onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(() => {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if (flag == true) {
            console.debug('ACTS_ThirdPartyStartServiceAbilityWithAccount_0200 - timeout');
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
              bundleName: 'com.example.actsthirdpartyspecifieduseractionextensiononetest',
              abilityName: 'com.example.actsthirdpartyspecifieduseractionextensiononetest.ServiceAbility'
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
     * @tc.number    : ACTS_ThirdPartyStartServiceAbilityWithAccount_0800
     * @tc.name      : In multi-user non-concurrent mode
     * @tc.desc      : System application, in multi-user non-concurrent mode,
     *                 the specified user is not equal to the current user,
     *                 and the user's task list exists, call Promise
     */
    it('ACTS_ThirdPartyStartServiceAbilityWithAccount_0800', 0, async function (done) {
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
        setTimeout(() => {
          done();
        }, 1000)
      }

      function onConnectCallback(element, remote) {
        console.log('ACTS_ThirdPartyStartServiceAbilityWithAccount_0800 onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_ThirdPartyStartServiceAbilityWithAccount_0800 onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(() => {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if (flag == true) {
            console.debug('ACTS_ThirdPartyStartServiceAbilityWithAccount_0800 - timeout');
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
              bundleName: 'com.example.actsthirdpartyspecifieduseractionextensiononetest',
              abilityName: 'com.example.actsthirdpartyspecifieduseractionextensiononetest.ServiceAbility'
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
     * @tc.number    : ACTS_ThirdPartyConnectServiceAbilityWithAccount_0200
     * @tc.name      : In multi-user non-concurrent mode
     * @tc.desc      : System application, in multi-user non-concurrent mode,
     *                 the specified user is not equal to the current user,
     *                 and the user's task list exists
     */
    it('ACTS_ThirdPartyConnectServiceAbilityWithAccount_0200', 0, async function (done) {
      let Subscriber
      var startresult = false
      globalThis.startnum = 3;
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        console.debug("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
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
          console.debug("====>0200start connectAbility====>");
          globalThis.number = await abilityContext.connectAbility(
            {
              bundleName: 'com.example.actsthirdpartyspecifieduseractionextensiononetest',
              abilityName: 'com.example.actsthirdpartyspecifieduseractionextensiononetest.ServiceAbility'
            })
          console.debug("====>number is====>" + JSON.stringify(globalThis.number));
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done()
      }

      function timeout() {
        console.debug('in ACTS_ThirdPartyConnectServiceAbilityWithAccount_0200 timeout');
        if(startresult == false){
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number    : ACTS_ThirdPartyStartServiceAbilityWithAccount_1000
     * @tc.name      : In multi-user non-concurrent mode
     * @tc.desc      : System application, in multi-user non-concurrent mode,
     *                 when the specified user is equal to the current user,
     *                 and the user's task list exists, call AsyncCallback
     */
    it('ACTS_ThirdPartyStartServiceAbilityWithAccount_1000', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 4;
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);

      function SubscribeCallBack(err, data) {
        expect().assertFail();
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
        console.log('ACTS_ThirdPartyStartServiceAbilityWithAccount_1000 onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_ThirdPartyStartServiceAbilityWithAccount_1000 onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(() => {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if (flag == true) {
            console.debug('ACTS_ThirdPartyStartServiceAbilityWithAccount_1000 - timeout');
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
              bundleName: 'com.example.actsthirdpartyspecifieduseractionextensiononetest',
              abilityName: 'com.example.actsthirdpartyspecifieduseractionextensiononetest.ServiceAbility'
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
     * @tc.number    : ACTS_ThirdPartyStartServiceAbilityWithAccount_0400
     * @tc.name      : In multi-user non-concurrent mode
     * @tc.desc      : System application, in multi-user non-concurrent mode,
     *                 when the specified user is equal to the current user,
     *                 and the user's task list exists, call AsyncCallback
     */
    it('ACTS_ThirdPartyStartServiceAbilityWithAccount_0400', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 5;
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);

      function SubscribeCallBack(err, data) {
        expect().assertFail();
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
        console.log('ACTS_ThirdPartyStartServiceAbilityWithAccount_0400 onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_ThirdPartyStartServiceAbilityWithAccount_0400 onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(() => {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if (flag == true) {
            console.debug('ACTS_ThirdPartyStartServiceAbilityWithAccount_0400 - timeout');
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
              bundleName: 'com.example.actsthirdpartyspecifieduseractionextensiononetest',
              abilityName: 'com.example.actsthirdpartyspecifieduseractionextensiononetest.ServiceAbility'
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