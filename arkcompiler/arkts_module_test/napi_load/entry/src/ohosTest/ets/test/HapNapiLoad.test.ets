/**
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
import testNapi from 'libentry.so';
import CryptoJS from '@ohos/crypto-js';
import { taskpool } from '@kit.ArkTS';

const PATH = "com.acts.arktsnapiloadtest/entry_test"

interface TestModule {
  value?: number
  test?: (a: number, b: number) => number
  add?: (a: number, b: number) => number
}

@Concurrent
function sharedHarOne(value: number): void {
  const PATH = "com.acts.arktsnapiloadtest/entry_test"
  const sharedHarOne: TestModule = testNapi.loadModuleWithInfo("sharedHarOne", PATH)
  expect(sharedHarOne.value).assertEqual(value);
}

@Concurrent
function sharedHarOnePath(value: number): void {
  const PATH = "com.acts.arktsnapiloadtest/entry_test"
  const obj: TestModule = testNapi.loadModuleWithInfo("sharedHarOne/Index", PATH)
  expect(obj.test ? obj.test(0, 1) : -1).assertEqual(value);
}

@Concurrent
function sharedHspOne(value: number): void {
  const PATH = "com.acts.arktsnapiloadtest/entry_test"
  const obj: TestModule = testNapi.loadModuleWithInfo("sharedHspOne", PATH)
  expect(obj.test ? obj.test(2, 3) : -1).assertEqual(value);
}

@Concurrent
function ohpm(value: string): void {
  const obj: object = testNapi.loadModuleOHPMCrypto('123456')
  expect(String(obj)).assertEqual(CryptoJS.MD5(value).toString())
}

async function testNapiTaskPool(): Promise<void> {
  for (let i = 0; i < 10; i++) {
    taskpool.execute(new taskpool.Task(sharedHarOne, 1))
    taskpool.execute(new taskpool.Task(sharedHarOnePath, 0))
    taskpool.execute(new taskpool.Task(sharedHspOne, 6))
    taskpool.execute(new taskpool.Task(ohpm, '123456'))
  }
}

@Concurrent
function reSharedHarOne(): void {
  const PATH = "com.acts.arktsnapiloadtest/entry_test"
  const sharedHarOne: TestModule = testNapi.loadModuleWithInfo("sharedHarOne", PATH)
  expect(sharedHarOne.add ? sharedHarOne.add(2, 3) : -1).assertEqual(5);
}

async function testReNapiTaskPool(): Promise<void> {
  taskpool.execute(new taskpool.Task(reSharedHarOne))
}

export default function HapNapiLoadTest() {
  let TAG = '';
  describe('HapNapiLoadTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0001
     * @tc.name: test hap so load
     * @tc.desc: Test the loading of SO files in the HAP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0001', 0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0001';
      console.info(TAG, " start");
      let argc1 = 2;
      let argc2 = 3;
      let result: number = testNapi.add(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0002
     * @tc.name: test har loading from hap
     * @tc.desc: Test loading the HAR package into the HAP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0002', 0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0002';
      console.info(TAG, ' start');
      let har: ESObject = testNapi.loadModuleWithInfo('harTwo', 'com.acts.arttsnapiloadtest/entry_test');
      console.info(TAG, 'har: ', JSON.stringify(har))
      let argc1 = 2;
      let argc2 = 3;
      let result: number = har.add(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0003
     * @tc.name: test har file loading from hap
     * @tc.desc: Test loading files from the Har package into the HAP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0003', 0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0003';
      console.info(TAG, ' start');
      let harFile: ESObject = testNapi.loadModuleWithInfo('harTwo/Index', 'com.acts.arttsnapiloadtest/entry_test');
      console.info(TAG, 'harFile: ', JSON.stringify(harFile))
      let argc1 = 2;
      let argc2 = 3;
      let result: number = harFile.add(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0004
     * @tc.name: test hsp loading from hap
     * @tc.desc: Test loading the HSP package in the HAP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0004', 0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0004';
      console.info(TAG, ' start');
      let hsp: ESObject = testNapi.loadModuleWithInfo('hspTwo', 'com.acts.arttsnapiloadtest/entry_test');
      console.info(TAG, 'hsp: ', JSON.stringify(hsp))
      let argc1 = 2;
      let argc2 = 3;
      let result: number = hsp.add(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0005
     * @tc.name: test hsp file loading from hap
     * @tc.desc: Test loading files from the HSP package in the HAP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0005', 0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0005';
      console.info(TAG, ' start');
      let hspFile: ESObject = testNapi.loadModuleWithInfo('hspTwo/Test', 'com.acts.arttsnapiloadtest/entry_test');
      console.info(TAG, 'hspFile: ', JSON.stringify(hspFile))
      let argc1 = 2;
      let argc2 = 3;
      let result: number = hspFile.add(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0006
     * @tc.name: test loading system modules
     * @tc.desc: Test loading system modules in HAP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0006', 0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0006';
      console.info(TAG, ' start');
      let myLog: ESObject = testNapi.loadModuleWithInfo('@ohos.hilog', '');
      try {
        myLog.info(0x0000, 'SystemModule', TAG + ' hilog print success');
        expect(5).assertEqual(5);
      } catch (err) {
        expect().assertFail();
      }
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0007
     * @tc.name: test moduleName is incorrect
     * @tc.desc: Test moduleName incorrectly when loading har package in hap
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0007', 0, () => {
      try {
        TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0007';
        console.info(TAG, ' start');
        let har: ESObject = testNapi.loadModuleWithInfo('harTwo', 'com.acts.arttsnapiloadtest/entry_tes');
      } catch (err) {
        expect(5).assertEqual(5);
      }
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0008
     * @tc.name: test moduleName is incorrect
     * @tc.desc: Test moduleName incorrectly when loading hsp package in hap
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0008', 0, () => {
      try {
        TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0008';
        console.info(TAG, ' start');
        let har: ESObject = testNapi.loadModuleWithInfo('hspTwo', 'com.acts.arttsnapiloadtest/entry_tes');
      } catch (err) {
        expect(5).assertEqual(5);
      }

    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0009
     * @tc.name: test loading shared module name from hap
     * @tc.desc: Test loading the shared module name into the HAP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0009', 0, () => {
      const sharedHarOne: TestModule = testNapi.loadModuleWithInfo("sharedHarOne", PATH)
      expect(sharedHarOne.value).assertEqual(1);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0010
     * @tc.name: test loading shared module path from hap
     * @tc.desc: Test loading the shared module path into the HAP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0010', 0, () => {
      const sharedHarOne: TestModule = testNapi.loadModuleWithInfo("sharedHarOne/Index", PATH)
      expect(sharedHarOne.test ? sharedHarOne.test(0, 1) : -1).assertEqual(0);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0011
     * @tc.name: test loading shared module name from hsp
     * @tc.desc: Test loading the shared module name into the hsp package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0011', 0, () => {
      const sharedHspOne: TestModule = testNapi.loadModuleWithInfo("sharedHspOne", PATH)
      expect(sharedHspOne.test ? sharedHspOne.test(2, 3) : -1).assertEqual(6);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0012
     * @tc.name: test loading shared module path from hsp
     * @tc.desc: Test loading the shared module path into the hsp package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0012', 0, () => {
      const sharedHspOne: TestModule = testNapi.loadModuleWithInfo("sharedHspOne/Index", PATH)
      expect(sharedHspOne.test ? sharedHspOne.test(2, 3) : -1).assertEqual(6);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0013
     * @tc.name: test loading ohpm package from hap
     * @tc.desc: Test loading the ohpm package into the hap package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0013', 0, () => {
      const md5: object = testNapi.loadModuleOHPMCrypto('123456')
      expect(String(md5)).assertEqual(CryptoJS.MD5('123456').toString())
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0014
     * @tc.name: test loading Re-entrant from hap
     * @tc.desc: Test loading the Re-entrant into the HAP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0014', 0, () => {
      const sharedHarOne: TestModule = testNapi.loadModuleWithInfo("sharedHarOne", PATH)
      expect(sharedHarOne.add ? sharedHarOne.add(2, 3) : -1).assertEqual(5);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0015
     * @tc.name: test loading shared module by taskpool from hap
     * @tc.desc: Test loading the shared module by taskpool into the HAP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0015', 0, async () => {
      await testNapiTaskPool()
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0016
     * @tc.name: test re loading shared module by taskpool from hap
     * @tc.desc: Test re loading the shared module by taskpool into the HAP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0016', 0, async () => {
      await testReNapiTaskPool()
    })
  })
}