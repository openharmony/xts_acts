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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import commonEvent from '@ohos.commonEvent'
import osaccount from '@ohos.account.osAccount'

var subscriberInfo_MainAbility = {
  events: ["ACTS_InterfaceMultiUsersExtension_CommonEvent"]
};
var subscriberInfo_MainAbility2 = {
  events: ["ACTS_TerminateSelf_CommonEvent"]
};
var osAccountManager
const START_ABILITY_TIMEOUT = 6000;
globalThis.number = 0;
console.debug("====>in Ability.test====>");
export default function abilityTest() {
  console.debug("====>in function abilityTest====>");
  describe('ActsInterfaceMultiUsersExtensionThirdTest', function () {
    console.debug("====>in ACTS_InterfaceMultiUsers====>");

    /*
     * @tc.number  : ACTS_ThirdPartyExtensionStartAbility_0100
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options succeeded.(promise)
     */
    it('ACTS_ThirdPartyExtensionStartAbility_0100', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 1
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_InterfaceMultiUsersExtension_CommonEvent").assertTrue();
        console.debug("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_InterfaceMultiUsersExtension_CommonEvent"){
          startresult = true
        }
        globalThis.abilityContext.disconnectServiceExtensionAbility(globalThis.number).then((data)=>{
          console.debug("====>data is====>" + JSON.stringify(data));
        })
        console.log('====>disconnectAbility finish');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>0100start connectAbility====>");
          globalThis.number = await globalThis.abilityContext.connectServiceExtensionAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersextensionthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersextensionthirdtest.ServiceAbility'
            })
          console.debug("====>number is====>" + JSON.stringify(globalThis.number));
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(true);
        setTimeout(()=>{
          done()
        },1000)
      }

      function timeout() {
        console.debug('in ACTS_ThirdPartyExtensionStartAbility_0100 timeout');
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_ThirdPartyExtensionStartAbility_0100 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_ThirdPartyExtensionStartAbility_0200
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options failed.(promise)
     */
    it('ACTS_ThirdPartyExtensionStartAbility_0200', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 2
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);
      function SubscribeCallBack (err, data) {
        expect().assertFail();
        expect(data.event == "ACTS_InterfaceMultiUsersExtension_CommonEvent").assertTrue();
        console.debug("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_InterfaceMultiUsersExtension_CommonEvent"){
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(false);
        globalThis.abilityContext.disconnectServiceExtensionAbility(globalThis.number).then((data)=>{
          console.debug("====>data is====>" + JSON.stringify(data));
        })
        console.log('====>disconnectAbility finish');
        setTimeout(()=>{
          done();
        },1000)
      }
      function onConnectCallback(element, remote) {
        console.log('  onConnectCallback====> element=' + JSON.stringify(element));
        console.log('  onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(()=> {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if(flag == true) {
            console.debug('ACTS_ThirdPartyExtensionStartAbility_0200 - timeout');
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
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>0200start connectAbility====>");
          globalThis.number = await globalThis.abilityContext.connectServiceExtensionAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersextensionthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersextensionthirdtest.ServiceAbility'
            },{
            onConnect:onConnectCallback,
            onDisconnect:onDisconnectCallback,
            onFailed: onFailedCallback
          })
          console.debug("====>number is====>" + JSON.stringify(globalThis.number));
        })
      })
    })

    /*
     * @tc.number  : ACTS_ThirdPartyExtensionStartAbility_0300
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options succeeded.(callback)
     */
        it('ACTS_ThirdPartyExtensionStartAbility_0300', 0, async function (done) {
          let Subscriber
          var flag = true
          var startresult = false
          globalThis.startnum=3
          console.log('====>globalThis.startnum is====>' + globalThis.startnum);
          function SubscribeCallBack (err, data) {
            expect(data.event == "ACTS_InterfaceMultiUsersExtension_CommonEvent").assertTrue();
            console.debug("====>0300 Subscribe CallBack data:====>" + JSON.stringify(data));
            if(data.event == "ACTS_InterfaceMultiUsersExtension_CommonEvent"){
              startresult = true
            }
            globalThis.abilityContext.disconnectServiceExtensionAbility(globalThis.number).then((data)=>{
              console.debug("====>data is====>" + JSON.stringify(data));
            })
            console.log('====>disconnectAbility finish');
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          }
          commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
            console.debug("====>Create Subscriber====>");
            data.getSubscribeInfo().then(async (SubscribeInfo)=>{
              console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
              Subscriber = data;
              commonEvent.subscribe(Subscriber, SubscribeCallBack);
              console.debug("====>0300start connectAbility====>");
              globalThis.number = await globalThis.abilityContext.connectServiceExtensionAbility(
                {
                  bundleName: 'com.acts.actsinterfacemultiusersextensionthirdtest',
                  abilityName: 'com.acts.actsinterfacemultiusersextensionthirdtest.ServiceAbility'
                })
              console.debug("====>number is====>" + JSON.stringify(globalThis.number));
            })
          })

          function UnSubscribeCallback() {
            console.debug("====>UnSubscribeCallback====>");
            flag = false
            expect(startresult).assertEqual(true);
            setTimeout(()=>{
              done()
            },1000)
          }

          function timeout() {
            console.debug('in ACTS_ThirdPartyExtensionStartAbility_0300 timeout');
            if(flag == true) {
              expect().assertFail();
              console.debug('ACTS_ThirdPartyExtensionStartAbility_0300 - timeout');
              commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
            }
          }

          setTimeout(timeout, START_ABILITY_TIMEOUT);
        })

    /*
     * @tc.number  : ACTS_ThirdPartyExtensionStartAbility_0400
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options failed.(callback)
     */
    it('ACTS_ThirdPartyExtensionStartAbility_0400', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 4
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);
      function SubscribeCallBack (err, data) {
        expect().assertFail();
        expect(data.event == "ACTS_InterfaceMultiUsersExtension_CommonEvent").assertTrue();
        console.debug("====>0400 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_InterfaceMultiUsersExtension_CommonEvent"){
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(false);
        globalThis.abilityContext.disconnectServiceExtensionAbility(globalThis.number).then((data)=>{
          console.debug("====>data is====>" + JSON.stringify(data));
        })
        console.log('====>disconnectAbility finish');
        setTimeout(()=>{
          done();
        },1000)
      }
      function onConnectCallback(element, remote) {
        console.log('   onConnectCallback====> element=' + JSON.stringify(element));
        console.log('   onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(()=> {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if(flag == true) {
            console.debug('ACTS_ThirdPartyExtensionStartAbility_0400 - timeout');
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
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>0400start connectAbility====>");
          globalThis.number = await globalThis.abilityContext.connectServiceExtensionAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersextensionthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersextensionthirdtest.ServiceAbility'
            },{
            onConnect:onConnectCallback,
            onDisconnect:onDisconnectCallback,
            onFailed: onFailedCallback
          })
          console.debug("====>number is====>" + JSON.stringify(globalThis.number));
        })
      })

    })

    /*
     * @tc.number  : ACTS_ThirdPartyExtensionStartAbility_0500
     * @tc.name    : start new ability
     * @tc.desc    : Starting mainability2 with startability succeeded.(promise)
     */
    it('ACTS_ThirdPartyExtensionStartAbility_0500', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 5
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_InterfaceMultiUsersExtension_CommonEvent").assertTrue();
        console.debug("====>0500 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_InterfaceMultiUsersExtension_CommonEvent"){
          startresult = true
        }
        globalThis.abilityContext.disconnectServiceExtensionAbility(globalThis.number).then((data)=>{
          console.debug("====>data is====>" + JSON.stringify(data));
        })
        console.log('====>disconnectAbility finish');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>0500start connectAbility====>");
          globalThis.number = await globalThis.abilityContext.connectServiceExtensionAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersextensionthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersextensionthirdtest.ServiceAbility'
            })
          console.debug("====>number is====>" + JSON.stringify(globalThis.number));
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(true);
        setTimeout(()=>{
          done()
        },1000)
      }

      function timeout() {
        console.debug('in ACTS_ThirdPartyExtensionStartAbility_0500 timeout');
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_ThirdPartyExtensionStartAbility_0500 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_ThirdPartyExtensionStartAbility_0600
     * @tc.name    : start new ability
     * @tc.desc    : Starting mainability2 with startability failed.(promise)
     */
    it('ACTS_ThirdPartyExtensionStartAbility_0600', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 6
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);
      function SubscribeCallBack (err, data) {
        expect().assertFail();
        expect(data.event == "ACTS_InterfaceMultiUsersExtension_CommonEvent").assertTrue();
        console.debug("====>0600 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_InterfaceMultiUsersExtension_CommonEvent"){
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(false);
        globalThis.abilityContext.disconnectServiceExtensionAbility(globalThis.number).then((data)=>{
          console.debug("====>data is====>" + JSON.stringify(data));
        })
        console.log('====>disconnectAbility finish');
        setTimeout(()=>{
          done();
        },1000)
      }
      function onConnectCallback(element, remote) {
        console.log('  onConnectCallback====> element=' + JSON.stringify(element));
        console.log('  onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(()=> {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if(flag == true) {
            console.debug('ACTS_ThirdPartyExtensionStartAbility_0600 - timeout');
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
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>0600start connectAbility====>");
          globalThis.number = await globalThis.abilityContext.connectServiceExtensionAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersextensionthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersextensionthirdtest.ServiceAbility'
            },{
            onConnect:onConnectCallback,
            onDisconnect:onDisconnectCallback,
            onFailed: onFailedCallback
          })
          console.debug("====>number is====>" + JSON.stringify(globalThis.number));
        })
      })
    })

    /*
     * @tc.number  : ACTS_ThirdPartyExtensionStartAbility_0700
     * @tc.name    : start new ability
     * @tc.desc    : Starting mainability2 with startability succeeded.(callback)
     */
        it('ACTS_ThirdPartyExtensionStartAbility_0700', 0, async function (done) {
          let Subscriber
          var flag = true
          var startresult = false
          globalThis.startnum=7
          console.log('====>globalThis.startnum is====>' + globalThis.startnum);
          function SubscribeCallBack (err, data) {
            expect(data.event == "ACTS_InterfaceMultiUsersExtension_CommonEvent").assertTrue();
            console.debug("====>0700 Subscribe CallBack data:====>" + JSON.stringify(data));
            if(data.event == "ACTS_InterfaceMultiUsersExtension_CommonEvent"){
              startresult = true
            }
            globalThis.abilityContext.disconnectServiceExtensionAbility(globalThis.number).then((data)=>{
              console.debug("====>data is====>" + JSON.stringify(data));
            })
            console.log('====>disconnectAbility finish');
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          }
          commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
            console.debug("====>Create Subscriber====>");
            data.getSubscribeInfo().then(async (SubscribeInfo)=>{
              console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
              Subscriber = data;
              commonEvent.subscribe(Subscriber, SubscribeCallBack);
              console.debug("====>0700start connectAbility====>");
              globalThis.number = await globalThis.abilityContext.connectServiceExtensionAbility(
                {
                  bundleName: 'com.acts.actsinterfacemultiusersextensionthirdtest',
                  abilityName: 'com.acts.actsinterfacemultiusersextensionthirdtest.ServiceAbility'
                })
              console.debug("====>number is====>" + JSON.stringify(globalThis.number));
            })
          })

          function UnSubscribeCallback() {
            console.debug("====>UnSubscribeCallback====>");
            flag = false
            expect(startresult).assertEqual(true);
            setTimeout(()=>{
              done()
            },1000)
          }

          function timeout() {
            console.debug('in ACTS_ThirdPartyExtensionStartAbility_0700 timeout');
            if(flag == true) {
              expect().assertFail();
              console.debug('ACTS_ThirdPartyExtensionStartAbility_0700 - timeout');
              commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
            }
          }

          setTimeout(timeout, START_ABILITY_TIMEOUT);

        })

    /*
     * @tc.number  : ACTS_ThirdPartyExtensionStartAbility_0800
     * @tc.name    : start new ability
     * @tc.desc    : Starting mainability2 with startability failed.(callback)
     */
    it('ACTS_ThirdPartyExtensionStartAbility_0800', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 8
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);
      function SubscribeCallBack (err, data) {
        expect().assertFail();
        expect(data.event == "ACTS_InterfaceMultiUsersExtension_CommonEvent").assertTrue();
        console.debug("====>0800 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_InterfaceMultiUsersExtension_CommonEvent"){
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(false);
        globalThis.abilityContext.disconnectServiceExtensionAbility(globalThis.number).then((data)=>{
          console.debug("====>data is====>" + JSON.stringify(data));
        })
        console.log('====>disconnectAbility finish');
        setTimeout(()=>{
          done();
        },1000)
      }
      function onConnectCallback(element, remote) {
        console.log('   onConnectCallback====> element=' + JSON.stringify(element));
        console.log('   onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(()=> {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if(flag == true) {
            console.debug('ACTS_ThirdPartyExtensionStartAbility_0800 - timeout');
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
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>0800start connectAbility====>");
          globalThis.number = await globalThis.abilityContext.connectServiceExtensionAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersextensionthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersextensionthirdtest.ServiceAbility'
            },{
            onConnect:onConnectCallback,
            onDisconnect:onDisconnectCallback,
            onFailed: onFailedCallback
          })
          console.debug("====>number is====>" + JSON.stringify(globalThis.number));
        })
      })
    })
    /*
     * @tc.number  : ACTS_ThirdPartyExtensionTerminateSelf_0100
     * @tc.name    : Use terminateself to terminate ability
     * @tc.desc    : Starting mainability2 with startAbility then terminateself ability succeeded.(promise)
     */
    it('ACTS_ThirdPartyExtensionTerminateSelf_0100', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 9
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
        console.debug("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_TerminateSelf_CommonEvent"){
          startresult = true
        }
        globalThis.abilityContext.disconnectServiceExtensionAbility(globalThis.number).then((data)=>{
          console.debug("====>data is====>" + JSON.stringify(data));
        })
        console.log('====>disconnectAbility finish');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility2).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>0100start connectAbility====>");
          globalThis.number = await globalThis.abilityContext.connectServiceExtensionAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersextensionthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersextensionthirdtest.ServiceAbility'
            })
          console.debug("====>number is====>" + JSON.stringify(globalThis.number));
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(true);
        setTimeout(()=>{
          done()
        },1000)
      }

      function timeout() {
        console.debug('in ACTS_ThirdPartyExtensionTerminateSelf_0100 timeout');
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_ThirdPartyExtensionTerminateSelf_0100 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })
    /*
     * @tc.number  : ACTS_ThirdPartyExtensionTerminateSelf_0200
     * @tc.name    : Use terminateself to terminate ability
     * @tc.desc    : Starting mainability2 with startAbility then terminateself ability failed.(promise)
     */
    it('ACTS_ThirdPartyExtensionTerminateSelf_0200', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 10
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);
      function SubscribeCallBack (err, data) {
        expect().assertFail();
        expect(data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
        console.debug("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_TerminateSelf_CommonEvent"){
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(false);
        globalThis.abilityContext.disconnectServiceExtensionAbility(globalThis.number).then((data)=>{
          console.debug("====>data is====>" + JSON.stringify(data));
        })
        console.log('====>disconnectAbility finish');
        setTimeout(()=>{
          done();
        },1000)
      }
      function onConnectCallback(element, remote) {
        console.log('  onConnectCallback====> element=' + JSON.stringify(element));
        console.log('  onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(()=> {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if(flag == true) {
            console.debug('    - timeout');
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
      commonEvent.createSubscriber(subscriberInfo_MainAbility2).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>0200start connectAbility====>");
          globalThis.number = await globalThis.abilityContext.connectServiceExtensionAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersextensionthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersextensionthirdtest.ServiceAbility'
            },{
            onConnect:onConnectCallback,
            onDisconnect:onDisconnectCallback,
            onFailed: onFailedCallback
          })
          console.debug("====>number is====>" + JSON.stringify(globalThis.number));
        })
      })

    })
    /*
     * @tc.number  : ACTS_ThirdPartyExtensionTerminateSelf_0300
     * @tc.name    : Use terminateself to terminate ability
     * @tc.desc    : Starting mainability2 with startAbility then terminateself ability succeeded.(callback)
     */
    it('ACTS_ThirdPartyExtensionTerminateSelf_0300', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 11
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
        console.debug("====>0300 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_TerminateSelf_CommonEvent"){
          startresult = true
        }
        globalThis.abilityContext.disconnectServiceExtensionAbility(globalThis.number).then((data)=>{
          console.debug("====>data is====>" + JSON.stringify(data));
        })
        console.log('====>disconnectAbility finish');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility2).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>0300start connectAbility====>");
          globalThis.number = await globalThis.abilityContext.connectServiceExtensionAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersextensionthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersextensionthirdtest.ServiceAbility'
            })
          console.debug("====>number is====>" + JSON.stringify(globalThis.number));
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(true);
        setTimeout(()=>{
          done()
        },1000)
      }

      function timeout() {
        console.debug('in ACTS_ThirdPartyExtensionTerminateSelf_0300 timeout');
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_ThirdPartyExtensionTerminateSelf_0300 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })
    /*
     * @tc.number  : ACTS_ThirdPartyExtensionTerminateSelf_0400
     * @tc.name    : Use terminateself to terminate ability
     * @tc.desc    : Starting mainability2 with startAbility then terminateself ability failed.(callback)
     */
    it('ACTS_ThirdPartyExtensionTerminateSelf_0400', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      globalThis.startnum = 12
      console.log('====>globalThis.startnum is====>' + globalThis.startnum);
      function SubscribeCallBack (err, data) {
        expect().assertFail();
        expect(data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
        console.debug("====>0400 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_TerminateSelf_CommonEvent"){
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(false);
        globalThis.abilityContext.disconnectServiceExtensionAbility(globalThis.number).then((data)=>{
          console.debug("====>data is====>" + JSON.stringify(data));
        })
        console.log('====>disconnectAbility finish');
        setTimeout(()=>{
          done();
        },1000)
      }
      function onConnectCallback(element, remote) {
        console.log('ACTS_ThirdPartyExtensionTerminateSelf_0400 onConnectCallback====> element='
        + JSON.stringify(element));
        console.log('ACTS_ThirdPartyExtensionTerminateSelf_0400 onConnectCallback====> remote='
        + JSON.stringify(remote));
        setTimeout(()=> {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if(flag == true) {
            console.debug('ACTS_ThirdPartyExtensionTerminateSelf_0400 - timeout');
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
      commonEvent.createSubscriber(subscriberInfo_MainAbility2).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>0400start connectAbility====>");
          globalThis.number = await globalThis.abilityContext.connectServiceExtensionAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersextensionthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersextensionthirdtest.ServiceAbility'
            },{
            onConnect:onConnectCallback,
            onDisconnect:onDisconnectCallback,
            onFailed: onFailedCallback
          })
          console.debug("====>number is====>" + JSON.stringify(globalThis.number));
        })
      })
    })
  })
}