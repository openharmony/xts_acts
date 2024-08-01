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

export default function hspImport() {
  describe('HspTest', () => {
    /**
     * @tc.number    : SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_Hsp_0100
     * @tc.name      : testNormalHspImport
     * @tc.desc      : test hsp import
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testNormalHspImport', 0, () => {
      let normalImport: string = '';
      let a = add(2, 3);
      if (a == 5) {
        normalImport = 'success';
        console.log('ModuleTest hsp import test success');
      }
      expect(normalImport).assertEqual('success');
    })
  })
}