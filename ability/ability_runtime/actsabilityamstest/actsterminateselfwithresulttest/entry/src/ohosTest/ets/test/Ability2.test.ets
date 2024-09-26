/*
 * Copyright (C) 2024 HiHope Open Source Organization
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

import { describe, afterEach, it, expect, beforeEach, beforeAll } from '@ohos/hypium'
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { common, StartOptions, UIAbility } from '@kit.AbilityKit';
import { Driver } from '@kit.TestKit';
import { commonEventManager } from '@kit.BasicServicesKit';

export default function abilityTest2() {
  describe('TerminateselfWithResultTest2', () => {

    let delegator = abilityDelegatorRegistry.getAbilityDelegator();
    let bundleName = 'com.example.terminateselfwithresulttesthap';
    let bundleName2 = 'com.example.terminateselfwithresulttesthap2';
    let bundleName3 = 'com.example.actsterminateselfwithresulttest';
    let abilityName = 'EntryAbility';

    const TAG: string = 'TerminateselfWithResult';
    const TEST_SUITE_NAME: string = 'TerminateselfWithResultTest';
    let context: common.UIAbilityContext;
    let driver = Driver.create();
    beforeAll(async (done: Function) => {
      await driver.delayMs(1000);
      context = getContext() as common.UIAbilityContext;
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Succeeded in starting SpecifiedAbility11ww11` + JSON.stringify(context));
      done();
    });
    beforeEach(async () => {
      await driver.delayMs(1000);
      let cmdBeforeEach = 'aa start -d 0 -a TestAbility' + ' -b ' + 'com.example.actsterminateselfwithresulttest';
      await delegator.executeShellCommand(cmdBeforeEach);
      await driver.delayMs(1000);
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4200
     * @tc.name      : Test one ability open two different abilitys and terminateSelfWithResult
     * @tc.desc      : StartAbilityForResult two different abilitys in different haps, then terminateSelfWithResult with want and resultcode
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4200', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4200';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let reburnNumber = 0;
      let event = TEST_CASE_NAME;
      let event2 = TEST_CASE_NAME + '_2';

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event, event2]
      };

      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s', `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          reburnNumber += 1;
          try {
            expect(commonEventData.parameters?.data.onCreate).assertTrue();
            expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
            expect(commonEventData.parameters?.data.onForeground).assertTrue();
            expect(commonEventData.parameters?.data.onBackground).assertTrue();
            expect(commonEventData.parameters?.data.onDestroy).assertTrue();
            expect(commonEventData.parameters?.data.onWindowStageDestroy).assertTrue();
          } catch {
          }
          if (reburnNumber == 2) {
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          }
        });

        let want: Want = {
          bundleName: bundleName,
          abilityName: 'EntryAbility2',
          action: event
        };

        let want2: Want = {
          bundleName: bundleName2,
          abilityName: 'EntryAbility2',
          action: event2
        };

        try {
          context.startAbilityForResult(want).then((result: common.AbilityResult) => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
            try {
              expect(result.resultCode).assertEqual(100);
              expect(result.want?.bundleName).assertEqual(bundleName);
              expect(result.want?.abilityName).assertEqual('EntryAbility2');
            } catch {
            }
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          context.startAbilityForResult(want2).then((result: common.AbilityResult) => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability2 successful,result: ${JSON.stringify(result)}`);
            try {
              expect(result.resultCode).assertEqual(100);
              expect(result.want?.bundleName).assertEqual(bundleName2);
              expect(result.want?.abilityName).assertEqual('EntryAbility2');
            } catch {
            }
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility2 err : ${err}`);
            expect().assertFail();
            done();
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4300
     * @tc.name      : Test one ability open by two different abilitys and terminateSelfWithResult
     * @tc.desc      : StartAbilityForResult by two different abilitys, then terminateSelfWithResult by final one
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4300', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4300';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let reburnNumber = 0;
      let event = TEST_CASE_NAME;
      let event2 = TEST_CASE_NAME + '_2';
      let event3 = 'EntryAbility3';

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event, event2, event3]
      };

      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s', `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            if (commonEventData.event == event) {
              expect(commonEventData.parameters?.data.onCreate).assertTrue();
              expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
              expect(commonEventData.parameters?.data.onForeground).assertTrue();
              expect(commonEventData.parameters?.data.result.want.bundleName).assertEqual(bundleName);
              expect(commonEventData.parameters?.data.result.want.abilityName).assertEqual('EntryAbility4');
              expect(commonEventData.parameters?.data.result.resultCode).assertEqual(100);
            }
            if (commonEventData.event == event2) {
              expect(commonEventData.parameters?.data.onCreate).assertTrue();
              expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
              expect(commonEventData.parameters?.data.onForeground).assertTrue();
            }
            if (commonEventData.event == event3) {
              expect(commonEventData.parameters?.data.onBackground).assertTrue();
              expect(commonEventData.parameters?.data.onDestroy).assertTrue();
              expect(commonEventData.parameters?.data.onWindowStageDestroy).assertTrue();
            }
          } catch {
          }
          reburnNumber += 1;
          if (reburnNumber == 3) {
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          }
        });

        let want: Want = {
          bundleName: bundleName2,
          abilityName: 'EntryAbility3',
          action: event
        };

        let want2: Want = {
          bundleName: bundleName,
          abilityName: 'EntryAbility4',
          action: event2
        };

        try {
          context.startAbilityForResult(want2).then((result: common.AbilityResult) => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability2 successful,result: ${JSON.stringify(result)}`);
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility2 err : ${err}`);
            expect().assertFail();
            done();
          });
          context.startAbilityForResult(want).then((result: common.AbilityResult) => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4600
     * @tc.name      : Test ability1 open ability2 then ability2 terminateSelfWithResult
     * @tc.desc      : Ability1 StartAbilityForResult ability2, then ability2 terminateSelfWithResult with want and resultcode
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4600', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4600';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let event = TEST_CASE_NAME;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event]
      };

      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s', `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            expect(commonEventData.parameters?.data.onBackground).assertTrue();
            expect(commonEventData.parameters?.data.onCreate).assertTrue();
            expect(commonEventData.parameters?.data.onDestroy).assertTrue();
            expect(commonEventData.parameters?.data.onForeground).assertTrue();
            expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
            expect(commonEventData.parameters?.data.onWindowStageDestroy).assertTrue();
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });

        let want: Want = {
          bundleName: bundleName,
          abilityName: 'MainAbility',
          action: event
        };

        try {
          context.startAbilityForResult(want).then((result: common.AbilityResult) => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
            try {
              expect(result.resultCode).assertEqual(100);
              expect(result.want?.bundleName).assertEqual(bundleName);
              expect(result.want?.abilityName).assertEqual('MainAbility');
            } catch {
            }
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4700
     * @tc.name      : Test ability1 open ability2 then ability2 open ability3
     * @tc.desc      : Ability1 StartAbilityForResult ability2, ability2 StartAbilityForResult ability3,then ability2 and ability3 terminateSelfWithResult
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4700', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4700';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let reburnNumber = 0;
      let event = TEST_CASE_NAME;
      let event2 = TEST_CASE_NAME + '_2';

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event, event2]
      };

      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s', `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            expect(commonEventData.parameters?.data.onBackground).assertTrue();
            expect(commonEventData.parameters?.data.onCreate).assertTrue();
            expect(commonEventData.parameters?.data.onDestroy).assertTrue();
            expect(commonEventData.parameters?.data.onForeground).assertTrue();
            expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
            expect(commonEventData.parameters?.data.onWindowStageDestroy).assertTrue();
            if (commonEventData.event == event) {
              expect(commonEventData.parameters?.data.result.resultCode).assertEqual(100);
              expect(commonEventData.parameters?.data.result.want?.bundleName).assertEqual(bundleName);
              expect(commonEventData.parameters?.data.result.want?.abilityName).assertEqual('MainAbility2');
            }
          } catch {
          }
          reburnNumber += 1;
          if (reburnNumber == 2) {
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          }
        });

        let want: Want = {
          bundleName: bundleName2,
          abilityName: 'MainAbility',
          action: event
        };

        try {
          context.startAbilityForResult(want).then((result: common.AbilityResult) => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
            try {
              expect(result.resultCode).assertEqual(100);
              expect(result.want?.bundleName).assertEqual(bundleName2);
              expect(result.want?.abilityName).assertEqual('MainAbility');
            } catch {
            }
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000
     * @tc.name      : Test ability1 open ability2 then ability2 open ability3
     * @tc.desc      : Ability1 StartAbilityForResult ability2, ability2 StartAbilityForResult ability3,then ability2 and ability3 terminateSelf
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let reburnNumber = 0;
      let event = TEST_CASE_NAME;
      let event2 = TEST_CASE_NAME + '_2';
      AppStorage.SetOrCreate<boolean>('TestAbilityOnForeground', false);
      let resultDate: common.AbilityResult = {
        "resultCode": -1,
        "want": {
          "deviceId": "",
          "bundleName": "",
          "abilityName": "",
          "moduleName": "",
          "uri": "",
          "type": "",
          "flags": 0,
          "action": "",
          "parameters": {},
          "entities": []
        }
      };

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event, event2]
      };

      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s', `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            if (commonEventData.event == event) {
              expect(commonEventData.parameters?.data.onBackground).assertTrue();
              expect(commonEventData.parameters?.data.onCreate).assertTrue();
              expect(commonEventData.parameters?.data.onForegroundFirst).assertTrue();
              expect(commonEventData.parameters?.data.onForegroundSecond).assertTrue();
              expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
              expect(JSON.parse(commonEventData.parameters?.data.result)).assertDeepEquals(resultDate);
            }
            if (commonEventData.event == event2) {
              expect(commonEventData.parameters?.data.onCreate).assertTrue();
              expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
              expect(commonEventData.parameters?.data.onForeground).assertTrue();
            }
          } catch {
          }
          reburnNumber += 1;
          if (reburnNumber == 2) {
            commonEventManager.unsubscribe(subscriber, (err, data) => {
            });
          }
        });

        let want: Want = {
          bundleName: bundleName2,
          abilityName: 'MainAbility3',
          action: event
        };

        try {
          context.startAbilityForResult(want).then((result: common.AbilityResult) => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
            try {
              expect(result).assertDeepEquals(resultDate);
            } catch {
            }
            setTimeout(() => {
              let testAbilityOnForeground = AppStorage.get<boolean>('TestAbilityOnForeground');
              try {
                expect(testAbilityOnForeground).assertTrue();
              } catch {
              }
              done();
            }, 1000);
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5100
     * @tc.name      : Test startAbility when WindowMode is 1
     * @tc.desc      : Use startAbility when WindowMode is 1, then check logs
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5100', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5100';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let cmd1 = `hilog -r`;
      await delegator.executeShellCommand(cmd1);
      let cmd2 = `hilog -b D`;
      await delegator.executeShellCommand(cmd2);
      let want: Want = {
        bundleName: bundleName,
        abilityName: 'ThirdAbility'
      };
      let options: StartOptions = {
        windowMode: 1
      };
      try {
        context.startAbility(want, options).then(async () => {
          let cmd = `hilog -x | grep 'Window mode'`;
          let d = await delegator.executeShellCommand(cmd);
          hilog.info(0x0000, TAG, '%{public}s', `executeShellCommand result: ${JSON.stringify(d)}`);
          try {
            expect(d.stdResult).assertContain('Window mode is 1');
          } catch {
          }
          done();
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5200
     * @tc.name      : Test startAbility when WindowMode is 101
     * @tc.desc      : Use startAbility when WindowMode is 101, then check logs
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5200', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5200';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let cmd1 = `hilog -r`;
      await delegator.executeShellCommand(cmd1);
      let cmd2 = `hilog -b D`;
      await delegator.executeShellCommand(cmd2);
      let want: Want = {
        bundleName: bundleName,
        abilityName: 'ThirdAbility'
      };
      let options: StartOptions = {
        windowMode: 101
      };
      try {
        context.startAbility(want, options).then(async () => {
          let cmd = `hilog -x | grep 'Window mode'`;
          let d = await delegator.executeShellCommand(cmd);
          hilog.info(0x0000, TAG, '%{public}s', `executeShellCommand result: ${JSON.stringify(d)}`);
          try {
            expect(d.stdResult).assertContain('Window mode is 101');
          } catch {
          }
          done();
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5300
     * @tc.name      : Test startAbility when WindowMode is 100
     * @tc.desc      : Use startAbility when WindowMode is 100, then check logs
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5300', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5300';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let cmd1 = `hilog -r`;
      await delegator.executeShellCommand(cmd1);
      let cmd2 = `hilog -b D`;
      await delegator.executeShellCommand(cmd2);
      let want: Want = {
        bundleName: bundleName,
        abilityName: 'ThirdAbility'
      };
      let options: StartOptions = {
        windowMode: 100
      };
      try {
        context.startAbility(want, options).then(async () => {
          let cmd = `hilog -x | grep 'Window mode'`;
          let d = await delegator.executeShellCommand(cmd);
          hilog.info(0x0000, TAG, '%{public}s', `executeShellCommand result: ${JSON.stringify(d)}`);
          try {
            expect(d.stdResult).assertContain('Window mode is 100');
          } catch {
          }
          done();
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5400
     * @tc.name      : Test startAbility when WindowMode is 0
     * @tc.desc      : Use startAbility when WindowMode is 0, then check logs
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5400', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5300';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let cmd1 = `hilog -r`;
      await delegator.executeShellCommand(cmd1);
      let cmd2 = `hilog -b D`;
      await delegator.executeShellCommand(cmd2);
      let want: Want = {
        bundleName: bundleName,
        abilityName: 'ThirdAbility'
      };
      let options: StartOptions = {
        windowMode: 0
      };
      try {
        context.startAbility(want, options).then(async () => {
          let cmd = `hilog -x | grep 'Window mode'`;
          let d = await delegator.executeShellCommand(cmd);
          hilog.info(0x0000, TAG, '%{public}s', `executeShellCommand result: ${JSON.stringify(d)}`);
          try {
            expect(d.stdResult).assertContain('Window mode is 0');
          } catch {
          }
          done();
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5500
     * @tc.name      : Test startAbility when WindowMode is 102
     * @tc.desc      : Use startAbility when WindowMode is 102, then check logs
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5500', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5500';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let cmd1 = `hilog -r`;
      await delegator.executeShellCommand(cmd1);
      let cmd2 = `hilog -b D`;
      await delegator.executeShellCommand(cmd2);
      let want: Want = {
        bundleName: bundleName,
        abilityName: 'ThirdAbility'
      };
      let options: StartOptions = {
        windowMode: 102
      };
      try {
        context.startAbility(want, options).then(async () => {
          let cmd = `hilog -x | grep 'Window mode'`;
          let d = await delegator.executeShellCommand(cmd);
          hilog.info(0x0000, TAG, '%{public}s', `executeShellCommand result: ${JSON.stringify(d)}`);
          try {
            expect(d.stdResult).assertContain('Window mode is 102');
          } catch {
          }
          done();
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5600
     * @tc.name      : Test startAbilityForResult when WindowMode is 1
     * @tc.desc      : Use startAbilityForResult when WindowMode is 1, then check logs
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5600', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5600';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let cmd1 = `hilog -r`;
      await delegator.executeShellCommand(cmd1);
      let cmd2 = `hilog -b D`;
      await delegator.executeShellCommand(cmd2);
      let want: Want = {
        bundleName: bundleName,
        abilityName: 'ThirdAbility'
      };
      let options: StartOptions = {
        windowMode: 1
      };
      try {
        context.startAbilityForResult(want, options).then(async () => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
        setTimeout(async () => {
          let cmd = `hilog -x | grep 'Window mode'`;
          let d = await delegator.executeShellCommand(cmd);
          hilog.info(0x0000, TAG, '%{public}s', `executeShellCommand result: ${JSON.stringify(d)}`);
          try {
            expect(d.stdResult).assertContain('Window mode is 1');
          } catch {
          }
          done();
        }, 1000);
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5700
     * @tc.name      : Test startAbilityForResult when WindowMode is 101
     * @tc.desc      : Use startAbilityForResult when WindowMode is 101, then check logs
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5700', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5700';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let cmd1 = `hilog -r`;
      await delegator.executeShellCommand(cmd1);
      let cmd2 = `hilog -b D`;
      await delegator.executeShellCommand(cmd2);
      let want: Want = {
        bundleName: bundleName,
        abilityName: 'ThirdAbility'
      };
      let options: StartOptions = {
        windowMode: 101
      };
      try {
        context.startAbilityForResult(want, options).then(async () => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
        setTimeout(async () => {
          let cmd = `hilog -x | grep 'Window mode'`;
          let d = await delegator.executeShellCommand(cmd);
          hilog.info(0x0000, TAG, '%{public}s', `executeShellCommand result: ${JSON.stringify(d)}`);
          try {
            expect(d.stdResult).assertContain('Window mode is 101');
          } catch {
          }
          done();
        }, 1000);
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5900
     * @tc.name      : Test startAbilityForResult when WindowMode is 100
     * @tc.desc      : Use startAbilityForResult when WindowMode is 100, then check logs
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5900', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5900';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let cmd1 = `hilog -r`;
      await delegator.executeShellCommand(cmd1);
      let cmd2 = `hilog -b D`;
      await delegator.executeShellCommand(cmd2);
      let want: Want = {
        bundleName: bundleName,
        abilityName: 'ThirdAbility'
      };
      let options: StartOptions = {
        windowMode: 100
      };
      try {
        context.startAbilityForResult(want, options).then(async () => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
        setTimeout(async () => {
          let cmd = `hilog -x | grep 'Window mode'`;
          let d = await delegator.executeShellCommand(cmd);
          hilog.info(0x0000, TAG, '%{public}s', `executeShellCommand result: ${JSON.stringify(d)}`);
          try {
            expect(d.stdResult).assertContain('Window mode is 100');
          } catch {
          }
          done();
        }, 1000);
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6000
     * @tc.name      : Test startAbilityForResult when WindowMode is 0
     * @tc.desc      : Use startAbilityForResult when WindowMode is 0, then check logs
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6000', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6000';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let cmd1 = `hilog -r`;
      await delegator.executeShellCommand(cmd1);
      let cmd2 = `hilog -b D`;
      await delegator.executeShellCommand(cmd2);
      let want: Want = {
        bundleName: bundleName,
        abilityName: 'ThirdAbility'
      };
      let options: StartOptions = {
        windowMode: 0
      };
      try {
        context.startAbilityForResult(want, options).then(async () => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
        setTimeout(async () => {
          let cmd = `hilog -x | grep 'Window mode'`;
          let d = await delegator.executeShellCommand(cmd);
          hilog.info(0x0000, TAG, '%{public}s', `executeShellCommand result: ${JSON.stringify(d)}`);
          try {
            expect(d.stdResult).assertContain('Window mode is 0');
          } catch {
          }
          done();
        }, 1000);
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6100
     * @tc.name      : Test startAbilityForResult when WindowMode is 102
     * @tc.desc      : Use startAbilityForResult when WindowMode is 102, then check logs
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6100', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6100';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let cmd1 = `hilog -r`;
      await delegator.executeShellCommand(cmd1);
      let cmd2 = `hilog -b D`;
      await delegator.executeShellCommand(cmd2);
      let want: Want = {
        bundleName: bundleName,
        abilityName: 'ThirdAbility'
      };
      let options: StartOptions = {
        windowMode: 102
      };
      try {
        context.startAbilityForResult(want, options).then(async () => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
        setTimeout(async () => {
          let cmd = `hilog -x | grep 'Window mode'`;
          let d = await delegator.executeShellCommand(cmd);
          hilog.info(0x0000, TAG, '%{public}s', `executeShellCommand result: ${JSON.stringify(d)}`);
          try {
            expect(d.stdResult).assertContain('Window mode is 102');
          } catch {
          }
          done();
        }, 1000);
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6600
     * @tc.name      : Test ability1 open ability2 then ability2 open ability3 in same hap
     * @tc.desc      : In same hap, Ability1 StartAbilityForResult ability2, ability2 StartAbilityForResult ability3,then ability2 and ability3 terminateSelfWithResult
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6600', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6600';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let reburnNumber = 0;
      let event = TEST_CASE_NAME;
      let event2 = TEST_CASE_NAME + '_2';
      let event3 = TEST_CASE_NAME + '_3';

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event, event2, event3]
      };

      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s', `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            if (commonEventData.event == event2 || commonEventData.event == event3) {
              expect(commonEventData.parameters?.data.onBackground).assertTrue();
              expect(commonEventData.parameters?.data.onCreate).assertTrue();
              expect(commonEventData.parameters?.data.onDestroy).assertTrue();
              expect(commonEventData.parameters?.data.onForeground).assertTrue();
              expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
              expect(commonEventData.parameters?.data.onWindowStageDestroy).assertTrue();
            }
            if (commonEventData.event == event || commonEventData.event == event2) {
              expect(commonEventData.parameters?.data.result.resultCode).assertEqual(100);
              expect(commonEventData.parameters?.data.result.want?.bundleName).assertEqual(bundleName2);
              if (commonEventData.event == event) {
                expect(commonEventData.parameters?.data.result.want?.abilityName).assertEqual('SecondAbility');
              } else {
                expect(commonEventData.parameters?.data.result.want?.abilityName).assertEqual('ThirdAbility');
              }
            }
          } catch {
          }
          reburnNumber += 1;
          if (reburnNumber == 3) {
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          }
        });

        let want: Want = {
          bundleName: bundleName2,
          abilityName: 'EntryAbility',
          action: event
        };

        try {
          context.startAbility(want).then(() => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6700
     * @tc.name      : Test ability1 open ability2 then ability2 terminateSelfWithResult in same hap
     * @tc.desc      : In same hap, Ability1 StartAbilityForResult ability2, then ability2 terminateSelfWithResult with want and resultcode
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6700', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6700';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let reburnNumber = 0;
      let event = TEST_CASE_NAME;
      let event2 = TEST_CASE_NAME + '_2';

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event, event2]
      };

      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s', `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            if (commonEventData.event == event2) {
              expect(commonEventData.parameters?.data.onBackground).assertTrue();
              expect(commonEventData.parameters?.data.onCreate).assertTrue();
              expect(commonEventData.parameters?.data.onDestroy).assertTrue();
              expect(commonEventData.parameters?.data.onForeground).assertTrue();
              expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
              expect(commonEventData.parameters?.data.onWindowStageDestroy).assertTrue();
            }
            if (commonEventData.event == event) {
              expect(commonEventData.parameters?.data.result.resultCode).assertEqual(100);
              expect(commonEventData.parameters?.data.result.want?.bundleName).assertEqual(bundleName2);
              expect(commonEventData.parameters?.data.result.want?.abilityName).assertEqual('ThirdAbility');
            }
          } catch {
          }
          reburnNumber += 1;
          if (reburnNumber == 2) {
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          }
        });

        let want: Want = {
          bundleName: bundleName2,
          abilityName: 'MainAbility2',
          action: event
        };

        try {
          context.startAbility(want).then(() => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6800
     * @tc.name      : Test ability1 open ability2 then ability2 terminateSelfWithResult in same app different hap
     * @tc.desc      : In same app different hap, Ability1 StartAbilityForResult ability2, then ability2 terminateSelfWithResult with want and resultcode
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6800', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6800';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let event = TEST_CASE_NAME;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event]
      };

      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s', `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            expect(commonEventData.parameters?.data.onBackground).assertTrue();
            expect(commonEventData.parameters?.data.onCreate).assertTrue();
            expect(commonEventData.parameters?.data.onDestroy).assertTrue();
            expect(commonEventData.parameters?.data.onForeground).assertTrue();
            expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
            expect(commonEventData.parameters?.data.onWindowStageDestroy).assertTrue();
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });

        let want: Want = {
          bundleName: bundleName3,
          abilityName: 'EntryAbility',
          action: event
        };

        try {
          context.startAbilityForResult(want).then((result: common.AbilityResult) => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
            try {
              expect(result.resultCode).assertEqual(100);
              expect(result.want?.bundleName).assertEqual(bundleName3);
              expect(result.want?.abilityName).assertEqual('EntryAbility');
            } catch {
            }
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2400
     * @tc.name      : TerminateSelf startup ability after terminating split screen startup
     * @tc.desc      : Use startAbility when WindowMode is 100, then old abbility terminateSelf
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2300', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2300';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let cmd1 = `hilog -r`;
      await delegator.executeShellCommand(cmd1);
      let cmd2 = `hilog -b D`;
      await delegator.executeShellCommand(cmd2);
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['onDestroyCallback2']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, async (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          try {
            expect(commonEventData.parameters?.data.onBackground).assertTrue();
            expect(commonEventData.parameters?.data.onDestroy).assertTrue();
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
        let want: Want = {
          bundleName: bundleName,
          abilityName: 'FourthAbility'
        };
        try {
          context.startAbility(want).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startability successful`);
          }).catch((err: BusinessError) => {
            expect().assertFail();
            done();
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startablility err : ${err}`);
          });
          setTimeout(async () => {
            let cmd = `hilog -x | grep 'Window mode'`;
            let d = await delegator.executeShellCommand(cmd);
            hilog.info(0x0000, TAG, '%{public}s', `executeShellCommand result: ${JSON.stringify(d)}`);
            try {
              expect(d.stdResult).assertContain('Window mode is 100');
            } catch {
            }
          }, 1000);
        } catch (error) {
          expect().assertFail();
          done();
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startablility fail : ${error}`);
        }
      });
    });

  });
}