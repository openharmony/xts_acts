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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError, Callback } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let sleep = (time: number): Promise<number> => {
  return new Promise((resolve) => setTimeout(resolve, time));
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /*
     * @tc.number: ACTS_aaSupportDebugWithWaiting_0100
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa in developer mode supports temporarily setting DEBUG application waiting debugging mode and
     * can obtain setting information.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('ACTS_aaDebug_0100', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = ' aa appdebug -b com.acts.bundleNameA';
      let cmd2 = 'aa appdebug -g';
      await abilityDelegator.executeShellCommand(cmd).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaDebug_0100] data.stdResult1: ' + d.stdResult);
        console.info('====> [ACTS_aaDebug_0100] data.exitCode1: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaDebug_0200] err1: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmd2).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaDebug_0100] data.stdResult: ' + JSON.stringify(d.stdResult));
        console.info('====> [ACTS_aaDebug_0100] data.exitCode: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaDebug_0100] data.exitCode: ' + result[1]);
        let result1 = result[1].split(',');
        console.info('====> [ACTS_aaDebug_0100] data.exitCode: ' + result1[0]);

        expect(result1[0].trim()).assertEqual('com.acts.bundleNameA');
        expect(result[2].trim()).assertEqual('false');
        done();

      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaDebug_0100] err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: ACTS_aaSupportDebugWithWaiting_0300
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa supports persistent setting in developer mode. DEBUG application waits for debugging mode and
     * can obtain setting information.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('ACTS_aaDebug_0300', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = ' aa appdebug -b com.acts.bundleNameA -p';
      let cmd2 = 'aa appdebug -g';
      await abilityDelegator.executeShellCommand(cmd).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaDebug_0300] data.stdResult: ' + d.stdResult);
        console.info('====> [ACTS_aaDebug_0300] data.exitCode: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaDebug_0300] err: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmd2).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaDebug_0300] data.stdResult: ' + JSON.stringify(d.stdResult));
        console.info('====> [ACTS_aaDebug_0300] data.exitCode: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaDebug_0300] data.exitCode: ' + result[1]);
        let result1 = result[1].split(',');
        console.info('====> [ACTS_aaDebug_0300] data.exitCode: ' + result1[0]);

        expect(result1[0].trim()).assertEqual('com.acts.bundleNameA');
        expect(result[2].trim()).assertEqual('true');
        done();

      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaDebug_0300] err2: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: ACTS_aaSupportDebugWithWaiting_0500
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa supports persistent setting in developer mode. DEBUG application waits for debugging mode
     * and the newly set data will overwrite the previous data (persistent setting data will overwrite the temporarily
     * set data).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('ACTS_aaDebug_0500', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmdA = 'aa appdebug -b com.acts.bundleNameA';
      let cmdB = 'aa appdebug -b com.acts.bundleNameB -p';
      let cmd2 = 'aa appdebug -g';
      await abilityDelegator.executeShellCommand(cmdA).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaDebug_0500] data.stdResultA: ' + d.stdResult);
        console.info('====> [ACTS_aaDebug_0500] data.exitCodeA: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaDebug_0300] err: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmdB).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaDebug_0500] data.stdResultB: ' + d.stdResult);
        console.info('====> [ACTS_aaDebug_0500] data.exitCodeB: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaDebug_0500] err: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmd2).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaDebug_0500] data.stdResultGet: ' + JSON.stringify(d.stdResult));
        console.info('====> [ACTS_aaDebug_0500] data.exitCodeGet: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaDebug_0500] data.exitCode: ' + result[1]);
        let result1 = result[1].split(',');
        console.info('====> [ACTS_aaDebug_0500] data.exitCode: ' + result1[0]);

        expect(result1[0].trim()).assertEqual('com.acts.bundleNameB');
        expect(result[2].trim()).assertEqual('true');
        done();

      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaDebug_0500] err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    /*
     * @tc.number: ACTS_aaSupportDebugWithWaiting_0600
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa supports persistent setting in developer mode. DEBUG application waits for debugging mode
     * and the newly set data will overwrite the previous data (the temporarily set data will overwrite the persistent
     * set data).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('ACTS_aaDebug_0600', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmdA = 'aa appdebug -b com.acts.bundleNameA -p';
      let cmdB = 'aa appdebug -b com.acts.bundleNameB';
      let cmd2 = 'aa appdebug -g';
      await abilityDelegator.executeShellCommand(cmdA).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaDebug_0600] data.stdResultA: ' + d.stdResult);
        console.info('====> [ACTS_aaDebug_0600] data.exitCodeA: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaDebug_0600] errA: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmdB).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaDebug_0600] data.stdResultB: ' + d.stdResult);
        console.info('====> [ACTS_aaDebug_0600] data.exitCodeB: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaDebug_0600] errB: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmd2).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaDebug_0600] data.stdResult2: ' + JSON.stringify(d.stdResult));
        console.info('====> [ACTS_aaDebug_0600] data.exitCode3: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaDebug_0600] data.exitCode4: ' + result[1]);
        let result1 = result[1].split(',');
        console.info('====> [ACTS_aaDebug_0600] data.exitCode5: ' + result1[0]);

        expect(result1[0].trim()).assertEqual('com.acts.bundleNameB');
        expect(result[2].trim()).assertEqual('false');
        done();

      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaDebug_0600] err2: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    /*
     * @tc.number: ACTS_aaSupportDebugWithWaiting_0700
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa supports persistent setting in developer mode. DEBUG application waits for debugging mode
     * and the acquisition list is empty after cancellation (temporary setting).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('ACTS_aaDebug_0700', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmdA = 'aa appdebug -b com.acts.bundleNameA';
      let cmdC = 'aa appdebug -c';
      let cmd2 = 'aa appdebug -g';
      await abilityDelegator.executeShellCommand(cmdA).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaDebug_0700] data.stdResultA: ' + d.stdResult);
        console.info('====> [ACTS_aaDebug_0700] data.exitCodeA: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> errA: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmdC).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaDebug_0700] data.stdResultC: ' + d.stdResult);
        console.info('====> [ACTS_aaDebug_0700] data.exitCodeC: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> errC: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmd2).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaDebug_0700] data.stdResultGet: ' + d.stdResult);
        console.info('====> [ACTS_aaDebug_0700] data.exitCodeGet: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaDebug_0700] data.exitCodeGet: ' + result[1]);

        expect(result[1]).assertEqual(undefined);
        done();

      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaDebug_0700] errGet: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    /*
     * @tc.number: ACTS_aaSupportDebugWithWaiting_0800
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa supports persistent setting in developer mode. DEBUG application waits for debugging mode
     * and the acquisition list is empty after cancellation (persistent setting).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('ACTS_aaDebug_0800', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmdA = 'aa appdebug -b com.acts.bundleNameA -p';
      let cmdC = 'aa appdebug -c';
      let cmd2 = 'aa appdebug -g';
      await abilityDelegator.executeShellCommand(cmdA).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaDebug_0800] data.stdResultA: ' + d.stdResult);
        console.info('====> [ACTS_aaDebug_0800] data.exitCodeA: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> errA: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmdC).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaDebug_0800] data.stdResultC: ' + d.stdResult);
        console.info('====> [ACTS_aaDebug_0800] data.exitCodeC: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> errC: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmd2).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaDebug_0800] data.stdResultGet: ' + d.stdResult);
        console.info('====> [ACTS_aaDebug_0800] data.exitCodeGet: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaDebug_0800] data.exitCodeGet: ' + result[1]);

        expect(result[1]).assertEqual(undefined);
        done();

      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaDebug_0800] errGet: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
  })
}