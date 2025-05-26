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
    'ACTS_TEST_BACK',
    'ACTS_LIFE_CYCLE',
    'ability01_onCreate',
    'ability01_onDestroy',
    'ability01_onWindowStageCreate',
    'ability01_onWindowStageDestroy',
    'ability01_onForeground',
    'ability01_onBackground',
    'ability02_onForeground',
    'ability03_onCreate',
    'ability03_onWindowStageCreate',
    'ability03_onForeground',
    'ability03_onBackground',
    'entryAbility4_onCreate',
    'entryAbility4_onWindowStageCreate',
    'entryAbility4_onForeground_01',
    'entryAbility4_onForeground_02',
    'entryAbility4_onBackground_01',
    'entryAbility4_onBackground_02'
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
     * @tc.name   : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_0500
     * @tc.desc   : Implicit initiation ability
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_0500', Level.LEVEL0, async (done: Function) => {
      let tag:string = "SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_0500"
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag} start`);
      globalThis.testNum01 = 0
      let wantWithAction: Want = {
        deviceId: '',
        bundleName: 'com.example.mytest1',
        action:'abc'
      };
      let abilityResult:common.AbilityResult | undefined = undefined
      let want: Want = {
        deviceId: '',
        bundleName: 'com.example.mytest1',
        abilityName: 'startAbilityForResult01',
        action:'abc'
      };
      let a:number = 0;
      let b:number = 0;
      let c:number = 0;
      let d:number = 0;
      let e:number = 0;
      let f:number = 0;
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              expect(globalThis.testNum01).assertEqual(6)
              expect(a).assertEqual(1)
              expect(b).assertEqual(2)
              expect(c).assertEqual(3)
              expect(d).assertEqual(4)
              expect(e).assertEqual(5)
              expect(f).assertEqual(6)
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success with status: ${data.event}`)
            if (data.event == 'ability01_onCreate') {
              a = 1;
            }
            if (data.event == 'ability01_onDestroy') {
              b = 2;
            }
            if (data.event == 'ability01_onWindowStageCreate') {
              c = 3;
            }
            if (data.event == 'ability01_onWindowStageDestroy') {
              d = 4;
            }
            if (data.event == 'ability01_onForeground') {
              e = 5;
            }
            if (data.event == 'ability01_onBackground') {
              f = 6;
            }
            if (data.event == 'ACTS_TEST_START') {
              setTimeout(() => {
                try {
                  context.startAbilityForResult(wantWithAction, (err: BusinessError, result: common.AbilityResult) => {
                    if (err.code) {
                      // 处理业务逻辑错误
                      hilog.info(0x0000, 'testTag', '%{public}s', `startAbilityForResult failed, error.code: ${err.code}, error.message: ${err.message}`);
                      return;
                    }
                    // 执行正常业务
                    hilog.info(0x0000, 'testTag', '%{public}s', 'startAbilityForResult success test.ets!');
                    hilog.info(0x0000, 'testTag', '%{public}s', `startAbilityForResult success result is: ${result}`);
                    hilog.info(0x0000, 'testTag', '%{public}s', `startAbilityForResult success result is: ${JSON.stringify(result)}`);
                    abilityResult = result
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
     * @tc.name   : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000
     * @tc.desc   : For different applications, using startAbilityForResult to launch the ability.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000', Level.LEVEL0, async (done: Function) => {
      let tag:string = "SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000"
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag} start`);
      let testNum02:number = 0
      let a:number = 0;
      let b:number = 0;
      let c:number = 0;
      let d:number = 0;
      let e:number = 0;
      let f:number = 0;
      let g:number = 0;
      let h:number = 0;
      let i:number = 0;
      let j:number = 0;
      let k:number = 0;
      let want: Want = {
        bundleName: 'com.example.mytest1',
        abilityName:'startAbilityForResult02'
      };
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            hilog.info(0x0000, 'testTag', '%{public}s', `${tag} testNum02 is: ${testNum02}`);
            setTimeout(async () => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              expect(a).assertEqual(1)
              expect(b).assertEqual(2)
              expect(c).assertEqual(3)
              expect(d).assertEqual(4)
              expect(e).assertEqual(5)
              expect(f).assertEqual(6)
              expect(g).assertEqual(7)
              expect(h).assertEqual(8)
              expect(i).assertEqual(9)
              expect(j).assertEqual(10)
              expect(k).assertEqual(11)
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success with status: ${data.event}`)
            if (data.event == 'ACTS_LIFE_CYCLE') {
              testNum02++
            }
            if (data.event == 'ability02_onForeground') {
              a = 1;
            }
            if (data.event == 'ability03_onCreate') {
              b = 2;
            }
            if (data.event == 'ability03_onWindowStageCreate') {
              c = 3;
            }
            if (data.event == 'ability03_onForeground') {
              d = 4;
            }
            if (data.event == 'ability03_onBackground') {
              e = 5;
            }
            if (data.event == 'entryAbility4_onCreate') {
              f = 6;
            }
            if (data.event == 'entryAbility4_onWindowStageCreate') {
              g = 7;
            }
            if (data.event == 'entryAbility4_onForeground_01') {
              h = 8;
            }
            if (data.event == 'entryAbility4_onForeground_02') {
              i = 9;
            }
            if (data.event == 'entryAbility4_onBackground_01') {
              j = 10;
            }
            if (data.event == 'entryAbility4_onBackground_02') {
              k = 11;
            }
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