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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
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
var subscriberInfoStartAbility_0500 = {
  events: ["AMS_ConnectAbility_0500_commonEvent"],
};
var subscriberInfoStartAbility_0600 = {
  events: ["AMS_ConnectAbility_0600_commonEvent"],
};
var subscriberInfoStartAbility_0700 = {
  events: ["AMS_ConnectAbility_0700_commonEvent"],
};
var subscriberInfoStartAbility_0800 = {
  events: ["AMS_ConnectAbility_0800_commonEvent"],
};
var subscriberInfoStartAbility_0900 = {
  events: ["AMS_ConnectAbility_0900_commonEvent"],
};

var subscriberInfoStartAbility_1000 = {
  events: ["AMS_ConnectAbility_1000_commonEvent"],
};

var subscriberInfoStartAbility_1100 = {
  events: ["AMS_ConnectAbility_1100_commonEvent"],
};

var subscriberInfoStartAbility_1200 = {
  events: ["AMS_ConnectAbility_1200_commonEvent"],
};
var unsubscriberInfoStartAbility_0100 = {
  events: ["AMSc_disonnectAbility_0100_commonEvent"],
};
var unsubscriberInfoStartAbility_0200 = {
  events: ["AMSc_disonnectAbility_0200_commonEvent"],
};


const START_ABILITY_TIMEOUT = 1000;
globalThis.number = 0;

