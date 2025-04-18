/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { application, common } from '@kit.AbilityKit';
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import { Driver, ON ,Component } from '@kit.TestKit';

let context = getContext(this) as common.UIAbilityContext;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function abilityTest() {
  describe('ActsRestartAppTest', () => {
    beforeAll(() => {
      context = globalThis.context;
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_restartApp_0100
     * @tc.name   : The parameter 'abilityName' is not Uiability, and calling the RestartApp interface returns 16000063
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_restartApp_0100', 0, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_restartApp_0100';
      let want: Want = {
        bundleName: 'com.test.actsrestartapptest',
        abilityName: 'Ability001'
      };
      context.startAbility(want, (err: BusinessError) => {
        if(err.code) {
          console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
        }
        console.info(`${caseName} Succeed to startAbility.`);
      });
      let cmd = "hilog -x -e SUB_Ability_AbilityRuntime_restartApp_0100";
      let isRestartApp: boolean = false;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await sleep(1000);
      abilityDelegator.executeShellCommand(cmd, (err: BusinessError, data: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info(`${caseName} ExecuteShellCommand succeed. ShellCmdResult: ${JSON.stringify(data)}`);
        isRestartApp = data.stdResult.includes('16000063');
        console.info(`${caseName} the isRestartApp is ${isRestartApp}`);
      })
      await sleep(1000);
      expect(isRestartApp).assertEqual(true);
      done();
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_restartApp_0200
     * @tc.name   : The parameter 'abilityName' is "", and calling the RestartApp interface returns 401
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_restartApp_0200', 0, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_restartApp_0200';
      let want: Want = {
        bundleName: 'com.test.actsrestartapptest',
        abilityName: 'Ability002'
      };
      context.startAbility(want, (err: BusinessError) => {
        if(err.code) {
          console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
        }
        console.info(`${caseName} Succeed to startAbility.`);
      });
      let cmd = "hilog -x -e SUB_Ability_AbilityRuntime_restartApp_0200";
      let isRestartApp: boolean = false;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await sleep(1000);
      abilityDelegator.executeShellCommand(cmd, (err: BusinessError, data: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info(`${caseName} ExecuteShellCommand succeed. ShellCmdResult: ${JSON.stringify(data)}`);
        isRestartApp = data.stdResult.includes('401');
        console.info(`${caseName} the isRestartApp is ${isRestartApp}`);
      })
      await sleep(1000);
      expect(isRestartApp).assertEqual(true);
      done();
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_restartApp_0300
     * @tc.name   : The parameter 'abilityName' is an illegal value. Calling the RestartApp interface returns 16000063
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_restartApp_0300', 0, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_restartApp_0300';
      let want: Want = {
        bundleName: 'com.test.actsrestartapptest',
        abilityName: 'Ability003'
      };
      context.startAbility(want, (err: BusinessError) => {
        if(err.code) {
          console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
        }
        console.info(`${caseName} Succeed to startAbility.`);
      });
      let cmd = "hilog -x -e SUB_Ability_AbilityRuntime_restartApp_0300";
      let isRestartApp: boolean = false;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await sleep(1000);
      abilityDelegator.executeShellCommand(cmd, (err: BusinessError, data: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info(`${caseName} ExecuteShellCommand succeed. ShellCmdResult: ${JSON.stringify(data)}`);
        isRestartApp = data.stdResult.includes('16000063');
        console.info(`${caseName} the flag is ${isRestartApp}`);
      })
      await sleep(1000);
      expect(isRestartApp).assertEqual(true);
      done();
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_restartApp_0400
     * @tc.name   : The parameter 'abilityName' is an illegal value. Calling the RestartApp interface returns 16000063
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_restartApp_0400', 0, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_restartApp_0400';
      let want: Want = {
        bundleName: 'com.test.actsrestartapptest',
        abilityName: 'Ability004'
      };
      context.startAbility(want, (err: BusinessError) => {
        if(err.code) {
          console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
        }
        console.info(`${caseName} Succeed to startAbility.`);
      });
      let cmd = "hilog -x -e SUB_Ability_AbilityRuntime_restartApp_0400";
      let isRestartApp: boolean = false;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await sleep(1000);
      abilityDelegator.executeShellCommand(cmd, (err: BusinessError, data: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info(`${caseName} ExecuteShellCommand succeed. ShellCmdResult: ${JSON.stringify(data)}`);
        isRestartApp = data.stdResult.includes('401');
        console.info(`${caseName} the isRestartApp is ${isRestartApp}`);
      })
      await sleep(1000);
      expect(isRestartApp).assertEqual(true);
      done();
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_restartApp_0500
     * @tc.name   : Parameter Want is empty and calling the RestartApp interface returns 401
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_restartApp_0500', 0, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_restartApp_0500';
      let want: Want = {
        bundleName: 'com.test.actsrestartapptest',
        abilityName: 'Ability005'
      };
      context.startAbility(want, (err: BusinessError) => {
        if(err.code) {
          console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
        }
        console.info(`${caseName} Succeed to startAbility.`);
      });
      let cmd = "hilog -x -e SUB_Ability_AbilityRuntime_restartApp_0500";
      let isRestartApp: boolean = false;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await sleep(1000);
      abilityDelegator.executeShellCommand(cmd, (err: BusinessError, data: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info(`${caseName} ExecuteShellCommand succeed. ShellCmdResult: ${JSON.stringify(data)}`);
        isRestartApp = data.stdResult.includes('401');
        console.info(`${caseName} the isRestartApp is ${isRestartApp}`);
      })
      await sleep(1000);
      expect(isRestartApp).assertEqual(true);
      done();
    });
  })
}