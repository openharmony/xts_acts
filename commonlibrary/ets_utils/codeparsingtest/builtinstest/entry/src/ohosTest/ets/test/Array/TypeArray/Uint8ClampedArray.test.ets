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

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_BYTELENGTH_8100
     * @tc.name       : testUint8ClampedArrayByteLength0081
     * @tc.desc       : Testing instance property byteLength of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayByteLength0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayByteLength0081";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Uint8ClampedArray(buffer);
        expect(arrayOffSet0.byteLength).assertEqual(32);
        const arrayOffSet8 = new Uint8ClampedArray(buffer, 8);
        expect(arrayOffSet8.byteLength).assertEqual(24);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_BUFFER_8200
     * @tc.name       : testUint8ClampedArrayBuffer0082
     * @tc.desc       : Testing instance property buffer of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayBuffer0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayBuffer0082";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Uint8ClampedArray(buffer);
        expect(arrayOffSet0.buffer.byteLength).assertEqual(32);
        const arrayOffSet8 = new Uint8ClampedArray(buffer, 8);
        expect(arrayOffSet8.buffer.byteLength).assertEqual(32);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_LENGTH_8300
     * @tc.name       : testUint8ClampedArrayLength0083
     * @tc.desc       : Testing instance function length of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayLength0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayLength0083";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Uint8ClampedArray(buffer);
        expect(arrayOffSet0.length).assertEqual(32);
        const arrayOffSet8 = new Uint8ClampedArray(buffer, 8);
        expect(arrayOffSet8.length).assertEqual(24);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_8400
     * @tc.name       : testUint8ClampedArrayConstructor0084
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with string param.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0084";
      try {
        const array = Constants.uint8ClampedConstructTestArray1;
        expect(array.toString()).assertEqual('');
        const array2 = Constants.uint8ClampedConstructTestArray2;
        expect(array2[1]).assertEqual(0);
        expect(array2.length).assertEqual(56);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_8500
     * @tc.name       : testUint8ClampedArrayConstructor0085
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int8Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0085";
      try {
        const array = new Int8Array([21, 31])
        let uint8ClampedArray = new Uint8ClampedArray(array);
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_8600
     * @tc.name       : testUint8ClampedArrayConstructor0086
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0086";
      try {
        const array = new Uint8ClampedArray([21, 31])
        let uint8ClampedArray = new Uint8ClampedArray(array);
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_8700
     * @tc.name       : testUint8ClampedArrayConstructor0087
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0087";
      try {
        const array = new Uint8ClampedArray([21, 31])
        let uint8ClampedArray = new Uint8ClampedArray(array);
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_8800
     * @tc.name       : testUint8ClampedArrayConstructor0088
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0088";
      try {
        const array = new Int16Array([21, 31])
        let uint8ClampedArray = new Uint8ClampedArray(array);
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_8900
     * @tc.name       : testUint8ClampedArrayConstructor0089
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0089";
      try {
        const array = new Uint16Array([21, 31])
        let uint8ClampedArray = new Uint8ClampedArray(array);
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_9000
     * @tc.name       : testUint8ClampedArrayConstructor0090
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0090";
      try {
        const array = new Int32Array([21, 31])
        let uint8ClampedArray = new Uint8ClampedArray(array);
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_9100
     * @tc.name       : testUint8ClampedArrayConstructor0091
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0091";
      try {
        const array = new Uint32Array([21, 31])
        let uint8ClampedArray = new Uint8ClampedArray(array);
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_9200
     * @tc.name       : testUint8ClampedArrayConstructor0092
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with BigInt64Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0092";
      try {
        const array = new BigInt64Array([21n, 31n]);
        new Uint8ClampedArray(array);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_9300
     * @tc.name       : testUint8ClampedArrayConstructor0093
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with BigUint64Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0093";
      try {
        const array = new BigUint64Array([21n, 31n]);
        new Uint8ClampedArray(array);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_9400
     * @tc.name       : testUint8ClampedArrayConstructor0094
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Float32Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0094";
      try {
        const array = new Float32Array([21, 31]);
        let uint8ClampedArray = new Uint8ClampedArray(array);
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_length_9500
     * @tc.name       : testUint8ClampedArrayLength0095
     * @tc.desc       : Testing instance function length of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayLength0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayLength0095";
      try {
        let uint8ClampedArray = new Uint8ClampedArray(8);
        expect(uint8ClampedArray.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_9600
     * @tc.name       : testUint8ClampedArrayFrom0096
     * @tc.desc       : Testing static function from of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayFrom0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0096";
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_9700
     * @tc.name       : testUint8ClampedArrayConstructor0097
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0097";
      try {
        let array: Array<number> = new Array<number>(2);
        let uint8ClampedArray = new Uint8ClampedArray(array);
        uint8ClampedArray[0] = 21;
        uint8ClampedArray[1] = 31;
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_9800
     * @tc.name       : testUint8ClampedArrayConstructor0098
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0098";
      try {
        let array: Array<number> = new Array<number>(2);
        let uint8ClampedArray = new Uint8ClampedArray(array);
        uint8ClampedArray[0] = 21;
        uint8ClampedArray[1] = 31;
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_9900
     * @tc.name       : testUint8ClampedArrayConstructor0099
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with ArrayBuffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0099";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let uint8ClampedArray = new Uint8ClampedArray(arrayBuffer);
        uint8ClampedArray[0] = 21;
        uint8ClampedArray[1] = 31;
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(0);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_10000
     * @tc.name       : testUint8ClampedArrayConstructor0100
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with ArrayBuffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0100";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let uint8ClampedArray = new Uint8ClampedArray(arrayBuffer, 0, 2);
        uint8ClampedArray[0] = 21;
        uint8ClampedArray[1] = 31;
        expect(uint8ClampedArray[0]).assertEqual(21);
        expect(uint8ClampedArray[1]).assertEqual(31);
        expect(uint8ClampedArray[3]).assertEqual(undefined);
        uint8ClampedArray[10] = 3;
        expect(uint8ClampedArray[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_10100
     * @tc.name       : testUint8ClampedArrayFrom0101
     * @tc.desc       : Testing static function from of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayFrom0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0101";
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_10200
     * @tc.name       : testUint8ClampedArrayFrom0102
     * @tc.desc       : Testing static function from of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayFrom0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0102";
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_10300
     * @tc.name       : testUint8ClampedArrayFrom0103
     * @tc.desc       : Testing static function from of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayFrom0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0103";
      try {
        expect(Constants.uint8ClampedFromTestArray[0]).assertEqual(0);
        expect(Constants.uint8ClampedFromTestArray[1]).assertEqual(1);
        expect(Constants.uint8ClampedFromTestArray[2]).assertEqual(2);
        expect(Constants.uint8ClampedFromTestArray[3]).assertEqual(3);
        expect(Constants.uint8ClampedFromTestArray[4]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_10400
     * @tc.name       : testUint8ClampedArrayOf0104
     * @tc.desc       : Testing static function of of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayOf0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0104";
      try {
        expect(Constants.uint8ClampedOfTestUndefined.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_10500
     * @tc.name       : testUint8ClampedArrayOf0105
     * @tc.desc       : Testing static function of of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayOf0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0105";
      try {
        expect(Constants.uint8ClampedOfTestStr.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_10600
     * @tc.name       : testUint8ClampedArrayOf0106
     * @tc.desc       : Testing static function of of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayOf0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0106";
      try {
        expect(Constants.uint8ClampedOfTestNumber1.toString()).assertEqual('123');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_OF_10700
     * @tc.name       : testUint8ClampedArrayOf0107
     * @tc.desc       : Testing static function of of Uint8ClampedArray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayOf0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayOf0107";
      try {
        expect(Constants.uint8ClampedOfTestNumber2[0]).assertEqual(1);
        expect(Constants.uint8ClampedOfTestNumber2[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_10800
     * @tc.name       : testUint8ClampedArrayFrom0108
     * @tc.desc       : Testing static function from range length step + 1 => of Uint8Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayFrom0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0108";
      try {
        expect(Constants.uint8ClampedArrayNumber[0]).assertEqual(0);
        expect(Constants.uint8ClampedArrayNumber[1]).assertEqual(1);
        expect(Constants.uint8ClampedArrayNumber[2]).assertEqual(2);
        expect(Constants.uint8ClampedArrayNumber[3]).assertEqual(3);
        expect(Constants.uint8ClampedArrayNumber[4]).assertEqual(4);
        expect(Constants.uint8ClampedArrayNumber[5]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_FROM_10900
     * @tc.name       : testUint8ClampedArrayFrom0109
     * @tc.desc       : Testing static function from range length 'A~Z' => of Uint8Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayFrom0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayFrom0109";
      try {
        expect(Constants.uint8ClampedArrayCharacter[0]).assertEqual(65);
        expect(Constants.uint8ClampedArrayCharacter[1]).assertEqual(66);
        expect(Constants.uint8ClampedArrayCharacter[2]).assertEqual(67);
        expect(Constants.uint8ClampedArrayCharacter[25]).assertEqual(90);
        expect(Constants.uint8ClampedArrayCharacter[26]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11000
     * @tc.name       : testUint8ClampedArrayConstructor0110
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with threshold value([0]),and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0110";
      try {
        let array = new Uint8ClampedArray([0]);
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11100
     * @tc.name       : testUint8ClampedArrayConstructor0111
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with out of bounds value([-1]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0111";
      try {
        let array = new Uint8ClampedArray([-1]);
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11200
     * @tc.name       : testUint8ClampedArrayConstructor0112
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with threshold value([255]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0112";
      try {
        let array = new Uint8ClampedArray([255]);
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11300
     * @tc.name       : testUint8ClampedArrayConstructor0113
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with out of bounds value([256]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0113";
      try {
        let array = new Uint8ClampedArray([256]);
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11400
     * @tc.name       : testUint8ClampedArrayConstructor0114
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int8Array threshold value([-128]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0114";
      try {
        let array = new Uint8ClampedArray(new Int8Array([-128]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11500
     * @tc.name       : testUint8ClampedArrayConstructor0115
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int8Array out of bounds value([-129]),
     * and get value of index 0 is 127.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0115";
      try {
        let array = new Uint8ClampedArray(new Int8Array([-129]));
        expect(array[0]).assertEqual(127);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11600
     * @tc.name       : testUint8ClampedArrayConstructor0116
     * @tc.desc       : Testing Constructor of Uint8Array with Int8Array threshold value([127]),
     * and get value of index 0 is 127.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0116";
      try {
        let array = new Uint8ClampedArray(new Int8Array([127]));
        expect(array[0]).assertEqual(127);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11700
     * @tc.name       : testUint8ClampedArrayConstructor0117
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int8Array value([126]),
     * and get value of index 0 is 126.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0117";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([126]));
        expect(array[0]).assertEqual(126);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11800
     * @tc.name       : testUint8ClampedArrayConstructor0118
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int8Array out of bounds value([128]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0118";
      try {
        let array = new Uint8ClampedArray(new Int8Array([128]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_11900
     * @tc.name       : testUint8ClampedArrayConstructor0119
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint8Array threshold value([0]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0119";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([0]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12000
     * @tc.name       : testUint8ClampedArrayConstructor0120
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint8Array out of bounds value([-1]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0120";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([-1]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12100
     * @tc.name       : testUint8ClampedArrayConstructor0121
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint8Array threshold value([255]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0121";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([255]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12200
     * @tc.name       : testUint8ClampedArrayConstructor0122
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint8Array out of bounds value([256]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0122";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([256]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12300
     * @tc.name       : testUint8ClampedArrayConstructor0123
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint8Array value([254]),
     * and get value of index 0 is 254.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0123";
      try {
        let array = new Uint8ClampedArray(new Uint8Array([254]));
        expect(array[0]).assertEqual(254);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12400
     * @tc.name       : testUint8ClampedArrayConstructor0124
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int16Array threshold value([-32768]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0124";
      try {
        let array = new Uint8ClampedArray(new Int16Array([-32768]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12500
     * @tc.name       : testUint8ClampedArrayConstructor0125
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int16Array out of bounds value([-32769]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0125";
      try {
        let array = new Uint8ClampedArray(new Int16Array([-32769]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12600
     * @tc.name       : testUint8ClampedArrayConstructor0126
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int16Array threshold value([32767]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0126";
      try {
        let array = new Uint8ClampedArray(new Int16Array([32767]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12700
     * @tc.name       : testUint8ClampedArrayConstructor0127
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int16Array out of bounds value([32768]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0127";
      try {
        let array = new Uint8ClampedArray(new Int16Array([32768]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12800
     * @tc.name       : testUint8ClampedArrayConstructor0128
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int16Array value([32766]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0128";
      try {
        let array = new Uint8ClampedArray(new Int16Array([32766]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_12900
     * @tc.name       : testUint8ClampedArrayConstructor0129
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint16Array threshold value([0]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0129";
      try {
        let array = new Uint8ClampedArray(new Uint16Array([0]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13000
     * @tc.name       : testUint8ClampedArrayConstructor0130
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint16Array out of bounds value([-1]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0130";
      try {
        let array = new Uint8ClampedArray(new Uint16Array([-1]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13100
     * @tc.name       : testUint8ClampedArrayConstructor0131
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint16Array threshold value([65535]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0131";
      try {
        let array = new Uint8ClampedArray(new Uint16Array([65535]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13200
     * @tc.name       : testUint8ClampedArrayConstructor0132
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint16Array out of bounds value([65536]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0132";
      try {
        let array = new Uint8ClampedArray(new Uint16Array([65536]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13300
     * @tc.name       : testUint8ClampedArrayConstructor0133
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint16Array value([65534]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0133";
      try {
        let array = new Uint8ClampedArray(new Uint16Array([65534]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13400
     * @tc.name       : testUint8ClampedArrayConstructor0134
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int32Array threshold value([-2147483648]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0134";
      try {
        let array = new Uint8ClampedArray(new Int32Array([-2147483648]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13500
     * @tc.name       : testUint8ClampedArrayConstructor0135
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int32Array out of bounds value([-2147483649]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0135";
      try {
        let array = new Uint8ClampedArray(new Int32Array([-2147483649]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13600
     * @tc.name       : testUint8ClampedArrayConstructor0136
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int32Array threshold value([2147483647]),
     * and get value of index 0 is -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0136";
      try {
        let array = new Uint8ClampedArray(new Int32Array([2147483647]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13700
     * @tc.name       : testUint8ClampedArrayConstructor0137
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int32Array out of bounds value([2147483648]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0137";
      try {
        let array = new Uint8ClampedArray(new Int32Array([2147483648]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13800
     * @tc.name       : testUint8ClampedArrayConstructor0138
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Int32Array value([2147483646]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0138";
      try {
        let array = new Uint8ClampedArray(new Int32Array([2147483646]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_13900
     * @tc.name       : testUint8ClampedArrayConstructor0139
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint32Array threshold value([0]),
     * and get value of index 0 is 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0139";
      try {
        let array = new Uint8ClampedArray(new Uint32Array([0]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_14000
     * @tc.name       : testUint8ClampedArrayConstructor0140
     * @tc.desc       : Testing Constructor of Uint8ClampedArray with Uint32Array out of bounds value([-1]),
     * and get value of index 0 is 255.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUint8ClampedArrayConstructor0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUint8ClampedArrayConstructor0140";
      try {
        let array = new Uint8ClampedArray(new Uint32Array([-1]));
        expect(array[0]).assertEqual(255);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
  })
}