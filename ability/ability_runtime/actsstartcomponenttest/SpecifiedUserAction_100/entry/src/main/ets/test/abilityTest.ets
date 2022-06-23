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
import commonEvent from '@ohos.commonEvent';
import osaccount from '@ohos.account.osAccount'

var ACTS_ABILITYCONTEX = {
  events: ["ABILITYCONTEX_Start_CommonEvent"]
};
var ACCOUNT_ID100;
var ACCOUNT_ID101;
var ACCOUNT_ID102;

const START_ABILITY_TIMEOUT = 3000;
export default function abilityTest(abilityContext) {
  describe('ACTS_AbilityContext', function () {
    beforeAll(function(done) {
      var osAccountManager = osaccount.getAccountManager();
      console.debug("====>get AccountManager finish====");
      osAccountManager.activateOsAccount(100, (err)=>{
        console.debug("====>activateOsAccount localId: 100 err:" + JSON.stringify(err));
        setTimeout(()=>{
        osAccountManager.queryActivatedOsAccountIds((err,data1)=>{
          console.debug("====>getOsAccountLocalIdFromProcess100" + " err:" + JSON.stringify(err));
          console.debug("====>getOsAccountLocalIdFromProcess100" + " data:" + JSON.stringify(data1));
           ACCOUNT_ID100 = data1[0];
            osAccountManager.activateOsAccount(101, (err)=>{
              console.debug("====>activateOsAccount localId: 101 err:" + JSON.stringify(err));
              setTimeout(()=>{
              osAccountManager.queryActivatedOsAccountIds((err,data2)=>{
                console.debug("====>getOsAccountLocalIdFromProcess101" + " err:" + JSON.stringify(err));
                console.debug("====>getOsAccountLocalIdFromProcess101" + " data:" + JSON.stringify(data2));
                ACCOUNT_ID101 = data2[0];
                  osAccountManager.activateOsAccount(102, (err)=>{
                    console.debug("====>activateOsAccount localId: 102 err:" + JSON.stringify(err));
                    osAccountManager.queryActivatedOsAccountIds((err,data3)=>{
                      console.debug("====>getOsAccountLocalIdFromProcess102" + " err:" + JSON.stringify(err));
                      console.debug("====>getOsAccountLocalIdFromProcess102" + " data:" + JSON.stringify(data3));
                      ACCOUNT_ID102 = data3[0];
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
     * @tc.number: ACTS_StartStandardAbilityWithAccount_0100
     * @tc.name: Provides a system interface to specify user startup components (standard page).
     * @tc.desc: When the specified user is equal to the current user and the user's task list exists,
     *           call the AbilityContext::startAbilityWithAccount interface of
     *           Promise (with the StartOptions parameter) to start Ability.
     */
    it('ACTS_StartStandardAbilityWithAccount_0100', 0, async function (done) {
      console.log("ACTS_StartStandardAbilityWithAccount_0100====>start")
      var Subscriber;
      var flag = false;

      function SubscribeCallBack(err, data) {
        flag = true;
        expect(data.event).assertEqual("ABILITYCONTEX_Start_CommonEvent");
        console.debug("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("ACTS_StartStandardAbilityWithAccount_0100====>Create Subscriber====>");
        Subscriber = data;
        commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      function UnSubscribeCallback() {
        console.debug("====>ACTS_StartStandardAbilityWithAccount_0100 UnSubscribeCallback====>");
        setTimeout(function(){
          done();
        },2000)
      }

      function timeout() {
        if(flag == false) {
          expect().assertFail();
          console.debug('ACTS_StartStandardAbilityWithAccount_0100 ====> timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbility====>");
      await abilityContext.startAbilityWithAccount(
        {
          bundleName: 'com.example.actsspecifieduseractionzerotest',
          abilityName: 'com.example.actsspecifieduseractionzerotest.MainAbility2'
        },ACCOUNT_ID100,
        {
          windowMode: 2,
          displayId: 1
        }).then((data) => {
        console.log("====>end ACTS_StartStandardAbilityWithAccount_0100====>success!"+ JSON.stringify(data))
      })
    })

    /**
     * @tc.number: ACTS_StartStandardAbilityWithAccount_0300
     * @tc.name: Provides a system interface to specify user startup components (standard page).
     * @tc.desc: When the specified user does not have a task list (the user does not exist),
     *           call the AbilityContext::startAbilityWithAccount interface of
     *           Promise (with the StartOptions parameter) to start Ability.
     */
    it('ACTS_StartStandardAbilityWithAccount_0300', 0, async function (done) {
      console.log("ACTS_StartStandardAbilityWithAccount_0300 ====> start")

      function timeout() {
        console.debug('ACTS_StartStandardAbilityWithAccount_0300 ====> timeout');
          done();
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbility====>");
      await abilityContext.startAbilityWithAccount(
        {
          bundleName: 'com.example.actsspecifieduseractionzerotest',
          abilityName: 'com.example.actsspecifieduseractionzerotest.MainAbility12'
        },ACCOUNT_ID102,
        {
          windowMode: 2,
          displayId: 1
        }).then((data) => {
        console.log("====>end ACTS_StartStandardAbilityWithAccount_0300====>success!"+ JSON.stringify(data))
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.number: ACTS_StartStandardAbilityWithAccount_0500
     * @tc.name: Provides a system interface to specify user startup components (standard page).
     * @tc.desc: If the specified user is not equal to the current user and the user's task list exists,
     *           call the AbilityContext::startAbilityWithAccount interface
     *           of AsyncCallback (with the StartOptions parameter) to start Ability.
     */
    it('ACTS_StartStandardAbilityWithAccount_0500', 0, async function (done) {
      console.log("ACTS_StartStandardAbilityWithAccount_0500 ====> start")

      var Subscriber;

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        console.debug("====>0500 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("ACTS_StartStandardAbilityWithAccount_0500====>Create Subscriber====>");
        Subscriber = data;
        commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_StartStandardAbilityWithAccount_0500 ====> timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbility====>");
     abilityContext.startAbilityWithAccount(
        {
          bundleName: 'com.example.actsspecifieduseractiononetest',
          abilityName: 'com.example.actsspecifieduseractiononetest.MainAbility2'
        },ACCOUNT_ID101, {
        windowMode: 2,
        displayId: 1
      }, ((err, data) => {
        console.log("====>end ACTS_StartStandardAbilityWithAccount_0500====>success!!!" + JSON.stringify(data))
      }))
    })

    /**
     * @tc.number: ACTS_StartStandardAbilityWithAccount_0600
     * @tc.name: Provides a system interface to specify user startup components (standard page).
     * @tc.desc: When the specified user does not have a task list (the user does not exist), call the
     *           AbilityContext::startAbilityWithAccount interface of
     *           AsyncCallback (with the StartOptions parameter) to start the Ability.
     */
    it('ACTS_StartStandardAbilityWithAccount_0600', 0, async function (done) {
      console.log("ACTS_StartStandardAbilityWithAccount_0600 ====> start")

      var Subscriber;

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        console.debug("====>0600 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("ACTS_StartStandardAbilityWithAccount_0600====>Create Subscriber====>");
        Subscriber = data;
        commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_StartStandardAbilityWithAccount_0600 ====> timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbility====>");
      await abilityContext.startAbilityWithAccount(
        {
          bundleName: 'com.example.actsspecifieduseractionzerotest',
          abilityName: 'com.example.actsspecifieduseractionzerotest.MainAbility2'
        },ACCOUNT_ID102, {
        windowMode: 2,
        displayId: 1
      }, ((err, data) => {
        console.log("====>end ACTS_StartStandardAbilityWithAccount_0600====>success!!!" + JSON.stringify(data))
      }))
    })

    /**
     * @tc.number: ACTS_StartStandardAbilityWithAccount_0700
     * @tc.name: Provides a system interface to specify user startup components (standard page).
     * @tc.desc: When the specified user is equal to the current user and the user's task list exists, call the
     *           AbilityCont.
     * ext::startAbilityWithAccount interface of Promise (without the StartOptions parameter)
     *           to start Ability.
     */
    it('ACTS_StartStandardAbilityWithAccount_0700', 0, async function (done) {
      console.log("ACTS_StartStandardAbilityWithAccount_0700 ====> start")

      var Subscriber;
      var flag = false;

      function SubscribeCallBack(err, data) {
        flag = true;
        expect(data.event).assertEqual("ABILITYCONTEX_Start_CommonEvent");
        console.debug("====>0700 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("ACTS_StartStandardAbilityWithAccount_0700====>Create Subscriber====>");
        Subscriber = data;
        commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      function UnSubscribeCallback() {
        console.debug("====>ACTS_StartStandardAbilityWithAccount_0700 UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        if(flag == false) {
          expect().assertFail();
          console.debug('ACTS_StartStandardAbilityWithAccount_0700 ====> timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbility====>");
      await abilityContext.startAbilityWithAccount(
        {
          bundleName: 'com.example.actsspecifieduseractionzerotest',
          abilityName: 'com.example.actsspecifieduseractionzerotest.MainAbility2'
        },ACCOUNT_ID100).then((data) => {
        console.log("====>end ACTS_StartStandardAbilityWithAccount_0700====>success!"+ JSON.stringify(data))
      })
    })


    /**
     * @tc.number: ACTS_StartStandardAbilityWithAccount_0900
     * @tc.name: Provides a system interface to specify user startup components (standard page).
     * @tc.desc: When the specified user does not have a task list (the user does not exist), call
     *           the AbilityContext::startAbilityWithAccount interface of
     *           Promise (without the StartOptions parameter) to start the Ability.
     */
    it('ACTS_StartStandardAbilityWithAccount_0900', 0, async function (done) {
      console.log("ACTS_StartStandardAbilityWithAccount_0900 ====> start")

      var Subscriber;


      function SubscribeCallBack(err, data) {
        expect().assertFail();
        console.debug("====>0900 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("ACTS_StartStandardAbilityWithAccount_0900====>Create Subscriber====>");
        Subscriber = data;
        commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_StartStandardAbilityWithAccount_0900 ====> timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbility====>");
      await abilityContext.startAbilityWithAccount(
        {
          bundleName: 'com.example.actsspecifieduseractionzerotest',
          abilityName: 'com.example.actsspecifieduseractionzerotest.MainAbility2'
        },ACCOUNT_ID102).then((data) => {
        console.log("====>end ACTS_StartStandardAbilityWithAccount_0900====>success!"+ JSON.stringify(data))
      })
    })

    /**
     * @tc.number: ACTS_StartStandardAbilityWithAccount_1100
     * @tc.name: Provides a system interface to specify user startup components (standard page).
     * @tc.desc: If the specified user is not equal to the current user and the user's task list exists, call the
     *           AbilityContext::startAbilityWithAccount interface of
     *           AsyncCallback (without the StartOptions parameter) to start the Ability.
     */
    it('ACTS_StartStandardAbilityWithAccount_1100', 0, async function (done) {
      console.log("ACTS_StartStandardAbilityWithAccount_1100 ====> start")

      var Subscriber;

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        console.debug("====>1100 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("ACTS_StartStandardAbilityWithAccount_1100====>Create Subscriber====>");
        Subscriber = data;
        commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_StartStandardAbilityWithAccount_1100 ====> timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbility====>");
      await abilityContext.startAbilityWithAccount(
        {
          bundleName: 'com.example.actsspecifieduseractiononetest',
          abilityName: 'com.example.actsspecifieduseractiononetest.MainAbility2'
        },ACCOUNT_ID101, ((err, data) => {
        console.log("====>end ACTS_StartStandardAbilityWithAccount_1100====>success!!!" + JSON.stringify(data))
      }))
    })

    /**
     * @tc.number: ACTS_StartStandardAbilityWithAccount_1200
     * @tc.name: Provides a system interface to specify user startup components (standard page).
     * @tc.desc: When the specified user does not have a task list (the user does not exist), call the
     *           AbilityContext::startAbilityWithAccount interface of
     *           AsyncCallback (without the StartOptions parameter) to start the Ability.
     */
    it('ACTS_StartStandardAbilityWithAccount_1200', 0, async function (done) {
      console.log("ACTS_StartStandardAbilityWithAccount_1200 ====> start")

      var Subscriber;

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        console.debug("====>1200 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("ACTS_StartStandardAbilityWithAccount_1200====>Create Subscriber====>");
        Subscriber = data;
        commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_StartStandardAbilityWithAccount_1200 ====> timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbility====>");
      await abilityContext.startAbilityWithAccount(
        {
          bundleName: 'com.example.actsspecifieduseractionzerotest',
          abilityName: 'com.example.actsspecifieduseractionzerotest.MainAbility2'
        },ACCOUNT_ID102,((err, data) => {
        console.log("====>end ACTS_StartStandardAbilityWithAccount_1200====>success!!!" + JSON.stringify(data))
      }))
    })

    /**
     * @tc.number: ACTS_StartStandardAbilityForResultWithAccount_0100
     * @tc.name: Provides a system interface to specify user startup components (standard page).
     * @tc.desc: When the specified user is equal to the current user and the user's task list exists,
     *           call the Promise's AbilityContext::startAbilityForResultWithAccount
     *           (with the StartOptions parameter) interface to start Ability.
     */
    it('ACTS_StartStandardAbilityForResultWithAccount_0100', 0, async function (done) {
      console.log("ACTS_StartStandardAbilityForResultWithAccount_0100 ====> start")
      var Subscriber;
      var flag = false;

      function SubscribeCallBack(err, data) {
        flag = true;
        expect(data.event).assertEqual("ABILITYCONTEX_Start_CommonEvent");
        console.debug("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("ACTS_StartStandardAbilityForResultWithAccount_0100====>Create Subscriber====>");
        Subscriber = data;
        commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      function UnSubscribeCallback() {
        console.debug("====>ACTS_StartStandardAbilityForResultWithAccount_0100 UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        if(flag == false){
          expect().assertFail();
          console.debug('ACTS_StartStandardAbilityForResultWithAccount_0100 ====> timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await  abilityContext.startAbilityForResultWithAccount(
        {
          bundleName: 'com.example.actsspecifieduseractiononetest',
          abilityName: 'com.example.actsspecifieduseractiononetest.MainAbility2'
        }, ACCOUNT_ID100,
        {
          windowMode: 2,
          displayId: 1
        }).then((data) => {
        console.log("====>end ACTS_StartStandardAbilityForResultWithAccount_0100====>success!"+ JSON.stringify(data))
      })
    })

    /**
     * @tc.number: ACTS_StartStandardAbilityForResultWithAccount_0300
     * @tc.name: Provides a system interface to specify user startup components (standard page).
     * @tc.desc: When the specified user does not have a task list (the user does not exist),
     *           call the AbilityContext::startAbilityForResultWithAccount (with the StartOptions parameter)
     *           interface of Promise to start Ability.
     */
    it('ACTS_StartStandardAbilityForResultWithAccount_0300', 0, async function (done) {
      console.log("ACTS_StartStandardAbilityForResultWithAccount_0300 ====> start")

      function timeout() {
        console.debug('ACTS_StartStandardAbilityForResultWithAccount_0300 ====> timeout');
        done();
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbility====>");
      await abilityContext.startAbilityForResultWithAccount(
        {
          bundleName: 'com.example.actsspecifieduseractionzerotest',
          abilityName: 'com.example.actsspecifieduseractionzerotest.MainAbility2'
        },ACCOUNT_ID102,
        {
          windowMode: 2,
          displayId: 1
        }).then((data) => {
        console.log("====>end ACTS_StartStandardAbilityForResultWithAccount_0300====>success!"+ JSON.stringify(data))
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.number: ACTS_StartStandardAbilityForResultWithAccount_0500
     * @tc.name: Provides a system interface to specify user startup components (standard page).
     * @tc.desc: If the specified user is not equal to the current user and the user's task list exists, call the
     *           AsyncCallback's AbilityContext::startAbilityForResultWithAccount (with the StartOptions parameter)
     *           interface to start Ability.
     */
    it('ACTS_StartStandardAbilityForResultWithAccount_0500', 0, async function (done) {
      console.log("ACTS_StartStandardAbilityForResultWithAccount_0500 ====> start")

      var Subscriber;

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        console.debug("====>0500 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("ACTS_StartStandardAbilityForResultWithAccount_0500====>Create Subscriber====>");
        Subscriber = data;
        commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_StartStandardAbilityForResultWithAccount_0500 ====> timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await  abilityContext.startAbilityForResultWithAccount(
        {
          bundleName: 'com.example.actsspecifieduseractiononetest',
          abilityName: 'com.example.actsspecifieduseractiononetest.MainAbility2'
        }, ACCOUNT_ID101,
        {
          windowMode: 2,
          displayId: 1
        }, ((err, data) => {
        console.log("ACTS_StartStandardAbilityForResultWithAccount_0500 === success!" + JSON.stringify(data))
      }))
    })

    /**
     * @tc.number: ACTS_StartStandardAbilityForResultWithAccount_0600
     * @tc.name: Provides a system interface to specify user startup components (standard page).
     * @tc.desc: When the specified user does not have a task list (the user does not exist), call the
     *           AbilityContext::startAbilityForResultWithAccount (with the StartOptions parameter) interface of
     *           AsyncCallback to start the Ability.
     */
    it('ACTS_StartStandardAbilityForResultWithAccount_0600', 0, async function (done) {
      console.log("ACTS_StartStandardAbilityForResultWithAccount_0600 ====> start")

      var Subscriber;

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        console.debug("====>0600 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("ACTS_StartStandardAbilityForResultWithAccount_0600====>Create Subscriber====>");
        Subscriber = data;
        commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {

        console.debug('ACTS_StartStandardAbilityForResultWithAccount_0600 ====> timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await  abilityContext.startAbilityForResultWithAccount(
        {
          bundleName: 'com.example.actsspecifieduseractionzerotest',
          abilityName: 'com.example.actsspecifieduseractionzerotest.MainAbility2'
        }, ACCOUNT_ID102,
        {
          windowMode: 2,
          displayId: 1
        }, ((err, data) => {
        console.log("ACTS_StartStandardAbilityForResultWithAccount_0600 === success!" + JSON.stringify(data))
      }))
    })

    /**
     * @tc.number: ACTS_StartStandardAbilityForResultWithAccount_0700
     * @tc.name: Provides a system interface to specify user startup components (standard page).
     * @tc.desc: When the specified user is equal to the current user and the user's task list exists,
     *           call the Promise's AbilityContext::startAbilityForResultWithAccount
     *           (without the StartOptions parameter) interface to start the Ability.
     */
    it('ACTS_StartStandardAbilityForResultWithAccount_0700', 0, async function (done) {
      console.log("ACTS_StartStandardAbilityForResultWithAccount_0700 ====> start")

      var Subscriber;
      var flag = false;

      function SubscribeCallBack(err, data) {
        flag = true;
        expect(data.event).assertEqual("ABILITYCONTEX_Start_CommonEvent");
        console.debug("====>0700 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("ACTS_StartStandardAbilityForResultWithAccount_0700====>Create Subscriber====>");
        Subscriber = data;
        commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        if(flag == false)
        {
          expect().assertFail();
          console.debug('ACTS_StartStandardAbilityForResultWithAccount_0700 ====> timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await  abilityContext.startAbilityForResultWithAccount(
        {
          bundleName: 'com.example.actsspecifieduseractiononetest',
          abilityName: 'com.example.actsspecifieduseractiononetest.MainAbility2'
        }, ACCOUNT_ID100).then((data) => {
        console.log("====>end ACTS_StartStandardAbilityForResultWithAccount_0700====>success!"+ JSON.stringify(data))
      })
    })

    /**
     * @tc.number: ACTS_StartStandardAbilityForResultWithAccount_0900
     * @tc.name: Provides a system interface to specify user startup components (standard page).
     * @tc.desc: When the specified user does not have a task list (the user does not exist), call the
     *           AbilityContext::startAbilityForResultWithAccount (no StartOptions parameter) interface of
     *           Promise to start Ability.
     */
    it('ACTS_StartStandardAbilityForResultWithAccount_0900', 0, async function (done) {
      console.log("ACTS_StartStandardAbilityForResultWithAccount_0900 ====> start")

      function timeout() {
        console.debug('ACTS_StartStandardAbilityForResultWithAccount_0900 ====> timeout');
        done();
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await abilityContext.startAbilityForResultWithAccount(
        {
          bundleName: 'com.example.actsspecifieduseractionzerotest',
          abilityName: 'com.example.actsspecifieduseractionzerotest.MainAbility2'
        },ACCOUNT_ID102).then((data) => {
        console.log("====>end ACTS_StartStandardAbilityForResultWithAccount_0900====>success!"+ JSON.stringify(data))
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.number: ACTS_StartStandardAbilityForResultWithAccount_1100
     * @tc.name: Provides a system interface to specify user startup components (standard page).
     * @tc.desc: If the specified user is not equal to the current user and the user's task list exists,
     *           call the AsyncCallback's
     *           AbilityContext::startAbilityForResultWithAccount (without the StartOptions parameter) interface
     *           to start the Ability.
     */
    it('ACTS_StartStandardAbilityForResultWithAccount_1100', 0, async function (done) {
      console.log("ACTS_StartStandardAbilityForResultWithAccount_1100 ====> start")

      var Subscriber;

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        console.debug("====>1100 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("ACTS_StartStandardAbilityForResultWithAccount_1100====>Create Subscriber====>");
        Subscriber = data;
        commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_StartStandardAbilityForResultWithAccount_1100 ====> timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await  abilityContext.startAbilityForResultWithAccount(
        {
          bundleName: 'com.example.actsspecifieduseractiononetest',
          abilityName: 'com.example.actsspecifieduseractiononetest.MainAbility2'
        }, ACCOUNT_ID101, ((err, data) => {
        console.log("ACTS_StartStandardAbilityForResultWithAccount_1100 === success!" + JSON.stringify(data))
      }))
    })

    /**
     * @tc.number: ACTS_StartStandardAbilityForResultWithAccount_1200
     * @tc.name: Provides a system interface to specify user startup components (standard page).
     * @tc.desc: When the specified user does not have a task list (the user does not exist),
     *           call the AbilityContext::startAbilityForResultWithAccount (no StartOptions parameter)
     *           interface of AsyncCallback to start Ability.
     */
    it('ACTS_StartStandardAbilityForResultWithAccount_1200', 0, async function (done) {
      console.log("ACTS_StartStandardAbilityForResultWithAccount_1200 ====> start")

      var Subscriber;

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        console.debug("====>1200 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("ACTS_StartStandardAbilityForResultWithAccount_1200====>Create Subscriber====>");
        Subscriber = data;
        commonEvent.subscribe(Subscriber, SubscribeCallBack);
        console.debug("====>start startAbilityForResult====>");
        await  abilityContext.startAbilityForResultWithAccount(
          {
            bundleName: 'com.example.actsspecifieduseractionzerotest',
            abilityName: 'com.example.actsspecifieduseractionzerotest.MainAbility2'
          }, ACCOUNT_ID102, ((err, data) => {
          console.log("ACTS_StartStandardAbilityForResultWithAccount_1200 === success!" + JSON.stringify(data))
        }))
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_StartStandardAbilityForResultWithAccount_1200 ====> timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /**
     * @tc.number: ACTS_ConnectStandardAbilityWithAccount_0100
     * @tc.name: Provides a system interface to specify user startup components (standard page).
     * @tc.desc: If the specified user is equal to the current user and the user's task list exists,
     *           call the AbilityContext::connectAbilityWithAccount interface to connect to Ability.
     */
    it('ACTS_ConnectStandardAbilityWithAccount_0100', 0, async function (done) {
      console.log("ACTS_ConnectStandardAbilityWithAccount_0100====>start")
      var Subscriber;
      var flag = true;
      var number = 0;

      function onConnectCallback(element, remote) {
        console.log('ACTS_ConnectStandardAbilityWithAccount_0100 onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_ConnectStandardAbilityWithAccount_0100 onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(()=> {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if(flag == true) {
            console.debug('ACTS_ConnectStandardAbilityWithAccount_0100 - timeout');
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


      function SubscribeCallBack(err, data) {
        flag = true;
        expect(data.event).assertEqual("ABILITYCONTEX_Start_CommonEvent");
        console.debug("====>WithAccount 0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        abilityContext.disconnectAbility(number).then((err)=>{
          console.debug("====>err is====>" + JSON.stringify(err));
        })
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(ACTS_ABILITYCONTEX).then(async (data) => {
        console.debug("ACTS_ConnectStandardAbilityWithAccount_0100====>Create Subscriber====>");
        Subscriber = data;
        commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      function UnSubscribeCallback() {
        console.debug("====>ACTS_ConnectStandardAbilityWithAccount_0100 UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        if(flag == false) {
          expect().assertFail();
          console.debug('ACTS_ConnectStandardAbilityWithAccount_0100 ====> timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start connectAbilityWithAccount====>");
      number = await abilityContext.connectAbilityWithAccount({
        bundleName: 'com.example.actsspecifieduseractionzerotest',
        abilityName: 'com.example.actsspecifieduseractionzerotest.ServiceAbility2',
        action: "StartAbilityPromise"
      }, ACCOUNT_ID100,{
        onConnect:onConnectCallback,
        onDisconnect:onDisconnectCallback,
        onFailed: onFailedCallback
        })
    })

    /**
     * @tc.number: ACTS_ConnectStandardAbilityWithAccount_0300
     * @tc.name: Provides a system interface to specify user startup components (standard page).
     * @tc.desc: When the specified user does not have a task list (the user does not exist),
     *           call the AbilityContext::connectAbilityWithAccount interface to connect the Ability.
     */
    it('ACTS_ConnectStandardAbilityWithAccount_0300', 0, async function (done) {
      console.log("ACTS_ConnectStandardAbilityWithAccount_0300 ====> start")
      var Subscriber;
      var flag = true;
      var number = 0;

      function SubscribeCallBack(err, data) {
        expect().assertFail();
        console.debug("====>WithAccount 0300 Subscribe CallBack data:====>" + JSON.stringify(data));
        abilityContext.disconnectAbility(number).then((err)=>{
          console.debug("====>err is====>" + JSON.stringify(err));
        })
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      function onConnectCallback(element, remote) {
        console.log('ACTS_ConnectStandardAbilityWithAccount_0300 onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_ConnectStandardAbilityWithAccount_0300 onConnectCallback====> remote=' + JSON.stringify(remote));
        setTimeout(()=> {
          console.log('====>in timeout');
          console.debug("====>flag is====>" + JSON.stringify(flag));
          if(flag == true) {
            console.debug('ACTS_ConnectStandardAbilityWithAccount_0300 - timeout');
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
        console.debug("ACTS_ConnectStandardAbilityWithAccount_0300====>Create Subscriber====>");
        Subscriber = data;
        commonEvent.subscribe(Subscriber, SubscribeCallBack);
        console.debug("====>start connectAbilityWithAccount====>");
        number = await abilityContext.connectAbilityWithAccount(
          {
            bundleName: 'com.example.actsspecifieduseractionzerotest',
            abilityName: 'com.example.actsspecifieduseractionzerotest.ServiceAbility2',
            action: "StartAbilityPromise"
          },ACCOUNT_ID102 ,{
          onConnect:onConnectCallback,
          onDisconnect:onDisconnectCallback,
          onFailed: onFailedCallback
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_ConnectStandardAbilityWithAccount_0300 ====> timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })
 })
}