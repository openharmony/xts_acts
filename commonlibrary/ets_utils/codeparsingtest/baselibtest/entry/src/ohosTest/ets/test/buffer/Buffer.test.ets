/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import buffer from '@ohos.buffer';
import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

let TAG = "testAlloc0001";

function isIteratorEmpty<T>(iterator: Iterator<T>): boolean {
  const firstResult = iterator.next();
  return firstResult.done === true;
}


function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

interface Options {
  type: string,
  endings: string,
}

export default function BufferTest() {
  describe('bufferTest', () => {
    afterEach(async (done: Function) => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await sleep(10);
      done();
    })
    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0100
     * @tc.name  : testAlloc0001
     * @tc.desc  : Testing alloc interface with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAlloc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAlloc0001";
      try {
        let size = 10;
        let buf = buffer.alloc(size);
        expect(buf.length).assertEqual(size);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    })

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0200
     * @tc.name  : testAlloc0002
     * @tc.desc  : Testing alloc for buffer with value '4294967296'
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAlloc0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAlloc0002";
      try {
        let size = 4294967296;
        let buf = buffer.alloc(size);
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    })

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0300
     * @tc.name  : testAlloc0003
     * @tc.desc  : Testing alloc for parameter with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAlloc0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAlloc0003";
      try {
        buffer.alloc(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0400
      * @tc.name  : testAlloc0004
      * @tc.desc  : Testing alloc for parameter with value null.
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
     */
    it('testAlloc0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAlloc0004";
      try {
        buffer.alloc(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0500
     * @tc.name: testAlloc0005
     * @tc.desc: Testing alloc for buffer,the second parameter is empty string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
    */
    it('testAlloc0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAlloc0005";
      try {
        let buf = buffer.alloc(10, ' ');
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0600
     * @tc.name  : testAlloc0006
     * @tc.desc  : Testing alloc for buffer,the second parameter is null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAlloc0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAlloc0006";
      try {
        let buf = buffer.alloc(10, null);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0700
     * @tc.name  : testAlloc0007
     * @tc.desc  : Testing alloc for buffer,the second parameter is buffer type.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAlloc0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAlloc0007";
      try {
        let buf1 = buffer.alloc(10);
        let buf = buffer.alloc(10, buf1);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0900
     * @tc.name  : testAlloc0009
     * @tc.desc  : Testing alloc,the second and third parameter is string and null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAlloc0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAlloc0009";
      try {
        let buf = buffer.alloc(10, "ab$#", null);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });
    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1000
     * @tc.name  : testAlloc0010
     * @tc.desc  : Testing alloc for parameter with value 0.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAlloc0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAlloc0010";
      try {
        let buf = buffer.alloc(0);
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1200
     * @tc.name  : testAlloc0012
     * @tc.desc  : Testing alloc for parameter with value (0，bufferOBJ).
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAlloc0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAlloc0012";
      try {
        let buf1 = buffer.alloc(10);
        let buf = buffer.alloc(0).fill(buf1);
        let flag = buffer.alloc(0, buf);
        expect(flag.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1300
     * @tc.name  : testAlloc0013
     * @tc.desc  : Testing alloc for buffer with value -5.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAlloc0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAlloc0013";
      try {
        buffer.alloc(-5);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1400
     * @tc.name  : testAlloc0014
     * @tc.desc  : Testing alloc for buffer with value 5.5.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAlloc0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAlloc0014";
      try {
        let buf = buffer.alloc(5.5);
        expect(buf.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZED_0100
     * @tc.name  : testAllocUninitialized0001
     * @tc.desc  : Testing allocUninitialized for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAllocUninitialized0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAllocUninitialized0001";
      try {
        let buf = buffer.allocUninitialized(10);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZED_0200
     * @tc.name  : testAllocUninitialized0002
     * @tc.desc  : Testing allocUninitialized for buffer with value 0.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAllocUninitialized0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAllocUninitialized0002";
      try {
        let buf = buffer.allocUninitialized(0);
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: testAllocUninitialized0003
     * @tc.name  : testAllocUninitialized0003
     * @tc.desc  : Testing allocUninitialized for buffer with value -5.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAllocUninitialized0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAllocUninitialized0003";
      try {
        let buf = buffer.allocUninitialized(-5);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZED_0400
     * @tc.name  : testAllocUninitialized0004
     * @tc.desc  : Testing allocUninitialized for buffer with value 5.5.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAllocUninitialized0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAllocUninitialized0004";
      try {
        let buf = buffer.allocUninitialized(5.5);
        expect(buf.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZED_0500
     * @tc.name  : testAllocUninitialized0005
     * @tc.desc  : Testing allocUninitialized for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAllocUninitialized0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAllocUninitialized0005";
      try {
        let buf = buffer.allocUninitialized(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`${TAG} is fail,err is ${err}`);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZED_0600
     * @tc.name  : testAllocUninitialized0006
     * @tc.desc  : Testing allocUninitialized for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAllocUninitialized0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAllocUninitialized0006";
      try {
        let buf = buffer.allocUninitialized(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`${TAG} is fail,err is ${err}`);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZEDFROMPOOL_0100
     * @tc.name  : testAllocUninitializedFromPool0001
     * @tc.desc  : Testing allocUninitializedFromPool for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAllocUninitializedFromPool0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAllocUninitializedFromPool0001";
      try {
        let buf = buffer.allocUninitializedFromPool(10);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZEDFROMPOOL_0200
     * @tc.name  : testAllocUninitializedFromPool0002
     * @tc.desc  : Testing allocUninitializedFromPool for buffer with value 0.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAllocUninitializedFromPool0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAllocUninitializedFromPool0002";
      try {
        let buf = buffer.allocUninitializedFromPool(0);
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZEDFROMPOOL_0300
     * @tc.name  : testAllocUninitializedFromPool0003
     * @tc.desc  : Testing allocUninitializedFromPool for buffer with value -5.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAllocUninitializedFromPool0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAllocUninitializedFromPool0003";
      try {
        let buf = buffer.allocUninitializedFromPool(-5);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`${TAG} is fail,err is ${err}`);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZEDFROMPOOL_0400
     * @tc.name  : testAllocUninitializedFromPool0004
     * @tc.desc  : Testing allocUninitializedFromPool for buffer with value 5.5.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAllocUninitializedFromPool0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAllocUninitializedFromPool0004";
      try {
        let buf = buffer.allocUninitializedFromPool(5.5);
        expect(buf.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZEDFROMPOOL_0500
     * @tc.name  : testAllocUninitializedFromPool0005
     * @tc.desc  : Testing allocUninitializedFromPool for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAllocUninitializedFromPool0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAllocUninitializedFromPool0005";
      try {
        let buf = buffer.allocUninitializedFromPool(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`${TAG} is fail,err is ${err}`);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZEDFROMPOOL_0600
     * @tc.name  : testAllocUninitializedFromPool0006
     * @tc.desc  : Testing allocUninitializedFromPool for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testAllocUninitializedFromPool0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testAllocUninitializedFromPool0006";
      try {
        let buf = buffer.allocUninitializedFromPool(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`${TAG} is fail,err is ${err}`);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0100
     * @tc.name  : testByteLength0001
     * @tc.desc  : Testing byteLength for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testByteLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testByteLength0001";
      try {
        let byteLen = buffer.byteLength("abcd");
        expect(byteLen).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0200
     * @tc.name  : testByteLength0002
     * @tc.desc  : Testing byteLength for buffer with value '测试'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testByteLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testByteLength0002";
      try {
        let byteLen = buffer.byteLength("测试");
        expect(byteLen).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0300
     * @tc.name  : testByteLength0003
     * @tc.desc  : Testing byteLength for buffer with value '$&@*%'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testByteLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testByteLength0003";
      try {
        let byteLen = buffer.byteLength("$&@*%");
        expect(byteLen).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0600
     * @tc.name  : testByteLength0006
     * @tc.desc  : Testing byteLength for buffer with uint8array objects.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testByteLength0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testByteLength0006";
      try {
        let uintarr = new Uint8Array(2);
        uintarr[0] = 21;
        uintarr[1] = 31;
        let byteLen = buffer.byteLength(uintarr.buffer);
        expect(byteLen).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0700
     * @tc.name  : testByteLength0007
     * @tc.desc  : Testing byteLength for buffer with buffer objects.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testByteLength0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testByteLength0007";
      try {
        let buf1 = buffer.from("abc");
        let byteLen = buffer.byteLength(buf1);
        expect(byteLen).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0800
     * @tc.name  : testByteLength0008
     * @tc.desc  : Testing byteLength for buffer with buffer objects.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testByteLength0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testByteLength0008";
      try {
        let buf1 = buffer.alloc(8);
        let byteLen = buffer.byteLength(buf1);
        expect(byteLen).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0900
     * @tc.name  : testByteLength0009
     * @tc.desc  : Testing byteLength for buffer with value empty string.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testByteLength0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testByteLength0009";
      try {
        let buf1 = buffer.from("");
        let byteLen = buffer.byteLength(buf1);
        expect(byteLen).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_1000
     * @tc.name  : testByteLength0010
     * @tc.desc  : Testing byteLength for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testByteLength0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testByteLength0010";
      try {
        let byteLen = buffer.byteLength(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_1100
     * @tc.name  : testByteLength0011
     * @tc.desc  : Testing byteLength for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testByteLength0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testByteLength0011";
      try {
        let byteLen = buffer.byteLength(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0100
     * @tc.name  : testIsBuffer0001
     * @tc.desc  : Testing isBuffer for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testIsBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIsBuffer0001";
      try {
        let buf = buffer.alloc(1);
        let flag = buffer.isBuffer(buf);
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0200
     * @tc.name  : testIsBuffer0002
     * @tc.desc  : Testing isBuffer for buffer with object value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testIsBuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIsBuffer0002";
      try {
        let obj = new Object(1);
        let flag = buffer.isBuffer(obj);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0300
     * @tc.name  : testIsBuffer0003
     * @tc.desc  : Testing isBuffer for buffer with value '[]'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testIsBuffer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIsBuffer0003";
      try {
        let flag = buffer.isBuffer([]);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0400
     * @tc.name  : testIsBuffer0004
     * @tc.desc  : Testing isBuffer for buffer with value string type.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testIsBuffer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIsBuffer0004";
      try {
        let flag = buffer.isBuffer('ABC');
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0500
     * @tc.name  : testIsBuffer0005
     * @tc.desc  : Testing isBuffer for buffer with value empty string.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testIsBuffer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIsBuffer0005";
      try {
        let flag = buffer.isBuffer('');
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0600
     * @tc.name  : testIsBuffer0006
     * @tc.desc  : testing alloc for buffer with normal value
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testIsBuffer0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIsBuffer0006";
      try {
        let flag = buffer.isBuffer(5);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0700
     * @tc.name  : testIsBuffer0007
     * @tc.desc  : Testing isBuffer for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testIsBuffer0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIsBuffer0007";
      try {
        let flag = buffer.isBuffer(undefined);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0800
     * @tc.name  : testIsBuffer0008
     * @tc.desc  : Testing isBuffer for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testIsBuffer0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIsBuffer0008";
      try {
        let flag = buffer.isBuffer(null);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ISCODEING_0100
     * @tc.name  : testIsEncoding0001
     * @tc.desc  : Testing isEncoding for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testIsEncoding0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIsEncoding0001";
      try {
        let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
          'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
        for (const encode of encodeArr) {
          let flag = buffer.isEncoding(encode);
          expect(flag).assertEqual(true);
        }
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ISCODEING_0200
     * @tc.name  : testIsEncoding0002
     * @tc.desc  : Testing isEncoding for buffer with value gbk.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testIsEncoding0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIsEncoding0002";
      try {
        let flag = buffer.isEncoding('gbk');
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ISCODEING_0300
     * @tc.name  : testIsEncoding0003
     * @tc.desc  : Testing isEncoding for buffer with value empty string.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testIsEncoding0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIsEncoding0003";
      try {
        let flag = buffer.isEncoding('');
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ISCODEING_0400
     * @tc.name  : testIsEncoding0004
     * @tc.desc  : Testing isEncoding for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testIsEncoding0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIsEncoding0004";
      try {
        let flag = buffer.isEncoding(undefined);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ISCODEING_0500
     * @tc.name  : testIsEncoding0005
     * @tc.desc  : Testing isEncoding for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testIsEncoding0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIsEncoding0005";
      try {
        let flag = buffer.isEncoding(null);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_0100
     * @tc.name  : testStaticCompare0001
     * @tc.desc  : Testing compare with value '1235' and '1236'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testStaticCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testStaticCompare0001";
      try {
        let buf1 = buffer.from("1236");
        let buf2 = buffer.from("1235");
        let res = buffer.compare(buf1, buf2);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_0200
     * @tc.name  : testStaticCompare0002
     * @tc.desc  : Testing compare with value '1236' and '1235'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testStaticCompare0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testStaticCompare0002";
      try {
        let buf1 = buffer.from("1235");
        let buf2 = buffer.from("1236");
        let res = buffer.compare(buf1, buf2);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_0300
     * @tc.name  : testStaticCompare0003
     * @tc.desc  : Testing compare with value '测试一' and '测试二'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testStaticCompare0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testStaticCompare0003";
      try {
        let buf1 = buffer.from("测试一");
        let buf2 = buffer.from("测试二");
        let res = buffer.compare(buf1, buf2);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_0400
     * @tc.name  : testStaticCompare0004
     * @tc.desc  : Testing compare with value '测试$&*' and '测试$&*'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testStaticCompare0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testStaticCompare0004";
      try {
        let buf1 = buffer.from("测试$&*");
        let buf2 = buffer.from("测试$&*");
        let res = buffer.compare(buf1, buf2);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_0500
     * @tc.name  : testStaticCompare0005
     * @tc.desc  : Testing compare with value '1236' and '1236'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testStaticCompare0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testStaticCompare0005";
      try {
        let buf1 = buffer.from("1236");
        let buf2 = buffer.from("1236");
        let res = buffer.compare(buf1, buf2);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_0800
     * @tc.name  : testStaticCompare0008
     * @tc.desc  : Testing compare with value undefined and undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testStaticCompare0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testStaticCompare0008";
      try {
        let res = buffer.compare(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_0900
     * @tc.name  : testStaticCompare0009
     * @tc.desc  : Testing compare with value null and null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testStaticCompare0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testStaticCompare0009";
      try {
        let res = buffer.compare(null, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_1000
     * @tc.name  : testStaticCompare0010
     * @tc.desc  : Testing compare with value buffer and buffer.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testStaticCompare0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testStaticCompare0010";
      let buf1 = buffer.from("1");
      let buf2 = buffer.from("abc");
      try {
        let res = buffer.compare(buf1, buf2);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_1100
     * @tc.name  : testStaticCompare0011
     * @tc.desc  : Testing compare with value buffer and uint8array type.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testStaticCompare0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testStaticCompare0011";
      try {
        let buf1 = buffer.from("1abc");
        let uintarr = new Uint8Array(2);
        uintarr[0] = 21;
        uintarr[1] = 31;
        let buf2 = buffer.from(uintarr.buffer);
        let res = buffer.compare(buf1, buf2);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0100
     * @tc.name  : testCompare0001
     * @tc.desc  : Testing compare with value '1236' and '1235'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCompare0001";
      try {
        let buf1 = buffer.from("1236");
        let buf2 = buffer.from("1235");
        let res = buf1.compare(buf2);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0300
     * @tc.name  : testCompare0003
     * @tc.desc  : Testing compare with value (1236,1235,-1).
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testCompare0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCompare0003";
      let buf1 = buffer.from("1236");
      let buf2 = buffer.from("1235");
      try {
        let res = buf1.compare(buf2, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_CONTACT_0100
     * @tc.name  : testConcat0001
     * @tc.desc  : Testing concat with value '1236, 1235'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testConcat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testConcat0001";
      try {
        let buf1 = buffer.from("1236");
        let buf2 = buffer.from("1235");
        let buf = buffer.concat([buf1, buf2]);
        let str = buf.toString();
        expect(str).assertEqual("12361235");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_CONTACT_0200
     * @tc.name  : testConcat0002
     * @tc.desc  : Testing concat with value '测试, $&*'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testConcat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testConcat0002";
      try {
        let buf1 = buffer.from("测试");
        let buf2 = buffer.from("$&*");
        let buf = buffer.concat([buf1, buf2]);
        let str = buf.toString();
        expect(str).assertEqual("测试$&*");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_CONTACT_0400
     * @tc.name  : testConcat0004
     * @tc.desc  : Testing concat with value 'buffer, buffer'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testConcat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testConcat0004";
      try {
        let buf1 = buffer.from("123$");
        let buf2 = buffer.from("*35");
        let buf3 = buffer.concat([buf1, buf2]);
        let buf = buffer.alloc(5).fill(buf3);
        let str = buf.toString();
        expect(str).assertEqual("123$*");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_CONTACT_0500
     * @tc.name  : testConcat0005
     * @tc.desc  : Testing concat with value 'buffer,-1'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testConcat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testConcat0005";
      let buf1 = buffer.from("123$");
      let buf2 = buffer.from("*35");
      try {
        let buf = buffer.concat([buf1, buf2], -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
        console.error(`${TAG} is fail,err is ${err}`);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_CONTACT_0700
     * @tc.name: testConcat0007
     * @tc.desc: Testing concat with value 'undefined, undefined'.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
    */
    it('testConcat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testConcat0007";
      try {
        let buf = buffer.concat(undefined, undefined);
        let str = buf.toString();
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`${TAG} is fail,err is ${err}`);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0100
     * @tc.name  : testTranscode0001
     * @tc.desc  : Testing transcode with value 'buf1, "ascii", "ucs2"'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testTranscode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testTranscode0001";
      try {
        let buf1 = buffer.from("1236");
        let buf = buffer.transcode(buf1, "ascii", "ucs2");
        let str = buf.toString("ucs2");
        expect(str).assertEqual("1236");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0200
     * @tc.name: testTranscode0002
     * @tc.desc: Testing transcode with value 'buf1, "utf8", "ucs2"'.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testTranscode0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testTranscode0002";
      try {
        let buf1 = buffer.from("测试");
        let buf = buffer.transcode(buf1, "utf8", "ucs2");
        let str = buf.toString("ucs2");
        expect(str).assertEqual("测试");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0600
     * @tc.name: testTranscode0006
     * @tc.desc: Testing transcode with value 'undefined, "utf8", "ascii"'.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testTranscode0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testTranscode0006";
      try {
        let buf = buffer.transcode(undefined, "utf8", "ascii");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0700
      * @tc.name: testTranscode0007
     * @tc.desc: Testing transcode with value 'null, "utf8", "ascii"'.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
    */
    it('testTranscode0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testTranscode0007";
      try {
        let buf = buffer.transcode(null, "utf8", "ascii");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FILL_0100
     * @tc.name: testFill0001
     * @tc.desc: Testing fill with normal value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testFill0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFill0001";
      try {
        let buf = buffer.alloc(3).fill("abc");
        let str = buf.toString();
        expect(str).assertEqual("abc");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FILL_0200
     * @tc.name: testFill0002
     * @tc.desc: Testing fill with value '('F1刘FG', 0, 10, codeType)'.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testFill0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFill0002";
      try {
        const buf1 = buffer.alloc(10).fill('F1刘FG', 0, 10, 'hex');
        let str = buf1.toString('hex');
        expect(str).assertEqual("f1f1f1f1f1f1f1f1f1f1");

        let buf2 = buffer.alloc(10).fill('F1刘FG', 0, 10, 'ascii');
        str = buf2.toString("hex");
        expect(str).assertEqual("46311846474631184647");

        let buf3 = buffer.alloc(10).fill('F1FG', 0, 10, 'base64');
        str = buf3.toString("hex");
        expect(str).assertEqual("17514617514617514617");

        let buf4 = buffer.alloc(10).fill('F1刘FG', 0, 10, 'binary');
        str = buf4.toString("hex");
        expect(str).assertEqual("46311846474631184647");

        let buf5 = buffer.alloc(10).fill('F1刘FG', 0, 10, 'latin1');
        str = buf5.toString("hex");
        expect(str).assertEqual("46311846474631184647");

        let buf6 = buffer.alloc(10).fill('F1刘FG', 0, 10, 'ucs2');
        str = buf6.toString("hex");
        expect(str).assertEqual("46003100185246004700");

        let buf7 = buffer.alloc(10).fill('F1刘FG', 0, 10, 'utf8');
        str = buf7.toString("hex");
        expect(str).assertEqual("4631e5889846474631e5");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FILL_0300
     * @tc.name: testFill0003
     * @tc.desc: Testing fill with value '$*$'.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testFill0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFill0003";
      try {
        let buf = buffer.alloc(3).fill("$*$");
        let str = buf.toString();
        expect(str).assertEqual("$*$");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FILL_0400
     * @tc.name: testFill0004
     * @tc.desc: Testing fill with value '"$*$", -1'.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testFill0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFill0004";
      try {
        let buf = buffer.alloc(3).fill("$*$", -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FILL_0500
     * @tc.name: testFill0005
     * @tc.desc: Testing fill with value '"$*$", 0, 5'.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testFill0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFill0005";
      try {
        let buf = buffer.alloc(3).fill("$*$", 0, 5);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_Write_0600
     * @tc.name: testWrite0006
     * @tc.desc: Testing the write interface with a normal value 'abcde' and an out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWrite0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(8);
      try {
        let offset = buf.write("abcde", -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_Write_0700
     * @tc.name: testWrite0007
     * @tc.desc: Testing the write interface with a normal value 'abcde', a normal 'offset' value of 1, and an out-of-range 'length' value of 9.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWrite0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(8);
      try {
        let offset = buf.write("abcde", 1, 9);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_Write_0900
     * @tc.name: testWrite0009
     * @tc.desc: Testing the write interface with normal value ''.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWrite0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWrite0009";
      try {
        let buf = buffer.alloc(0);
        let offset = buf.write("");
        expect(offset).assertEqual(0);
        let str = buf.toString();
        expect(str).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_Write_1000
     * @tc.name: testWrite0010
     * @tc.desc: Testing the write interface with undefined .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWrite0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(8);
      try {
        let offset = buf.write(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_Write_1100
     * @tc.name: testWrite0011
     * @tc.desc: Testing the write interface with null .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWrite0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(8);
      try {
        let offset = buf.write(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0100
     * @tc.name: testWriteBigInt64BE0001
     * @tc.desc: Testing the writeBigInt64BE interface with two parameters: 0x0102030405060708n and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteBigInt64BE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteBigInt64BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let ref = buf.writeBigInt64BE(0x0102030405060708n, 0);
        expect(ref).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0200
     * @tc.name: testWriteBigInt64BE0002
     * @tc.desc: Testing the writeBigInt64BE interface with a normal value 0x0102030405060708n and an out-of-range 'offset' value of 1, where 'offset' must be >= 0 and <= 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteBigInt64BE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigInt64BE(0x0102030405060708n, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0300
     * @tc.name: testWriteBigInt64BE0003
     * @tc.desc: Testing the writeBigInt64BE interface with undefined .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteBigInt64BE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigInt64BE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0400
     * @tc.name: testWriteBigInt64BE0004
     * @tc.desc: Testing the writeBigInt64BE interface with null .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteBigInt64BE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigInt64BE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64LE_0100
     * @tc.name: testWriteBigInt64LE0001
     * @tc.desc: Testing the writeBigInt64LE interface with two parameters: 0x0102030405060708n and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteBigInt64LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteBigInt64LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let ref = buf.writeBigInt64LE(0x0102030405060708n, 0);
        expect(ref).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64LE_0200
     * @tc.name: testWriteBigInt64LE0002
     * @tc.desc: Testing the writeBigInt64LE interface with out-of-range 'offset' value of 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteBigInt64LE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigInt64LE(0x0102030405060708n, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64LE_0300
     * @tc.name: testWriteBigInt64LE0003
     * @tc.desc: Testing the writeBigInt64LE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteBigInt64LE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigInt64LE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64LE_0400
     * @tc.name: testWriteBigInt64LE0004
     * @tc.desc: Testing the writeBigInt64LE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteBigInt64LE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigInt64LE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0100
     * @tc.name: testWriteBigUInt64BE0001
     * @tc.desc: Testing the writeInt16BE interface with two parameters: 0xdecafafecacefaden and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteBigUInt64BE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteBigUInt64BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let ref = buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
        expect(ref).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0200
     * @tc.name: testWriteBigUInt64BE0002
     * @tc.desc: Testing the writeInt16BE interface with out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteBigUInt64BE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigUInt64BE(0xdecafafecacefaden, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0300
     * @tc.name: testWriteBigUInt64BE0003
     * @tc.desc: Testing the writeInt16BE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteBigUInt64BE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigUInt64BE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0400
     * @tc.name: testWriteBigUInt64BE0004
     * @tc.desc: Testing the writeInt16BE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteBigUInt64BE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigUInt64BE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BigUInt64LE_0100
     * @tc.name: testWriteBigUInt64LE0001
     * @tc.desc: Testing the writeBigUInt64LE interface with two parameters: 0xdecafafecacefaden and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteBigUInt64LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteBigUInt64LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let ref = buf.writeBigUInt64LE(0xdecafafecacefaden, 0);
        expect(ref).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BigUInt64LE_0200
     * @tc.name: testWriteBigUInt64LE0002
     * @tc.desc: Testing the writeBigUInt64LE interface with out-of-range 'offset' value of 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteBigUInt64LE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigUInt64LE(0xdecafafecacefaden, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BigUInt64LE_0300
     * @tc.name: testWriteBigUInt64LE0003
     * @tc.desc: Testing the writeBigUInt64LE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteBigUInt64LE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigUInt64LE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BigUInt64LE_0400
     * @tc.name: testWriteBigUInt64LE0004
     * @tc.desc: Testing the writeBigUInt64LE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteBigUInt64LE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigUInt64LE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleBE_0100
     * @tc.name: testWriteDoubleBE0001
     * @tc.desc: Testing the writeDoubleBE interface with two parameters: 123.456 and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteDoubleBE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteDoubleBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let ref = buf.writeDoubleBE(123.456, 0);
        expect(ref).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleBE_0200
     * @tc.name: testWriteDoubleBE0002
     * @tc.desc: Testing the writeDoubleBE interface with a normal value of 123.456 and an out-of-range 'offset' value of 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteDoubleBE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeDoubleBE(123.456, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleBE_0300
     * @tc.name: testWriteBigInt64BE0003
     * @tc.desc: Testing the writeDoubleBE interface with undefined .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteDoubleBE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeDoubleBE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleBE_0400
     * @tc.name: testWriteBigInt64BE0004
     * @tc.desc: Testing the writeDoubleBE interface with null .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteDoubleBE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeDoubleBE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleLE_0100
     * @tc.name: testWriteDoubleLE0001
     * @tc.desc: Testing the writeDoubleLE interface with two parameters: 123.456 and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteDoubleLE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteDoubleLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let ref = buf.writeDoubleLE(123.456, 0);
        expect(ref).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleLE_0200
     * @tc.name: testWriteDoubleLE0002
     * @tc.desc: Testing the writeDoubleLE interface with a normal value of 123.456 and an out-of-range 'offset' value of 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteDoubleLE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeDoubleLE(123.456, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleLE_0300
     * @tc.name: testWriteDoubleLE0003
     * @tc.desc: Testing the writeDoubleLE interface with undefined .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteDoubleLE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeDoubleLE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleLE_0400
     * @tc.name: testWriteDoubleLE0004
     * @tc.desc: Testing the writeDoubleBE interface with null .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteDoubleLE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeDoubleLE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatBE_0100
     * @tc.name: testWriteFloatBE0001
     * @tc.desc: Testing the writeFloatBE interface with two parameters: 0xcabcbcbc and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteFloatBE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteFloatBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeFloatBE(0xcabcbcbc, 0);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatBE_0200
     * @tc.name: testWriteFloatBE0002
     * @tc.desc: Testing the writeFloatBE interface with an out-of-range 'offset' value of 5, where 'offset' must be >= 0 and <= 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteFloatBE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeFloatBE(0xcabcbcbc, 5);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatBE_0300
     * @tc.name: testWriteFloatBE0003
     * @tc.desc: Testing the writeFloatBE interface with undefined .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteFloatBE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeFloatBE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatBE_0400
     * @tc.name: testWriteFloatBE0004
     * @tc.desc: Testing the writeFloatBE interface with null .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteFloatBE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeFloatBE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatLE_0100
     * @tc.name: testWriteFloatLE0001
     * @tc.desc: Testing the writeFloatLE interface with two parameters: 0xcabcbcbc and 12.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteFloatLE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteFloatLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(16);
        let ref = buf.writeFloatLE(0xcabcbcbc, 12);
        expect(ref).assertEqual(16);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatLE_0200
     * @tc.name: testWriteFloatLE0002
     * @tc.desc: Testing the writeFloatLE interface with a normal value of 0xcabcbcbc and an out-of-range 'offset' value of 5.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteFloatLE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeFloatLE(0xcabcbcbc, 5);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatLE_0300
     * @tc.name: testWriteFloatLE0003
     * @tc.desc: Testing the writeFloatLE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteFloatLE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeFloatLE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatLE_0400
     * @tc.name: testWriteFloatLE0004
     * @tc.desc: Testing the writeFloatLE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteFloatLE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeFloatLE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt8_0100
     * @tc.name: testWriteInt80001
     * @tc.desc: Testing the writeInt8 interface with value to buf at the specified offset.
     * value must be a valid signed 8-bit integer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt80001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteInt80001";
      try {
        let buf = buffer.allocUninitializedFromPool(2);
        let ref = buf.writeInt8(2, 0);
        expect(ref).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt8_0200
     * @tc.name: testWriteInt80002
     * @tc.desc: Testing the writeInt8 interface with value 2 and an out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt80002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(2);
      try {
        let ref = buf.writeInt8(2, -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt8_0300
     * @tc.name: testWriteInt80003
     * @tc.desc: Testing the writeInt8 interface with two parameters: 0x13245 and out of range "value" 0
     * it must be >= -128 and <= 127. Received value is: 78405.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt80003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(2);
      try {
        let ref = buf.writeInt8(0x13245, 0);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt8_0400
     * @tc.name: testWriteInt80004
     * @tc.desc: Testing the writeInt8 interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt80004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(2);
      try {
        let ref = buf.writeInt8(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt8_0500
     * @tc.name: testWriteInt80005
     * @tc.desc: Testing the writeInt8 interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt80005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(2);
      try {
        let ref = buf.writeInt8(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16BE_0100
     * @tc.name: testWriteInt16BE0001
     * @tc.desc: Testing the writeInt16BE interface with two parameters: 0x7bca and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt16BE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteInt16BE0001";
      try {
        let buf = buffer.alloc(2);
        let ref = buf.writeInt16BE(0x7bca, 0);
        expect(ref).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16BE_0200
     * @tc.name: testWriteInt16BE0002
     * @tc.desc: Testing the writeInt16BE interface with out of range "offset" -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt16BE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16BE(0x7bca, -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16BE_0300
     * @tc.name: testWriteInt16BE0003
     * @tc.desc: Testing the writeInt16BE interface with out of range "value" 0
     * It must be >= -32768 and <= 32767. Received value is: 1193046.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt16BE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16BE(0x123456, 0);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16BE_0400
     * @tc.name: testWriteInt16BE0004
     * @tc.desc: Testing the writeInt16BE interface with out of range "offset" 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt16BE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16BE(0x7bca, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16BE_0500
     * @tc.name: testWriteInt16BE0005
     * @tc.desc: Testing the writeInt16BE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt16BE0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16BE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16BE_0600
     * @tc.name: testWriteInt16BE0006
     * @tc.desc: Testing the writeInt16BE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt16BE0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16BE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16LE_0100
     * @tc.name: testWriteInt16LE0001
     * @tc.desc: Testing the writeInt16LE interface with two parameters: 0x1234 and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt16LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteDoubleLE0001";
      try {
        let buf = buffer.alloc(2);
        let ref = buf.writeInt16LE(0x1234, 0);
        expect(ref).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16LE_0200
     * @tc.name: testWriteInt16LE0002
     * @tc.desc: Testing the writeInt16LE interface with out-of-range 'offset' value of -1
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt16LE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16LE(0x7bca, -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16LE_0300
     * @tc.name: testWriteInt16LE0003
     * @tc.desc: Testing the writeInt16LE interface with out of range "value" 0
     * It must be >= -32768 and <= 32767. Received value is: 1193046.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt16LE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16LE(0x123456, 0);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16LE_0400
     * @tc.name: testWriteInt16LE0004
     * @tc.desc: Testing the writeInt16LE interface with out-of-range 'offset' value of 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt16LE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16LE(0x1234, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16LE_0500
     * @tc.name: testWriteInt16LE0005
     * @tc.desc: Testing the writeInt16LE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt16LE0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16LE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16LE_0600
     * @tc.name: testWriteInt16LE0006
     * @tc.desc: Testing the writeInt16LE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt16LE0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16LE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32BE_0100
     * @tc.name: testWriteInt32BE0001
     * @tc.desc: Testing the writeInt32BE interface with two parameters: 0x12345678 and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt32BE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteInt32BE0001";
      try {
        let buf = buffer.alloc(4);
        let ref = buf.writeInt32BE(0x12345678, 0);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32BE_0200
     * @tc.name: testWriteInt32BE0002
     * @tc.desc: Testing the writeInt32BE interface with out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt32BE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32BE(0x12345678, -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32BE_0300
     * @tc.name: testWriteInt32BE0003
     * @tc.desc: Testing the writeInt32BE interface with out of range "value" 0
     * It must be >= -2147483648 and <= 2147483647. Received value is: 4886718345.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt32BE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32BE(0x123456789, 0);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32BE_0400
     * @tc.name: testWriteInt32BE0004
     * @tc.desc: Testing the writeInt32BE interface with out-of-range 'offset' value of 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt32BE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32BE(0x12345678, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32BE_0600
     * @tc.name: testWriteInt32BE0006
     * @tc.desc: Testing the writeInt32BE function with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt32BE0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32BE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32BE_0700
     * @tc.name: testWriteInt32BE0007
     * @tc.desc: Testing the writeInt32BE function with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt32BE0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32BE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32LE_0100
     * @tc.name: testWriteInt32LE0001
     * @tc.desc: Testing the writeInt32LE interface with two parameters: 0x12345678 and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt32LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteInt32LE0001";
      try {
        let buf = buffer.alloc(4);
        let ref = buf.writeInt32LE(0x12345678, 0);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32LE_0200
     * @tc.name: testWriteInt32LE0002
     * @tc.desc: Testing the writeInt32LE interface with out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt32LE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32LE(0x12345678, -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32LE_0300
     * @tc.name: testWriteInt32LE0003
     * @tc.desc: Testing the writeInt32LE interface with out of range "value" 0
     * It must be >= -2147483648 and <= 2147483647. Received value is: 4886718345.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt32LE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32LE(0x123456789, 0)
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32LE_0400
     * @tc.name: testWriteInt32LE0004
     * @tc.desc: Testing the writeInt32LE interface with out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt32LE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32LE(0x12345678, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32LE_0500
     * @tc.name: testWriteInt32LE0005
     * @tc.desc: Testing the writeInt32LE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt32LE0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32LE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32LE_0600
     * @tc.name: testWriteInt32LE0006
     * @tc.desc: Testing the writeInt32LE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteInt32LE0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32LE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteIntBE_0100
     * @tc.name: testWriteIntBE0001
     * @tc.desc: Testing the writeIntBE interface with three parameters: 0x1234567890ab, 0, 6.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteIntBE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteIntBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        let ref = buf.writeIntBE(0x1234567890ab, 0, 6);
        expect(ref).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteIntBE_0200
     * @tc.name: testWriteIntBE0002
     * @tc.desc: Testing the writeIntBE interface with out-of-range 'offset' value of 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteIntBE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntBE(0x1234567890ab, 1, 6);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteIntBE_0300
     * @tc.name: testWriteIntBE0003
     * @tc.desc: Testing the writeIntBE interface with out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteIntBE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntBE(0x1234567890ab, -1, 6);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteIntBE_0400
     * @tc.name: testWriteIntBE0004
     * @tc.desc: Testing the writeIntBE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteIntBE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntBE(undefined, 0, 6);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteIntBE_0500
     * @tc.name: testWriteIntBE0005
     * @tc.desc: Testing the writeIntBE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteIntBE0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntBE(null, 0, 6);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteIntLE_0100
     * @tc.name: testWriteIntLE0001
     * @tc.desc: Testing the writeIntLE interface with three parameters: 0x1234567890ab, 0, 6.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteIntLE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteIntLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        let ref = buf.writeIntLE(0x1234567890ab, 0, 6);
        expect(ref).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteIntLE_0200
     * @tc.name: testWriteIntLE0002
     * @tc.desc: Testing the writeIntLE interface with out-of-range 'offset' value of 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteIntLE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntLE(0x1234567890ab, 1, 6);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteIntLE_0300
     * @tc.name: testWriteIntLE0003
     * @tc.desc: Testing the writeIntLE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteIntLE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntLE(undefined, 0, 6);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteIntLE_0400
     * @tc.name: testWriteIntLE0004
     * @tc.desc: Testing the writeIntLE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteIntLE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntLE(null, 0, 6);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt8_0100
     * @tc.name: testWriteUInt80001
     * @tc.desc: Testing the writeUInt8 interface with two parameters: 0x42 and 3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt80001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUInt80001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt8(0x42, 3);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt8_0200
     * @tc.name: testWriteUInt80002
     * @tc.desc: Testing the writeUInt8 interface with out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt80002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt8(0x42, -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt8_0300
     * @tc.name: testWriteUInt80003
     * @tc.desc: Testing the writeUInt8 interface with two parameters: 0x42 and 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt80003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUInt80003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt8(0x42, 1);
        expect(ref).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt8_0400
     * @tc.name: testWriteUInt80004
     * @tc.desc: Testing the writeUInt8 interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt80004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt8(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt8_0500
     * @tc.name: testWriteUInt80005
     * @tc.desc: Testing the writeUInt8 interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt80005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt8(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16BE_0100
     * @tc.name: testWriteUInt16BE0001
     * @tc.desc: Testing the writeUInt16BE interface with two parameters: 0xdead and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt16BE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUInt16BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt16BE(0xdead, 0);
        expect(ref).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16BE_0200
     * @tc.name: testWriteUInt16BE0002
     * @tc.desc: Testing the writeUInt16BE interface with out-of-range "value"
     * It must be >= 0 and <= 65535. Received value is: 14593532.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt16BE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16BE(0xdeadfc, 0);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16BE_0300
     * @tc.name: testWriteUInt16BE0003
     * @tc.desc: Testing the writeUInt16BE interface with  out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt16BE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16BE(0xdead, -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16BE_0400
     * @tc.name: testWriteUInt16BE0004
     * @tc.desc: Testing the writeUInt16BE interface with two parameters: 0xdead and 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt16BE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUInt16BE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt16BE(0xdead, 1);
        expect(ref).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16BE_0500
     * @tc.name: testWriteUInt16BE0005
     * @tc.desc: Testing the writeInt16BE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt16BE0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16BE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16BE_0600
     * @tc.name: testWriteUInt16BE0006
     * @tc.desc: Testing the writeUInt16BE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt16BE0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16BE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16LE_0100
     * @tc.name: testWriteUInt16LE0001
     * @tc.desc: Testing the writeUInt16LE interface with two parameters: 0xdead and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt16LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUInt16LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt16LE(0xdead, 0);
        expect(ref).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16LE_0200
     * @tc.name: testWriteUInt16LE0002
     * @tc.desc: Testing the writeUInt16LE interface with out-of-range "value"
     * It must be >= 0 and <= 65535. Received value is: 14593532.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt16LE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16LE(0xdeadfc, 0);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16LE_0300
     * @tc.name: testWriteUInt16LE0003
     * @tc.desc: Testing the writeUInt16LE interface with  out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt16LE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16LE(0xdead, -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16LE_0400
     * @tc.name: testWriteUInt16LE0004
     * @tc.desc: Testing the writeUInt16LE interface with two parameters: 0xdead and 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt16LE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUInt16LE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt16LE(0xdead, 1);
        expect(ref).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16LE_0500
     * @tc.name: testWriteUInt16LE0005
     * @tc.desc: Testing the writeUInt16LE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt16LE0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16LE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16LE_0600
     * @tc.name: testWriteUInt16LE0006
     * @tc.desc: Testing the writeUInt16LE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt16LE0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16LE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt32BE_0100
     * @tc.name: testWriteUInt32BE0001
     * @tc.desc: Testing the writeUInt32BE interface with two parameters: 0xfeedface and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt32BE001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteDoubleLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt32BE(0xfeedface, 0);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt32BE_0200
     * @tc.name: testWriteUInt32BE0002
     * @tc.desc: Testing the writeUInt32BE interface with out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt32BE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt32BE(0xfeedface, -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt32BE_0300
     * @tc.name: testWriteUInt32BE0003
     * @tc.desc: Testing the writeUInt32BE interface with out-of-range 'offset' value of 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt32BE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt32BE(0xfeedface, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt32BE_0400
     * @tc.name: testWriteUInt32BE0004
     * @tc.desc: Testing the writeUInt32BE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt32BE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt32BE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt32BE_0500
     * @tc.name: testWriteUInt32BE0005
     * @tc.desc: Testing the writeUInt32BE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testWriteUInt32BE0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt32BE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINT32LE_0100
     * @tc.name  : testWriteUInt32LE0001
     * @tc.desc  : Testing writeUInt32LE with value '0xfeedface, 0'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testWriteUInt32LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUInt32LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt32LE(0xfeedface, 0);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINT32LE_0200
     * @tc.name  : testWriteUInt32LE0002
     * @tc.desc  : Testing writeUInt32LE with value '0xfeedface, -1'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testWriteUInt32LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUInt32LE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt32LE(0xfeedface, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINT32LE_0300
     * @tc.name  : testWriteUInt32LE0003
     * @tc.desc  : Testing writeUInt32LE with value '0xfeedface, 1'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testWriteUInt32LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUInt32LE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt32LE(0xfeedface, 1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINT32LE_0400
     * @tc.name  : testWriteUInt32LE0004
     * @tc.desc  : Testing writeUInt32LE with value 'undefined'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testWriteUInt32LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUInt32LE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt32LE(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINT32LE_0500
     * @tc.name  : testWriteUInt32LE0005
     * @tc.desc  : Testing writeUInt32LE with value 'null'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testWriteUInt32LE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUInt32LE0005";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt32LE(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTBE_0100
     * @tc.name  : testWriteUIntBE0001
     * @tc.desc  : Testing writeUIntBE with value '0x13141516, 0, 4'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testWriteUIntBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUIntBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntBE(0x13141516, 0, 4);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTBE_0200
     * @tc.name  : testWriteUIntBE0002
     * @tc.desc  : Testing writeUIntBE with value '0x13141516, 0, 1'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testWriteUIntBE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUIntBE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntBE(0x13141516, 0, 1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTBE_0300
     * @tc.name  : testWriteUIntBE0003
     * @tc.desc  : Testing writeUIntBE with value '0x13141516, 1, 4'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testWriteUIntBE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUIntBE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntBE(0x13141516, 1, 4);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTBE_0400
     * @tc.name  : testWriteUIntBE0004
     * @tc.desc  : Testing writeUIntBE with value '0x13141516, 1, 4'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testWriteUIntBE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUIntBE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(5);
        let ref = buf.writeUIntBE(0x13141516, 1, 4);
        expect(ref).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTBE_0500
     * @tc.name  : testWriteUIntBE0005
     * @tc.desc  : Testing writeUIntBE with value 'undefined, 1, 4'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testWriteUIntBE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUIntBE0005";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntBE(undefined, 1, 4);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTBE_0600
     * @tc.name  : testWriteUIntBE0006
     * @tc.desc  : Testing writeUIntBE with value 'null, 1, 4'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testWriteUIntBE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUIntBE0006";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntBE(null, 1, 4);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTLE_0100
     * @tc.name  : testWriteUIntLE0001
     * @tc.desc  : Testing writeUIntLE with value '0x13141516, 0, 4'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testWriteUIntLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUIntLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntLE(0x13141516, 0, 4);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTLE_0200
     * @tc.name  : testWriteUIntLE0002
     * @tc.desc  : Testing writeUIntLE with value '0x13141516, 0, 1'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testWriteUIntLE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUIntLE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntLE(0x13141516, 0, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTLE_0300
     * @tc.name  : testWriteUIntLE0003
     * @tc.desc  : Testing writeUIntLE with value '0x13141516, 1, 4'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testWriteUIntLE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUIntLE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntLE(0x13141516, 1, 4);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTLE_0400
     * @tc.name  : testWriteUIntLE0004
     * @tc.desc  : Testing writeUIntLE with value 'buffer.allocUninitializedFromPool(5),1,4'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testWriteUIntLE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUIntLE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(5);
        let ref = buf.writeUIntLE(0x13141516, 1, 4);
        expect(ref).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTLE_0500
     * @tc.name  : testWriteUIntLE0005
     * @tc.desc  : Testing writeUIntLE for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testWriteUIntLE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUIntLE0005";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntLE(undefined, 1, 4);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTLE_0600
     * @tc.name  : testWriteUIntLE0006
     * @tc.desc  : Testing writeUIntLE for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testWriteUIntLE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUIntLE0006";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntLE(null, 1, 4);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64BE_0100
     * @tc.name  : testReadBigInt64BE0001
     * @tc.desc  : Testing readBigInt64BE for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadBigInt64BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigInt64BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(0x0102030405060708n, 0);
        let ref = buf.readBigInt64BE(0).toString(16);
        expect(ref).assertEqual("102030405060708");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64BE_0200
     * @tc.name  : testReadBigInt64BE0002
     * @tc.desc  : Testing readBigInt64BE for buffer with value 1.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadBigInt64BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigInt64BE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(0x0102030405060708n, 0);
        let ref = buf.readBigInt64BE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64BE_0300
     * @tc.name  : testReadBigInt64BE0003
     * @tc.desc  : Testing readBigInt64BE for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadBigInt64BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigInt64BE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(0x0102030405060708n);
        let ref = buf.readBigInt64BE(undefined).toString(16);
        expect(ref).assertEqual("102030405060708");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64BE_0400
     * @tc.name  : testReadBigInt64BE0004
     * @tc.desc  : Testing readBigInt64BE for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadBigInt64BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigInt64BE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(0x0102030405060708n);
        let ref = buf.readBigInt64BE(null).toString(16);
        expect(ref).assertEqual("102030405060708");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64LE_0100
     * @tc.name  : testReadBigInt64LE0001
     * @tc.desc  : Testing readBigInt64LE for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadBigInt64LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigInt64LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(0x0102030405060708n, 0);
        let ref = buf.readBigInt64LE(0).toString(16);
        expect(ref).assertEqual("807060504030201");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64LE_0200
     * @tc.name  : testReadBigInt64LE0002
     * @tc.desc  : Testing readBigInt64LE for buffer with value 1.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadBigInt64LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigInt64LE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(0x0102030405060708n, 0);
        let ref = buf.readBigInt64LE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64LE_0300
     * @tc.name  : testReadBigInt64LE0003
     * @tc.desc  : Testing readBigInt64LE for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadBigInt64LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigInt64LE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(0x0102030405060708n);
        let ref = buf.readBigInt64LE(undefined).toString(16);
        expect(ref).assertEqual("807060504030201");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64LE_0400
     * @tc.name  : testReadBigInt64LE0004
     * @tc.desc  : Testing readBigInt64LE for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadBigInt64LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigInt64LE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(0x0102030405060708n);
        let ref = buf.readBigInt64LE(null).toString(16);
        expect(ref).assertEqual("807060504030201");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGUINT64BE_0100
     * @tc.name  : testReadBigUInt64BE0001
     * @tc.desc  : Testing readBigUInt64BE for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadBigUInt64BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigUInt64BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
        let ref = buf.readBigUInt64BE(0).toString(16);
        expect(ref).assertEqual("decafafecacefade");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGUINT64BE_0200
     * @tc.name  : testReadBigUInt64BE0002
     * @tc.desc  : Testing readBigUInt64BE for buffer with value 1.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadBigUInt64BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigUInt64BE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
        let ref = buf.readBigUInt64BE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGUINT64BE_0300
     * @tc.name  : testReadBigUInt64BE0003
     * @tc.desc  : Testing readBigUInt64BE for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadBigUInt64BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigUInt64BE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
        let ref = buf.readBigUInt64BE(undefined).toString(16);
        expect(ref).assertEqual("decafafecacefade");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGUINT64BE_0400
     * @tc.name  : testReadBigUInt64BE0004
     * @tc.desc  : Testing readBigUInt64BE for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadBigUInt64BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigUInt64BE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
        let ref = buf.readBigUInt64BE(null).toString(16);
        expect(ref).assertEqual("decafafecacefade");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READBIGUINT64LE_0100
     * @tc.name  : testReadBigUInt64LE0001
     * @tc.desc  : Testing readBigUInt64LE for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadBigUInt64LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigUInt64LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64LE(0xdecafafecacefaden, 0);
        let ref = buf.readBigUInt64LE(0).toString(16);
        expect(ref).assertEqual("decafafecacefade");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READBIGUINT64LE_0200
     * @tc.name  : testReadBigUInt64LE0002
     * @tc.desc  : Testing readBigUInt64LE for buffer with value 1.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadBigUInt64LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigUInt64LE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64LE(0xdecafafecacefaden, 0);
        let ref = buf.readBigUInt64LE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READBIGUINT64LE_0300
     * @tc.name  : testReadBigUInt64BE0003
     * @tc.desc  : Testing readBigUInt64LE for buffer with undefined value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadBigUInt64LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigUInt64LE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64LE(0xdecafafecacefaden, 0);
        let ref = buf.readBigUInt64LE(undefined).toString(16);
        expect(ref).assertEqual("decafafecacefade");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READBIGUINT64LE_0400
     * @tc.name  : testReadBigUInt64LE0004
     * @tc.desc  : Testing readBigUInt64LE for buffer with null value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadBigUInt64LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigUInt64LE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64LE(0xdecafafecacefaden, 0);
        let ref = buf.readBigUInt64LE(null).toString(16);
        expect(ref).assertEqual("decafafecacefade");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLEBE_0100
     * @tc.name  : testReadDoubleBE0001
     * @tc.desc  : Testing readDoubleBE for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadDoubleBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadDoubleBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(123.456, 0);
        let ref = buf.readDoubleBE();
        expect(ref).assertEqual(123.456);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLEBE_0200
     * @tc.name  : testReadDoubleBE0002
     * @tc.desc  : Testing readDoubleBE for buffer with value 1.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadDoubleBE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadDoubleBE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(123.456, 0);
        let ref = buf.readDoubleBE(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLEBE_0300
     * @tc.name  : testReadDoubleBE0003
     * @tc.desc  : Testing readDoubleBE for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadDoubleBE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadDoubleBE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(123.456, 0);
        let ref = buf.readDoubleBE(undefined);
        expect(ref).assertEqual(123.456);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLEBE_0400
     * @tc.name  : testReadDoubleBE0004
     * @tc.desc  : Testing readDoubleBE for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadDoubleBE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadDoubleBE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(123.456, 0);
        let ref = buf.readDoubleBE(null);
        expect(ref).assertEqual(123.456);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLELE_0100
     * @tc.name  : testReadDoubleLE0001
     * @tc.desc  : Testing readDoubleLE for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadDoubleLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadDoubleLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(123.456, 0);
        let ref = buf.readDoubleLE();
        expect(ref).assertEqual(123.456);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLELE_0200
     * @tc.name  : testReadDoubleLE0002
     * @tc.desc  : Testing readDoubleLE for buffer with value 1.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadDoubleLE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadDoubleLE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(123.456, 0);
        let ref = buf.readDoubleLE(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLELE_0300
     * @tc.name  : testReadDoubleLE0003
     * @tc.desc  : Testing readDoubleLE for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadDoubleLE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadDoubleLE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(123.456, 0);
        let ref = buf.readDoubleLE(undefined);
        expect(ref).assertEqual(123.456);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLELE_0400
     * @tc.name  : testReadDoubleLE0004
     * @tc.desc  : Testing readDoubleLE for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadDoubleLE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadDoubleLE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(123.456, 0);
        let ref = buf.readDoubleLE(null);
        expect(ref).assertEqual(123.456);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READFLOATBE_0100
     * @tc.name  : testReadFloatBE0001
     * @tc.desc  : Testing readFloatBE for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadFloatBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadFloatBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatBE(0xcabcbcbc, 0);
        let ref = buf.readFloatBE(0).toString(16);
        expect(ref).assertEqual("cabcbd00");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READFLOATBE_0200
     * @tc.name  : testReadFloatBE0002
     * @tc.desc  : Testing readFloatBE for buffer with value 1.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadFloatBE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadFloatBE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatBE(0xcabcbcbc, 0);
        let ref = buf.readFloatBE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READFLOATBE_0300
     * @tc.name  : testReadFloatBE0003
     * @tc.desc  : Testing readFloatBE for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadFloatBE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadFloatBE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatBE(0xcabcbcbc, 0);
        let ref = buf.readFloatBE(undefined).toString(16);
        expect(ref).assertEqual("cabcbd00");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READFLOATBE_0400
     * @tc.name  : testReadFloatBE0004
     * @tc.desc  : Testing readFloatBE for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadFloatBE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadFloatBE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatBE(0xcabcbcbc, 0);
        let ref = buf.readFloatBE(null).toString(16);
        expect(ref).assertEqual("cabcbd00");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READFLOATLE_0100
     * @tc.name  : testReadFloatLE0001
     * @tc.desc  : Testing readFloatLE for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadFloatLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadFloatLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatLE(0xcabcbcbc, 0);
        let ref = buf.readFloatLE(0).toString(16);
        expect(ref).assertEqual("cabcbd00");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READFLOATLE_0200
     * @tc.name  : testReadFloatLE0002
     * @tc.desc  : Testing readFloatLE for buffer with value 1.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadFloatLE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadFloatLE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatLE(0xcabcbcbc, 0);
        let ref = buf.readFloatLE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READFLOATLE_0300
     * @tc.name  : testReadFloatLE0003
     * @tc.desc  : Testing readFloatLE for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadFloatLE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadFloatLE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatLE(0xcabcbcbc, 0);
        let ref = buf.readFloatLE(undefined).toString(16);
        expect(ref).assertEqual("cabcbd00");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READFLOATLE_0400
     * @tc.name  : testReadFloatLE0004
     * @tc.desc  : Testing readFloatLE for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadFloatLE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadFloatLE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatLE(0xcabcbcbc, 0);
        let ref = buf.readFloatLE(null).toString(16);
        expect(ref).assertEqual("cabcbd00");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT_0100
     * @tc.name  : testReadInt80001
     * @tc.desc  : Testing readInt8 for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt80001";
      try {
        let buf = buffer.allocUninitializedFromPool(2);
        buf.writeInt8(0x12);
        let ref = buf.readInt8(0).toString(16);
        expect(ref).assertEqual("12");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT_0200
     * @tc.name  : testReadInt80002
     * @tc.desc  : Testing readInt8 for buffer with value 2.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt80002";
      try {
        let buf = buffer.allocUninitializedFromPool(2);
        buf.writeInt8(0x12);
        let ref = buf.readInt8(2).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT_0300
     * @tc.name  : testReadInt80003
     * @tc.desc  : Testing readInt8 for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt80003";
      try {
        let buf = buffer.allocUninitializedFromPool(2);
        buf.writeInt8(0x12);
        let ref = buf.readInt8(undefined).toString(16);
        expect(ref).assertEqual("12");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT_0400
     * @tc.name  : testReadInt80004
     * @tc.desc  : Testing readInt8 for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt80004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt80004";
      try {
        let buf = buffer.allocUninitializedFromPool(2);
        buf.writeInt8(0x12);
        let ref = buf.readInt8(null).toString(16);
        expect(ref).assertEqual("12");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT16BE_0100
     * @tc.name  : testReadInt16BE0001
     * @tc.desc  : Testing readInt16BE for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt16BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt16BE0001";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16BE(0x1234, 0);
        let ref = buf.readInt16BE(0).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT16BE_0200
     * @tc.name  : testReadInt16BE0002
     * @tc.desc  : Testing readInt16BE for buffer with value 1.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt16BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt16BE0002";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16BE(0x1234, 0);
        let ref = buf.readInt16BE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });
    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT16BE_0300
     * @tc.name  : testReadInt16BE0003
     * @tc.desc  : Testing readInt16BE for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt16BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt16BE0003";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16BE(0x1234, 0);
        let ref = buf.readInt16BE(undefined).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT16BE_0400
     * @tc.name  : testReadInt16BE0004
     * @tc.desc  : Testing readInt16BE for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt16BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt16BE0004";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16BE(0x1234, 0);
        let ref = buf.readInt16BE(null).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT16LE_0100
     * @tc.name  : testReadInt16LE0001
     * @tc.desc  : Testing readInt16LE for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt16LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt16LE0001";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16LE(0x1234, 0);
        let ref = buf.readInt16LE(0).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT16LE_0200
     * @tc.name  : testReadInt16LE0002
     * @tc.desc  : Testing readInt16LE for buffer with value 1.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt16LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt16LE0002";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16LE(0x1234, 0);
        let ref = buf.readInt16LE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });
    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT16LE_0300
     * @tc.name  : testReadInt16LE0003
     * @tc.desc  : Testing readInt16LE for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt16LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt16LE0003";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16LE(0x1234, 0);
        let ref = buf.readInt16LE(undefined).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT16LE_0400
     * @tc.name  : testReadInt16LE0004
     * @tc.desc  : Testing readInt16LE for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt16LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt16LE0004";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16LE(0x1234, 0);
        let ref = buf.readInt16LE(null).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT32BE_0100
     * @tc.name  : testReadInt32BE0001
     * @tc.desc  : Testing readInt32BE for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt32BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt32BE0001";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32BE(0x12345678, 0);
        let ref = buf.readInt32BE(0).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT32BE_0200
     * @tc.name  : testReadInt32BE0002
     * @tc.desc  : Testing readInt32BE for buffer with value 1.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt32BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt32BE0002";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32BE(0x12345678, 0);
        let ref = buf.readInt32BE(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT32BE_0400
     * @tc.name  : testReadInt32BE0004
     * @tc.desc  : Testing readInt32BE for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt32BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt32BE0004";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32BE(0x12345678, 0);
        let ref = buf.readInt32BE(undefined).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT32BE_0500
     * @tc.name  : testReadInt32BE0005
     * @tc.desc  : Testing readInt32BE for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt32BE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt32BE0005";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32BE(0x12345678, 0);
        let ref = buf.readInt32BE(null).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT32LE_0100
     * @tc.name  : testReadInt32LE0001
     * @tc.desc  : Testing readInt32LE for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt32LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt32LE0001";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32LE(0x12345678, 0);
        let ref = buf.readInt32LE(0).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT32LE_0200
     * @tc.name  : testReadInt32LE0002
     * @tc.desc  : Testing readInt32LE for buffer with value 1.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt32LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt32LE0002";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32LE(0x12345678, 0);
        let ref = buf.readInt32LE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT32LE_0300
     * @tc.name  : testReadInt32LE0003
     * @tc.desc  : Testing readInt32LE for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt32LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt32LE0003";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32LE(0x12345678, 0);
        let ref = buf.readInt32LE(undefined).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINT32LE_0400
     * @tc.name  : testReadInt32LE0004
     * @tc.desc  : Testing readInt32LE for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadInt32LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt32LE0004";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32LE(0x12345678, 0);
        let ref = buf.readInt32LE(null).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINTBE_0100
     * @tc.name  : testReadIntBE0001
     * @tc.desc  : Testing readIntBE for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadIntBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadIntBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntBE(0x123456789011, 0, 6);
        let ref = buf.readIntBE(0, 5).toString(16);
        expect(ref).assertEqual("1234567890");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINTBE_0200
     * @tc.name  : testReadIntBE0002
     * @tc.desc  : Testing readIntBE for buffer with value '(2, 5)'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadIntBE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadIntBE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntBE(0x123456789011, 0, 6);
        let ref = buf.readIntBE(2, 5).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINTBE_0300
     * @tc.name  : testReadIntBE0003
     * @tc.desc  : Testing readIntBE for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadIntBE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadIntBE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntBE(0x123456789011, 0, 6);
        let ref = buf.readIntBE(undefined, 5).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINTBE_0400
     * @tc.name  : testReadIntBE0004
     * @tc.desc  : Testing readIntBE for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadIntBE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadIntBE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntBE(0x123456789011, 0, 6);
        let ref = buf.readIntBE(null, 5).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINTLE_0100
     * @tc.name  : testReadIntLE0001
     * @tc.desc  : Testing readIntLE for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadIntLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadIntLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntLE(0x123456789011, 0, 6);
        let ref = buf.readIntLE(0, 5).toString(16);
        expect(ref).assertEqual("3456789011");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINTLE_0200
     * @tc.name  : testReadIntLE0002
     * @tc.desc  : Testing readIntLE for buffer with value '(2, 5)'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadIntLE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadIntLE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntLE(0x123456789011, 0, 6);
        let ref = buf.readIntLE(2, 5).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINTLE_0300
     * @tc.name  : testReadIntLE0003
     * @tc.desc  : Testing readIntLE for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadIntLE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadIntLE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntLE(0x123456789011, 0, 6);
        let ref = buf.readIntLE(undefined, 5).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READINTLE_0400
     * @tc.name  : testReadIntLE0004
     * @tc.desc  : Testing readIntLE for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadIntLE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadIntLE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntLE(0x123456789011, 0, 6);
        let ref = buf.readIntLE(null, 5).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT8_0100
     * @tc.name  : testReadIntLE0001
     * @tc.desc  : Testing readUInt8 for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadUInt80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt80001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(0x42);
        let ref = buf.readUInt8(0).toString(16);
        expect(ref).assertEqual("42");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT8_0200
     * @tc.name  : testReadIntLE0002
     * @tc.desc  : Testing readUInt8 for buffer with value '4'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadUInt80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt80002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(0x42);
        let ref = buf.readUInt8(4).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT8_0300
     * @tc.name  : testReadIntLE0003
     * @tc.desc  : Testing readUInt8 for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadUInt80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt80003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(0x42);
        let ref = buf.readUInt8(undefined).toString(16);
        expect(ref).assertEqual("42");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT8_0400
     * @tc.name  : testReadIntLE0004
     * @tc.desc  : Testing readUInt8 for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadUInt80004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt80004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(0x42);
        let ref = buf.readUInt8(null).toString(16);
        expect(ref).assertEqual("42");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT16BE_0100
     * @tc.name  : testReadUInt16BE0001
     * @tc.desc  : Testing readUInt16BE for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadUInt16BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt16BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0x1234, 0);
        let ref = buf.readUInt16BE(0).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT16BE_0200
     * @tc.name  : testReadUInt16BE0002
     * @tc.desc  : Testing readUInt16BE for buffer with value '3'.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadUInt16BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt16BE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0x1234, 0);
        let ref = buf.readUInt16BE(3).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT16BE_0300
     * @tc.name  : testReadUInt16BE0003
     * @tc.desc  : Testing readUInt16BE for buffer with value undefined.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadUInt16BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt16BE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0x1234, 0);
        let ref = buf.readUInt16BE(undefined).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT16BE_0400
     * @tc.name  : testReadUInt16BE0004
     * @tc.desc  : Testing readUInt16BE for buffer with value null.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testReadUInt16BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt16BE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0x1234, 0);
        let ref = buf.readUInt16BE(null).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0100
     * @tc.name: testEquals0001
     * @tc.desc: Test the equals interface by two identical buffers which content is numerical string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testEquals0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testEquals0001";
      try {
        let buf1 = buffer.from("1236");
        let buf2 = buffer.from("1235");
        let res = buf1.equals(buf2);
        expect(res).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0200
     * @tc.name: testEquals0002
     * @tc.desc: Test the equals interface by two identical buffers which content is include chinese string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testEquals0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testEquals0002";
      try {
        let buf1 = buffer.from("1236测试");
        let buf2 = buffer.from("1236测试");
        let res = buf1.equals(buf2);
        expect(res).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0300
     * @tc.name: testEquals0003
     * @tc.desc: Test the equals interface by two different buffers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testEquals0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testEquals0003";
      try {
        let buf1 = buffer.from("O@O");
        let buf2 = buffer.from("O^O");
        let res = buf1.equals(buf2);
        expect(res).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0400
     * @tc.name: testEquals0004
     * @tc.desc: Test the equals interface by passing the parameter undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testEquals0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testEquals0004";
      let buf = buffer.from("test");
      try {
        buf.equals(undefined);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0500
     * @tc.name: testEquals0005
     * @tc.desc: Test the equals interface by passing the parameter null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testEquals0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testEquals0005";
      let buf = buffer.from("test");
      try {
        buf.equals(null);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0600
     * @tc.name: testEquals0006
     * @tc.desc: Test the equals interface by two different type buffers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testEquals0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testEquals0006"
      let buf = buffer.from("ABC");
      try {
        let res = buf.equals(new Uint8Array([21, 31]));
        expect(res).assertFalse()
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAR_0100
     * @tc.name: testSubarray0001
     * @tc.desc: Test the subarray interface by pass the parameter start is 0 and end is 3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testSubarray0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSubarray0001";
      try {
        let buf = buffer.from("1236");
        let subBuf = buf.subarray(0, 3);
        let str = subBuf.toString();
        expect(str).assertEqual("123");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
      ;
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAR_0200
     * @tc.name: testSubarray0002
     * @tc.desc: Test the subarray interface by pass the parameter undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testSubarray0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSubarray0002";
      try {
        let buf = buffer.from("1236");
        let subBuf = buf.subarray(undefined);
        let str = subBuf.toString();
        expect(str).assertEqual("1236");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
      ;
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAR_0300
     * @tc.name: testSubarray0003
     * @tc.desc: Test the subarray interface by pass the parameter null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testSubarray0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSubarray0003";
      try {
        let buf = buffer.from("1236");
        let subBuf = buf.subarray(null);
        let str = subBuf.toString();
        expect(str).assertEqual("1236");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
      ;
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAR_0400
     * @tc.name: testSubarray0004
     * @tc.desc: Test the subarray interface by pass the parameter start is 3 and end is 4.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testSubarray0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSubarray0004";
      try {
        let buf1 = buffer.from("1236");
        let buf = buf1.subarray(3, 4);
        let str = buf.toString();
        expect(str).assertEqual("6");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
      ;
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAR_0500
     * @tc.name: testSubarray0005
     * @tc.desc: Test the subarray interface by pass the parameter start is -3 and end is 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testSubarray0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSubarray0005";
      try {
        let buf1 = buffer.from("1236");
        let buf = buf1.subarray(-3, 0);
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAR_0600
     * @tc.name: testSubarray0006
     * @tc.desc: Test the subarray interface by pass the parameter start is 6 and end is 9.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testSubarray0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSubarray0006";
      try {
        let buf = buffer.from("1236");
        let subBuf = buf.subarray(6, 9);
        expect(subBuf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COPY_0100
     * @tc.name: testCopy0001
     * @tc.desc: Test the copy interface by copying one buffer of numeric string type  to other buffer of numeric
     * string type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testCopy0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCopy0001";
      try {
        let buf1 = buffer.from("1236");
        let buf2 = buffer.from("1235");
        let num = buf1.copy(buf2);
        expect(num).assertEqual(4);
        let str = buf2.toString();
        expect(str).assertEqual("1236");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
      ;
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COPY_0200
     * @tc.name: testCopy0002
     * @tc.desc: Test the copy interface by copying one buffer of chinese string type  to other buffer of numeric
     * string type,and setting the parameter targetStart to 2,sourceStart to 1,sourceStart to 3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testCopy0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCopy0002";
      try {
        let buf1 = buffer.from("abcdefg");
        let buf2 = buffer.from("1235789");
        let num = buf1.copy(buf2, 2, 1, 3);
        expect(num).assertEqual(2);
        let str = buf2.toString();
        expect(str).assertEqual("12bc789");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
      ;
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COPY_0300
     * @tc.name: testCopy0003
     * @tc.desc: Test the copy interface by copying one buffer of special string type  to other buffer of empty
     * string type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testCopy0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCopy0003";
      try {
        let buf1 = buffer.from("ab$#");
        let buf2 = buffer.from("");
        let num = buf1.copy(buf2);
        expect(num).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COPY_0400
     * @tc.name: testCopy0004
     * @tc.desc: Test the copy interface by copying one buffer which length is large than another to other buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testCopy0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCopy0004";
      try {
        let buf1 = buffer.from("123656");
        let buf2 = buffer.from("1235");
        let num = buf1.copy(buf2);
        expect(num).assertEqual(4);
        let str = buf2.toString();
        expect(str).assertEqual("1236");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COPY_0500
     * @tc.name: testCopy0005
     * @tc.desc: Test the copy interface by copying one buffer to other buffer,and passing the parameter sourceStart
     * to -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testCopy0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCopy0005";
      let buf1 = buffer.from("123656");
      let buf2 = buffer.from("1235");
      try {
        buf1.copy(buf2, -1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COPY_0600
     * @tc.name: testCopy0006
     * @tc.desc: Test the copy interface by copying one buffer which length is smaller than another to other buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testCopy0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCopy0006";
      try {
        let buf1 = buffer.from("ab$#");
        let buf2 = buffer.from("123556");
        let num = buf1.copy(buf2);
        expect(num).assertEqual(4);
        let str = buf2.toString();
        expect(str).assertEqual("ab$#56");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COPY_0700
     * @tc.name: testCopy0007
     * @tc.desc: Test the copy interface by passing the parameter target undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testCopy0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCopy0007";
      try {
        let buf = buffer.from("12356");
        buf.copy(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COPY_0800
     * @tc.name: testCopy0008
     * @tc.desc: Test the copy interface by passing the parameter target null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testCopy0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCopy0008";
      try {
        let buf = buffer.from("12356");
        buf.copy(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COPY_0900
     * @tc.name: testCopy0009
     * @tc.desc: Test the copy interface by copying one buffer of string type to other buffer of array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testCopy0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCopy0009";
      try {
        let buf1 = buffer.from("123656");
        let buf2 = new Uint8Array([21, 31]);
        let num = buf1.copy(buf2);
        expect(num).assertEqual(2);
        let str = '';
        for (const codePoint of buf2) {
          str += String.fromCharCode(codePoint);
        }
        expect(str).assertEqual("12")
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0100
     * @tc.name: testToString0001
     * @tc.desc: Test the toString interface by source buffer of numerical string type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testToString0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0001";
      try {
        let buf = buffer.from("1236");
        let str = buf.toString();
        expect(str).assertEqual("1236");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0200
     * @tc.name: testToString0002
     * @tc.desc: Test the toString interface by source buffer of chinese string type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testToString0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0002";
      try {
        let buf = buffer.from("张三");
        let str = buf.toString();
        expect(str).assertEqual("张三");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0300
     * @tc.name: testToString0003
     * @tc.desc: Test the toString interface by passing the parameter encoding to "binary".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testToString0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0003";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("binary");
        expect(str).assertEqual("abc");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0400
     * @tc.name: testToString0004
     * @tc.desc: Test the toString interface by passing the parameter encoding to "ascii".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testToString0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0004";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("ascii");
        expect(str).assertEqual("abc");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0500
     * @tc.name: testToString0005
     * @tc.desc: Test the toString interface by passing the parameter encoding to "base64".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testToString0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0005";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("base64");
        expect(str).assertEqual("YWJj");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0600
     * @tc.name: testToString0006
     * @tc.desc: Test the toString interface by passing the parameter encoding to "hex".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testToString0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0006";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("hex");
        expect(str).assertEqual("616263");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0700
     * @tc.name: testToString0007
     * @tc.desc: Test the toString interface by passing the parameter encoding to "latin1".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testToString0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0007";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("latin1");
        expect(str).assertEqual("abc");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0800
     * @tc.name: testToString0008
     * @tc.desc: Test the toString interface by passing the parameter encoding to "ucs2".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testToString0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0008";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("ucs2");
        expect(str).assertEqual("扡");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0900
     * @tc.name: testToString0009
     * @tc.desc: Test the toString interface by passing the parameter encoding to "utf16le".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testToString0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0009";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("utf16le");
        expect(str).assertEqual("扡");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1000
     * @tc.name: testToString0010
     * @tc.desc: Test the toString interface by source buffer of special string type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testToString0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0010";
      try {
        let buf = buffer.from("!@#$%^&*");
        let str = buf.toString();
        expect(str).assertEqual("!@#$%^&*");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1100
     * @tc.name: testToString0011
     * @tc.desc: Test the toString interface by source buffer of long string type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testToString0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0011";
      try {
        let str =
          "abcdefhajksalfsdfjl12346287467823®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîï" +
            "ðñòóôõö÷øùúûüýþÿ"
        let strbuf = buffer.from(str, "latin1");
        let toStr = strbuf.toString("latin1");
        expect(toStr)
          .assertEqual("abcdefhajksalfsdfjl12346287467823®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëì" +
            "íîïðñòóôõö÷øùúûüýþÿ");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1200
     * @tc.name: testToString0012
     * @tc.desc: Test the toString interface by passing the parameter encoding to illegal value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testToString0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0012"
      let buf = buffer.from("abc");
      try {
        buf.toString("code");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1300
     * @tc.name: testToString0013
     * @tc.desc: Test the toString interface by passing the parameter encoding to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testToString0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0013";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString(undefined);
        expect(str).assertEqual("abc");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1500
     * @tc.name: testToString0014
     * @tc.desc: Test the toString interface by passing the parameter encoding to null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testToString0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0014";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString(null);
        expect(str).assertEqual("abc");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1500
     * @tc.name: testToString0015
     * @tc.desc: Test the toString interface by passing the parameter encoding to "binary", start to 1, and end to 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testToString0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0015";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("binary", 1, 2);
        expect(str).assertEqual("b");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1600
     * @tc.name: testToString0016
     * @tc.desc: Test the toString interface by passing the parameter encoding to "binary", start to -1, and end to 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testToString0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0016";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("binary", -1, 2);
        expect(str).assertEqual("ab");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1700
     * @tc.name: testToString0017
     * @tc.desc: Test the toString interface by passing the parameter encoding to "binary", start to 1, and end to 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testToString0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0017";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("binary", 1, -2);
        expect(str).assertEqual("");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOJSON_0100
     * @tc.name: testToJSON0001
     * @tc.desc: Test the toJSON interface source buffer of numerical string type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testToJSON0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToJSON0001";
      try {
        let buf = buffer.from("1236");
        let obj = buf.toJSON();
        expect(JSON.parse(JSON.stringify(obj)).data.join("")).assertEqual("49505154");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0100
     * @tc.name: testIndexOf0001
     * @tc.desc: Test the indexOf interface by passing the parameter value to a character string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIndexOf0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIndexOf0001";
      try {
        let buf = buffer.from("13236");
        let index = buf.indexOf("3");
        expect(index).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0200
     * @tc.name: testIndexOf0002
     * @tc.desc: Test the indexOf interface by passing the parameter value to a character string, and byteOffset to 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIndexOf0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIndexOf0002";
      try {
        let buf = buffer.from("13236");
        let index = buf.indexOf("3", 2);
        expect(index).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0300
     * @tc.name: testIndexOf0003
     * @tc.desc: Test the indexOf interface by passing the parameter value to two character string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIndexOf0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIndexOf0003";
      try {
        let buf = buffer.from("13236235");
        let index = buf.indexOf("23");
        expect(index).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0400
     * @tc.name: testIndexOf0004
     * @tc.desc: Test the indexOf interface by passing the parameter value to special string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIndexOf0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIndexOf0004";
      try {
        let buf = buffer.from("测试特殊字符$#@!");
        let index = buf.indexOf("@");
        expect(index).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0500
     * @tc.name: testIndexOf0005
     * @tc.desc: Test the indexOf interface by passing the parameter value to two character string, and byteOffset to 3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIndexOf0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIndexOf0005";
      try {
        let buf = buffer.from("13236235");
        let index = buf.indexOf("23", 3);
        expect(index).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0600
     * @tc.name: testIndexOf0006
     * @tc.desc: Test the indexOf interface by passing the parameter value which is not in the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIndexOf0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIndexOf0006";
      try {
        let buf = buffer.from("13236");
        let index = buf.indexOf("a");
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0700
     * @tc.name: testIndexOf0007
     * @tc.desc: Test the indexOf interface by passing the parameter value which is not in the buffer,and byteOffset to 0,
     * encode is "BufferEncoding".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIndexOf0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIndexOf0007";
      try {
        let encodeArr: buffer.BufferEncoding[] = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
          'utf16le', 'base64', 'base64url', 'hex'];
        let buf = buffer.from("13236");
        for (const encode of encodeArr) {
          let index = buf.indexOf("ab", 0, encode);
          expect(index).assertEqual(-1);
        }
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0800
     * @tc.name: testIndexOf0008
     * @tc.desc: Test the indexOf interface by passing the parameter value to empty string,
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIndexOf0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIndexOf0008";
      try {
        let buf = buffer.from("123");
        let index = buf.indexOf("");
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0900
     * @tc.name: testIndexOf0009
     * @tc.desc: Test the indexOf interface by passing the parameter value to one space string,
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIndexOf0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIndexOf0009";
      try {
        let buf = buffer.from("123 ");
        let index = buf.indexOf(" ");
        expect(index).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_1000
     * @tc.name: testIndexOf0010
     * @tc.desc: Test the indexOf interface by passing the parameter value to undefined,
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIndexOf0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIndexOf0010"
      let buf = buffer.from("123");
      try {
        buf.indexOf(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_1100
     * @tc.name: testIndexOf0011
     * @tc.desc: Test the indexOf interface by passing the parameter value to null,
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIndexOf0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIndexOf0011"
      let buf = buffer.from("123");
      try {
        buf.indexOf(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0100
     * @tc.name: testLastIndexOf0001
     * @tc.desc: Test the lastIndexOf interface by passing the parameter value to a character string which is in the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testLastIndexOf0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testLastIndexOf0001";
      try {
        let buf = buffer.from("13236");
        let index = buf.lastIndexOf("3");
        expect(index).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0200
     * @tc.name: testLastIndexOf0002
     * @tc.desc: Test the lastIndexOf interface by passing the parameter value to a character string which is in the buffer
     * and byteOffset to 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testLastIndexOf0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testLastIndexOf0002";
      try {
        let buf = buffer.from("13236");
        let index = buf.lastIndexOf("3", 2);
        expect(index).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0300
     * @tc.name: testLastIndexOf0003
     * @tc.desc: Test the lastIndexOf interface by passing the parameter value to two character string which is in the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testLastIndexOf0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testLastIndexOf0003";
      try {
        let buf = buffer.from("13236235");
        let index = buf.lastIndexOf("23");
        expect(index).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0400
     * @tc.name: testLastIndexOf0004
     * @tc.desc: Test the lastIndexOf interface by passing the parameter value to two character string which is in the buffer
     * and byteOffset to 3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testLastIndexOf0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testLastIndexOf0004";
      try {
        let buf = buffer.from("13236235");
        let index = buf.lastIndexOf("23", 3);
        expect(index).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0500
     * @tc.name: testLastIndexOf0005
     * @tc.desc: Test the lastIndexOf interface by passing the parameter value which is not in the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testLastIndexOf0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testLastIndexOf0005";
      try {
        let buf = buffer.from("13236");
        let index = buf.lastIndexOf("a");
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0600
     * @tc.name: testLastIndexOf0006
     * @tc.desc: Test the indexOf interface by passing the parameter value which is not in the buffer,and byteOffset to 0,
     * and encode to "BufferEncoding"
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testLastIndexOf0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testLastIndexOf0006";
      try {
        let encodeArr: buffer.BufferEncoding[] = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
          'utf16le', 'base64', 'base64url', 'hex'];
        let buf = buffer.from("13236");
        for (const encode of encodeArr) {
          let index = buf.lastIndexOf("ab", 0, encode);
          expect(index).assertEqual(-1);
        }
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0700
     * @tc.name: testLastIndexOf0007
     * @tc.desc: Test the indexOf interface by passing the parameter value to empty string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testLastIndexOf0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testLastIndexOf0007"
      let buf = buffer.from("123");
      try {
        let index = buf.lastIndexOf("");
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0800
     * @tc.name: testLastIndexOf0008
     * @tc.desc: Test the indexOf interface by passing the parameter value to space string which is in the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testLastIndexOf0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testLastIndexOf0008"
      let buf = buffer.from("123 ");
      try {
        let index = buf.lastIndexOf(" ");
        expect(index).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0900
     * @tc.name: testLastIndexOf0009
     * @tc.desc: Test the indexOf interface by passing the parameter value to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testLastIndexOf0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testLastIndexOf0009";
      let buf = buffer.from("123 ");
      try {
        buf.lastIndexOf(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1000
     * @tc.name: testLastIndexOf0010
     * @tc.desc: Test the indexOf interface by passing the parameter value to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testLastIndexOf0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testLastIndexOf0010";
      let buf = buffer.from("123 ");
      try {
        buf.lastIndexOf(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1300
     * @tc.name: testLastIndexOf0013
     * @tc.desc: Test the indexOf interface by passing the parameter offset to abnormal value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testLastIndexOf0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testLastIndexOf0013"
      let buf = buffer.from("13236235");
      try {
        let index = buf.lastIndexOf("23", 9999999);
        expect(index).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0100
     * @tc.name: testIncludes0001
     * @tc.desc: Test the includes interface by passing the parameter value to a numerical string which is in the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIncludes0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIncludes0001";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("3");
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0200
     * @tc.name: testIncludes0002
     * @tc.desc: Test the includes interface by passing the parameter value to a numerical string which is in the buffer,
     * and byteOffset to 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIncludes0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIncludes0002";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("3", 2);
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0300
     * @tc.name: testIncludes0003
     * @tc.desc: Test the includes interface by passing the parameter value to two numerical string which is in the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIncludes0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIncludes0003";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("32");
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0400
     * @tc.name: testIncludes0004
     * @tc.desc: Test the includes interface by passing the parameter value to two numerical string which is in the buffer,
     * and byteOffset to 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIncludes0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIncludes0004";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("32", 2);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0500
     * @tc.name: testIncludes0005
     * @tc.desc: Test the includes interface by passing the parameter value to special string which is in the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIncludes0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIncludes0005";
      try {
        let buf = buffer.from("测试特殊字符$#@!");
        let flag = buf.includes("#@");
        expect(flag).assertEqual(true);
        flag = buf.includes("测试");
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0600
     * @tc.name: testIncludes0006
     * @tc.desc: Test the includes interface by passing the parameter value to string which is not in the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIncludes0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIncludes0006";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("abc");
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0700
     * @tc.name: testIncludes0007
     * @tc.desc: Test the includes interface by passing the parameter value to string which is not in the buffer,and byteOffset
     * to 0, encode to "BufferEncoding"
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIncludes0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIncludes0007";
      try {
        let encodeArr: buffer.BufferEncoding[] = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
          'utf16le', 'base64', 'base64url', 'hex'];
        for (const encode of encodeArr) {
          let buf = buffer.from("13236");
          let flag = buf.includes("abc", 0, encode);
          expect(flag).assertEqual(false);
        }
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0800
     * @tc.name: testIncludes0008
     * @tc.desc: Test the includes interface by passing the parameter value to number but source buffer of string type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIncludes0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIncludes0008";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes(32);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0900
     * @tc.name: testIncludes0009
     * @tc.desc: Test the includes interface by passing the parameter value to empty string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIncludes0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIncludes0009";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("");
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1000
     * @tc.name: testIncludes0010
     * @tc.desc: Test the includes interface by passing the parameter value to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIncludes0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIncludes0010";
      try {
        let buf = buffer.from("13236");
        buf.includes(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1100
     * @tc.name: testIncludes0011
     * @tc.desc: Test the includes interface by passing the parameter value to null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIncludes0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIncludes0011";
      try {
        let buf = buffer.from("13236");
        buf.includes(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1200
     * @tc.name: testIncludes0012
     * @tc.desc: Test the includes interface by passing the parameter value which is in the source buffer and
     * byteOffset to -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIncludes0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIncludes0012";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("32", -1);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1300
     * @tc.name: testIncludes0013
     * @tc.desc: Test the includes interface by passing the parameter value which is in the source buffer and
     * and byteOffset to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testIncludes0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIncludes0013";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("32", undefined);
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SWAP16_0100
     * @tc.name: testSwap160001
     * @tc.desc: Test the swap16 interface by source buffer which size is multiple of 16-bits.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testSwap160001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSwap160001";
      try {
        let buf = buffer.from("1323");
        buf.swap16();
        let str = buf.toString("hex");
        expect(str).assertEqual("33313332");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SWAP16_0200
     * @tc.name: testSwap160002
     * @tc.desc: Test the swap16 interface by source buffer which size is not multiple of 16-bits.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testSwap160002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSwap160002";
      let buf = buffer.from("132");
      try {
        buf.swap16();
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200009);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SWAP16_0300
     * @tc.name: testSwap160003
     * @tc.desc: Test the swap16 interface by source buffer which size is 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testSwap160003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSwap160003";
      try {
        let buf = buffer.from("");
        buf.swap16();
        let str = buf.toString();
        expect(str).assertEqual("");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SWAP32_0100
     * @tc.name: testSwap320001
     * @tc.desc: Test the swap32 interface by source buffer which size is multiple of 32-bits.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testSwap320001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSwap320001";
      try {
        let buf1 = buffer.from("1234");
        buf1.swap32();
        let str = buf1.toString();
        expect(str).assertEqual("4321");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SWAP32_0200
     * @tc.name: testSwap320002
     * @tc.desc: Test the swap32 interface by source buffer which size is multiple of 32-bits.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testSwap320002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSwap320002";
      let buf = buffer.from("132");
      try {
        buf.swap32();
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200009);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SWAP32_0300
     * @tc.name: testSwap320003
     * @tc.desc: Test the swap32 interface by source buffer which size is 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testSwap320003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSwap320003";
      try {
        let buf = buffer.from("");
        buf.swap32();
        let str = buf.toString();
        expect(str).assertEqual("");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SWAP64_0100
     * @tc.name: testSwap640001
     * @tc.desc: Test the swap64 interface by source buffer which size is multiple of 64-bits .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testSwap640001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSwap640001";
      try {
        let buf = buffer.from("12345678");
        buf.swap64();
        let str = buf.toString();
        expect(str).assertEqual("87654321");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SWAP64_0200
     * @tc.name: testSwap640002
     * @tc.desc: Test the swap64 interface by source buffer which size is not multiple of 64-bits.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testSwap640002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSwap640002";
      let buf = buffer.from("1234567");
      try {
        buf.swap64();
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200009);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SWAP64_0300
     * @tc.name: testSwap640003
     * @tc.desc: Test the swap64 interface by source buffer which size is 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testSwap640003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSwap640003";
      try {
        let buf = buffer.from("");
        buf.swap64();
        let str = buf.toString();
        expect(str).assertEqual("");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_KEYS_0100
     * @tc.name: testKeys0001
     * @tc.desc: Test the keys interface by source buffer which created from uint8Array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testKeys0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testKeys0001";
      try {
        let buf = buffer.from("1234");
        let keys = buf.keys();
        let index = 0;
        for (const key of keys) {
          expect(key).assertEqual(index);
          index++;
        }
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_KEYS_0200
     * @tc.name: testKeys0002
     * @tc.desc: Test the keys interface by source buffer created from uint8Array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testKeys0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testKeys0002";
      try {
        let uArr = new Uint8Array(4);
        uArr[0] = 0x31;
        uArr[1] = 0x32;
        uArr[2] = 0x33;
        uArr[3] = 0x34;
        let buf = buffer.from(uArr);
        let keys = buf.keys();
        let index = 0;
        for (const key of keys) {
          expect(key).assertEqual(index);
          index++;
        }
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_KEYS_0300
     * @tc.name: testKeys0003
     * @tc.desc: Test the keys interface by source buffer which size is 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testKeys0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testKeys0003";
      try {
        let buf = buffer.from("");
        let keys = buf.keys();
        expect(isIteratorEmpty(keys)).assertTrue()
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_VALUES_0100
     * @tc.name: testValues0001
     * @tc.desc: Test the values interface by source buffer which created from string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testValues0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testValues0001";
      try {
        let buf = buffer.from("1234");
        let values = buf.values();
        let va = 49;
        for (const value of values) {
          expect(value).assertEqual(va);
          va++;
        }
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_VALUES_0200
     * @tc.name: testValues0002
     * @tc.desc: Test the values interface by source buffer which created from uint8Array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testValues0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testValues0002";
      try {
        let uArr = new Uint8Array(4);
        uArr[0] = 0x31;
        uArr[1] = 0x32;
        uArr[2] = 0x33;
        uArr[3] = 0x34;
        let buf = buffer.from(uArr);
        let values = buf.values();
        let va = 0x31;
        for (const value of values) {
          expect(value).assertEqual(va);
          va++;
        }
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_VALUES_0300
     * @tc.name: testValues0003
     * @tc.desc: Test the values interface by source buffer which size is 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testValues0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testValues0003";
      try {
        let buf = buffer.from("");
        let values = buf.values();
        expect(isIteratorEmpty(values)).assertTrue()
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ENTRIES_0100
     * @tc.name: testEntries0001
     * @tc.desc: Test the entries interface by source buffer which created from string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testEntries0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testEntries0001";
      try {
        let buf = buffer.from("1234");
        let entries = buf.entries();
        let va = 49, index = 0;
        for (const entry of entries) {
          expect(entry[0]).assertEqual(index);
          expect(entry[1]).assertEqual(va);
          va++;
          index++;
        }
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ENTRIES_0200
     * @tc.name: testEntries0002
     * @tc.desc: Test the entries interface by source buffer which created from Uint8Array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testEntries0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testEntries0001";
      try {
        let uArr = new Uint8Array(4);
        uArr[0] = 0x31;
        uArr[1] = 0x32;
        uArr[2] = 0x33;
        uArr[3] = 0x34;
        let buf1 = buffer.from(uArr);
        let entries = buf1.entries();
        let va = 49, index = 0;
        for (const entry of entries) {
          expect(entry[0]).assertEqual(index);
          expect(entry[1]).assertEqual(va);
          va++;
          index++;
        }
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_0100
     * @tc.name: testFrom0001
     * @tc.desc: Test the from interface by Coping the passed buffer data onto a new Buffer instance.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testFrom0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0001";
      try {
        let uArr = new Uint8Array(3);
        uArr[0] = 0x12;
        uArr[1] = 0x34;
        uArr[2] = 0x56;
        let buf = buffer.from(uArr);
        let str = buf.toString("hex");
        expect(str).assertEqual("123456");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_0200
     * @tc.name: testFrom0002
     * @tc.desc: Test the from interface by Allocatting a new Buffer using an array of bytes in the range 0 – 255.
     * Array entries outside that range will be truncated to fit into it.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testFrom0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0002";
      try {
        const buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
        let str = buf.toString("hex");
        expect(str).assertEqual("627566666572");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_0300
     * @tc.name: testFrom0003
     * @tc.desc: Test the from interface by creatting a view of the ArrayBuffer without copying the underlying memory.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testFrom0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0003";
      try {
        const arr = new Uint8Array(2);
        arr[0] = 97;
        arr[1] = 98;
        const buf = buffer.from(arr.buffer);
        arr[0] = 99
        buf[1] = 100
        let str = buf.toString("hex");
        expect(str).assertEqual("6364");
        expect(arr[1]).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_0400
     * @tc.name: testFrom0004
     * @tc.desc: Test the from interface by creatting a view of the ArrayBuffer without copying the underlying memory.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testFrom0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0004";
      try {
        const arr = new Uint8Array(2);
        arr[0] = 97;
        arr[1] = 98;
        const buf = buffer.from(arr.buffer, 1);
        buf[0] = 99;
        let str = buf.toString("hex");
        expect(str).assertEqual("63");
        expect(arr[1]).assertEqual(99);
        expect(buf[0]).assertEqual(99);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_0500
     * @tc.name: testFrom0005
     * @tc.desc: Test the from interface by Copping the passed buffer data onto a new Buffer instance.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testFrom0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0005";
      try {
        const buf1 = buffer.from('buffer');
        const buf2 = buffer.from(buf1);
        buf1[0] = 0x61;
        let str = buf1.toString();
        expect(str).assertEqual("auffer");
        str = buf2.toString();
        expect(str).assertEqual("buffer");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_0600
     * @tc.name: testFrom0006
     * @tc.desc: Test the from interface by Creatting a new Buffer containing string. The encoding parameter identifies
     * the character encoding to be used when converting string into bytes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testFrom0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0006";
      try {
        const buf1 = buffer.from('this is a test');
        let str = buf1.toString();
        expect(str).assertEqual("this is a test");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_0700
     * @tc.name: testFrom0007
     * @tc.desc: Test the from interface by creatting a new Buffer containing string. The encoding parameter identifies
     * the character encoding to be used when converting string into bytes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testFrom0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0007";
      try {
        const buf1 = buffer.from('F1刘FG', 'hex');
        let str = buf1.toString('hex');
        expect(str).assertEqual("f1");

        let buf2 = buffer.from("F1FG", "ascii")
        str = buf2.toString("ascii");
        expect(str).assertEqual("F1FG");

        let buf3 = buffer.from("F1FG刘", "base64")
        str = buf3.toString("base64");
        expect(str).assertEqual("F1FG");

        let buf4 = buffer.from("F1FG刘", "base64url")
        str = buf4.toString("base64url");
        expect(str).assertEqual("F1FG");

        let buf5 = buffer.from("F1FG", "binary")
        str = buf5.toString("binary");
        expect(str).assertEqual("F1FG");

        let buf6 = buffer.from("F1FG", "latin1")
        str = buf6.toString("latin1");
        expect(str).assertEqual("F1FG");

        let buf7 = buffer.from("F1FG刘", "ucs2")
        str = buf7.toString("ucs2");
        expect(str).assertEqual("F1FG刘");

        let buf8 = buffer.from("F1FG刘", "utf16le")
        str = buf8.toString("utf16le");
        expect(str).assertEqual("F1FG刘");

        let buf9 = buffer.from("F1FG刘", "ucs2")
        str = buf9.toString("ucs2");
        expect(str).assertEqual("F1FG刘");

        let buf10 = buffer.from("F1FG刘", "utf-8")
        str = buf10.toString("utf-8");
        expect(str).assertEqual("F1FG刘");

        let buf11 = buffer.from("F1FG刘", "utf8")
        str = buf11.toString("utf8");
        expect(str).assertEqual("F1FG刘");

        let buf12 = buffer.from("AsD-_QWEr", "base64url")
        str = buf12.toString("hex");
        expect(str).assertEqual("02c0fefd0584");

        let buf13 = buffer.from("AsDQWEr134", "base64url")
        str = buf13.toString("hex");
        expect(str).assertEqual("02c0d0584af5df");

        let buf14 = buffer.from("_AsDQ-12W7Er_", "base64url")
        str = buf14.toString("hex");
        expect(str).assertEqual("fc0b0343ed765bb12b");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_0800
     * @tc.name: testFrom0008
     * @tc.desc: Test the from interface For the object whose value returned by valueof() function is strictly equal to
     * object or supports symbol To primitive object, a new buffer instance is created.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testFrom0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0008";
      try {
        const buf = buffer.from(new String('this is a test'));
        let str = buf.toString();
        expect(str).assertEqual("this is a test");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_0900
     * @tc.name: testFrom0009
     * @tc.desc: Test the from interface for the object whose value returned by valueof() function is strictly equal
     *  to object or supports symbol To primitive object, a new buffer instance is created.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testFrom0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0009";
      try {
        class Foo {
          valueOf() {
            return 'this is a test';
          }

          toString() {
            return 'this is a test';
          }
        }

        let foo = new Foo();
        const buf = buffer.from(foo, 'utf8', 0);
        let str = buf.toString();
        expect(str).assertEqual("this is a test");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_1000
     * @tc.name: testFrom0010
     * @tc.desc: Test the from interface by creating a new buffer containing a newline character string. Creating using
     *  base64 encoding
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testFrom0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0010";
      try {
        const str =
          `MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC/OgIQLaulKklB\npZltSaWwM3Cnzcmvh+LoqYFYjCePUxnoJRDusFqy4sjwBx9fn/XSxxJ9A0KxMtXa\nr7YFjwQo3FsIjLZ3+8wS+Kydcg==`;
        const buf = buffer.from(str, 'base64');
        let ref = buf.readInt8(buf.length - 1);
        expect(ref).assertEqual(114);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_1100
     * @tc.name: testFrom0011
     * @tc.desc: Test the from interface by pass the parameter array to undefined
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testFrom0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0011";
      try {
        buffer.from(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_1200
     * @tc.name: testFrom0012
     * @tc.desc: Test the from interface by pass the parameter array to null
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testFrom0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0012";
      try {
        buffer.from(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_1300
     * @tc.name: testFrom0013
     * @tc.desc: Test the from interface by pass the parameter byteOffset is outside of the range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testFrom0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0013";
      let arrayBuffer = new ArrayBuffer(5);
      let array = new Int8Array(arrayBuffer);
      array[0] = 1;
      array[1] = 2;
      array[2] = 3;
      array[3] = 4;
      array[4] = 5;
      try {
        buffer.from(arrayBuffer, 6, 1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_1400
     * @tc.name: testFrom0014
     * @tc.desc: Test the from interface by copping a buffer which is created from "Uint8Array" and pass byteOffset to -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testFrom0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0014";
      try {
        let buf = new Uint8Array([97, 98]);
        const buf1 = buffer.from(buf, -1);
        let str = buf1.toString();
        expect(str).assertEqual("ab");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_1500
     * @tc.name: testFrom0015
     * @tc.desc: Test the from interface by copping a buffer which is created from "Uint8Array" and pass byteOffset to -1
     * and lenrth to -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testFrom0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0015";
      try {
        let buf = new Uint8Array([97, 98]);
        const buf1 = buffer.from(buf, -1, -1);
        let str = buf1.toString();
        expect(str).assertEqual("ab");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_1600
     * @tc.name: testFrom0016
     * @tc.desc: Test the from interface by The buffer handles a uint8array and decodes it with base64 and base64url.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testFrom0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = 'TestFrom0016';
      try {
        let array = new Uint8Array([252, 11, 3, 67, 237, 118, 91, 177, 43]);
        let buf = buffer.from(array);
        let strUrl = buf.toString("base64url");
        let str = buf.toString("base64");
        expect(strUrl).assertEqual("_AsDQ-12W7Er");
        expect(str).assertEqual("/AsDQ+12W7Er");

        array = new Uint8Array([2, 192, 254, 253, 5, 132, 69]);
        buf = buffer.from(array);
        strUrl = buf.toString("base64url");
        str = buf.toString("base64");
        expect(strUrl).assertEqual("AsD-_QWERQ");
        expect(str).assertEqual("AsD+/QWERQ==");

        array = new Uint8Array([215, 109, 211, 97, 72, 142, 167, 241]);
        buf = buffer.from(array);
        strUrl = buf.toString("base64url");
        str = buf.toString("base64");
        expect(strUrl).assertEqual("123TYUiOp_E");
        expect(str).assertEqual("123TYUiOp/E=");

        array = new Uint8Array([252]);
        buf = buffer.from(array);
        strUrl = buf.toString("base64url");
        str = buf.toString("base64");
        expect(strUrl).assertEqual("_A");
        expect(str).assertEqual("/A==");

        array = new Uint8Array([252, 97]);
        buf = buffer.from(array);
        strUrl = buf.toString("base64url");
        str = buf.toString("base64");
        expect(strUrl).assertEqual("_GE");
        expect(str).assertEqual("/GE=");

        array = new Uint8Array([252, 97, 142]);
        buf = buffer.from(array);
        strUrl = buf.toString("base64url");
        str = buf.toString("base64");
        expect(strUrl).assertEqual("_GGO");
        expect(str).assertEqual("/GGO");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_1700
     * @tc.name: testFrom0017
     * @tc.desc: Test the from interface by Creating a new Buffer containing empty string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testFrom0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0017";
      try {
        const buf = buffer.from("");
        let str = buf.toString();
        expect(str).assertEqual("");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBCONSTRUCTOR_0100
     * @tc.name: testBlobConstructor0001
     * @tc.desc: Test the from interface by Creating a new Blob object containing a concatenation of the given sources.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobConstructor0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      TAG = "testBlobConstructor0001";
      try {
        let option: Options = {
          type: "new type", endings: "transparent"
        }
        let sources = ["a", "b", "c"];
        let blob2 = new buffer.Blob(sources, option);
        let promise = blob2.text();
        await promise.then((value) => {
          try {
            expect(value).assertEqual("abc");
          } catch (err) {
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBCONSTRUCTOR_0200
     * @tc.name: testBlobConstructor0002
     * @tc.desc: Test the from interface by Creating a new Blob object containing a concatenation of the given sources.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobConstructor0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      TAG = "testBlobConstructor0002";
      try {
        let arrBuf = new ArrayBuffer(3);
        let uint8arr = new Uint8Array(arrBuf);
        uint8arr[0] = 97;
        uint8arr[1] = 98;
        uint8arr[2] = 99;
        let option: Options = {
          type: "new type", endings: "transparent"
        }
        let blob2 = new buffer.Blob([arrBuf], option);
        await blob2.text().then((value) => {
          try {
            expect(value).assertEqual("abc");
          } catch (err) {
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBCONSTRUCTOR_0300
     * @tc.name: testBlobConstructor0003
     * @tc.desc: Test the from interface by Creating a new Blob object containing a concatenation of the given sources.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobConstructor0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      TAG = "testBlobConstructor0003";
      try {
        let uint8arr = new Uint8Array(3);
        uint8arr[0] = 97;
        uint8arr[1] = 98;
        uint8arr[2] = 99;
        let option: Options = {
          type: "new type", endings: "transparent"
        };
        let blob2 = new buffer.Blob([uint8arr], option);
        await blob2.text().then((value) => {
          try {
            expect(value).assertEqual("979899");
          } catch (err) {
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBCONSTRUCTOR_0400
     * @tc.name: testBlobConstructor0004
     * @tc.desc: Test the from interface by Creating a new Blob object containing a concatenation of the given sources.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobConstructor0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      TAG = "testBlobConstructor0004";
      try {
        let arrBuf = new ArrayBuffer(3);
        let uint8arr = new Uint8Array(arrBuf);
        uint8arr[0] = 97;
        uint8arr[1] = 98;
        uint8arr[2] = 99;
        let option: Options = {
          type: "new type", endings: "transparent"
        };
        let view = new DataView(arrBuf);
        let blob2 = new buffer.Blob([view], option);
        await blob2.text().then((value) => {
          try {
            expect(value).assertEqual("abc");
          } catch (err) {
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBCONSTRUCTOR_0500
     * @tc.name: testBlobConstructor0005
     * @tc.desc: Test the from interface by Creating a new Blob object containing a concatenation of the given sources.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobConstructor0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      TAG = "testBlobConstructor0005";
      try {
        let option: Options = {
          type: "new type", endings: "transparent"
        };
        let sources = ["a", "b", "c"];
        let blob2 = new buffer.Blob(sources, option);
        let blob = new buffer.Blob([blob2]);
        await blob.text().then((value) => {
          try {
            expect(value).assertEqual("abc");
          } catch (err) {
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBCONSTRUCTOR_0600
     * @tc.name: testBlobConstructor0006
     * @tc.desc: Test the from interface by Creating a new Blob object containing a concatenation of the given sources.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobConstructor0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      TAG = "testBlobConstructor0006";
      try {
        new buffer.Blob(["a", "b", "c"], 10);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBARRAYBUFFER_0100
     * @tc.name: testBlobArrayBuffer0100
     * @tc.desc: Test the arrayBuffer interface by blob fulfills with an <ArrayBuffer> containing a copy of the Blob data.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobArrayBuffer0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      TAG = "testBlobArrayBuffer0100";
      try {
        let option: Options = {
          type: "new type", endings: "transparent"
        };
        let source = ["a", "b", "c"]
        let blob = new buffer.Blob(source, option);
        await blob.arrayBuffer().then((value) => {
          try {
            let arr = new Uint8Array(value)
            for (let i = 0, len = arr.length; i < len; i++) {
              expect(arr[i]).assertEqual(97 + i);
            }
          } catch (err) {
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBTEXT_0100
     * @tc.name: testBlobText0001
     * @tc.desc: Test the text interface by buffer fulfills with the contents of the Blob decoded as a UTF-8 string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobText0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      TAG = "testBlobText0001";
      try {
        let option: Options = {
          type: "new type", endings: "transparent"
        };
        let sources = ["a", "b", "c"];
        let blob = new buffer.Blob(sources, option);
        await blob.text().then((value) => {
          try {
            expect(value).assertEqual("abc");
          } catch (err) {
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBSLICE_0100
     * @tc.name: testBlobSlice0001
     * @tc.desc: Test the slice interface by passing the parameter start to 0,end to 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobSlice0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      TAG = "testBlobSlice0001";
      try {
        let option: Options = {
          type: "new type", endings: "transparent"
        };
        let sources = ["a", "b", "c"];
        let blob = new buffer.Blob(sources, option);
        let blobSlice = blob.slice(0, 1);
        await blobSlice.arrayBuffer().then((value) => {
          try {
            let arr = new Uint8Array(value);
            expect(arr[0]).assertEqual(97);
          } catch (err) {
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBSLICE_0200
     * @tc.name: testBlobSlice0002
     * @tc.desc: Test the slice interface by passing the parameter start to -1,end to 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobSlice0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      TAG = "testBlobSlice0002";
      try {
        let option: Options = {
          type: "new type", endings: "transparent"
        };
        let sources = ["a", "b", "c"];
        let blob = new buffer.Blob(sources, option);
        let blobSlice = blob.slice(-1, 0);
        await blobSlice.arrayBuffer().then((value) => {
          try {
            let arr = new Uint8Array(value)
            expect(arr[0]).assertEqual(99);
          } catch (err) {
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBSIZE_0100
     * @tc.name: testBlobSize0001
     * @tc.desc: Test the size interface by creating buffer which length is 3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobSize0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBlobSize0001";
      try {
        let sources = ["a", "b", "c"]
        let blob = new buffer.Blob(sources);
        let size = blob.size;
        expect(size).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBSIZE_0200
     * @tc.name: testBlobSize0002
     * @tc.desc: Test the size interface by creating buffer which length is 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobSize0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBlobSize0002";
      try {
        let blob = new buffer.Blob([]);
        let size = blob.size;
        expect(size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBSIZE_0300
     * @tc.name: testBlobSize0003
     * @tc.desc: Test the size interface by creating buffer which length is 3 and content include chinese string
     * 、special string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobSize0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBlobSize0003";
      try {
        let sources = ["测试", "$#", "c"];
        let blob = new buffer.Blob(sources);
        let size = blob.size;
        expect(size).assertEqual(9);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBTYPE_0100
     * @tc.name: testBlobType0001
     * @tc.desc: Test the type interface by creating buffer which type is mine.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBlobType0001";
      try {
        let option: Options = {
          type: "mime", endings: "transparent"
        };
        let sources = ["a", "b", "c"];
        let blob = new buffer.Blob(sources, option);
        let type = blob.type;
        expect(type).assertEqual("mime");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBTYPE_0200
     * @tc.name: testBlobType0002
     * @tc.desc: Test the type interface by creating buffer which type is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBlobType0002";
      try {
        let sources = ["a", "b", "c"]
        let blob = new buffer.Blob(sources);
        let type = blob.type;
        expect(type).assertEqual("");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBLEGTH_0100
     * @tc.name: testBlobLength0001
     * @tc.desc: Test the type interface by creating buffer which length is 4.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobLength0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBlobLength0001";
      try {
        let buf = buffer.from("1236");
        let len = buf.length;
        expect(len).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBLEGTH_0200
     * @tc.name: testBlobLength0002
     * @tc.desc: Test the type interface by assigning a value to length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobLength0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBlobLength0002";
      let buf = buffer.from("1236");
      try {
        buf.length = 10;
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200013);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBLEGTH_0300
     * @tc.name: testBlobLength0003
     * @tc.desc: Test the type interface by creating buffer which content include chinese and special string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobLength0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBlobLength0003";
      try {
        let buf = buffer.from("测试特殊字符$#@!");
        let len = buf.length;
        expect(len).assertEqual(22);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBBYTEOFFSET_0100
     * @tc.name: testBlobByteOffset0001
     * @tc.desc: Test the byteOffset interface by creating buffer by "from" interface.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobByteOffset0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBlobByteOffset0001";
      try {
        let buf = buffer.from("1236");
        let offset = buf.byteOffset;
        expect(offset >= 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBBYTEOFFSET_0200
     * @tc.name: testBlobByteOffset0002
     * @tc.desc: Test the byteOffset interface by creating buffer by "alloc" interface.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobByteOffset0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBlobByteOffset0002";
      try {
        let buf = buffer.alloc(10);
        let offset = buf.byteOffset;
        expect(offset >= 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBBYTEOFFSET_0300
     * @tc.name: testBlobByteOffset0003
     * @tc.desc: Test the byteOffset interface by creating buffer by "allocUninitializedFromPool" interface.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobByteOffset0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBlobByteOffset0003";
      try {
        let buf = buffer.allocUninitializedFromPool(10);
        let offset = buf.byteOffset;
        expect(offset >= 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBBYTEOFFSET_0400
     * @tc.name: testBlobByteOffset0004
     * @tc.desc: Test the byteOffset interface by creating buffer by "allocUninitialized" interface.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobByteOffset0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBlobByteOffset0004";
      try {
        let buf = buffer.allocUninitialized(10);
        let offset = buf.byteOffset;
        expect(offset >= 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBBYTEOFFSET_0500
     * @tc.name: testBlobByteOffset0005
     * @tc.desc: Test the byteOffset interface by creating buffer assign a value to 'byteOffset'.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBlobByteOffset0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBlobByteOffset0005";
      let buf = buffer.from("1236");
      try {
        buf.byteOffset = 3;
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200013);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT16LE_0100
     * @tc.name: testReadUInt16LE0001
     * @tc.desc: Test the readUInt16LE interface by Reading an unsigned, little-endian 16-bit integer from buf at the
     * specified offset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUInt16LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt16LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0x1234, 0);
        let ref = buf.readUInt16LE(0).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT16LE_0200
     * @tc.name: testReadUInt16LE0002
     * @tc.desc: Test the readUInt16LE interface by passing the parameter offset out of range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUInt16LE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt16LE0002";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt16LE(0x1234, 0);
      try {
        buf.readUInt16LE(3).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT16LE_0300
     * @tc.name: testReadUInt16LE0003
     * @tc.desc: Test the readUInt16LE interface by passing the parameter offset to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUInt16LE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt16LE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0x1234, 0);
        let ref = buf.readUInt16LE(undefined).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT16LE_0400
     * @tc.name: testReadUInt16LE0004
     * @tc.desc: Test the readUInt16LE interface by passing the parameter offset to null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUInt16LE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt16LE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0x1234, 0);
        let ref = buf.readUInt16LE(null).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT32BE_0100
     * @tc.name: testReadUInt32BE0001
     * @tc.desc: Test the readUInt32BE interface by Reading an unsigned, big-endian 32-bit integer from buf at the
     * specified offset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUInt32BE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt32BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0x12345678, 0);
        let ref = buf.readUInt32BE(0).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT32BE_0200
     * @tc.name: testReadUInt32BE0002
     * @tc.desc: Test the readUInt32BE interface by passing the parameter offset out of range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUInt32BE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt32BE0002";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt32BE(0x12345678, 0);
      try {
        buf.readUInt32BE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT32BE_0300
     * @tc.name: testReadUInt32BE0003
     * @tc.desc: Test the readUInt32BE interface by passing the parameter offset to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUInt32BE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt32BE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0x12345678, 0);
        let ref = buf.readUInt32BE(undefined).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT32BE_0400
     * @tc.name: testReadUInt32BE0004
     * @tc.desc: Test the readUInt32BE interface by passing the parameter offset to null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUInt32BE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt32BE0004-";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0x12345678, 0);
        let ref = buf.readUInt32BE(null).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT32LE_0100
     * @tc.name: testReadUInt32LE0001
     * @tc.desc: Test the readUInt32LE interface by Reading an unsigned, little-endian 32-bit integer from buf at the
     * specified offset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUInt32LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt32LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0x12345678, 0);
        let ref = buf.readUInt32LE(0).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT32LE_0200
     * @tc.name: testReadUInt32LE0002
     * @tc.desc: Test the readUInt32LE interface by passing the parameter offset out of range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUInt32LE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt32LE0002";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt32LE(0x12345678, 0);
      try {
        buf.readUInt32LE(1).toString(16);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT32LE_0300
     * @tc.name: testReadUInt32LE0003
     * @tc.desc: Test the readUInt32LE interface by passing the parameter offset to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUInt32LE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt32LE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0x12345678, 0);
        let ref = buf.readUInt32LE(undefined).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT32LE_0400
     * @tc.name: testReadUInt32LE0004
     * @tc.desc: Test the readUInt32LE interface by passing the parameter offset to null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUInt32LE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt32LE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0x12345678, 0);
        let ref = buf.readUInt32LE(null).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINTBE_0100
     * @tc.name: testReadUIntBE0001
     * @tc.desc: Test the readUIntBE interface by reading an unsigned 8-bit integer from buf at the specified offset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUIntBE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUIntBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUIntBE(0x13141516, 0, 4);
        let ref = buf.readUIntBE(0, 3).toString(16);
        expect(ref).assertEqual("131415");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINTBE_0200
     * @tc.name: testReadUIntBE0002
     * @tc.desc: Test the readUIntBE interface by passing the parameter offset out of range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUIntBE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUIntBE0002";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUIntBE(0x13141516, 0, 4);
      try {
        buf.readUIntBE(2, 3).toString(16);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINTBE_0300
     * @tc.name: testReadUIntBE0003
     * @tc.desc: Test the readUIntBE interface by passing the parameter offset to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUIntBE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUIntBE0003";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUIntBE(0x13141516, 0, 4);
      try {
        buf.readUIntBE(undefined, 3).toString(16);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINTBE_0400
     * @tc.name: testReadUIntBE0004
     * @tc.desc: Test the readUIntBE interface by passing the parameter offset to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUIntBE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUIntBE0004";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUIntBE(0x13141516, 0, 4);
      try {
        buf.readUIntBE(null, 3).toString(16);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINTLE_0100
     * @tc.name: testReadUIntLE0001
     * @tc.desc: Test the readUIntLE interface by reading an unsigned 8-bit integer from buf at the specified offset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUIntLE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUIntLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUIntLE(0x13141516, 0, 4);
        let ref = buf.readUIntLE(0, 3).toString(16);
        expect(ref).assertEqual("141516");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINTLE_0200
     * @tc.name: testReadUIntLE0002
     * @tc.desc: Test the readUIntLE interface by passing the parameter offset out of range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUIntLE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUIntLE0002";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUIntLE(0x13141516, 0, 4);
      try {
        buf.readUIntLE(2, 3).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINTLE_0300
     * @tc.name: testReadUIntLE0003
     * @tc.desc: Test the readUIntLE interface by passing the parameter offset to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUIntLE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUIntLE0003";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUIntLE(0x13141516, 0, 4);
      try {
        buf.readUIntLE(undefined, 3).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINTLE_0400
     * @tc.name: testReadUIntLE0004
     * @tc.desc: Test the readUIntLE interface by passing the parameter offset to null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testReadUIntLE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUIntLE0004";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUIntLE(0x13141516, 0, 4);
      try {
        buf.readUIntLE(null, 3).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_COMPARE_0100
     * @tc.name: testBufferCompare0001
     * @tc.desc: Test BUFFER.COMPARE
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBufferCompare0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBufferCompare0001";
      try {
        let buf1 = buffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let buf2 = buffer.from([8, 7, 6, 5, 4, 3, 2, 1]);
        let result = buf1.compare(buf2);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_COMPARE_0200
     * @tc.name: testBufferCompare0002
     * @tc.desc: Test BUFFER.COMPARE
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBufferCompare0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBufferCompare0002";
      try {
        let buf1 = buffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = buffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let result = buf1.compare(buf2, 8);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_COMPARE_0300
     * @tc.name: testBufferCompare0003
     * @tc.desc: Test BUFFER.COMPARE
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBufferCompare0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBufferCompare0003";
      try {
        let buf1 = buffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = buffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let result = buf1.compare(buf2, 0, 5);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_COMPARE_0400
     * @tc.name: testBufferCompare0004
     * @tc.desc: Test BUFFER.COMPARE
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBufferCompare0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBufferCompare0004";
      try {
        let buf1 = buffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = buffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let result = buf1.compare(buf2, 0, 6, 4);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_COMPARE_0500
     * @tc.name: testBufferCompare0005
     * @tc.desc: Test BUFFER.COMPARE
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBufferCompare0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBufferCompare0005";
      try {
        let buf1 = buffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = buffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let result = buf1.compare(buf2, 5, 9, 0, 4);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_COMPARE_0500
     * @tc.name: testBufferCompare0005
     * @tc.desc: Test BUFFER.COMPARE
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBufferCompare0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBufferCompare0006";
      try {
        let buf1 = buffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = buffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let result = buf1.compare(buf2, Infinity, 9, 0, 4);
      } catch (err) {
        expect(err.code).assertEqual(10200001)
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_COMPARE_0600
     * @tc.name: testBufferCompare0005
     * @tc.desc: Test BUFFER.COMPARE
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it("testBufferCompare0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testBufferCompare0007";
      try {
        let buf1 = buffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = buffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let result = buf1.compare(buf2, Infinity, 9, 0, 4);
      } catch (err) {
        expect(err.code).assertEqual(10200001)
      }
    })

    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READ_0100
     * @tc.name  : testRead0001
     * @tc.desc  : Testing readBigUInt64BE for null
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testRead0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
        let ref = buf.readBigUInt64BE().toString(16);
        expect(ref).assertEqual("decafafecacefade");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });


    /*
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READ_0200
     * @tc.name  : testRead0002
     * @tc.desc  : Testing readBigInt64LE for buffer with normal value.
     * @tc.size: MediumTest
     * @tc.type  : Function
     * @tc.level: Level 3
     */
    it('testRead0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(0x0102030405060708n, 0);
        let ref = buf.readBigInt64LE().toString(16);
        expect(ref).assertEqual("807060504030201");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READ_0300
      * @tc.name  : testRead0003
      * @tc.desc  : Testing readBigUInt64BE for buffer with normal value.
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
  */
    it('testRead0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0003";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
        let ref = buf.readBigUInt64BE().toString(16);
        expect(ref).assertEqual("decafafecacefade");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });


    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READ_0400
      * @tc.name  : testRead0004
      * @tc.desc  : Testing readBigUInt64LE for buffer with normal value.
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
    */
    it('testRead0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0004";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64LE(0xdecafafecacefaden, 0);
        let ref = buf.readBigUInt64LE().toString(16);
        expect(ref).assertEqual("decafafecacefade");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });
    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READ_0500
      * @tc.name  : testRead0005
      * @tc.desc  : Testing readFloatBE for buffer with normal value.
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
    */
    it('testRead0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0005";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatBE(0xcabcbcbc, 0);
        let ref = buf.readFloatBE().toString(16);
        expect(ref).assertEqual("cabcbd00");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READ_0600
      * @tc.name  : testRead0006
      * @tc.desc  : Testing readFloatLE for buffer with normal value.
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
    */
    it('testRead0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0006";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatLE(0xcabcbcbc, 0);
        let ref = buf.readFloatLE().toString(16);
        expect(ref).assertEqual("cabcbd00");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READ_0700
      * @tc.name  : testRead0007
      * @tc.desc  : Testing readInt8 for buffer with normal value.
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
    */
    it('testRead0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0007";
      try {
        const str =
          `MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC/OgIQLaulKklB\npZltSaWwM3Cnzcmvh+LoqYFYjCePUxnoJRDusFqy4sjwBx9fn/XSxxJ9A0KxMtXa\nr7YFjwQo3FsIjLZ3+8wS+Kydcg==`;
        const buf = buffer.from(str, 'base64');
        let ref = buf.readInt8();
        expect(ref).assertEqual(48);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READ_0800
    * @tc.name  : testRead0008
    * @tc.desc  : Testing readInt16BE for buffer with normal value.
    * @tc.size: MediumTest
    * @tc.type  : Function
    * @tc.level: Level 3
  */
    it('testRead0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0008";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16BE(0x1234, 0);
        let ref = buf.readInt16BE().toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READ_0900
      * @tc.name  : testRead0009
      * @tc.desc  : Testing readInt16LE for buffer with normal value.
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
    */
    it('testRead0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0009";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16LE(0x1234, 0);
        let ref = buf.readInt16LE().toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READ_1000
      * @tc.name  : testRead0010
      * @tc.desc  : Testing readInt32BE for buffer with normal value.
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
    */
    it('testRead0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0010";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32BE(0x12345678, 0);
        let ref = buf.readInt32BE().toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READ_1100
      * @tc.name  : testRead0010
      * @tc.desc  : Testing readInt32LE for buffer with normal value.
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
    */
    it('testRead0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0011";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32LE(0x12345678, 0);
        let ref = buf.readInt32LE().toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READ_1200
      * @tc.name  : testRead0012
      * @tc.desc  : Testing readUInt8 for buffer with normal value.
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
    */
    it('testRead0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0012";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(0x42);
        let ref = buf.readUInt8().toString(16);
        expect(ref).assertEqual("42");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READ_1300
      * @tc.name  : testRead0013
      * @tc.desc  : Testing readUInt16BE for buffer with normal value.
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
    */
    it('testRead0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0013";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0x1234, 0);
        let ref = buf.readUInt16BE().toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });


    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READ_1400
      * @tc.name  : testRead0014
      * @tc.desc  : Testing readUInt16BE for buffer with normal value.
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
    */
    it('testRead0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0014";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0x1234, 0);
        let ref = buf.readUInt16LE().toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })
    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READ_1500
      * @tc.name  : testRead0015
      * @tc.desc  : Testing readUInt32BE for buffer with normal value.
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
    */
    it('testRead0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0015";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0x12345678, 0);
        let ref = buf.readUInt32BE().toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READ_1600
      * @tc.name  : testRead0016
      * @tc.desc  : Testing readUInt32LE for buffer with normal value.
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
    */
    it('testRead0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0016";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0x12345678, 0);
        let ref = buf.readUInt32LE().toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })
    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTING_1800
      * @tc.name  : testToString0018
      * @tc.desc  : Testing toString
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
    */
    it('testToString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0018";
      try {
        let buf = buffer.from([1, 2, 3, 4]);
        let ref = buf.toString('utf8');
        expect(encodeURI(ref)).assertEqual("%01%02%03%04");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })
    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTING_1900
      * @tc.name  : testToString0019
      * @tc.desc  : Testing toString
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
    */
    it('testToString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0019";
      try {
        let buf = buffer.from([1, 2, 3, 4]);
        let ref = buf.toString('utf8', 1);
        expect(encodeURI(ref)).assertEqual("%02%03%04");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })

    /*
    * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTING_2000
    * @tc.name  : testToString0020
    * @tc.desc  : Testing toString
    * @tc.size: MediumTest
    * @tc.type  : Function
    * @tc.level: Level 3
   */
    it('testToString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0020";
      try {
        let buf = buffer.from([1, 2, 3, 4]);
        let ref = buf.toString('utf8', 1, 2);
        expect(encodeURI(ref)).assertEqual("%02");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })
    /*
    * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTING_2100
    * @tc.name  : testToString0021
    * @tc.desc  : Testing toString
    * @tc.size: MediumTest
    * @tc.type  : Function
    * @tc.level: Level 3
   */
    it('testToString0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0021";
      try {
        let buf = buffer.from([1, 2, 3, 4]);
        let ref = buf.toString();
        expect(encodeURI(ref)).assertEqual("%01%02%03%04");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })
    /*
    * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITE_0100
    * @tc.name  : testToString0021
    * @tc.desc  : Testing write
    * @tc.size: MediumTest
    * @tc.type  : Function
    * @tc.level: Level 3
   */
    it('testWrite0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWrite0001";
      try {
        let buf = buffer.alloc(256);
        let len = buf.write('\u00bd + \u00bc = \u00be', 0);
        expect(encodeURI(len.toString())).assertEqual("12");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })
    /*
    * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITE_0200
    * @tc.name  : testWrite0002
    * @tc.desc  : Testing write
    * @tc.size: MediumTest
    * @tc.type  : Function
    * @tc.level: Level 3
   */
    it('testWrite0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWrite0002";
      try {
        let buffer1 = buffer.alloc(10);
        let length = buffer1.write('abcd', 8);
        expect(length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })
    /*
    * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITE_0300
    * @tc.name  : testWrite0003
    * @tc.desc  : Testing write
    * @tc.size: MediumTest
    * @tc.type  : Function
    * @tc.level: Level 3
   */
    it('testWrite0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWrite0003";
      try {
        let buffer1 = buffer.alloc(10);
        let length = buffer1.write('abcd', 0, 1);
        expect(length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })

    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WRITE_0400
      * @tc.name  : testWrite0004
      * @tc.desc  : Testing write
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
    */
    it('testWrite0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWrite0004";
      try {
        let buffer1 = buffer.alloc(10);
        let length = buffer1.write('abcd', 0, 3, "utf-8");
        expect(length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })
    /*
        * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SLICE_0100
        * @tc.name  : testSlice0001
        * @tc.desc  : Testing slice
        * @tc.size: MediumTest
        * @tc.type  : Function
        * @tc.level: Level 3
       */
    it('testSlice0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSlice0001";
      try {
        let blob: buffer.Blob = new buffer.Blob(['a', 'b', 'c']);
        let result = blob.slice();
        expect(result.size).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })

    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SLICE_0200
      * @tc.name  : testSlice0002
      * @tc.desc  : Testing slice
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
     */
    it('testSlice0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSlice0002";
      try {
        let blob: buffer.Blob = new buffer.Blob(['a', 'b', 'c']);
        let result = blob.slice(1);
        expect(result.size).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })
    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SLICE_0300
      * @tc.name  : testSlice0003
      * @tc.desc  : Testing slice
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
    */
    it('testSlice0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSlice0003";
      try {
        let blob: buffer.Blob = new buffer.Blob(['a', 'b', 'c', "d"]);
        let result = blob.slice(1, 2);
        expect(result.size).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })
    /*
      * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SLICE_0400
      * @tc.name  : testSlice0004
      * @tc.desc  : Testing slice
      * @tc.size: MediumTest
      * @tc.type  : Function
      * @tc.level: Level 3
    */
    it('testSlice0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSlice0004";
      try {
        let blob: buffer.Blob = new buffer.Blob(['a', 'b', 'c']);
        let result = blob.slice(1, 2, "Number");
        expect(result.size).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0100
     * @tc.name       : testAlloc0001
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAlloc0001';
      try {
        let buf1 = buffer.alloc(0);
        expect(buf1.length).assertEqual(0);
        expect(buf1.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0200
     * @tc.name       : testAlloc0002
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAlloc0002';
      try {
        let buf2 = buffer.alloc(3, 'a');
        expect(buf2.length).assertEqual(3);
        expect(buf2.toString()).assertEqual('aaa');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0300
     * @tc.name       : testAlloc0003
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAlloc0003';
      try {
        let buf3 = buffer.alloc(5, buffer.from('hello'));
        const result = buf3.toString();
        console.log(`${TAG}result${result}`);
        expect(buf3.toString()).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0400
     * @tc.name       : testAlloc0004
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAlloc0004';
      try {
        let buf4 = buffer.alloc(0, 0);
        const result = buf4.toString();
        console.log(`${TAG}result${result}`);
        expect(buf4.length).assertEqual(0);
        expect(buf4.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0500
     * @tc.name       : testAlloc0005
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAlloc0005';
      try {
        let buf5 = buffer.alloc(0, -1);
        expect(buf5.length).assertEqual(0);
        expect(buf5.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0600
     * @tc.name       : testAlloc0006
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAlloc0006';
      try {
        let buf6 = buffer.alloc(0, Infinity);
        expect(buf6.length).assertEqual(0);
        expect(buf6.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0700
     * @tc.name       : testAlloc0007
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAlloc0007';
      try {
        let buf7 = buffer.alloc(0, -Infinity);
        expect(buf7.length).assertEqual(0);
        expect(buf7.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0800
     * @tc.name       : testAlloc0008
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAlloc0008';
      try {
        let buf8 = buffer.alloc(3, 1);
        expect(buf8.length).assertEqual(3);
        for (let i = 0; i < buf8.length; i++) {
          expect(buf8[i]).assertEqual(1);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0900
     * @tc.name       : testAlloc0009
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAlloc0009';
      try {
        let buf9 = buffer.alloc(3, '');
        expect(buf9.length).assertEqual(3);
        for (let i = 0; i < buf9.length; i++) {
          expect(buf9[i]).assertEqual(0);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1000
     * @tc.name       : testAlloc0010
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAlloc0010';
      try {
        let buf10 = buffer.alloc(3, undefined);
        expect(buf10.length).assertEqual(3);
        for (let i = 0; i < buf10.length; i++) {
          expect(buf10[i]).assertEqual(0);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1100
     * @tc.name       : testAlloc0011
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAlloc0011';
      try {
        let buf11 = buffer.alloc(11, 'aGVsbG8gd29ybGQ=', 'base64');
        console.log(`${TAG} buf11:${buf11.toString()}`);
        expect(buf11.length).assertEqual(11);
        expect(buf11.toString()).assertEqual('hello world');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1200
     * @tc.name       : testAlloc0012
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAlloc0012';
      try {
        let buf12 = buffer.alloc(3, 'hello', 'utf8');
        expect(buf12.length).assertEqual(3);
        expect(buf12.toString()).assertEqual('hel');
        expect(buf12.toString('base64')).assertEqual('aGVs');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1300
     * @tc.name       : testAlloc0013
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAlloc0013';
      try {
        let buf = buffer.alloc(0, 0);
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1400
     * @tc.name       : testAlloc0014
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAlloc0014';
      try {
        let buf = buffer.alloc(0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 'base64');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1500
     * @tc.name       : testAlloc0015
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAlloc0015';
      try {
        let buf = buffer.alloc(0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 'utf-8');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1600
     * @tc.name       : testAlloc0016
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAlloc0016';
      try {
        let buf = buffer.alloc(0, -1, 'base64');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1700
     * @tc.name       : testAlloc0017
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAlloc0017';
      try {
        let buf = buffer.alloc(0, -1, 'utf-8');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1800
     * @tc.name       : testAlloc0018
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAlloc0018';
      try {
        let buf = buffer.alloc(0, -1, 'base64');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1900
     * @tc.name       : testAlloc0019
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAlloc0019';
      try {
        let buf = buffer.alloc(0, -1, 'utf-8');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_0100
     * @tc.name       : testByteLength0001
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testByteLength0001';
      try {
        let str = '\u00bd + \u00bc = \u00be'
        const res = buffer.byteLength(str);
        expect(res).assertEqual(12);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_0200
     * @tc.name       : testByteLength0002
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testByteLength0002';
      try {
        let buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
        const res = buffer.byteLength(buf);
        expect(res).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_0300
     * @tc.name       : testByteLength0003
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testByteLength0003';
      try {
        let uint8Array = new Uint8Array([0x74, 0x79, 0x70, 0x65, 0x64]);
        const res = buffer.byteLength(uint8Array);
        expect(res).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_0400
     * @tc.name       : testByteLength0004
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testByteLength0004';
      try {
        let arrayBuffer = new ArrayBuffer(8);
        let dataView = new DataView(arrayBuffer);
        const res = buffer.byteLength(dataView);
        expect(res).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_0500
     * @tc.name       : testByteLength0005
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testByteLength0005';
      try {
        let arrayBuffer = new ArrayBuffer(8);
        expect(buffer.byteLength(arrayBuffer)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_0600
     * @tc.name       : testByteLength0006
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testByteLength0006';
      try {
        const sharedBuffer = new SharedArrayBuffer(8);
        expect(buffer.byteLength(sharedBuffer)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_0700
     * @tc.name       : testByteLength0007
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testByteLength0007';
      try {
        let buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
        const res = buffer.byteLength(buf, 'utf8');
        expect(res).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_0800
     * @tc.name       : testByteLength0008
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testByteLength0008';
      try {
        let buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
        const res = buffer.byteLength(buf, 'base64');
        expect(res).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_0900
     * @tc.name       : testByteLength0009
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testByteLength0009';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const dataView = new DataView(arrayBuffer);
        dataView.setUint8(0, 104);
        dataView.setUint8(1, 101);
        dataView.setUint8(2, 108);
        dataView.setUint8(3, 108);
        dataView.setUint8(4, 111);
        let buf = buffer.byteLength(dataView);
        expect(buf).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_1000
     * @tc.name       : testByteLength0010
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testByteLength0010';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const dataView = new DataView(arrayBuffer);
        dataView.setUint8(0, 104);
        dataView.setUint8(1, 101);
        dataView.setUint8(2, 108);
        dataView.setUint8(3, 108);
        dataView.setUint8(4, 111);
        let buf = buffer.byteLength(dataView, 'utf8');
        expect(buf).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_1100
     * @tc.name       : testByteLength0011
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testByteLength0011';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const dataView = new DataView(arrayBuffer);
        dataView.setUint8(0, 104);
        dataView.setUint8(1, 101);
        dataView.setUint8(2, 108);
        dataView.setUint8(3, 108);
        dataView.setUint8(4, 111);
        let buf = buffer.byteLength(dataView, 'base64');
        expect(buf).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0100
     * @tc.name       : testConcat0001
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferConcat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConcat0001';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        let buf = buffer.concat([buf1, buf2]);
        // expect(buf.toString('hex')).assertEqual('3132333461626364');
        expect(buf.length).assertEqual(8);
        expect(buf.toString('utf8')).assertEqual('1234abcd');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0200
     * @tc.name       : testConcat0002
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferConcat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConcat0002';
      try {
        let uint8Arr1 = new Uint8Array([1, 2, 3, 4]);
        let uint8Arr2 = new Uint8Array([5, 6, 7, 8]);
        let buf3 = buffer.concat([uint8Arr1, uint8Arr2]);
        expect(buf3.toString('hex')).assertEqual('0102030405060708');
        expect(buf3.length).assertEqual(8);
        expect(buf3.toString('utf8')).assertEqual('\u0001\u0002\u0003\u0004\u0005\u0006\u0007\u0008');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0300
     * @tc.name       : testConcat0003
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferConcat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConcat0003';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        let buf4 = buffer.concat([buf1, buf2], undefined);
        expect(buf4.toString('hex')).assertEqual('3132333461626364');
        expect(buf4.length).assertEqual(8);
        expect(buf4.toString('utf8')).assertEqual('1234abcd');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0400
     * @tc.name       : testConcat0004
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferConcat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConcat0004';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        let buf5 = buffer.concat([buf1, buf2], 0);
        expect(buf5.toString()).assertEqual('1234abcd');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0500
     * @tc.name       : testConcat0005
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferConcat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConcat0005';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        buffer.concat([buf1, buf2], -1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}`);
        expect(e.message)
          .assertEqual('The value of "totalLength" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0600
     * @tc.name       : testConcat0006
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferConcat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      6
      const TAG = 'testConcat0006';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        buffer.concat([buf1, buf2], Infinity);
        expect().assertFail();
      } catch (e) {

        console.error(`${TAG} failed: ${e.message}`);
        expect(e.message)
          .assertEqual('The value of "totalLength" is out of range. It must be >= 0 and <= 4294967296. Received value is: Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0700
     * @tc.name       : testConcat0007
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferConcat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConcat0007';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        buffer.concat([buf1, buf2], -Infinity);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
        console.error(`${TAG} failed: ${e.message}`);
        expect(e.message)
          .assertEqual('The value of "totalLength" is out of range. It must be >= 0 and <= 4294967296. Received value is: -Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0800
     * @tc.name       : testConcat0008
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level
     */
    it('testBufferConcat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConcat0008';
      try {
        let buf1 = buffer.from("L234");
        let buf2 = buffer.from("abcd");
        let buf3 = buffer.concat([buf1, buf2], 1);
        expect(buf3.toString()).assertEqual('L');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0900
     * @tc.name       : testConcat0009
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferConcat0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConcat0009';
      try {
        const arr1 = new Uint8Array([104, 101, 108, 108, 111]);
        const arr2 = new Uint8Array([119, 111, 114, 108, 100]);
        const buf1 = buffer.from(arr1);
        const buf2 = buffer.from(arr2);
        const concatBuf = buffer.concat([buf1, buf2], -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "totalLength" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_1000
     * @tc.name       : testConcat0010
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferConcat0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConcat0010';
      try {
        const arr1 = new Uint8Array([104, 101, 108, 108, 111]);
        const arr2 = new Uint8Array([119, 111, 114, 108, 100]);
        const buf1 = buffer.from(arr1);
        const buf2 = buffer.from(arr2);
        const concatBuf = buffer.concat([buf1, buf2], 1);
        expect(concatBuf.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_0100
     * @tc.name       : testFrom10001
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom10001';
      try {
        const ab1 = new ArrayBuffer(8);
        const buf1 = buffer.from(ab1);
        expect(buf1.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_0200
     * @tc.name       : testFrom10002
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom10002';
      try {
        const ab2 = new SharedArrayBuffer(8);
        const buf2 = buffer.from(ab2);
        expect(buf2.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_0300
     * @tc.name       : testFrom10003
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom10003';
      try {
        const ab1 = new ArrayBuffer(8);
        const buf3 = buffer.from(ab1, undefined);
        expect(buf3.length).assertEqual(8);
      } catch (e) {
        expect(e.code).assertEqual(10200001);
        console.error(`${TAG} failed: ${e.message}` + e);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_0400
     * @tc.name       : testFrom10004
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom10004';
      try {
        const ab1 = new ArrayBuffer(8);
        const buf4 = buffer.from(ab1, 0);
        expect(buf4.length).assertEqual(8);
      } catch (e) {
        expect(e.code).assertEqual(10200001);
        console.error(`${TAG} failed: ${e.message}` + e);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_0500
     * @tc.name       : testFrom10005
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom10005';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, -1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.code).assertEqual(10200001);
        expect(e.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 8. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_0600
     * @tc.name       : testFrom10006
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom10006';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, Infinity);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 8. Received value is: Infinity')

      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_0700
     * @tc.name       : testFrom10007
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom10007';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, -Infinity);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 8. Received value is: -Infinity')

      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_0800
     * @tc.name       : testFrom10008
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom10008';
      try {
        const ab1 = new ArrayBuffer(8);
        const res = buffer.from(ab1, 4, 0);
        expect(res.length).assertEqual(0);
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_0900
     * @tc.name       : testFrom10009
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom10009';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, 0, -1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "length" is out of range. It must be >= 0 and <= 8. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_1000
     * @tc.name       : testFrom10010
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom10010';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, 0, Infinity);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "length" is out of range. It must be >= 0 and <= 8. Received value is: Infinity')

      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_1100
     * @tc.name       : testFrom10011
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom10011';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, 0, -Infinity);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "length" is out of range. It must be >= 0 and <= 8. Received value is: -Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_1200
     * @tc.name       : testFrom10012
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom10012';
      try {
        const ab1 = new ArrayBuffer(8);
        const res = buffer.from(ab1, 0, 1);
        expect(ab1.byteLength).assertEqual(8);
        expect(res.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_1300
     * @tc.name       : testFrom10013
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom10013';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const uint8Array = new Uint8Array(arrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111]);
        const buf = buffer.from(arrayBuffer, Infinity, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 5. Received value is: Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_1400
     * @tc.name       : testFrom10014
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom10014';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const uint8Array = new Uint8Array(arrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111]);
        const buf = buffer.from(arrayBuffer, Infinity, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 5. Received value is: Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM2_0100
     * @tc.name       : testFrom20001
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom20001';
      try {
        const buf1 = buffer.from('test');
        const buf2 = buffer.from(buf1);
        expect(buf2.toString()).assertEqual('test');
        buf1[0] = 'T'.charCodeAt(0);
        expect(buf2.toString()).assertEqual('test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM2_0200
     * @tc.name       : testFrom20002
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom20002';
      try {
        const uint8Arr = new Uint8Array([1, 2, 3]);
        const buf3 = buffer.from(uint8Arr);
        const result: number[] = [];
        for (let i = 0; i < buf3.length; i++) {
          result.push(buf3[i]);
        }
        console.log(`${TAG} result: ${result}`);
        expect(result.join(',')).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM2_0300
     * @tc.name       : testFrom20003
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom20003';
      try {
        const invalidInput = new String('invalid');
        const result = buffer.from(invalidInput);
        expect(result.length).assertEqual(7);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM2_0400
     * @tc.name       : testFrom20004
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom20004';
      try {
        buffer.from(undefined);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}`);
        expect(e.message)
          .assertEqual('Parameter error. The type of "value" must be Buffer or ArrayBuffer, Array, Array-like, string, object. Received value is: undefined');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM2_0500
     * @tc.name       : testFrom20005
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom20005';
      try {
        const emptyBuf = buffer.from(new Uint8Array(0));
        expect(emptyBuf.length).assertEqual(0);
      } catch (e) {
        expect(e.code).assertEqual(10200001);
        console.error(`${TAG} failed: ${e.message}` + e);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM2_0600
     * @tc.name       : testFrom20006
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom20006';
      try {
        const sharedArrayBuffer = new SharedArrayBuffer(10);
        const uint8Array = new Uint8Array(sharedArrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111, 119, 111, 114, 108, 100]);
        const buf = buffer.from(sharedArrayBuffer, undefined);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM2_0700
     * @tc.name       : testFrom20007
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom20007';
      try {
        const sharedArrayBuffer = new SharedArrayBuffer(10);
        const uint8Array = new Uint8Array(sharedArrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111, 119, 111, 114, 108, 100]);
        const buf = buffer.from(sharedArrayBuffer, 0);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM2_0800
     * @tc.name       : testFrom20008
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom20008';
      try {
        const sharedArrayBuffer = new SharedArrayBuffer(10);
        const uint8Array = new Uint8Array(sharedArrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111, 119, 111, 114, 108, 100]);
        const buf = buffer.from(sharedArrayBuffer, 0, 0);
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_0100
     * @tc.name       : testFrom30001
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom30001';
      try {
        let buf = buffer.from(new String('this is a test'), 11, 0);
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (error) {
        console.error(`${TAG} failed:${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_0200
     * @tc.name       : testFrom30002
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom30002';
      try {
        let buf = buffer.from(new String('this is a test'), 11, -1);
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (error) {
        console.error(`${TAG} error:${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_0300
     * @tc.name       : testFrom30003
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom30003';
      try {
        let buf = buffer.from(new String('this is a test'), 11, Infinity);
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_0400
     * @tc.name       : testFrom30004
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom30004';
      try {
        let buf = buffer.from(new String('hello world'), 1, -Infinity);
        expect(buf.length).assertEqual(11);
        expect(buf.toString()).assertEqual('hello world');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_0500
     * @tc.name       : testFrom30005
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom30005';
      try {
        let buf = buffer.from(new String('hello world'), 'test', 1);
        expect(buf).assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect(error.message)
          .assertEqual('Parameter error. The type of "encoding" must be BufferEncoding. the encoding test is unknown');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_0600
     * @tc.name       : testFrom30006
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom30006';
      try {
        let buf = buffer.from(new String('this is a test'), 'utf8', -1);
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_0700
     * @tc.name       : testFrom30007
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom30007';
      try {
        let buf = buffer.from(new String('this is a test'), 'utf8', Infinity);
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_0800
     * @tc.name       : testFrom30008
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom30008';
      try {
        let buf = buffer.from(new String('this is a test'), 'utf8', -Infinity);
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_0900
     * @tc.name       : testFrom30009
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom30009';
      try {
        class Person {
          name: string;
          age: number;

          constructor(name: string, age: number) {
            this.name = name;
            this.age = age;
          }
        }

        const person = new Person("Alice", 30);
        buffer.from(person, 11, 0);
        buffer.from(person, 11, -1);
        buffer.from(person, 11, Infinity);
        buffer.from(person, 11, -Infinity);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} error:${e.message}`);
        expect(e.message)
          .assertEqual('Parameter error. The type of "value" must be Buffer or ArrayBuffer, Array, Array-like. Received value is: Person');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_1000
     * @tc.name       : testFrom30010
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom30010';
      try {
        const testStringObject = new String('hello');
        const buf = buffer.from(testStringObject, 'utf-8', -1);
        expect(buf.toString('utf-8')).assertEqual('hello');
        expect(buf.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_1100
     * @tc.name       : testFrom30011
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom30011';
      try {
        class MyClass {
          public value: string;

          constructor(value: string) {
            this.value = value;
          }

          toString(): string {
            return this.value;
          }
        }

        const testStringObject = new MyClass('hello');
        const buf = buffer.from(testStringObject, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 0);
        expect().assertFail()

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('Parameter error. The type of "value" must be Buffer or ArrayBuffer, Array, Array-like. Received value is: MyClass');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM4_0100
     * @tc.name       : testFrom40001
     * @tc.desc       : Test the function of the interface From4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom40001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom40001';
      try {
        let buf = buffer.from('this is a test');
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM4_0200
     * @tc.name       : testFrom40002
     * @tc.desc       : Test the function of the interface From4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom40002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom40002';
      try {
        let buf = buffer.from('abc', 'base64');
        expect(buf.toString()).assertEqual('i·');
        expect(buf.length).assertEqual(2);
        expect(buf.toString('base64')).assertEqual('abc=');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM4_0300
     * @tc.name       : testFrom40003
     * @tc.desc       : Test the function of the interface From4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom40003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFrom40003';
      try {
        let buf = buffer.from('this is a test', 'utf-8');
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0100
     * @tc.name       : testCompare0001
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCompare0001';
      try {
        let buf1 = buffer.from('1234');
        let buf2 = buffer.from('0123');
        let res = buf1.compare(buf2);
        expect(res).assertEqual(1);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0200
     * @tc.name       : testCompare0002
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCompare0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCompare0002';
      try {
        let buf1 = buffer.from('1234');
        let buf2 = new Uint8Array([1, 2, 3, 4]);
        let res = buf1.compare(buf2);
        console.info(Number(res).toString());
        expect(res).assertEqual(1);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0300
     * @tc.name       : testCompare0003
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCompare0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCompare0003';
      try {
        let buf1 = new Uint8Array([1, 2, 3, 4]);
        let buf2 = buffer.from('1234');
        let res = buf2.compare(buf1);
        console.info(Number(res).toString());
        expect(res).assertEqual(1);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0400
     * @tc.name       : testCompare0004
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCompare0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCompare0004';
      try {
        let buf1 = new Uint8Array([1, 2, 3, 4]);
        let buf2 = new Uint8Array([1, 2, 3, 4]);
        let buf1Buffer = buffer.from(buf1);
        let buf2Buffer = buffer.from(buf2);
        let res = buf1Buffer.compare(buf2Buffer);
        console.info(Number(res).toString());
        expect(res).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0100
     * @tc.name       : testTranscode0001
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferTranscode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTranscode0001';
      try {
        let buf = buffer.from('€')
        let newBuf = buffer.transcode(buf, 'base64', 'base64');
        expect(newBuf.toString()).assertEqual('€');
        expect(newBuf.length).assertEqual(3);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0200
     * @tc.name       : testTranscode0002
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferTranscode0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTranscode0002';
      try {
        let buf = buffer.from('hello world');
        let newBuf = buffer.transcode(buf, 'base64', 'utf-8');
        expect(newBuf.toString()).assertEqual('aGVsbG8gd29ybGQ=');
        expect(newBuf.length).assertEqual(16);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0300
     * @tc.name       : testTranscode0003
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferTranscode0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTranscode0003';
      try {
        let buf = buffer.from('hello world');
        let newBuf = buffer.transcode(buf, 'utf-8', 'base64');
        console.log(`${TAG} newBuf:${newBuf}`)
        // expect(newBuf.toString('base64')).assertEqual('helljx9/AAA=');
        expect(newBuf.length).assertEqual(8);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0400
     * @tc.name       : testTranscode0004
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferTranscode0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTranscode0004';
      try {
        let buf = buffer.from('hello world');
        let newBuf = buffer.transcode(buf, 'utf-8', 'utf-8');
        expect(newBuf.toString()).assertEqual('hello world');
        expect(newBuf.length).assertEqual(11);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`)

      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0500
     * @tc.name       : testTranscode0005
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferTranscode0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTranscode0005';
      try {
        let buf = new Uint8Array([1, 2, 3, 4]);
        let newBuf = buffer.transcode(buf, 'base64', 'base64');
        // expect(newBuf.toString('base64')).assertEqual('IHFDjx8=');
        expect(newBuf.length).assertEqual(5);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0600
     * @tc.name       : testTranscode0006
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferTranscode0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTranscode0006';
      try {
        let buf = new Uint8Array([1, 2, 3, 4]);
        let newBuf = buffer.transcode(buf, 'base64', 'utf-8');
        expect(newBuf.toString('utf-8')).assertEqual('1,2,3,4');
        expect(newBuf.length).assertEqual(7);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0700
     * @tc.name       : testTranscode0007
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferTranscode0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTranscode0007';
      try {
        let buf = new Uint8Array([1, 2, 3, 4]);
        let newBuf = buffer.transcode(buf, 'utf-8', 'base64');
        // expect(newBuf.toString('base64')).assertEqual('IHFDjx8=');
        expect(newBuf.length).assertEqual(5);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0800
     * @tc.name       : testTranscode0008
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferTranscode0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTranscode0008';
      try {
        let buf = new Uint8Array([1, 2, 3, 4]);
        let newBuf = buffer.transcode(buf, 'utf-8', 'utf-8');
        expect(newBuf.toString('utf-8')).assertEqual('1,2,3,4');
        expect(newBuf.length).assertEqual(7);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0100
     * @tc.name       : testFill0001
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFill0001';
      try {
        const buf = buffer.allocUninitializedFromPool(5);
        buf.fill(0x41);
        const result = buf.toString('utf-8');
        expect(result).assertEqual('AAAAA');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0200
     * @tc.name       : testFill0002
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFill0002';
      try {
        const buf = buffer.allocUninitializedFromPool(3);
        buf.fill('a');
        expect(buf.toString()).assertEqual('aaa');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0300
     * @tc.name       : testFill0003
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFill0003';
      try {
        // const source = buffer.from([0x46, 0x47]);
        // const buf = buffer.allocUninitializedFromPool(5);
        // buf.fill(source);
        // const expected = buffer.from([0x46, 0x47, 0x46, 0x47, 0x46]);
        // expect(buf.equals(expected)).assertTrue();
        let buf1 = buffer.from([1])
        let buf2 = buffer.allocUninitializedFromPool(4);
        buf2.fill(buf1)
        for (let i = 0; i < buf2.length; i++) {
          expect(buf2[i]).assertEqual(1);
        }
        let expectedBuf = buffer.from([1, 1, 1, 1]);
        expect(buf2.equals(expectedBuf)).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0400
     * @tc.name       : testFill0004
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFill0004';
      try {
        let uint = new Uint8Array([0x48, 0x49]);
        let buf = buffer.allocUninitializedFromPool(5);
        buf.fill(uint);
        let expectedBuf = buffer.from([72, 73, 72, 73, 72]);
        expect(buf.equals(expectedBuf)).assertTrue();
      } catch (error) {
        console.error(`${TAG} error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0500
     * @tc.name       : testFill0005
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFill0005';
      try {
        const buf = buffer.alloc(3)
        buf.fill(3)
        const res = buffer.from([3, 3, 3]);
        expect(buf.equals(res)).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0600
     * @tc.name       : testFill0006
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFill0006';
      try {
        const buf = buffer.alloc(6);
        buf.fill('D', 0);
        expect(buf.toString()).assertEqual('DDDDDD');
      } catch (error) {
        6
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0700
     * @tc.name       : testFill0007
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFill0007';
      try {
        const buf = buffer.alloc(6);
        buf.fill('D', -1);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} error:${error.message}`);
        expect(error.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1')

      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0800
     * @tc.name       : testFill0008
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFill0008';
      try {
        const buf = buffer.alloc(6);
        buf.fill('D', Infinity);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} error:${e.message}`);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 4294967296. Received value is: Infinity')

      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0900
     * @tc.name       : testFill0009
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFill0009';
      try {
        const buf = buffer.alloc(6);
        buf.fill('D', -Infinity);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed,error:${e.message}`);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 4294967296. Received value is: -Infinity');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_1000
     * @tc.name       : testFill0010
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFill0010';
      try {
        const buf = buffer.alloc(3);
        buf.fill('A', 1);
        expect(buf.toString()).assertEqual('\x00AA');
        expect(buf[1]).assertEqual(0x41);
        expect(buf[2]).assertEqual(0x41);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_1100
     * @tc.name       : testFill0011
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFill0011';
      try {
        const buf = buffer.alloc(3)
        buf.fill('A', 0, 0);
        expect(buf.toString()).assertEqual('\x00\x00\x00');
      } catch (error) {
        console.error(`${TAG}error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_1200
     * @tc.name       : testFill0012
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFill0012';
      try {
        const buf = buffer.alloc(5);
        buf.fill(0x4B, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, -1);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect(error.message)
          .assertEqual('The value of "end" is out of range. It must be >= 0 and <= 5. Received value is: -1');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_1300
     * @tc.name       : testFill0013
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFill0013';
      try {
        const buf = buffer.alloc(5);
        buf.fill(0x4B, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, Infinity);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect(error.message)
          .assertEqual('The value of "end" is out of range. It must be >= 0 and <= 5. Received value is: Infinity');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_1400
     * @tc.name       : testFill0014
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFill0014';
      try {
        const buf = buffer.alloc(5);
        buf.fill(0x4B, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, -Infinity);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect(error.message)
          .assertEqual('The value of "end" is out of range. It must be >= 0 and <= 5. Received value is: -Infinity');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_1500
     * @tc.name       : testFill0015
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFill0015';
      try {
        const buf = buffer.alloc(3);
        buf.fill('A', 0, 1);
        expect(buf.toString()).assertEqual('A\x00\x00');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_1600
     * @tc.name       : testFill0016
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFill0016';
      try {
        const buf = buffer.alloc(5);
        buf.fill('A', 0, 5, 'base64');
        expect(buf.toString('base64')).assertEqual('AAAAAAA=');
      } catch (error) {
        console.error(`${TAG} error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_1700
     * @tc.name       : testFill0017
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFill0017';
      try {
        const buf = buffer.alloc(5);
        buf.fill('a', 0, 5, 'utf8');
        expect(buf.toString('utf8')).assertEqual('aaaaa');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0100
     * @tc.name       : testBufferCompare0001
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0001';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        expect(buf1.compare(buf2)).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0200
     * @tc.name       : testBufferCompare0002
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0002';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const u8 = new Uint8Array([0, 2, 3]);
        expect(buf1.compare(u8)).assertEqual(1);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0300
     * @tc.name       : testBufferCompare0003
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0003';
      try {
        const buf1 = buffer.from([3, 2, 1]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, 0);
        expect(buf1.compare(buf2, 0)).assertEqual(1);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0400
     * @tc.name       : testBufferCompare0004
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0004';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([3, 2, 1]);
        const result = buf1.compare(buf2, -1);
        expect(result).assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect(error.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0500
     * @tc.name       : testBufferCompare0005
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0005';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([3, 2, 1]);
        const result = buf1.compare(buf2, Infinity);
        expect(result).assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect(error.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: Infinity');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0600
     * @tc.name       : testBufferCompare0006
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0006';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([3, 2, 1]);
        const result = buf1.compare(buf2, -Infinity);
        expect(result).assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect(error.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: -Infinity');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0700
     * @tc.name       : testBufferCompare0007
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0007';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([3, 2, 1]);
        const result = buf1.compare(buf2, 1);
        expect(result).assertEqual(-1);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0800
     * @tc.name       : testBufferCompare0008
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0008';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined);
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0900
     * @tc.name       : testBufferCompare0009
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0009';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, undefined, 0);
        const result = buf1.compare(buf2);
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1000
     * @tc.name       : testCompare0010
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0010';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([4, 5, 6]);
        buf1.compare(buf2, undefined, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "targetEnd" is out of range. It must be >= 0 and <= 3. Received value is: -1');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1100
     * @tc.name       : testCompare0011
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0011';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3, 4]);
        const result = buf1.compare(buf2, undefined, Infinity);
        expect(result).assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect(error.message)
          .assertEqual('The value of "targetEnd" is out of range. It must be >= 0 and <= 4. Received value is: Infinity');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1200
     * @tc.name       : testCompare0012
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0012';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, -Infinity);
        expect(result).assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect(error.message)
          .assertEqual('The value of "targetEnd" is out of range. It must be >= 0 and <= 3. Received value is: -Infinity');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1300
     * @tc.name       : testCompare0013
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0013';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, 1);
        expect(result).assertEqual(1);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1400
     * @tc.name       : testCompare0014
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0014';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([4, 5, 6]);
        buf1.compare(buf2, undefined, undefined);
        expect(buf1.compare(buf2, undefined, undefined)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1500
     * @tc.name       : testCompare0015
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0015';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, 0);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1600
     * @tc.name       : testCompare0016
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0016';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, undefined, undefined, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1700
     * @tc.name       : testCompare0017
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0017';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, undefined, undefined, Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1800
     * @tc.name       : testCompare0018
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0018';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, undefined, undefined, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: -Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1900
     * @tc.name       : testCompare0019
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0019';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, 1);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_2000
     * @tc.name       : testCompare0020
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0020';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_2100
     * @tc.name       : testCompare0021
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0021';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, 0);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_2200
     * @tc.name       : testCompare0022
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0022';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, -1);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0 and <= 3. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_2300
     * @tc.name       : testCompare0023
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0023';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0 and <= 3. Received value is: Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_2400
     * @tc.name       : testCompare0024
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0024';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0 and <= 3. Received value is: -Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_2500
     * @tc.name       : testCompare0025
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0025';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, 1);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_0100
     * @tc.name       : testCopy0001
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0001';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_0200
     * @tc.name       : testCopy0002
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0002';
      try {
        const buf1 = buffer.alloc(26);
        for (let i = 0; i < 26; i++) {
          buf1[i] = i + 97;
        }
        const buf2 = new Uint8Array(26);
        buf1.copy(buf2);
        for (let i = 0; i < 26; i++) {
          expect(buf2[i]).assertEqual(97 + i);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_0300
     * @tc.name       : testCopy0003
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0003';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, 0);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        expect().assertFail();
        console.error(`${TAG} failed,error:${err.message}`);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_0400
     * @tc.name       : testCopy0004
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0004';
      try {
        let buf1 = buffer.alloc(6);
        let buf2 = buffer.alloc(6).fill('!');
        buf1.copy(buf2, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_0500
     * @tc.name       : testCopy0005
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0005';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, Infinity);
        expect(buf2.toString()).assertEqual('!!!!!!!!!!!!!!!!!!!!!!!!!!');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_0600
     * @tc.name       : testCopy0006
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0006';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0. Received value is: -Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_0700
     * @tc.name       : testCopy0007
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0007';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, 1);
        expect(buf2.toString()).assertEqual('!abcdefghijklmnopqrstuvwxy');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_0800
     * @tc.name       : testCopy0008
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0008';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_0900
     * @tc.name       : testCopy0009
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0009';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, 0);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1000
     * @tc.name       : testCopy0010
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0010';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1100
     * @tc.name       : testCopy0011
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0011';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, Infinity);
        expect(buf2.toString()).assertEqual('!!!!!!!!!!!!!!!!!!!!!!!!!!');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1200
     * @tc.name       : testCopy0012
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0012';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0. Received value is: -Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1300
     * @tc.name       : testCopy0013
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0013';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, 1);
        expect(buf2.toString()).assertEqual('bcdefghijklmnopqrstuvwxyz!');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1400
     * @tc.name       : testCopy0014
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0014';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1500
     * @tc.name       : testCopy0015
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0015';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, 0);
        expect(buf2.toString()).assertEqual('!!!!!!!!!!!!!!!!!!!!!!!!!!');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1600
     * @tc.name       : testCopy0016
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0016';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1700
     * @tc.name       : testCopy0017
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0017';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, Infinity);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1800
     * @tc.name       : testCopy0018
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0018';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0. Received value is: -Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1900
     * @tc.name       : testCopy0019
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0019';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, 1);
        expect(buf2.toString()).assertEqual('a!!!!!!!!!!!!!!!!!!!!!!!!!');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_2000
     * @tc.name       : testCopy0020
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCopy0020';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, undefined);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0100
     * @tc.name       : testEquals0001
     * @tc.desc       : Test the function of the interface Equals.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEquals001';
      try {
        const buf1 = buffer.from('ABC');
        const buf2 = buffer.from('414243', 'hex');
        const result = buf1.equals(buf2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0200
     * @tc.name       : testEquals0002
     * @tc.desc       : Test the function of the interface Equals.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferEquals0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEquals0002';
      try {
        const buf1 = buffer.from('ABC');
        const buf2 = new Uint8Array([1, 2, 3]);
        const result = buf1.equals(buf2);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0300
     * @tc.name       : testEquals0003
     * @tc.desc       : Test the function of the interface Equals.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferEquals0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEquals0003';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const u8 = new Uint8Array([1, 2, 3]);
        const result = buf1.equals(u8);
        expect(result).assertEqual(true);
        expect([...u8].indexOf(2)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0400
     * @tc.name       : testEquals0004
     * @tc.desc       : Test the function of the interface Equals.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferEquals0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEquals0004';
      try {
        const target = buffer.from([1, 2, 3, 4]);
        const source = buffer.from([3, 4, 5]);
        expect(target.equals(source)).assertEqual(
          target[3] === source[0]
        );
      } catch (err) {
        console.error(`${TAG} error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0100
     * @tc.name       : testIncludes0001
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0001';
      try {
        let buf = buffer.from('hello world');
        expect(buf.includes('hello')).assertTrue();
        expect(buf.includes('be')).assertFalse();
      } catch (err) {
        console.error(`${TAG} error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0200
     * @tc.name       : testIncludes0002
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0002';
      try {
        let buf = buffer.from([1, 2, 3, 4]);
        expect(buf.includes(1)).assertTrue();
        expect(buf.includes(5)).assertFalse();
      } catch (err) {
        console.error(`${TAG} error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0300
     * @tc.name       : testIncludes0003
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0003';
      try {
        let buf = buffer.from('hello world');
        let searchBuf = buffer.from('world');
        expect(buf.includes(searchBuf)).assertTrue();
        expect(buf.includes(buffer.from('test'))).assertFalse();
      } catch (e) {
        console.error(`${TAG} error:${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0400
     * @tc.name       : testIncludes0004
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0004';
      try {
        let buf = buffer.from('hello world');
        let arr = new Uint8Array([0x68, 0x65]);
        expect(buf.includes(arr)).assertTrue();
        expect(buf.includes(new Uint8Array([0x7a]))).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0500
     * @tc.name       : testIncludes0005
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0005';
      try {
        let buf = buffer.from('hello');
        const result = buf.includes('hello', 0);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0600
     * @tc.name       : testIncludes0006
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0006';
      try {
        let buf = buffer.from('abcdefg');
        buf.includes('def', -1);
        expect(buf.includes('def', -1)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0700
     * @tc.name       : testIncludes0007
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0007';
      try {
        let buf = buffer.from('abc');
        expect(buf.includes('a', Infinity)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0800
     * @tc.name       : testIncludes0008
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0008';
      try {
        let buf = buffer.from('abc');
        expect(buf.includes('c', -Infinity)).assertTrue();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0900
     * @tc.name       : testIncludes0009
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0009';
      try {
        let buf = buffer.from('abc');
        expect(buf.includes('a', 1)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1000
     * @tc.name       : testIncludes0010
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0010';
      try {
        let buf = buffer.from('abc');
        expect(buf.includes('a', undefined)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1100
     * @tc.name       : testIncludes0011
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0011';
      try {

        let buf = buffer.from('test');
        expect(buf.includes('dGVzdA==', undefined, 'base64')).assertTrue();
        expect(buf.includes('abcd', undefined, 'base64')).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1200
     * @tc.name       : testIncludes0012
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0012';
      try {
        let buf = buffer.from('你好');
        expect(buf.includes('你好', undefined, 'utf-8')).assertTrue();
        expect(buf.includes('hello', undefined, 'utf-8')).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1300
     * @tc.name       : testIncludes0013
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0013';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = buffer.from([102, 103]);
        const includesTrue = buf.includes(subBuf, Infinity);
        expect(includesTrue).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1400
     * @tc.name       : testIncludes0014
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0014';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = buffer.from([102, 103]);
        const includesTrue = buf.includes(subBuf, Infinity, 'utf-8');
        expect(includesTrue).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1500
     * @tc.name       : testIncludes0015
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0015';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = buffer.from([102, 103]);
        const includesTrue = buf.includes(subBuf, 1, 'utf-8');
        expect(includesTrue).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1600
     * @tc.name       : testIncludes0016
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0016';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = buffer.from([102, 103]);
        const includesTrue = buf.includes(subBuf, 1, 'base64');
        expect(includesTrue).assertEqual(true)

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1700
     * @tc.name       : testIncludes0017
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0017';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf);
        expect(includes).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1800
     * @tc.name       : testIncludes0018
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0018';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf, Infinity, 'utf-8');
        expect(includes).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1900
     * @tc.name       : testIncludes0019
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0019'
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_2000
     * @tc.name       : testIncludes0020
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0020';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf, Infinity, 'base64');
        expect(includes).assertEqual(false)

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_2100
     * @tc.name       : testIncludes0021
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0021';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf, 1, 'utf-8');
        expect(includes).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_2200
     * @tc.name       : testIncludes0022
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIncludes0022';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf, 1);
        expect(includes).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_0100
     * @tc.name       : testIndexOf0001
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0001';
      try {
        let buf = buffer.from('this is a buffer');
        let result = buf.indexOf('this');
        expect(result).assertEqual(0);
        expect(buf.indexOf('is')).assertEqual(2);
        expect(buf.indexOf('a')).assertEqual(8);
        expect(buf.indexOf('buffer')).assertEqual(10);
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_0200
     * @tc.name       : testIndexOf0002
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0002';
      try {
        let buf = buffer.from([1, 2, 3, 4]);
        let result = buf.indexOf(3);
        expect(result).assertEqual(2);
        expect(buf.indexOf(4)).assertEqual(3);
        expect(buf.indexOf(1)).assertEqual(0);
        expect(buf.indexOf(5)).assertEqual(-1);
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_0300
     * @tc.name       : testIndexOf0003
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0003';
      try {
        let buf = buffer.from([1, 2, 3, 4, 5, 6]);
        let buf1 = buffer.from([1, 2, 3]);
        let result = buf.indexOf(buf1);
        expect(result).assertEqual(0);
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_0400
     * @tc.name       : testIndexOf0004
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0004';
      try {
        let buf = buffer.from('this');
        let uint8Arr = new Uint8Array([0x74]);
        let result = buf.indexOf(uint8Arr);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_0500
     * @tc.name       : testIndexOf0005
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0005';
      try {
        let buf = buffer.from('this is a buffer');
        expect(buf.indexOf('this', 0).toString()).assertEqual('0');
        expect(buf.indexOf('is', 0).toString()).assertEqual('2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_0600
     * @tc.name       : testIndexOf0006
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0006';
      try {
        let buf = buffer.from([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf1 = buffer.from([0, 1, 2, 3, 4, 5]);
        expect(buf.indexOf(buf1, -1)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_0700
     * @tc.name       : testIndexOf0007
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0007';
      try {
        let buf = buffer.from('this is a buffer');
        buf.indexOf('this', Infinity);
        buf.indexOf('is', Infinity);
        expect(buf.indexOf('this', Infinity)).assertEqual(-1);
        expect(buf.indexOf('is', Infinity)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_0800
     * @tc.name       : testIndexOf0008
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0008';
      try {
        let buf = buffer.from('this is a buffer');
        buf.indexOf('this', -Infinity);
        buf.indexOf('is', -Infinity);
        expect(buf.indexOf('this', -Infinity)).assertEqual(0);
        expect(buf.indexOf('is', -Infinity)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_0900
     * @tc.name       : testIndexOf0009
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0009';
      try {
        let buf = buffer.from('this is a buffer');
        buf.indexOf('this', 1);
        buf.indexOf('is', 1);
        expect(buf.indexOf('this', 1)).assertEqual(-1);
        expect(buf.indexOf('is', 1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_1000
     * @tc.name       : testIndexOf0010
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0010';
      try {
        let buf = buffer.from('this is a buffer');
        let result = buf.indexOf('this', undefined);
        expect(result).assertEqual(0);
        expect(buf.indexOf('is', undefined)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_1100
     * @tc.name       : testIndexOf0011
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0011';
      try {
        let buf = buffer.from('hello this is a buffer');
        let base64Value = 'aGVsbG8=';
        let result = buf.indexOf(base64Value, undefined, 'base64');
        expect(result).assertEqual(0);
        expect(buf.indexOf('this', undefined, 'base64')).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_1200
     * @tc.name       : testIndexOf0012
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0012';
      try {
        let buf = buffer.from('this is a buffer');
        expect(buf.indexOf('this', undefined, 'utf-8')).assertEqual(0);
        expect(buf.indexOf('is', undefined, 'utf-8')).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_1300
     * @tc.name       : testIndexOf0013
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0013';
      try {
        let buf = buffer.from('test');
        let emptyBuf = buffer.alloc(0);
        let result = buf.indexOf(emptyBuf);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_1400
     * @tc.name       : testIndexOf0014
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0014';
      try {
        const buf = buffer.from('Hello World');
        const index = buf.indexOf('World', 1, 'utf-8');
        expect(index).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_1500
     * @tc.name       : testIndexOf0015
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0015';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, 0);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_1600
     * @tc.name       : testIndexOf0016
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0016';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, 0, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_1700
     * @tc.name       : testIndexOf0017
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0017';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, 0, 'utf-8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_1800
     * @tc.name       : testIndexOf0018
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0018';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, -1);
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_1900
     * @tc.name       : testIndexOf0019
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0019';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, -1, 'base64');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_2000
     * @tc.name       : testIndexOf0020
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0020';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, -1, 'utf-8');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_2100
     * @tc.name       : testIndexOf0021
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0021';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, Infinity, 'base64');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_2200
     * @tc.name       : testIndexOf0022
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0022';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, Infinity, 'utf-8');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_2300
     * @tc.name       : testIndexOf0023
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0023';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, -Infinity, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_2400
     * @tc.name       : testIndexOf0024
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0024';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, -Infinity, 'utf-8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_2500
     * @tc.name       : testIndexOf0025
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0025';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, 1, 'base64');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_2600
     * @tc.name       : testIndexOf0026
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level
     */
    it('testBufferIndexOf0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0026';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, 1, 'utf-8');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_2700
     * @tc.name       : testIndexOf0027
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0027';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = buffer.from([101, 102])
        const index = buf.indexOf(value, 0, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_2800
     * @tc.name       : testIndexOf0028
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0028';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = buffer.from([101, 102])
        const index = buf.indexOf(value, 0, 'utf-8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_2900
     * @tc.name       : testIndexOf0029
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0029';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = buffer.from([101, 102])
        const index = buf.indexOf(value, Infinity, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_3000
     * @tc.name       : testIndexOf0030
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0030';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = buffer.from([101, 102])
        const index = buf.indexOf(value, Infinity);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_3100
     * @tc.name       : testIndexOf0031
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0031';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = buffer.from([101, 102])
        const index = buf.indexOf(value, Infinity, 'utf-8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_3200
     * @tc.name       : testIndexOf0032
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0032';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = buffer.from([101, 102])
        const index = buf.indexOf(value, -Infinity);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_3300
     * @tc.name       : testIndexOf0033
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0033';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, 0);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_3400
     * @tc.name       : testIndexOf0034
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0034';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, 0, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_3500
     * @tc.name       : testIndexOf0035
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0035';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, -1);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_3600
     * @tc.name       : testIndexOf0036
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0036';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, Infinity);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_3700
     * @tc.name       : testIndexOf0037
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level
     */
    it('testBufferIndexOf0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0037';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, Infinity, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_3800
     * @tc.name       : testIndexOf0038
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0038';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, Infinity, 'utf-8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_3900
     * @tc.name       : testIndexOf0039
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0039';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, -Infinity);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_4000
     * @tc.name       : testIndexOf0040
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0040';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, -Infinity, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_4100
     * @tc.name       : testIndexOf0041
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0041';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, -Infinity, 'utf-8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_4200
     * @tc.name       : testIndexOf0042
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0042';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, 1);
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_4300
     * @tc.name       : testIndexOf0043
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0043';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, 1, 'base64');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_4400
     * @tc.name       : testIndexOf0044
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIndexOf0042';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, 1, 'utf-8');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_0100
     * @tc.name       : testLastIndexOf0001
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0001';
      try {
        let buf = buffer.from('this buffer is a buffer');
        expect(buf.lastIndexOf('buffer')).assertEqual(17);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_0200
     * @tc.name       : testLastIndexOf0002
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0002';
      try {
        let buf = buffer.from([1, 23, 4, 6, 3, 45, 4, 5, 55, 16, 66, 2]);
        expect(buf.lastIndexOf(6)).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_0300
     * @tc.name       : testLastIndexOf0003
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0003';
      try {
        let valueBuf = buffer.from('buffer');
        let mainBuf = buffer.from('this buffer is a buffer');
        const result = mainBuf.lastIndexOf(valueBuf);
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual(19);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_0400
     * @tc.name       : testLastIndexOf0004
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0004';
      try {
        let uintArr = new Uint8Array([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
        let mainBuf = buffer.from('this buffer is a buffer');
        const result = mainBuf.lastIndexOf(uintArr);
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual(19);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_0500
     * @tc.name       : testLastIndexOf0005
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0005';
      try {
        let buf = buffer.from('abcabc');
        expect(buf.lastIndexOf('abc', 0)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_0600
     * @tc.name       : testLastIndexOf0006
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0006';
      try {
        let buf = buffer.from('abcdef');
        expect(buf.lastIndexOf('cd', -1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_0700
     * @tc.name       : testLastIndexOf0007
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0007';
      try {
        let buf = buffer.from('abc');
        expect(buf.lastIndexOf('a', Infinity)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_0800
     * @tc.name       : testLastIndexOf0008
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0008';
      try {
        let buf = buffer.from('abc');
        expect(buf.lastIndexOf('a', -Infinity)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_0900
     * @tc.name       : testLastIndexOf0009
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0009';
      try {
        let buf = buffer.from('abc');
        expect(buf.lastIndexOf('a', 1)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_1000
     * @tc.name       : testLastIndexOf0010
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0010';
      try {
        let buf = buffer.from('abc');
        expect(buf.lastIndexOf('a', undefined)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_1100
     * @tc.name       : testLastIndexOf0011
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0011';
      try {
        let valueBase64 = 'YmFzZTY0';
        let buf = buffer.from('base64', 'utf8');
        expect(buf.lastIndexOf(valueBase64, undefined, 'base64')).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_1200
     * @tc.name       : testLastIndexOf0012
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0012';
      try {
        let buf = buffer.from('abc');
        expect(buf.lastIndexOf('a', undefined, 'utf8')).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_1300
     * @tc.name       : testLastIndexOf0013
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0013';
      try {
        const buf = buffer.from('Hello World');
        const value = 'World';
        const index = buf.lastIndexOf(value, 1, 'utf-8');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_1400
     * @tc.name       : testLastIndexOf0014
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0014';
      try {
        const buf = buffer.from('Hello World');
        const value = 'World';
        const index = buf.lastIndexOf(value, 1, 'base64');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_1500
     * @tc.name       : testLastIndexOf0015
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0015';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, 0, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_1600
     * @tc.name       : testLastIndexOf0016
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0016';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, 0, 'utf8');
        expect(index).assertEqual(0)

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_1700
     * @tc.name       : testLastIndexOf0017
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0017';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, 0, 'utf-8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /*
     *@tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_1800
     * @tc.name       : testLastIndexOf0018
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     *
     */
    it('testBufferLastIndexOf0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0018';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, -1, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_1900
     * @tc.name       : testLastIndexOf0019
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0019';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, -1, 'utf8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_2000
     * @tc.name       : testLastIndexOf0020
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0020';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, Infinity, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LAST_INDEX_OF_2100
     * @tc.name       : testLastIndexOf0021
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferLastIndexOf0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testLastIndexOf0021';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, Infinity, 'utf8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_0100
     * @tc.name       : testReadBigInt64BE0001
     * @tc.desc       : Test the function of the interface readBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadBigInt64BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadBigInt64BE0001';
      try {
        let buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
          0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
        expect(buf.readBigInt64BE().toString()).assertEqual('7161960797921896816');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_0200
     * @tc.name       : testReadBigInt64BE0002
     * @tc.desc       : Test the function of the interface readBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadBigInt64BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadBigInt64BE0002';
      try {
        let buf = buffer.alloc(8)
        buf.writeBigInt64BE(BigInt(0x0102030405060708), 0);
        expect(buf.readBigInt64BE(0).toString()).assertEqual(BigInt(0x0102030405060708).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_0300
     * @tc.name       : testReadBigInt64BE0003
     * @tc.desc       : Test the function of the interface readBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadBigInt64BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadBigInt64BE0003';
      try {
        let buf = buffer.alloc(9);
        const expectedValue = BigInt(0x0203040506070809);
        buf.writeBigInt64BE(expectedValue, 1);
        expect(buf.readBigInt64BE(1).toString()).assertEqual(expectedValue.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_0400
     * @tc.name       : testReadBigInt64BE0004
     * @tc.desc       : Test the function of the interface readBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadBigInt64BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadBigInt64BE0004';
      try {
        let buf = buffer.alloc(8)
        buf.readBigInt64BE(-1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ READ_0500
     * @tc.name       : testReadBigInt64LE0001
     * @tc.desc       : Test the function of the interface ReadBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadBigInt64LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadBigInt64LE0001';
      try {
        let buf = buffer.alloc(8);
        const expectedValue = BigInt("0x0102030405060708");
        buf.writeBigInt64LE(expectedValue, 0);
        const actualValue = buf.readBigInt64LE();
        expect(actualValue.toString()).assertEqual(expectedValue.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_0600
     * @tc.name       : testReadBigInt64LE0002
     * @tc.desc       : Test the function of the interface ReadBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadBigInt64LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadBigInt64LE0002';
      try {
        let buf = buffer.alloc(8)
        buf.writeBigInt64LE(BigInt(0x0102030405060708), 0);
        expect(buf.readBigInt64LE(0).toString()).assertEqual(BigInt(0x0102030405060708).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_0700
     * @tc.name       : testReadBigInt64LE0003
     * @tc.desc       : Test the function of the interface ReadBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadBigInt64LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadBigInt64LE0003';
      try {
        let buf = buffer.alloc(9);
        const expectedValue = BigInt(0x0203040506070809);
        buf.writeBigInt64LE(expectedValue, 1);
        expect(buf.readBigInt64LE(1).toString()).assertEqual(expectedValue.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_0800
     * @tc.name       : testReadBigInt64LE0004
     * @tc.desc       : Test the function of the interface ReadBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadBigInt64LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadBigInt64LE0004';
      try {
        let buf = buffer.alloc(8)
        buf.readBigInt64LE(-1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_0900
     * @tc.name       : testReadBigUInt64BE0001
     * @tc.desc       : Test the function of the interface ReadBigUInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadBigUInt64BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadBigUInt64BE0001';
      try {
        let buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
          0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
        console.info(buf.readBigUInt64BE(0).toString());
        expect(buf.readBigUInt64BE(0).toString()).assertEqual('7161960797921896816');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_1000
     * @tc.name       : testReadBigUInt64BE0002
     * @tc.desc       : Test the function of the interface ReadBigUInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadBigUInt64BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadBigUInt64BE0002';
      try {
        let buf = buffer.alloc(8)
        buf.writeBigUInt64BE(BigInt(0x0102030405060708), 0);
        expect(buf.readBigUInt64BE(0).toString()).assertEqual(BigInt(0x0102030405060708).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_1100
     * @tc.name       : testReadBigUInt64BE0003
     * @tc.desc       : Test the function of the interface ReadBigUInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadBigUInt64BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadBigUInt64BE0003';
      try {
        let buf = buffer.alloc(9);
        const expectedValue = BigInt(0x0203040506070809);
        buf.writeBigUInt64BE(expectedValue, 1);
        expect(buf.readBigUInt64BE(1).toString()).assertEqual(expectedValue.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_1200
     * @tc.name       : testReadBigUInt64BE0004
     * @tc.desc       : Test the function of the interface ReadBigUInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadBigUInt64BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadBigUInt64BE0004';
      try {
        let buf = buffer.alloc(8)
        buf.readBigUInt64BE(-1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_1300
     * @tc.name       : testReadBigUInt64LE0001
     * @tc.desc       : Test the function of the interface ReadBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadBigUInt64LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadBigUInt64LE0001';
      try {
        let buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
          0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
        console.info(buf.readBigUInt64LE(0).toString());
        expect(buf.readBigUInt64LE(0).toString()).assertEqual('8100120198111388771');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_1400
     * @tc.name       : testReadBigUInt64LE0002
     * @tc.desc       : Test the function of the interface ReadBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadBigUInt64LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadBigUInt64LE0002';
      try {
        let buf = buffer.alloc(8)
        buf.writeBigUInt64LE(BigInt(0x0102030405060708), 0);
        expect(buf.readBigUInt64LE(0).toString()).assertEqual(BigInt(0x0102030405060708).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_1500
     * @tc.name       : testReadBigUInt64LE0003
     * @tc.desc       : Test the function of the interface ReadBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadBigUInt64LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadBigUInt64LE0003';
      try {
        let buf = buffer.alloc(9);
        const expectedValue = BigInt(0x0203040506070809);
        buf.writeBigUInt64LE(expectedValue, 1);
        expect(buf.readBigUInt64LE(1).toString()).assertEqual(expectedValue.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_1600
     * @tc.name       : testReadBigUInt64LE0004
     * @tc.desc       : Test the function of the interface ReadBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadBigUInt64LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadBigUInt64LE0004';
      try {
        let buf = buffer.alloc(8)
        buf.readBigUInt64LE(-1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_1700
     * @tc.name       : testReadDoubleBE0001
     * @tc.desc       : Test the function of the interface readDoubleBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadDoubleBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadDoubleBE0001';
      try {
        const buf = buffer.alloc(8);
        buf.writeDoubleBE(123.456, 0);
        const result = buf.readDoubleBE();
        expect(result).assertEqual(123.456);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_1800
     * @tc.name       : testReadDoubleBE0002
     * @tc.desc       : Test the function of the interface readDoubleBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadDoubleBE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadDoubleBE0002';
      try {
        const buf = buffer.alloc(8);
        buf.writeDoubleBE(0, 0);
        const result = buf.readDoubleBE();
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_1900
     * @tc.name       : testReadDoubleBE0003
     * @tc.desc       : Test the function of the interface readDoubleBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadDoubleBE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadDoubleBE0003';
      try {
        let buf = buffer.alloc(9);
        const expectedValue = 123.456;
        buf.writeDoubleBE(expectedValue, 1);
        const actualValue = buf.readDoubleBE(1);
        expect(actualValue).assertEqual(expectedValue);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_2000
     * @tc.name       : testReadDoubleBE0004
     * @tc.desc       : Test the function of the interface readDoubleBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadDoubleBE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadDoubleBE0004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(8);
        buf1.readDoubleBE(-1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_2100
     * @tc.name       : testReadDoubleLE0001
     * @tc.desc       : Test the function of the interface readDoubleLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadDoubleLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadDoubleLE0001';
      try {
        let buf = buffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
        console.info(buf.readDoubleLE().toString());
        expect(buf.readDoubleLE().toString()).assertEqual('5.447603722011605e-270');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_2200
     * @tc.name       : testReadDoubleLE0002
     * @tc.desc       : Test the function of the interface readDoubleLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadDoubleLE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadDoubleLE0002';
      try {
        let buf1 = buffer.allocUninitializedFromPool(8);
        let result = buf1.writeDoubleLE(123.456, 0);
        console.info("result = " + result);
        expect(buf1.readDoubleLE(0).toString()).assertEqual('123.456');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_2300
     * @tc.name       : testReadDoubleLE0003
     * @tc.desc       : Test the function of the interface readDoubleLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadDoubleLE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadDoubleLE0003';
      try {
        let buf1 = buffer.allocUninitializedFromPool(9);
        buf1.writeDoubleLE(123.456, 1);
        expect(buf1.readDoubleLE(1).toString()).assertEqual('123.456');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_2400
     * @tc.name       : testReadDoubleLE0004
     * @tc.desc       : Test the function of the interface readDoubleLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadDoubleLE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadDoubleLE0004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(8);
        buf1.readDoubleLE(-1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_2500
     * @tc.name       : testReadFloatBE0001
     * @tc.desc       : Test the function of the interface readFloatBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadFloatBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadFloatBE0001';
      try {
        const buf = buffer.alloc(8);
        buf.writeFloatBE(123.456, 0);
        const result = buf.readFloatBE();
        expect(result).assertEqual(123.45600128173828);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_2600
     * @tc.name       : testReadFloatBE0002
     * @tc.desc       : Test the function of the interface readFloatBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadFloatBE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadFloatBE0002';
      try {
        let buf = buffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
        console.info(buf.readFloatBE(0).toString());
        expect(buf.readFloatBE(0).toString()).assertEqual('2.387939260590663e-38');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_2700
     * @tc.name       : testReadFloatBE0003
     * @tc.desc       : Test the function of the interface readFloatBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadFloatBE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadFloatBE0003';
      try {
        const buf = buffer.alloc(5);
        const value = 789.12;
        buf.writeFloatBE(value, 1);
        const readValue = buf.readFloatBE(1);
        expect(readValue).assertClose(value, 0.001);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_2800
     * @tc.name       : testReadFloatBE0004
     * @tc.desc       : Test the function of the interface readFloatBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadFloatBE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadFloatBE0004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(4);
        buf1.readFloatBE(-1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_2900
     * @tc.name       : testReadFloatLE0001
     * @tc.desc       : Test the function of the interface readFloatLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadFloatLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadFloatLE0001';
      try {
        const buf = buffer.alloc(8);
        buf.writeFloatLE(123.456, 0);
        const result = buf.readFloatLE();
        expect(result).assertEqual(123.45600128173828);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_3000
     * @tc.name       : testReadFloatLE0002
     * @tc.desc       : Test the function of the interface readFloatLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadFloatLE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadFloatLE0002';
      try {
        let buf = buffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
        console.info(buf.readFloatLE(0).toString());
        expect(buf.readFloatLE(0).toString()).assertEqual('1.539989614439558e-36');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_3100
     * @tc.name       : testReadFloatLE0003
     * @tc.desc       : Test the function of the interface readFloatLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadFloatLE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadFloatLE0003';
      try {
        const buf = buffer.alloc(5)
        const expectedValue = 50.125;
        buf.writeFloatLE(expectedValue, 1);
        const actualValue = buf.readFloatLE(1);
        expect(actualValue).assertClose(expectedValue, 1e-6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_3200
     * @tc.name       : testReadFloatLE0004
     * @tc.desc       : Test the function of the interface readFloatLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadFloatLE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadFloatLE0004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(4);
        buf1.readFloatLE(-1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_3300
     * @tc.name       : testReadInt80001
     * @tc.desc       : Test the function of the interface readInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt80001';
      try {
        const buf = buffer.from([-42, 100]);
        const value = buf.readInt8();
        const result = value.toString();
        console.log(`${TAG} result is ${result}`);
        expect(result).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_3400
     * @tc.name       : testReadInt80002
     * @tc.desc       : Test the function of the interface readInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt80002';
      try {
        let buf = buffer.from([-1, 5]);
        expect(buf.readInt8(0).toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_3500
     * @tc.name       : testReadInt80003
     * @tc.desc       : Test the function of the interface readInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt80003';
      try {
        let buf = buffer.from([-1, 5]);
        expect(buf.readInt8(1).toString()).assertEqual('5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_3600
     * @tc.name       : testReadInt80004
     * @tc.desc       : Test the function of the interface readInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt80004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt80004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(4);
        buf1.readInt8(-1);
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 3. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_3700
     * @tc.name       : testReadInt16BE001
     * @tc.desc       : Test the function of the interface readInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt16BE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt16BE001';
      try {
        let buf = buffer.from([0x12, 0x34]);
        expect(buf.readInt16BE().toString()).assertEqual('4660');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_3800
     * @tc.name       : testReadInt16BE002
     * @tc.desc       : Test the function of the interface readInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt16BE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt16BE002';
      try {
        let buf = buffer.from([0, 5]);
        expect(buf.readInt16BE(0).toString()).assertEqual('5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_3900
     * @tc.name       : testReadInt16BE003
     * @tc.desc       : Test the function of the interface readInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt16BE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt16BE003';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        expect(buf.readInt16BE(1).toString()).assertEqual('13398');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_4000
     * @tc.name       : testReadInt16BE004
     * @tc.desc       : Test the function of the interface readInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt16BE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt16BE004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(2);
        buf1.readInt16BE(-1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_4100
     * @tc.name       : testReadInt16LE001
     * @tc.desc       : Test the function of the interface readInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt16LE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt16LE001';
      try {
        let buf = buffer.from([0, 5]);
        console.info(buf.readInt16LE().toString());
        expect(buf.readInt16LE().toString()).assertEqual('1280');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_4200
     * @tc.name       : testReadInt16LE002
     * @tc.desc       : Test the function of the interface readInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt16LE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt16LE002';
      try {
        let buf = buffer.from([0, 5]);
        expect(buf.readInt16LE(0).toString()).assertEqual('1280');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_4300
     * @tc.name       : testReadInt16LE003
     * @tc.desc       : Test the function of the interface readInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt16LE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt16LE003';
      try {
        let buf = buffer.from([0, 5, 10]);
        let result = buf.readInt16LE(1);
        expect(result).assertEqual(2565);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_4400
     * @tc.name       : testReadInt16LE004
     * @tc.desc       : Test the function of the interface readInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt16LE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt16LE004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(2);
        buf1.readInt16LE(-1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_4500
     * @tc.name       : testReadInt32BE001
     * @tc.desc       : Test the function of the interface readInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt32BE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt32BE001';
      try {
        let buf = buffer.from([0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 0, 5]);
        console.info(buf.readInt32BE().toString());
        expect(buf.readInt32BE().toString()).assertEqual('5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_4600
     * @tc.name       : testReadInt32BE002
     * @tc.desc       : Test the function of the interface readInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt32BE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt32BE002';
      try {
        let buf1 = buffer.alloc(4);
        let result = buf1.writeInt32BE(0x12345678, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_4700
     * @tc.name       : testReadInt32BE003
     * @tc.desc       : Test the function of the interface readInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt32BE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt32BE003';
      try {
        let buf = buffer.from([0x00, 0x01, 0x02, 0x03, 0x04]);
        console.log(buf.readInt32BE(1).toString());
        expect(buf.readInt32BE(1).toString()).assertEqual('16909060');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_4800
     * @tc.name       : testReadInt32BE004
     * @tc.desc       : Test the function of the interface readInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt32BE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt32BE004';
      try {
        let buf = buffer.from([0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 0, 5]);
        buf.readInt32BE(-1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_4900
     * @tc.name       : testReadInt32LE001
     * @tc.desc       : Test the function of the interface readInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt32LE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt32LE001';
      try {

        let buf = buffer.from([0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 0, 5]);
        console.info(buf.readInt32LE().toString());
        expect(buf.readInt32LE().toString()).assertEqual('83886080');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_5000
     * @tc.name       : testReadInt32LE002
     * @tc.desc       : Test the function of the interface readInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt32LE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt32LE002';
      try {

        let buf = buffer.from([0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 0, 5]);
        console.info(buf.readInt32LE(0).toString());
        expect(buf.readInt32LE(0).toString()).assertEqual('83886080');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_5100
     * @tc.name       : testReadInt32LE003
     * @tc.desc       : Test the function of the interface readInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt32LE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt32LE003';
      try {
        let buf = buffer.from([0x00, 0x01, 0x02, 0x03, 0x04]);
        const value = buf.readInt32LE(1);
        console.log(value.toString());
        expect(value.toString()).assertEqual('67305985');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_5200
     * @tc.name       : testReadInt32LE004
     * @tc.desc       : Test the function of the interface readInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadInt32LE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadInt32LE004';
      try {
        let buf = buffer.from([0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 0, 5]);
        buf.readInt32LE(-1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_5300
     * @tc.name       : testReadIntBE001
     * @tc.desc       : Test the function of the interface readIntBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt8001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt8001';
      try {
        let buf = buffer.from([1, -2]);
        console.info(buf.readUInt8().toString());
        expect(buf.readUInt8().toString()).assertEqual('1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_5400
     * @tc.name       : testReadUInt8002
     * @tc.desc       : Test the function of the interface ReadUInt8002.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt8002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt8002';
      try {
        let buf = buffer.from([1, -2]);
        console.info(buf.readUInt8(0).toString());
        expect(buf.readUInt8(0).toString()).assertEqual('1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_5500
     * @tc.name       : testReadUInt8003
     * @tc.desc       : Test the function of the interface ReadUInt8003.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt8003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt8003';
      try {
        let buf = buffer.from([1, -2]);
        console.info(buf.readUInt8(1).toString());
        expect(buf.readUInt8(1).toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_5600
     * @tc.name       : testReadUInt8004
     * @tc.desc       : Test the function of the interface ReadUInt8004.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt8004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt8004';
      try {
        let buf = buffer.from([1, -2]);
        buf.readUInt8(-1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_5700
     * @tc.name       : testReadUInt16BE001
     * @tc.desc       : Test the function of the interface ReadUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt16BE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt16BE001';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        console.info(buf.readUInt16BE().toString(16));
        expect(buf.readUInt16BE().toString(16)).assertEqual('1234');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_5800
     * @tc.name       : testReadUInt16BE002
     * @tc.desc       : Test the function of the interface ReadUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt16BE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt16BE002';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        console.info(buf.readUInt16BE(0).toString(16));
        expect(buf.readUInt16BE(0).toString(16)).assertEqual('1234');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_5900
     * @tc.name       : testReadUInt16BE003
     * @tc.desc       : Test the function of the interface ReadUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt16BE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt16BE003';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        console.info(buf.readUInt16BE(1).toString(16));
        expect(buf.readUInt16BE(1).toString(16)).assertEqual('3456');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_6000
     * @tc.name       : testReadUInt16BE004
     * @tc.desc       : Test the function of the interface ReadUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt16BE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt16BE004';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        buf.readUInt16BE(-1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_6100
     * @tc.name       : testReadUInt16LE001
     * @tc.desc       : Test the function of the interface ReadUInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt16LE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt16LE001';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        console.info(buf.readUInt16LE(0).toString(16));
        expect(buf.readUInt16LE(0).toString(16)).assertEqual('3412');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_6200
     * @tc.name       : testReadUInt16LE002
     * @tc.desc       : Test the function of the interface ReadUInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt16LE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt16LE002';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        console.info(buf.readUInt16LE(0).toString(16));
        expect(buf.readUInt16LE(0).toString(16)).assertEqual('3412');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_6300
     * @tc.name       : testReadUInt16LE003
     * @tc.desc       : Test the function of the interface ReadUInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt16LE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt16LE003';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        console.info(buf.readUInt16LE(1).toString(16));
        expect(buf.readUInt16LE(1).toString(16)).assertEqual('5634');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_6400
     * @tc.name       : testReadUInt16LE004
     * @tc.desc       : Test the function of the interface ReadUInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt16LE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt16LE004';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        buf.readUInt16LE(-1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: -1');
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_6500
     * @tc.name       : testReadUInt32BE001
     * @tc.desc       : Test the function of the interface ReadUInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt32BE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt32BE001';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        console.info(buf.readUInt32BE().toString(16));
        expect(buf.readUInt32BE().toString(16)).assertEqual('12345678');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_6600
     * @tc.name       : testReadUInt32BE002
     * @tc.desc       : Test the function of the interface ReadUInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt32BE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt32BE002';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        console.info(buf.readUInt32BE(0).toString(16));
        expect(buf.readUInt32BE(0).toString(16)).assertEqual('12345678');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_6700
     * @tc.name       : testReadUInt32BE003
     * @tc.desc       : Test the function of the interface ReadUInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt32BE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt32BE003';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        buf.writeUInt32BE(0x12345678, 1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}`);
        expect(e.message).assertEqual(
          'The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1'
        );
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_6800
     * @tc.name       : testReadUInt32BE004
     * @tc.desc       : Test the function of the interface ReadUInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt32BE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt32BE004';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        buf.readUInt32BE(-1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}`);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_6900
     * @tc.name       : testReadUInt32LE001
     * @tc.desc       : Test the function of the interface ReadUInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt32LE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt32LE001';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        console.info(buf.readUInt32LE(0).toString(16));
        expect(buf.readUInt32LE(0).toString(16)).assertEqual('78563412');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_7000
     * @tc.name       : testReadUInt32LE002
     * @tc.desc       : Test the function of the interface ReadUInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt32LE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt32LE002';
      try {

        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        const result = buf.readUInt32LE(1).toString(16);
        expect(result).assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_7100
     * @tc.name       : testReadUInt32LE003
     * @tc.desc       : Test the function of the interface ReadUInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt32LE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt32LE003';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        buf.writeUInt32LE(0x12345678, -1).toString(16);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READ_7200
     * @tc.name       : testReadUInt32LE004
     * @tc.desc       : Test the function of the interface ReadUInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferReadUInt32LE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadUInt32LE004';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        buf.readUInt32LE(-1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_0100
     * @tc.name       : testSubarray001
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0001';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray();
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_0200
     * @tc.name       : testSubarray0002
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0002';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(0, 3);
        const res = buf2.toString('ascii', 0, buf2.length);
        expect(res).assertEqual('abc');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_0300
     * @tc.name       : testSubarray003
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0003';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(-1);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_0400
     * @tc.name       : testSubarray004
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(Infinity);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_0500
     * @tc.name       : testSubarray005
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0005';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(-Infinity);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_0600
     * @tc.name       : testSubarray006
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0006';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(1);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('bcdefghijklmnopqrstuvwxyz');
        expect(buf2.length).assertEqual(25);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_0700
     * @tc.name       : testSubarray007
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0007';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(1, 0);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_0800
     * @tc.name       : testSubarray008
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0008';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(1, 1);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_0900
     * @tc.name       : testSubarray009
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0009';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(1, -1);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
        expect(buf2.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_1000
     * @tc.name       : testSubarray0010
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0010';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(1, Infinity);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('bcdefghijklmnopqrstuvwxyz');
        expect(buf2.length).assertEqual(25);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_1100
     * @tc.name       : testSubarray0011
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0011';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(1, -Infinity);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
        expect(buf2.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_1200
     * @tc.name       : testSubarray0012
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0012';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(-1, 1);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_1300
     * @tc.name       : testSubarray0013
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0013';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(Infinity, 0);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_1400
     * @tc.name       : testSubarray0014
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0014';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(Infinity, -1);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_1500
     * @tc.name       : testSubarray0015
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0015';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(Infinity, Infinity);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_1600
     * @tc.name       : testSubarray0016
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0016';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(Infinity, 1);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_1700
     * @tc.name       : testSubarray0017
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0017';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(-Infinity, 0);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_1800
     * @tc.name       : testSubarray0018
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0018';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(-Infinity, -1);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_1900
     * @tc.name       : testSubarray0019
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0019';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(-Infinity, Infinity);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_2000
     * @tc.name       : testSubarray0020
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0020';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(-Infinity, 1);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_2100
     * @tc.name       : testSubarray0021
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0021';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(-Infinity, -Infinity);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_2200
     * @tc.name       : testSubarray0022
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0022';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(1, 0);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_2300
     * @tc.name       : testSubarray0023
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0023';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(1, -1);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_2400
     * @tc.name       : testSubarray0024
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0024';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(1, Infinity);
        expect(buf2.length).assertEqual(7);
        expect(buf2.toString()).assertEqual('fghijkl');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAY_2500
     * @tc.name       : testSubarray0025
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferSubarray0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSubarray0025';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(1, -Infinity);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_0100
     * @tc.name       : testToString0001
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0001';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        expect(buf1.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_0200
     * @tc.name       : testToString0002
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0002';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        expect(buf1.toString('base64')).assertEqual('YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXo=');
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_0300
     * @tc.name       : testToString0003
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0003';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', 30);
        expect(str).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_0400
     * @tc.name       : testToString0004
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0004';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', 5, 3);
        expect(str).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_0500
     * @tc.name       : testToString0005
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0005';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', 0);
        expect(str).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_0600
     * @tc.name       : testToString0006
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0006';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', -1);
        console.log(`${TAG} str: ${str}`);
        expect(str).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_0700
     * @tc.name       : testToString0007
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0007';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', Infinity);
        expect(str).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_0800
     * @tc.name       : testToString0008
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0008';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', -Infinity);
        expect(str).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_0900
     * @tc.name       : testToString0009
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0009';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', 1);
        expect(str).assertEqual('bcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_1000
     * @tc.name       : testToString0010
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0010';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', undefined);
        expect(str).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_1100
     * @tc.name       : testToString0011
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0011';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', undefined, 3);
        expect(str).assertEqual('abc');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_1200
     * @tc.name       : testToString0012
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0012';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', undefined, 0);
        expect(str).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_1300
     * @tc.name       : testToString0013
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0013';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', 0, 1);
        expect(str).assertEqual('a');
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_1400
     * @tc.name       : testToString0014
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0014';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', undefined, Infinity)
        console.log(`${TAG} str: ${str}`);
        expect(str).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_1500
     * @tc.name       : testToString0015
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0015';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', 0, -Infinity);
        expect(str).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_1600
     * @tc.name       : testToString0016
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0016';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', undefined, -1);
        console.log(`${TAG} str: ${str}`);
        expect(str).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_1700
     * @tc.name       : testToString0017
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0017';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 0, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_1800
     * @tc.name       : testToString0018
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0018';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 0, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_1900
     * @tc.name       : testToString0019
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0019';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 0, Infinity);
        expect(res.length).assertEqual(8);
        expect(res).assertEqual('aGVsbG8=');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_2000
     * @tc.name       : testToString0020
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0020';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 0, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_2100
     * @tc.name       : testToString0021
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0021';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 0, 1);
        expect(res.length).assertEqual(4);
        expect(res).assertEqual('aA==');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_2200
     * @tc.name       : testToString0022
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0022';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -1, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_2300
     * @tc.name       : testToString0023
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0023';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -1, 1);
        expect(res.length).assertEqual(4);
        expect(res).assertEqual('aA==');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_2400
     * @tc.name       : testToString0024
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0024';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -1, Infinity);
        expect(res.length).assertEqual(8);
        expect(res).assertEqual('aGVsbG8=');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_2500
     * @tc.name       : testToString0025
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0025';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -1, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_2600
     * @tc.name       : testToString0026
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0026';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -1, 1);
        expect(res.length).assertEqual(4);
        expect(res).assertEqual('aA==');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_2700
     * @tc.name       : testToString0027
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0027';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', Infinity, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_2800
     * @tc.name       : testToString0028
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0028';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', Infinity, 1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_2900
     * @tc.name       : testToString0029
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0029';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', Infinity, Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_3000
     * @tc.name       : testToString0030
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0030';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', Infinity, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_3100
     * @tc.name       : testToString0031
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0031';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', Infinity, 1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_3200
     * @tc.name       : testToString0032
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0032';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -Infinity, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_3300
     * @tc.name       : testToString0033
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0033';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -Infinity, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_3400
     * @tc.name       : testToString0034
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0034';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -Infinity, Infinity);
        expect(res.length).assertEqual(8);
        expect(res).assertEqual('aGVsbG8=');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_3500
     * @tc.name       : testToString0035
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0035';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -Infinity, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_3600
     * @tc.name       : testToString0036
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0036';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -Infinity, 1);
        expect(res.length).assertEqual(4);
        expect(res).assertEqual('aA==');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_3700
     * @tc.name       : testToString0037
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0037';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 1, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_3800
     * @tc.name       : testToString0038
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0038';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 1, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_3900
     * @tc.name       : testToString0039
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0039';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 1, Infinity);
        expect(res.length).assertEqual(8);
        expect(res).assertEqual('ZWxsbw==');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_4000
     * @tc.name       : testToString0040
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0040';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 1, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_4100
     * @tc.name       : testToString0041
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0041';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 1, 1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_4200
     * @tc.name       : testToString0042
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0042';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, 0, undefined);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_4300
     * @tc.name       : testToString0043
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0043';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, 0, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_4400
     * @tc.name       : testToString0044
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0044';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, 0, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_4500
     * @tc.name       : testToString0045
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0045';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, 0, Infinity);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_4600
     * @tc.name       : testToString0046
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0046';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, 0, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_4700
     * @tc.name       : testToString0047
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0047';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, 0, 1);
        expect(res.length).assertEqual(1);
        expect(res).assertEqual('h');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_4800
     * @tc.name       : testToString0048
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0048';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, -1, undefined);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TO_STRING_4900
     * @tc.name       : testToString0049
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToString0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testToString0049';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, -1, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}