/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { common, UIAbility, Want, dialogRequest, StartOptions, InsightIntentContext,
  OpenLinkOptions } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';

let TAG = 'RunTimeTest';
let uiAbilityContext = getContext(this) as common.UIAbilityContext;
let uiExtentionContext = getContext(this) as common.UIExtensionContext;
let insightIntentContext: InsightIntentContext;

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function errCodeQueryTest() {
  describe('errCodeQueryTest', () => {
    beforeAll(() => {
      uiAbilityContext = globalThis.context;
      uiExtentionContext = globalThis.context;
      insightIntentContext = globalThis.context;
    })

    beforeEach(() => {
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

      abilityDelegator.executeShellCommand('aa force-stop com.example.helloworld').then(data => {
        hilog.info(0x0000, 'childProcessManager', '%{public}s',
          'beforeEach ActsDebuggableAaStartTest force-stop data is: ' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        hilog.info(0x0000, 'childProcessManager', '%{public}s',
          'beforeEach ActsDebuggableAaStartTest force-stop err is: ' + JSON.stringify(err));
      });
    })

    afterEach(async () => {
      console.log(`[${TAG}] sleep start`);
      await sleep(700);
      console.log(`[${TAG}] sleep over`);
    })

    afterAll(() => {
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_setColorMode_0100
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_setColorMode_0100
     * @tc.desc    Pass the parameter wrongly as undefined
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_setColorMode_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_setColorMode_0100';
      try {
        let applicationContext = uiAbilityContext.getApplicationContext();
        applicationContext.setColorMode(undefined);
        expect().assertFail();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(401);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_RequestCallback_setRequestResult_0100
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_RequestCallback_setRequestResult_0100
     * @tc.desc    Pass the parameter wrongly as undefined
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_RequestCallback_setRequestResult_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_RequestCallback_setRequestResult_0100';
      try {
        let want: Want = {
          deviceId: '',
          bundleName: 'com.test.ActsAbilityErrCodeQueryTest',
          abilityName: 'TestAbility',
          moduleName: 'entry_test'
        };
        let requestCallback = dialogRequest.getRequestCallback(want);
        console.log(`[${TAG}] 00000`);
        console.log(`[${TAG}] requestCallback: ${JSON.stringify(requestCallback)}`);
        requestCallback.setRequestResult(undefined);
        expect().assertFail();
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(401);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_dialogRequest_getRequestInfo_0100
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_dialogRequest_getRequestInfo_0100
     * @tc.desc    Pass the parameter wrongly as undefined
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_dialogRequest_getRequestInfo_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_dialogRequest_getRequestInfo_0100';
      try {
        let requestInfo = dialogRequest.getRequestInfo(undefined);
        console.log(`[${TAG}] requestInfo: ${JSON.stringify(requestInfo)}`);
        expect().assertFail();
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(401);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_dialogRequest_getRequestCallback_0100
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_dialogRequest_getRequestCallback_0100
     * @tc.desc    Pass the parameter wrongly as undefined
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_dialogRequest_getRequestCallback_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_dialogRequest_getRequestCallback_0100';
      try {
        let requestCallback = dialogRequest.getRequestCallback(undefined);
        console.log(`[${TAG}] requestCallback: ${JSON.stringify(requestCallback)}`);
        expect().assertFail();
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(401);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0300
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0300
     * @tc.desc    startAbility(want: Want, callback: AsyncCallback<void>): void. Errcode 16000010, set flags to -1
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0300', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0300';
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'AbilityA',
        flags: -1
      };
      try {
        uiExtentionContext.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            expect(err.code).assertEqual(16000010);
            done();
          } else {
            console.info(`[${TAG}] startAbility succeed`);
            expect().assertFail();
            done();
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000100);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0800
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0800
     * @tc.desc    startAbility(want: Want, options?: StartOptions): Promise<void>; Errcode 16000010, set flags to -1
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0800', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0800';
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'AbilityA',
        flags: -1
      };
      let options: StartOptions = {
        displayId: 0
      };
      let errObject = {} as BusinessError;
      try {
        await uiExtentionContext.startAbility(want, options)
          .then(() => {
            console.info(`[${TAG}] startAbility succeed`);
            expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            errObject = err;
          })
        expect(errObject.code).assertEqual(16000010);
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000010);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0300
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0300
     * @tc.desc    startAbility(want: Want, callback: AsyncCallback<void>): void. Errcode 16000010, set flags to -1
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0300', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0300';
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'AbilityC',
        flags: -1
      };
      try {
        uiExtentionContext.startAbilityForResult(want, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            expect(err.code).assertEqual(16000010);
            done();
          } else {
            console.info(`[${TAG}] startAbility succeed, result: ${JSON.stringify(result)}`);
            expect().assertFail();
            done();
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000100);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0800
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0800
     * @tc.desc    startAbilityForResult(want: Want, options?: StartOptions): Promise<AbilityResult>; Errcode 16000010, set flags to -1
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0800', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0800';
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'AbilityC',
        flags: -1
      };
      let options: StartOptions = {
        displayId: 0
      };
      let errObject = {} as BusinessError;
      try {
        await uiExtentionContext.startAbilityForResult(want, options)
          .then((result: common.AbilityResult) => {
            console.info(`[${TAG}] startAbility succeed, result: ${JSON.stringify(result)}`);
            expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            errObject = err;
          })
        expect(errObject.code).assertEqual(16000010);
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000010);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0200
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0200
     * @tc.desc    startAbility(want: Want, callback: AsyncCallback<void>): void; Errcode 16000001, set the ability name wrongly
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0200', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0200';
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'AbilityAbility',
      };
      try {
        insightIntentContext.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            expect(err.code).assertEqual(16000001);
            done();
          } else {
            console.info(`[${TAG}] startAbility succeed`);
            expect().assertFail();
            done();
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000001);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0500
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0500
     * @tc.desc    startAbility(want: Want): Promise<void>; Errcode 16000001, set the ability name wrongly
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0500', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0500';
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'AbilityAbility',
      };
      let errObject = {} as BusinessError;
      try {
        await insightIntentContext.startAbility(want)
          .then(() => {
            console.info(`[${TAG}] startAbility succeed`);
            expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            errObject = err;
          })
        expect(errObject.code).assertEqual(16000001);
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000001);
        done();
      }
    })

  })
}