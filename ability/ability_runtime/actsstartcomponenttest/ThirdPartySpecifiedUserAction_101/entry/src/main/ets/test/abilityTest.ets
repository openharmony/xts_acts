/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index"
import commonEvent from '@ohos.commonEvent';

var ACTS_ABILITYCONTEX = {
   events: ["ABILITYCONTEX_Start_CommonEvent"]
};

const START_ABILITY_TIMEOUT = 3000;
export default function abilityTest(abilityContext) {
   describe('ACTS_AbilityContext', function () {


      /**
      * @tc.number: ACTS_ThirdPartyStartStandardAbilityWithAccount_0200
      * @tc.name: Provides a system interface to specify user startup components (standard page).
      * @tc.desc: If the specified user is not equal to the current user and the user's task list exists,
      *           call the Promise's AbilityContext::startAbilityWithAccount
      *           interface (with the StartOptions parameter) to start Ability.
      */
      it('ACTS_ThirdPartyStartStandardAbilityWithAccount_0200', 0, async function (done) {
        console.log("ACTS_ThirdPartyStartStandardAbilityWithAccount_0200====>start")

        var Subscriber;

        function SubscribeCallBack(err, data) {
           expect().assertFail();
           console.debug("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
           commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }

        commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
           console.debug("ACTS_ThirdPartyStartStandardAbilityWithAccount_0200====>Create Subscriber====>");
           Subscriber = data;
           commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })

        function UnSubscribeCallback() {

           console.debug("====>UnSubscribeCallback====>");
           done();
        }

        function timeout() {
           console.debug('ACTS_ThirdPartyStartStandardAbilityWithAccount_0200 ====> timeout');
           commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
           done();
        }

        setTimeout(timeout, START_ABILITY_TIMEOUT);
        console.debug("====>start startAbility====>");
        await abilityContext.startAbilityWithAccount(
           {
              bundleName: 'com.example.actsthirdpartyspecifieduseractionzerotest',
              abilityName: 'com.example.actsthirdpartyspecifieduseractionzerotest.MainAbility2'
           },100,
           {
              windowMode: 2,
              displayId: 1
           }).then((data) => {
           console.log("====>end ACTS_ThirdPartyStartStandardAbilityWithAccount_0200====>success!"+ JSON.stringify(data))
        })
      })

      /**
      * @tc.number: ACTS_ThirdPartyStartStandardAbilityWithAccount_0400
      * @tc.name: Provides a system interface to specify user startup components (standard page).
      * @tc.desc: When the specified user is equal to the current user and the user's task list exists,
      *           call the AbilityContext::startAbilityWithAccount interface of
      *           AsyncCallback (with the StartOptions parameter) to start Ability.
      */
      it('ACTS_ThirdPartyStartStandardAbilityWithAccount_0400', 0, async function (done) {
        console.log("ACTS_ThirdPartyStartStandardAbilityWithAccount_0400 ====> start")

        var Subscriber;
        var flag = false;

        function SubscribeCallBack(err, data) {
           flag = true;
           expect(data.event).assertEqual("ABILITYCONTEX_Start_CommonEvent");
           console.debug("====>0400 Subscribe CallBack data:====>" + JSON.stringify(data));
           commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }

        commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
           console.debug("ACTS_ThirdPartyStartStandardAbilityWithAccount_0400====>Create Subscriber====>");
           Subscriber = data;
           commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })

        function UnSubscribeCallback() {
           console.debug("====>UnSubscribeCallback====>");
           done();
        }

        function timeout() {
           if(flag == false){
              expect().assertFail();
              console.debug('ACTS_ThirdPartyStartStandardAbilityWithAccount_0400 ====> timeout');
              commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
              done();
           }
        }

        setTimeout(timeout, START_ABILITY_TIMEOUT);
        console.debug("====>start startAbility====>");
        await abilityContext.startAbilityWithAccount(
           {
              bundleName: 'com.example.actsthirdpartyspecifieduseractiononetest',
              abilityName: 'com.example.actsthirdpartyspecifieduseractiononetest.MainAbility2'
           },101,
           {
              windowMode: 2,
              displayId: 1
           }, ((err, data) => {
           console.log("====>end ACTS_ThirdPartyStartStandardAbilityWithAccount_0400====>success!!!" + JSON.stringify(data))
        }))
      })

      /**
      * @tc.number: ACTS_ThirdPartyStartStandardAbilityWithAccount_0800
      * @tc.name: Provides a system interface to specify user startup components (standard page).
      * @tc.desc: If the specified user is not equal to the current user and the user's task list exists,
      *           call the Promise's AbilityContext::startAbilityWithAccount
      *           interface (without the StartOptions parameter) to start the Ability.
      */
      it('ACTS_ThirdPartyStartStandardAbilityWithAccount_0800', 0, async function (done) {
        console.log("ACTS_ThirdPartyStartStandardAbilityWithAccount_0800 ====> start")

        var Subscriber;

        function SubscribeCallBack(err, data) {
           expect().assertFail();
           console.debug("====>0800 Subscribe CallBack data:====>" + JSON.stringify(data));
           commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }

        commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
           console.debug("ACTS_ThirdPartyStartStandardAbilityWithAccount_0800====>Create Subscriber====>");
           Subscriber = data;
           commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })

        function UnSubscribeCallback() {
           console.debug("====>UnSubscribeCallback====>");
           done();
        }

        function timeout() {
           console.debug('ACTS_ThirdPartyStartStandardAbilityWithAccount_0800 ====> timeout');
           commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
           done();
        }

        setTimeout(timeout, START_ABILITY_TIMEOUT);
        console.debug("====>start startAbility====>");
        await abilityContext.startAbilityWithAccount(
           {
              bundleName: 'com.example.actsthirdpartyspecifieduseractionzerotest',
              abilityName: 'com.example.actsthirdpartyspecifieduseractionzerotest.MainAbility2'
           },100).then((data) => {
           console.log("====>end ACTS_ThirdPartyStartStandardAbilityWithAccount_0800====>success!"+ JSON.stringify(data))
        })
      })


      /**
      * @tc.number: ACTS_ThirdPartyStartStandardAbilityWithAccount_1000
      * @tc.name: Provides a system interface to specify user startup components (standard page).
      * @tc.desc: When the specified user is equal to the current user and the user's task list exists, call the
      *           AbilityContext::startAbilityWithAccount interface of
      *           AsyncCallback (without the StartOptions parameter) to start the Ability.
      */
      it('ACTS_ThirdPartyStartStandardAbilityWithAccount_1000', 0, async function (done) {
        console.log("ACTS_ThirdPartyStartStandardAbilityWithAccount_1000 ====> start")

        var Subscriber;
        var flag = false;

        function SubscribeCallBack(err, data) {
           flag = true;
           expect(data.event).assertEqual("ABILITYCONTEX_Start_CommonEvent");
           console.debug("====>1000 Subscribe CallBack data:====>" + JSON.stringify(data));
           commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }

        commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
           console.debug("ACTS_ThirdPartyStartStandardAbilityWithAccount_1000====>Create Subscriber====>");
           Subscriber = data;
           commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })

        function UnSubscribeCallback() {
           console.debug("====>UnSubscribeCallback====>");
           done();
        }

        function timeout() {
           if(flag == false){
              expect().assertFail();
              console.debug('ACTS_ThirdPartyStartStandardAbilityWithAccount_1000 ====> timeout');
              commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
              done();
           }
        }

        setTimeout(timeout, START_ABILITY_TIMEOUT);
        console.debug("====>start startAbility====>");
        await abilityContext.startAbilityWithAccount(
           {
              bundleName: 'com.example.actsthirdpartyspecifieduseractiononetest',
              abilityName: 'com.example.actsthirdpartyspecifieduseractiononetest.MainAbility2'
           },101, ((err, data) => {
           console.log("====>end ACTS_ThirdPartyStartStandardAbilityWithAccount_1000====>success!!!" + JSON.stringify(data))
        }))
      })


      /**
      * @tc.number: ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_0200
      * @tc.name: Provides a system interface to specify user startup components (standard page).
      * @tc.desc: If the specified user is not equal to the current user and the user's task list exists, call the
      *           Promise's AbilityContext::startAbilityForResultWithAccount (with the StartOptions parameter)
      *           interface to start Ability.
      */
      it('ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_0200', 0, async function (done) {
        console.log("ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_0200 ====> start")

        var Subscriber;

        function SubscribeCallBack(err, data) {
           expect().assertFail();
           console.debug("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
           commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }

        commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
           console.debug("ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_0200====>Create Subscriber====>");
           Subscriber = data;
           commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })

        function UnSubscribeCallback() {
           console.debug("====>UnSubscribeCallback====>");
           done();
        }

        function timeout() {
           console.debug('ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_0200 ====> timeout');
           commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
           done();
        }

        setTimeout(timeout, START_ABILITY_TIMEOUT);
        console.debug("====>start startAbilityForResult====>");
        await  abilityContext.startAbilityForResultWithAccount(
           {
              bundleName: 'com.example.actsthirdpartyspecifieduseractionzerotest',
              abilityName: 'com.example.actsthirdpartyspecifieduseractionzerotest.MainAbility2'
           }, 100,
           {
              windowMode: 2,
              displayId: 1
           }).then((data) => {
           console.log("====>end ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_0200====>success!"+ JSON.stringify(data))
        })
      })

      /**
      * @tc.number: ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_0400
      * @tc.name: Provides a system interface to specify user startup components (standard page).
      * @tc.desc: When the specified user is equal to the current user and the user's task list exists, call the
      *           AsyncCallback's AbilityContext::startAbilityForResultWithAccount (with the StartOptions parameter)
      *           interface to start the Ability.
      */
      it('ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_0400', 0, async function (done) {
        console.log("ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_0400 ====> start")

        var Subscriber;
        var flag = false;

        function SubscribeCallBack(err, data) {
           flag = true;
           expect(data.event).assertEqual("ABILITYCONTEX_Start_CommonEvent");
           console.debug("====>0400 Subscribe CallBack data:====>" + JSON.stringify(data));
           commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }

        commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
           console.debug("ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_0400====>Create Subscriber====>");
           Subscriber = data;
           commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })

        function UnSubscribeCallback() {
           console.debug("====>UnSubscribeCallback====>");
           done();
        }

        function timeout() {
           if(flag == false){
              expect().assertFail();
              console.debug('ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_0400 ====> timeout');
              commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
              done();
           }
        }

        setTimeout(timeout, START_ABILITY_TIMEOUT);
        console.debug("====>start startAbilityForResult====>");
        await  abilityContext.startAbilityForResultWithAccount(
           {
              bundleName: 'com.example.actsthirdpartyspecifieduseractiononetest',
              abilityName: 'com.example.actsthirdpartyspecifieduseractiononetest.MainAbility2'
           }, 101,
           {
              windowMode: 2,
              displayId: 1
           }, ((err, data) => {
           console.log("StartStandardAbilityForResultWithAccount_0400 === success!" + JSON.stringify(data))
        }))
      })

      /**
      * @tc.number: ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_0800
      * @tc.name: Provides a system interface to specify user startup components (standard page).
      * @tc.desc: If the specified user is not equal to the current user and the user's task list exists,
      *           call the Promise's
      *           AbilityContext::startAbilityForResultWithAccount (without the StartOptions parameter) interface
      *           to start Ability.
      */
      it('ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_0800', 0, async function (done) {
        console.log("ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_0800 ====> start")

        var Subscriber;

        function SubscribeCallBack(err, data) {
           expect().assertFail();
           console.debug("====>0800 Subscribe CallBack data:====>" + JSON.stringify(data));
           commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }

        commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
           console.debug("ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_0800====>Create Subscriber====>");
           Subscriber = data;
           commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })

        function UnSubscribeCallback() {
           console.debug("====>UnSubscribeCallback====>");
           done();
        }

        function timeout() {
           console.debug('ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_0800 ====> timeout');
           commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
           done();
        }

        setTimeout(timeout, START_ABILITY_TIMEOUT);
        console.debug("====>start startAbilityForResult====>");
        await  abilityContext.startAbilityForResultWithAccount(
           {
              bundleName: 'com.example.actsthirdpartyspecifieduseractionzerotest',
              abilityName: 'com.example.actsthirdpartyspecifieduseractionzerotest.MainAbility2'
           }, 100).then((data) => {
           console.log("====>end ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_0800====>success!"+ JSON.stringify(data))
        })
      })

      /**
      * @tc.number: ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_1000
      * @tc.name: Provides a system interface to specify user startup components (standard page).
      * @tc.desc: If the specified user is not equal to the current user and the user's task list exists,
      *           call the AsyncCallback's
      *           AbilityContext::startAbilityForResultWithAccount (without the StartOptions parameter)
      *           interface to start the Ability.
      */
      it('ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_1000', 0, async function (done) {
        console.log("ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_1000 ====> start")

        var Subscriber;

        function SubscribeCallBack(err, data) {
           expect(data.event).assertEqual("ABILITYCONTEX_Start_CommonEvent");
           console.debug("====>1000 Subscribe CallBack data:====>" + JSON.stringify(data));
           commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }

        commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
           console.debug("ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_1000====>Create Subscriber====>");
           Subscriber = data;
           commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })

        function UnSubscribeCallback() {
           console.debug("====>UnSubscribeCallback====>");
           done();
        }

        function timeout() {
           expect().assertFail();
           console.debug('ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_1000 ====> timeout');
           commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
           done();
        }

        setTimeout(timeout, START_ABILITY_TIMEOUT);
        console.debug("====>start startAbilityForResult====>");
        await  abilityContext.startAbilityForResultWithAccount(
           {
              bundleName: 'com.example.actsthirdpartyspecifieduseractiononetest',
              abilityName: 'com.example.actsthirdpartyspecifieduseractiononetest.MainAbility2'
           }, 101, ((err, data) => {
           console.log("ACTS_ThirdPartyStartStandardAbilityForResultWithAccount_1000 === success!" + JSON.stringify(data))
        }))
      })


      /**
      * @tc.number: ACTS_ThirdPartyConnectStandardAbilityWithAccount_0200
      * @tc.name: Provides a system interface to specify user startup components (standard page).
      * @tc.desc: If the specified user is not equal to the current user and the user's task list exists,
      *           call the AbilityContext::connectAbilityWithAccount interface to connect the Ability.
      */
      it('ACTS_ThirdPartyConnectStandardAbilityWithAccount_0200', 0, async function (done) {
        console.log("ACTS_ThirdPartyConnectStandardAbilityWithAccount_0200 ====> start")

        var Subscriber;
        var flag = true

        function SubscribeCallBack(err, data) {
           expect().assertFail();
           console.debug("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
           commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }

        function onConnectCallback(element, remote) {
           console.log('ACTS_ThirdPartyConnectStandardAbilityWithAccount_0200 onConnectCallback====> element=' + JSON.stringify(element));
           console.log('ACTS_ThirdPartyConnectStandardAbilityWithAccount_0200 onConnectCallback====> remote=' + JSON.stringify(remote));
           setTimeout(()=> {
              console.log('====>in timeout');
              console.debug("====>flag is====>" + JSON.stringify(flag));
              if(flag == true) {
                console.debug('ACTS_ThirdPartyConnectStandardAbilityWithAccount_0200 - timeout');
                commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
              }
           }, 1000);
        }
        function onDisconnectCallback(element) {
           console.log('onDisconnectCallback====> element=' + JSON.stringify(element));
        }

        function onFailedCallback(code) {
           console.log('onFailedCallback====> code=' + JSON.stringify(code))
           commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
           done();
        }

        commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
           console.debug("ACTS_ThirdPartyConnectStandardAbilityWithAccount_0200====>Create Subscriber====>");
           Subscriber = data;
           commonEvent.subscribe(Subscriber, SubscribeCallBack);
           console.debug("====>start connectAbility====>");
           await abilityContext.connectAbilityWithAccount(
              {
                bundleName: 'com.example.actsthirdpartyspecifieduseractionzerotest',
                abilityName: 'com.example.actsthirdpartyspecifieduseractionzerotest.ServiceAbility2',
                action: "StartAbilityPromise"
              },100 ,{
              onConnect:onConnectCallback,
              onDisconnect:onDisconnectCallback,
              onFailed: onFailedCallback
           })
        })
        function UnSubscribeCallback() {
           console.debug("====>connectAbility UnSubscribeCallback====>");
           done();
        }
        function timeout() {
           console.debug('ACTS_ThirdPartyConnectStandardAbilityWithAccount_0200 ====> timeout');
           commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
           done();
        }
        setTimeout(timeout, START_ABILITY_TIMEOUT);
      })
   })
}