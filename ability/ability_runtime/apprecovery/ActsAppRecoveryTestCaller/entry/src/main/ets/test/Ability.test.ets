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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import commonEvent from '@ohos.commonEvent'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import missionManager from '@ohos.application.missionManager';
import wantConstant from '@ohos.app.ability.wantConstant'

const CASE_TIME_OUT=5000;
var ACTS_AppRecovery = {
  events: ["ACTS_AppRecovery_First", "ACTS_AppRecovery_Second"]
};

export default function abilityTest() {
  describe('ActsAbilityTest', function () {

    /*
     * @tc.number: Acts_AppRecovery_0100
     * @tc.name: Fault recovery of multi-Ability application
     * @tc.desc: When the application settings restart recovery status is valid, the pre-failure state of Ability
     *           application will not be restored after normal exit and restart.
     */
    it('Acts_AppRecovery_0100',0, async function (done) {
      let subscriber;
      let flag = false;
      console.info("Acts_AppRecovery_0100====> start")
      commonEvent.createSubscriber(ACTS_AppRecovery).then(async (data) => {
        console.debug("Acts_AppRecovery_0100====> Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.example.apprecoveryrely",
            abilityName: "EntryAbility",
            action: "Acts_AppRecovery_0100_once"
          },(err)=>{
          console.debug("Acts_AppRecovery_0100====> startAbility err:"+JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.debug("Acts_AppRecovery_0100====> subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_First") {
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertEqual(undefined);
          setTimeout(() => {
            commonEvent.subscribe(subscriber, subscribeCallBackSecond);
            globalThis.abilityContext.startAbility(
              {
                bundleName: "com.example.apprecoveryrely",
                abilityName: "EntryAbility",
                action: "Acts_AppRecovery_0100_twice"
              },
              (err) => {
                console.debug("Acts_AppRecovery_0100====> second startAbility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(0);
              }
            );
          }, 800);
        }
      }

      function subscribeCallBackSecond(err, data) {
        console.debug("Acts_AppRecovery_0100====> second subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_Second") {
          flag=true;
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertEqual(undefined);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        setTimeout(() => {
          console.debug("Acts_AppRecovery_0100====> unSubscribeCallback");
          done();
        }, 800);
      }

      setTimeout(()=>{
        if(flag==false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_AppRecovery_0200
     * @tc.name: Fault recovery of multi-Ability application
     * @tc.desc: When the application settings restart recovery status is valid, the pre-failure state of Ability
     *           application will not be restored after normal exit and restart.
     */
    it('Acts_AppRecovery_0200',0, async function (done) {
      let subscriber;
      let flag = false;
      let countFirst = 0;
      let countSecond = 0;
      console.info("Acts_AppRecovery_0200====> start")
      commonEvent.createSubscriber(ACTS_AppRecovery).then(async (data) => {
        console.debug("Acts_AppRecovery_0200====> Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.example.apprecoverysrely",
            abilityName: "EntryAbility",
            action: "Acts_AppRecovery_0200_once"
          },(err)=>{
          console.debug("Acts_AppRecovery_0200====> startAbility err:"+JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.debug("Acts_AppRecovery_0200====> subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_First") {
          countFirst++;
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertEqual(undefined);
          if (countFirst < 2) {
            return;
          }
          setTimeout(() => {
            commonEvent.subscribe(subscriber, subscribeCallBackSecond);
            globalThis.abilityContext.startAbility(
              {
                bundleName: "com.example.apprecoverysrely",
                abilityName: "EntryAbility",
                action: "Acts_AppRecovery_0200_twice"
              },
              (err) => {
                console.debug("Acts_AppRecovery_0200====> second startAbility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(0);
              }
            );
          }, 800);
        }
      }

      function subscribeCallBackSecond(err, data) {
        console.debug("Acts_AppRecovery_0200====> second subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_Second") {
          countSecond++;
          flag=true;
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertEqual(undefined);
          if (countSecond == 2) {
            commonEvent.unsubscribe(subscriber, unSubscribeCallback);
          }
        }
      }

      function unSubscribeCallback() {
        setTimeout(() => {
          console.debug("Acts_AppRecovery_0200====> unSubscribeCallback");
          done();
        }, 800);
      }

      setTimeout(()=>{
        if(flag==false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_AppRecovery_0300
     * @tc.name: Fault recovery of multi-Ability application
     * @tc.desc: When the application setting restart recovery status is valid, exit the application by clearing the
     *           task list and do not restore the pre-failure state of the Ability application after the application
     *           restart.
     */
    it('Acts_AppRecovery_0300',0, async function (done) {
      let subscriber;
      let flag = false;
      console.info("Acts_AppRecovery_0300====> start")
      commonEvent.createSubscriber(ACTS_AppRecovery).then(async (data) => {
        console.debug("Acts_AppRecovery_0300====> Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.example.apprecoveryrely",
            abilityName: "EntryAbility",
            action: "Acts_AppRecovery_0300_once"
          },(err)=>{
          console.debug("Acts_AppRecovery_0300====> startAbility err:"+JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })
      function subscribeCallBack(err, data) {
        console.debug("Acts_AppRecovery_0300====> subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_First") {
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertEqual(undefined);
          missionManager.getMissionInfos('', 1024, (err, missionInfos)=>{
            console.debug('Acts_AppRecovery_0300====> missionInfos: ' + JSON.stringify(missionInfos));
            console.debug('Acts_AppRecovery_0300====> missionInfos.length: ' + JSON.stringify(missionInfos.length));
            for (var i = 0; i < missionInfos.length; i++) {
              if ((missionInfos[i].want.bundleName == "com.example.apprecoveryrely")
              && (missionInfos[i].want.abilityName == "EntryAbility")) {
                missionManager.clearMission(missionInfos[i].missionId, (err)=>{
                  console.debug('Acts_AppRecovery_0300====> clearMission err: ' + JSON.stringify(err));
                })
              }
            }
            setTimeout(()=>{
              commonEvent.subscribe(subscriber, subscribeCallBackSecond);
              globalThis.abilityContext.startAbility(
                {
                  bundleName: "com.example.apprecoveryrely",
                  abilityName: "EntryAbility",
                  action: "Acts_AppRecovery_0300_twice"
                }, (err) => {
                console.debug("Acts_AppRecovery_0300====> second startAbility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(0);
              })
            }, 800)
          });
        }
      }
      function subscribeCallBackSecond(err, data) {
        console.debug("Acts_AppRecovery_0300====> second subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_Second") {
          flag=true;
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertEqual(undefined);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }
      function unSubscribeCallback() {
        setTimeout(() => {
          console.debug("Acts_AppRecovery_0300====> unSubscribeCallback");
          done();
        }, 800);
      }
      setTimeout(()=>{
        if(flag==false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_AppRecovery_0400
     * @tc.name: Fault recovery of multi-Ability application
     * @tc.desc: When the application setting restart recovery status is valid, exit the application by clearing the
     *           task list and do not restore the pre-failure state of the Ability application after the application
     *           restart.
     */
    it('Acts_AppRecovery_0400',0, async function (done) {
      let subscriber;
      let flag = false;
      let countFirst = 0;
      let countSecond = 0;
      console.info("Acts_AppRecovery_0400====> start")
      commonEvent.createSubscriber(ACTS_AppRecovery).then(async (data) => {
        console.debug("Acts_AppRecovery_0400====> Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.example.apprecoverysrely",
            abilityName: "EntryAbility",
            action: "Acts_AppRecovery_0400_once"
          },(err)=>{
          console.debug("Acts_AppRecovery_0400====> startAbility err:"+JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })
      function subscribeCallBack(err, data) {
        console.debug("Acts_AppRecovery_0400====> subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_First") {
          countFirst++;
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertEqual(undefined);
          if (countFirst < 2) {
            return;
          }
          missionManager.getMissionInfos('', 1024, (err, missionInfos)=>{
            console.debug('Acts_AppRecovery_0400====> missionInfos: ' + JSON.stringify(missionInfos));
            console.debug('Acts_AppRecovery_0400====> missionInfos.length: ' + JSON.stringify(missionInfos.length));
            for (var i = 0; i < missionInfos.length; i++) {
              if ((missionInfos[i].want.bundleName == "com.example.apprecoverysrely")
              && ((missionInfos[i].want.abilityName == "EntryAbility") ||
              (missionInfos[i].want.abilityName == "EntryAbilitySec"))){
                missionManager.clearMission(missionInfos[i].missionId, (err)=>{
                  console.debug('Acts_AppRecovery_0400====> clearMission err: ' + JSON.stringify(err));
                })
              }
            }
            setTimeout(()=>{
              commonEvent.subscribe(subscriber, subscribeCallBackSecond);
              globalThis.abilityContext.startAbility(
                {
                  bundleName: "com.example.apprecoverysrely",
                  abilityName: "EntryAbility",
                  action: "Acts_AppRecovery_0400_twice"
                }, (err) => {
                console.debug("Acts_AppRecovery_0400====> second startAbility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(0);
              })
            },800)
          });
        }
      }
      function subscribeCallBackSecond(err, data) {
        console.debug("Acts_AppRecovery_0400====> second subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_Second") {
          countSecond++;
          flag=true;
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertEqual(undefined);
          if (countSecond < 2) {
            return;
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }
      function unSubscribeCallback() {
        setTimeout(() => {
          console.debug("Acts_AppRecovery_0400====> unSubscribeCallback");
          done();
        }, 800);
      }
      setTimeout(()=>{
        if(flag==false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })

   /*
    * @tc.number: Acts_AppRecovery_0700
    * @tc.name: Fault recovery of multi-Ability application
    * @tc.desc: If the restart recovery status is not set, the Ability application pre-failure state will not be
    *           restored after the application exits abnormally and restarts.
    */
    it('Acts_AppRecovery_0700',0, async function (done) {
      let subscriber;
      let flag = false;
      console.info("Acts_AppRecovery_0700====> start")
      commonEvent.createSubscriber(ACTS_AppRecovery).then(async (data) => {
        console.debug("Acts_AppRecovery_0700====> Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.example.apprecoveryrely",
            abilityName: "EntryAbility",
            action: "Acts_AppRecovery_0700_once"
          },(err)=>{
          console.debug("Acts_AppRecovery_0700====> startAbility err:"+JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.debug("Acts_AppRecovery_0700====> subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_First") {
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertEqual(undefined);
          setTimeout(()=>{
            commonEvent.subscribe(subscriber, subscribeCallBackSecond);
            globalThis.abilityContext.startAbility(
              {
                bundleName: "com.example.apprecoveryrely",
                abilityName: "EntryAbility",
                action: "Acts_AppRecovery_0700_twice"
              }, (err) => {
              console.debug("Acts_AppRecovery_0700====> second startAbility err:" + JSON.stringify(err));
              expect(err.code).assertEqual(0);
            })
          },800)
        }
      }

      function subscribeCallBackSecond(err, data) {
        console.debug("Acts_AppRecovery_0700====> second subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_Second") {
          flag=true;
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertEqual(undefined);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        setTimeout(() => {
          console.debug("Acts_AppRecovery_0700====> unSubscribeCallback");
          done();
        }, 800);
      }

      setTimeout(()=>{
        if(flag==false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })

  /*
   * @tc.number: Acts_AppRecovery_0800
   * @tc.name: Fault recovery of multi-Ability application
   * @tc.desc: If the restart recovery status is not set, the Ability application pre-failure state will not be
   *          restored after the application exits abnormally and restarts.
   */
    it('Acts_AppRecovery_0800',0, async function (done) {
      let subscriber;
      let flag = false;
      let countFirst = 0;
      let countSecond = 0;
      console.info("Acts_AppRecovery_0800====> start")
      commonEvent.createSubscriber(ACTS_AppRecovery).then(async (data) => {
        console.debug("Acts_AppRecovery_0800====> Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.example.apprecoverysrely",
            abilityName: "EntryAbility",
            action: "Acts_AppRecovery_0800_once"
          },(err)=>{
          console.debug("Acts_AppRecovery_0800====> startAbility err:"+JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.debug("Acts_AppRecovery_0800====> subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_First") {
          countFirst++;
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertEqual(undefined);
          if (countFirst < 2) {
            return;
          }
          setTimeout(() => {
            commonEvent.subscribe(subscriber, subscribeCallBackSecond);
            globalThis.abilityContext.startAbility(
              {
                bundleName: "com.example.apprecoverysrely",
                abilityName: "EntryAbility",
                action: "Acts_AppRecovery_0800_twice"
              },
              (err) => {
                console.debug("Acts_AppRecovery_0800====> second startAbility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(0);
              }
            );
          }, 800);
        }
      }

      function subscribeCallBackSecond(err, data) {
        console.debug("Acts_AppRecovery_0800====> second subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_Second") {
          countSecond++;
          flag=true;
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertEqual(undefined);
          if (countSecond < 2) {
            return;
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        setTimeout(() => {
          console.debug("Acts_AppRecovery_0800====> unSubscribeCallback");
          done();
        }, 800);
      }

      setTimeout(()=>{
        if(flag==false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_AppRecovery_0900
     * @tc.name: Fault recovery of multi-Ability application
     * @tc.desc: When the application settings restart recovery status is valid, the application exits abnormally
     *           and restarts to restore the pre-failure state of Ability application.
     */
    it('Acts_AppRecovery_0900',0, async function (done) {
      let subscriber;
      let flag = false;
      console.info("Acts_AppRecovery_0900====> start")
      commonEvent.createSubscriber(ACTS_AppRecovery).then(async (data) => {
        console.debug("Acts_AppRecovery_0900====> Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.example.apprecoveryrely",
            abilityName: "EntryAbility",
            action: "Acts_AppRecovery_0900_once"
          },(err)=>{
          console.debug("Acts_AppRecovery_0900====> startAbility err:"+JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.debug("Acts_AppRecovery_0900====> subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_First") {
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertEqual(undefined);
          let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let pkillCmd = "pkill -f com.example.apprecoveryrely";
          console.debug("Acts_AppRecovery_0900====> shell command call " + pkillCmd);
          abilityDelegator.executeShellCommand(pkillCmd, 1, (err, data) => {
            console.debug("Acts_AppRecovery_0900====> shell command callback " + JSON.stringify(err) + " " + JSON.stringify(data));
            setTimeout(() => {
              commonEvent.subscribe(subscriber, subscribeCallBackSecond);
              globalThis.abilityContext.startAbility(
                {
                  bundleName: "com.example.apprecoveryrely",
                  abilityName: "EntryAbility",
                  action: "Acts_AppRecovery_0900_twice"
                },
                (err) => {
                  console.debug("Acts_AppRecovery_0900====> second startAbility err:" + JSON.stringify(err));
                  expect(err.code).assertEqual(0);
                }
              );
            }, 800);
          });
        }
      }

      function subscribeCallBackSecond(err, data) {
        console.debug("Acts_AppRecovery_0900====> second subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_Second") {
          flag=true;
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertEqual(undefined);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        setTimeout(() => {
          console.debug("Acts_AppRecovery_0900====> unSubscribeCallback");
          done();
        }, 800);
      }

      setTimeout(()=>{
        if(flag==false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_AppRecovery_1000
     * @tc.name: Fault recovery of multi-Ability application
     * @tc.desc: When the application settings restart recovery status is valid, the application exits abnormally
     *           and restarts to restore the pre-failure state of Ability application.
     */
    it('Acts_AppRecovery_1000',0, async function (done) {
      let subscriber;
      let flag = false;
      let countFirst = 0;
      let countSecond = 0;
      console.info("Acts_AppRecovery_1000====> start")
      commonEvent.createSubscriber(ACTS_AppRecovery).then(async (data) => {
        console.debug("Acts_AppRecovery_1000====> Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.example.apprecoverysrely",
            abilityName: "EntryAbility",
            action: "Acts_AppRecovery_1000_once"
          },(err)=>{
          console.debug("Acts_AppRecovery_1000====> startAbility err:"+JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.debug("Acts_AppRecovery_1000====> subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_First") {
          countFirst++;
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertEqual(undefined);
          if (countFirst < 2) {
            return;
          }
          let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let pkillCmd = "pkill -f com.example.apprecoverysrely";
          abilityDelegator.executeShellCommand(pkillCmd, 1, (err, data) => {
            setTimeout(() => {
              commonEvent.subscribe(subscriber, subscribeCallBackSecond);
              globalThis.abilityContext.startAbility(
                {
                  bundleName: "com.example.apprecoverysrely",
                  abilityName: "EntryAbility",
                  action: "Acts_AppRecovery_1000_twice"
                },
                (err) => {
                  console.debug("Acts_AppRecovery_1000====> second startAbility err:" + JSON.stringify(err));
                  expect(err.code).assertEqual(0);
                }
              );
            }, 800);
          });
        }
      }

      function subscribeCallBackSecond(err, data) {
        console.debug("Acts_AppRecovery_1000====> second subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_Second") {
          countSecond++;
          flag=true;
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertEqual(undefined);
          if (countSecond < 2) {
            return;
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        setTimeout(() => {
          console.debug("Acts_AppRecovery_1000====> unSubscribeCallback");
          done();
        }, 800);
      }

      setTimeout(()=>{
        if(flag==false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_AppRecovery_1100
     * @tc.name: Fault recovery of multi-Ability application
     * @tc.desc: When setting restart recovery status is valid, exit the application by clearing the task list and
     *           do not restore the pre-failure state of the Ability application after the application restart.
     */
    it('Acts_AppRecovery_1100',0, async function (done) {
      let subscriber;
      let flag = false;
      console.info("Acts_AppRecovery_1100====> start")
      commonEvent.createSubscriber(ACTS_AppRecovery).then(async (data) => {
        console.debug("Acts_AppRecovery_1100====> Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.example.apprecoveryrely",
            abilityName: "EntryAbility",
            action: "Acts_AppRecovery_1100_once"
          },(err)=>{
          console.debug("Acts_AppRecovery_1100====> startAbility err:"+JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.debug("Acts_AppRecovery_1100====> subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_First") {
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertEqual(undefined);
          let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let pkillCmd = "pkill -f com.example.apprecoveryrely";
          abilityDelegator.executeShellCommand(pkillCmd, 1, (err, data) => {
            setTimeout(() => {
              commonEvent.subscribe(subscriber, subscribeCallBackSecond);
              globalThis.abilityContext.startAbility(
                {
                  bundleName: "com.example.apprecoveryrely",
                  abilityName: "EntryAbility",
                  action: "Acts_AppRecovery_1100_twice"
                },
                (err) => {
                  console.debug("Acts_AppRecovery_1100====> second startAbility err:" + JSON.stringify(err));
                  expect(err.code).assertEqual(0);
                }
              );
            }, 800);
          });
        }
      }

      function subscribeCallBackSecond(err, data) {
        console.debug("Acts_AppRecovery_1100====> second subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_Second") {
          flag=true;
          let message = data.parameters.message;
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART] != undefined).assertTrue();
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertTrue();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        setTimeout(() => {
          console.debug("Acts_AppRecovery_1100====> unSubscribeCallback");
          done();
        }, 800);
      }

      setTimeout(()=>{
        if(flag==false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_AppRecovery_1200
     * @tc.name: Fault recovery of multi-Ability application
     * @tc.desc: When setting restart recovery status is valid, exit the application by clearing the task list and
     *           do not restore the pre-failure state of the Ability application after the application restart.
     */
    it('Acts_AppRecovery_1200',0, async function (done) {
      let subscriber;
      let flag = false;
      let countFirst = 0;
      let countSecond = 0;
      console.info("Acts_AppRecovery_1200====> start")
      commonEvent.createSubscriber(ACTS_AppRecovery).then(async (data) => {
        console.debug("Acts_AppRecovery_1200====> Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.example.apprecoverysrely",
            abilityName: "EntryAbility",
            action: "Acts_AppRecovery_1200_once"
          },(err)=>{
          console.debug("Acts_AppRecovery_1200====> startAbility err:"+JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.debug("Acts_AppRecovery_1200====> subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_First") {
          countFirst++;
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertEqual(undefined);
          if (countFirst < 2) {
            return;
          }
          let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let pkillCmd = "pkill -f com.example.apprecoverysrely";
          abilityDelegator.executeShellCommand(pkillCmd, 1, (err, data) => {
            setTimeout(() => {
              commonEvent.subscribe(subscriber, subscribeCallBackSecond);
              globalThis.abilityContext.startAbility(
                {
                  bundleName: "com.example.apprecoverysrely",
                  abilityName: "EntryAbility",
                  action: "Acts_AppRecovery_1200_twice"
                },
                (err) => {
                  console.debug("Acts_AppRecovery_1200====> second startAbility err:" + JSON.stringify(err));
                  expect(err.code).assertEqual(0);
                }
              );
            }, 800);
          });
        }
      }

      function subscribeCallBackSecond(err, data) {
        console.debug("Acts_AppRecovery_1200====> second subscribeCallBack data:" + JSON.stringify(data));
        if(data.event == "ACTS_AppRecovery_Second") {
          countSecond++;
          flag=true;
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART] != undefined).assertTrue();
          expect(data.parameters.message[wantConstant.Params.ABILITY_RECOVERY_RESTART]).assertTrue();
          if (countSecond < 2) {
            return;
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        setTimeout(() => {
          console.debug("Acts_AppRecovery_1200====> unSubscribeCallback");
          done();
        }, 800);
      }

      setTimeout(()=>{
        if(flag==false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })
  })
}