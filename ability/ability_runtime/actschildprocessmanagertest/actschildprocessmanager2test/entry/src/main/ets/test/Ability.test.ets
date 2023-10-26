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

export default function abilityTest2() {
  describe('StartChildProcessByFork2Test', () => {
    let aProcessPath = './ets/process/AProcess.ts';
    let startModeSelfFork = 0;

    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_ABILITY_StateInfo_StartChildProcess_0900
     * @tc.name   : call startChildProcess to create a child process when multi process model config false
     */
    it('StartChildProcess_0900', 0, async (done: Function) => {
      let tag = `StartChildProcess_0900`
      console.log(`${tag}, it begin`);

      try {
        let pid = await childProcessManager.startChildProcess(aProcessPath, startModeSelfFork);
        console.log(`${tag} startChildProcess success, pid: ${pid}`);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`${tag} startChildProcess error, errorCode: ${err.code}`);
        expect(err.code).assertEqual(16000061);
        done();
      }
    });

  });
}