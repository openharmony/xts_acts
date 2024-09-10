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
import ubenum from 'libubenum.so'

export default function ubsanEnumTest() {
  describe('UBSanEnumTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_ENUM
     * @tc.name       : testEnum
     * @tc.desc       : test enum
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEnum', 0, async (done: Function) => {
      let result: number = ubenum.enum(42);
      expect(result).assertEqual(19);
      done()
    });

  })
}
