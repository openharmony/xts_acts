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
  events: ["AMS_ConnectAbility_0100_commonEvent"],
};
var subscriberInfoStartAbility_0200 = {
  events: ["AMS_ConnectAbility_0200_commonEvent"],
};
var subscriberInfoStartAbility_0300 = {
  events: ["AMS_ConnectAbility_0300_commonEvent"],
};
var subscriberInfoStartAbility_0400 = {
  events: ["AMS_ConnectAbility_0400_commonEvent"],
};
const START_ABILITY_TIMEOUT = 5000;
globalThis.number = 0;

export default function abilityTest(abilityContext) {
  describe('ActsExtensionConnectAbilityTest', function () {

    it('ACTS_ConnectAbility_0300', 0, async function (done) {
      console.log('ACTS_ConnectAbility_0300====<begin');
      console.log('========ACTS_ConnectAbility_0300 1 called');
      var subscriber;
      let id;
      let connId;


      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_ConnectAbility_0300 7 CallBack data:====>" + JSON.stringify(data));
        clearTimeout(id);
        expect(data.event).assertEqual("AMS_ConnectAbility_0100_commonEvent");
        console.debug("====>ACTS_ConnectAbility_0300 5  ");
        abilityContext.disconnectAbility(
          connId,
          (err, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + err.code + " data: " + data)
          }
        );
        console.debug("====>ACTS_ConnectAbility_0300 6  ");
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)

      }


      commonEvent.createSubscriber(subscriberInfoStartAbility_0100).then(async (data) => {
        console.debug("====>ACTS_ConnectAbility_0300 2  Subscriber1====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack)
          connId = await abilityContext.connectAbility({
            bundleName: "com.example.actsserviceabilityrelytest",
            abilityName: "com.example.actsserviceabilityrelytest.ServiceAbility",
          }, (err, data) => {
            console.log('ACTS_ProcessManage SystemAppA onShowProcess startAbility startServiceAbility: '
            + JSON.stringify(err) + ", " + JSON.stringify(data))
          })
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

    it('ACTS_ConnectAbility_0400', 0, async function (done) {
      console.log('ACTS_ConnectAbility_0400====<begin');
      console.log('========ACTS_ConnectAbility_0400 1 called');
      var subscriber;
      let id;
      let connId;


      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_ConnectAbility_0400 7 CallBack data:====>" + JSON.stringify(data));
        clearTimeout(id);
        expect(data.event).assertEqual("AMS_ConnectAbility_0200_commonEvent");
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
          bundleName: "com.example.actsserviceabilityrelytest",
          abilityName: "com.example.actsserviceabilityrelytest.ServiceAbility",
        }, (err, data) => {
          console.log('ACTS_ProcessManage SystemAppA onShowProcess startAbility startServiceAbility: '
          + JSON.stringify(err) + ", " + JSON.stringify(data))
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

    it('ACTS_ExtensionConnectAbility_0300', 0, async function (done) {
      console.log('ACTS_ExtensionConnectAbility_0300====<begin');
      console.log('========ACTS_ExtensionConnectAbility_0300 1 called');
      var subscriber;
      let id;
      let connId;


      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_ExtensionConnectAbility_0300 7 CallBack data:====>" + JSON.stringify(data));
        clearTimeout(id);
        expect(data.event).assertEqual("AMS_ConnectAbility_0300_commonEvent");
        console.debug("====>ACTS_ExtensionConnectAbility_0300 5  ");
        abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          }
        );
        console.debug("====>ACTS_ExtensionConnectAbility_0300 6  ");
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)

      }


      commonEvent.createSubscriber(subscriberInfoStartAbility_0300).then(async (data) => {
        console.debug("====>ACTS_ExtensionConnectAbility_0300 2  Subscriber1====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack);
        connId =  await abilityContext.connectAbility(
          {
            bundleName: "com.example.actsextensionconnectabilitytest",
            abilityName: "com.example.actsextensionconnectabilitytest.ServiceAbility",
            action:"Three",
          }).then(()=>{
          console.debug("====>startAbility end====>");
        })
        console.debug("====>ACTS_ExtensionConnectAbility_0300 4  ");
      })

      function unSubscribeCallback() {
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

    it('ACTS_ExtensionConnectAbility_0400', 0, async function (done) {
      console.log('ACTS_ExtensionConnectAbility_0400====<begin');
      console.log('========ACTS_ExtensionConnectAbility_0400 1 called');
      var subscriber;
      let id;
      let connId;


      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_ExtensionConnectAbility_0400 7 CallBack data:====>" + JSON.stringify(data));
        clearTimeout(id);
        expect(data.event).assertEqual("AMS_ConnectAbility_0400_commonEvent");
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


      commonEvent.createSubscriber(subscriberInfoStartAbility_0400).then(async (data) => {
        console.debug("====>ACTS_ExtensionConnectAbility_0400 2  Subscriber1====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack);
        console.debug("====>ACTS_ExtensionConnectAbility_0400 3  ");
        connId = await abilityContext.connectAbility(
          {
            bundleName: "com.example.actsextensionconnectabilitytest",
            abilityName: "com.example.actsextensionconnectabilitytest.ServiceAbility2",
            action:"Four",
          },
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


