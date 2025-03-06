/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { Constants } from './Uint8ClampedArrayData.test';

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, time)
  }).then(() => {
    console.info( `sleep ${time} over...`)
  })
}

export default function Uint8ClampedArrayTest() {
  describe('Uint8ClampedArrayTest', () => {
    let value: string;
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
    afterEach(async (done:Function) => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      console.info('TypeArray after each called');
      value == '';
      await sleep(10);
      done();
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_0100
     * @tc.name       : testUint8ClampedArrayConstructor0001
     * @tc.desc       : Testing Constructor of Uint8ClampedArray without param.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0001";
      try {
        let array = new Uint8ClampedArray();
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_0200
     * @tc.name       : testUint8ClampedArrayConstructor0002
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with length 0,and set index 0 with 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0002";
      try {
        let array = new Uint8ClampedArray(0);
        array[0] = 3;
        expect(array[0]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_0300
     * @tc.name       : testUint8ClampedArrayConstructor0003
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with length 10,and set index 0 with 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0003";
      try {
        let array = new Uint8ClampedArray(10);
        array[0] = 3;
        expect(array[0]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_0400
     * @tc.name       : testUint8ClampedArrayConstructor0004
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with length 10,and set index 0 with 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0004";
      try {
        let array = new Uint8ClampedArray(10);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_0500
     * @tc.name       : testUint8ClampedArrayConstructor0005
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with length 10,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0005";
      try {
        let array = new Uint8ClampedArray(10);
        expect(array[1]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_0600
     * @tc.name       : testUint8ClampedArrayConstructor0006
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with 'q',and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0006";
      try {
        const array = Constants.uint8ClampedConstructTestArray1;
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_0700
     * @tc.name       : testUint8ClampedArrayConstructor0007
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with '56',and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0007";
      try {
        const array = Constants.uint8ClampedConstructTestArray2;
        expect(array[1]).assertEqual(0);
        expect(array.length).assertEqual(56);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_0800
     * @tc.name       : testUint8ClampedArrayConstructor0008
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with array[21,31],and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0008";
      try {
        let array = new Uint8ClampedArray([21, 31]);
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_0900
     * @tc.name       : testUint8ClampedArrayConstructor0009
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with array[21,31],and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0009";
      try {
        let array = new Uint8ClampedArray([21, 31]);
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1000
     * @tc.name       : testUint8ClampedArrayConstructor0010
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with array[21,31],and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0010";
      try {
        let array = new Uint8ClampedArray([21, 31]);
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1100
     * @tc.name       : testUint8ClampedArrayConstructor0011
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with array[21,31],and set value of index 10,get value of index 10.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0011";
      try {
        let array = new Uint8ClampedArray([21, 31]);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1200
     * @tc.name       : testUint8ClampedArrayConstructor0012
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint8ClampedArray which construct by array [21,31],and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0012";
      try {
        let array = new Uint8ClampedArray(new Uint8ClampedArray([21, 31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1300
     * @tc.name       : testUint8ClampedArrayConstructor0013
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint8ClampedArray which construct by array [21,31],and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0013";
      try {
        let array = new Uint8ClampedArray(new Uint8ClampedArray([21, 31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1400
     * @tc.name       : testUint8ClampedArrayConstructor0014
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint8ClampedArray which construct by array [21,31],and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0014";
      try {
        let array = new Uint8ClampedArray(new Uint8ClampedArray([21, 31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1500
     * @tc.name       : testUint8ClampedArrayConstructor0015
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint8ClampedArray which construct by array [21,31],and set value of index 10,and get value of index 10.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0015";
      try {
        let array = new Uint8ClampedArray(new Uint8ClampedArray([21, 31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1600
     * @tc.name       : testUint8ClampedArrayConstructor0016
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0016";
      try {
        let array = new Uint8ClampedArray(new Array(21,31));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1700
     * @tc.name       : testUint8ClampedArrayConstructor0017
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0017";
      try {
        let array = new Uint8ClampedArray(new Array(21,31));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1800
     * @tc.name       : testUint8ClampedArrayConstructor0018
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0018";
      try {
        let array = new Uint8ClampedArray(new Array(21,31));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_1900
     * @tc.name       : testUint8ClampedArrayConstructor0019
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with ArrayBuffer,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0019";
      try {
        let array = new Uint8ClampedArray(new Uint8ClampedArray([21, 31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2000
     * @tc.name       : testUint8ClampedArrayConstructor0020
     * @tc.desc       : Testing Constructor of Int8Array with Uint8Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0020";
      try {
        let array = new Uint8ClampedArray(new Int8Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2100
     * @tc.name       : testUint8ClampedArrayConstructor0021
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int8Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0021";
      try {
        let array = new Uint8ClampedArray(new Int8Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2200
     * @tc.name       : testUint8ClampedArrayConstructor0022
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int8Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0022";
      try {
        let array = new Uint8ClampedArray(new Int8Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2300
     * @tc.name       : testUint8ClampedArrayConstructor0023
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int8Array,Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0023";
      try {
        let array = new Uint8ClampedArray(new Int8Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2400
     * @tc.name       : testUint8ClampedArrayConstructor0024
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint8Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0024";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2500
     * @tc.name       : testUint8ClampedArrayConstructor0025
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint8Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0025";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2600
     * @tc.name       : testUint8ClampedArrayConstructor0026
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint8Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0026";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2700
     * @tc.name       : testUint8ClampedArrayConstructor0027
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint8Array,Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0027";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2800
     * @tc.name       : testUint8ClampedArrayConstructor0028
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint8ClampedArray,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0028";
      try {
        let array = new Uint8ClampedArray(new Uint8ClampedArray([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_2900
     * @tc.name       : testUint8ClampedArrayConstructor0029
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint8ClampedArray,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0029";
      try {
        let array = new Uint8ClampedArray(new Uint8ClampedArray([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3000
     * @tc.name       : testUint8ClampedArrayConstructor0030
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint8ClampedArray,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0030";
      try {
        let array = new Uint8ClampedArray(new Uint8ClampedArray([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3100
     * @tc.name       : testUint8ClampedArrayConstructor0031
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint8ClampedArray,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0031";
      try {
        let array = new Uint8ClampedArray(new Uint8ClampedArray([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3200
     * @tc.name       : testUint8ClampedArrayConstructor0032
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int16Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0032";
      try {
        let array = new Uint8ClampedArray(new Int16Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3300
     * @tc.name       : testUint8ClampedArrayConstructor0033
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int16Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0033";
      try {
        let array = new Uint8ClampedArray(new Int16Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3400
     * @tc.name       : testUint8ClampedArrayConstructor0034
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int16Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0034";
      try {
        let array = new Uint8ClampedArray(new Int16Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3500
     * @tc.name       : testUint8ClampedArrayConstructor0035
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int16Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0035";
      try {
        let array = new Uint8ClampedArray(new Int16Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3600
     * @tc.name       : testUint8ClampedArrayConstructor0036
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint16Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0036";
      try {
        let array = new Uint8ClampedArray(new Uint16Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3700
     * @tc.name       : testUint8ClampedArrayConstructor0037
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint16Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0037";
      try {
        let array = new Uint8ClampedArray(new Uint16Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3800
     * @tc.name       : testUint8ClampedArrayConstructor0038
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint16Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0038";
      try {
        let array = new Uint8ClampedArray(new Uint16Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_3900
     * @tc.name       : testUint8ClampedArrayConstructor0039
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint16Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0039";
      try {
        let array = new Uint8ClampedArray(new Uint16Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4000
     * @tc.name       : testUint8ClampedArrayConstructor0040
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int32Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0040";
      try {
        let array = new Uint8ClampedArray(new Int32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4100
     * @tc.name       : testUint8ClampedArrayConstructor0041
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int32Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0041";
      try {
        let array = new Uint8ClampedArray(new Int32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4200
     * @tc.name       : testUint8ClampedArrayConstructor0042
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int32Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0042";
      try {
        let array = new Uint8ClampedArray(new Int32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4300
     * @tc.name       : testUint8ClampedArrayConstructor0043
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int32Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0043";
      try {
        let array = new Uint8ClampedArray(new Int32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4400
     * @tc.name       : testUint8ClampedArrayConstructor0044
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint32Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0044";
      try {
        let array = new Uint8ClampedArray(new Uint32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4500
     * @tc.name       : testUint8ClampedArrayConstructor0045
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint32Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0045";
      try {
        let array = new Uint8ClampedArray(new Uint32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4600
     * @tc.name       : testUint8ClampedArrayConstructor0046
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint32Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0046";
      try {
        let array = new Uint8ClampedArray(new Uint32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4700
     * @tc.name       : testUint8ClampedArrayConstructor0047
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint32Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0047";
      try {
        let array = new Uint8ClampedArray(new Uint32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4800
     * @tc.name       : testUint8ClampedArrayConstructor0048
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with BigInt64Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0048";
      try {
        // creat bigInt64Array
        const bigInt64Array = new BigInt64Array([-21n, 31n]);
        // new Uint8ClampedArray
        const byteLength = bigInt64Array.buffer.byteLength;
        const uint8ClampedArray  = new Uint8ClampedArray(byteLength * 2); // because Uint8 is 1 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigInt64Array) {
          // BigInt => Uint8ClampedArray
          const bytes = new Uint8ClampedArray(BigInt(num).toString().split('').map(n => parseInt(n)));
          uint8ClampedArray .set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint8ClampedArray[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_4900
     * @tc.name       : testUint8ClampedArrayConstructor0049
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with BigInt64Array,and get value is error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0049";
      try {
        let bigInt64Array = new BigInt64Array([21n,31n]);
        new Uint8ClampedArray(bigInt64Array);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5000
     * @tc.name       : testUint8ClampedArrayConstructor0050
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with BigUint64Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0050";
      try {
        // creat bigInt64Array
        const bigInt64Array = new BigUint64Array([21n, 31n]);
        // new Uint8ClampedArray
        const byteLength = bigInt64Array.buffer.byteLength;
        const uint8ClampedArray  = new Uint8ClampedArray(byteLength * 2); // because Uint8ClampedArray is 1 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigInt64Array) {
          // BigInt => Uint8ClampedArray
          const bytes = new Uint8ClampedArray(BigInt(num).toString().split('').map(n => parseInt(n)));
          uint8ClampedArray .set(bytes, offset);
          offset += bytes.length;
        }
        expect(uint8ClampedArray[0]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5100
     * @tc.name       : testUint8ClampedArrayConstructor0051
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with BigUint64Array, get value error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0051";
      try {
        let array = new Uint8ClampedArray(new BigUint64Array([21n,31n]));
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5200
     * @tc.name       : testUint8ClampedArrayConstructor0052
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Float32Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0052";
      try {
        let array = new Uint8ClampedArray(new Float32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5300
     * @tc.name       : testUint8ClampedArrayConstructor0053
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Float32Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0053";
      try {
        let array = new Uint8ClampedArray(new Float32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5400
     * @tc.name       : testUint8ClampedArrayConstructor0054
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Float32Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0054";
      try {
        let array = new Uint8ClampedArray(new Float32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5500
     * @tc.name       : testUint8ClampedArrayConstructor0055
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Float32Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0055";
      try {
        let array = new Uint8ClampedArray(new Float32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5600
     * @tc.name       : testUint8ClampedArrayConstructor0056
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with ArrayBuffer,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0056";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8ClampedArray(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5700
     * @tc.name       : testUint8ClampedArrayConstructor0057
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with ArrayBuffer,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0057";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8ClampedArray(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5800
     * @tc.name       : testUint8ClampedArrayConstructor0058
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with ArrayBuffer,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0058";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8ClampedArray(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[3]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_5900
     * @tc.name       : testUint8ClampedArrayConstructor0059
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with ArrayBuffer,Set array[10] and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0059";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8ClampedArray(buffer);
        array[0] = 21;
        array[1] = 31;
        array[10] = 5;
        expect(array[3]).assertEqual(0);
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_601400
     * @tc.name       : testUint8ClampedArrayConstructor0060
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with (ArrayBuffer,0,2),and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0060";
      try {
        let buffer = new ArrayBuffer(5);
        let array = new Uint8ClampedArray(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_6100
     * @tc.name       : testUint8ClampedArrayConstructor0061
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with (ArrayBuffer,0,2),and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0061";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint8ClampedArray(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_6200
     * @tc.name       : testUint8ClampedArrayConstructor0062
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with (ArrayBuffer,0,2),and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0062";
      try {
        let buffer = new ArrayBuffer(5);
        let array = new Uint8ClampedArray(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_6300
     * @tc.name       : testUint8ClampedArrayConstructor0063
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with (ArrayBuffer,0,2),
     * Set array[10] and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0063";
      try {
        let buffer = new ArrayBuffer(5);
        let array = new Uint8ClampedArray(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        array[10] = 5;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_BYTESPERELEMENT_6400
     * @tc.name       : testUint8ClampedArrayBytesPerElement0064
     * @tc.desc       : Testing BYTES_PER_ELEMENT of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayBytesPerElement0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayBytesPerElement0064";
      try {
        let bytes = Uint8ClampedArray.BYTES_PER_ELEMENT;
        expect(bytes).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPEDARRAY_BYTESPERELEMENT_6500
     * @tc.name       : testUint8ClampedArrayLength0065
     * @tc.desc       : Testing length of Uint8Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayLength0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayLength0065";
      try {
        let bytes = Uint8ClampedArray.length;
        expect(bytes).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_6600
     * @tc.name       : testUint8ClampedArrayFrom0066
     * @tc.desc       : Testing static function from 'foo' of Int8Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayFrom0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0066";
      try {
        expect(Constants.uint8ClampedConstructTestArray3[0]).assertEqual(0);
        expect(Constants.uint8ClampedConstructTestArray3[1]).assertEqual(0);
        expect(Constants.uint8ClampedConstructTestArray3[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_6700
     * @tc.name       : testUint8ClampedArrayFrom0067
     * @tc.desc       : Testing static function from "123" of Int8Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayFrom0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0067";
      try {
        expect(Constants.uint8ClampedConstructTestArray6[0]).assertEqual(1);
        expect(Constants.uint8ClampedConstructTestArray6[1]).assertEqual(2);
        expect(Constants.uint8ClampedConstructTestArray6[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_6800
     * @tc.name       : testUint8ClampedArrayFrom0068
     * @tc.desc       : Testing static function from set() of Int8Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayFrom0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0068";
      try {
        expect(Constants.uint8ClampedConstructTestArray4[0]).assertEqual(0);
        expect(Constants.uint8ClampedConstructTestArray4[1]).assertEqual(0);
        expect(Constants.uint8ClampedConstructTestArray4[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_6900
     * @tc.name       : testUint8ClampedArrayFrom0069
     * @tc.desc       : Testing static function from map() of Int8Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayFrom0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0069";
      try {
        expect(Constants.uint8ClampedConstructTestArray5[0]).assertEqual(0);
        expect(Constants.uint8ClampedConstructTestArray5[1]).assertEqual(0);
        expect(Constants.uint8ClampedConstructTestArray5[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_7000
     * @tc.name       : testUint8ClampedArrayFrom0070
     * @tc.desc       : Testing static function from of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayFrom0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0070";
      try {
        let array = Uint8ClampedArray.from(Array.from([1, 2, 3], (x) => x + x));
        expect(array[0]).assertEqual(2);
        expect(array[1]).assertEqual(4);
        expect(array[2]).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_7100
     * @tc.name       : testUint8ClampedArrayOf0071
     * @tc.desc       : Testing static function of of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayOf0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0071";
      try {
        let array = Uint8ClampedArray.of();
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_7200
     * @tc.name       : testUint8ClampedArrayOf0072
     * @tc.desc       : Testing static function of of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayOf0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0072";
      try {
        let array = Uint8ClampedArray.of(0);
        array[0] = 3;
        expect(array[0]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_7300
     * @tc.name       : testUint8ClampedArrayOf0073
     * @tc.desc       : Testing static function of of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayOf0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0073";
      try {
        let array = Uint8ClampedArray.of(10);
        array[0] = 3;
        expect(array[0]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_7400
     * @tc.name       : testUint8ClampedArrayOf0074
     * @tc.desc       : Testing static function of of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayOf0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0074";
      try {
        let array = Uint8ClampedArray.of(10);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_7500
     * @tc.name       : testUint8ClampedArrayOf0075
     * @tc.desc       : Testing static function of of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayOf0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0075";
      try {
        let array = Uint8ClampedArray.of(10);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_7600
     * @tc.name       : testUint8ClampedArrayOf0076
     * @tc.desc       : Testing static function of of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayOf0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0076";
      try {
        let array = Uint8ClampedArray.of(21, 31);
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_7700
     * @tc.name       : testUint8ClampedArrayOf0077
     * @tc.desc       : Testing static function of of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayOf0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0077";
      try {
        let array = Uint8ClampedArray.of(21, 31);
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_7800
     * @tc.name       : testUint8ClampedArrayOf0078
     * @tc.desc       : Testing static function of of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayOf0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0078";
      try {
        let array = Uint8ClampedArray.of(21, 31);
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_7900
     * @tc.name       : testUint8ClampedArrayOf0079
     * @tc.desc       : Testing static function of of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayOf0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0079";
      try {
        let array = Uint8ClampedArray.of(21, 31);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_BYTEOFFSET_8000
     * @tc.name       : testUint8ClampedArrayByteOffset0080
     * @tc.desc       : Testing instance property byteOffset of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayByteOffset0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayByteOffset0080";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Uint8ClampedArray(buffer);
        expect(arrayOffSet0.byteOffset).assertEqual(0);
        const arrayOffSet8 = new Uint8ClampedArray(buffer, 8);
        expect(arrayOffSet8.byteOffset).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

  })
}