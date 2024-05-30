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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import systemparameter from '@ohos.systemParameterEnhance';
import testNapi from 'libentry.so';

let mpEnable : Boolean = systemparameter.getSync('persist.sys.abilityms.multi_process_model', false);
let ncpEnable : Boolean = systemparameter.getSync('persist.sys.abilityms.start_native_child_process', false);

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function nativeChildProcessTest() {
  describe('ActsCapiNativeChildProcessTest', () => {
    /**
     * @tc.number SUB_Ability_AbilityRuntime_NativeStartChildProcess_0100
     * @tc.name testStartNativeChildProcess001
     * @tc.desc To verify the function of creating a subprocess by StartNativeChildProcess
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Ability_AbilityRuntime_NativeStartChildProcess_0100', 0, async (done: Function) => {
      let tag = `ACTS_NativeStartChildProcess_0100`;
      console.log(`${tag}, it begin`);

      try {
        let ret : Number = testNapi.startNativeChildProcess('libentry.so');
        if (!mpEnable) {
          console.info(`${tag}: multi process model disable`);
          expect(16010004).assertEqual(ret);
          done();
          return;
        } else if (!ncpEnable) {
          console.info(`${tag}: Native child process disable`);
          expect(801).assertEqual(ret);
          done();
          return;
        }

        expect(0).assertEqual(ret);

        console.info(`${tag}: Test ipc call for native child process`);
        let a = 123;
        let b = 456;
        expect(a + b).assertEqual(testNapi.childProcessAdd(a, b));
        expect(1).assertEqual(testNapi.requestExitChildProcess());
        await sleep(600);

        console.info(`${tag}: Test restart native child process`);
        expect(0).assertEqual(testNapi.startNativeChildProcess('libentry.so'));
        expect(1).assertEqual(testNapi.requestExitChildProcess());
        await sleep(600);

        done();
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_NativeStartChildProcess_0200
     * @tc.name testStartNativeChildProcess002
     * @tc.desc An error is returned when the libname of a subprocess to be created is an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Ability_AbilityRuntime_NativeStartChildProcess_0200', 0, () => {
      let tag = `ACTS_NativeStartChildProcess_0200`;
      console.log(`${tag}, it begin`);

      try {
        expect(401).assertEqual(testNapi.startNativeChildProcess(''));
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_NativeStartChildProcess_0300
     * @tc.name testStartNativeChildProcess003
     * @tc.desc An error is returned when the vaule of libname is a relative path during the creation of a subprocess
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Ability_AbilityRuntime_NativeStartChildProcess_0300', 0, () => {
      let tag = `ACTS_NativeStartChildProcess_0300`;
      console.log(`${tag}, it begin`);

      try {
        expect(401).assertEqual(testNapi.startNativeChildProcess('../libentry.so'));
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_NativeStartChildProcess_0400
     * @tc.name testStartNativeChildProcess004
     * @tc.desc An error is returned when a subprocess whose libname does not exist is created 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Ability_AbilityRuntime_NativeStartChildProcess_0400', 0, () => {
      let tag = `ACTS_NativeStartChildProcess_0400`;
      console.log(`${tag}, it begin`);

      if (!mpEnable || !ncpEnable) {
        console.info(`${tag}: Native child process disable, skip test`);
        return;
      }

      try {
        expect(16010007).assertEqual(testNapi.startNativeChildProcess('fake.so'));
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      }
    })
  })
}
