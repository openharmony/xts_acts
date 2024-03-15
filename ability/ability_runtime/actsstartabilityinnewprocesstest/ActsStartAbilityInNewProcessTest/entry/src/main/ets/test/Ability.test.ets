/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import Want from '@ohos.app.ability.Want';
import contextConstant from '@ohos.app.ability.contextConstant';
import { BusinessError } from '@ohos.base';
import commonEvent from '@ohos.commonEventManager';

export default function abilityTest() {
  describe('ActsAbilityTest', function () {
    let functionEnable = '';
    let ON_WINDOW_STAGE_CREATE = "on_window_stage_create";
    let ON_FOREGROUND = "on_foreground";
    let START_ABILITY_IN_NEW_PROCESS_EVENT = "start_ability_in_new_process_event";
    let UPDATE_WANT_EVENT = "update_want_event";
    let FOREGROUND_EVENT = "foreground_event";
    let SHOW_ABILITY_EVENT = "show_ability_event";
    let HIDE_ABILITY_EVENT = "hide_ability_event";
    let subscribeInfo = {
      events: [ON_WINDOW_STAGE_CREATE, ON_FOREGROUND, START_ABILITY_IN_NEW_PROCESS_EVENT, FOREGROUND_EVENT],
    };
    let subscriber;
    let abilityDelegator;
    let onWindowStageFlag = false;
    let onForegroundFlag = false;
    let expectErrorCode = -1;
    let commonEventData = {
      parameters: {}
    };

    function sleep(ms: number) {
      return new Promise<string>(resolve => setTimeout(resolve, ms));
    }

    function subscribeCallBack(err, data, done, tag) {
      console.log(`${tag} subscribeCallBack err: ${JSON.stringify(err)}, data: ${JSON.stringify(data)}`);
      switch (data.event) {
        case START_ABILITY_IN_NEW_PROCESS_EVENT: {
          expect(data.parameters.num).assertEqual(expectErrorCode);
          if (expectErrorCode !== 0) {
            commonEvent.unsubscribe(subscriber, (err, data) => {
              console.info(`${tag} unsubscribe success`);
              done();
            })
          }
        }
          break;
        case ON_WINDOW_STAGE_CREATE:
          onWindowStageFlag = true;
          console.log(`${tag} subscribeCallBack onWindowStageFlag: ${onWindowStageFlag}`);
          break;
        case ON_FOREGROUND:
          onForegroundFlag = true;
          console.log(`${tag} subscribeCallBack onForegroundFlag: ${onForegroundFlag}`);
          break;
        case FOREGROUND_EVENT: {
          commonEvent.publish(UPDATE_WANT_EVENT, commonEventData, (err)=>{
            console.log(`${tag} publish UPDATE_WANT_EVENT err: ${JSON.stringify(err)}`);
          });
        }
          break;
        default:
          console.log(`${tag} subscribeCallBack event error: ${data.event}`);
          break;
      }
    }

    function startAssistAbility(tag, done) {
      let want: Want = {
        deviceId: '',
        bundleName: 'com.example.startabilityinnewprocessrely',
        abilityName: 'EntryAbility',
      };
      try {
        console.log(`${tag} startAssistAbility, ${JSON.stringify(want)}`);
        globalThis.context.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.log(`${tag} startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            commonEvent.unsubscribe(subscriber, (err, data) => {
              console.info(`${tag} unsubscribe success`);
              done();
            })
            return;
          }
          console.log(`${tag} startAbility succeed`);
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.log(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        commonEvent.unsubscribe(subscriber, (err, data) => {
          console.info(`${tag} unsubscribe success`);
          done();
        })
      }
    }

    beforeAll(async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess beforeAll]';
      try {
        functionEnable = systemParameterEnhance.getSync('persist.sys.abilityms.start_options_with_process_option', 'false');
      } catch (err) {
        console.log(`${tag} err is ${JSON.stringify(functionEnable)}`);
      }
      console.log(`${tag} functionEnable is ${functionEnable}`);
      abilityDelegator = await AbilityDelegatorRegistry.getAbilityDelegator();
      done();
    })
    beforeEach(async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess beforeEach]';
      console.log(`${tag} start`);
      onWindowStageFlag = false;
      onForegroundFlag = false;
      expectErrorCode = -1;
      commonEventData ={
        parameters: {}
      };
      done();
    })
    afterEach(async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess afterEach]';
      let forcestop = 'aa force-stop com.example.startabilityinnewprocessrely';
      await abilityDelegator.executeShellCommand(forcestop).catch(err => {
        console.log(`${tag} executeShellCommand failed.`);
      })
      await sleep(1000);
      done();
    })
    afterAll(function () {
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0100
     * @tc.name Normal branch.
     * @tc.desc Start with NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM and STARTUP_HIDE.
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0100',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0100]';
      if (functionEnable === 'true') {
        expect(contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT).assertEqual(1);
        expect(contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM).assertEqual(2);
        expect(contextConstant.StartupVisibility.STARTUP_HIDE).assertEqual(0);
        expect(contextConstant.StartupVisibility.STARTUP_SHOW).assertEqual(1);

        expectErrorCode = 0;
        commonEventData.parameters["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM;
        commonEventData.parameters["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters["isDone"] = 1;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && !onForegroundFlag;
          expect(flag).assertEqual(true);
          let cmd = 'ps -ef | grep com.example.startabilityinnewprocessrely';
          let data = await abilityDelegator.executeShellCommand(cmd).catch(err => {
            console.log(`${tag} executeShellCommand failed.`);
            expect().assertFail();
            done();
          })
          expect(data.stdResult).assertContain("com.example.startabilityinnewprocessrely:entry:MainAbility2:");
          commonEvent.unsubscribe(subscriber, (err, data) => {
            console.info(`${tag} unsubscribe success`);
            done();
          })
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0200
     * @tc.name Normal branch.
     * @tc.desc Start with NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM and STARTUP_SHOW.
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0200',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0200]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM;
        commonEventData.parameters["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_SHOW;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          commonEvent.unsubscribe(subscriber, (err, data) => {
            console.info(`${tag} unsubscribe success`);
            done();
          })
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0300
     * @tc.name Normal branch.
     * @tc.desc Start with NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM and STARTUP_HIDE, then call showAbility().
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0300',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0300]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM;
        commonEventData.parameters["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters["isDone"] = 1;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && !onForegroundFlag;
          expect(flag).assertEqual(true);
          commonEvent.publish(SHOW_ABILITY_EVENT, (err)=>{
            console.log(`${tag} publish SHOW_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
          setTimeout(async ()=>{
            expect(onForegroundFlag).assertEqual(true);
            commonEvent.unsubscribe(subscriber, (err, data) => {
              console.info(`${tag} unsubscribe success`);
              done();
            })
          }, 3000);
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0400
     * @tc.name Anomalous branch.
     * @tc.desc Start with processMode only.
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0400',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0400]';
      if (functionEnable === 'true') {
        expectErrorCode = 401;
        commonEventData.parameters["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM;
        commonEventData.parameters["isDone"] = 1;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0500
     * @tc.name Anomalous branch.
     * @tc.desc Start with startupVisibility only.
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0500',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0500]';
      if (functionEnable === 'true') {
        expectErrorCode = 401;
        commonEventData.parameters["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters["isDone"] = 1;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0600
     * @tc.name Anomalous branch.
     * @tc.desc Repeat start ability in singleton mode.
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0600',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0600]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM;
        commonEventData.parameters["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters["isDone"] = 0;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && !onForegroundFlag;
          expect(flag).assertEqual(true);
          expectErrorCode = 16000068;
          commonEventData.parameters["isDone"] = 1;
          commonEvent.publish(UPDATE_WANT_EVENT, commonEventData, (err)=>{
            console.log(`${tag} publish UPDATE_WANT_EVENT err: ${JSON.stringify(err)}`);
          });
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0700
     * @tc.name Anomalous branch.
     * @tc.desc Target ability is not self application.
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0700',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0700]';
      if (functionEnable === 'true') {
        expectErrorCode = 16300003;
        commonEventData.parameters["acts_bundleName"] = 'com.example.test';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM;
        commonEventData.parameters["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters["isDone"] = 1;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0800
     * @tc.name Normal branch.
     * @tc.desc Repeat start ability with STARTUP_HIDE in multiton mode.
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0800',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0800]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility3';
        commonEventData.parameters["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM;
        commonEventData.parameters["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters["isDone"] = 0;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && !onForegroundFlag;
          expect(flag).assertEqual(true);
          let cmd = 'ps -ef | grep com.example.startabilityinnewprocessrely';
          let data = await abilityDelegator.executeShellCommand(cmd).catch(err => {
            console.log(`${tag} executeShellCommand failed.`);
            expect().assertFail();
            done();
          })
          expect(data.stdResult).assertContain("com.example.startabilityinnewprocessrely:entry:MainAbility3:");
          expectErrorCode = 0;
          onWindowStageFlag = false;
          onForegroundFlag = false;
          commonEventData.parameters["isDone"] = 1;
          commonEvent.publish(UPDATE_WANT_EVENT, commonEventData, (err)=>{
            console.log(`${tag} publish UPDATE_WANT_EVENT err: ${JSON.stringify(err)}`);
          });
          setTimeout(async ()=>{
            let flag = onWindowStageFlag && !onForegroundFlag;
            expect(flag).assertEqual(true);
            commonEvent.unsubscribe(subscriber, (err, data) => {
              console.info(`${tag} unsubscribe success`);
              done();
            })
          }, 3000)
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0900
     * @tc.name Anomalous branch.
     * @tc.desc Start with NEW_PROCESS_ATTACH_TO_PARENT, then call showAbility().
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0900',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_0900]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT;
        commonEventData.parameters["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters["isDone"] = 1;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && !onForegroundFlag;
          expect(flag).assertEqual(true);
          expectErrorCode = 16000067;
          commonEvent.publish(SHOW_ABILITY_EVENT, (err)=>{
            console.log(`${tag} publish SHOW_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1000
     * @tc.name Anomalous branch.
     * @tc.desc Start ability without process options, then call hideAbility().
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1000',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1000]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters["isDone"] = 1;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          expectErrorCode = 16000067;
          commonEvent.publish(HIDE_ABILITY_EVENT, (err)=>{
            console.log(`${tag} publish HIDE_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1100
     * @tc.name Normal branch.
     * @tc.desc Start ability with NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM and STARTUP_SHOW, then call hideAbility().
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1100',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1100]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM;
        commonEventData.parameters["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_SHOW;
        commonEventData.parameters["isDone"] = 1;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          commonEvent.publish(HIDE_ABILITY_EVENT, (err)=>{
            console.log(`${tag} publish HIDE_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
          setTimeout(async ()=>{
            commonEvent.unsubscribe(subscriber, (err, data) => {
              console.info(`${tag} unsubscribe success`);
              done();
            })
          }, 3000);
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1200
     * @tc.name Anomalous branch.
     * @tc.desc Repeat start ability in specified mode.
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1200',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1200]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility4';
        commonEventData.parameters["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM;
        commonEventData.parameters["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters["isDone"] = 0;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && !onForegroundFlag;
          expect(flag).assertEqual(true);
          let cmd = 'ps -ef | grep com.example.startabilityinnewprocessrely';
          let data = await abilityDelegator.executeShellCommand(cmd).catch(err => {
            console.log(`${tag} executeShellCommand failed.`);
            expect().assertFail();
            done();
          })
          expect(data.stdResult).assertContain("com.example.startabilityinnewprocessrely:entry:MainAbility4:");
          expectErrorCode = 16000068;
          commonEventData.parameters["isDone"] = 1;
          commonEvent.publish(UPDATE_WANT_EVENT, commonEventData, (err)=>{
            console.log(`${tag} publish UPDATE_WANT_EVENT err: ${JSON.stringify(err)}`);
          });
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1300
     * @tc.name Anomalous branch.
     * @tc.desc Start specified ability without process options, then start the ability with process options again.
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1300',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1300]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility4';
        commonEventData.parameters["isDone"] = 0;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          expectErrorCode = 16000068;
          commonEventData.parameters["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM;
          commonEventData.parameters["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
          commonEventData.parameters["isDone"] = 1;
          commonEvent.publish(UPDATE_WANT_EVENT, commonEventData, (err)=>{
            console.log(`${tag} publish UPDATE_WANT_EVENT err: ${JSON.stringify(err)}`);
          });
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1400
     * @tc.name Anomalous branch.
     * @tc.desc Start singleton ability without process options, then start the ability with process options again.
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1400',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1400]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters["isDone"] = 0;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          expectErrorCode = 16000068;
          commonEventData.parameters["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM;
          commonEventData.parameters["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
          commonEventData.parameters["isDone"] = 1;
          commonEvent.publish(UPDATE_WANT_EVENT, commonEventData, (err)=>{
            console.log(`${tag} publish UPDATE_WANT_EVENT err: ${JSON.stringify(err)}`);
          });
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1500
     * @tc.name Normal branch.
     * @tc.desc Repeat start ability with STARTUP_SHOW in multiton mode.
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1500',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1500]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility3';
        commonEventData.parameters["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM;
        commonEventData.parameters["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_SHOW;
        commonEventData.parameters["isDone"] = 0;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          expectErrorCode = 0;
          onWindowStageFlag = false;
          onForegroundFlag = false;
          commonEventData.parameters["isDone"] = 1;
          commonEvent.publish(UPDATE_WANT_EVENT, commonEventData, (err)=>{
            console.log(`${tag} publish UPDATE_WANT_EVENT err: ${JSON.stringify(err)}`);
          });
          setTimeout(async ()=>{
            let flag = onWindowStageFlag && onForegroundFlag;
            expect(flag).assertEqual(true);
            commonEvent.unsubscribe(subscriber, (err, data) => {
              console.info(`${tag} unsubscribe success`);
              done();
            })
          }, 3000)
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1600
     * @tc.name Normal branch.
     * @tc.desc Start with STARTUP_SHOW, then call showAbility().
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1600',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1600]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM;
        commonEventData.parameters["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_SHOW;
        commonEventData.parameters["isDone"] = 1;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          commonEvent.publish(SHOW_ABILITY_EVENT, (err)=>{
            console.log(`${tag} publish SHOW_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
          setTimeout(async ()=>{
            commonEvent.unsubscribe(subscriber, (err, data) => {
              console.info(`${tag} unsubscribe success`);
              done();
            })
          }, 3000);
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1700
     * @tc.name Normal branch.
     * @tc.desc Start with STARTUP_HIDE, then call hideAbility().
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1700',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1700]';
      if (functionEnable === 'true') {
        expectErrorCode = 0;
        commonEventData.parameters["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM;
        commonEventData.parameters["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters["isDone"] = 1;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && !onForegroundFlag;
          expect(flag).assertEqual(true);
          commonEvent.publish(HIDE_ABILITY_EVENT, (err)=>{
            console.log(`${tag} publish HIDE_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
          setTimeout(async ()=>{
            commonEvent.unsubscribe(subscriber, (err, data) => {
              console.info(`${tag} unsubscribe success`);
              done();
            })
          }, 3000);
        }, 3000)
      } else if (functionEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(true).assertTrue();
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1800
     * @tc.name Anomalous branch.
     * @tc.desc Function not enable. Start with process options.
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1800',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1800]';
      if (functionEnable !== 'true') {
        expectErrorCode = 801;
        commonEventData.parameters["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters["acts_processMode"] = contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM;
        commonEventData.parameters["acts_startupVisibility"] = contextConstant.StartupVisibility.STARTUP_HIDE;
        commonEventData.parameters["isDone"] = 1;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
      } else {
        expect(true).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1900
     * @tc.name Anomalous branch.
     * @tc.desc Function not enable. Start ability without process options, then call showAbility().
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1900',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_1900]';
      if (functionEnable !== 'true') {
        expectErrorCode = 0;
        commonEventData.parameters["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters["isDone"] = 1;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          expectErrorCode = 801;
          commonEvent.publish(SHOW_ABILITY_EVENT, (err)=>{
            console.log(`${tag} publish SHOW_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
        }, 3000)
      } else {
        expect(true).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2000
     * @tc.name Anomalous branch.
     * @tc.desc Function not enable. Start ability without process options, then call hideAbility().
     * @tc.level Level 3
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2000',0, async function (done) {
      let tag = '[SUB_Ability_AbilityRuntime_StartAbilityInNewProcess_2000]';
      if (functionEnable !== 'true') {
        expectErrorCode = 0;
        commonEventData.parameters["acts_bundleName"] = 'com.example.startabilityinnewprocessrely';
        commonEventData.parameters["acts_abilityName"] = 'MainAbility2';
        commonEventData.parameters["isDone"] = 1;

        subscriber = await commonEvent.createSubscriber(subscribeInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          subscribeCallBack(err, data, done, tag);
        });
        startAssistAbility(tag, done);
        setTimeout(async ()=>{
          let flag = onWindowStageFlag && onForegroundFlag;
          expect(flag).assertEqual(true);
          expectErrorCode = 801;
          commonEvent.publish(HIDE_ABILITY_EVENT, (err)=>{
            console.log(`${tag} publish HIDE_ABILITY_EVENT err: ${JSON.stringify(err)}`);
          });
        }, 3000)
      } else {
        expect(true).assertTrue();
        done();
      }
    })
  })
}