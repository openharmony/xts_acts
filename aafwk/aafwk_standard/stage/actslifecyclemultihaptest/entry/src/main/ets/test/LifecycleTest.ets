// @ts-nocheck
/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

export default function abilityTest(abilityContext){

  describe('AbilityTest', function() {

    console.info("-----------------LifecycleTest is start----------------")

    var TAG;
    var listKeyTemp = [];
    var listKeyTemp1 = [];


    function sleep(time) {
      return new Promise((resolve) => setTimeout(resolve, time))
    }

    /*
     * @tc.number  Multihap_LifecycleTest_001
     * @tc.name    The ability of HAP A listens to the ability lifecycle callback of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Multihap_LifecycleTest_001", 0, async function (done) {
      console.info("---------------Multihap_LifecycleTest_001 is start---------------")
      TAG = "Multihap_LifecycleTest_001";
      listKeyTemp = [];

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4"
      }, (error, data) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(500);

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility3"
      }, (error, data) => {
        setTimeout(() => {
          console.log(TAG + ": Hap2MainAbility3 startAbility success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          for (var i = 0;i < globalThis.mainAbility4ListKey.length; i++) {
            if (globalThis.mainAbility4ListKey[i].substring(0, 16) == "Hap2MainAbility3") {
              listKeyTemp.push(globalThis.mainAbility4ListKey[i]);
            }
          }
          console.log(TAG +  "listKeyTemp is :" + listKeyTemp);
          console.log(TAG + "globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
          expect(listKeyTemp[0]).assertEqual("Hap2MainAbility3 onAbilityCreate");
          expect(listKeyTemp[1]).assertEqual("Hap2MainAbility3 onAbilityWindowStageCreate");
          expect(listKeyTemp[2]).assertEqual("Hap2MainAbility3 onAbilityForeground");
          expect(listKeyTemp[3]).assertEqual("Hap2MainAbility3 onAbilityBackground");
          expect(listKeyTemp[4]).assertEqual("Hap2MainAbility3 onAbilityWindowStageDestroy");
          expect(listKeyTemp[5]).assertEqual("Hap2MainAbility3 onAbilityDestroy");
          abilityContext.getApplicationContext()
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code == 0).assertTrue()
              done();
            });
        }, 4000)
      });
      console.info("---------------Multihap_LifecycleTest_001 is end---------------")
    });

    /*
     * @tc.number  Multihap_LifecycleTest_002
     * @tc.name    The ability of HAP A listens to the ability lifecycle callback of HAP B (single instance)
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Multihap_LifecycleTest_002", 0, async function (done) {
      console.log("------------Multihap_LifecycleTest_002 start-------------");
      TAG = "Multihap_LifecycleTest_002";
      listKeyTemp = [];

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4"
      }, (error, data) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(500);

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility4"
      }, (error, data) => {
        console.log(TAG + ":first Hap2MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(500);

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility4"
      }, (error, data) => {
        setTimeout(() => {
          console.log(TAG + ": second Hap2MainAbility4 startAbility success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          for(var i = 0; i<globalThis.mainAbility4ListKey.length;i++){
            if(globalThis.mainAbility4ListKey[i].substring(0,16)=="Hap2MainAbility4"){
              listKeyTemp.push(globalThis.mainAbility4ListKey[i]);
            }
          }
          console.log(TAG + "listKeyTemp is :" + listKeyTemp);
          console.log(TAG + "globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
          expect(listKeyTemp[0]).assertEqual("Hap2MainAbility4 onAbilityCreate");
          expect(listKeyTemp[1]).assertEqual("Hap2MainAbility4 onAbilityWindowStageCreate");
          expect(listKeyTemp[2]).assertEqual("Hap2MainAbility4 onAbilityForeground");
          expect(listKeyTemp[3]).assertEqual("Hap2MainAbility4 onAbilityBackground");
          expect(listKeyTemp[4]).assertEqual("Hap2MainAbility4 onAbilityWindowStageDestroy");
          expect(listKeyTemp[5]).assertEqual("Hap2MainAbility4 onAbilityDestroy");
          abilityContext.getApplicationContext()
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code == 0).assertTrue()
              done();
            });
        }, 3000)
      });
      console.log("------------Multihap_LifecycleTest_002 end-------------");
    });

    /*
     * @tc.number  Multihap_LifecycleTest_003
     * @tc.name    The ability of HAP A listens to the ability lifecycle callback of HAP B (multiple cases)
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Multihap_LifecycleTest_003", 0, async function (done) {
      console.log("------------Multihap_LifecycleTest_003 start-------------");
      TAG = "Multihap_LifecycleTest_003";
      listKeyTemp = [];

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4"
      }, (error, data) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(500);

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility5"
      }, (error, data) => {
        console.log(TAG + ":first Hap2MainAbility5 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(500);

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility5"
      }, (error, data) => {
        setTimeout(() => {
          console.log(TAG + ": second Hap2MainAbility5 startAbility success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          for(var i = 0;i<globalThis.mainAbility4ListKey.length;i++){
            if(globalThis.mainAbility4ListKey[i].substring(0,16)=="Hap2MainAbility5"){
              listKeyTemp.push(globalThis.mainAbility4ListKey[i]);
            }
          }
          console.log(TAG + "listKeyTemp is :" + listKeyTemp);
          console.log(TAG + "globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
          expect(listKeyTemp[0]).assertEqual("Hap2MainAbility5 onAbilityCreate");
          expect(listKeyTemp[1]).assertEqual("Hap2MainAbility5 onAbilityWindowStageCreate");
          expect(listKeyTemp[2]).assertEqual("Hap2MainAbility5 onAbilityForeground");
          expect(listKeyTemp[3]).assertEqual("Hap2MainAbility5 onAbilityCreate");
          expect(listKeyTemp[4]).assertEqual("Hap2MainAbility5 onAbilityWindowStageCreate");
          expect(listKeyTemp[5]).assertEqual("Hap2MainAbility5 onAbilityForeground");
          expect(listKeyTemp[6]).assertEqual("Hap2MainAbility5 onAbilityBackground");
          expect(listKeyTemp[7]).assertEqual("Hap2MainAbility5 onAbilityWindowStageDestroy");
          expect(listKeyTemp[8]).assertEqual("Hap2MainAbility5 onAbilityDestroy");
          expect(listKeyTemp[9]).assertEqual("Hap2MainAbility5 onAbilityBackground");
          expect(listKeyTemp[10]).assertEqual("Hap2MainAbility5 onAbilityWindowStageDestroy");
          expect(listKeyTemp[11]).assertEqual("Hap2MainAbility5 onAbilityDestroy");
          abilityContext.getApplicationContext()
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code == 0).assertTrue()
              done();
            });
        }, 3000)
      });
      console.log("------------Multihap_LifecycleTest_003 end-------------");
    });

    /*
     * @tc.number  Multihap_LifecycleTest_004
     * @tc.name    The ability of HAP A monitors the ability life cycle callback of HAP B and HAP C
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Multihap_LifecycleTest_004", 0, async function (done) {
      console.log("------------Multihap_LifecycleTest_004 start-------------");
      TAG = "Multihap_LifecycleTest_004";
      listKeyTemp = [];
      listKeyTemp1 = [];

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4"
      }, (error, data) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(500);

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility6"
      }, (error, data) => {
        console.log(TAG + ":first Hap2MainAbility6 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(500);

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap3MainAbility2"
      }, (error, data) => {
        setTimeout(() => {
          console.log(TAG + ": second Hap3MainAbility2 startAbility success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          for(var i = 0;i<globalThis.mainAbility4ListKey.length;i++){
            if(globalThis.mainAbility4ListKey[i].substring(0,16)=="Hap2MainAbility6"){
              listKeyTemp.push(globalThis.mainAbility4ListKey[i]);
            }else if(globalThis.mainAbility4ListKey[i].substring(0,16)=="Hap3MainAbility2"){
              listKeyTemp1.push(globalThis.mainAbility4ListKey[i]);
            }
          }
          console.log(TAG + "listKeyTemp is :" + listKeyTemp);
          console.log(TAG + "listKeyTemp1 is :" + listKeyTemp1);
          console.log(TAG + "globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
          expect(listKeyTemp[0]).assertEqual("Hap2MainAbility6 onAbilityCreate");
          expect(listKeyTemp[1]).assertEqual("Hap2MainAbility6 onAbilityWindowStageCreate");
          expect(listKeyTemp[2]).assertEqual("Hap2MainAbility6 onAbilityForeground");
          expect(listKeyTemp[3]).assertEqual("Hap2MainAbility6 onAbilityBackground");
          expect(listKeyTemp[4]).assertEqual("Hap2MainAbility6 onAbilityWindowStageDestroy");
          expect(listKeyTemp[5]).assertEqual("Hap2MainAbility6 onAbilityDestroy");

          expect(listKeyTemp1[0]).assertEqual("Hap3MainAbility2 onAbilityCreate");
          expect(listKeyTemp1[1]).assertEqual("Hap3MainAbility2 onAbilityWindowStageCreate");
          expect(listKeyTemp1[2]).assertEqual("Hap3MainAbility2 onAbilityForeground");
          expect(listKeyTemp1[3]).assertEqual("Hap3MainAbility2 onAbilityBackground");
          expect(listKeyTemp1[4]).assertEqual("Hap3MainAbility2 onAbilityWindowStageDestroy");
          expect(listKeyTemp1[5]).assertEqual("Hap3MainAbility2 onAbilityDestroy");

          abilityContext.getApplicationContext()
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code == 0).assertTrue()
              done();
            });
        }, 3000)
      });
      console.log("------------Multihap_LifecycleTest_004 end-------------");
    });

    /*
     * @tc.number  Multihap_LifecycleTest_005
     * @tc.name    The ability of HAP A listens to two ability life cycle callbacks in HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Multihap_LifecycleTest_005", 0, async function (done) {
      console.log("------------Multihap_LifecycleTest_005 start-------------");
      TAG = "Multihap_LifecycleTest_005";
      listKeyTemp = [];
      listKeyTemp1 = [];

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4"
      }, (error, data) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(500);

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility6"
      }, (error, data) => {
        console.log(TAG + ":first Hap2MainAbility6 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(500);

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility7"
      }, (error, data) => {
        setTimeout(() => {
          console.log(TAG + ": second Hap2MainAbility7 startAbility success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          for(var i = 0;i<globalThis.mainAbility4ListKey.length;i++){
            if(globalThis.mainAbility4ListKey[i].substring(0,16)=="Hap2MainAbility6"){
              listKeyTemp.push(globalThis.mainAbility4ListKey[i]);
            }else if(globalThis.mainAbility4ListKey[i].substring(0,16)=="Hap2MainAbility7"){
              listKeyTemp1.push(globalThis.mainAbility4ListKey[i]);
            }
          }
          console.log(TAG + "listKeyTemp is :" + listKeyTemp);
          console.log(TAG + "listKeyTemp1 is :" + listKeyTemp1);
          console.log(TAG + "globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
          expect(listKeyTemp[0]).assertEqual("Hap2MainAbility6 onAbilityCreate");
          expect(listKeyTemp[1]).assertEqual("Hap2MainAbility6 onAbilityWindowStageCreate");
          expect(listKeyTemp[2]).assertEqual("Hap2MainAbility6 onAbilityForeground");
          expect(listKeyTemp[3]).assertEqual("Hap2MainAbility6 onAbilityBackground");
          expect(listKeyTemp[4]).assertEqual("Hap2MainAbility6 onAbilityWindowStageDestroy");
          expect(listKeyTemp[5]).assertEqual("Hap2MainAbility6 onAbilityDestroy");

          expect(listKeyTemp1[0]).assertEqual("Hap2MainAbility7 onAbilityCreate");
          expect(listKeyTemp1[1]).assertEqual("Hap2MainAbility7 onAbilityWindowStageCreate");
          expect(listKeyTemp1[2]).assertEqual("Hap2MainAbility7 onAbilityForeground");
          expect(listKeyTemp1[3]).assertEqual("Hap2MainAbility7 onAbilityBackground");
          expect(listKeyTemp1[4]).assertEqual("Hap2MainAbility7 onAbilityWindowStageDestroy");
          expect(listKeyTemp1[5]).assertEqual("Hap2MainAbility7 onAbilityDestroy");

          abilityContext.getApplicationContext()
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code == 0).assertTrue()
              done();
            });
        }, 3000)
      });
      console.log("------------end Multihap_LifecycleTest_005-------------");
    });

    /*
     * @tc.number  Multihap_LifecycleTest_006
     * @tc.name    Repeat the registration. The ability of HAP A listens to the life
                    cycle callback of the ability of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Multihap_LifecycleTest_006", 0, async function (done) {
      console.log("------------Multihap_LifecycleTest_006 start-------------");
      TAG = "Multihap_LifecycleTest_006";
      listKeyTemp = [];
      listKeyTemp1 = [];
      var firstCallbackId;
      var secondCallbackId;

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4"
      }, (error, data) => {
        console.log(TAG + ": first MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(500);

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility8"
      }, (error, data) => {
        setTimeout(function(){
          console.log(TAG + ": first Hap2MainAbility8 startAbility success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          console.log(TAG + "first globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
          firstCallbackId = globalThis.mainAbility4CallBackId;
          console.log(TAG + "firstCallbackId is : " + firstCallbackId);
        }, 3000)
      });

      await sleep(1000);

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4"
      }, (error, data) => {
        console.log(TAG + ": second MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(500);

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility8"
      }, (error, data) => {
        setTimeout(() => {
          console.log(TAG + ": second Hap2MainAbility8 startAbility success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          for(var i = 0;i<globalThis.mainAbility4ListKey.length;i++){
            if(globalThis.mainAbility4ListKey[i].substring(0,16)=="Hap2MainAbility8"){
              listKeyTemp1.push(globalThis.mainAbility4ListKey[i]);
            }
          }
          console.log(TAG + "second globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
          secondCallbackId = globalThis.mainAbility4CallBackId;
          console.log(TAG + "secondCallbackId is : " + secondCallbackId);
          expect(secondCallbackId).assertEqual(firstCallbackId+1)

          abilityContext.getApplicationContext()
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code == 0).assertTrue()
              done();
            });
        }, 3000)
      });

      console.log("------------Multihap_LifecycleTest_006 end-------------");
    });

    /*
     * @tc.number  Multihap_LifecycleTest_007
     * @tc.name    Repeat registration and deregistration. The ability of HAP A listens to the life
                    cycle callback of the ability of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Multihap_LifecycleTest_007", 0, async function (done) {
      console.log("------------Multihap_LifecycleTest_007 start-------------");
      TAG = "Multihap_LifecycleTest_007";
      listKeyTemp = [];
      listKeyTemp1 = [];
      var callBackId1;
      var callBackId2;
      var flag;

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility6"
      }, (error, data) => {
        console.log(TAG + ": first MainAbility6 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      setTimeout(function(){
        abilityContext.startAbility({
          bundleName: "com.example.lifecycletest",
          abilityName: "Hap2MainAbility9"
        }, (error, data) => {
          setTimeout(() => {
            console.log(TAG + ":first Hap2MainAbility9 startAbility success, err: " +
            JSON.stringify(error) + ",data: " + JSON.stringify(data));

            for(var i = 0;i<globalThis.mainAbility6ListKey.length;i++){
              if(globalThis.mainAbility6ListKey[i].substring(0,16)=="Hap2MainAbility9"){
                listKeyTemp.push(globalThis.mainAbility6ListKey[i]);
              }
            }
            console.log(TAG + "listKeyTemp is :" + listKeyTemp);
            console.log(TAG + "first globalThis.mainAbility6CallBackId is :" + globalThis.mainAbility6CallBackId);
            callBackId1 = globalThis.mainAbility6CallBackId
            console.log(TAG + "callBackId1 is :" + callBackId1);
            expect(listKeyTemp[0]).assertEqual("Hap2MainAbility9 onAbilityCreate");
            expect(listKeyTemp[1]).assertEqual("Hap2MainAbility9 onAbilityWindowStageCreate");
            expect(listKeyTemp[2]).assertEqual("Hap2MainAbility9 onAbilityForeground");
            expect(listKeyTemp[3]).assertEqual("Hap2MainAbility9 onAbilityBackground");
            expect(listKeyTemp[4]).assertEqual("Hap2MainAbility9 onAbilityWindowStageDestroy");
            expect(listKeyTemp[5]).assertEqual("Hap2MainAbility9 onAbilityDestroy");

            abilityContext.getApplicationContext()
              .unregisterAbilityLifecycleCallback(globalThis.mainAbility6CallBackId, (error, data) => {
                console.log(TAG + ": first unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                ",data: " + JSON.stringify(data));
                expect(error.code == 0).assertTrue()
                flag = error.code;
                console.log(TAG + "flag is:" + flag);
              });
          }, 3000)
        });
      }, 1000)


      setTimeout(function(){
        if(flag == 0){

          abilityContext.startAbility({
            bundleName: "com.example.lifecycletest",
            abilityName: "MainAbility6"
          }, (error, data) => {
            console.log(TAG + ": first MainAbility6 startAbility success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
          });

          setTimeout(function(){
            abilityContext.startAbility({
              bundleName: "com.example.lifecycletest",
              abilityName: "Hap2MainAbility9"
            }, (error, data) => {

              setTimeout(() => {
                console.log(TAG + ":second Hap2MainAbility9 startAbility success, err: " +
                JSON.stringify(error) + ",data: " + JSON.stringify(data));

                for(var i = 0;i<globalThis.mainAbility6ListKey.length;i++){
                  if(globalThis.mainAbility6ListKey[i].substring(0,16)=="Hap2MainAbility9"){
                    listKeyTemp1.push(globalThis.mainAbility6ListKey[i]);
                  }
                }
                console.log(TAG + "listKeyTemp1 is :" + listKeyTemp1);
                console.log(TAG + "second globalThis.mainAbility6CallBackId is :" + globalThis.mainAbility6CallBackId);
                callBackId2 = globalThis.mainAbility6CallBackId
                console.log(TAG + "callBackId2 is :" + callBackId2);
                expect(callBackId2).assertEqual(callBackId1 + 1)
                expect(listKeyTemp1[0]).assertEqual("Hap2MainAbility9 onAbilityCreate");
                expect(listKeyTemp1[1]).assertEqual("Hap2MainAbility9 onAbilityWindowStageCreate");
                expect(listKeyTemp1[2]).assertEqual("Hap2MainAbility9 onAbilityForeground");
                expect(listKeyTemp1[3]).assertEqual("Hap2MainAbility9 onAbilityBackground");
                expect(listKeyTemp1[4]).assertEqual("Hap2MainAbility9 onAbilityWindowStageDestroy");
                expect(listKeyTemp1[5]).assertEqual("Hap2MainAbility9 onAbilityDestroy");

                abilityContext.getApplicationContext()
                  .unregisterAbilityLifecycleCallback(globalThis.mainAbility6CallBackId, (error, data) => {
                    console.log(TAG + ": second unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                    ",data: " + JSON.stringify(data));
                    expect(error.code == 0).assertTrue()
                    done();
                  });
                }, 3000)
              })
            }, 2000)
        }
      }, 10000)

      console.log("------------Multihap_LifecycleTest_007 end-------------");
    });

    /*
     * @tc.number  Multihap_LifecycleTest_008
     * @tc.name    Repeat deregistration. The ability of HAP A listens to the life
                    cycle callback of the ability of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Multihap_LifecycleTest_008", 0, async function (done) {
      console.log("------------Multihap_LifecycleTest_008 start-------------");
      TAG = "Multihap_LifecycleTest_008";
      listKeyTemp = [];

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4"
      }, (error, data) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(500);

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility6"
      }, (error, data) => {
        setTimeout(() => {
          console.log(TAG + ": Hap2MainAbility6 startAbility success, err: " +
          JSON.stringify(error) + ",data: " + JSON.stringify(data));

          for(var i = 0;i<globalThis.mainAbility4ListKey.length;i++){
            if(globalThis.mainAbility4ListKey[i].substring(0,16)=="Hap2MainAbility6"){
              listKeyTemp.push(globalThis.mainAbility4ListKey[i]);
            }
          }
          console.log(TAG + "listKeyTemp is :" + listKeyTemp);
          console.log(TAG + "globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
          expect(listKeyTemp[0]).assertEqual("Hap2MainAbility6 onAbilityCreate");
          expect(listKeyTemp[1]).assertEqual("Hap2MainAbility6 onAbilityWindowStageCreate");
          expect(listKeyTemp[2]).assertEqual("Hap2MainAbility6 onAbilityForeground");
          expect(listKeyTemp[3]).assertEqual("Hap2MainAbility6 onAbilityBackground");
          expect(listKeyTemp[4]).assertEqual("Hap2MainAbility6 onAbilityWindowStageDestroy");
          expect(listKeyTemp[5]).assertEqual("Hap2MainAbility6 onAbilityDestroy");

          abilityContext.getApplicationContext()
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error, data) => {
              console.log(TAG + ": first unregisterAbilityLifecycleCallback, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code == 0).assertTrue;
              abilityContext.getApplicationContext()
                .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error, data) => {
                  console.log(TAG + ": second unregisterAbilityLifecycleCallback, err: " + JSON.stringify(error) +
                  ",data: " + JSON.stringify(data));
                  expect(error.code == 0).assertTrue;
                  done()
                });
            });
        }, 4000)
      });
      console.log("------------Multihap_LifecycleTest_008 end-------------");
    });

    /*
     * @tc.number  Multihap_LifecycleTest_010
     * @tc.name    Switch the front and background for many times to monitor the life cycle
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('Multihap_LifecycleTest_010', 0, async function (done) {
      console.info("---------------Multihap_LifecycleTest_010 is start---------------")
      TAG = "Multihap_LifecycleTest_010";
      listKeyTemp = [];
      listKeyTemp1 = [];

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4",
      }, (error, data) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " +
        JSON.stringify(error) + ",data: " + JSON.stringify(data));
      })

      await sleep(1000)
      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility10",
      }, (error, data) => {
        console.log(TAG + ": first Hap2MainAbility10 startAbility success, err: " +
        JSON.stringify(error) + ",data: " + JSON.stringify(data));
      })

      await sleep(1000)
      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap3MainAbility3",
      }, (error, data) => {
        console.log(TAG + ": first Hap3MainAbility3 startAbility success, err: " +
        JSON.stringify(error) + ",data: " + JSON.stringify(data));
      })

      await sleep(1000)
      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility10",
      }, (error, data) => {
        console.log(TAG + ": second Hap2MainAbility10 startAbility success, err: " +
        JSON.stringify(error) + ",data: " + JSON.stringify(data));
      })

      await sleep(1000)
      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap3MainAbility3",
      }, (error, data) => {
        console.log(TAG + ": second Hap3MainAbility3 startAbility success, err: " +
        JSON.stringify(error) + ",data: " + JSON.stringify(data));
      })


      await sleep(1000)
      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility10",
      }, (error, data) => {
        console.log(TAG + ": third Hap2MainAbility10 startAbility success, err: " +
        JSON.stringify(error) + ",data: " + JSON.stringify(data));
      })

      await sleep(1000)
      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap3MainAbility3",
      }, (error, data) => {

        setTimeout(() => {
          console.log(TAG + ": third Hap3MainAbility3 startAbility success, err: " +
          JSON.stringify(error) + ",data: " + JSON.stringify(data));

          for (var i = 0;i < globalThis.mainAbility4ListKey.length; i++) {
            if (globalThis.mainAbility4ListKey[i].substring(0, 17) == "Hap2MainAbility10") {
              listKeyTemp.push(globalThis.mainAbility4ListKey[i]);
            }else if (globalThis.mainAbility4ListKey[i].substring(0, 16) == "Hap3MainAbility3") {
              listKeyTemp1.push(globalThis.mainAbility4ListKey[i]);
            }
          }
          console.log(TAG + " listKeyTemp is :" + listKeyTemp);
          console.log(TAG + " listKeyTemp1 is :" + listKeyTemp1);
          console.log(TAG + " globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);

          expect(listKeyTemp[0]).assertEqual("Hap2MainAbility10 onAbilityCreate");
          expect(listKeyTemp[1]).assertEqual("Hap2MainAbility10 onAbilityWindowStageCreate");
          expect(listKeyTemp[2]).assertEqual("Hap2MainAbility10 onAbilityForeground");
          expect(listKeyTemp[3]).assertEqual("Hap2MainAbility10 onAbilityBackground");
          expect(listKeyTemp[4]).assertEqual("Hap2MainAbility10 onAbilityForeground");
          expect(listKeyTemp[5]).assertEqual("Hap2MainAbility10 onAbilityBackground");
          expect(listKeyTemp[6]).assertEqual("Hap2MainAbility10 onAbilityForeground");
          expect(listKeyTemp[7]).assertEqual("Hap2MainAbility10 onAbilityBackground");

          expect(listKeyTemp1[0]).assertEqual("Hap3MainAbility3 onAbilityCreate");
          expect(listKeyTemp1[1]).assertEqual("Hap3MainAbility3 onAbilityWindowStageCreate");
          expect(listKeyTemp1[2]).assertEqual("Hap3MainAbility3 onAbilityForeground");
          expect(listKeyTemp1[3]).assertEqual("Hap3MainAbility3 onAbilityBackground");
          expect(listKeyTemp1[4]).assertEqual("Hap3MainAbility3 onAbilityForeground");
          expect(listKeyTemp1[5]).assertEqual("Hap3MainAbility3 onAbilityBackground");
          expect(listKeyTemp1[6]).assertEqual("Hap3MainAbility3 onAbilityForeground");

          abilityContext.getApplicationContext()
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code == 0).assertTrue()
              done();
            });
        }, 4000)
      })
      console.info("---------------Multihap_LifecycleTest_010 is end---------------")
    })

    /*
     * @tc.number  Multihap_LifecycleTest_011
     * @tc.name    The ability of HAP A listens to the life cycle callback
                    of the ability of HAP B in different processes
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('Multihap_LifecycleTest_011', 0, async function (done) {
      console.info("---------------Multihap_LifecycleTest_011 is start---------------")
      TAG = "Multihap_LifecycleTest_011";
      listKeyTemp = [];

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility2",
      }, (error, data) => {
        console.log(TAG + ": Hap1MainAbility2 startAbility success, err: " +
        JSON.stringify(error) + ",data: " + JSON.stringify(data));
      })

      await sleep(500);

      abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap4MainAbility1",
      }, (error, data) => {
      setTimeout(() => {
        console.log(TAG + ": Hap4MainAbility1 startAbility success, err: " +
        JSON.stringify(error) + ",data: " + JSON.stringify(data));

        for (var i = 0; i < globalThis.mainAbility2ListKey.length; i++) {
          if (globalThis.mainAbility2ListKey[i].substring(0, 16) == "Hap4MainAbility1") {
            listKeyTemp.push(globalThis.mainAbility2ListKey[i]);
          }
        }
        console.log(TAG + " listKeyTemp is :" + listKeyTemp);
        console.log(TAG + " globalThis.mainAbility2CallBackId is :" + globalThis.mainAbility2CallBackId);
        expect(listKeyTemp.length == 0).assertTrue();

        abilityContext.getApplicationContext()
          .unregisterAbilityLifecycleCallback(globalThis.mainAbility2CallBackId, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
            expect(error.code == 0).assertTrue()
            done();
          });
        }, 4000)
      });
      console.info("---------------Multihap_LifecycleTest_011 is end---------------")
    })
  })
}