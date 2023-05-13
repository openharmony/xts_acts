/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import commonEvent from '@ohos.commonEventManager'
const CASE_TIME_OUT = 5000;
const EXIT_TWO_CALLEE = 2;
const KILL_TWO = 2;
var ACTS_CallFunction = {
  events: ['ACTS_CALL_EVENT', 'ACTS_RELEASE_EVENT', 'ACTS_SECOND_CALL_EVENT']
};

export default function abilityTest() {
  describe('ActsAbilityTest', function () {
    afterEach(async (done) => {
      setTimeout(function () {
        console.debug('====>afterEach called');
        done();
      }, 1000);
    })

    /*
     * @tc.number: Acts_SingleInstanceCallFunction_0100
     * @tc.name: Local multi-instance Ability supports call calls
     * @tc.desc: Caller application can call other application Ability by Call (single instance).
     */
    it('Acts_SingleInstanceCallFunction_0100',0, async function (done) {
      var subscriber;
      var flag = false;
      console.debug('====>Acts_SingleInstanceCallFunction_0100 start');
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.debug('====>Acts_SingleInstanceCallFunction_0100 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility({
            bundleName: 'com.acts.actscallfunction',
            abilityName: 'EntryAbility',
            action: 'Acts_SingleInstanceCallFunction_0100'
          },(err) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0100 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.debug('====>Acts_SingleInstanceCallFunction_0100 subscribeCallBack data:' + JSON.stringify(data));
        if (data.event === 'ACTS_CALL_EVENT') {
          flag = true;
          expect(data.parameters.num).assertEqual(100);
          expect(data.parameters.str).assertEqual('Acts_SingleInstanceCallFunction_0100 processed');
          expect(data.parameters.result).assertTrue();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        console.debug('====>Acts_SingleInstanceCallFunction_0100 unSubscribeCallback');
        done();
      }

      setTimeout(() => {
        if (flag === false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_SingleInstanceCallFunction_0200
     * @tc.name: Local multi-instance Ability supports call calls
     * @tc.desc: Caller application cannot call its own Ability by Call (single instance).
     */
    it('Acts_SingleInstanceCallFunction_0200',0, async function (done) {
      var subscriber;
      var flag = false;
      console.debug('====>Acts_SingleInstanceCallFunction_0200 start');
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.debug('====>Acts_SingleInstanceCallFunction_0200 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: 'com.acts.actscallfunction',
            abilityName: 'EntryAbility',
            action: 'Acts_SingleInstanceCallFunction_0200'
          },(err) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0200 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.debug('====>Acts_SingleInstanceCallFunction_0200 subscribeCallBack data:' + JSON.stringify(data));
        if (data.event === 'ACTS_CALL_EVENT') {
          flag = true;
          expect(data.parameters.num).assertEqual(16000050);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        console.debug('====>Acts_SingleInstanceCallFunction_0200 unSubscribeCallback');
        done();
      }

      setTimeout(() => {
        if (flag === false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_SingleInstanceCallFunction_0300
     * @tc.name: Local multi-instance Ability supports call calls
     * @tc.desc: Caller applications can actively release AbilityCaller (single instance).
     */
    it('Acts_SingleInstanceCallFunction_0300',0, async function (done) {
      var subscriber;
      var eventCount = 0;
      console.debug('====>Acts_SingleInstanceCallFunction_0300 start');
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.debug('====>Acts_SingleInstanceCallFunction_0300 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.actscallfunction',
          abilityName: 'EntryAbility',
          action: 'Acts_SingleInstanceCallFunction_0300'
        },(err) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0300 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.debug('====>Acts_SingleInstanceCallFunction_0300 subscribeCallBack data:' + JSON.stringify(data));
        if (data.event === 'ACTS_CALL_EVENT') {
          eventCount++;
          expect(data.parameters.num).assertEqual(300);
          expect(data.parameters.str).assertEqual('Acts_SingleInstanceCallFunction_0300 processed');
          expect(data.parameters.result).assertTrue();
        }
        if (data.event === 'ACTS_RELEASE_EVENT') {
          eventCount++;
          expect(data.parameters.str).assertEqual('release');
          expect(data.parameters.result).assertTrue();
        }
        if (eventCount === 2) {
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        console.debug('====>Acts_SingleInstanceCallFunction_0300 unSubscribeCallback');
        done();
      }

      setTimeout(() => {
        if (eventCount !== 2){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_SingleInstanceCallFunction_0400
     * @tc.name: Local multi-instance Ability supports call calls
     * @tc.desc: The caller application can passively perceive the callee death notification of the called
     *           server (single instance).
     */
    it('Acts_SingleInstanceCallFunction_0400',0, async function (done) {
      var subscriber;
      var eventCount = 0;
      console.debug('====>Acts_SingleInstanceCallFunction_0400 start');
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.debug('====>Acts_SingleInstanceCallFunction_0400 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.actscallfunction',
          abilityName: 'EntryAbility',
          action: 'Acts_SingleInstanceCallFunction_0400'
        },(err) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0400 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.debug('====>Acts_SingleInstanceCallFunction_0400 subscribeCallBack data:' + JSON.stringify(data));
        if (data.event === 'ACTS_CALL_EVENT') {
          eventCount++;
          expect(data.parameters.num).assertEqual(400);
          expect(data.parameters.str).assertEqual('Acts_SingleInstanceCallFunction_0400 processed');
          expect(data.parameters.result).assertTrue();
        }
        if (data.event === 'ACTS_RELEASE_EVENT') {
          eventCount++;
          expect(data.parameters.str).assertEqual('died');
          expect(data.parameters.result).assertTrue();
        }
        if (eventCount === 2) {
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        console.debug('====>Acts_SingleInstanceCallFunction_0400 unSubscribeCallback');
        done();
      }

      setTimeout(() => {
        if (eventCount !== 2){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_MultipleInstancesCallFunction_0100
     * @tc.name: Acts_MultipleInstancesCallFunction_0100
     * @tc.desc: The Calling application can call the multi-instance Ability of other applications.
     */
    it('Acts_MultipleInstancesCallFunction_0100',0, async function (done) {
      var subscriber;
      var flag = false;
      console.info("====>Acts_MultipleInstancesCallFunction_0100 start")
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info("====>Acts_MultipleInstancesCallFunction_0100 Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.acts.actscallfunction",
            abilityName: "EntryAbility",
            action: "Acts_MultipleInstancesCallFunction_0100"
          },(err) => {
          console.info("====>Acts_MultipleInstancesCallFunction_0100 startAbility err:" + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.info("====>Acts_MultipleInstancesCallFunction_0100 subscribeCallBack data:" + JSON.stringify(data));
        if (data.event == "ACTS_CALL_EVENT") {
          flag = true;
          expect(data.parameters.num).assertEqual(EXIT_TWO_CALLEE);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        console.info("====>Acts_MultipleInstancesCallFunction_0100 unSubscribeCallback");
        done();
      }

      setTimeout(()=>{
        if (flag === false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_MultipleInstancesCallFunction_0200
     * @tc.name: Acts_MultipleInstancesCallFunction_0200
     * @tc.desc: The Calling application cannot call its own multi-instance Ability.
     */
    it('Acts_MultipleInstancesCallFunction_0200',0, async function (done) {
      var subscriber;
      var flag = false;
      console.info("====>Acts_MultipleInstancesCallFunction_0200 start")
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info("====>Acts_MultipleInstancesCallFunction_0200 Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.acts.thirdpartyapprely",
            abilityName: "EntryAbility",
            action: "Acts_MultipleInstancesCallFunction_0200"
          },(err) => {
          console.info("====>Acts_MultipleInstancesCallFunction_0200 startAbility err:" + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.info("====>Acts_MultipleInstancesCallFunction_0200 subscribeCallBack data:" + JSON.stringify(data));
        if (data.event == "ACTS_CALL_EVENT") {
          flag = true;
          expect(data.parameters.num).assertEqual(16000050);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        console.info("====>Acts_MultipleInstancesCallFunction_0200 unSubscribeCallback");
        done();
      }

      setTimeout(() => {
        if (flag === false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })

    /*
    * @tc.number: Acts_MultipleInstancesCallFunction_0300
    * @tc.name: Acts_MultipleInstancesCallFunction_0300
    * @tc.desc: The caller application can actively release the multi-instance AbilityCaller.
    */
    it('Acts_MultipleInstancesCallFunction_0300',0, async function (done) {
      var subscriber;
      var flag = false;
      console.info("====>Acts_MultipleInstancesCallFunction_0300 start")
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info("====>Acts_MultipleInstancesCallFunction_0300 Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.acts.actscallfunction",
            abilityName: "EntryAbility",
            action: "Acts_MultipleInstancesCallFunction_0300"
          },(err) => {
          console.info("====>Acts_MultipleInstancesCallFunction_0300 startAbility err:" + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.info("====>Acts_MultipleInstancesCallFunction_0300 subscribeCallBack data:" + JSON.stringify(data));
        if (data.event == "ACTS_CALL_EVENT") {
          flag = true;
          expect(data.parameters.str)
            .assertEqual('release the first caller successful, release the second caller successful.');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        console.info("====>Acts_MultipleInstancesCallFunction_0300 unSubscribeCallback");
        done();
      }

      setTimeout(() => {
        if (flag === false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })

    /*
    * @tc.number: Acts_MultipleInstancesCallFunction_0400
    * @tc.name: Acts_MultipleInstancesCallFunction_0400
    * @tc.desc: The caller application can passively perceive the service provider multi-instance callee death
    *           notification.
    */
    it('Acts_MultipleInstancesCallFunction_0400',0, async function (done) {
      var subscriber;
      var flag = false;
      console.info("====>Acts_MultipleInstancesCallFunction_0400 start")
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info("====>Acts_MultipleInstancesCallFunction_0400 Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.acts.actscallfunction",
            abilityName: "EntryAbility",
            action: "Acts_MultipleInstancesCallFunction_0400"
          },(err) => {
          console.info("====>Acts_MultipleInstancesCallFunction_0400 startAbility err:" + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.info("====>Acts_MultipleInstancesCallFunction_0400 subscribeCallBack data:" + JSON.stringify(data));
        if (data.event == "ACTS_CALL_EVENT") {
          flag = true;
          expect(data.parameters.num).assertEqual(KILL_TWO);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        console.info("====>Acts_MultipleInstancesCallFunction_0400 unSubscribeCallback");
        done();
      }

      setTimeout(() => {
        if (flag === false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_MultipleAndSingleAndInstanceCallFunction_0100
     * @tc.name: Local multi-instance Ability supports call calls
     * @tc.desc: Caller application can call other application Ability by Call (multiple instance and single instance).
     */
    it('Acts_MultipleAndSingleAndInstanceCallFunction_0100',0, async function (done) {
      var subscriber;
      var eventCount = 0;
      console.debug('====>Acts_MultipleAndSingleAndInstanceCallFunction_0100 start');
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.debug('====>Acts_MultipleAndSingleAndInstanceCallFunction_0100 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility({
            bundleName: 'com.acts.actscallfunction',
            abilityName: 'EntryAbility',
            action: 'Acts_MultipleAndSingleAndInstanceCallFunction_0100'
          },(err) => {
          console.debug('====>Acts_MultipleAndSingleAndInstanceCallFunction_0100 startAbility err:' +
            JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.debug('====>Acts_MultipleAndSingleAndInstanceCallFunction_0100 subscribeCallBack data:' +
          JSON.stringify(data));
        if (data.event === 'ACTS_CALL_EVENT') {
          eventCount++;
          expect(data.parameters.num).assertEqual(100);
          expect(data.parameters.str).assertEqual('Acts_MultipleAndSingleAndInstanceCallFunction_0100 processed');
          expect(data.parameters.result).assertTrue();
        }
        if (data.event === "ACTS_SECOND_CALL_EVENT") {
          eventCount++;
          expect(data.parameters.num).assertEqual(EXIT_TWO_CALLEE);
        }
        if (eventCount === 2) {
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        console.debug('====>Acts_MultipleAndSingleAndInstanceCallFunction_0100 unSubscribeCallback');
        done();
      }

      setTimeout(() => {
        if (eventCount !== 2){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })
  })
}