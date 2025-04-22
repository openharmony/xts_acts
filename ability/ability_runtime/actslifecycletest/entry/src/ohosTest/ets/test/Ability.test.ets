import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}
let TestAbilityContext:common.UIAbilityContext;
export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      TestAbilityContext = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0100
     * @tc.name: SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0100
     * @tc.desc: Verify that the ability exit is abnormal, and the onWindowStageWillDestory lifecycle will not be called
     */
    it('SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0100', Level.LEVEL0, async (done:Function) => {
      let TAG = "SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0100"
      let startWant: Want = {
        bundleName: 'com.test.actslifecycletest',
        abilityName: "MainAbility1",
      };
      try {
        globalThis.context.startAbility(startWant).then(() => {
          console.log(TAG,'startAbility success');
        }).catch((error: BusinessError) => {
          console.log(TAG,'startAbility error', JSON.stringify(error));
          expect(error.code).assertEqual(0)
        })
        await sleep(1000);
        let cmd = "hilog -x -e MainAbility1";
        let flag: boolean = true;
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        await sleep(1000);
        abilityDelegator.executeShellCommand(cmd, (err: BusinessError, data: abilityDelegatorRegistry.ShellCmdResult) => {
          hilog.info(0x0000, TAG, "[%{public}s] ExecuteShellCommand succeed. ShellCmdResult: %{public}s", TAG, JSON.stringify(data));
          flag = (data.stdResult.includes("MainAbility1 onWindowStageWillDestroy"))
          console.log(TAG,"the flag=",flag)
        })
        await sleep(1000);
        hilog.info(0x0000, TAG, "[%{public}s] flag: %{public}s", TAG, JSON.stringify(flag));
        expect(flag).assertEqual(true);
        done();
      } catch (err) {
        console.log(TAG,'try failed', JSON.stringify(err.code));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0500
     * @tc.name: SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0500
     * @tc.desc: Verify that the app can exit gracefully when the lifecycle times out
     */
    it('SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0500', Level.LEVEL0, async (done:Function) => {
      let TAG = "SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0500"
      let startWant: Want = {
        bundleName: 'com.test.actslifecycletest',
        abilityName: "MainAbility5",
      };
      try {
        globalThis.context.startAbility(startWant).then(() => {
          console.log(TAG,'startAbility success');
        }).catch((error: BusinessError) => {
          console.log(TAG,'startAbility error', JSON.stringify(error));
        })
        await sleep(500)
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let cmd1 = 'ps -ef |grep "com.test.actslifecycletest.ability.life';
        abilityDelegator.executeShellCommand(cmd1, (err : BusinessError, data: abilityDelegatorRegistry.ShellCmdResult) => {
          console.info('executeShellCommand1 callback');
          console.log('Command result data:', data);
        });
        await sleep(500)
        let cmd2 ="kill -9"
        abilityDelegator.executeShellCommand(cmd2, (err : BusinessError, data: abilityDelegatorRegistry.ShellCmdResult) => {
          console.info('executeShellCommand2 callback');
        });
        let cmd = "hilog -x -e MainAbility5";
        let flag: boolean = true;
        await sleep(1000);
        abilityDelegator.executeShellCommand(cmd, (err: BusinessError, data: abilityDelegatorRegistry.ShellCmdResult) => {
          hilog.info(0x0000, TAG, "[%{public}s] ExecuteShellCommand succeed. ShellCmdResult: %{public}s", TAG, JSON.stringify(data));
          flag = !(data.stdResult.includes("MainAbility5 onWindowStageDestroy"))
          console.log(TAG,"the flag=",flag)
        })
        await sleep(1000);
        hilog.info(0x0000, TAG, "[%{public}s] flag: %{public}s", TAG, JSON.stringify(flag));
        expect(flag).assertEqual(true);
        done();
      } catch (err) {
        console.log(TAG,'try failed', JSON.stringify(err.code));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0600
     * @tc.name: SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0600
     * @tc.desc: Verify that the ability exit is abnormal, and the onWindowStageWillDestory lifecycle will not be called
     */
    it('SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0600', Level.LEVEL0, async (done:Function) => {
      let TAG = "SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0600"
      let startWant: Want = {
        bundleName: 'com.test.actslifecycletest',
        abilityName: "MainAbility2",
      };
      try {
        globalThis.context.startAbility(startWant).then(() => {
          console.log(TAG,'startAbility success');
        }).catch((error: BusinessError) => {
          console.log(TAG,'startAbility error', JSON.stringify(error));
        })
        let cmd = "hilog -x -e MainAbility2";
        let flag: boolean = true;
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        await sleep(1000);
        abilityDelegator.executeShellCommand(cmd, (err: BusinessError, data: abilityDelegatorRegistry.ShellCmdResult) => {
          hilog.info(0x0000, TAG, "[%{public}s] ExecuteShellCommand succeed. ShellCmdResult: %{public}s", TAG, JSON.stringify(data));
          flag = !(data.stdResult.includes("MainAbility2 onWindowStageWillDestroy"))
          console.log("the flag=",flag)
        })
        await sleep(1000);
        hilog.info(0x0000, TAG, "[%{public}s] flag: %{public}s", TAG, JSON.stringify(flag));
        expect(flag).assertEqual(true);
        done();
      } catch (err) {
        console.log(TAG,'try failed', JSON.stringify(err.code));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0700
     * @tc.name: SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0700
     * @tc.desc: restartApp does not call back the onWindowStageWillDestory lifecycle
     */
    it('SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0700', Level.LEVEL0, async (done:Function) => {
      let TAG = "SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0700"
      let startWant: Want = {
        bundleName: 'com.test.actslifecycletest',
        abilityName: "MainAbility3",
      };
      try {
        globalThis.context.startAbility(startWant).then(() => {
          console.log(TAG,'startAbility success');
        }).catch((error: BusinessError) => {
          console.log(TAG,'startAbility error', JSON.stringify(error));
        })
        let cmd = "hilog -x -e MainAbility3";
        let flag: boolean = true;
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        await sleep(1000);
        abilityDelegator.executeShellCommand(cmd, (err: BusinessError, data: abilityDelegatorRegistry.ShellCmdResult) => {
          hilog.info(0x0000, TAG, "[%{public}s] ExecuteShellCommand succeed. ShellCmdResult: %{public}s", TAG, JSON.stringify(data));
          flag = !(data.stdResult.includes("MainAbility3 onWindowStageWillDestroy"))
          console.log("the flag=",flag)
        })
        await sleep(1000);
        hilog.info(0x0000, TAG, "[%{public}s] flag: %{public}s", TAG, JSON.stringify(flag));
        expect(flag).assertEqual(true);
        done();
      } catch (err) {
        console.log(TAG,'try failed', JSON.stringify(err.code));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0400
     * @tc.name: SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0400
     * @tc.desc: Verify that only the ability is closed when the callback onWindowStageWillDestory is called
     */
    it('SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0400', Level.LEVEL0, async (done:Function) => {
      let TAG = "SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0400"
      let startWant: Want = {
        bundleName: 'com.test.actslifecycletest',
        abilityName: "MainAbility1",
      };
      try {
        globalThis.context.startAbility(startWant).then(() => {
          console.log(TAG,'startAbility01 success');
        }).catch((error: BusinessError) => {
          console.log(TAG,'startAbility01 error', JSON.stringify(error));
        })
        globalThis.context.startAbility(startWant).then(() => {
          console.log(TAG,'startAbility02 success');
        }).catch((error: BusinessError) => {
          console.log(TAG,'startAbility02 error', JSON.stringify(error));
        })
        await sleep(1000);
        let cmd = "hilog -x -e MainAbility1";
        let flag: boolean = true;
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        await sleep(1000);
        abilityDelegator.executeShellCommand(cmd, (err: BusinessError, data: abilityDelegatorRegistry.ShellCmdResult) => {
          hilog.info(0x0000, TAG, "[%{public}s] ExecuteShellCommand succeed. ShellCmdResult: %{public}s", TAG, JSON.stringify(data));
          flag = (data.stdResult.includes("MainAbility1 onWindowStageWillDestroy"))
          console.log(TAG,"the flag=",flag)
        })
        await sleep(1000);
        hilog.info(0x0000, TAG, "[%{public}s] flag: %{public}s", TAG, JSON.stringify(flag));
        expect(flag).assertEqual(true);
        done();
      } catch (err) {
        console.log(TAG,'try failed', JSON.stringify(err.code));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_MoveAbilityToBackground_0100
     * @tc.name: SUB_Ability_AbilityRuntime_MoveAbilityToBackground_0100
     * @tc.desc: Verify that disabling specified capability calls back the onWindowStageWillDestory lifecycle
     */
    it('SUB_Ability_AbilityRuntime_MoveAbilityToBackground_0100', Level.LEVEL0, async (done:Function) => {
      let TAG = "SUB_Ability_AbilityRuntime_MoveAbilityToBackground_0100"
      let startWant: Want = {
        bundleName: 'com.test.actslifecycletest',
        abilityName: "MainAbility5",
      };
      try {
        globalThis.context.startAbility(startWant).then(() => {
          console.log(TAG,'startAbility01 success');
        }).catch((error: BusinessError) => {
          console.log(TAG,'startAbility01 error', JSON.stringify(error));
        })
        await TestAbilityContext.moveAbilityToBackground().then(() => {
          console.log(TAG,`moveAbilityToBackground01 success.`);
        }).catch((err: BusinessError) => {
          console.log(TAG,`moveAbilityToBackground01 error: ${JSON.stringify(err)}.`);
        });
        await sleep(2000);
        await TestAbilityContext.moveAbilityToBackground().then(() => {
          console.log(TAG,`moveAbilityToBackground02 success.`);
        }).catch((err: BusinessError) => {
          console.log(TAG,`moveAbilityToBackground02 error: ${JSON.stringify(err)}.`);
          expect(err.code).assertEqual(16000065);
          done();
        });
      } catch (err) {
        console.log(TAG,'try failed', JSON.stringify(err.code));
        expect().assertFail();
        done();
      }
    })

  })
}