export default function abilityTest() {
  describe('ActssystemabilityTest', function () {

    /*
     * @tc.number: ACTS_ConnectAbility_0100
     * @tc.name: Connects a service ability
     * @tc.desc: Connects a service ability
     */
    it('ACTS_ConnectAbility_0100', 0, async function (done) {
      console.log('ACTS_ConnectAbility_0100====<begin');
      console.log('========ACTS_ConnectAbility_0100 1 called');
      var subscriber;
      let id;
      let connId;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_ConnectAbility_0100 7 CallBack data:====>" + JSON.stringify(data));
        clearTimeout(id);
        expect(data.event).assertEqual("AMS_ConnectAbility_0100_commonEvent");
        console.debug("====>ACTS_ConnectAbility_0100 5  ");
        globalThis.abilityContext.disconnectServiceExtensionAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          }
        );
        console.debug("====>ACTS_ConnectAbility_0100 6  ");
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)

      }

      commonEvent.createSubscriber(subscriberInfoStartAbility_0100).then(async (data) => {
        console.debug("====>ACTS_ConnectAbility_0100 2  Subscriber1====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack);
      })

      function unSubscribeCallback() {
        console.debug("====>UnSubscribe CallBack1====>");
        done();
      }

      function timeout() {
        expect().assertFail();
        console.debug('AMS_ConnectAbility_0100 timeout');
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        globalThis.abilityContext.disconnectServiceExtensionAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          });
      }
      function onConnectCallback(element, remote) {
        console.debug('ACTS_ConnectAbility_0100 _onConnectCallback ====> element='
          + JSON.stringify(element) + " , " + element);
        console.debug('ACTS_ConnectAbility_0100 _onConnectCallback ====> remote='
          + JSON.stringify(remote) + " , " + remote);
      }

      function onDisconnectCallback(element) {
        console.debug('ACTS_ConnectAbility_0100 _onDisconnectCallback ====> element='
          + JSON.stringify(element) + " , " + element);
      }

      function onFailedCallback(code) {
        console.debug('ACTS_ConnectAbility_0100 _onFailedCallback ====> code='
          + JSON.stringify(code) + " , " + code)
      }

      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>ACTS_ConnectAbility_0100 3  ");
      connId = await globalThis.abilityContext.connectServiceExtensionAbility(
        {
          bundleName: "com.example.actsconnectabilitysystemabilitytest",
          abilityName: "com.example.actsconnectabilitysystemabilitytest.ServiceAbility",
          action: "one",
        },
        {
          onConnect: onConnectCallback,
          onDisconnect: onDisconnectCallback,
          onFailed: onFailedCallback,
        }
      );
      console.debug("====>ACTS_ConnectAbility_0100 4  ");
    })

    /*
     * @tc.number: ACTS_ConnectAbility_0200
     * @tc.name: Connects a service ability
     * @tc.desc: Connects a service ability
     */
    it('ACTS_ConnectAbility_0200', 0, async function (done) {
      console.log('ACTS_ConnectAbility_0200====<begin');
      console.log('========StartConnect called');
      var subscriber;
      let id;
      let connId;
      function onFailedCallback(code) {
        console.log('ACTS_ConnectAbility_0200 Connectability errcode:' + code);
      }
      function subscribeCallBack(err, data) {
        console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
        clearTimeout(id);
        expect(data.event).assertEqual("AMS_ConnectAbility_0200_commonEvent");
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
      }
      commonEvent.createSubscriber(subscriberInfoStartAbility_0200).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack);
      })
      function unSubscribeCallback() {
        console.debug("====>UnSubscribe CallBack====>");
        done();
      }
      function timeout() {
        console.debug('AMS_ConnectAbility_0200 timeout');
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
      }
      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      connId = await globalThis.abilityContext.connectAbility(
        {
          bundleName: "com.example.actsconnectabilitysystemabilitytest",
          abilityName: "com.example.actsconnectabilitysystemabilitytest.ServiceAbilityone",
          action: "two",
        },
        {
          onFailed: onFailedCallback,
        },
      );
    })

    /*
     * @tc.number: ACTS_DisconnectAbility_0100
     * @tc.name: DisConnects a service ability
     * @tc.desc: DisConnects a service ability
     */
    it('ACTS_DisconnectAbility_0100', 0, async function (done) {
      console.log('ACTS_DisconnectAbility_0100====<begin');
      console.log('========ACTS_DisconnectAbility_0100 1  called');
      var subscriber;
      let id;
      let connId;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_DisconnectAbility_0100 5 CallBack data:====>" + JSON.stringify(data));
        clearTimeout(id);
        console.debug("====>ACTS_DisconnectAbility_0100 6====>");
        globalThis.abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          }
        );
        console.debug("====>ACTS_DisconnectAbility_0100 6====>");
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
      }
      commonEvent.createSubscriber(subscriberInfoStartAbility_0300).then(async (data) => {
        console.debug("====>ACTS_DisconnectAbility_0100 2  Subscriber====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack);
      })
      function unSubscribeCallback() {
        console.debug("====>UnSubscribe CallBack====>");
        setTimeout(() => {
          done()
        }, 1000)
      };
      function timeout() {
        expect().assertFail();
        console.debug('AMS_DonnectAbility_0300 timeout');
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        globalThis.abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          });
      }
      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>ACTS_DisconnectAbility_0100 3====>");
      connId = await globalThis.abilityContext.connectAbility(
        {
          bundleName: "com.example.actsconnectabilitysystemabilitytest",
          abilityName: "com.example.actsconnectabilitysystemabilitytest.ServiceAbility",
          action: "Three",
        },
      );
      console.debug("====>ACTS_DisconnectAbility_0100 4====>");
    })

    /*
     * @tc.number: ACTS_DisconnectAbility_0200
     * @tc.name: DisConnects a service ability
     * @tc.desc: DisConnects a service ability
     */
    it('ACTS_DisconnectAbility_0200', 0, async function (done) {
      console.log('ACTS_DisconnectAbility_0200 1====<begin');
      console.log('========ACTS_DisconnectAbility_0200 2 called');
      var subscriber;
      let id;
      var connId;
      var subscriberdisconnect;

      function subscribeCallBack(err, data) {
        id = setTimeout(timeout, START_ABILITY_TIMEOUT);
        console.debug("====>ACTS_DisconnectAbility_0200 3 CallBack1 data:====>" + JSON.stringify(data));
        commonEvent.createSubscriber(unsubscriberInfoStartAbility_0100).then(async (data) => {
          console.debug("====>ACTS_DisconnectAbility_0200 6 Subscriber====>");
          subscriberdisconnect = data;
          await commonEvent.subscribe(subscriberdisconnect, subscribedisconnectback);
          console.debug("====>ACTS_DisconnectAbility_0200 1111 connectAbility1====>");

          console.debug("====>ACTS_DisconnectAbility_0200 1111 connectAbility2====>");
          console.debug("====>ACTS_DisconnectAbility_0200 66 Subscriber====>");
          globalThis.abilityContext.disconnectAbility(
            999,
            (error, data) => {
              console.log('ACTS_DisconnectAbility_0200 5 DisconnectAbility result errCode : '
                + error.code + " data: " + data)
            });
        })
      }
      function subscribedisconnectback(err, data) {
        console.debug("====>ACTS_DisconnectAbility_0200 7 CallBack2 data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(subscriberdisconnect, () => {
          console.debug('unsubscribe subscriberdisconnect');
          commonEvent.unsubscribe(subscriber, () => {
            console.debug('unsubscribe subscriber')
            clearTimeout(id);
            expect().assertFail();
            done();
          })
        })
      }
      function timeout() {
        console.debug('ACTS_DisconnectAbility_0200 8 timeout');
        commonEvent.unsubscribe(subscriberdisconnect, () => {
          console.debug('unsubscribe subscriberdisconnect');
          commonEvent.unsubscribe(subscriber, () => {
            console.debug('unsubscribe subscriber')
            globalThis.abilityContext.disconnectAbility(
              connId,
              (error, data) => {
                console.log('ACTS_DisconnectAbility_0200 9 DisconnectAbility result errCode : '
                  + error.code + " data: " + data)
                console.debug("====>ACTS_DisconnectAbility_0200 99 Subscriber====>");
                setTimeout(() => {
                  done();
                }, 1000)
              });
          })
        })
      }
      commonEvent.createSubscriber(subscriberInfoStartAbility_0400).then(async (data) => {
        console.debug("====>ACTS_DisconnectAbility_0200 10 Subscriber====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack)
        connId = await globalThis.abilityContext.connectAbility(
          {
            bundleName: "com.example.actsconnectabilitysystemabilitytest",
            abilityName: "com.example.actsconnectabilitysystemabilitytest.ServiceAbility",
            action: "Four",
          },
        );
        console.debug("====>connId is:====>" + JSON.stringify(connId));
        console.debug("====>ACTS_DisconnectAbility_0200 1010 Subscriber====>");
      })
      function unSubscribeCallback() {
        console.debug("====>ACTS_DisconnectAbility_0200 1111 UnSubscribe CallBack====>");
        done();
      }
    })

    /*
     * @tc.number: ACTS_DisconnectAbility_0300
     * @tc.name: DisConnects a service ability
     * @tc.desc: DisConnects a service ability
     */
    it('ACTS_DisconnectAbility_0300', 0, async function (done) {
      console.log('ACTS_DisconnectAbility_0300====<begin');
      console.log('========StartConnect called');
      var subscriber;
      let id;
      let connId;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_DisconnectAbility_0300 4 CallBack data:====>" + JSON.stringify(data));
        clearTimeout(id);
        expect(data.event).assertEqual("AMS_ConnectAbility_0500_commonEvent");
        globalThis.abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('ACTS_DisconnectAbility_0300 5 DisconnectAbility result errCode : '
              + error.code + " data: " + data)
          }
        );
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
      }
      commonEvent.createSubscriber(subscriberInfoStartAbility_0500).then(async (data) => {
        console.debug("====>ACTS_DisconnectAbility_0300 1 Subscriber====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack);
      })
      function unSubscribeCallback() {
        console.debug("====>ACTS_DisconnectAbility_0300 6 CallBack====>");
        setTimeout(() => {
          done();
        }, 1000)
      }
      function timeout() {
        expect().assertFail();
        console.debug('AMS_ConnectAbility_0500 timeout');
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        globalThis.abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('ACTS_DisconnectAbility_0300 7 DisconnectAbility result errCode : '
              + error.code + " data: " + data)
          });
      }
      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>ACTS_DisconnectAbility_0300 3 ");
      connId = await globalThis.abilityContext.connectAbility(
        {
          bundleName: "com.example.actsconnectabilitysystemabilitytest",
          abilityName: "com.example.actsconnectabilitysystemabilitytest.ServiceAbility",
          action: "Five",
        },
      );
      console.debug("====>ACTS_DisconnectAbility_0300 4 ");
    })

    /*
     * @tc.number: ACTS_DisconnectAbility_0400
     * @tc.name: DisConnects a service ability
     * @tc.desc: DisConnects a service ability
     */
    it('ACTS_DisconnectAbility_0400', 0, async function (done) {
      console.log('ACTS_DisconnectAbility_0400 1====<begin');
      console.log('========ACTS_DisconnectAbility_0400 2 called');
      var subscriber;
      let id;
      var connId;
      var subscriberdisconnect;

      function subscribeCallBack(err, data) {
        id = setTimeout(timeout, START_ABILITY_TIMEOUT);
        console.debug("====>ACTS_DisconnectAbility_0400 3 CallBack1 data:====>" + JSON.stringify(data));
        commonEvent.createSubscriber(unsubscriberInfoStartAbility_0200).then(async (data) => {
          console.debug("====>ACTS_DisconnectAbility_0400 6 Subscriber====>");
          subscriberdisconnect = data;
          await commonEvent.subscribe(subscriberdisconnect, subscribedisconnectback);
          console.debug("====>ACTS_DisconnectAbility_0400 1111 connectAbility1====>");

          console.debug("====>ACTS_DisconnectAbility_0400 1111 connectAbility2====>");
          console.debug("====>ACTS_DisconnectAbility_0400 66 Subscriber====>");
          globalThis.abilityContext.disconnectAbility(
            999,
            (error, data) => {
              console.log('ACTS_DisconnectAbility_0400 5 DisconnectAbility result errCode : '
                + error.code + " data: " + data)
            });
        })
      }
      function subscribedisconnectback(err, data) {
        console.debug("====>ACTS_DisconnectAbility_0400 7 CallBack2 data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(subscriberdisconnect, () => {
          console.debug('unsubscribe subscriberdisconnect');
          commonEvent.unsubscribe(subscriber, () => {
            console.debug('unsubscribe subscriber')
            clearTimeout(id);
            expect().assertFail();
            done();
          })
        })
      }
      function timeout() {
        console.debug('ACTS_DisconnectAbility_0400 8 timeout');
        commonEvent.unsubscribe(subscriberdisconnect, () => {
          console.debug('unsubscribe subscriberdisconnect');
          commonEvent.unsubscribe(subscriber, () => {
            console.debug('unsubscribe subscriber')
            globalThis.abilityContext.disconnectAbility(
              connId,
              (error, data) => {
                console.log('ACTS_DisconnectAbility_0400 9 DisconnectAbility result errCode : '
                  + error.code + " data: " + data)
                console.debug("====>ACTS_DisconnectAbility_0400 99 Subscriber====>");
                setTimeout(() => {
                  done();
                }, 1000)
              });
          })
        })
      }
      commonEvent.createSubscriber(subscriberInfoStartAbility_0600).then(async (data) => {
        console.debug("====>ACTS_DisconnectAbility_0400 10 Subscriber====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack)
        connId = await globalThis.abilityContext.connectAbility(
          {
            bundleName: "com.example.actsconnectabilitysystemabilitytest",
            abilityName: "com.example.actsconnectabilitysystemabilitytest.ServiceAbility",
            action: "Six",
          },
        );
        console.debug("====>connId is:====>" + JSON.stringify(connId));
        console.debug("====>ACTS_DisconnectAbility_0400 1010 Subscriber====>");
      })
      function unSubscribeCallback() {
        console.debug("====>ACTS_DisconnectAbility_0400 1111 UnSubscribe CallBack====>");
        done();
      }
    })

    /*
     * @tc.number: ACTS_ExtensionConnectAbility_0100
     * @tc.name: Service connect a service ability
     * @tc.desc: Service connect a service ability
     */
    it('ACTS_ExtensionConnectAbility_0100', 0, async function (done) {
      console.log('ACTS_ExtensionConnectAbility_0100====<begin');
      console.log('========ACTS_ExtensionConnectAbility_0100 1 called');
      var subscriber;
      let id;
      let connId;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_ExtensionConnectAbility_0100 7 CallBack data:====>" + JSON.stringify(data));
        clearTimeout(id);
        expect(data.event).assertEqual("AMS_ConnectAbility_0700_commonEvent");
        console.debug("====>ACTS_ExtensionConnectAbility_0100 5  ");
        globalThis.abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          }
        );
        console.debug("====>ACTS_ExtensionConnectAbility_0100 6  ");
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
      }
      commonEvent.createSubscriber(subscriberInfoStartAbility_0700).then(async (data) => {
        console.debug("====>ACTS_ExtensionConnectAbility_0100 2  Subscriber1====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack);
      })
      function unSubscribeCallback() {
        console.debug("====>UnSubscribe CallBack1====>");
        setTimeout(() => {
          done();
        }, 1000)
      }
      function timeout() {
        expect().assertFail();
        console.debug('ACTS_ExtensionConnectAbility_0100 timeout');
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        globalThis.abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          });
      }
      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>ACTS_ExtensionConnectAbility_0100 3  ");
      connId = await globalThis.abilityContext.connectAbility(
        {
          bundleName: "com.example.actsconnectabilitysystemabilitytest",
          abilityName: "com.example.actsconnectabilitysystemabilitytest.ServiceAbility",
          action: "Seven",
        },
      );
      console.debug("====>ACTS_ExtensionConnectAbility_0100 4  ");
    })

    /*
     * @tc.number: ACTS_ExtensionConnectAbility_0200
     * @tc.name: Service connect a service ability
     * @tc.desc: Service connect a service ability
     */
    it('ACTS_ExtensionConnectAbility_0200', 0, async function (done) {
      console.log('ACTS_ExtensionConnectAbility_0200====<begin');
      console.log('========ACTS_ExtensionConnectAbility_0200 1 called');
      var subscriber;
      let id;
      let connId;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_ExtensionConnectAbility_0200 7 CallBack data:====>" + JSON.stringify(data));
        clearTimeout(id);
        expect(data.event).assertEqual("AMS_ConnectAbility_0800_commonEvent");
        console.debug("====>ACTS_ExtensionConnectAbility_0200 5  ");
        globalThis.abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          }
        );
        console.debug("====>ACTS_ExtensionConnectAbility_0200 6  ");
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
      }
      commonEvent.createSubscriber(subscriberInfoStartAbility_0800).then(async (data) => {
        console.debug("====>ACTS_ExtensionConnectAbility_0200 2  Subscriber1====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack);
      })
      function unSubscribeCallback() {
        console.debug("====>UnSubscribe CallBack1====>");
        setTimeout(() => {
          done();
        }, 1000)
      }
      function timeout() {
        console.debug('ACTS_ExtensionConnectAbility_0200 timeout');
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        globalThis.abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          });
      }
      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>ACTS_ExtensionConnectAbility_0200 3  ");
      connId = await globalThis.abilityContext.connectAbility(
        {
          bundleName: "com.example.actsconnectabilitysystemabilitytest",
          abilityName: "com.example.actsconnectabilitysystemabilitytest.ServiceAbility",
          action: "Eight",
        },
      );
      console.debug("====>ACTS_ExtensionConnectAbility_0200 4  ");
    })

    /*
     * @tc.number: ACTS_ExtensionDisconnectAbility_0100
     * @tc.name: Service disConnects a service ability
     * @tc.desc: Service disConnects a service ability
     */
    it('ACTS_ExtensionDisconnectAbility_0100', 0, async function (done) {
      console.log('ACTS_ExtensionDisconnectAbility_0100====<begin');
      console.log('========ACTS_ExtensionDisconnectAbility_0100 1 called');
      var subscriber;
      let id;
      let connId;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_ExtensionDisconnectAbility_0100 7 CallBack data:====>" + JSON.stringify(data));
        clearTimeout(id);
        expect(data.event).assertEqual("AMS_ConnectAbility_0900_commonEvent");
        console.debug("====>ACTS_ExtensionDisconnectAbility_0100 5  ");
        globalThis.abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          }
        );
        console.debug("====>ACTS_ExtensionDisconnectAbility_0100 6  ");
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
      }
      commonEvent.createSubscriber(subscriberInfoStartAbility_0900).then(async (data) => {
        console.debug("====>ACTS_ExtensionDisconnectAbility_0100 2  Subscriber1====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack);
      })
      function unSubscribeCallback() {
        console.debug("====>UnSubscribe CallBack1====>");
        setTimeout(() => {
          done();
        }, 1000)
      }
      function timeout() {
        expect().assertFail();
        console.debug('ACTS_ExtensionDisconnectAbility_0100 timeout');
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        globalThis.abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          });
      }
      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>ACTS_ExtensionDisconnectAbility_0100 3  ");
      connId = await globalThis.abilityContext.connectAbility(
        {
          bundleName: "com.example.actsconnectabilitysystemabilitytest",
          abilityName: "com.example.actsconnectabilitysystemabilitytest.ServiceAbility",
          action: "Nine",
        },
      );
      console.debug("====>ACTS_ExtensionDisconnectAbility_0100 4  ");
    })

    /*
     * @tc.number: ACTS_ExtensionDisconnectAbility_0200
     * @tc.name: Service disConnects a service ability
     * @tc.desc: Service disConnects a service ability
     */
    it('ACTS_ExtensionDisconnectAbility_0200', 0, async function (done) {
      console.log('ACTS_ExtensionDisconnectAbility_0200====<begin');
      console.log('========ACTS_ExtensionDisconnectAbility_0200 1 called');
      var subscriber;
      let id;
      let connId;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_ExtensionDisconnectAbility_0200 7 CallBack data:====>" + JSON.stringify(data));
        clearTimeout(id);
        expect(data.event).assertEqual("AMS_ConnectAbility_1000_commonEvent");
        console.debug("====>ACTS_ExtensionDisconnectAbility_0200 5  ");
        globalThis.abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          }
        );
        console.debug("====>ACTS_ExtensionDisconnectAbility_0200 6  ");
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
      }
      commonEvent.createSubscriber(subscriberInfoStartAbility_1000).then(async (data) => {
        console.debug("====>ACTS_ExtensionDisconnectAbility_0200 2  Subscriber1====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack);
      })
      function unSubscribeCallback() {
        console.debug("====>UnSubscribe CallBack1====>");
        setTimeout(() => {
          done();
        }, 1000)
      }
      function timeout() {
        expect().assertFail();
        console.debug('ACTS_ExtensionDisconnectAbility_0200 timeout');
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        globalThis.abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          });
      }
      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>ACTS_ExtensionDisconnectAbility_0200 3  ");
      connId = await globalThis.abilityContext.connectAbility(
        {
          bundleName: "com.example.actsconnectabilitysystemabilitytest",
          abilityName: "com.example.actsconnectabilitysystemabilitytest.ServiceAbility",
          action: "Ten",
        },
      );
      console.debug("====>ACTS_ExtensionDisconnectAbility_0200 4  ");
    })

    /*
     * @tc.number: ACTS_ExtensionDisconnectAbility_0300
     * @tc.name: Service disConnects a service ability
     * @tc.desc: Service disConnects a service ability
     */
    it('ACTS_ExtensionDisconnectAbility_0300', 0, async function (done) {
      console.log('ACTS_ExtensionDisconnectAbility_0300====<begin');
      console.log('========ACTS_ExtensionDisconnectAbility_0300 1 called');
      var subscriber;
      let id;
      let connId;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_ExtensionDisconnectAbility_0300 7 CallBack data:====>" + JSON.stringify(data));
        clearTimeout(id);
        expect(data.event).assertEqual("AMS_ConnectAbility_1100_commonEvent");
        console.debug("====>ACTS_ExtensionDisconnectAbility_0300 5  ");
        globalThis.abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          }
        );
        console.debug("====>ACTS_ExtensionDisconnectAbility_0300 6  ");
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
      }
      commonEvent.createSubscriber(subscriberInfoStartAbility_1100).then(async (data) => {
        console.debug("====>ACTS_ExtensionDisconnectAbility_0300 2  Subscriber1====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack);
      })
      function unSubscribeCallback() {
        console.debug("====>UnSubscribe CallBack1====>");
        setTimeout(() => {
          done();
        }, 1000)
      }
      function timeout() {
        console.debug('ACTS_ExtensionDisconnectAbility_0300 timeout');
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        globalThis.abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          });
      }
      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>ACTS_ExtensionDisconnectAbility_0300 3  ");
      connId = await globalThis.abilityContext.connectAbility(
        {
          bundleName: "com.example.actsconnectabilitysystemabilitytest",
          abilityName: "com.example.actsconnectabilitysystemabilitytest.ServiceAbility",
          action: "Ten one",
        },
      );
      console.debug("====>ACTS_ExtensionDisconnectAbility_0300 4  ");
    })

    /*
     * @tc.number: ACTS_ExtensionDisconnectAbility_0400
     * @tc.name: Service disConnects a service ability
     * @tc.desc: Service disConnects a service ability
     */
    it('ACTS_ExtensionDisconnectAbility_0400', 0, async function (done) {
      console.log('ACTS_ExtensionDisconnectAbility_0400====<begin');
      console.log('========ACTS_ExtensionDisconnectAbility_0400 1 called');
      var subscriber;
      let id;
      let connId;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_ThirdPartyExtensionDisconnectAbility_0400 7 CallBack data:====>"
          + JSON.stringify(data));
        clearTimeout(id);
        expect(data.event).assertEqual("AMS_ConnectAbility_1200_commonEvent");
        console.debug("====>ACTS_ExtensionDisconnectAbility_0400 5  ");
        globalThis.abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          }
        );
        console.debug("====>ACTS_ExtensionDisconnectAbility_0400 6  ");
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
      }
      commonEvent.createSubscriber(subscriberInfoStartAbility_1200).then(async (data) => {
        console.debug("====>ACTS_ExtensionDisconnectAbility_0400 2  Subscriber1====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack);
      })
      function unSubscribeCallback() {
        console.debug("====>UnSubscribe CallBack1====>");
        setTimeout(() => {
          done();
        }, 1000)
      }
      function timeout() {
        console.debug('ACTS_ExtensionDisconnectAbility_0400 timeout');
        commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        globalThis.abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('featureAbilityTest DisconnectAbility result errCode : ' + error.code + " data: " + data)
          });
      }
      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>ACTS_ExtensionDisconnectAbility_0400 3  ");
      connId = await globalThis.abilityContext.connectAbility(
        {
          bundleName: "com.example.actsconnectabilitysystemabilitytest",
          abilityName: "com.example.actsconnectabilitysystemabilitytest.ServiceAbility",
          action: "Ten two",
        },
      );
      console.debug("====>ACTS_ExtensionDisconnectAbility_0400 4  ");
    })
  })
}


