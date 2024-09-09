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
import { describe, afterEach, it, expect } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { common, UIAbility } from '@kit.AbilityKit';

export default function BackWithResultTest() {
  describe('BackWithResultTest', () => {

    let delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityName = 'SecondAbility';

    const TAG: string = 'BackToCallerAbilityWithResult';
    const TEST_SUITE_NAME: string = 'BackToCallerAbilityWithResultTest';
    const PARAMETER_ERROR_CODE  = 401
    const PARAMETER_ERROR_CODE2  = 16000074

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_BackWithResult_3000
     * @tc.name      : Configure bundleName, activityName, and flags, where flags are non numeric strings
     * @tc.desc      : Call the startAbility interface through context, where the wantAbilityName
     *                 and bundleName are the correct values,the flag is a string, and the string is a non numeric value
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
          await SecondAbility.context.backToCallerAbilityWithResult(null, callerRequestCode)
            .then(() => {
              hilog.info(0x0000, TAG, 'backToCallerAbilityWithResult succeed');
              expect().assertFail();
            })
            .catch((err: BusinessError) => {
              hilog.error(0x0000, TAG, `backToCallerAbilityWithResult failed, code is ${err.code}, message is ${err.message}`);
              expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
            });
        } catch (err) {
          hilog.error(0x0000, TAG, `backToCallerAbilityWithResult1 failed, code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
        }
        setTimeout(()=>{
          done();
        },1000)
      }

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
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        }
      }));
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_BackWithResult_2900
     * @tc.name      : Configure bundleName, activityName, and flags, where flags are non numeric strings
     * @tc.desc      : Call the startAbility interface through context, where the wantAbilityName
     *                 and bundleName are the correct values,the flag is a string, and the string is a non numeric value
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
          await SecondAbility.context.backToCallerAbilityWithResult(abilityResult, null)
            .then(() => {
              hilog.info(0x0000, TAG, 'backToCallerAbilityWithResult succeed');
              expect().assertFail();
            })
            .catch((err: BusinessError) => {
              hilog.error(0x0000, TAG, `backToCallerAbilityWithResult1 failed, code is ${err.code}, message is ${err.message}`);
              expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
            });
        } catch (err) {
          hilog.error(0x0000, TAG, `backToCallerAbilityWithResult1 failed, code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
        }
        setTimeout(()=>{
          done();
        },1000)
      }

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
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        }
      }));
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_BackWithResult_2900
     * @tc.name      : Configure bundleName, activityName, and flags, where flags are non numeric strings
     * @tc.desc      : Call the startAbility interface through context, where the wantAbilityName
     *                 and bundleName are the correct values,the flag is a string, and the string is a non numeric value
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
          await SecondAbility.context.backToCallerAbilityWithResult(abilityResult, callerRequestCode)
            .then(() => {
              hilog.info(0x0000, TAG, 'backToCallerAbilityWithResult succeed');
              expect().assertFail();
            })
            .catch((err: BusinessError) => {
              hilog.error(0x0000, TAG, `backToCallerAbilityWithResult failed, code is ${err.code}, message is ${err.message}`);
              expect(err.code).assertEqual(PARAMETER_ERROR_CODE2);
            });
        } catch (err) {
          hilog.error(0x0000, TAG, `backToCallerAbilityWithResult failed, code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE2);
        }
        done();
      }

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
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        }
      }));
    });
  })
}