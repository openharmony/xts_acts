/**
 * Copyright (C) 2024 HiHope Open Source Organization
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, afterEach, it, expect, beforeEach } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { common, UIAbility } from '@kit.AbilityKit';
import { Driver } from '@kit.TestKit';

export default function BackWithResultTest() {
  describe('BackWithResultTest', () => {

    let delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityName = 'SecondAbility';

    const TAG: string = 'BackToCallerAbilityWithResult';
    const TEST_SUITE_NAME: string = 'BackToCallerAbilityWithResultTest';
    const PARAMETER_ERROR_CODE  = 401;
    const PARAMETER_ERROR_CODE2  = 16000074;
    beforeEach(async ()=>{
      let driver = Driver.create();
      await driver.delayMs(1000);
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_BackWithResult_3000
     * @tc.name      : Test backToCallerAbleWithResult when abilityResult is undefined
     * @tc.desc      : Verify that the backToCallerAbleWithResult is invalid when abilityResult is undefined
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_BackWithResult_3000', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_BackWithResult_3000';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

      //onForeground回调
      let onForegroundCallback = async (SecondAbility: UIAbility) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundCallback succ`);
        let callerRequestCode: string = AppStorage.get<string>("callerRequestCode") as string;
        try {
          await SecondAbility.context.backToCallerAbilityWithResult(undefined, callerRequestCode).then(() => {
            hilog.info(0x0000, TAG, 'backToCallerAbilityWithResult succeed');
            expect().assertFail();
          }).catch((err: BusinessError) => {
            hilog.error(0x0000, TAG, `backToCallerAbilityWithResult failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          });
        } catch (err) {
          hilog.error(0x0000, TAG, `backToCallerAbilityWithResult1 failed, code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
        }
        done();
      };

      //设置监听器,监听新ability的生命周期函数
      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        abilityName: abilityName,
        onAbilityForeground: onForegroundCallback
      };
      delegator.addAbilityMonitor(monitor, (async (err, result) => {
        let want: Want = {
          bundleName: 'com.example.backwithresulttest',
          abilityName: abilityName
        };
        let context: common.UIAbilityContext = getContext() as common.UIAbilityContext;
        try {
          await context.startAbilityForResult(want).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            expect().assertFail();
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          });
        } catch (error) {
          expect().assertFail();
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        }
      }));
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_BackWithResult_2900
     * @tc.name      : Test backToCallerAbleWithResult when requestCode is undefined
     * @tc.desc      : Verify that the backToCallerAbleWithResult is invalid when requestCode is undefined
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_BackWithResult_2900', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_BackWithResult_2900';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

      //onForeground回调
      let onForegroundCallback = async (SecondAbility: UIAbility) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundCallback succ`);
        let want: Want = {};
        let resultCode = 100;
        let abilityResult: common.AbilityResult = {
          want,
          resultCode
        };
        try {
          await SecondAbility.context.backToCallerAbilityWithResult(abilityResult, undefined).then(() => {
            hilog.info(0x0000, TAG, 'backToCallerAbilityWithResult succeed');
            expect().assertFail();
          }).catch((err: BusinessError) => {
            hilog.error(0x0000, TAG, `backToCallerAbilityWithResult1 failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          });
        } catch (err) {
          hilog.error(0x0000, TAG, `backToCallerAbilityWithResult1 failed, code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
        }
        done();
      };

      //设置监听器,监听新ability的生命周期函数
      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        abilityName: abilityName,
        onAbilityForeground: onForegroundCallback
      };
      delegator.addAbilityMonitor(monitor, (async (err, result) => {
        let want: Want = {
          bundleName: 'com.example.backwithresulttest',
          abilityName: abilityName
        }
        let context: common.UIAbilityContext = getContext() as common.UIAbilityContext;
        try {
          await context.startAbilityForResult(want).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            expect().assertFail();
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          });
        } catch (error) {
          expect().assertFail();
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        }
      }));
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_BackWithResult_2900
     * @tc.name      : Test backToCallerAbleWithResult when requestCode is undefined
     * @tc.desc      : Verify that the backToCallerAbleWithResult is invalid when requestCode is invalid
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_BackWithResult_2800', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_BackWithResult_2800';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

      //onForeground回调
      let onForegroundCallback = async (SecondAbility: UIAbility) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundCallback succ`);
        let callerRequestCode: string = '23124asjdja';
        let want: Want = {};
        let resultCode = 100;
        let abilityResult: common.AbilityResult = {
          want,
          resultCode
        };
        try {
          await SecondAbility.context.backToCallerAbilityWithResult(abilityResult, callerRequestCode).then(() => {
            hilog.info(0x0000, TAG, 'backToCallerAbilityWithResult succeed');
            expect().assertFail();
          }).catch((err: BusinessError) => {
            hilog.error(0x0000, TAG, `backToCallerAbilityWithResult failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(PARAMETER_ERROR_CODE2);
          });
        } catch (err) {
          hilog.error(0x0000, TAG, `backToCallerAbilityWithResult failed, code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE2);
        }
        done();
      };

      //设置监听器,监听新ability的生命周期函数
      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        abilityName: abilityName,
        onAbilityForeground: onForegroundCallback
      };
      delegator.addAbilityMonitor(monitor, (async (err, result) => {
        let want: Want = {
          bundleName: 'com.example.backwithresulttest',
          abilityName: abilityName
        }
        let context: common.UIAbilityContext = getContext() as common.UIAbilityContext;
        try {
          await context.startAbilityForResult(want).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            expect().assertFail();
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          });
        } catch (error) {
          expect().assertFail();
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        }
      }));
    });
  })
}