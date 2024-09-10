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

import { beforeEach, describe, expect, it } from '@ohos/hypium'
import Utils from './Utils'
import ubshift from 'libubshift.so'

export default function ubsanShiftTest() {
  describe('UBSanShiftTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_SHIFT_BASE
     * @tc.name       : testShiftBase
     * @tc.desc       : test ShiftBase
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testShiftBase', 0, async (done: Function) => {
      let result: number = ubshift.shiftBase(32);
      expect(result).assertEqual(19);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_SHIFT_EXPONENT
     * @tc.name       : testShiftExponent
     * @tc.desc       : test ShiftExponent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testShiftExponent', 0, async (done: Function) => {
      let result: number = ubshift.shiftExponent(32);
      expect(result).assertEqual(19);
      done()
    });

  })
}
