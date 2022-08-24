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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import commonEvent from '@ohos.commonEvent'
import appManager from '@ohos.application.appManager'
import osaccount from '@ohos.account.osAccount'

var subscriberInfo_MainAbility = {
  events: ["ACTS_InterfaceMultiUsers_0100_Start_CommonEvent","ACTS_TerminateSelf_CommonEvent"]
};
var subscriberInfo_killprocess ={
  events:["ACTS_KillProcess"]
}
var osAccountManager
const START_ABILITY_TIMEOUT = 10000;
console.debug("====>in Ability.test====>");
export default function abilityTest() {
  console.debug("====>in function abilityTest====>");
  describe('ActsInterfaceMultiUsersTest', function () {
    // afterAll(function() {
    //   osAccountManager = osaccount.getAccountManager();
    //   console.debug("====>get AccountManager finish====");
    //   osAccountManager.activateOsAccount(100, (err)=>{
    //     console.debug("====>activateOsAccount localId: 100 err:" + JSON.stringify(err));
        // osAccountManager.removeOsAccount(101, (err)=>{
        //   console.debug("====>remove localId: 101" + " err:" + JSON.stringify(err));
        // })
    //   })
    // })
    console.debug("====>in ACTS_InterfaceMultiUsers====>");
    /*
     * @tc.number  : ACTS_startAbility_0100
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options succeeded.(promise)
     */
    it('ACTS_StartAbility_0100', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
        console.debug("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent"){
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiuserstest',
              abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility2'
            }, {
            windowMode:0
          }).then((data)=>{
            console.debug("====>startAbility end====>");
            console.debug("====>data is====>" + JSON.stringify(data));
          })
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(true);
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_startAbility_0100 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_startAbility_0200
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options failed.(promise)
     */
    it('ACTS_StartAbility_0200', 0, async function (done) {
      let Subscriber
      function SubscribeCallBack (err, data) {
        expect().assertFail();
        console.debug("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then((data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.error',
              abilityName: 'com.acts.error.MainAbility2'
            }, {
            windowMode:0
          }).then(()=>{
            console.debug("====>startAbility end====>");
          })
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_startAbility_0200 - timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_startAbility_0300
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options succeeded.(callback)
     */
    it('ACTS_StartAbility_0300', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
        console.debug("====>0300 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent"){
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiuserstest',
              abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility2'
            }, {
            windowMode:0
          },() => {
            console.debug("====>startAbility end====>" );
          })
        })
      })

      function UnSubscribeCallback() {
        flag = false
        console.debug("====>UnSubscribeCallback====>");
        expect(startresult).assertEqual(true);
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_startAbility_0300 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_startAbility_0400
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options failed.(callback)
     */
    it('ACTS_StartAbility_0400', 0, async function (done) {
      let Subscriber
      function SubscribeCallBack (err, data) {
        expect().assertFail();
        console.debug("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })
        console.debug("====>start startAbility====>");
        await globalThis.abilityContext.startAbility(
          {
            bundleName: 'com.acts.error',
            abilityName: 'com.acts.error.MainAbility2'
          }, {
          windowMode:0
        },() => {
          console.debug("====>startAbility end====>" );
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_startAbility_0400 - timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_startAbility_0500
     * @tc.name    : start new ability
     * @tc.desc    : Starting mainability2 with startability succeeded.(promise)
     */
    it('ACTS_StartAbility_0500', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
        console.debug("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent"){
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiuserstest',
              abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility2'
            }).then((data)=>{
            console.debug("====>startAbility end====>");
            console.debug("====>data is====>" + JSON.stringify(data));
          })
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(true);
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_startAbility_0100 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_startAbility_0600
     * @tc.name    : start new ability
     * @tc.desc    : Starting mainability2 with startability failed.(promise)
     */
    it('ACTS_StartAbility_0600', 0, async function (done) {
      let Subscriber
      function SubscribeCallBack (err, data) {
        expect().assertFail();
        console.debug("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then((data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.error',
              abilityName: 'com.acts.error.MainAbility2'
            }).then(()=>{
            console.debug("====>startAbility end====>");
          })
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_startAbility_0200 - timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_startAbility_0700
     * @tc.name    : start new ability
     * @tc.desc    : Starting mainability2 with startability succeeded.(callback)
     */
    it('ACTS_StartAbility_0700', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
        console.debug("====>0300 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent"){
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiuserstest',
              abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility2'
            },() => {
            console.debug("====>startAbility end====>" );
          })
        })
      })

      function UnSubscribeCallback() {
        flag = false
        console.debug("====>UnSubscribeCallback====>");
        expect(startresult).assertEqual(true);
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_startAbility_0300 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_startAbility_0800
     * @tc.name    : start new ability
     * @tc.desc    : Starting mainability2 with startability failed.(callback)
     */
    it('ACTS_StartAbility_0800', 0, async function (done) {
      let Subscriber
      function SubscribeCallBack (err, data) {
        expect().assertFail();
        console.debug("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })
        console.debug("====>start startAbility====>");
        await globalThis.abilityContext.startAbility(
          {
            bundleName: 'com.acts.error',
            abilityName: 'com.acts.error.MainAbility2'
          },() => {
          console.debug("====>startAbility end====>" );
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_startAbility_0800 - timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })


    /*
     * @tc.number  : ACTS_startAbility_0900
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options succeeded.(promise)
     */
    it('ACTS_StartAbility_0900', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
        console.debug("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent"){
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.example.userservicesystemapi7',
              abilityName: 'com.example.userservicesystemapi7.ServiceAbility'
            }).then(()=>{
            console.debug("====>startAbility end====>");
          })
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(true);
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_startAbility_0900 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })
    /*
     * @tc.number  : ACTS_startAbility_1000
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options succeeded.(promise)
     */
    it('ACTS_startAbility_1000', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
        console.debug("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent"){
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.example.userservicesystemapi7',
              abilityName: 'com.example.userservicesystemapi7.ServiceAbility'
            },()=>{
            console.debug("====>startAbility end====>");
          })
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(true);
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_startAbility_1000 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_StartAbilityForResult_0100
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult succeeded.(promise)
     */
    it('ACTS_StartAbilityForResult_0100', 0, async function (done) {
      var flag = true
      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('AMS_startAbilityForResult_0100 - timeout');
          done();
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiuserstest',
          abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility3',
        }, {
        windowMode:0
      }).then((data)=>{
        console.debug("====>startAbilityForResult end====>");
        flag = false
        console.debug("====>data.resultCode is====>"+JSON);
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_StartAbilityForResult_0200
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult failed.(promise)
     */
    it('ACTS_StartAbilityForResult_0200', 0, async function (done) {
      function timeout() {
        console.debug('ACTS_startAbilityForResult_0200 - timeout');
        done();
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.error',
          abilityName: 'com.acts.error.MainAbility3',
        }, {
        windowMode:0
      }).then((data)=>{
        console.debug("====>startAbilityForResult end====>");
        expect().assertFail();
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_StartAbilityForResult_0300
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult succeeded.(callback)
     */
    it('ACTS_StartAbilityForResult_0300', 0, async function (done) {
      var flag = true
      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_startAbilityForResult_0300 - timeout');
          done();
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiuserstest',
          abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility3',
        },{
          windowMode : 0
        },(err,data)=>{
        console.debug("====>startAbilityForResult end====>");
        flag = false
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_StartAbilityForResult_0400
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult failed.(callback)
     */
    it('ACTS_StartAbilityForResult_0400', 0, async function (done) {
      function timeout() {
        console.debug('ACTS_startAbilityForResult_0400 - timeout');
        done();
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.error',
          abilityName: 'com.acts.error.MainAbility3',
        }, {
        windowMode:0
      },(err,data)=>{
        expect().assertFail();
        console.debug("====>startAbilityForResult end====>");
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_StartAbilityForResult_0500
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult succeeded.(promise)
     */
    it('ACTS_StartAbilityForResult_0500', 0, async function (done) {
      var flag = true
      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('AMS_startAbilityForResult_0500 - timeout');
          done();
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiuserstest',
          abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility3',
        }).then((data)=>{
        console.debug("====>startAbilityForResult end====>");
        flag = false
        console.debug("====>data.resultCode is====>"+JSON);
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_StartAbilityForResult_0600
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult failed.(promise)
     */
    it('ACTS_StartAbilityForResult_0600', 0, async function (done) {
      function timeout() {
        console.debug('ACTS_startAbilityForResult_0600 - timeout');
        done();
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.error',
          abilityName: 'com.acts.error.MainAbility3',
        }).then((data)=>{
        console.debug("====>startAbilityForResult end====>");
        expect().assertFail();
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_StartAbilityForResult_0700
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult succeeded.(callback)
     */
    it('ACTS_StartAbilityForResult_0700', 0, async function (done) {
      var flag = true
      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_startAbilityForResult_0700 - timeout');
          done();
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiuserstest',
          abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility3',
        },(err,data)=>{
        console.debug("====>startAbilityForResult end====>");
        flag = false
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_StartAbilityForResult_0800
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult failed.(callback)
     */
    it('ACTS_StartAbilityForResult_0800', 0, async function (done) {
      function timeout() {
        console.debug('ACTS_startAbilityForResult_0800 - timeout');
        done();
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.error',
          abilityName: 'com.acts.error.MainAbility3',
        },(err,data)=>{
        expect().assertFail();
        console.debug("====>startAbilityForResult end====>");
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_TerminateSelf_0100
     * @tc.name    : Use terminateself to terminate ability
     * @tc.desc    : Starting mainability2 with startAbility then terminateself ability succeeded.(promise)
     */
    it('ACTS_TerminateSelf_0100', 0, async function (done) {
      let Subscriber
      var flag = true
      var terminateresult = false
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
        console.debug("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_TerminateSelf_CommonEvent"){
          terminateresult = true
          console.debug("====>terminateresult is:====>" + JSON.stringify(terminateresult));
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiuserstest',
              abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility2'
            }).then(()=>{
            console.debug("====>startAbility end====>");
          })
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(terminateresult).assertEqual(true);
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_TerminateSelf_0100 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_TerminateSelf_0200
     * @tc.name    : Use terminateself to terminate ability
     * @tc.desc    : Starting mainability2 with startAbility then terminateself ability failed.(promise)
     */
    it('ACTS_TerminateSelf_0200', 0, async function (done) {
      let Subscriber
      function SubscribeCallBack (err, data) {
        expect().assertFail();
        console.debug("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async(SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.error',
              abilityName: 'com.acts.error.MainAbility2'
            }).then(()=>{
            console.debug("====>startAbility end====>");
          })
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_TerminateSelf_0200 - timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        done();
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_TerminateSelf_0300
     * @tc.name    : Use terminateself to terminate ability
     * @tc.desc    : Starting mainability2 with startAbility then terminateself ability succeeded.(callback)
     */
    it('ACTS_TerminateSelf_0300', 0, async function (done) {
      let Subscriber
      var flag = true
      var terminateresult = false
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
        console.debug("====>0300 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_TerminateSelf_CommonEvent"){
          terminateresult = true
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }

      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async(SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiuserstest',
              abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility2'
            },() => {
            console.debug("====>startAbility end====>" );
          })
        })
      })

      function UnSubscribeCallback() {
        flag = false
        console.debug("====>UnSubscribeCallback====>");
        expect(terminateresult).assertEqual(true);
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_TerminateSelf_0300 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_TerminateSelf_0400
     * @tc.name    : Use terminateself to terminate ability
     * @tc.desc    : Starting mainability2 with startAbility then terminateself ability failed.(callback)
     */
    it('ACTS_TerminateSelf_0400', 0, async function (done) {
      let Subscriber
      function SubscribeCallBack (err, data) {
        expect().assertFail();
        console.debug("====>0400 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async(SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.error',
              abilityName: 'com.acts.error.MainAbility2'
            },() => {
            console.debug("====>startAbility end====>" );
          })
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_TerminateSelf_0400 - timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_TerminateSelfWithResult_0100
     * @tc.name    : Use terminateselfwithresult to terminate ability and return result
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *               then terminateself ability and return result succeeded.(promise)
     */
    it('ACTS_TerminateSelfWithResult_0100', 0, async function (done) {
      var flag = true
      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_TerminateSelfWithResult_0100 - timeout');
          done();
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiuserstest',
          abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility3',
        }).then((data)=>{
        console.debug("====>startAbilityForResult end====>");
        flag = false
        console.debug("====>data.resultCode is====>"+JSON);
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })
    /*
     * @tc.number  : ACTS_TerminateSelfWithResult_0200
     * @tc.name    : Use terminateselfwithresult to terminate ability and return result
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *               then terminateself ability and return result failed.(promise)
     */
    it('ACTS_TerminateSelfWithResult_0200', 0, async function (done) {
      function timeout() {
        console.debug('ACTS_TerminateSelfWithResult_0200 - timeout');
        done();
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.error',
          abilityName: 'com.acts.error.MainAbility3',
        }).then((data)=>{
        console.debug("====>startAbilityForResult end====>");
        expect().assertFail();
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })
    /*
     * @tc.number  : ACTS_TerminateSelfWithResult_0300
     * @tc.name    : Use terminateselfwithresult to terminate ability and return result
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *               then terminateself ability and return result succeeded.(callback)
     */
    it('ACTS_TerminateSelfWithResult_0300', 0, async function (done) {
      var flag = true
      function timeout() {
        if (flag == true) {
          expect().assertFail();
          console.debug('ACTS_TerminateSelfWithResult_0300 - timeout');
          done();
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiuserstest',
          abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility3',
        },(err,data)=>{
        flag = false
        console.debug("====>startAbilityForResult end====>");
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })
    /*
     * @tc.number  : ACTS_TerminateSelfWithResult_0400
     * @tc.name    : Use terminateselfwithresult to terminate ability and return result
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *               then terminateself ability and return result failed.(callback)
     */
    it('ACTS_TerminateSelfWithResult_0400', 0, async function (done) {
      function timeout() {
        console.debug('ACTS_TerminateSelfWithResult_0400 - timeout');
        done();
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.error',
          abilityName: 'com.acts.error.MainAbility3',
        },(err,data)=>{
        expect().assertFail();
        console.debug("====>startAbilityForResult end====>");
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

      /*
     * @tc.number  : ACTS_KillProcess_0100
     * @tc.name    : Use terminateselfwithresult to terminate ability and return result
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *         then terminateself ability and return result failed.(promise)
     */
    it('ACTS_KillProcess_0100', 0, async function (done) {
      var Subscriber
      var flag = true
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_KillProcess").assertTrue();
        console.debug("====>ACTS_KillProcess_0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        appManager.getProcessRunningInfos().then((data)=> {
          console.info('====>ACTS_KillProcess_0100 getProcessRunningInfos=====>' + JSON.stringify(data))
          for(var i = 0; i<data.length ;i++){
            if (data[i].processName=='com.acts.killprocesshap'){
              console.info('====>has com.acts.killprocesshap=====>')
              break
            }
          }
          console.log('====>i is:====>' + JSON.stringify(i))
          if(i==data.length && data[i].processName!='com.acts.killprocesshap'){
            expect().assertFail()
          }
          appManager.killProcessesByBundleName('com.acts.killprocesshap').then((data)=>{
            console.info('====>ACTS_KillProcess_0100 killProcessesByBundleName=====>' + JSON.stringify(data))
            setTimeout(()=>{
            appManager.getProcessRunningInfos().then((data)=> {
              console.info('====>ACTS_KillProcess_0100 getProcessRunningInfos2=====>' + JSON.stringify(data))
              for(var i = 0; i<data.length ;i++){
                if (data[i].processName=='com.acts.killprocesshap'){
                  expect().assertFail()
                  break
                }
              }
              commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            })
            },15000)
          })
        })
      }
      commonEvent.createSubscriber(subscriberInfo_killprocess).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.killprocesshap',
              abilityName: 'com.acts.killprocesshap.MainAbility'
            }).then((data)=>{
            console.debug("====>startAbility end====>");
            console.debug("====>data is====>" + JSON.stringify(data));
          })
        })
      })
      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_KillProcess_0100 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, 19500);
    })

    /*
     * @tc.number  : ACTS_KillProcess_0200
     * @tc.name    : Use terminateselfwithresult to terminate ability and return result
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *               then terminateself ability and return result failed.(callback)
     */
    it('ACTS_KillProcess_0200', 0, async function (done) {
      var Subscriber
      var flag = true
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_KillProcess").assertTrue();
        console.debug("====>ACTS_KillProcess_0200 Subscribe CallBack data:====>" + JSON.stringify(data));
        appManager.getProcessRunningInfos().then((data)=> {
          console.info('====>ACTS_KillProcess_0200 getProcessRunningInfos=====>' + JSON.stringify(data))
          for(var i = 0; i<data.length ;i++){
            if (data[i].processName=='com.acts.killprocesshap'){
              console.info('====>has com.acts.killprocesshap=====>')
              break
            }
          }
          console.log('====>i is:====>' + JSON.stringify(i))
          if(i==data.length && data[i].processName!='com.acts.killprocesshap'){
            expect().assertFail()
          }
          appManager.killProcessesByBundleName('com.acts.killprocesshap',(data)=>{
            console.info('====>ACTS_KillProcess_0200 killProcessesByBundleName=====>' + JSON.stringify(data))
            setTimeout(()=> {
              appManager.getProcessRunningInfos().then((data) => {
                console.info('====>ACTS_KillProcess_0200 getProcessRunningInfos2=====>' + JSON.stringify(data))
                for (var i = 0; i < data.length; i++) {
                  if (data[i].processName == 'com.acts.killprocesshap') {
                    expect().assertFail()
                    break
                  }
                }
                commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
              })
            },15000)
          })
        })
      }
      commonEvent.createSubscriber(subscriberInfo_killprocess).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.killprocesshap',
              abilityName: 'com.acts.killprocesshap.MainAbility'
            }).then((data)=>{
            console.debug("====>startAbility end====>");
            console.debug("====>data is====>" + JSON.stringify(data));
          })
        })
      })
      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_KillProcess_0200 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, 19500);
    })
    /*
     * @tc.number  : ACTS_ThirdPartyKillProcess_0100
     * @tc.name    : Use terminateselfwithresult to terminate ability and return result
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *               then terminateself ability and return result failed.(promise)
     */
    it('ACTS_ThirdPartyKillProcess_0100', 0, async function (done) {
      console.debug("====>start startAbility====>");
      await globalThis.abilityContext.startAbility(
        {
          bundleName: 'com.acts.killprocessthirdhap',
          abilityName: 'com.acts.killprocessthirdhap.MainAbility'
        }).then(()=>{
        console.debug("====>startAbility end====>");
      })
      setTimeout(()=>{
        appManager.getProcessRunningInfos().then((data)=> {
          console.info('====>ACTS_KillProcess_0100 getProcessRunningInfos=====>' + JSON.stringify(data))
          for(var i = 0; i<data.length ;i++){
            if (data[i].processName=='com.acts.killprocessthirdhap'){
              console.info('====>has com.acts.killprocessthirdhap=====>')
              break
            }
          }
          console.log('====>i is:====>' + JSON.stringify(i))
          if(i==data.length && data[i].processName!='com.acts.killprocessthirdhap'){
            expect().assertFail()
          }
         })
      },1000)
        setTimeout(()=> {
          appManager.getProcessRunningInfos().then((data) => {
            console.info('====>ACTS_KillProcess_0100 getProcessRunningInfos2=====>' + JSON.stringify(data))
            for (var i = 0; i < data.length; i++) {
              if (data[i].processName == 'com.acts.killprocessthirdhap') {
                break
              }
            }
            console.log('====>i2 is:====>' + JSON.stringify(i))
            if(i==data.length && data[i].processName!='com.acts.killprocessthirdhap'){
              expect().assertFail()
            }
            done()
          })
        },15000)
    })
    /*
     * @tc.number  : ACTS_ThirdPartyKillProcess_0200
     * @tc.name    : Use terminateselfwithresult to terminate ability and return result
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *               then terminateself ability and return result failed.(callback)
     */
    it('ACTS_ThirdPartyKillProcess_0200', 0, async function (done) {
      console.debug("====>start startAbility====>");
      await globalThis.abilityContext.startAbility(
        {
          bundleName: 'com.acts.killprocessthirdhap2',
          abilityName: 'com.acts.killprocessthirdhap2.MainAbility'
        }).then(() => {
        console.debug("====>startAbility end====>");
      })
      setTimeout(() => {
        appManager.getProcessRunningInfos().then((data) => {
          console.info('====>ACTS_KillProcess_0100 getProcessRunningInfos=====>' + JSON.stringify(data))
          for (var i = 0; i < data.length; i++) {
            if (data[i].processName == 'com.acts.killprocessthirdhap2') {
              console.info('====>has com.acts.killprocessthirdhap2=====>')
              break
            }
          }
          console.log('====>i is:====>' + JSON.stringify(i))
          if (i == data.length && data[i].processName != 'com.acts.killprocessthirdhap2') {
            expect().assertFail()
          }
        })
      },1000)
      setTimeout(() => {
        appManager.getProcessRunningInfos().then((data) => {
          console.info('====>ACTS_KillProcess_0100 getProcessRunningInfos2=====>' + JSON.stringify(data))
          for (var i = 0; i < data.length; i++) {
            if (data[i].processName == 'com.acts.killprocessthirdhap2') {
              break
            }
          }
          console.log('====>i2 is:====>' + JSON.stringify(i))
          if(i==data.length && data[i].processName!='com.acts.killprocessthirdhap'){
            expect().assertFail()
          }
          done()
        })
      },15000)
    })
  })
}