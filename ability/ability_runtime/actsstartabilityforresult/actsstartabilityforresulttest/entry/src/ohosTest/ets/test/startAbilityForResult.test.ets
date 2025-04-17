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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { router } from '@kit.ArkUI';

let context = getContext(this) as common.UIAbilityContext;
let ACTS_EVENT: commonEventManager.CommonEventSubscribeInfo = {
  events: [
    'ACTS_TEST_START',
    'ACTS_TEST_DESTROY',
    'ACTS_TEST_BACK'
  ]
};

let subscriber: commonEventManager.CommonEventSubscriber;

let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function startAbilityForResultTwoTest() {
  describe('startAbilityForResultTwoTest', () => {

    beforeAll(() => {
      context = globalThis.context;
    })
    beforeEach(() => {
    })
    afterEach(async () => {
      await sleep(500);
    })
    afterAll(() => {
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_0500
     * @tc.name   : Implicit initiation ability
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_0500', Level.LEVEL0, async (done: Function) => {
      let tag:string = "SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_0500"
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag} start`);
      let want: Want = {
        deviceId: '',
        bundleName: 'com.example.mytest1',
        action:'abc'
      };
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success`)
            if (data.event == 'ACTS_TEST_START') {
              setTimeout(() => {
                try {
                  context.startAbilityForResult(want, (err: BusinessError, result: common.AbilityResult) => {
                    if (err.code) {
                      // 处理业务逻辑错误
                      hilog.info(0x0000, 'testTag', '%{public}s', `startAbilityForResult failed, error.code: ${err.code}, error.message: ${err.message}`);
                      return;
                    }
                    // 执行正常业务
                    hilog.info(0x0000, 'testTag', '%{public}s', 'startAbilityForResult success test.ets!');
                  });
                } catch (err) {
                  // 处理入参错误异常
                  let code = (err as BusinessError).code;
                  let message = (err as BusinessError).message;
                  hilog.info(0x0000, 'testTag', '%{public}s', `startAbilityForResult failed, error.code: ${code}, error.message: ${message}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              let want: Want = {
                deviceId: '',
                bundleName: 'com.example.mytest1',
                abilityName: 'startAbilityForResult01',
                action:'abc'
              };
              let resultCode = 100;
              let abilityResult: common.AbilityResult = {
                want,
                resultCode
              };
              try {
                globalThis.uiAbilityContext1.terminateSelfWithResult(abilityResult, (err: BusinessError) => {
                  if (err.code) {
                    // 处理业务逻辑错误
                    hilog.info(0x0000, 'testTag', '%{public}s', `terminateSelfWithResult failed, error.code: ${err.code}, error.message: ${err.message}`);
                    return;
                  }
                  // 执行正常业务
                  hilog.info(0x0000, 'testTag', '%{public}s', 'terminateSelfWithResult success!');
                  setTimeout(() => {
                    commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
                  }, 500);
                });
              } catch (err) {
                // 处理入参错误异常
                let code = (err as BusinessError).code;
                let message = (err as BusinessError).message;
                hilog.info(0x0000, 'testTag', '%{public}s', `startAbilityForResult failed, error.code: ${code}, error.message: ${message}`);
              }
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START', publishCB);
          }, 100)
        })
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000
     * @tc.name   : For different applications, using startAbilityForResult to launch the ability.
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000', Level.LEVEL0, async (done: Function) => {
      let tag:string = "SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000"
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag} start`);
      let want: Want = {
        bundleName: 'com.example.mytest1',
        abilityName:'startAbilityForResult02'
      };
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success`)
            if (data.event == 'ACTS_TEST_START') {
              setTimeout(() => {
                try {
                  context.startAbilityForResult(want, (err: BusinessError, result: common.AbilityResult) => {
                    if (err.code) {
                      // 处理业务逻辑错误
                      hilog.info(0x0000, 'testTag', '%{public}s', `startAbilityForResult failed, error.code: ${err.code}, error.message: ${err.message}`);
                      return;
                    }
                    // 执行正常业务
                    hilog.info(0x0000, 'testTag', '%{public}s', 'startAbilityForResult success test.ets!');
                  });
                } catch (err) {
                  // 处理入参错误异常
                  let code = (err as BusinessError).code;
                  let message = (err as BusinessError).message;
                  hilog.info(0x0000, 'testTag', '%{public}s', `startAbilityForResult failed, error.code: ${code}, error.message: ${message}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_BACK') {
              try{
                router.back();
                hilog.info(0x0000, 'testTag', '%{public}s', 'router.back success!');
              } catch (err){
                let code = (err as BusinessError).code;
                let message = (err as BusinessError).message;
                hilog.info(0x0000, 'testTag', '%{public}s', `router.back failed, error.code: ${code}, error.message: ${message}`);
              }
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              globalThis.uiAbilityContext2.terminateSelf()
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START', publishCB);
          }, 100)
        })
    });
  })
}

function publishCB(err: BusinessError) {
  if (err) {
    hilog.error(0x0000, 'testTag', `Failed to publish common event. Code is ${err.code}, message is ${err.message}`);
  } else {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Succeeded in publishing common event.');
  }
}