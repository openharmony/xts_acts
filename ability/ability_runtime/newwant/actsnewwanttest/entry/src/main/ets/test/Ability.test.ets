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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index"
import commonEvent from '@ohos.commonEvent'
import missionManager from '@ohos.application.missionManager'
import appManager from '@ohos.application.appManager'


import formProvider from '@ohos.application.formProvider';
import FormInfo from '@ohos.application.formInfo';
import formError from '@ohos.application.formError';
var EXTENSION_INFO_ERR = 2097152
var USERID_ERR = 2097177
var trueInfo;
var array = new Array();
function sleep(time) {
  return new Promise((resolve)=>setTimeout(resolve,time));
}

const MAX_MISSION_NUM = 1024;
var subscriberInfo = {
  events: ['onCreateMain_To_Test_CommonEvent',
    'onWindowStageCreateMain_To_Test_CommonEvent',
    'onForegroundMain_To_Test_CommonEvent',
    'onNewWantMain_To_Test_CommonEvent',
    'onCreateSecond_To_Test_CommonEvent',
    'onWindowStageCreateSecond_To_Test_CommonEvent',
    'onForegroundSecond_To_Test_CommonEvent',
    'onNewWantSecond_To_Test_CommonEvent',
  ],
};

export default function abilityTest(abilityContext) {
  describe('ActsNewWantTest', function () {

    /**
     * @tc.number: ACTS_NewWant_Test_0100
     * @tc.name: Starting standard Ability for the first time does not trigger onNewWant.
     * @tc.desc: Starting standard Ability for the first time does not trigger onNewWant.
     */
    it('ACTS_NewWant_Test_0100', 0, async function (done) {
      console.log("ACTS_NewWant_Test_0100 --- start")
      var Subscriber;
      var flagOnCreate = 0;
      var flagOnWindowStageCreate = 0;
      var flagOnForeground = 0;
      var flagOnNewWant = 0;

       commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_NewWant_Test_0100====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      abilityContext.startAbility({
        bundleName: "com.example.newwanthap",
        abilityName: "com.example.newwanthapa.MainAbility"
      }, (error, data) => {
        console.log('ACTS_NewWant_Test_0100 - startAbility start standard: '
          + JSON.stringify(error) + ", " + JSON.stringify(data))
      })

     
      function SubscribeCallBack(err, data) {

        console.debug("ACTS_NewWant_Test_0100====>Subscribe CallBack data:====>"
          + JSON.stringify(data));
        console.debug("ACTS_NewWant_Test_0100====>Subscribe CallBack data.event:====>"
          + JSON.stringify(data.event));
        switch (data.event) {
          case 'onCreateMain_To_Test_CommonEvent':
            flagOnCreate++;
            break;
          case 'onWindowStageCreateMain_To_Test_CommonEvent':
            flagOnWindowStageCreate++;
            break;
          case 'onForegroundMain_To_Test_CommonEvent':
            flagOnForeground++;
            break;
          case 'onNewWantMain_To_Test_CommonEvent':
            flagOnNewWant++;
            break;
        }
        console.debug("ACTS_NewWant_Test_0100====>flagOnCreate:====>"
          + flagOnCreate)
        console.debug("ACTS_NewWant_Test_0100====>flagOnWindowStageCreate:====>"
          + flagOnWindowStageCreate)
        console.debug("ACTS_NewWant_Test_0100====>flagOnForeground:====>"
          + flagOnForeground)
        console.debug("ACTS_NewWant_Test_0100====>flagOnNewWant:====>"
          + flagOnNewWant)
        if (flagOnCreate == 1 && flagOnWindowStageCreate == 1
          && flagOnForeground == 1 && flagOnNewWant == 0) {
          expect(flagOnCreate).assertEqual(1);
          expect(flagOnWindowStageCreate).assertEqual(1);
          expect(flagOnForeground).assertEqual(1);
          expect(flagOnNewWant).assertEqual(0);
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
        done()
      }

      function UnSubscribeCallback() {
        console.debug("ACTS_NewWant_Test_0100====>UnSubscribe CallBack====>");
        done();
      }
    })

    /**
     * @tc.number: ACTS_NewWant_Test_0200
     * @tc.name: Starting singleton Ability for the first time does not trigger onNewWant.
     * @tc.desc: Starting singleton Ability for the first time does not trigger onNewWant.
     */
    it('ACTS_NewWant_Test_0200', 0, async function (done) {
      console.log("ACTS_NewWant_Test_0200 --- start")
      var Subscriber;
      var flagOnCreate = 0;
      var flagOnWindowStageCreate = 0;
      var flagOnForeground = 0;
      var flagOnNewWant = 0;
      
      commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_NewWant_Test_0200====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      abilityContext.startAbility({
        bundleName: "com.example.newwanthap",
        abilityName: "com.example.newwanthapa.SecondAbility"
      }, (error, data) => {
        console.log('ACTS_NewWant_Test_0200 - startAbility start singleton: '
          + JSON.stringify(error) + ", " + JSON.stringify(data))
      })

      function SubscribeCallBack(err, data) {

        console.debug("ACTS_NewWant_Test_0200====>Subscribe CallBack data:====>"
          + JSON.stringify(data));
        console.debug("ACTS_NewWant_Test_0200====>Subscribe CallBack data.event:====>"
          + JSON.stringify(data.event));
        switch (data.event) {
          case 'onCreateSecond_To_Test_CommonEvent':
            flagOnCreate++;
            break;
          case 'onWindowStageCreateSecond_To_Test_CommonEvent':
            flagOnWindowStageCreate++;
            break;
          case 'onForegroundSecond_To_Test_CommonEvent':
            flagOnForeground++;
            break;
          case 'onNewWantSecond_To_Test_CommonEvent':
            flagOnNewWant++;
            break;
        }
        console.debug("ACTS_NewWant_Test_0200====>flagOnCreate:====>"
          + flagOnCreate)
        console.debug("ACTS_NewWant_Test_0200====>flagOnWindowStageCreate:====>"
          + flagOnWindowStageCreate)
        console.debug("ACTS_NewWant_Test_0200====>flagOnForeground:====>"
          + flagOnForeground)
        console.debug("ACTS_NewWant_Test_0200====>flagOnNewWant:====>"
          + flagOnNewWant)
        if (flagOnCreate == 1 && flagOnWindowStageCreate == 1
          && flagOnForeground == 1 && flagOnNewWant == 0) {
          expect(flagOnCreate).assertEqual(1);
          expect(flagOnWindowStageCreate).assertEqual(1);
          expect(flagOnForeground).assertEqual(1);
          expect(flagOnNewWant).assertEqual(0);
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
        done()
      }

      function UnSubscribeCallback() {
        console.debug("ACTS_NewWant_Test_0200====>UnSubscribe CallBack====>");
        done();
      }
    })

    /**
     * @tc.number: ACTS_NewWant_Test_0300
     * @tc.name: Starting standard ability the second time does not trigger onNewWant.
     * @tc.desc: Starting standard ability the second time does not trigger onNewWant.
     */
    it('ACTS_NewWant_Test_0300', 0, async function (done) {
      console.log("ACTS_NewWant_Test_0300 --- start")
      var Subscriber;
      var flagOnCreate = 0;
      var flagOnWindowStageCreate = 0;
      var flagOnForeground = 0;
      var flagOnNewWant = 0;

      commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_NewWant_Test_0300====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      abilityContext.startAbility({
        bundleName: "com.example.newwanthap",
        abilityName: "com.example.newwanthapa.MainAbility",
        action: "startStandard0300"
      }, (error, data) => {
        console.log('ACTS_NewWant_Test_0300 - startAbility start standard: '
          + JSON.stringify(error) + ", " + JSON.stringify(data))
      })

      function SubscribeCallBack(err, data) {

        console.debug("ACTS_NewWant_Test_0300====>Subscribe CallBack data:====>"
          + JSON.stringify(data));
        console.debug("ACTS_NewWant_Test_0300====>Subscribe CallBack data.event:====>"
          + JSON.stringify(data.event));
        switch (data.event) {
          case 'onCreateMain_To_Test_CommonEvent':
            flagOnCreate++;
            break;
          case 'onWindowStageCreateMain_To_Test_CommonEvent':
            flagOnWindowStageCreate++;
            break;
          case 'onForegroundMain_To_Test_CommonEvent':
            flagOnForeground++;
            break;
          case 'onNewWantMain_To_Test_CommonEvent':
            flagOnNewWant++;
            break;
        }
        console.debug("ACTS_NewWant_Test_0300====>flagOnCreate:====>"
          + flagOnCreate)
        console.debug("ACTS_NewWant_Test_0300====>flagOnWindowStageCreate:====>"
          + flagOnWindowStageCreate)
        console.debug("ACTS_NewWant_Test_0300====>flagOnForeground:====>"
          + flagOnForeground)
        console.debug("ACTS_NewWant_Test_0300====>flagOnNewWant:====>"
          + flagOnNewWant)

        if (flagOnCreate == 2 && flagOnWindowStageCreate == 2
          && flagOnForeground == 2 && flagOnNewWant == 0) {
          expect(flagOnCreate).assertEqual(2);
          expect(flagOnWindowStageCreate).assertEqual(2);
          expect(flagOnForeground).assertEqual(2);
          expect(flagOnNewWant).assertEqual(0);
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }
      function UnSubscribeCallback() {
        console.debug("ACTS_NewWant_Test_0300====>UnSubscribe CallBack====>");
        done();
      }
    })

    /**
     * @tc.number: ACTS_NewWant_Test_0400
     * @tc.name: Two abilities of the same hap
     * @tc.desc: Starting singleton ability the second time does triggers onNewWant.
     */
    it('ACTS_NewWant_Test_0400', 0, async function (done) {
      console.log("ACTS_NewWant_Test_0400 --- start")
      var Subscriber;
      var flagOnCreate = 0;
      var flagOnWindowStageCreate = 0;
      var flagOnForeground = 0;
      var flagOnNewWant = 0;

      commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_NewWant_Test_0400====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      abilityContext.startAbility({
        bundleName: "com.example.newwanthap",
        abilityName: "com.example.newwanthapa.SecondAbility",
        action: "startSingleton0400"
      }, (error, data) => {
        console.log('ACTS_NewWant_Test_0400 - startAbility start singleton: '
          + JSON.stringify(error) + ", " + JSON.stringify(data))
      })

      function SubscribeCallBack(err, data) {

        console.debug("ACTS_NewWant_Test_0400====>Subscribe CallBack data:====>"
          + JSON.stringify(data));
        console.debug("ACTS_NewWant_Test_0400====>Subscribe CallBack data.event:====>"
          + JSON.stringify(data.event));
        switch (data.event) {
          case 'onCreateSecond_To_Test_CommonEvent':
            flagOnCreate++;
            break;
          case 'onWindowStageCreateSecond_To_Test_CommonEvent':
            flagOnWindowStageCreate++;
            break;
          case 'onForegroundSecond_To_Test_CommonEvent':
            flagOnForeground++;
            break;
          case 'onNewWantSecond_To_Test_CommonEvent':
            flagOnNewWant++;
            expect(data.data).assertEqual('restartSingleton');
            break;
        }
        console.debug("ACTS_NewWant_Test_0400====>flagOnCreate:====>"
          + flagOnCreate)
        console.debug("ACTS_NewWant_Test_0400====>flagOnWindowStageCreate:====>"
          + flagOnWindowStageCreate)
        console.debug("ACTS_NewWant_Test_0400====>flagOnForeground:====>"
          + flagOnForeground)
        console.debug("ACTS_NewWant_Test_0400====>flagOnNewWant:====>"
          + flagOnNewWant)

        if (flagOnCreate == 1 && flagOnWindowStageCreate == 1
          && flagOnForeground == 2 && flagOnNewWant == 1) {
          expect(flagOnCreate).assertEqual(1);
          expect(flagOnWindowStageCreate).assertEqual(1);
          expect(flagOnForeground).assertEqual(2);
          expect(flagOnNewWant).assertEqual(1);
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
        done()
      }

      function UnSubscribeCallback() {
        console.debug("ACTS_NewWant_Test_0400====>UnSubscribe CallBack====>");
        done();
      }
    })

    /**
     * @tc.number: ACTS_NewWant_Test_0500
     * @tc.name: Two haps of the same app
     * @tc.desc: Starting singleton ability the second time does triggers onNewWant.
     */
    it('ACTS_NewWant_Test_0500', 0, async function (done) {
      console.log("ACTS_NewWant_Test_0500 --- start")
      var Subscriber;
      var flagOnCreate = 0;
      var flagOnWindowStageCreate = 0;
      var flagOnForeground = 0;
      var flagOnNewWant = 0;

       commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_NewWant_Test_0500====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      abilityContext.startAbility({
        bundleName: "com.example.newwanthap",
        abilityName: "com.example.newwanthapb.MainAbility",
        action: "startHapB"
      }, (error, data) => {
        console.log('ACTS_NewWant_Test_0500 - startAbility start HapB: '
          + JSON.stringify(error) + ", " + JSON.stringify(data))
      })

      function SubscribeCallBack(err, data) {

        console.debug("ACTS_NewWant_Test_0500====>Subscribe CallBack data:====>"
          + JSON.stringify(data));
        console.debug("ACTS_NewWant_Test_0500====>Subscribe CallBack data.event:====>"
          + JSON.stringify(data.event));
        switch (data.event) {
          case 'onCreateMain_To_Test_CommonEvent':
            flagOnCreate++;
            break;
          case 'onWindowStageCreateMain_To_Test_CommonEvent':
            flagOnWindowStageCreate++;
            break;
          case 'onForegroundMain_To_Test_CommonEvent':
            flagOnForeground++;
            break;
          case 'onNewWantMain_To_Test_CommonEvent':
            flagOnNewWant++;
            expect(data.data).assertEqual('restartHapB');
            break;
        }
        console.debug("ACTS_NewWant_Test_0500====>flagOnCreate:====>"
          + flagOnCreate)
        console.debug("ACTS_NewWant_Test_0500====>flagOnWindowStageCreate:====>"
          + flagOnWindowStageCreate)
        console.debug("ACTS_NewWant_Test_0500====>flagOnForeground:====>"
          + flagOnForeground)
        console.debug("ACTS_NewWant_Test_0500====>flagOnNewWant:====>"
          + flagOnNewWant)

        if (flagOnCreate == 1 && flagOnWindowStageCreate == 1
          && flagOnForeground == 2 && flagOnNewWant == 1) {
          expect(flagOnCreate).assertEqual(1);
          expect(flagOnWindowStageCreate).assertEqual(1);
          expect(flagOnForeground).assertEqual(2);
          expect(flagOnNewWant).assertEqual(1);
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
        done()
      }

      function UnSubscribeCallback() {
        console.debug("ACTS_NewWant_Test_0500====>UnSubscribe CallBack====>");
        done();
      }
    })

    /**
     * @tc.number: ACTS_NewWant_Test_0600
     * @tc.name: Cross-application
     * @tc.desc: Starting singleton ability the second time does triggers onNewWant.
     */
    it('ACTS_NewWant_Test_0600', 0, async function (done) {
      console.log("ACTS_NewWant_Test_0600 --- start")
      var Subscriber;
      var flagOnCreate = 0;
      var flagOnWindowStageCreate = 0;
      var flagOnForeground = 0;
      var flagOnNewWant = 0;

       commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_NewWant_Test_0600====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      abilityContext.startAbility({
        bundleName: "com.example.newwanthapa",
        abilityName: "com.example.newwanthapc.MainAbility",
        action: "startHapC"
      }, (error, data) => {
        console.log('ACTS_NewWant_Test_0600 - startAbility start HapC: '
          + JSON.stringify(error) + ", " + JSON.stringify(data))
      })

      function SubscribeCallBack(err, data) {

        console.debug("ACTS_NewWant_Test_0600====>Subscribe CallBack data:====>"
          + JSON.stringify(data));
        console.debug("ACTS_NewWant_Test_0600====>Subscribe CallBack data.event:====>"
          + JSON.stringify(data.event));
        switch (data.event) {
          case 'onCreateMain_To_Test_CommonEvent':
            flagOnCreate++;
            break;
          case 'onWindowStageCreateMain_To_Test_CommonEvent':
            flagOnWindowStageCreate++;
            break;
          case 'onForegroundMain_To_Test_CommonEvent':
            flagOnForeground++;
            break;
          case 'onNewWantMain_To_Test_CommonEvent':
            flagOnNewWant++;
            expect(data.data).assertEqual('restartHapC');
            break;
        }
        console.debug("ACTS_NewWant_Test_0600====>flagOnCreate:====>"
          + flagOnCreate)
        console.debug("ACTS_NewWant_Test_0600====>flagOnWindowStageCreate:====>"
          + flagOnWindowStageCreate)
        console.debug("ACTS_NewWant_Test_0600====>flagOnForeground:====>"
          + flagOnForeground)
        console.debug("ACTS_NewWant_Test_0600====>flagOnNewWant:====>"
          + flagOnNewWant)

        if (flagOnCreate == 1 && flagOnWindowStageCreate == 1
          && flagOnForeground == 2 && flagOnNewWant == 1) {
          expect(flagOnCreate).assertEqual(1);
          expect(flagOnWindowStageCreate).assertEqual(1);
          expect(flagOnForeground).assertEqual(2);
          expect(flagOnNewWant).assertEqual(1);
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
        done()
      }

      function UnSubscribeCallback() {
        console.debug("ACTS_NewWant_Test_0600====>UnSubscribe CallBack====>");
        done();
      }
    })

    /**
     * @tc.number: ACTS_NewWant_Test_0700
     * @tc.name: Service ability
     * @tc.desc: Starting singleton ability the second time does triggers onNewWant.
     */
    it('ACTS_NewWant_Test_0700', 0, async function (done) {
      console.log("ACTS_NewWant_Test_0700 --- start")
      var Subscriber;
      var flagOnCreate = 0;
      var flagOnWindowStageCreate = 0;
      var flagOnForeground = 0;
      var flagOnNewWant = 0;

      commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_NewWant_Test_0700====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      abilityContext.startAbility({
        bundleName: "com.example.newwanthap",
        abilityName: "com.example.newwanthapa.SecondAbility",
        action: "startSecondAbility0700"
      }, (error, data) => {
        console.log('ACTS_NewWant_Test_0700 - startAbility start SecondAbility: '
          + JSON.stringify(error) + ", " + JSON.stringify(data))
      })

      function SubscribeCallBack(err, data) {

        console.debug("ACTS_NewWant_Test_0700====>Subscribe CallBack data:====>"
          + JSON.stringify(data));
        console.debug("ACTS_NewWant_Test_0700====>Subscribe CallBack data.event:====>"
          + JSON.stringify(data.event));
        switch (data.event) {
          case 'onCreateSecond_To_Test_CommonEvent':
            flagOnCreate++;
            break;
          case 'onWindowStageCreateSecond_To_Test_CommonEvent':
            flagOnWindowStageCreate++;
            break;
          case 'onForegroundSecond_To_Test_CommonEvent':
            flagOnForeground++;
            break;
          case 'onNewWantSecond_To_Test_CommonEvent':
            flagOnNewWant++;
            expect(data.data).assertEqual('restartSecondAbility0700');
            break;
        }
        console.debug("ACTS_NewWant_Test_0700====>flagOnCreate:====>"
          + flagOnCreate)
        console.debug("ACTS_NewWant_Test_0700====>flagOnWindowStageCreate:====>"
          + flagOnWindowStageCreate)
        console.debug("ACTS_NewWant_Test_0700====>flagOnForeground:====>"
          + flagOnForeground)
        console.debug("ACTS_NewWant_Test_0700====>flagOnNewWant:====>"
          + flagOnNewWant)

        if (flagOnCreate == 1 && flagOnWindowStageCreate == 1
          && flagOnForeground == 2 && flagOnNewWant == 1) {
          expect(flagOnCreate).assertEqual(1);
          expect(flagOnWindowStageCreate).assertEqual(1);
          expect(flagOnForeground).assertEqual(2);
          expect(flagOnNewWant).assertEqual(1);
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
        done()
      }
      function UnSubscribeCallback() {
        console.debug("ACTS_NewWant_Test_0700====>UnSubscribe CallBack====>");
        done();
      }
    })

    /**
     * @tc.number: ACTS_NewWant_Test_0800
     * @tc.name: API8 startup API7
     * @tc.desc: Starting singleton ability the second time does triggers onNewWant.
     */
    it('ACTS_NewWant_Test_0800', 0, async function (done) {
      console.log("ACTS_NewWant_Test_0800 --- start")
      var Subscriber;
      var flagOnCreate = 0;
      var flagOnWindowStageCreate = 0;
      var flagOnForeground = 0;
      var flagOnNewWant = 0;

      commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_NewWant_Test_0800====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      abilityContext.startAbility({
        bundleName: "com.example.newwanthap",
        abilityName: "com.example.newwanthapa.SecondAbility",
        action: "startSecondAbility0800"
      }, (error, data) => {
        console.log('ACTS_NewWant_Test_0800 - startAbility start SecondAbility: '
          + JSON.stringify(error) + ", " + JSON.stringify(data))
      })

      
      function SubscribeCallBack(err, data) {

        console.debug("ACTS_NewWant_Test_0800====>Subscribe CallBack data:====>"
          + JSON.stringify(data));
        console.debug("ACTS_NewWant_Test_0800====>Subscribe CallBack data.event:====>"
          + JSON.stringify(data.event));
        switch (data.event) {
          case 'onCreateSecond_To_Test_CommonEvent':
            flagOnCreate++;
            break;
          case 'onWindowStageCreateSecond_To_Test_CommonEvent':
            flagOnWindowStageCreate++;
            break;
          case 'onForegroundSecond_To_Test_CommonEvent':
            flagOnForeground++;
            break;
          case 'onNewWantSecond_To_Test_CommonEvent':
            flagOnNewWant++;
            expect(data.data).assertEqual('restartSecondAbility0800');
            break;
        }
        console.debug("ACTS_NewWant_Test_0800====>flagOnCreate:====>"
          + flagOnCreate)
        console.debug("ACTS_NewWant_Test_0800====>flagOnWindowStageCreate:====>"
          + flagOnWindowStageCreate)
        console.debug("ACTS_NewWant_Test_0800====>flagOnForeground:====>"
          + flagOnForeground)
        console.debug("ACTS_NewWant_Test_0800====>flagOnNewWant:====>"
          + flagOnNewWant)

        if (flagOnCreate == 1 && flagOnWindowStageCreate == 1
          && flagOnForeground == 2 && flagOnNewWant == 1) {
          expect(flagOnCreate).assertEqual(1);
          expect(flagOnWindowStageCreate).assertEqual(1);
          expect(flagOnForeground).assertEqual(2);
          expect(flagOnNewWant).assertEqual(1);
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
        done()
      }
      function UnSubscribeCallback() {
        console.debug("ACTS_NewWant_Test_0800====>UnSubscribe CallBack====>");
        done();
      }
    })


    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_001
     * @tc.name    StartServiceExtensionAbility with incorrect abilityName.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_001', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension1"
      };
      await globalThis.AbilityContext.startServiceExtensionAbility(want).then((data) => {
        console.log('Ability: startServiceExtensionAbility success:' + JSON.stringify(data));
        expect("case execute failed").assertEqual(data);
      }).catch((error) => {
        console.error(`Ability: startServiceExtensionAbility failed: ${JSON.stringify(error)}`);
        expect(EXTENSION_INFO_ERR).assertEqual(error.code);
      })
      done()
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_002
     * @tc.name    StopServiceExtensionAbility with incorrect bundleName.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_002', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest1",
        abilityName: "FirstExtension"
      };
      await globalThis.AbilityContext.stopServiceExtensionAbility(want).then((data) => {
        console.log(`Ability: stopServiceExtensionAbility success: ${JSON.stringify(data)}`);
        expect("case execute failed").assertEqual(data);
      }).catch((error) => {
        console.error(`Ability: stopServiceExtensionAbility failed: ${JSON.stringify(error)}`);
        expect(EXTENSION_INFO_ERR).assertEqual(error.code);
      })
      done()
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_003
     * @tc.name    startServiceExtensionAbilityWithAccount with incorrect userId.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_003', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension"
      };
      await globalThis.AbilityContext.startServiceExtensionAbilityWithAccount(want, 999).then((data) => {
        console.log(`Ability: startServiceExtensionAbilityWithAccount success: ${JSON.stringify(data)}`);
        expect("case execute failed").assertEqual("data");
      }).catch((error) => {
        console.error(`Ability: startServiceExtensionAbilityWithAccount failed: ${JSON.stringify(error)}`);
        expect(USERID_ERR).assertEqual(error.code);
      })
      done()
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_004
     * @tc.name    stopServiceExtensionAbilityWithAccount with incorrect userId.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_004', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension"
      };
      await globalThis.AbilityContext.stopServiceExtensionAbilityWithAccount(want, 999).then((data) => {
        console.log(`Ability: stopServiceExtensionAbilityWithAccount success: ${JSON.stringify(data)}`);
        expect("case execute failed").assertEqual(data);
      }).catch((error) => {
        console.error(`Ability: stopServiceExtensionAbilityWithAccount failed: ${JSON.stringify(error)}`);
        expect(USERID_ERR).assertEqual(error.code);
      })
      done()
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_005
     * @tc.name    StartServiceExtensionAbility with incorrect abilityName.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_005', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension1"
      }
      await globalThis.AbilityContext.startServiceExtensionAbility(want, (err, data) => {
        if (err.code) {
          console.error(`Ability: startServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect(EXTENSION_INFO_ERR).assertEqual(err.code);
        } else {
          console.log(`Ability: startServiceExtensionAbility success: ${JSON.stringify(data)}`);
          expect("case execute failed").assertEqual(data);
        }
        done()
      })
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_006
     * @tc.name    StopServiceExtensionAbility with incorrect bundleName.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_006', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest1",
        abilityName: "FirstExtension"
      };
      await globalThis.AbilityContext.stopServiceExtensionAbility(want, (err, data) => {
        if (err.code) {
          console.error(`Ability: stopServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect(EXTENSION_INFO_ERR).assertEqual(err.code);
        } else {
          console.log(`Ability: stopServiceExtensionAbility success: ${JSON.stringify(data)}`);
          expect("case execute failed").assertEqual(data);
        }
        done()
      })
      done()
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_007
     * @tc.name    startServiceExtensionAbilityWithAccount with incorrect userId.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_007', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension"
      };
      await globalThis.AbilityContext.startServiceExtensionAbilityWithAccount(want, 999, (err, data) => {
        if (err.code) {
          console.error(`Ability: startServiceExtensionAbilityWithAccount failed: ${JSON.stringify(err)}`);
          expect(USERID_ERR).assertEqual(err.code);
        } else {
          console.log(`Ability: startServiceExtensionAbilityWithAccount success: ${JSON.stringify(data)}`);
          expect("case execute failed").assertEqual(data);
        }
        done()
      })
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_008
     * @tc.name    stopServiceExtensionAbilityWithAccount with incorrect userId.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_008', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension"
      };
      globalThis.AbilityContext.stopServiceExtensionAbilityWithAccount(want, 999, (err, data) => {
        if (err.code) {
          console.error(`Ability: stopServiceExtensionAbilityWithAccount failed: ${JSON.stringify(err)}`);
          expect(USERID_ERR).assertEqual(err.code);
        } else {
          console.log(`Ability: stopServiceExtensionAbilityWithAccount success: ${JSON.stringify(data)}`);
          expect("case execute failed").assertEqual(data);
        }
        done()
      })
    })

    /*
     * @tc.number  SUB_AA_AMS_Context_0100
     * @tc.name    Get the resource and path of the context.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Context_0100', 0, async function (done) {
      expect("/data/storage/el2/base/haps/entry_test/cache").assertEqual(globalThis.AbilityContext.cacheDir)
      expect("/data/storage/el2/base/haps/entry_test/temp").assertEqual(globalThis.AbilityContext.tempDir)
      expect("/data/storage/el2/base/haps/entry_test/files").assertEqual(globalThis.AbilityContext.filesDir)
      expect("/data/storage/el2/database/entry_test").assertEqual(globalThis.AbilityContext.databaseDir)
      expect("/data/storage/el2/base/haps/entry_test/preferences").assertEqual(globalThis.AbilityContext.preferencesDir)
      expect("/data/storage/el1/bundle").assertEqual(globalThis.AbilityContext.bundleCodeDir)
      expect("/data/storage/el2/distributedfiles").assertEqual(globalThis.AbilityContext.distributedFilesDir)
      expect(1).assertEqual(globalThis.AbilityContext.area)
      globalThis.AbilityContext.resourceManager.getConfiguration((err, data) => {
        if (err.code != 0 ) {
          console.error(`Ability: getConfiguration failed: ${JSON.stringify(err)}`);
          expect(USERID_ERR).assertEqual(err.code);
          done()
        } else {
          console.log(`Ability: getConfiguration success: ${JSON.stringify(data)}`);
          expect(1).assertEqual(data.direction)
          done()
        }
      })
      let moduleContext = globalThis.AbilityContext.createModuleContext("module1")
      expect("/data/storage/el2/base/cache").assertEqual(moduleContext.cacheDir)
      done()
    })

    /*
     * @tc.number  SUB_AA_Form_provider_getFormsInfo_0100
     * @tc.name    The provider calls the getFormsInfo interface to obtain form information.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_Form_provider_getFormsInfo_0100', 0, async function (done) {
      console.info("SUB_AA_Form_provider_getFormsInfo_0100");
      formProvider.getFormsInfo((err, value) => {
        console.info("formProvider::GetFormsInfoTest err: " + JSON.stringify(err));
        console.info("formProvider::GetFormsInfoTest value: " + JSON.stringify(value));
        if (err.code != 0) {
          expect(0).assertEqual(2)
        } else {
          for(let i = 0; i < value.length; i++){
            if(value[i].bundleName == "com.example.extensionapitest" && value[i].name == "widget"){
              trueInfo = value[i]
              console.info("formProvider::GetFormsInfoTest trueInfo: " + JSON.stringify(trueInfo));
            }
          }
        }
        checkFormInfo(trueInfo)
        done()
      })
      done()
    })

    /*
     * @tc.number  SUB_AA_Form_provider_getFormsInfo_0200
     * @tc.name    The provider calls the getFormsInfo interface to obtain form information in the module1.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_Form_provider_getFormsInfo_0200', 0, async function (done) {
      console.info("SUB_AA_Form_provider_getFormsInfo_0200");
      const filter: formInfo.FormInfoFilter = {
        moduleName: "module1"
      };
      formProvider.getFormsInfo(filter, (err, value) => {
        console.info("formProvider::GetFormsInfoTest err: " + JSON.stringify(err));
        console.info("formProvider::GetFormsInfoTest value: " + JSON.stringify(value));
        if (err.code != 0) {
          expect(0).assertEqual(2)
        } else {
          if(value.length == 0){
            expect(1).assertEqual(0)
          }else{
            for(let i = 0; i < value.length; i++){
              if(value[i].bundleName == "com.example.extensionapitest" && value[i].name == "widget1"){
                trueInfo = value[i]
                console.info("formProvider::GetFormsInfoTest trueInfo: " + JSON.stringify(trueInfo));
              }
            }
          }
        }
        checkFormInfoModule1(trueInfo)
        done();
      })
      done()
    })

    /*
     * @tc.number  SUB_AA_Form_provider_TestFormErr_0100
     * @tc.name    Get all FormError types.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_Form_provider_TestFormErr_0100', 0, async function (done) {
      console.info("SUB_AA_Form_provider_TestFormErr_0100");
      expect(7).assertEqual(formError.FormError.ERR_ADD_INVALID_PARAM)
      expect(10).assertEqual(formError.FormError.ERR_BIND_PROVIDER_FAILED)
      expect(8).assertEqual(formError.FormError.ERR_CFG_NOT_MATCH_ID)
      expect(1).assertEqual(formError.FormError.ERR_COMMON)
      expect(31).assertEqual(formError.FormError.ERR_FORM_DUPLICATE_ADDED)
      expect(20).assertEqual(formError.FormError.ERR_FORM_FA_NOT_INSTALLED)
      expect(18).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_ABILITY)
      expect(19).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_DIMENSION)
      expect(17).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_MODULE)
      expect(5).assertEqual(formError.FormError.ERR_GET_BUNDLE_FAILED)
      expect(4).assertEqual(formError.FormError.ERR_GET_INFO_FAILED)
      expect(6).assertEqual(formError.FormError.ERR_GET_LAYOUT_FAILED)
      expect(36).assertEqual(formError.FormError.ERR_IN_RECOVERY)
      expect(15).assertEqual(formError.FormError.ERR_MAX_FORMS_PER_CLIENT)
      expect(12).assertEqual(formError.FormError.ERR_MAX_INSTANCES_PER_FORM)
      expect(11).assertEqual(formError.FormError.ERR_MAX_SYSTEM_FORMS)
      expect(16).assertEqual(formError.FormError.ERR_MAX_SYSTEM_TEMP_FORMS)
      expect(9).assertEqual(formError.FormError.ERR_NOT_EXIST_ID)
      expect(13).assertEqual(formError.FormError.ERR_OPERATION_FORM_NOT_SELF)
      expect(2).assertEqual(formError.FormError.ERR_PERMISSION_DENY)
      expect(14).assertEqual(formError.FormError.ERR_PROVIDER_DEL_FAIL)
      expect(30).assertEqual(formError.FormError.ERR_SYSTEM_RESPONSES_FAILED)
      done()
    })

    /*
     * @tc.number  SUB_AA_Form_provider_TestFormInfo_0100
     * @tc.name     Get all FormInfo types
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_Form_provider_TestFormInfo_0100', 0, async function (done) {
      console.info("SUB_AA_Form_provider_TestFormInfo_0100");
      expect("ohos.extra.param.key.form_dimension").assertEqual(FormInfo.FormParam.DIMENSION_KEY)
      expect("ohos.extra.param.key.form_height").assertEqual(FormInfo.FormParam.HEIGHT_KEY)
      expect("ohos.extra.param.key.module_name").assertEqual(FormInfo.FormParam.MODULE_NAME_KEY)
      expect("ohos.extra.param.key.form_name").assertEqual(FormInfo.FormParam.NAME_KEY)
      expect("ohos.extra.param.key.form_temporary").assertEqual(FormInfo.FormParam.TEMPORARY_KEY)
      expect("ohos.extra.param.key.form_width").assertEqual(FormInfo.FormParam.WIDTH_KEY)
      expect(0).assertEqual(FormInfo.FormState.DEFAULT)
      expect(1).assertEqual(FormInfo.FormState.READY)
      expect(-1).assertEqual(FormInfo.FormState.UNKNOWN)
      expect(0).assertEqual(FormInfo.ColorMode.MODE_DARK)
      expect(1).assertEqual(FormInfo.ColorMode.MODE_LIGHT)
      done();
    });
  })
}
function checkFormInfoModule1(formInfo){
  console.info("formProvider::GetFormsInfoTest value: " + JSON.stringify(formInfo));
  expect("com.example.extensionapitest").assertEqual(formInfo.bundleName)
  expect("module1").assertEqual(formInfo.moduleName)
  expect("FormAbility").assertEqual(formInfo.abilityName)
  expect("widget1").assertEqual(formInfo.name)
  expect("This is a service widget.").assertEqual(formInfo.description)
  expect(FormInfo.FormType.JS).assertEqual(formInfo.type)
  expect(FormInfo.ColorMode.MODE_DARK).assertEqual(formInfo.colorMode)
  expect(1).assertEqual(formInfo.isDefault)
  expect(1).assertEqual(formInfo.updateEnabled)
  expect(0).assertEqual(formInfo.formVisibleNotify)
  expect(undefined).assertEqual(formInfo.relatedBundleName)
  expect("ability://xxxxx").assertEqual(formInfo.formConfigAbility)
  expect(1).assertEqual(formInfo.updateDuration)
  expect(2).assertEqual(formInfo.defaultDimension)
  expect(2).assertEqual(formInfo.supportDimensions[0])
}
function checkFormInfo(formInfo){
  console.info("formProvider::GetFormsInfoTest formInfo: " + JSON.stringify(formInfo));
  expect("com.example.extensionapitest").assertEqual(formInfo.bundleName)
  expect("entry").assertEqual(formInfo.moduleName)
  expect("FormAbility").assertEqual(formInfo.abilityName)
  expect("widget").assertEqual(formInfo.name)
  expect("This is a service widget.").assertEqual(formInfo.description)
  expect(FormInfo.FormType.JS).assertEqual(formInfo.type)
  expect(FormInfo.ColorMode.MODE_AUTO).assertEqual(formInfo.colorMode)
  expect(1).assertEqual(formInfo.isDefault)
  expect(1).assertEqual(formInfo.updateEnabled)
  expect(0).assertEqual(formInfo.formVisibleNotify)
  expect(undefined).assertEqual(formInfo.relatedBundleName)
  expect("ability://xxxxx").assertEqual(formInfo.formConfigAbility)
  expect(1).assertEqual(formInfo.updateDuration)
  expect(2).assertEqual(formInfo.defaultDimension)
  expect(2).assertEqual(formInfo.supportDimensions[0])
}