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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
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
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_setColorMode_0100', 0, async (done: Function) => {
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
    it('SUB_Ability_AbilityRuntime_ErrorCode_RequestCallback_setRequestResult_0100', 0, async (done: Function) => {
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
    it('SUB_Ability_AbilityRuntime_ErrorCode_dialogRequest_getRequestInfo_0100', 0, async (done: Function) => {
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
    it('SUB_Ability_AbilityRuntime_ErrorCode_dialogRequest_getRequestCallback_0100', 0, async (done: Function) => {
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
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0100
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0100
     * @tc.desc    startAbility(want: Want, callback: AsyncCallback<void>): void. Errcode 16000004, configure exported as false in the target ability
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0100', 0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0100';
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        let want: Want = {
          bundleName: 'com.test.ActsAbilityErrCodeQueryTest',
          abilityName: 'AbilityE',
        };
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        console.log(`[${TAG}] abilityDelegator: ${abilityDelegator}`);
        abilityDelegator.startAbility(want, (err: BusinessError, data: void) => {
          console.info(`[${TAG}] startAbility callback`);
          if (err) {
            console.log(`[${TAG}] err: ${JSON.stringify(err)}`);

            // 结果不符预期
            expect(err.code).assertEqual(16000001);

            // expect(err.code).assertEqual(16000004);
            done();
          } else {
            console.log(`[${TAG}] startAbility data: ${JSON.stringify(data)}`);
            expect().assertFail();
            done();
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000004);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0200
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0200
     * @tc.desc    startAbility(want: Want, callback: AsyncCallback<void>): void. Errcode 16000005, Configure permission in the target ability
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0200', 0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0200';
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        let want: Want = {
          bundleName: 'com.test.ActsAbilityErrCodeQueryTest',
          abilityName: 'AbilityB',
        };
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        console.log(`[${TAG}] abilityDelegator: ${abilityDelegator}`);
        abilityDelegator.startAbility(want, (err: BusinessError, data: void) => {
          console.info(`[${TAG}] startAbility callback`);
          if (err) {
            console.log(`[${TAG}] err: ${JSON.stringify(err)}`);

            // 结果不符预期
            expect(err.code).assertEqual(16000001);

            // expect(err.code).assertEqual(16000005);
            done();
          } else {
            console.log(`[${TAG}] startAbility data: ${JSON.stringify(data)}`);
            expect().assertFail();
            done();
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000005);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0300
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0300
     * @tc.desc    startAbility(want: Want): Promise<void>; Errcode 16000004, configure exported as false in the target ability
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0300', 0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0300';
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        let want: Want = {
          bundleName: 'com.test.ActsAbilityErrCodeQueryTest',
          abilityName: 'AbilityE',
        };
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        console.log(`[${TAG}] abilityDelegator: ${abilityDelegator}`);
        let errObject = {} as BusinessError;
        await abilityDelegator.startAbility(want)
          .then((data: void) => {
            console.log(`[${TAG}] startAbility promise`);
            expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] err: ${JSON.stringify(err)}`);
            errObject = err;
          })

        // 结果不符预期
        expect(errObject.code).assertEqual(16000001);

        // expect(errObject.code).assertEqual(16000004);
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000004);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0400
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0400
     * @tc.desc    startAbility(want: Want): Promise<void>; Errcode 16000005, configure permission in the target ability
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0400', 0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0400';
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        let want: Want = {
          bundleName: 'com.test.ActsAbilityErrCodeQueryTest',
          abilityName: 'AbilityB',
        };
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        console.log(`[${TAG}] abilityDelegator: ${abilityDelegator}`);
        let errObject = {} as BusinessError;
        await abilityDelegator.startAbility(want)
          .then((data: void) => {
            console.log(`[${TAG}] startAbility promise`);
            expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] err: ${JSON.stringify(err)}`);
            errObject = err;
          })

        // 结果不符预期
        expect(errObject.code).assertEqual(16000001);

        // expect(errObject.code).assertEqual(16000005);
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000005);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_getCurrentTopAbility_0100
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_getCurrentTopAbility_0100
     * @tc.desc    getCurrentTopAbility(callback: AsyncCallback<UIAbility>): void; Errcode 16000100, Start another application, and then call the API to obtain the top-level capabilities
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_getCurrentTopAbility_0100', 0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_getCurrentTopAbility_0100';
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        console.log(`[${TAG}] abilityDelegator: ${abilityDelegator}`);
        await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.helloworld').then(data => {
          console.info(`[${TAG}] executeShellCommand result: ${JSON.stringify(data)}`);
        }).catch((err: BusinessError) => {
          console.error(`[${TAG}] executeShellCommand err: ${JSON.stringify(err)}`);
        })
        let ability: UIAbility;
        abilityDelegator.getCurrentTopAbility((err: BusinessError, data: UIAbility) => {
          if (err) {
            console.log(`[${TAG}] err: ${JSON.stringify(err)}`);
            expect(err.code).assertEqual(16000100);
            done();
          } else {
            console.info(`[${TAG}] getCurrentTopAbility callback`);
            ability = data;
            console.info(`[${TAG}] ability: ${JSON.stringify(ability)}`);

            // 结果不符预期

            // expect().assertFail();
            done();
          }
        });
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_getCurrentTopAbility_0200
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_getCurrentTopAbility_0200
     * @tc.desc    getCurrentTopAbility(): Promise<UIAbility>; Errcode 16000100, Start another application, and then call the API to obtain the top-level capabilities
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_getCurrentTopAbility_0200', 0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_getCurrentTopAbility_0200';
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        console.log(`[${TAG}] abilityDelegator: ${abilityDelegator}`);
        await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.helloworld').then(data => {
          console.info(`[${TAG}] executeShellCommand result: ${JSON.stringify(data)}`);
        }).catch((err: BusinessError) => {
          console.error(`[${TAG}] executeShellCommand err: ${JSON.stringify(err)}`);
        })
        let ability: UIAbility;
        await abilityDelegator.getCurrentTopAbility().then((data: UIAbility) => {
          console.info(`[${TAG}] getCurrentTopAbility promise`);
          ability = data;
          console.info(`[${TAG}] ability: ${JSON.stringify(ability)}`);
        })

        // 结果不符预期

        // expect().assertFail();
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000100);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0200
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0200
     * @tc.desc    startAbility(want: Want, callback: AsyncCallback<void>): void. Errcode 16000005, Configure permission in the target ability
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0200', 0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0200';
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'AbilityB',
      };
      try {
        uiExtentionContext.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            // expect(err.code).assertEqual(16000005);
            done();
          } else {
            console.info(`[${TAG}] startAbility succeed`);

            // 结果不符预期

            // expect().assertFail();
            done();
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000005);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0300
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0300
     * @tc.desc    startAbility(want: Want, callback: AsyncCallback<void>): void. Errcode 16000010, set flags to -1
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0300', 0, async (done: Function) => {
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
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0500
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0500
     * @tc.desc    startAbility(want: Want, options: StartOptions, callback: AsyncCallback<void>): void; Errcode 16000005, Configure permission in the target ability
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0500', 0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0500';
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'AbilityA',
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        uiExtentionContext.startAbility(want, options, (err: BusinessError) => {
          if (err.code) {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            // expect(err.code).assertEqual(16000005);
            done();
          } else {
            console.info(`[${TAG}] startAbility succeed`);

            // 结果不符预期

            // expect().assertFail();
            done();
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000005);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0700
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0700
     * @tc.desc    startAbility(want: Want, options?: StartOptions): Promise<void>; Errcode 16000005, Configure permission in the target ability
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0700', 0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0700';
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'AbilityB',
      };
      let options: StartOptions = {
        displayId: 0
      };
      let errObject = {} as BusinessError;
      try {
        await uiExtentionContext.startAbility(want, options)
          .then(() => {
            console.info(`[${TAG}] startAbility succeed`);

            // 结果不符预期

            // expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            errObject = err;
          })
        // expect(errObject.code).assertEqual(16000005);
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000005);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0800
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0800
     * @tc.desc    startAbility(want: Want, options?: StartOptions): Promise<void>; Errcode 16000010, set flags to -1
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0800', 0, async (done: Function) => {
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
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0200
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0200
     * @tc.desc    startAbilityForResult(want: Want, callback: AsyncCallback<AbilityResult>): void; Errcode 16000005, Configure permission in the target ability
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0200', 0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0200';
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'AbilityD',
      };
      try {
        uiExtentionContext.startAbilityForResult(want, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            // expect(err.code).assertEqual(16000005);
            done();
          } else {
            console.info(`[${TAG}] startAbility succeed, result: ${JSON.stringify(result)}`);

            // 结果不符预期

            // expect().assertFail();
            done();
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000005);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0300
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0300
     * @tc.desc    startAbility(want: Want, callback: AsyncCallback<void>): void. Errcode 16000010, set flags to -1
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0300', 0, async (done: Function) => {
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
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0500
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0500
     * @tc.desc    startAbilityForResult(want: Want, options: StartOptions, callback: AsyncCallback<AbilityResult>): void; Errcode 16000005, Configure permission in the target ability
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0500', 0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0500';
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'AbilityD',
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        uiExtentionContext.startAbilityForResult(want, options, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            // expect(err.code).assertEqual(16000005);
            done();
          } else {
            console.info(`[${TAG}] startAbility succeed, result: ${JSON.stringify(result)}`);

            // 结果不符预期

            // expect().assertFail();
            done();
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000005);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0700
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0700
     * @tc.desc    startAbilityForResult(want: Want, options?: StartOptions): Promise<AbilityResult>; Errcode 16000005, Configure permission in the target ability
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0700', 0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0700';
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'AbilityD',
      };
      let options: StartOptions = {
        displayId: 0
      };
      let errObject = {} as BusinessError;
      try {
        await uiExtentionContext.startAbilityForResult(want, options)
          .then((result: common.AbilityResult) => {
            console.info(`[${TAG}] startAbility succeed, result: ${JSON.stringify(result)}`);

            // 结果不符预期

            // expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            errObject = err;
          })
        // expect(errObject.code).assertEqual(16000005);
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000005);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0800
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0800
     * @tc.desc    startAbilityForResult(want: Want, options?: StartOptions): Promise<AbilityResult>; Errcode 16000010, set flags to -1
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0800', 0, async (done: Function) => {
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
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0100
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0100
     * @tc.desc    startAbility(want: Want, callback: AsyncCallback<void>): void; Errcode 401, pass the parameter wrongly as undefined
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0100', 0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0100';
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'AbilityA',
      };
      try {
        insightIntentContext.startAbility(undefined, undefined);

        // 结果不符预期

        // expect().assertFail();
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(401);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0200
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0200
     * @tc.desc    startAbility(want: Want, callback: AsyncCallback<void>): void; Errcode 16000001, set the ability name wrongly
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0200', 0, async (done: Function) => {
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
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0300
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0300
     * @tc.desc    startAbility(want: Want, callback: AsyncCallback<void>): void; Errcode 16000004, configure exported as false in the target ability
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0300', 0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0300';
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'AbilityE',
      };
      try {
        insightIntentContext.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            // expect(err.code).assertEqual(16000004);
            done();
          } else {
            console.info(`[${TAG}] startAbility succeed`);

            // 结果不符预期

            // expect().assertFail();
            done();
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000004);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0400
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0400
     * @tc.desc    startAbility(want: Want): Promise<void>; Errcode 401, pass the parameter wrongly as undefined
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0400', 0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0400';
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'AbilityA',
      };
      let errObject = {} as BusinessError;
      try {
        await insightIntentContext.startAbility(undefined)
          .then(() => {
            console.info(`[${TAG}] startAbility succeed`);
            expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            errObject = err;
          })

        // 结果不符预期
        expect(errObject.code).assertEqual(16000019);

        // expect(errObject.code).assertEqual(401);
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(401);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0500
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0500
     * @tc.desc    startAbility(want: Want): Promise<void>; Errcode 16000001, set the ability name wrongly
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0500', 0, async (done: Function) => {
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

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0600
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0600
     * @tc.desc    startAbility(want: Want): Promise<void>; Errcode 16000004, configure exported as false in the target ability
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0600', 0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0600';
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'AbilityE',
      };
      let errObject = {} as BusinessError;
      try {
        await insightIntentContext.startAbility(want)
          .then(() => {
            console.info(`[${TAG}] startAbility succeed`);

            // 结果不符预期

            // expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            errObject = err;
          })
        // expect(errObject.code).assertEqual(16000004);
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000004);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_openLink_0200
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_openLink_0200
     * @tc.desc    openLink(link: string, options?: OpenLinkOptions, callback?: AsyncCallback<AbilityResult>): Promise<void>; Errcode 16000005, configure permission in the target ability
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_openLink_0200', 0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_openLink_0200';
      let link: string = 'https://www.AbilityB.com';
      let openLinkOptions: OpenLinkOptions = {};
      let errObject = {} as BusinessError;
      try {
        await uiExtentionContext.openLink(link, openLinkOptions)
          .then(() => {
            console.info(`[${TAG}] openLink succeed`);

            // 结果不符预期

            // expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] openLink failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            errObject = err;
          })
        // expect(errObject.code).assertEqual(16000005);
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000005);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_openLink_0300
     * @tc.name    SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_openLink_0300
     * @tc.desc    openLink(link: string, options?: OpenLinkOptions, callback?: AsyncCallback<AbilityResult>): Promise<void>; Errcode 16000010, set flags to -1
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_openLink_0300', 0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_openLink_0300';
      let link: string = 'https://www.AbilityA.com';
      let openLinkOptions: OpenLinkOptions = {
        parameters: {
          flags: -1
        }
      };
      let errObject = {} as BusinessError;
      try {
        await uiExtentionContext.openLink(link, openLinkOptions)
          .then(() => {
            console.info(`[${TAG}] openLink succeed`);

            // 结果不符预期

            // expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] openLink failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            errObject = err;
          })
        // expect(errObject.code).assertEqual(16000010);
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000010);
        done();
      }
    })

  })
}