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
import abilityManager from '@ohos.application.abilityManager';
import appManager from '@ohos.application.appManager'

const TIMEOUT = 1000;
var subscriberInfo = {
  events: ['HapAA_To_Test_CommonEvent',
    'HapAB_To_Test_CommonEvent',
    'HapBA_To_Test_CommonEvent',
    'HapBB_To_Test_CommonEvent',
    'HapBC_To_Test_CommonEvent',
    'HapBD_To_Test_CommonEvent',
    'HapBE_To_Test_CommonEvent',
    'HapBF_To_Test_CommonEvent',
  ],
};

var processNameA = "com.example.multiinstancehapa";
var processNameB = "com.example.multiinstancehapb";
var processNameC = "com.example.multiinstancehapc";

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}
export default function abilityTest() {
  describe('ActsProcessMultiInstanceTest', function () {

    afterEach(async (done) => {

      await appManager.killProcessesByBundleName("com.example.multiinstancehapa");
      await appManager.killProcessesByBundleName("com.example.multiinstancehapb");

      let wantInfo = {
        bundleName: "com.example.processmultiinstance",
        abilityName: "com.example.processmultiinstance.MainAbility"
      }
      await globalThis.abilityContext.startAbility(wantInfo).then((data) => {
        console.log("ACTS_Process_MultiInstance startAbility data: " + JSON.stringify(data));
      }).catch((err) => {
        console.log("ACTS_Process_MultiInstance startAbility err: " + JSON.stringify(err));
      })

      setTimeout(function () {
        console.log("ACTS_Process_MultiInstance afterEach end");
        done();
      }, 500);
    })

    /**
     * @tc.number: ACTS_Process_MultiInstance_0100
     * @tc.name: Check that two HAP packages in one App, the module process are both empty
     * @tc.desc: Check that two HAP packages in one App, the module process are both empty,
     * run in the same process.
     */
    it('ACTS_Process_MultiInstance_0100', 0, async function (done) {
      console.log("ACTS_Process_MultiInstance_0100 --- start")
      var Subscriber;
      var abilityinfos;
      var flagBAToTest = false;
      var flagBBToTest = false;

      function SubscribeCallBack(err, data) {
        try {
          console.debug("ACTS_Process_MultiInstance_0100====>Subscribe CallBack data:====>"
            + JSON.stringify(data));
          console.debug("ACTS_Process_MultiInstance_0100====>Subscribe CallBack data.event:====>"
            + JSON.stringify(data.event));
          switch (data.event) {
            case 'HapBA_To_Test_CommonEvent':
              flagBAToTest = true;
              break;
            case 'HapBB_To_Test_CommonEvent':
              flagBBToTest = true;
              break;
          }
          console.debug("ACTS_Process_MultiInstance_0100====>SubscribeCallBack flagBAToTest:====>"
            + flagBAToTest)
          console.debug("ACTS_Process_MultiInstance_0100====>SubscribeCallBack flagBBToTest:====>"
            + flagBBToTest)
          setTimeout(function () {
            if (flagBAToTest == true && flagBBToTest == true) {
              commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            }
          }, TIMEOUT);
        } catch (err) {
          console.debug("ACTS_Process_MultiInstance_0100====>SubscribeCallBack err:====>" + err)
          expect(err).assertFail();
          done();
        }
      }
      commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_Process_MultiInstance_0100====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      async function UnSubscribeCallback() {
        try {
          console.debug("ACTS_Process_MultiInstance_0100====>UnSubscribeCallback in====>")
          abilityinfos = await abilityManager.getAbilityRunningInfos();
          console.debug("ACTS_Process_MultiInstance_0100====>abilityinfos:====>"
            + JSON.stringify(abilityinfos));
          var pidba;
          var pidbb;
          var abilityhapbaExist = false;
          var abilityhapbbExist = false;
          for (var i = 0; i < abilityinfos.length; i++) {
            if ((abilityinfos[i].processName == processNameB)) {
              console.debug("ACTS_Process_MultiInstance_0100 PD abilityinfos[" + i + "].ability.abilityName:"
                + JSON.stringify(abilityinfos[i].ability.abilityName));
              if (abilityinfos[i].ability.abilityName == 'com.example.multiinstancehapba.MainAbility') {
                abilityhapbaExist = true;
                pidba = abilityinfos[i].pid
              }
              if (abilityinfos[i].ability.abilityName == 'com.example.multiinstancehapbb.MainAbility') {
                abilityhapbbExist = true;
                pidbb = abilityinfos[i].pid
              }
            }
          }
          console.debug("ACTS_Process_MultiInstance_0100====>UnSubscribeCallback abilityhapbaExist:====>"
            + abilityhapbaExist);
          console.debug("ACTS_Process_MultiInstance_0100====>UnSubscribeCallback abilityhapbbExist:====>"
            + abilityhapbbExist);
          console.debug("ACTS_Process_MultiInstance_0100====>UnSubscribeCallback pidba:====>"
            + pidba);
          console.debug("ACTS_Process_MultiInstance_0100====>UnSubscribeCallback pidbb:====>"
            + pidbb);
          expect(abilityhapbaExist).assertEqual(true);
          expect(abilityhapbbExist).assertEqual(true);
          expect(pidba).assertEqual(pidbb);
          console.debug("ACTS_Process_MultiInstance_0100====>UnSubscribe CallBack====>");
          done();
        } catch (err) {
          console.debug("ACTS_Process_MultiInstance_0100====>UnSubscribeCallback err:====>"
            + JSON.stringify(err));
          expect(err).assertFail();
          done();
        }
      }
      await sleep(500)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.multiinstancehapb",
        abilityName: "com.example.multiinstancehapba.MainAbility",
      }, (err, data) => {
        console.log('ACTS_Process_MultiInstance_0100 - startAbilityhapba: '
          + JSON.stringify(err) + ", " + JSON.stringify(data))
      })
      await sleep(500)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.multiinstancehapb",
        abilityName: "com.example.multiinstancehapbb.MainAbility",
      }, (err, data) => {
        console.log('ACTS_Process_MultiInstance_0100 - startAbilityhapbb: '
          + JSON.stringify(err) + ", " + JSON.stringify(data))
      })
    })

    /**
     * @tc.number: ACTS_Process_MultiInstance_0200
     * @tc.name: Check that two HAP packages in one App, the module process name is the same.
     * @tc.desc: Check that two HAP packages in one App, the module process name is the same,
     * run in the same process.
     */
    it('ACTS_Process_MultiInstance_0200', 0, async function (done) {
      console.log("ACTS_Process_MultiInstance_0200 --- start")
      var Subscriber;
      var abilityinfos;
      var flagBCToTest = false;
      var flagBDToTest = false;

      function SubscribeCallBack(err, data) {
        try {
          console.debug("ACTS_Process_MultiInstance_0200====>Subscribe CallBack data:====>"
            + JSON.stringify(data));
          console.debug("ACTS_Process_MultiInstance_0200====>Subscribe CallBack data.event:====>"
            + JSON.stringify(data.event));
          switch (data.event) {
            case 'HapBC_To_Test_CommonEvent':
              flagBCToTest = true;
              break;
            case 'HapBD_To_Test_CommonEvent':
              flagBDToTest = true;
              break;
          }
          console.debug("ACTS_Process_MultiInstance_0200====>SubscribeCallBack flagBCToTest:====>"
            + flagBCToTest)
          console.debug("ACTS_Process_MultiInstance_0200====>SubscribeCallBack flagBDToTest:====>"
            + flagBDToTest)
          setTimeout(function () {
            if (flagBCToTest == true && flagBDToTest == true) {
              commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            }
          }, TIMEOUT);
        } catch (err) {
          console.debug("ACTS_Process_MultiInstance_0200====>SubscribeCallBack err:====>" + err)
          expect(err).assertFail();
          done();
        }
      }
      commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_Process_MultiInstance_0200====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      async function UnSubscribeCallback() {
        try {
          console.debug("ACTS_Process_MultiInstance_0200====>UnSubscribeCallback in====>")

          abilityinfos = await abilityManager.getAbilityRunningInfos();
          console.debug("ACTS_Process_MultiInstance_0200====>abilityinfos:====>"
            + JSON.stringify(abilityinfos));
          var pidbc;
          var pidbd;
          var abilityhapbcExist = false;
          var abilityhapbdExist = false;
          for (var i = 0; i < abilityinfos.length; i++) {
            if ((abilityinfos[i].processName == processNameC)) {
              console.debug("ACTS_Process_MultiInstance_0200 PC abilityinfos[" + i + "].ability.abilityName:"
                + JSON.stringify(abilityinfos[i].ability.abilityName));
              if (abilityinfos[i].ability.abilityName == 'com.example.multiinstancehapbc.MainAbility') {
                abilityhapbcExist = true;
                pidbc = abilityinfos[i].pid
              }
              if (abilityinfos[i].ability.abilityName == 'com.example.multiinstancehapbd.MainAbility') {
                abilityhapbdExist = true;
                pidbd = abilityinfos[i].pid
              }
            }
          }
          console.debug("ACTS_Process_MultiInstance_0200====>UnSubscribeCallback abilityhapbcExist:====>"
            + abilityhapbcExist);
          console.debug("ACTS_Process_MultiInstance_0200====>UnSubscribeCallback abilityhapbdExist:====>"
            + abilityhapbdExist);
          console.debug("ACTS_Process_MultiInstance_0200====>UnSubscribeCallback pidbc:====>"
            + pidbc);
          console.debug("ACTS_Process_MultiInstance_0200====>UnSubscribeCallback pidbd:====>"
            + pidbd);
          expect(abilityhapbcExist).assertEqual(true);
          expect(abilityhapbdExist).assertEqual(true);
          expect(pidbc).assertEqual(pidbd);
          console.debug("ACTS_Process_MultiInstance_0200====>UnSubscribe CallBack====>");
          done();
        } catch (err) {
          console.debug("ACTS_Process_MultiInstance_0200====>UnSubscribeCallback err:====>"
            + JSON.stringify(err));
          expect(err).assertFail();
          done();
        }
      }
      await sleep(500)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.multiinstancehapb",
        abilityName: "com.example.multiinstancehapbc.MainAbility",
      }, (err, data) => {
        console.log('ACTS_Process_MultiInstance_0200 - startAbilityhapbc: '
          + JSON.stringify(err) + ", " + JSON.stringify(data))
      })
      await sleep(500)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.multiinstancehapb",
        abilityName: "com.example.multiinstancehapbd.MainAbility",
      }, (err, data) => {
        console.log('ACTS_Process_MultiInstance_0200 - startAbilityhapbd: '
          + JSON.stringify(err) + ", " + JSON.stringify(data))
      })
    })

    /**
     * @tc.number: ACTS_Process_MultiInstance_0300
     * @tc.name: Check that two HAP packages in one App, the module process names are different.
     * @tc.desc: Check that two HAP packages in one App, the module process names are different，
     * run in different processes,the process names are different.
     */
    it('ACTS_Process_MultiInstance_0300', 0, async function (done) {
      console.log("ACTS_Process_MultiInstance_0300 --- start")
      var Subscriber;
      var abilityinfos;
      var flagBDToTest = false;
      var flagBEToTest = false;

      function SubscribeCallBack(err, data) {
        try {
          console.debug("ACTS_Process_MultiInstance_0300====>Subscribe CallBack data:====>"
            + JSON.stringify(data));
          console.debug("ACTS_Process_MultiInstance_0300====>Subscribe CallBack data.event:====>"
            + JSON.stringify(data.event));
          switch (data.event) {
            case 'HapBD_To_Test_CommonEvent':
              flagBDToTest = true;
              break;
            case 'HapBE_To_Test_CommonEvent':
              flagBEToTest = true;
              break;
          }
          console.debug("ACTS_Process_MultiInstance_0300====>SubscribeCallBack flagBDToTest:====>"
            + flagBDToTest)
          console.debug("ACTS_Process_MultiInstance_0300====>SubscribeCallBack flagBEToTest:====>"
            + flagBEToTest)
          setTimeout(function () {
            if (flagBDToTest == true && flagBEToTest == true) {
              commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            }
          }, TIMEOUT);
        } catch (err) {
          console.debug("ACTS_Process_MultiInstance_0300====>SubscribeCallBack err:====>" + err)
          expect(err).assertFail();
          done();
        }
      }
      commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_Process_MultiInstance_0300====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      async function UnSubscribeCallback() {
        try {
          console.debug("ACTS_Process_MultiInstance_0300====>UnSubscribeCallback in====>")

          abilityinfos = await abilityManager.getAbilityRunningInfos();
          console.debug("ACTS_Process_MultiInstance_0300====>abilityinfos:====>"
            + JSON.stringify(abilityinfos));
          var pidbd;
          var pidbe;
          var abilityhapbdExist = false;
          var abilityhapbeExist = false;
          for (var i = 0; i < abilityinfos.length; i++) {
            if ((abilityinfos[i].processName == processNameC)) {
              console.debug("ACTS_Process_MultiInstance_0300 PC abilityinfos[" + i + "].ability.abilityName:"
                + JSON.stringify(abilityinfos[i].ability.abilityName));
              if (abilityinfos[i].ability.abilityName == 'com.example.multiinstancehapbd.MainAbility') {
                abilityhapbdExist = true;
                pidbd = abilityinfos[i].pid
              }
            }
            if ((abilityinfos[i].processName == processNameA)) {
              console.debug("ACTS_Process_MultiInstance_0300 PA abilityinfos[" + i + "].ability.abilityName:"
                + JSON.stringify(abilityinfos[i].ability.abilityName));
              if (abilityinfos[i].ability.abilityName == 'com.example.multiinstancehapbe.MainAbility') {
                abilityhapbeExist = true;
                pidbe = abilityinfos[i].pid
              }
            }
          }
          console.debug("ACTS_Process_MultiInstance_0300====>UnSubscribeCallback abilityhapbdExist:====>"
            + abilityhapbdExist);
          console.debug("ACTS_Process_MultiInstance_0300====>UnSubscribeCallback abilityhapbeExist:====>"
            + abilityhapbeExist);
          console.debug("ACTS_Process_MultiInstance_0300====>UnSubscribeCallback pidbd:====>"
            + pidbd);
          console.debug("ACTS_Process_MultiInstance_0300====>UnSubscribeCallback pidbe:====>"
            + pidbe);
          expect(abilityhapbdExist).assertEqual(true);
          expect(abilityhapbeExist).assertEqual(true);
          expect(pidbd != pidbe).assertEqual(true);

          console.debug("ACTS_Process_MultiInstance_0300====>UnSubscribe CallBack====>");
          done();
        } catch (err) {
          console.debug("ACTS_Process_MultiInstance_0300====>UnSubscribeCallback err:====>"
            + JSON.stringify(err));
          expect(err).assertFail();
          done();
        }
      }
      await sleep(500)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.multiinstancehapb",
        abilityName: "com.example.multiinstancehapbd.MainAbility",
      }, (err, data) => {
        console.log('ACTS_Process_MultiInstance_0300 - startAbilityhapbd: '
          + JSON.stringify(err) + ", " + JSON.stringify(data))
      })
      await sleep(500)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.multiinstancehapb",
        abilityName: "com.example.multiinstancehapbe.MainAbility",
      }, (err, data) => {
        console.log('ACTS_Process_MultiInstance_0300 - startAbilityhapbe: '
          + JSON.stringify(err) + ", " + JSON.stringify(data))
      })
    })

    /**
     * @tc.number: ACTS_Process_MultiInstance_0400
     * @tc.name: Check that two HAP packages in one App, one hap's module process names is empty,
     * the other's app process name is bundlename.
     * @tc.desc: Check that two HAP packages in one App, one hap's module process names is empty,
     * the other's module process name is bundlename,run in the same process.
     */
    it('ACTS_Process_MultiInstance_0400', 0, async function (done) {
      console.log("ACTS_Process_MultiInstance_0400 --- start")
      var Subscriber;
      var abilityinfos;
      var flagBAToTest = false;
      var flagBFToTest = false;

      function SubscribeCallBack(err, data) {
        try {
          console.debug("ACTS_Process_MultiInstance_0400====>Subscribe CallBack data:====>"
            + JSON.stringify(data));
          console.debug("ACTS_Process_MultiInstance_0400====>Subscribe CallBack data.event:====>"
            + JSON.stringify(data.event));
          switch (data.event) {
            case 'HapBA_To_Test_CommonEvent':
              flagBAToTest = true;
              break;
            case 'HapBF_To_Test_CommonEvent':
              flagBFToTest = true;
              break;
          }
          console.debug("ACTS_Process_MultiInstance_0400====>SubscribeCallBack flagBAToTest:====>"
            + flagBAToTest)
          console.debug("ACTS_Process_MultiInstance_0400====>SubscribeCallBack flagBFToTest:====>"
            + flagBFToTest)
          setTimeout(function () {
            if (flagBAToTest == true && flagBFToTest == true) {
              commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            }
          }, TIMEOUT);
        } catch (err) {
          console.debug("ACTS_Process_MultiInstance_0400====>SubscribeCallBack err:====>" + err)
          expect(err).assertFail();
          done();
        }
      }
      commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_Process_MultiInstance_0400====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      async function UnSubscribeCallback() {
        try {
          console.debug("ACTS_Process_MultiInstance_0400====>UnSubscribeCallback in====>")

          abilityinfos = await abilityManager.getAbilityRunningInfos();
          console.debug("ACTS_Process_MultiInstance_0400====>abilityinfos:====>"
            + JSON.stringify(abilityinfos));
          var pidba;
          var pidbf;
          var abilityhapbaExist = false;
          var abilityhapbfExist = false;
          for (var i = 0; i < abilityinfos.length; i++) {
            if ((abilityinfos[i].processName == processNameB)) {
              console.debug("ACTS_Process_MultiInstance_0400 PD abilityinfos[" + i + "].ability.abilityName:"
                + JSON.stringify(abilityinfos[i].ability.abilityName));
              if (abilityinfos[i].ability.abilityName == 'com.example.multiinstancehapba.MainAbility') {
                abilityhapbaExist = true;
                pidba = abilityinfos[i].pid
              }
              if (abilityinfos[i].ability.abilityName == 'com.example.multiinstancehapbf.MainAbility') {
                abilityhapbfExist = true;
                pidbf = abilityinfos[i].pid
              }
            }
          }
          console.debug("ACTS_Process_MultiInstance_0400====>UnSubscribeCallback abilityhapbaExist:====>"
            + abilityhapbaExist);
          console.debug("ACTS_Process_MultiInstance_0400====>UnSubscribeCallback abilityhapbfExist:====>"
            + abilityhapbfExist);
          console.debug("ACTS_Process_MultiInstance_0400====>UnSubscribeCallback pidba:====>"
            + pidba);
          console.debug("ACTS_Process_MultiInstance_0400====>UnSubscribeCallback pidbf:====>"
            + pidbf);
          expect(abilityhapbaExist).assertEqual(true);
          expect(abilityhapbfExist).assertEqual(true);
          expect(pidba).assertEqual(pidbf);

          console.debug("ACTS_Process_MultiInstance_0400====>UnSubscribe CallBack====>");
          done();
        } catch (err) {
          console.debug("ACTS_Process_MultiInstance_0400====>UnSubscribeCallback err:====>"
            + JSON.stringify(err));
          expect(err).assertFail();
          done();
        }
      }
      await sleep(500)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.multiinstancehapb",
        abilityName: "com.example.multiinstancehapba.MainAbility",
      }, (err, data) => {
        console.log('ACTS_Process_MultiInstance_0400 - startAbilityhapba: '
          + JSON.stringify(err) + ", " + JSON.stringify(data))
      })
      await sleep(500)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.multiinstancehapb",
        abilityName: "com.example.multiinstancehapbf.MainAbility",
      }, (err, data) => {
        console.log('ACTS_Process_MultiInstance_0400 - startAbilityhapbf: '
          + JSON.stringify(err) + ", " + JSON.stringify(data))
      })
    })

    /**
     * @tc.number: ACTS_Process_MultiInstance_0500
     * @tc.name: Check that two HAP packages in two Apps, one hap's process names is empty,
     * the other's module process name is the same with the other's bundlename.
     * @tc.desc: Check that two HAP packages in two Apps, one hap's module process names is empty,
     * the other's module process name is the same with the other's bundlename,run in different processes.
     */
    it('ACTS_Process_MultiInstance_0500', 0, async function (done) {
      console.log("ACTS_Process_MultiInstance_0500 --- start")
      var Subscriber;
      var abilityinfos;
      var flagAAToTest = false;
      var flagBEToTest = false;

      function SubscribeCallBack(err, data) {
        try {
          console.debug("ACTS_Process_MultiInstance_0500====>Subscribe CallBack data:====>"
            + JSON.stringify(data));
          console.debug("ACTS_Process_MultiInstance_0500====>Subscribe CallBack data.event:====>"
            + JSON.stringify(data.event));
          switch (data.event) {
            case 'HapAA_To_Test_CommonEvent':
              flagAAToTest = true;
              break;
            case 'HapBE_To_Test_CommonEvent':
              flagBEToTest = true;
              break;
          }
          console.debug("ACTS_Process_MultiInstance_0500====>SubscribeCallBack flagAAToTest:====>"
            + flagAAToTest)
          console.debug("ACTS_Process_MultiInstance_0500====>SubscribeCallBack flagBEToTest:====>"
            + flagBEToTest)
          setTimeout(function () {
            if (flagAAToTest == true && flagBEToTest == true) {
              commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            }
          }, TIMEOUT);
        } catch (err) {
          console.debug("ACTS_Process_MultiInstance_0500====>SubscribeCallBack err:====>" + err)
          expect(err).assertFail();
          done();
        }
      }
      commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_Process_MultiInstance_0500====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      async function UnSubscribeCallback() {
        try {
          console.debug("ACTS_Process_MultiInstance_0500====>UnSubscribeCallback in====>")

          abilityinfos = await abilityManager.getAbilityRunningInfos();
          console.debug("ACTS_Process_MultiInstance_0500====>abilityinfos:====>"
            + JSON.stringify(abilityinfos));
          var pidaa;
          var pidbe;
          var abilityhapaaExist = false;
          var abilityhapbeExist = false;
          for (var i = 0; i < abilityinfos.length; i++) {
            if ((abilityinfos[i].processName == processNameA)) {
              console.debug("ACTS_Process_MultiInstance_0500 PA abilityinfos[" + i + "].ability.abilityName:"
                + JSON.stringify(abilityinfos[i].ability.abilityName));
              if (abilityinfos[i].ability.abilityName == 'com.example.multiinstancehapaa.MainAbility') {
                abilityhapaaExist = true;
                pidaa = abilityinfos[i].pid
              }
              if (abilityinfos[i].ability.abilityName == 'com.example.multiinstancehapbe.MainAbility') {
                abilityhapbeExist = true;
                pidbe = abilityinfos[i].pid
              }
            }
          }
          console.debug("ACTS_Process_MultiInstance_0500====>UnSubscribeCallback abilityhapaaExist:====>"
            + abilityhapaaExist);
          console.debug("ACTS_Process_MultiInstance_0500====>UnSubscribeCallback abilityhapbeExist:====>"
            + abilityhapbeExist);
          console.debug("ACTS_Process_MultiInstance_0500====>UnSubscribeCallback pidaa:====>"
            + pidaa);
          console.debug("ACTS_Process_MultiInstance_0500====>UnSubscribeCallback pidbe:====>"
            + pidbe);
          expect(abilityhapaaExist).assertEqual(true);
          expect(abilityhapbeExist).assertEqual(true);
          expect(pidaa != pidbe).assertEqual(true);

          console.debug("ACTS_Process_MultiInstance_0500====>UnSubscribe CallBack====>");
          done();
        } catch (err) {
          console.debug("ACTS_Process_MultiInstance_0500====>UnSubscribeCallback err:====>"
            + JSON.stringify(err));
          expect(err).assertFail();
          done();
        }
      }
      await sleep(500)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.multiinstancehapa",
        abilityName: "com.example.multiinstancehapaa.MainAbility",
      }, (err, data) => {
        console.log('ACTS_Process_MultiInstance_0500 - startAbilityhapaa: '
          + JSON.stringify(err) + ", " + JSON.stringify(data))
      })
      await sleep(500)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.multiinstancehapb",
        abilityName: "com.example.multiinstancehapbe.MainAbility",
      }, (err, data) => {
        console.log('ACTS_Process_MultiInstance_0500 - startAbilityhapbe: '
          + JSON.stringify(err) + ", " + JSON.stringify(data))
      })
    })

    /**
     * @tc.number: ACTS_Process_MultiInstance_0600
     * @tc.name: Check that two HAP packages in two Apps,one hap's process name is empty
     * and the other's process name is differet form the others' bundlename.
     * @tc.desc: Check that two HAP packages in two Apps,one hap's process name is empty
     * and the other's process name is differet form the others' bundlename,run in different processes.
     */
    it('ACTS_Process_MultiInstance_0600', 0, async function (done) {
      console.log("ACTS_Process_MultiInstance_0600 --- start")
      var Subscriber;
      var abilityinfos;
      var flagAAToTest = false;
      var flagBFToTest = false;

      function SubscribeCallBack(err, data) {
        try {
          console.debug("ACTS_Process_MultiInstance_0600====>Subscribe CallBack data:====>"
            + JSON.stringify(data));
          console.debug("ACTS_Process_MultiInstance_0600====>Subscribe CallBack data.event:====>"
            + JSON.stringify(data.event));
          switch (data.event) {
            case 'HapAA_To_Test_CommonEvent':
              flagAAToTest = true;
              break;
            case 'HapBF_To_Test_CommonEvent':
              flagBFToTest = true;
              break;
          }
          console.debug("ACTS_Process_MultiInstance_0600====>SubscribeCallBack flagAEToTest:====>"
            + flagAAToTest)
          console.debug("ACTS_Process_MultiInstance_0600====>SubscribeCallBack flagBCToTest:====>"
            + flagBFToTest)
          setTimeout(function () {
            if (flagAAToTest == true && flagBFToTest == true) {
              commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            }
          }, TIMEOUT);
        } catch (err) {
          console.debug("ACTS_Process_MultiInstance_0600====>SubscribeCallBack err:====>" + err)
          expect(err).assertFail();
          done();
        }
      }
      commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_Process_MultiInstance_0600====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      async function UnSubscribeCallback() {
        try {
          console.debug("ACTS_Process_MultiInstance_0600====>UnSubscribeCallback in====>")
          abilityinfos = await abilityManager.getAbilityRunningInfos();
          console.debug("ACTS_Process_MultiInstance_0600====>abilityinfos:====>"
            + JSON.stringify(abilityinfos));
          var pidaa;
          var pidbf;
          var abilityhapaaExist = false;
          var abilityhapbfExist = false;
          for (var i = 0; i < abilityinfos.length; i++) {
            if ((abilityinfos[i].processName == processNameA)) {
              console.debug("ACTS_Process_MultiInstance_0600 PA abilityinfos[" + i + "].ability.abilityName:"
                + JSON.stringify(abilityinfos[i].ability.abilityName));
              if (abilityinfos[i].ability.abilityName == 'com.example.multiinstancehapaa.MainAbility') {
                abilityhapaaExist = true;
                pidaa = abilityinfos[i].pid
              }
            }
            if ((abilityinfos[i].processName == processNameB)) {
              console.debug("ACTS_Process_MultiInstance_0600 PB abilityinfos[" + i + "].ability.abilityName:"
                + JSON.stringify(abilityinfos[i].ability.abilityName));
              if (abilityinfos[i].ability.abilityName == 'com.example.multiinstancehapbf.MainAbility') {
                abilityhapbfExist = true;
                pidbf = abilityinfos[i].pid
              }
            }
          }
          console.debug("ACTS_Process_MultiInstance_0600====>UnSubscribeCallback abilityhapaaExist:====>"
            + abilityhapaaExist);
          console.debug("ACTS_Process_MultiInstance_0600====>UnSubscribeCallback abilityhapbfExist:====>"
            + abilityhapbfExist);
          console.debug("ACTS_Process_MultiInstance_0600====>UnSubscribeCallback pidaa:====>"
            + pidaa);
          console.debug("ACTS_Process_MultiInstance_0600====>UnSubscribeCallback pidbf:====>"
            + pidbf);
          expect(abilityhapaaExist).assertEqual(true);
          expect(abilityhapbfExist).assertEqual(true);
          expect(pidaa != pidbf).assertEqual(true);

          console.debug("ACTS_Process_MultiInstance_0600====>UnSubscribe CallBack====>");
          done();
        } catch (err) {
          console.debug("ACTS_Process_MultiInstance_0600====>UnSubscribeCallback err:====>"
            + JSON.stringify(err));
          expect(err).assertFail();
          done();
        }
      }
      await sleep(500)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.multiinstancehapa",
        abilityName: "com.example.multiinstancehapaa.MainAbility",
      }, (err, data) => {
        console.log('ACTS_Process_MultiInstance_0600 - startAbilityhapaa: '
          + JSON.stringify(err) + ", " + JSON.stringify(data))
      })
      await sleep(500)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.multiinstancehapb",
        abilityName: "com.example.multiinstancehapbf.MainAbility",
      }, (err, data) => {
        console.log('ACTS_Process_MultiInstance_0600 - startAbilityhapbf: '
          + JSON.stringify(err) + ", " + JSON.stringify(data))
      })
    })

    /**
     * @tc.number: ACTS_Process_MultiInstance_0700
     * @tc.name: Check that two HAP packages in two Apps,two haps' process names are not empty and different
     * @tc.desc: Check that two HAP packages in two Apps,two haps' process names are not empty and different,
     * run in different processes.
     */
    it('ACTS_Process_MultiInstance_0700', 0, async function (done) {
      console.log("ACTS_Process_MultiInstance_0700 --- start")
      var Subscriber;
      var abilityinfos;
      var flagABToTest = false;
      var flagBCToTest = false;

      function SubscribeCallBack(err, data) {
        try {
          console.debug("ACTS_Process_MultiInstance_0700====>Subscribe CallBack data:====>"
            + JSON.stringify(data));
          console.debug("ACTS_Process_MultiInstance_0700====>Subscribe CallBack data.event:====>"
            + JSON.stringify(data.event));
          switch (data.event) {
            case 'HapAB_To_Test_CommonEvent':
              flagABToTest = true;
              break;
            case 'HapBC_To_Test_CommonEvent':
              flagBCToTest = true;
              break;
          }
          console.debug("ACTS_Process_MultiInstance_0700====>SubscribeCallBack flagABToTest:====>"
            + flagABToTest)
          console.debug("ACTS_Process_MultiInstance_0700====>SubscribeCallBack flagBCToTest:====>"
            + flagBCToTest)
          setTimeout(function () {
            if (flagABToTest == true && flagBCToTest == true) {
              commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            }
          }, TIMEOUT);
        } catch (err) {
          console.debug("ACTS_Process_MultiInstance_0700====>SubscribeCallBack err:====>" + err)
          expect(err).assertFail();
          done();
        }
      }
      commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_Process_MultiInstance_0700====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      async function UnSubscribeCallback() {
        try {
          console.debug("ACTS_Process_MultiInstance_0700====>UnSubscribeCallback in====>")

          abilityinfos = await abilityManager.getAbilityRunningInfos();
          console.debug("ACTS_Process_MultiInstance_0700====>abilityinfos:====>"
            + JSON.stringify(abilityinfos));
          var pidab;
          var pidbc;
          var abilityhapabExist = false;
          var abilityhapbcExist = false;
          for (var i = 0; i < abilityinfos.length; i++) {
            if ((abilityinfos[i].processName == processNameB)) {
              console.debug("ACTS_Process_MultiInstance_0700 PB abilityinfos[" + i + "].ability.abilityName:"
                + JSON.stringify(abilityinfos[i].ability.abilityName));
              if (abilityinfos[i].ability.abilityName == 'com.example.multiinstancehapab.MainAbility') {
                abilityhapabExist = true;
                pidab = abilityinfos[i].pid
              }
            }
            if ((abilityinfos[i].processName == processNameC)) {
              console.debug("ACTS_Process_MultiInstance_0700 PC abilityinfos[" + i + "].ability.abilityName:"
                + JSON.stringify(abilityinfos[i].ability.abilityName));
              if (abilityinfos[i].ability.abilityName == 'com.example.multiinstancehapbc.MainAbility') {
                abilityhapbcExist = true;
                pidbc = abilityinfos[i].pid
              }
            }
          }
          console.debug("ACTS_Process_MultiInstance_0700====>UnSubscribeCallback abilityhapabExist:====>"
            + abilityhapabExist);
          console.debug("ACTS_Process_MultiInstance_0700====>UnSubscribeCallback abilityhapbcExist:====>"
            + abilityhapbcExist);
          console.debug("ACTS_Process_MultiInstance_0700====>UnSubscribeCallback pidac:====>"
            + pidab);
          console.debug("ACTS_Process_MultiInstance_0700====>UnSubscribeCallback pidbf:====>"
            + pidbc);
          expect(abilityhapabExist).assertEqual(true);
          expect(abilityhapbcExist).assertEqual(true);
          expect(pidab != pidbc).assertEqual(true);
          console.debug("ACTS_Process_MultiInstance_0700====>UnSubscribe CallBack====>");
          done();
        } catch (err) {
          console.debug("ACTS_Process_MultiInstance_0700====>UnSubscribeCallback err:====>"
            + JSON.stringify(err));
          expect(err).assertFail();
          done();
        }
      }
      await sleep(500)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.multiinstancehapa",
        abilityName: "com.example.multiinstancehapab.MainAbility",
      }, (err, data) => {
        console.log('ACTS_Process_MultiInstance_0700 - startAbilityhapab: '
          + JSON.stringify(err) + ", " + JSON.stringify(data))
      })
      await sleep(500)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.multiinstancehapb",
        abilityName: "com.example.multiinstancehapbc.MainAbility",
      }, (err, data) => {
        console.log('ACTS_Process_MultiInstance_0700 - startAbilityhapbc: '
          + JSON.stringify(err) + ", " + JSON.stringify(data))
      })
    })
  })
}