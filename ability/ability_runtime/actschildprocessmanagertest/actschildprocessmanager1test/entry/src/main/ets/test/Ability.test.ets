/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
 
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import childProcessManager from '@ohos.app.ability.childProcessManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import NotInheritProcess from '../process/NotInheritProcess';
import AProcess from '../process/AProcess';
import StartInChildProcess from '../process/StartInChildProcess';

export default function abilityTest() {
  describe('StartChildProcessByFork1Test', () => {
    let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    let failedLog = 'Failed to get ChildProcess object';
    let aProcessPath = './ets/process/AProcess.ts';
    let startInChildProcessPath = './ets/process/StartInChildProcess.ts';
    let notInheritProcessPath = './ets/process/NotInheritProcess.ts';
    let startModeSelfFork = 0;

    beforeAll(() => {
    })
    beforeEach(async () => {
      try {
        await abilityDelegator.executeShellCommand('hilog -r');
      } catch (err) {
        console.error("StartChildProcessByFork1Test beforeEach error");
      }
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_ABILITY_StateInfo_StartChildProcess_0100
     * @tc.name   : call startChildProcess to create a child process,give param srcEntry non exist path
     */
    it('StartChildProcess_0100', 0, async (done: Function) => {
      let tag = `StartChildProcess_0100`
      console.log(`${tag}, it begin`);

      try {
        let pid = await childProcessManager.startChildProcess("./ets/process/NonExistProcess.ts", startModeSelfFork);
        console.log(`${tag} startChildProcess success, pid: ${pid}`);
        expect(pid > 0).assertTrue();
      } catch (err) {
        console.error(`${tag} startChildProcess error, errorCode: ${err.code}`);
        expect().assertFail();
        done();
      }

      await sleep(200);
      console.log(`start to grep hilog`);
      let logToGrep = failedLog;
      let cmd = `hilog -x | grep '${logToGrep}'`;
      try {
        let data = await abilityDelegator.executeShellCommand(cmd);
        let res = data.stdResult;
        expect(res).assertContain(logToGrep);
        done();
      } catch (err) {
        console.log(`${tag},grep log err: ${JSON.stringify(err.code)}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_ABILITY_StateInfo_StartChildProcess_0200
     * @tc.name   : call startChildProcess to create a child process,give param srcEntry '2222'
     */
    it('StartChildProcess_0200', 0, async (done: Function) => {
      let tag = `StartChildProcess_0200`
      console.log(`${tag}, it begin`);

      try {
        let pid = await childProcessManager.startChildProcess("2222", startModeSelfFork);
        console.log(`${tag} startChildProcess success, pid: ${pid}`);
        expect(pid > 0).assertTrue();
      } catch (err) {
        console.error(`${tag} startChildProcess error, errorCode: ${err.number}`);
        expect().assertFail();
        done();
      }

      await sleep(200);
      console.log(`start to grep hilog`);
      let logToGrep = failedLog;
      let cmd = `hilog -x | grep '${logToGrep}'`;
      try {
        let data = await abilityDelegator.executeShellCommand(cmd);
        let res = data.stdResult;
        expect(res).assertContain(logToGrep);
        done();
      } catch (err) {
        console.log(`${tag},grep log err: ${JSON.stringify(err.code)}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_ABILITY_StateInfo_StartChildProcess_0300
     * @tc.name   : call startChildProcess to create a child process,give param srcEntry '#$%'
     */
    it('StartChildProcess_0300', 0, async (done: Function) => {
      let tag = `StartChildProcess_0300`
      console.log(`${tag}, it begin`);

      try {
        let pid = await childProcessManager.startChildProcess("#$%", startModeSelfFork);
        console.log(`${tag} startChildProcess success, pid: ${pid}`);
        expect(pid > 0).assertTrue();
      } catch (err) {
        console.error(`${tag} startChildProcess error, errorCode: ${err}`);
        expect().assertFail();
        done();
      }

      await sleep(200);
      console.log(`start to grep hilog`);
      let logToGrep = failedLog;
      let cmd = `hilog -x | grep '${logToGrep}'`;
      try {
        let data = await abilityDelegator.executeShellCommand(cmd);
        let res = data.stdResult;
        expect(res).assertContain(logToGrep);
        done();
      } catch (err) {
        console.log(`${tag},grep log err: ${JSON.stringify(err.code)}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_ABILITY_StateInfo_StartChildProcess_0400
     * @tc.name   : call startChildProcess to create a child process,give param startMode wrong value
     */
    it('StartChildProcess_0400', 0, async (done: Function) => {
      let tag = `StartChildProcess_0400`
      console.log(`${tag}, it begin`);

      try {
        let pid = await childProcessManager.startChildProcess(aProcessPath, 100);
        console.log(`${tag} startChildProcess success, pid: ${pid}`);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`${tag} startChildProcess error, errorCode: ${err.code}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_ABILITY_StateInfo_StartChildProcess_0500
     * @tc.name   : call startChildProcess to create a child process which not inherit @ohos.app.ability.ChildProcess
     */
    it('StartChildProcess_0500', 0, async (done: Function) => {
      let tag = `StartChildProcess_0500`
      console.log(`${tag}, it begin`);

      try {
        let pid = await childProcessManager.startChildProcess(notInheritProcessPath, startModeSelfFork);
        console.log(`${tag} startChildProcess success, pid: ${pid}`);
        expect(pid > 0).assertTrue();
      } catch (err) {
        console.error(`${tag} startChildProcess error, errorCode: ${err.code}`);
        expect().assertFail();
        done();
      }

      await sleep(200);
      let lopGrep = NotInheritProcess.LogGrep;
      let cmd = `hilog -x | grep '${lopGrep}'`;
      try {
        let data = await abilityDelegator.executeShellCommand(cmd);
        let res = data.stdResult;
        expect(res).assertContain(lopGrep);
        done();
      } catch (err) {
        console.log(`${tag},grep log err: ${JSON.stringify(err.code)}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_ABILITY_StateInfo_StartChildProcess_0600
     * @tc.name   : call startChildProcess to create a child process which inherit @ohos.app.ability.ChildProcess
     */
    it('StartChildProcess_0600', 0, async (done: Function) => {
      let tag = `StartChildProcess_0600`
      console.log(`${tag}, it begin`);

      try {
        let pid = await childProcessManager.startChildProcess(aProcessPath, startModeSelfFork);
        console.log(`${tag} startChildProcess success, pid: ${pid}`);
        expect(pid > 0).assertTrue();
      } catch (err) {
        console.error(`${tag} startChildProcess error, errorCode: ${err.code}`);
        expect().assertFail();
        done();
      }

      await sleep(200);
      let lopGrep = AProcess.LogGrep;
      let cmd = `hilog -x | grep '${lopGrep}'`;
      try {
        let data = await abilityDelegator.executeShellCommand(cmd);
        let res = data.stdResult;
        expect(res).assertContain(lopGrep);
        done();
      } catch (err) {
        console.log(`${tag},grep log err: ${JSON.stringify(err.code)}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_ABILITY_StateInfo_StartChildProcess_0700
     * @tc.name   : call startChildProcess to create a child process, in child process call startChildProcess again
     */
    it('StartChildProcess_0700', 0, async (done: Function) => {
      let tag = `StartChildProcess_0700`
      console.log(`${tag}, it begin`);

      try {
        let pid = await childProcessManager.startChildProcess(startInChildProcessPath, startModeSelfFork);
        console.log(`${tag} startChildProcess success, pid: ${pid}`);
        expect(pid > 0).assertTrue();
      } catch (err) {
        console.error(`${tag} startChildProcess error, errorCode: ${err.code}`);
        expect().assertFail();
        done();
      }

      await sleep(200);
      let lopGrep = StartInChildProcess.LogGrep;
      let cmd = `hilog -x | grep '${lopGrep}'`;
      try {
        let data = await abilityDelegator.executeShellCommand(cmd);
        let res = data.stdResult;
        expect(res).assertContain(lopGrep);
        done();
      } catch (err) {
        console.log(`${tag},grep log err: ${JSON.stringify(err.code)}`);
        expect().assertFail();
        done();
      }
    });

    /*
    * @tc.number : SUB_Ability_AbilityRuntime_ABILITY_StateInfo_StartChildProcess_0800
    * @tc.name   : call startChildProcess to create multi child process
    */
    it('StartChildProcess_0800', 0, async (done: Function) => {
      let tag = `StartChildProcess_0800`
      console.log(`${tag}, it begin`);

      for (let i = 0;i < 5; i++) {
        try {
          let pid = await childProcessManager.startChildProcess(aProcessPath, startModeSelfFork);
          console.log(`${tag} startChildProcess success, pid: ${pid}`);
          expect(pid > 0).assertTrue();
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err.code}`);
          expect().assertFail();
          done();
        }

        await sleep(200);
        let lopGrep = AProcess.LogGrep;
        let cmd = `hilog -x | grep '${lopGrep}'`;
        try {
          let data = await abilityDelegator.executeShellCommand(cmd);
          let res = data.stdResult;
          expect(res).assertContain(lopGrep);
        } catch (err) {
          console.log(`${tag},grep log err: ${JSON.stringify(err.code)}`);
          expect().assertFail();
          done();
        }
        try {
          await abilityDelegator.executeShellCommand('hilog -r');
        } catch (err) {
          console.error("StartChildProcess_0800 start multi process await hilog -r error");
          expect().assertFail();
        }
      }
      done();
    });


    /*
     * @tc.number : SUB_Ability_AbilityRuntime_ABILITY_StateInfo_StartChildProcess_1000
     * @tc.name   : call startChildProcess to create a child process when multi process model config true
     */
    it('StartChildProcess_1000', 0, async (done: Function) => {
      let tag = `StartChildProcess_1000`
      console.log(`${tag}, it begin`);

      try {
        let pid = await childProcessManager.startChildProcess(aProcessPath, startModeSelfFork);
        console.log(`${tag} startChildProcess success, pid: ${pid}`);
        expect(pid > 0).assertTrue();
      } catch (err) {
        console.error(`${tag} startChildProcess error, errorCode: ${err.code}`);
        expect().assertFail();
        done();
      }

      await sleep(200);
      let lopGrep = AProcess.LogGrep;
      let cmd = `hilog -x | grep '${lopGrep}'`;
      try {
        let data = await abilityDelegator.executeShellCommand(cmd);
        let res = data.stdResult;
        expect(res).assertContain(lopGrep);
        done();
      } catch (err) {
        console.log(`${tag},grep log err: ${JSON.stringify(err.code)}`);
        expect().assertFail();
        done();
      }
    });

  });
}

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve(null);
    }, time)
  });
}