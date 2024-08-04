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

import { describe, it, expect } from '@ohos/hypium';
import { add } from 'library';
import { add as harAdd } from 'har';
import { add as testAdd } from './test'
import hilog from '@ohos.hilog';
import systemApp from '@system.app';

export default function staticImport() {
  describe('staticImportTest', () => {
    /**
     * @tc.number    : SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0100
     * @tc.name      : testSharedLibraryRes
     * @tc.desc      : Import Shared Library
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testSharedLibraryRes', 0, () => {
      let shareLibraryRes: String = '';
      let a = add(2, 3);
      if (a == 5) {
        shareLibraryRes = "success";
        console.log("ModuleTest shared library test success");
      }
      expect(shareLibraryRes).assertEqual('success');
    })

    /**
     * @tc.number    : SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0200
     * @tc.name      : testStaticLibraryRes
     * @tc.desc      : Import Static Library
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testStaticLibraryRes', 0, () => {
      let staticLibraryRes: String = '';
      let a = harAdd(2, 3);
      if (a == 5) {
        staticLibraryRes = "success";
        console.log("ModuleTest static library test success");
      }
      expect(staticLibraryRes).assertEqual('success');
    })

    it('testSystemRes', 0, () => {
      let systemRes: String = '';
      if (systemApp.getInfo != undefined) {
        systemRes = 'success';
        console.log('ModuleTest @system.app test success');
      }
      expect(systemRes).assertEqual('success');
    })

    it('testOhosRes', 0, () => {
      let ohosRes: String = '';
      if (typeof hilog.info != undefined) {
        ohosRes = "success";
        hilog.info(0x0000, "ModuleTest", 'dexter log: call')
      }
      expect(ohosRes).assertEqual('success');
    })

    it('testSystemRes', 0, () => {
      let systemRes: String = '';
      if (systemApp.getInfo != undefined) {
        systemRes = 'success';
        console.log('ModuleTest @system.app test success');
      }
      expect(systemRes).assertEqual('success');
    })
  })
}