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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';

export default function TypedArrayTest() {
  describe('typedArrayTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0100
     * @tc.name       : testTypedArrayFrom0001
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0001', 0, () => {
      const TAG = "testTypedArrayFrom0001";
      try {
        let s = new Set([1, 2, 3]);
        let value = Uint8Array.from(s);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0200
     * @tc.name       : testTypedArrayFrom0002
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0002', 0, () => {
      const TAG = "testTypedArrayFrom0002";
      try {
        let s = new Set([1, 2, 3]);
        let value = Int8Array.from(s);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0300
     * @tc.name       : testTypedArrayFrom0003
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0003', 0, () => {
      const TAG = "testTypedArrayFrom0003";
      try {
        let s = new Set([1, 2, 3]);
        let value = Uint8ClampedArray.from(s);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0400
     * @tc.name       : testTypedArrayFrom0004
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0004', 0, () => {
      const TAG = "testTypedArrayFrom0004";
      try {
        let s = new Set([1, 2, 3]);
        let value = Int16Array.from(s);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0500
     * @tc.name       : testTypedArrayFrom0005
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0005', 0, () => {
      const TAG = "testTypedArrayFrom0005";
      try {
        let s = new Set([1, 2, 3]);
        let value = Uint16Array.from(s);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0600
     * @tc.name       : testTypedArrayFrom0006
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0006', 0, () => {
      const TAG = "testTypedArrayFrom0006";
      try {
        let s = new Set([1, 2, 3]);
        let value = Int32Array.from(s);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0700
     * @tc.name       : testTypedArrayFrom0007
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0007', 0, () => {
      const TAG = "testTypedArrayFrom0007";
      try {
        let s = new Set([1, 2, 3]);
        let value = Uint32Array.from(s);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0800
     * @tc.name       : testTypedArrayFrom0008
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0008', 0, () => {
      const TAG = "testTypedArrayFrom0008";
      try {
        let s = new Set([1, 2, 3]);
        let value = Float32Array.from(s);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_0900
     * @tc.name       : testTypedArrayFrom0009
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0009', 0, () => {
      const TAG = "testTypedArrayFrom0009";
      try {
        let s = new Set([1, 2, 3]);
        let value = Float64Array.from(s);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1000
     * @tc.name       : testTypedArrayFrom0010
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0010', 0, () => {
      const TAG = "testTypedArrayFrom0010";
      try {
        let s = new Set([1n, 2n, 3n]);
        let arr: Array<bigint> = Array.from(s);
        let value = BigInt64Array.from(arr);
        expect(value.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1100
     * @tc.name       : testTypedArrayFrom0011
     * @tc.desc       : Test the function of the interface TypedArray.from().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayFrom0011', 0, () => {
      const TAG = "testTypedArrayFrom0011";
      try {
        let s = new Set([1n, 2n, 3n]);
        let arr: Array<bigint> = Array.from(s);
        let value = BigUint64Array.from(arr);
        expect(value.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1200
     * @tc.name       : testTypedArrayOf0001
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0001', 0, () => {
      const TAG = "testTypedArrayOf0001";
      try {
        let value = Uint8Array.of(1, 2, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1300
     * @tc.name       : testTypedArrayOf0002
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0002', 0, () => {
      const TAG = "testTypedArrayOf0002";
      try {
        let value = Int8Array.of(1, 2, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1400
     * @tc.name       : testTypedArrayOf0003
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0003', 0, () => {
      const TAG = "testTypedArrayOf0003";
      try {
        let value = Uint8ClampedArray.of(1, 2, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1500
     * @tc.name       : testTypedArrayOf0004
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0004', 0, () => {
      const TAG = "testTypedArrayOf0004";
      try {
        let value = Int16Array.of(1, 2, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1600
     * @tc.name       : testTypedArrayOf0005
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0005', 0, () => {
      const TAG = "testTypedArrayOf0005";
      try {
        let value = Uint16Array.of(1, 2, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1700
     * @tc.name       : testTypedArrayOf0006
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0006', 0, () => {
      const TAG = "testTypedArrayOf0006";
      try {
        let value = Int32Array.of(1, 2, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1800
     * @tc.name       : testTypedArrayOf0007
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0007', 0, () => {
      const TAG = "testTypedArrayOf0007";
      try {
        let value = Uint32Array.of(1, 2, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_1900
     * @tc.name       : testTypedArrayOf0008
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0008', 0, () => {
      const TAG = "testTypedArrayOf0008";
      try {
        let value = Float32Array.of(1, 2, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2000
     * @tc.name       : testTypedArrayOf0009
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0009', 0, () => {
      const TAG = "testTypedArrayOf0009";
      try {
        let value = Float64Array.of(1, 2, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2100
     * @tc.name       : testTypedArrayOf0010
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0010', 0, () => {
      const TAG = "testTypedArrayOf0010";
      try {
        let value = BigInt64Array.of(1n, 2n, 3n);
        expect(value.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2200
     * @tc.name       : testTypedArrayOf0011
     * @tc.desc       : Test the function of the interface TypedArray.of().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayOf0011', 0, () => {
      const TAG = "testTypedArrayOf0011";
      try {
        let value = BigUint64Array.of(1n, 2n, 3n);
        expect(value.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2300
     * @tc.name       : testTypedArrayPrototypeCopyWithin0001
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0001', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0001";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, 2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2400
     * @tc.name       : testTypedArrayPrototypeCopyWithin0002
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0002', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0002";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, -2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2500
     * @tc.name       : testTypedArrayPrototypeCopyWithin0003
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0003', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0003";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(-1, -1);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2600
     * @tc.name       : testTypedArrayPrototypeCopyWithin0004
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0004', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0004";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(3, 0, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":1,"4":2,"5":3,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2700
     * @tc.name       : testTypedArrayPrototypeCopyWithin0005
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0005', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0005";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int8Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, 2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2800
     * @tc.name       : testTypedArrayPrototypeCopyWithin0006
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0006', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0006";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int8Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, -2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_2900
     * @tc.name       : testTypedArrayPrototypeCopyWithin0007
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0007', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0007";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int8Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(-1, -1);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3000
     * @tc.name       : testTypedArrayPrototypeCopyWithin0008
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0008', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0008";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int8Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(3, 0, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":1,"4":2,"5":3,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3100
     * @tc.name       : testTypedArrayPrototypeCopyWithin0009
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0009', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0009";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8ClampedArray(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, 2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3200
     * @tc.name       : testTypedArrayPrototypeCopyWithin0010
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0010', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0010";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8ClampedArray(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, -2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3300
     * @tc.name       : testTypedArrayPrototypeCopyWithin0011
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0011', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0011";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8ClampedArray(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(-1, -1);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3400
     * @tc.name       : testTypedArrayPrototypeCopyWithin0012
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0012', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0012";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8ClampedArray(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(3, 0, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":1,"4":2,"5":3,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3500
     * @tc.name       : testTypedArrayPrototypeCopyWithin0013
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0013', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0013";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int16Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, 2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3600
     * @tc.name       : testTypedArrayPrototypeCopyWithin0014
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0014', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0014";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int16Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, -2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3700
     * @tc.name       : testTypedArrayPrototypeCopyWithin0015
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0015', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0015";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int16Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(-1, -1);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3800
     * @tc.name       : testTypedArrayPrototypeCopyWithin0016
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0016', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0016";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int16Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(3, 0, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":1}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_3900
     * @tc.name       : testTypedArrayPrototypeCopyWithin0017
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0017', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0017";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint16Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, 2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4000
     * @tc.name       : testTypedArrayPrototypeCopyWithin0018
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0018', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0018";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint16Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, -2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4100
     * @tc.name       : testTypedArrayPrototypeCopyWithin0019
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0019', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0019";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint16Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(-1, -1);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4200
     * @tc.name       : testTypedArrayPrototypeCopyWithin0020
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0020', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0020";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint16Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(3, 0, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":1}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4300
     * @tc.name       : testTypedArrayPrototypeCopyWithin0021
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0021', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0021";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Int32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, 2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4400
     * @tc.name       : testTypedArrayPrototypeCopyWithin0022
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0022', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0022";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Int32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, -2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4500
     * @tc.name       : testTypedArrayPrototypeCopyWithin0023
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0023', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0023";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Int32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(-1, -1);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4600
     * @tc.name       : testTypedArrayPrototypeCopyWithin0024
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0024', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0024";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Int32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(3, 0, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":1,"4":2,"5":3,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4700
     * @tc.name       : testTypedArrayPrototypeCopyWithin0025
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0025', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0025";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Uint32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, 2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4800
     * @tc.name       : testTypedArrayPrototypeCopyWithin0026
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0026', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0026";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Uint32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, -2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_4900
     * @tc.name       : testTypedArrayPrototypeCopyWithin0027
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0027', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0027";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Uint32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(-1, -1);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5000
     * @tc.name       : testTypedArrayPrototypeCopyWithin0028
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0028', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0028";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Uint32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(3, 0, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":1,"4":2,"5":3,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5100
     * @tc.name       : testTypedArrayPrototypeCopyWithin0029
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0029', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0029";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Float32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, 2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5200
     * @tc.name       : testTypedArrayPrototypeCopyWithin0030
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0030', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0030";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Float32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, -2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5300
     * @tc.name       : testTypedArrayPrototypeCopyWithin0031
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0031', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0031";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Float32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(-1, -1);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5400
     * @tc.name       : testTypedArrayPrototypeCopyWithin0032
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0032', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0032";
      try {
        let buffer = new ArrayBuffer(32);
        let array = new Float32Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(3, 0, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":1,"4":2,"5":3,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5500
     * @tc.name       : testTypedArrayPrototypeCopyWithin0033
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0033', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0033";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new Float64Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, 2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":3,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5600
     * @tc.name       : testTypedArrayPrototypeCopyWithin0034
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0034', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0034";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new Float64Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(1, -2);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5700
     * @tc.name       : testTypedArrayPrototypeCopyWithin0035
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0035', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0035";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new Float64Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(-1, -1);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":0,"4":0,"5":0,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5800
     * @tc.name       : testTypedArrayPrototypeCopyWithin0036
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0036', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0036";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new Float64Array(buffer);
        array.set([1, 2, 3]);
        let value = array.copyWithin(3, 0, 3);
        expect(JSON.stringify(value)).assertEqual('{"0":1,"1":2,"2":3,"3":1,"4":2,"5":3,"6":0,"7":0}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_5900
     * @tc.name       : testTypedArrayPrototypeCopyWithin0037
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0037', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0037";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new BigInt64Array(buffer);
        array.set([1n, 2n, 3n]);
        let value = array.copyWithin(1, 2);
        expect(value.toString()).assertEqual('1,3,0,0,0,0,0,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6000
     * @tc.name       : testTypedArrayPrototypeCopyWithin0038
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0038', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0038";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new BigInt64Array(buffer);
        array.set([1n, 2n, 3n]);
        let value = array.copyWithin(1, -2);
        expect(value.toString()).assertEqual('1,0,0,0,0,0,0,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6100
     * @tc.name       : testTypedArrayPrototypeCopyWithin0039
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0039', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0039";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new BigInt64Array(buffer);
        array.set([1n, 2n, 3n]);
        let value = array.copyWithin(-1, -1);
        expect(value.toString()).assertEqual('1,2,3,0,0,0,0,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6200
     * @tc.name       : testTypedArrayPrototypeCopyWithin0040
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0040', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0040";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new BigInt64Array(buffer);
        array.set([1n, 2n, 3n]);
        let value = array.copyWithin(3, 0, 3);
        expect(value.toString()).assertEqual('1,2,3,1,2,3,0,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6300
     * @tc.name       : testTypedArrayPrototypeCopyWithin0041
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0041', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0041";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new BigUint64Array(buffer);
        array.set([1n, 2n, 3n]);
        let value = array.copyWithin(1, 2);
        expect(value.toString()).assertEqual('1,3,0,0,0,0,0,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6400
     * @tc.name       : testTypedArrayPrototypeCopyWithin0042
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0042', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0042";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new BigUint64Array(buffer);
        array.set([1n, 2n, 3n]);
        let value = array.copyWithin(1, -2);
        expect(value.toString()).assertEqual('1,0,0,0,0,0,0,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6500
     * @tc.name       : testTypedArrayPrototypeCopyWithin0043
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0043', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0043";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new BigUint64Array(buffer);
        array.set([1n, 2n, 3n]);
        let value = array.copyWithin(-1, -1);
        expect(value.toString()).assertEqual('1,2,3,0,0,0,0,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6600
     * @tc.name       : testTypedArrayPrototypeCopyWithin0044
     * @tc.desc       : Test the function of the interface TypedArray.prototype.copyWithin().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeCopyWithin0044', 0, () => {
      const TAG = "testTypedArrayPrototypeCopyWithin0044";
      try {
        let buffer = new ArrayBuffer(64);
        let array = new BigUint64Array(buffer);
        array.set([1n, 2n, 3n]);
        let value = array.copyWithin(3, 0, 3);
        expect(value.toString()).assertEqual('1,2,3,1,2,3,0,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6700
     * @tc.name       : testTypedArrayPrototypeEntries0001
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0001', 0, () => {
      const TAG = "testTypedArrayPrototypeEntries0001";
      try {
        let arr = new Uint8Array([10, 20, 30]);
        let eArr = arr.entries();
        expect(JSON.stringify(eArr.next().value)).assertEqual("[0,10]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[1,20]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[2,30]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6800
     * @tc.name       : testTypedArrayPrototypeEntries0002
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0002', 0, () => {
      const TAG = "testTypedArrayPrototypeEntries0002";
      try {
        let arr = new Int8Array([10, 20, 30]);
        let eArr = arr.entries();
        expect(JSON.stringify(eArr.next().value)).assertEqual("[0,10]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[1,20]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[2,30]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_6900
     * @tc.name       : testTypedArrayPrototypeEntries0003
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0003', 0, () => {
      const TAG = "testTypedArrayPrototypeEntries0003";
      try {
        let arr = new Uint8ClampedArray([10, 20, 30]);
        let eArr = arr.entries();
        expect(JSON.stringify(eArr.next().value)).assertEqual("[0,10]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[1,20]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[2,30]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7000
     * @tc.name       : testTypedArrayPrototypeEntries0004
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0004', 0, () => {
      const TAG = "testTypedArrayPrototypeEntries0004";
      try {
        let arr = new Int16Array([10, 20, 30]);
        let eArr = arr.entries();
        expect(JSON.stringify(eArr.next().value)).assertEqual("[0,10]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[1,20]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[2,30]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7100
     * @tc.name       : testTypedArrayPrototypeEntries0005
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0005', 0, () => {
      const TAG = "testTypedArrayPrototypeEntries0005";
      try {
        let arr = new Uint16Array([10, 20, 30]);
        let eArr = arr.entries();
        expect(JSON.stringify(eArr.next().value)).assertEqual("[0,10]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[1,20]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[2,30]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7200
     * @tc.name       : testTypedArrayPrototypeEntries0006
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0006', 0, () => {
      const TAG = "testTypedArrayPrototypeEntries0006";
      try {
        let arr = new Int32Array([10, 20, 30]);
        let eArr = arr.entries();
        expect(JSON.stringify(eArr.next().value)).assertEqual("[0,10]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[1,20]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[2,30]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7300
     * @tc.name       : testTypedArrayPrototypeEntries0007
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0007', 0, () => {
      const TAG = "testTypedArrayPrototypeEntries0007";
      try {
        let arr = new Uint32Array([10, 20, 30]);
        let eArr = arr.entries();
        expect(JSON.stringify(eArr.next().value)).assertEqual("[0,10]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[1,20]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[2,30]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7400
     * @tc.name       : testTypedArrayPrototypeEntries0008
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0008', 0, () => {
      const TAG = "testTypedArrayPrototypeEntries0008";
      try {
        let arr = new Float32Array([10, 20, 30]);
        let eArr = arr.entries();
        expect(JSON.stringify(eArr.next().value)).assertEqual("[0,10]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[1,20]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[2,30]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7500
     * @tc.name       : testTypedArrayPrototypeEntries0009
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0009', 0, () => {
      const TAG = "testTypedArrayPrototypeEntries0009";
      try {
        let arr = new Float64Array([10, 20, 30]);
        let eArr = arr.entries();
        expect(JSON.stringify(eArr.next().value)).assertEqual("[0,10]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[1,20]")
        expect(JSON.stringify(eArr.next().value)).assertEqual("[2,30]");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7600
     * @tc.name       : testTypedArrayPrototypeEntries0010
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0010', 0, () => {
      const TAG = "testTypedArrayPrototypeEntries0010";
      try {
        let arr = new BigInt64Array([10n, 20n, 30n]);
        let eArr = arr.entries();
        let arr1: bigint = eArr.next().value
        let arr2: bigint = eArr.next().value
        let arr3: bigint = eArr.next().value
        expect(arr1.toString()).assertEqual([0, 10n].toString())
        expect(arr2.toString()).assertEqual([1, 20n].toString())
        expect(arr3.toString()).assertEqual([2, 30n].toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7700
     * @tc.name       : testTypedArrayPrototypeEntries0011
     * @tc.desc       : Test the function of the interface TypedArray.prototype.entries().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeEntries0011', 0, () => {
      const TAG = "testTypedArrayPrototypeEntries0011";
      try {
        let arr = new BigUint64Array([10n, 20n, 30n]);
        let eArr = arr.entries();
        let arr1: bigint = eArr.next().value
        let arr2: bigint = eArr.next().value
        let arr3: bigint = eArr.next().value
        expect(arr1.toString()).assertEqual([0, 10n].toString())
        expect(arr2.toString()).assertEqual([1, 20n].toString())
        expect(arr3.toString()).assertEqual([2, 30n].toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7800
     * @tc.name       : testTypedArrayPrototypeFill0001
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0001', 0, () => {
      const TAG = "testTypedArrayPrototypeFill0001";
      try {
        let array = [1, 2, 3];
        let value = new Uint8Array(array).fill(4);
        expect(JSON.stringify(value)).assertEqual("{\"0\":4,\"1\":4,\"2\":4}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_7900
     * @tc.name       : testTypedArrayPrototypeFill0002
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0002', 0, () => {
      const TAG = "testTypedArrayPrototypeFill0002";
      try {
        let array = [1, 2, 3];
        let value = new Uint8Array(array).fill(4, 1);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":4,\"2\":4}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_8000
     * @tc.name       : testTypedArrayPrototypeFill0003
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0003', 0, () => {
      const TAG = "testTypedArrayPrototypeFill0003";
      try {
        let array = [1, 2, 3];
        let value = new Uint8Array(array).fill(4, 1, 2);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":4,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TYPED_ARRAY_8100
     * @tc.name       : testTypedArrayPrototypeFill0004
     * @tc.desc       : Test the function of the interface TypedArray.prototype.fill().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTypedArrayPrototypeFill0004', 0, () => {
      const TAG = "testTypedArrayPrototypeFill0004";
      try {
        let array = [1, 2, 3];
        let value = new Uint8Array(array).fill(4, 1, 1);
        expect(JSON.stringify(value)).assertEqual("{\"0\":1,\"1\":2,\"2\":3}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}