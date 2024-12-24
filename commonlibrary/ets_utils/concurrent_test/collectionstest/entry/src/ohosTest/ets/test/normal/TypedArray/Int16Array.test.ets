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
import { describe, it, expect } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';

export default function Int16ArrayTest() {
  describe('Int16ArrayTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_0100
     * @tc.name       : testInt16Array0001
     * @tc.desc       : Testing the iterative ability of Int16Array using a for loop.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0001', 0, () => {
      const TAG = "testInt16Array0001";
      try {
        let int16Array: collections.Int16Array = new collections.Int16Array(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        int16Array.set(expectedValues);
        for (let i = 0; i < int16Array.length; i++) {
          expect(int16Array[i]).assertEqual(expectedValues[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_0200
     * @tc.name       : testInt16Array0002
     * @tc.desc       : Testing the iterative ability of Int16Array using ... deconstruction.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0002', 0, () => {
      const TAG = "testInt16Array0002";
      try {
        let int16Array: collections.Int16Array = new collections.Int16Array(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        int16Array.set(expectedValues);
        const normalArray: number[] = [...int16Array];
        for (let i = 0; i < expectedValues.length; i++) {
          expect(normalArray[i]).assertEqual(expectedValues[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_0300
     * @tc.name       : testInt16Array0003
     * @tc.desc       : Testing create an empty ArkTS TypedArray object with Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0003', 0, () => {
      const TAG = "testInt16Array0003";
      try {
        let int16Array: collections.Int16Array = new collections.Int16Array();
        expect(int16Array instanceof collections.Int16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_0400
     * @tc.name       : testInt16Array0004
     * @tc.desc       : Testing ArrayLength constructs -1 parameter and checks the length.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0004', 0, () => {
      const TAG = "testInt16Array0004";
      try {
        let int16Array: collections.Int16Array = new collections.Int16Array(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('integerIndex < 0 or integerIndex > SAFE_NUMBER');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_0500
     * @tc.name       : testInt16Array0005
     * @tc.desc       : Testing ArrayLength constructs 0 parameter and checks the length.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0005', 0, () => {
      const TAG = "testInt16Array0005";
      try {
        let int16Array: collections.Int16Array = new collections.Int16Array(0);
        expect(int16Array.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_0600
     * @tc.name       : testInt16Array0006
     * @tc.desc       : Testing ArrayLength constructs 10 parameter and checks the length.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0006', 0, () => {
      const TAG = "testInt16Array0006";
      try {
        let int16Array: collections.Int16Array = new collections.Int16Array(10);
        expect(int16Array.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_0700
     * @tc.name       : testInt16Array0007
     * @tc.desc       : Testing ArrayLength constructs 100000 parameter and checks the length.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0007', 0, () => {
      const TAG = "testInt16Array0007";
      try {
        let int16Array: collections.Int16Array = new collections.Int16Array(100000);
        expect(int16Array.length).assertEqual(100000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_0800
     * @tc.name       : testInt16Array0008
     * @tc.desc       : Testing construct an object from an ArrayLike.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0008', 0, () => {
      const TAG = "testInt16Array0008";
      try {
        let arrayLike = [1, 3, 5];
        let array: collections.Int16Array = new collections.Int16Array(arrayLike);
        expect(array instanceof collections.Int16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_0900
     * @tc.name       : testInt16Array0009
     * @tc.desc       : Testing construct an object from an ArrayBuffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0009', 0, () => {
      const TAG = "testInt16Array0009";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
        let array: collections.Int16Array = new collections.Int16Array(arrayBuffer);
        expect(array instanceof collections.Int16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1000
     * @tc.name       : testInt16Array0010
     * @tc.desc       : Testing construct an object from another ArkTS TypedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0010', 0, () => {
      const TAG = "testInt16Array0010";
      try {
        let arrayLike = [1, 3, 5];
        let uint16Array: collections.Uint16Array = new collections.Uint16Array(arrayLike);
        let array: collections.Int16Array = new collections.Int16Array(uint16Array);
        expect(array instanceof collections.Int16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1100
     * @tc.name       : testInt16Array0011
     * @tc.desc       : Testing create an ArrayBuffer with an empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0011', 0, () => {
      const TAG = "testInt16Array0011";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([]);
        let array: collections.Int16Array = new collections.Int16Array(int32Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1200
     * @tc.name       : testInt16Array0012
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0012', 0, () => {
      const TAG = "testInt16Array0012";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int16Array = new collections.Int16Array(int32Array.buffer, -1, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('integerIndex < 0 or integerIndex > SAFE_NUMBER');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1300
     * @tc.name       : testInt16Array0013
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0013', 0, () => {
      const TAG = "testInt16Array0013";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int16Array = new collections.Int16Array(int32Array.buffer, -1, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('integerIndex < 0 or integerIndex > SAFE_NUMBER');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1400
     * @tc.name       : testInt16Array0014
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0014', 0, () => {
      const TAG = "testInt16Array0014";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int16Array = new collections.Int16Array(int32Array.buffer, -1, 2);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('integerIndex < 0 or integerIndex > SAFE_NUMBER');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1500
     * @tc.name       : testInt16Array0015
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0015', 0, () => {
      const TAG = "testInt16Array0015";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int16Array = new collections.Int16Array(int16Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1600
     * @tc.name       : testInt16Array0016
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0016', 0, () => {
      const TAG = "testInt16Array0016";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int16Array = new collections.Int16Array(int16Array.buffer, 0, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('integerIndex < 0 or integerIndex > SAFE_NUMBER');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1700
     * @tc.name       : testInt16Array0017
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0017', 0, () => {
      const TAG = "testInt16Array0017";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int16Array = new collections.Int16Array(int16Array.buffer, 0, 2);
        expect(array.toString()).assertEqual('1,2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1800
     * @tc.name       : testInt16Array0018
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0018', 0, () => {
      const TAG = "testInt16Array0018";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int16Array = new collections.Int16Array(int16Array.buffer, 2, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1900
     * @tc.name       : testInt16Array0019
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0019', 0, () => {
      const TAG = "testInt16Array0019";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int16Array = new collections.Int16Array(int16Array.buffer, 2, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('integerIndex < 0 or integerIndex > SAFE_NUMBER');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2000
     * @tc.name       : testInt16Array0020
     * @tc.desc       : Testing create an ArrayBuffer with a not empty buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0020', 0, () => {
      const TAG = "testInt16Array0020";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int16Array = new collections.Int16Array(int16Array.buffer, 2, 2);
        expect(array.toString()).assertEqual('2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2100
     * @tc.name       : testInt16Array0021
     * @tc.desc       : Testing the 'from' interface with an array-like structure [1, 3, 5].
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0021', 0, () => {
      const TAG = "testInt16Array0021";
      try {
        let arrayLike = [1, 3, 5];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2200
     * @tc.name       : testInt16Array0022
     * @tc.desc       : Testing the 'from' interface with an array-like structure [].
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0022', 0, () => {
      const TAG = "testInt16Array0022";
      try {
        let arrayLike = [];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2300
     * @tc.name       : testInt16Array0023
     * @tc.desc       : Testing the array-like map function created from an object.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0023', 0, () => {
      const TAG = "testInt16Array0023";
      try {
        let array: collections.Int16Array = collections.Int16Array.from<number>(
          {
            length: 5
          }, (v: Object, k: number) => k);
        expect(array.toString()).assertEqual('0,1,2,3,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2400
     * @tc.name       : testInt16Array0024
     * @tc.desc       : Testing the array-like map function created from a character array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0024', 0, () => {
      const TAG = "testInt16Array0024";
      try {
        let array: Int16Array = Int16Array.from<string>(
          ["1", "3", "5"], (v: string, k: number) => parseInt(v));
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2500
     * @tc.name       : testInt16Array0025
     * @tc.desc       : Testing the array-like map function created from a string.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0025', 0, () => {
      const TAG = "testInt16Array0025";
      try {
        let array: Int16Array = Int16Array.from<string>(
          "12345", (v: string, k: number) => parseInt(v));
        expect(array.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2600
     * @tc.name       : testInt16Array0026
     * @tc.desc       : Testing the array-like map function created from a num array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0026', 0, () => {
      const TAG = "testInt16Array0026";
      try {
        let array: collections.Int16Array = collections.Int16Array.from<number>(
          [1, 3, 5], (v: number, k: number) => v
        );
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2700
     * @tc.name       : testInt16Array0027
     * @tc.desc       : Testing the array-like map function created from a nesting array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0027', 0, () => {
      const TAG = "testInt16Array0027";
      try {
        let nestedArray: number[][] = [[1, 2], [3, 4], [5, 6]];
        let array: collections.Int16Array = collections.Int16Array.from<number>(
          ([] as number[]).concat(...nestedArray),
          (v: number) => v
        );
        expect(array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2800
     * @tc.name       : testInt16Array0028
     * @tc.desc       : Testing the array-like map function without specifying a mapping function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0028', 0, () => {
      const TAG = "testInt16Array0028";
      try {
        let set: Set<number> = new Set<number>([1, 2, 3]);
        let array: collections.Int16Array = collections.Int16Array.from(set);
        expect(array.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2900
     * @tc.name       : testInt16Array0029
     * @tc.desc       : Testing the array-like map function with specifying a mapping function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0029', 0, () => {
      const TAG = "testInt16Array0029";
      try {
        let set: Set<number> = new Set<number>([1, 2, 3]);
        let array: collections.Int16Array = collections.Int16Array.from(
          set, (v: number, k: number) => v + k);
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3000
     * @tc.name       : testInt16Array0030
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0030', 0, () => {
      const TAG = "testInt16Array0030";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(3, 1, 3);
        expect(copied.toString()).assertEqual('1,2,3,2,3,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3100
     * @tc.name       : testInt16Array0031
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0031', 0, () => {
      const TAG = "testInt16Array0031";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3200
     * @tc.name       : testInt16Array0032
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0032', 0, () => {
      const TAG = "testInt16Array0032";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, 0, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3300
     * @tc.name       : testInt16Array0033
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0033', 0, () => {
      const TAG = "testInt16Array0033";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3400
     * @tc.name       : testInt16Array0034
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0034', 0, () => {
      const TAG = "testInt16Array0034";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, 0, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3500
     * @tc.name       : testInt16Array0035
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0035', 0, () => {
      const TAG = "testInt16Array0035";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, 0, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3600
     * @tc.name       : testInt16Array0036
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0036', 0, () => {
      const TAG = "testInt16Array0036";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, 2, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3700
     * @tc.name       : testInt16Array0037
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0037', 0, () => {
      const TAG = "testInt16Array0037";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3800
     * @tc.name       : testInt16Array0038
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0038', 0, () => {
      const TAG = "testInt16Array0038";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3900
     * @tc.name       : testInt16Array0039
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0039', 0, () => {
      const TAG = "testInt16Array0039";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, 2, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4000
     * @tc.name       : testInt16Array0040
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0040', 0, () => {
      const TAG = "testInt16Array0040";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4100
     * @tc.name       : testInt16Array0041
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0041', 0, () => {
      const TAG = "testInt16Array0041";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(0, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4200
     * @tc.name       : testInt16Array0042
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0042', 0, () => {
      const TAG = "testInt16Array0042";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(0, 0, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4300
     * @tc.name       : testInt16Array0043
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0043', 0, () => {
      const TAG = "testInt16Array0043";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(0, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4400
     * @tc.name       : testInt16Array0044
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0044', 0, () => {
      const TAG = "testInt16Array0044";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(0, 0, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4500
     * @tc.name       : testInt16Array0045
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0045', 0, () => {
      const TAG = "testInt16Array0045";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(0, 0, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4600
     * @tc.name       : testInt16Array0046
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0046', 0, () => {
      const TAG = "testInt16Array0046";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(0, 2, -1);
        expect(copied.toString()).assertEqual('3,4,5,6,7,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4700
     * @tc.name       : testInt16Array0047
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0047', 0, () => {
      const TAG = "testInt16Array0047";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(0, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4800
     * @tc.name       : testInt16Array0048
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0048', 0, () => {
      const TAG = "testInt16Array0048";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(0, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4900
     * @tc.name       : testInt16Array0049
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0049', 0, () => {
      const TAG = "testInt16Array0049";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(0, 2, 10);
        expect(copied.toString()).assertEqual('3,4,5,6,7,8,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5000
     * @tc.name       : testInt16Array0050
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0050', 0, () => {
      const TAG = "testInt16Array0050";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5100
     * @tc.name       : testInt16Array0051
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0051', 0, () => {
      const TAG = "testInt16Array0051";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5200
     * @tc.name       : testInt16Array0052
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0052', 0, () => {
      const TAG = "testInt16Array0052";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 0, -1);
        expect(copied.toString()).assertEqual('1,2,1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5300
     * @tc.name       : testInt16Array0053
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0053', 0, () => {
      const TAG = "testInt16Array0053";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5400
     * @tc.name       : testInt16Array0054
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0054', 0, () => {
      const TAG = "testInt16Array0054";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 0, 2);
        expect(copied.toString()).assertEqual('1,2,1,2,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5500
     * @tc.name       : testInt16Array0055
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0055', 0, () => {
      const TAG = "testInt16Array0055";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 0, 10);
        expect(copied.toString()).assertEqual('1,2,1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5600
     * @tc.name       : testInt16Array0056
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0056', 0, () => {
      const TAG = "testInt16Array0056";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 2, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5700
     * @tc.name       : testInt16Array0057
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0057', 0, () => {
      const TAG = "testInt16Array0057";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5800
     * @tc.name       : testInt16Array0058
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0058', 0, () => {
      const TAG = "testInt16Array0058";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5900
     * @tc.name       : testInt16Array0059
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0059', 0, () => {
      const TAG = "testInt16Array0059";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 2, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6000
     * @tc.name       : testInt16Array0060
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0060', 0, () => {
      const TAG = "testInt16Array0060";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6100
     * @tc.name       : testInt16Array0061
     * @tc.desc       : Testing the copyWithin function to copy part of the array within itself.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0061', 0, () => {
      const TAG = "testInt16Array0061";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(10, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6200
     * @tc.name       : testInt16Array0062
     * @tc.desc       : Testing whether it returns true when there are elements that meet the specified conditions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0062', 0, () => {
      const TAG = "testInt16Array0062";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike);
        expect(int16Array.some((element: number) => element < 0)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6300
     * @tc.name       : testInt16Array0063
     * @tc.desc       : Testing whether it returns false when no elements meet the specified conditions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0063', 0, () => {
      const TAG = "testInt16Array0063";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike);
        expect(int16Array.some((element: number) => element == 0)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6400
     * @tc.name       : testInt16Array0064
     * @tc.desc       : Testing whether it returns true when all elements that meet the specified conditions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0064', 0, () => {
      const TAG = "testInt16Array0064";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike);
        expect(int16Array.some((element: number) => element < 100)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6500
     * @tc.name       : testInt16Array0065
     * @tc.desc       : Testing whether it returns true when all elements meet the specified conditions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0065', 0, () => {
      const TAG = "testInt16Array0065";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike);
        expect(int16Array.every((element: number) => element < 100)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6600
     * @tc.name       : testInt16Array0066
     * @tc.desc       : Testing whether it returns false when not all elements meet the specified conditions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0066', 0, () => {
      const TAG = "testInt16Array0066";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike);
        expect(int16Array.every((element: number) => element < 20)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6700
     * @tc.name       : testInt16Array0067
     * @tc.desc       : Testing whether it returns false when no elements meet the specified conditions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0067', 0, () => {
      const TAG = "testInt16Array0067";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike);
        expect(int16Array.every((element: number) => element > 50)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6800
     * @tc.name       : testInt16Array0068
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0068', 0, () => {
      const TAG = "testInt16Array0068";
      try {
        let arrayLike = [1, 2, 3];
        let int16Array1: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4);
        let int16Array2: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 1);
        let int16Array3: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 1, 2);
        expect(int16Array1.toString()).assertEqual('4,4,4');
        expect(int16Array2.toString()).assertEqual('1,4,4');
        expect(int16Array3.toString()).assertEqual('1,4,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6900
     * @tc.name       : testInt16Array0069
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0069', 0, () => {
      const TAG = "testInt16Array0069";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, -1, -1);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7000
     * @tc.name       : testInt16Array0070
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0070', 0, () => {
      const TAG = "testInt16Array0070";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, -1, 0);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7100
     * @tc.name       : testInt16Array0071
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0071', 0, () => {
      const TAG = "testInt16Array0071";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, -1, 2);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7200
     * @tc.name       : testInt16Array0072
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0072', 0, () => {
      const TAG = "testInt16Array0072";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, -1, 10);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7300
     * @tc.name       : testInt16Array0073
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0073', 0, () => {
      const TAG = "testInt16Array0073";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 0, -1);
        expect(int16Array.toString()).assertEqual('4,4,4,4,4,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7400
     * @tc.name       : testInt16Array0074
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0074', 0, () => {
      const TAG = "testInt16Array0074";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 0, 0);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7500
     * @tc.name       : testInt16Array0075
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0075', 0, () => {
      const TAG = "testInt16Array0075";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 0, 2);
        expect(int16Array.toString()).assertEqual('4,4,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7600
     * @tc.name       : testInt16Array0076
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0076', 0, () => {
      const TAG = "testInt16Array0076";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 0, 10);
        expect(int16Array.toString()).assertEqual('4,4,4,4,4,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7700
     * @tc.name       : testInt16Array0077
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0077', 0, () => {
      const TAG = "testInt16Array0077";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 2, -1);
        expect(int16Array.toString()).assertEqual('1,2,4,4,4,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7800
     * @tc.name       : testInt16Array0078
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0078', 0, () => {
      const TAG = "testInt16Array0078";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 2, 0);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7900
     * @tc.name       : testInt16Array0079
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0079', 0, () => {
      const TAG = "testInt16Array0079";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 2, 2);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8000
     * @tc.name       : testInt16Array0080
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0080', 0, () => {
      const TAG = "testInt16Array0080";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 2, 10);
        expect(int16Array.toString()).assertEqual('1,2,4,4,4,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8100
     * @tc.name       : testInt16Array0081
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0081', 0, () => {
      const TAG = "testInt16Array0081";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 10, -1);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8200
     * @tc.name       : testInt16Array0082
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0082', 0, () => {
      const TAG = "testInt16Array0082";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 10, 0);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8300
     * @tc.name       : testInt16Array0083
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0083', 0, () => {
      const TAG = "testInt16Array0083";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 10, 2);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8400
     * @tc.name       : testInt16Array0084
     * @tc.desc       : Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0084', 0, () => {
      const TAG = "testInt16Array0084";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 10, 10);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8500
     * @tc.name       : testInt16Array0085
     * @tc.desc       : Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0085', 0, () => {
      const TAG = "testInt16Array0085";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let filtered: collections.Int16Array = array.filter((element: number) => element % 2 == 0);
        expect(filtered.toString()).assertEqual('0,2,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8600
     * @tc.name       : testInt16Array0086
     * @tc.desc       : Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0086', 0, () => {
      const TAG = "testInt16Array0086";
      try {
        let arrayLike = [];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let filtered: collections.Int16Array = array.filter((element: number) => element % 2 == 0);
        expect(filtered.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8700
     * @tc.name       : testInt16Array0087
     * @tc.desc       : Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0087', 0, () => {
      const TAG = "testInt16Array0087";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let filtered1: collections.Int16Array = array.filter((element: number) => element > 4);
        expect(filtered1.length).assertEqual(0);
        array.set([5, 6], 2);
        let filtered2: collections.Int16Array = array.filter((element: number) => element > 4);
        expect(filtered2.toString()).assertEqual('5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8800
     * @tc.name       : testInt16Array0088
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0088', 0, () => {
      const TAG = "testInt16Array0088";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let res = array.find((element: number) => element > 2);
        expect(res).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8900
     * @tc.name       : testInt16Array0089
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0089', 0, () => {
      const TAG = "testInt16Array0089";
      try {
        let arrayLike = [];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let res = array.find((element: number) => element > 2);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9000
     * @tc.name       : testInt16Array0090
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0090', 0, () => {
      const TAG = "testInt16Array0090";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let res1 = array.find((element: number) => element > 4);
        expect(res1).assertEqual(undefined);
        array.set([5, 6], 2);
        let res2 = array.find((element: number) => element > 4);
        expect(res2).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9100
     * @tc.name       : testInt16Array0091
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0091', 0, () => {
      const TAG = "testInt16Array0091";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let res = array.find((index: number) => index == -1);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9200
     * @tc.name       : testInt16Array0092
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0092', 0, () => {
      const TAG = "testInt16Array0092";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let res = array.find((element: number) => element == 0);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9300
     * @tc.name       : testInt16Array0093
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0093', 0, () => {
      const TAG = "testInt16Array0093";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let res = array.find((element: number) => element == 10);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9400
     * @tc.name       : testInt16Array0094
     * @tc.desc       : Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0094', 0, () => {
      const TAG = "testInt16Array0094";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let condition = (element: number) => element > 0;
        let res = array.find(condition);
        let filtered: collections.Int16Array = array.filter(condition);
        expect(res).assertEqual(filtered[0]);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9500
     * @tc.name       : testInt16Array0095
     * @tc.desc       : Testing if findIndex returns the first element index that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0095', 0, () => {
      const TAG = "testInt16Array0095";
      try {
        const array: collections.Int16Array = collections.Int16Array.from([]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9600
     * @tc.name       : testInt16Array0096
     * @tc.desc       : Testing if findIndex returns the first element index that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0096', 0, () => {
      const TAG = "testInt16Array0096";
      try {
        const array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9700
     * @tc.name       : testInt16Array0097
     * @tc.desc       : Testing if findIndex returns the first element index that meet the criteria.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0097', 0, () => {
      const TAG = "testInt16Array0097";
      try {
        const array: collections.Int16Array = collections.Int16Array.from([1, 3, 5]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9800
     * @tc.name       : testInt16Array0098
     * @tc.desc       : Testing if forEach executes the provided callback function for each element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0098', 0, () => {
      const TAG = "testInt16Array0098";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([]);
        let res = false;
        int16Array.forEach((value: number, index: number, array: collections.Int16Array) => {
          console.info(`Element ${value} at index ${index} in array ${array}`);
          res = true;
        });
        expect(int16Array.length).assertEqual(0);
        expect(res).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9900
     * @tc.name       : testInt16Array0099
     * @tc.desc       : Testing if forEach executes the provided callback function for each element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0099', 0, () => {
      const TAG = "testInt16Array0099";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([1, 2, 3]);
        let res = false;
        int16Array.forEach((value: number, index: number, array: collections.Int16Array) => {
          console.info(`Element ${value} at index ${index} in array ${array}`);
          expect(array.toString()).assertEqual('1,2,3');
          expect(array.length).assertEqual(3);
          res = true;
        });
        expect(res).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10000
     * @tc.name       : testInt16Array0100
     * @tc.desc       : Testing if forEach executes the provided callback function for each element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0100', 0, () => {
      const TAG = "testInt16Array0100";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        int16Array.set([5, 6], 2);
        let res = false;
        int16Array.forEach((value: number, index: number, array: collections.Int16Array) => {
          console.info(`Element ${value} at index ${index} in array ${array}`);
          expect(array.toString()).assertEqual('1,2,5,6,5');
          expect(array.length).assertEqual(5);
          res = true;
        });
        expect(res).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10100
     * @tc.name       : testInt16Array0101
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0101', 0, () => {
      const TAG = "testInt16Array0101";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([]);
        let res = array.indexOf(3);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10200
     * @tc.name       : testInt16Array0102
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0102', 0, () => {
      const TAG = "testInt16Array0102";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3]);
        let res = array.indexOf(4);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10300
     * @tc.name       : testInt16Array0103
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0103', 0, () => {
      const TAG = "testInt16Array0103";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3]);
        array.set([4, 5], 1);
        let res = array.indexOf(4);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10400
     * @tc.name       : testInt16Array0104
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0104', 0, () => {
      const TAG = "testInt16Array0104";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, -1);
        expect(res).assertEqual(array.length - 1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10500
     * @tc.name       : testInt16Array0105
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0105', 0, () => {
      const TAG = "testInt16Array0105";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, 5);
        expect(res).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10600
     * @tc.name       : testInt16Array0106
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0106', 0, () => {
      const TAG = "testInt16Array0106";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3);
        expect(res).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10700
     * @tc.name       : testInt16Array0107
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0107', 0, () => {
      const TAG = "testInt16Array0107";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, 3);
        expect(res).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10800
     * @tc.name       : testInt16Array0108
     * @tc.desc       : Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0108', 0, () => {
      const TAG = "testInt16Array0108";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, 9);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10900
     * @tc.name       : testInt16Array0109
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0109', 0, () => {
      const TAG = "testInt16Array0109";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([]);
        let joined: string = array.join('');
        expect(joined).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11000
     * @tc.name       : testInt16Array0110
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0110', 0, () => {
      const TAG = "testInt16Array0110";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([]);
        let joined: string = array.join('-');
        expect(joined).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11100
     * @tc.name       : testInt16Array0111
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0111', 0, () => {
      const TAG = "testInt16Array0111";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join();
        expect(joined).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11200
     * @tc.name       : testInt16Array0112
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0112', 0, () => {
      const TAG = "testInt16Array0112";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join('');
        expect(joined).assertEqual("12345");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11300
     * @tc.name       : testInt16Array0113
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0113', 0, () => {
      const TAG = "testInt16Array0113";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join(undefined);
        expect(joined).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11400
     * @tc.name       : testInt16Array0114
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0114', 0, () => {
      const TAG = "testInt16Array0114";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join("/");
        expect(joined).assertEqual("1/2/3/4/5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11500
     * @tc.name       : testInt16Array0115
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0115', 0, () => {
      const TAG = "testInt16Array0115";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join(",。\￥·");
        expect(joined).assertEqual("1,。￥·2,。￥·3,。￥·4,。￥·5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11600
     * @tc.name       : testInt16Array0116
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0116', 0, () => {
      const TAG = "testInt16Array0116";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join("녕하こんйте");
        expect(joined).assertEqual("1녕하こんйте2녕하こんйте3녕하こんйте4녕하こんйте5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11700
     * @tc.name       : testInt16Array0117
     * @tc.desc       : Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0117', 0, () => {
      const TAG = "testInt16Array0117";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join("，");
        expect(joined).assertEqual("1，2，3，4，5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11800
     * @tc.name       : testInt16Array0118
     * @tc.desc       : Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0118', 0, () => {
      const TAG = "testInt16Array0118";
      try {
        let array: collections.Int16Array = new collections.Int16Array([]);
        const mapped = array.map(Math.sqrt);
        expect(mapped.toString()).assertEqual("");
        expect(mapped.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11900
     * @tc.name       : testInt16Array0119
     * @tc.desc       : Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0119', 0, () => {
      const TAG = "testInt16Array0119";
      try {
        let array: collections.Int16Array = new collections.Int16Array([25, 36, 49]);
        const mapped = array.map(Math.sqrt);
        expect(mapped.toString()).assertEqual("5,6,7");
        expect(mapped.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_12000
     * @tc.name       : testInt16Array0120
     * @tc.desc       : Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0120', 0, () => {
      const TAG = "testInt16Array0120";
      try {
        let array: collections.Int16Array = new collections.Int16Array([25, 36, 49, 100, 256]);
        array.set([81, 64], 2);
        const mapped = array.map(Math.sqrt);
        expect(mapped.toString()).assertEqual("5,6,9,8,16");
        expect(mapped.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_12100
     * @tc.name       : testInt16Array0121
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0121', 0, () => {
      const TAG = "testInt16Array0121";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([]);
        array.reduce((accumulator: number, value: number) => accumulator + value);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('out of range.');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_12200
     * @tc.name       : testInt16Array0122
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0122', 0, () => {
      const TAG = "testInt16Array0122";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let expectedValues: number[] = [1, 3, 6, 10, 15];
        let reducedValue: number = array.reduce((accumulator: number, value: number, index: number) => {
          let newAccumulator = accumulator + value;
          expect(newAccumulator).assertEqual(expectedValues[index]);
          return newAccumulator;
        });
        expect(reducedValue).assertEqual(15);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_12300
     * @tc.name       : testInt16Array0123
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0123', 0, () => {
      const TAG = "testInt16Array0123";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        const initialAccumulator = 8;
        const expectedValues: number[] = [9, 11, 14, 18, 23];
        let reducedValue: number = array.reduce((accumulator: number, value: number, index: number) => {
          const newAccumulator = accumulator + value;
          expect(newAccumulator).assertEqual(expectedValues[index]);
          return newAccumulator;
        }, initialAccumulator);
        expect(reducedValue).assertEqual(23);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_12400
     * @tc.name       : testInt16Array0124
     * @tc.desc       : Testing a reduction function on each element and returning the final result.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0124', 0, () => {
      const TAG = "testInt16Array0124";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let initialValue = "initialValue";
        let reducedValue: string = array.reduce<string>((accumulator: string, value: number) =>
        accumulator + value, initialValue);
        expect(reducedValue).assertEqual('initialValue12345');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_12500
     * @tc.name       : testInt16Array0125
     * @tc.desc       : Testing reverse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0125', 0, () => {
      const TAG = "testInt16Array0125";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([]);
        let reversed: collections.Int16Array = array.reverse();
        expect(reversed.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_12600
     * @tc.name       : testInt16Array0126
     * @tc.desc       : Testing reverse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0126', 0, () => {
      const TAG = "testInt16Array0126";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let reversed: collections.Int16Array = array.reverse();
        expect(reversed.toString()).assertEqual('5,4,3,2,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_12700
     * @tc.name       : testInt16Array0127
     * @tc.desc       : Testing reverse.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0127', 0, () => {
      const TAG = "testInt16Array0127";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let reversed: collections.Int16Array = array.reverse();
        const expectedValues = [5, 4, 3, 2, 1];
        let res = false;
        reversed.forEach((value, index) => {
          expect(value).assertEqual(expectedValues[index]);
          res = true;
        });
        expect(res).assertEqual(true);
        expect(reversed.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_12800
     * @tc.name       : testInt16Array0128
     * @tc.desc       : Testing the set of int16Array, offset is null
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0128', 0, () => {
      const TAG = "testInt16Array0128";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(16);
        let arrList: collections.Int16Array = new collections.Int16Array(buf);
        arrList.set([1, 3, 5]);
        expect(arrList.toString()).assertEqual("1,3,5,0,0,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_12900
     * @tc.name       : testInt16Array0129
     * @tc.desc       : Testing the set of int16Array, offset is null, forEach succeed.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0129', 0, () => {
      const TAG = "testInt16Array0129";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(16);
        let arrList: collections.Int16Array = new collections.Int16Array(buf);
        arrList.set([1, 3, 5]);
        let rst: boolean = false;
        arrList.forEach((value: number, index: number, array: collections.Int16Array) => {
          console.info(`Element ${value}} at index ${index} in array ${array}`);
          expect(array.toString()).assertEqual("1,3,5,0,0,0,0,0");
          rst = true;
        });
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_13000
     * @tc.name       : testInt16Array0130
     * @tc.desc       : Testing the set of int16Array, offset is -1, return failed.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0130', 0, () => {
      const TAG = "testInt16Array0130";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(16);
        let arrList: collections.Int16Array = new collections.Int16Array(buf);
        arrList.set([1, 3, 5], -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The targetOffset of This value is less than 0.");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_13100
     * @tc.name       : testInt16Array0131
     * @tc.desc       : Testing the set of int16Array, offset is 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0131', 0, () => {
      const TAG = "testInt16Array0131";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(16);
        let arrList: collections.Int16Array = new collections.Int16Array(buf);
        arrList.set([1, 3, 5], 0);
        expect(arrList.toString()).assertEqual("1,3,5,0,0,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_13200
     * @tc.name       : testInt16Array0132
     * @tc.desc       : Testing the set of int16Array, offset is 0, forEach succeed.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0132', 0, () => {
      const TAG = "testInt16Array0132";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(16);
        let arrList: collections.Int16Array = new collections.Int16Array(buf);
        arrList.set([1, 3, 5], 0);
        let rst: boolean = false;
        arrList.forEach((value: number, index: number, array: collections.Int16Array) => {
          console.info(`Element ${value}} at index ${index} in array ${array}`);
          expect(array.toString()).assertEqual("1,3,5,0,0,0,0,0");
          rst = true;
        });
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_13300
     * @tc.name       : testInt16Array0133
     * @tc.desc       : Testing the set of int16Array, offset is 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0133', 0, () => {
      const TAG = "testInt16Array0133";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(16);
        let arrList: collections.Int16Array = new collections.Int16Array(buf);
        arrList.set([1, 3, 5], 2);
        expect(arrList.toString()).assertEqual("0,0,1,3,5,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_13400
     * @tc.name       : testInt16Array0134
     * @tc.desc       : Testing the set of int16Array, offset is 2, forEach succeed.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0134', 0, () => {
      const TAG = "testInt16Array0134";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(16);
        let arrList: collections.Int16Array = new collections.Int16Array(buf);
        arrList.set([1, 3, 5], 2);
        let rst: boolean = false;
        arrList.forEach((value: number, index: number, array: collections.Int16Array) => {
          console.info(`Element ${value}} at index ${index} in array ${array}`);
          expect(array.toString()).assertEqual("0,0,1,3,5,0,0,0");
          rst = true;
        });
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_13500
     * @tc.name       : testInt16Array0135
     * @tc.desc       : Testing the set of int16Array, offset is 10(overstep), return failed.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0135', 0, () => {
      const TAG = "testInt16Array0135";
      try {
        let buf: collections.ArrayBuffer = new collections.ArrayBuffer(16);
        let arrList: collections.Int16Array = new collections.Int16Array(buf);
        arrList.set([1, 3, 5], 10);
        expect(arrList.toString()).assertEqual("0,0,1,3,5,0,0,0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("The sum of length and targetOffset is greater than targetLength.");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_13600
     * @tc.name       : testInt16Array0136
     * @tc.desc       : Testing the Slice of int16Array, array is null, start is 1, end is 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0136', 0, () => {
      const TAG = "testInt16Array0136";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array();
        let arrListNew = arrList.slice(1, 3);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_13700
     * @tc.name       : testInt16Array0137
     * @tc.desc       : Testing the Slice of int16Array, array is null, parameter is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0137', 0, () => {
      const TAG = "testInt16Array0137";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array();
        let arrListNew = arrList.slice();
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_13800
     * @tc.name       : testInt16Array0138
     * @tc.desc       : Testing the Slice of int16Array, array is not null, parameter is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0138', 0, () => {
      const TAG = "testInt16Array0138";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice();
        expect(arrListNew.toString()).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_13900
     * @tc.name       : testInt16Array0139
     * @tc.desc       : Testing the Slice of int16Array, array is not null, parameter is undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0139', 0, () => {
      const TAG = "testInt16Array0139";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(undefined, undefined);
        expect(arrListNew.toString()).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_14000
     * @tc.name       : testInt16Array0140
     * @tc.desc       : Testing the Slice of int16Array, array is not null, parameter is -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0140', 0, () => {
      const TAG = "testInt16Array0140";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(-1);
        expect(arrListNew.toString()).assertEqual("5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_14100
     * @tc.name       : testInt16Array0141
     * @tc.desc       : Testing the Slice of int16Array, array is not null, start is -1, end is -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0141', 0, () => {
      const TAG = "testInt16Array0141";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(-1, -1);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_14200
     * @tc.name       : testInt16Array0142
     * @tc.desc       : Testing the Slice of int16Array, array is not null, start is -1, end is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0142', 0, () => {
      const TAG = "testInt16Array0142";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(-1, 0);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_14300
     * @tc.name       : testInt16Array0143
     * @tc.desc       : Testing the Slice of int16Array, array is not null, start is 0, end is -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0143', 0, () => {
      const TAG = "testInt16Array0143";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(0, -1);
        expect(arrListNew.toString()).assertEqual("1,2,3,4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_14400
     * @tc.name       : testInt16Array0144
     * @tc.desc       : Testing the Slice of int16Array, array is not null, parameter is 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0144', 0, () => {
      const TAG = "testInt16Array0144";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(2);
        expect(arrListNew.toString()).assertEqual("3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_14500
     * @tc.name       : testInt16Array0145
     * @tc.desc       : Testing the Slice of int16Array, array is not null, parameter is 10(overstep).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0145', 0, () => {
      const TAG = "testInt16Array0145";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(10);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_14600
     * @tc.name       : testInt16Array0146
     * @tc.desc       : Testing the Slice of int16Array, array is not null, start is 2, end is 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0146', 0, () => {
      const TAG = "testInt16Array0146";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(2, 2);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_14700
     * @tc.name       : testInt16Array0147
     * @tc.desc       : Testing the Slice of int16Array, array is not null, start is 2, end is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0147', 0, () => {
      const TAG = "testInt16Array0147";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(2, 0);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_14800
     * @tc.name       : testInt16Array0148
     * @tc.desc       : Testing the Slice of int16Array, array is not null, start is 2, end is 4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0148', 0, () => {
      const TAG = "testInt16Array0148";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 2, 3, 4, 5]);
        let arrListNew = arrList.slice(2, 4);
        expect(arrListNew.toString()).assertEqual("3,4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_14900
     * @tc.name       : testInt16Array0149
     * @tc.desc       : Testing the sort of int16Array, array is null, parameter is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0149', 0, () => {
      const TAG = "testInt16Array0149";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array();
        let arrListNew = arrList.sort();
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_15000
     * @tc.name       : testInt16Array0150
     * @tc.desc       : Testing the sort of int16Array, array is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0150', 0, () => {
      const TAG = "testInt16Array0150";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array();
        let arrListNew = arrList.sort((a: number, b: number) => a - b);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_15100
     * @tc.name       : testInt16Array0151
     * @tc.desc       : Testing the sort of int16Array, array is not null, parameter is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0151', 0, () => {
      const TAG = "testInt16Array0151";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([5, 2, 3, 4, 1]);
        let arrListNew = arrList.sort();
        expect(arrListNew.toString()).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_15200
     * @tc.name       : testInt16Array0152
     * @tc.desc       : Testing the sort of int16Array, array is not null, parameter is undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0152', 0, () => {
      const TAG = "testInt16Array0152";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([5, 2, 3, 4, 1]);
        let arrListNew = arrList.sort(undefined);
        expect(arrListNew.toString()).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_15300
     * @tc.name       : testInt16Array0153
     * @tc.desc       : Testing the sort of int16Array, array is not null, parameter is grade down.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0153', 0, () => {
      const TAG = "testInt16Array0153";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([5, 2, 3, 4, 1]);
        let arrListNew = arrList.sort((a: number, b: number) => b - a);
        expect(arrListNew.toString()).assertEqual("5,4,3,2,1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_15400
     * @tc.name       : testInt16Array0154
     * @tc.desc       : Testing the sort of int16Array, array is not null, set.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0154', 0, () => {
      const TAG = "testInt16Array0154";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([5, 2, 3, 4, 1]);
        arrList.set([7, 9, 8], 2);
        let arrListNew = arrList.sort();
        expect(arrListNew.toString()).assertEqual("2,5,7,8,9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_15500
     * @tc.name       : testInt16Array0155
     * @tc.desc       : Testing the subarray of int16Array, array is not null, parameter is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0155', 0, () => {
      const TAG = "testInt16Array0155";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray();
        expect(arrListNew.toString()).assertEqual("1,3,5,7,9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_15600
     * @tc.name       : testInt16Array0156
     * @tc.desc       : Testing the subarray of int16Array, array is not null, begin is -1, end is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0156', 0, () => {
      const TAG = "testInt16Array0156";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(-1);
        expect(arrListNew.toString()).assertEqual("9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_15700
     * @tc.name       : testInt16Array0157
     * @tc.desc       : Testing the subarray of int16Array, array is not null, begin is -1, end is -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0157', 0, () => {
      const TAG = "testInt16Array0157";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(-1, -1);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_15800
     * @tc.name       : testInt16Array0158
     * @tc.desc       : Testing the subarray of int16Array, array is not null, begin is -1, end is 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0158', 0, () => {
      const TAG = "testInt16Array0158";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(-1, 2);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_15900
     * @tc.name       : testInt16Array0159
     * @tc.desc       : Testing the subarray of int16Array, array is not null, begin is -1, end is overstep.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0159', 0, () => {
      const TAG = "testInt16Array0159";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(-1, 7);
        expect(arrListNew.toString()).assertEqual("9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_16000
     * @tc.name       : testInt16Array0160
     * @tc.desc       : Testing the subarray of int16Array, array is not null, begin is 2, end is null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0160', 0, () => {
      const TAG = "testInt16Array0160";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(2);
        expect(arrListNew.toString()).assertEqual("5,7,9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_16100
     * @tc.name       : testInt16Array0161
     * @tc.desc       : Testing the subarray of int16Array, array is not null, begin is 2, end is -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0161', 0, () => {
      const TAG = "testInt16Array0161";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(2, -1);
        expect(arrListNew.toString()).assertEqual("5,7");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_16200
     * @tc.name       : testInt16Array0162
     * @tc.desc       : Testing the subarray of int16Array, array is not null, begin is 2, end is 2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0162', 0, () => {
      const TAG = "testInt16Array0162";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(2, 2);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_16300
     * @tc.name       : testInt16Array0163
     * @tc.desc       : Testing the subarray of int16Array, array is not null, begin is 2, end is overstep.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0163', 0, () => {
      const TAG = "testInt16Array0163";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(2, 10);
        expect(arrListNew.toString()).assertEqual("5,7,9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_16400
     * @tc.name       : testInt16Array0164
     * @tc.desc       : Testing the subarray of int16Array, array is not null, begin is overstep, end is overstep.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0164', 0, () => {
      const TAG = "testInt16Array0164";
      try {
        let arrList: collections.Int16Array = new collections.Int16Array([1, 3, 5, 7, 9]);
        let arrListNew = arrList.subarray(7, 10);
        expect(arrListNew.toString()).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_16500
     * @tc.name       : testInt16Array0165
     * @tc.desc       : Testing Collections of int16array, array is [], at(1), return undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0165', 0, () => {
      const TAG = "testInt16Array0165";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([]);
        console.info("array: " + array);
        expect(array.at(1)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_16600
     * @tc.name       : testInt16Array0166
     * @tc.desc       : Testing Collections of int16array, array is [1,2,3], at(3), return undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0166', 0, () => {
      const TAG = "testInt16Array0166";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3]);
        console.info("array: " + array);
        expect(array.at(3)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_16700
     * @tc.name       : testInt16Array0167
     * @tc.desc       : Testing Collections of int16array, array is [1,2,3], at(-1), return element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0167', 0, () => {
      const TAG = "testInt16Array0167";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3]);
        console.info("array: " + array);
        expect(array.at(-1)).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_16800
     * @tc.name       : testInt16Array0168
     * @tc.desc       : Testing Collections of int16array, array is [1,2,3], at(5), return undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0168', 0, () => {
      const TAG = "testInt16Array0168";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3]);
        console.info("array: " + array);
        expect(array.at(5)).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_16900
     * @tc.name       : testInt16Array0169
     * @tc.desc       : Testing Collections of int16array, array is [1,2,3], at(0), return element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0169', 0, () => {
      const TAG = "testInt16Array0169";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3]);
        console.info("array: " + array);
        expect(array.at(0)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_17000
     * @tc.name       : testInt16Array0170
     * @tc.desc       : Testing Collections of int16array, array is [], includes(2), return false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0170', 0, () => {
      const TAG = "testInt16Array0170";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([]);
        console.info("array includes: " + array);
        expect(array.includes(2)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_17100
     * @tc.name       : testInt16Array0171
     * @tc.desc       : Testing Collections of int16array, array is [1,2,3], includes(5,-1), return false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0171', 0, () => {
      const TAG = "testInt16Array0171";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3]);
        console.info("array includes: " + array);
        expect(array.includes(5, -1)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_17200
     * @tc.name       : testInt16Array0172
     * @tc.desc       : Testing Collections of int16array, array is [1,2,3], includes(3,-1), return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0172', 0, () => {
      const TAG = "testInt16Array0172";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        console.info("array includes: " + array);
        expect(array.includes(3, -1)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_17300
     * @tc.name       : testInt16Array0173
     * @tc.desc       : Testing Collections of int16array, array is [1,2,3], includes(10), return false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0173', 0, () => {
      const TAG = "testInt16Array0173";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        console.info("array includes: " + array);
        expect(array.includes(10)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_17400
     * @tc.name       : testInt16Array0174
     * @tc.desc       : Testing Collections of int16array, array is [1,2,3], includes(1), return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0174', 0, () => {
      const TAG = "testInt16Array0174";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3]);
        console.info("array includes: " + array);
        expect(array.includes(1)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_17500
     * @tc.name       : testInt16Array0175
     * @tc.desc       : Testing Collections of int16array, array is [1,2,3], includes(1,5), return false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0175', 0, () => {
      const TAG = "testInt16Array0175";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3]);
        console.info("array includes: " + array);
        expect(array.includes(1, 5)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_17600
     * @tc.name       : testInt16Array0176
     * @tc.desc       : Testing Collections of int16array, array is [], entries(), undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0176', 0, () => {
      const TAG = "testInt16Array0176";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([]);
        let iterator: IterableIterator<[number, number]> = array.entries();
        console.info("array includes: " + array);
        expect(iterator.next().value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_17700
     * @tc.name       : testInt16Array0177
     * @tc.desc       : Testing Collections of int16array, array is [1,2,3], entries() .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0177', 0, () => {
      const TAG = "testInt16Array0177";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3]);
        let iterator: IterableIterator<[number, number]> = array.entries();
        console.info("array includes: " + array);
        expect(iterator.next().value.toString()).assertEqual('0,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_17800
     * @tc.name       : testInt16Array0178
     * @tc.desc       : Testing Collections of int16array, array is [], keys().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0178', 0, () => {
      const TAG = "testInt16Array0178";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([]);
        let iterator: IterableIterator<number> = array.keys();
        let tempNum: number = 0;
        for (const key of iterator) {
          console.info("iterator key:" + key);
          tempNum = tempNum + 1;
        }
        expect(tempNum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_17900
     * @tc.name       : testInt16Array0179
     * @tc.desc       : Testing Collections of int16array, array is [1,2,3], keys(),iterator.next().value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0179', 0, () => {
      const TAG = "testInt16Array0179";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([-1, 2, 3]);
        let iterator: IterableIterator<number> = array.keys();
        expect(iterator.next().value).assertEqual(0);
        expect(iterator.next().value).assertEqual(1);
        expect(iterator.next().value).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_18000
     * @tc.name       : testInt16Array0180
     * @tc.desc       : Testing Collections of int16array, array is [1,2,3], keys(),for iterator.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0180', 0, () => {
      const TAG = "testInt16Array0180";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3]);
        let iterator: IterableIterator<number> = array.keys();
        let tempNum: number = 0;
        for (const key of iterator) {
          console.info("iterator key:" + key);
          expect(key).assertEqual(tempNum);
          tempNum = tempNum + 1;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_18100
     * @tc.name       : testInt16Array0181
     * @tc.desc       : Testing Collections of int16array, array is [], values().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0181', 0, () => {
      const TAG = "testInt16Array0181";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([]);
        let iterator: IterableIterator<number> = array.values();
        console.info("iterator values:" + iterator);
        expect(iterator.next().done).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_18200
     * @tc.name       : testInt16Array0182
     * @tc.desc       : Testing Collections of int16array, array is [1,2,3], values(),iterator.next().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0182', 0, () => {
      const TAG = "testInt16Array0182";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3]);
        let iterator: IterableIterator<number> = array.values();
        console.info("iterator values:" + iterator);
        expect(iterator.next().value).assertEqual(1);
        expect(iterator.next().value).assertEqual(2);
        expect(iterator.next().value).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_18300
     * @tc.name       : testInt16Array0183
     * @tc.desc       : Testing Collections of uint16array, array is [1,2,3], values(),for value iterator.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0183', 0, () => {
      const TAG = "testInt16Array0183";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3]);
        let iterator: IterableIterator<number> = array.values();
        console.info("iterator values:" + iterator);
        let tempNum: number = 1;
        for (const value of iterator) {
          console.info("iterator value:" + value);
          expect(value).assertEqual(tempNum);
          tempNum = tempNum + 1;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_18400
     * @tc.name       : testInt16Array0184
     * @tc.desc       : Testing Collections of int16array, array is [1,2,3], set array,values(),for value iterator.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0184', 0, () => {
      const TAG = "testInt16Array0184";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3]);
        array.set([4, 5, 6]);
        let iterator: IterableIterator<number> = array.values();
        console.info("iterator values:" + iterator);
        let tempNum: number = 4;
        for (const value of iterator) {
          console.info("iterator value:" + value);
          expect(value).assertEqual(tempNum);
          tempNum = tempNum + 1;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_18500
     * @tc.name       : testInt16Array0185
     * @tc.desc       : Testing Collections of int16array, array is [1,2,3], index < 0, array[index] = undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0185', 0, () => {
      const TAG = "testInt16Array0185";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3]);
        console.info("array is:" + array);
        expect(array[-1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_18600
     * @tc.name       : testInt16Array0186
     * @tc.desc       : Testing Collections of int16array, array is [1,2,3], index > arrayLength, array[index] = undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0186', 0, () => {
      const TAG = "testInt16Array0186";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        console.info("array is:" + array);
        expect(array[5]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_18700
     * @tc.name       : testInt16Array0187
     * @tc.desc       : Testing Collections of int16array, array is [1,2,3],
     * 0 <= index < arrayLength, array[index] = array element.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Array0187', 0, () => {
      const TAG = "testInt16Array0187";
      try {
        let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3]);
        console.info("array is:" + array);
        expect(array[1]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}