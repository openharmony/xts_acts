/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
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

import tsan from 'libentry.so'
import { describe, it, expect , TestType, Size, Level } from "@ohos/hypium";

export default function abilityTest() {

  describe('ActsThirdPartyTsanMutexCheck3Test', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_TSAN_MUTEXCHECK_0300
     * @tc.name       : testTsanMutexCheck003
     * @tc.desc       : test mutexCheck read lock of a write locked mutex
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testTsanMutexCheck003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: number = tsan.rwMutexErrorLockedSequence();
      expect(result).assertEqual(1);
    });

  })
}
