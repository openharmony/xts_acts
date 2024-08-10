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

import buffer from '@ohos.buffer';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
let TAG= "testAlloc0001"
function isIteratorEmpty<T>(iterator: Iterator<T>): boolean {
  const firstResult = iterator.next();
  return firstResult.done === true;
}
interface Options{
  type:string,
  endings:string,
}

export default function bufferTest() {
  describe('bufferTest', () => {

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0100
    * @tc.name       : testAlloc0001
    * @tc.desc       : Testing alloc interface with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAlloc0001',0, () => {
      TAG= "testAlloc0001"
      try {
        let size = 10;
        let buf = buffer.alloc(size);
        expect(buf.length).assertEqual(size)
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    })
  })
}