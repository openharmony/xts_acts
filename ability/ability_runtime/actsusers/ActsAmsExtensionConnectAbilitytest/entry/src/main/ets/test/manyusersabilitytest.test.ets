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


var subscriberInfoStartAbility_0100 = {
  events: ["ACTS_InterfaceMultiUsers_0100_Start_CommonEvent"],
};
var subscriberInfoStartAbility_0200 = {
  events: ["ACTS_InterfaceMultiUsers_0100_Start_CommonEvent"],
};
var subscriberInfoStartAbility_0300 = {
  events: ["ACTS_InterfaceMultiUsers_0100_Start_CommonEvent"],
};
var subscriberInfoStartAbility_0400 = {
  events: ["ACTS_InterfaceMultiUsers_0100_Start_CommonEvent"],
};
const START_ABILITY_TIMEOUT = 5000;

export default function abilityTest(abilityContext) {
  describe('ActsmanyuserAystemAbilityTest', function () {
    beforeEach(async (done) => {
      setTimeout(function () {
          done();
      }, START_ABILITY_TIMEOUT);
  })

    /*
     * @tc.number  : ACTS_ConnectAbility_0300
     * @tc.name    : Connect ability
     * @tc.desc    : Connecting ability succeeded.
     */
    it('ACTS_ConnectAbility_0300', 0, async function (done) {
      console.log('ACTS_ConnectAbility_0300====<begin');
      console.log('========ACTS_ConnectAbility_0300 1 called');
      var subscriber;
      let id;
      let connId;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_ConnectAbility_0300 7 CallBack data:====>" + JSON.stringify(data));
        clearTimeout(id);
        expect(data.event).assertEqual("ACTS_InterfaceMultiUsers_0100_Start_CommonEvent");
        console.debug("====>ACTS_ConnectAbility_0300 5  ");
        abilityContext.disconnectAbility(
          connId,
          (err, data) => {
            console.log('ACTS_ConnectAbility_0300 featureAbilityTest DisconnectAbility result errCode : ' 
            + err.code + " data: " + data)
          }
        );
        console.debug("====>ACTS_ConnectAbility_0300 6  ");
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
      }

      function onConnectCallback(element, remote) {
        console.debug('ACTS_ConnectAbility_0300 _onConnectCallback ====> element='
            + JSON.stringify(element) + " , " + element);
        console.debug('ACTS_ConnectAbility_0300 _onConnectCallback ====> remote='
            + JSON.stringify(remote) + " , " + remote);
      }

      function onDisconnectCallback(element) {
          console.debug('ACTS_ConnectAbility_0300 _onDisconnectCallback ====> element='
              + JSON.stringify(element) + " , " + element);
      }

      function onFailedCallback(code) {
          console.debug('ACTS_ConnectAbility_0300 _onFailedCallback ====> code='
              + JSON.stringify(code) + " , " + code)
      }

      commonEvent.createSubscriber(subscriberInfoStartAbility_0100).then(async (data) => {
        console.debug("====>ACTS_ConnectAbility_0300 2  Subscriber1====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack)
          connId = abilityContext.connectAbility({
            bundleName: "com.example.userservicesystemapi7",
            abilityName: "com.example.userservicesystemapi7.ServiceAbility",
          }, 
          {
            onConnect: onConnectCallback,
            onDisconnect: onDisconnectCallback,
            onFailed: onFailedCallback,
          }
          )
        })

      function unSubscribeCallback() {
        console.debug("====>UnSubscribe CallBack1====>");
        setTimeout(() => {
          done();
        }, 1000)
      }

      function timeout() {
        expect().assertFail();
        console.debug('ACTS_ConnectAbility_0300 timeout');
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        abilityContext.disconnectAbility(
          connId,
          (err, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + err.code + " data: " + data)
          });
      }

      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
        console.debug("====>ACTS_ConnectAbility_0300 4  ");
    })

    /*
     * @tc.number  : ACTS_ConnectAbility_0400
     * @tc.name    : Connect ability
     * @tc.desc    : Connecting ability succeeded.
     */
    it('ACTS_ConnectAbility_0400', 0, async function (done) {
      console.log('ACTS_ConnectAbility_0400====<begin');
      console.log('========ACTS_ConnectAbility_0400 1 called');
      var subscriber;
      let id;
      let connId;

      function onConnectCallback(element, remote) {
        console.debug('ACTS_ConnectAbility_0400 _onConnectCallback ====> element='
            + JSON.stringify(element) + " , " + element);
        console.debug('ACTS_ConnectAbility_0400 _onConnectCallback ====> remote='
            + JSON.stringify(remote) + " , " + remote);
      }

      function onDisconnectCallback(element) {
          console.debug('ACTS_ConnectAbility_0400 _onDisconnectCallback ====> element='
              + JSON.stringify(element) + " , " + element);
      }

      function onFailedCallback(code) {
          console.debug('ACTS_ConnectAbility_0400 _onFailedCallback ====> code='
              + JSON.stringify(code) + " , " + code)
      }
      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_ConnectAbility_0400 7 CallBack data:====>" + JSON.stringify(data));
        clearTimeout(id);
        expect(data.event).assertEqual("ACTS_InterfaceMultiUsers_0100_Start_CommonEvent");
        console.debug("====>ACTS_ConnectAbility_0400 5  ");
        abilityContext.disconnectAbility(
          connId,
          (err, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + err.code + " data: " + data)
          }
        );
        console.debug("====>ACTS_ConnectAbility_0400 6  ");
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)

      }
      commonEvent.createSubscriber(subscriberInfoStartAbility_0200).then(async (data) => {
        console.debug("====>ACTS_ConnectAbility_0400 2  Subscriber1====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack);
        console.debug("====>ACTS_ConnectAbility_0400 3  ");
        connId = await abilityContext.connectAbility({
          bundleName: "com.example.userservicesystemapi7",
          abilityName: "com.example.userservicesystemapi7.ServiceAbility",
        }, 
        {
          onConnect: onConnectCallback,
          onDisconnect: onDisconnectCallback,
          onFailed: onFailedCallback,
        })
        console.debug("====>ACTS_ConnectAbility_0400 4  ");
      })

      function unSubscribeCallback() {
        console.debug("====>UnSubscribe CallBack1====>");
        setTimeout(() => {
          done();
        }, 1000)
      }

      function timeout() {
        expect().assertFail();
        console.debug('ACTS_ConnectAbility_0400 timeout');
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        abilityContext.disconnectAbility(
          connId,
          (err, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + err.code + " data: " + data)
          });
      }

      id = setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_ExtensionConnectAbility_0300
     * @tc.name    : Connect ability
     * @tc.desc    : Connecting ability succeeded.
     */
    it('ACTS_ExtensionConnectAbility_0300', 0, async function (done) {
      console.log('ACTS_ExtensionConnectAbility_0300====<begin');
      console.log('========ACTS_ExtensionConnectAbility_0300 1 called');
      var subscriber;
      let id;
      let connId;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_ExtensionConnectAbility_0300 7 CallBack data:====>" + JSON.stringify(data));
        clearTimeout(id);
        expect(data.event).assertEqual("ACTS_InterfaceMultiUsers_0100_Start_CommonEvent");
        console.debug("====>ACTS_ExtensionConnectAbility_0300 5  ");
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
      }
      function onConnectCallback(element, remote) {
        console.debug('ACTS_ExtensionConnectAbility_0300 _onConnectCallback ====> element='
            + JSON.stringify(element) + " , " + element);
        console.debug('ACTS_ExtensionConnectAbility_0300 _onConnectCallback ====> remote='
            + JSON.stringify(remote) + " , " + remote);
      }
      function onDisconnectCallback(element) {
          console.debug('ACTS_ExtensionConnectAbility_0300 _onDisconnectCallback ====> element='
              + JSON.stringify(element) + " , " + element);
      }
      function onFailedCallback(code) {
          console.debug('ACTS_ExtensionConnectAbility_0300 _onFailedCallback ====> code='
              + JSON.stringify(code) + " , " + code)
      }
      commonEvent.createSubscriber(subscriberInfoStartAbility_0300).then(async (data) => {
        console.debug("====>ACTS_ExtensionConnectAbility_0300 2  Subscriber1====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack);
        connId =   abilityContext.connectAbility(
          {
            bundleName: "com.example.extensionconnectabilitytest",
            abilityName: "com.example.extensionconnectabilitytest.ServiceAbility",
            action:"Three",
          },
          {
            onConnect: onConnectCallback,
            onDisconnect: onDisconnectCallback,
            onFailed: onFailedCallback,
          }
          )
        console.debug("====>ACTS_ExtensionConnectAbility_0300 4  ");
      })

      function unSubscribeCallback() {
        abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          }
        );
        console.debug("====>ACTS_ExtensionConnectAbility_0300 6  ");
        console.debug("====>UnSubscribe CallBack1====>");
        setTimeout(() => {
          done();
        }, 1000)
      }

      function timeout() {
        expect().assertFail();
        console.debug('ACTS_ExtensionConnectAbility_0300 timeout');
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          });
      }

      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>ACTS_ExtensionConnectAbility_0300 3  ");

    })

    /*
     * @tc.number  : ACTS_ExtensionConnectAbility_0400
     * @tc.name    : Connect ability
     * @tc.desc    : Connecting ability succeeded.
     */
    it('ACTS_ExtensionConnectAbility_0400', 0, async function (done) {
      console.log('ACTS_ExtensionConnectAbility_0400====<begin');
      console.log('========ACTS_ExtensionConnectAbility_0400 1 called');
      var subscriber;
      let id;
      let connId;


      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_ExtensionConnectAbility_0400 7 CallBack data:====>" + JSON.stringify(data));
        clearTimeout(id);
        expect(data.event).assertEqual("ACTS_InterfaceMultiUsers_0100_Start_CommonEvent");
        console.debug("====>ACTS_ExtensionConnectAbility_0400 5  ");
        abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          }
        );
        console.debug("====>ACTS_ExtensionConnectAbility_0400 6  ");
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
      }
      function onConnectCallback(element, remote) {
        console.debug('ACTS_ExtensionConnectAbility_0400_onConnectCallback ====> element='
            + JSON.stringify(element) + " , " + element);
        console.debug('ACTS_ExtensionConnectAbility_0400_onConnectCallback ====> remote='
            + JSON.stringify(remote) + " , " + remote);
      }
      function onDisconnectCallback(element) {
          console.debug('ACTS_ExtensionConnectAbility_0400_onDisconnectCallback ====> element='
              + JSON.stringify(element) + " , " + element);
      }
      function onFailedCallback(code) {
          console.debug('ACTS_ExtensionConnectAbility_0400_onFailedCallback ====> code='
              + JSON.stringify(code) + " , " + code)
      }
      await commonEvent.createSubscriber(subscriberInfoStartAbility_0400).then(async (data) => {
        console.debug("====>ACTS_ExtensionConnectAbility_0400 2  Subscriber1====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack);
        console.debug("====>ACTS_ExtensionConnectAbility_0400 3  ");
        connId =  abilityContext.connectAbility(
          {
            bundleName: "com.example.extensionconnectabilitytest",
            abilityName: "com.example.extensionconnectabilitytest.ServiceAbility2",
          },
          {
            onConnect: onConnectCallback,
            onDisconnect: onDisconnectCallback,
            onFailed: onFailedCallback,
          }
        );
        console.debug("====>ACTS_ExtensionConnectAbility_0400 4  ");
      })

      function unSubscribeCallback() {
        console.debug("====>UnSubscribe CallBack1====>");
        setTimeout(() => {
          done();
        }, 1000)
      }

      function timeout() {
        expect().assertFail();
        console.debug('ACTS_ExtensionConnectAbility_0400 timeout');
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          });
      }
      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
    })
  })
}




