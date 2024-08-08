/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import process from '@ohos.process'
let TAG = "testGetStartRealtime0001";
export default function processTest() {
describe('processEtsTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETUID_0100
     * @tc.name       : testGetUid0001
     * @tc.desc       : Returns the digital user ID of the process.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetUid0001', 0, () => {
        TAG = "testGetUid0001";
        try {
            let userId = process.uid;
            expect(userId>0).assertTrue();
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });
  })
}