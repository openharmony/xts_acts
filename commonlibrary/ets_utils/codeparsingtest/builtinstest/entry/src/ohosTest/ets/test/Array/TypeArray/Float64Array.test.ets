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
import { Constants } from './Float64ArrayData.test';

function sleep(time: number) {
    return new Promise<void>((resolve, reject) => {
        setTimeout(() => {
            resolve()
        }, time)
    }).then(() => {
        console.info( `sleep ${time} over...`)
    })
}

export default function Float64ArrayTest() {
    describe('Float64ArrayTest', () => {
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
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_0100
         * @tc.name       : testConstructor0001
         * @tc.desc       : Testing Constructor of Float64Array without param.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testConstructor0001";
            try {
                let array = new Float64Array();
                expect(array.toString()).assertEqual('');
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_0200
         * @tc.name       : testConstructor0002
         * @tc.desc       : Testing Constructor of Float64Array with length 0,and set index 0 with 3.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testConstructor0002";
            try {
                let array = new Float64Array(0);
                array[0] = 3;
                expect(array[0]).assertEqual(undefined);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_0300
         * @tc.name       : testConstructor0003
         * @tc.desc       : Testing Constructor of Float64Array with length 10,and set index 0 with 3.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testConstructor0003";
            try {
                let array = new Float64Array(10);
                array[0] = 3;
                expect(array[0]).assertEqual(3);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_0400
         * @tc.name       : testConstructor0004
         * @tc.desc       : Testing Constructor of Float64Array with length 10,and set index 0 with 3.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testConstructor0004";
            try {
                let array = new Float64Array(10);
                array[10] = 3;
                expect(array[10]).assertEqual(undefined);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_0500
         * @tc.name       : testConstructor0005
         * @tc.desc       : Testing Constructor of Float64Array with length 10,and get value of index 1.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testConstructor0005";
            try {
                let array = new Float64Array(10);
                expect(array[1]).assertEqual(0);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_0600
     * @tc.name       : testFloat64ArrayConstructor0006
     * @tc.desc       : Testing Constructor of Float64Array with 'q',and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0006";
      try {
        const array = Constants.float64ConstructTestArray1;
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_0700
     * @tc.name       : testFloat64ArrayConstructor0007
     * @tc.desc       : Testing Constructor of Float64Array with '56',and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0007";
      try {
        const array = Constants.float64ConstructTestArray2;
        expect(array[1]).assertEqual(0);
        expect(array.length).assertEqual(56);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_0800
         * @tc.name       : testConstructor0008
         * @tc.desc       : Testing Constructor of Float64Array with array[21,31],and get value of index 0.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testConstructor0008";
            try {
                let array = new Float64Array([21, 31]);
                expect(array[0]).assertEqual(21);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_0900
         * @tc.name       : testConstructor0009
         * @tc.desc       : Testing Constructor of Float64Array with array[21,31],and get value of index 1.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testConstructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testConstructor0009";
            try {
                let array = new Float64Array([21, 31]);
                expect(array[1]).assertEqual(31);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_1000
         * @tc.name       : testConstructor0010
         * @tc.desc       : Testing Constructor of Float64Array with array[21,31],and get value of index 3.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testConstructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testConstructor0010";
            try {
                let array = new Float64Array([21, 31]);
                expect(array[3]).assertEqual(undefined);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_1100
         * @tc.name       : testConstructor0011
         * @tc.desc       : Testing Constructor of Float64Array with array[21,31],and set value of index 10,get value of index 10.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testConstructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testConstructor0011";
            try {
                let array = new Float64Array([21, 31]);
                array[10] = 3;
                expect(array[10]).assertEqual(undefined);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_1200
         * @tc.name       : testConstructor0012
         * @tc.desc       : Testing Constructor of Float64Array with Float64Array which construct by array [21,31],and get value of index 0.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testConstructor0012";
            try {
                let array = new Float64Array(new Float64Array([21,31]));
                expect(array[0]).assertEqual(21);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_1300
         * @tc.name       : testConstructor0013
         * @tc.desc       : Testing Constructor of Float64Array with Float64Array which construct by array [21,31],and get value of index 0.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testConstructor0013";
            try {
                let array = new Float64Array(new Float64Array([21,31]));
                expect(array[1]).assertEqual(31);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_1400
         * @tc.name       : testConstructor0014
         * @tc.desc       : Testing Constructor of Float64Array with Float64Array which construct by array [21,31],and get value of index 3.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testConstructor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testConstructor0014";
            try {
                let array = new Float64Array(new Float64Array([21,31]));
                expect(array[3]).assertEqual(undefined);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_1500
         * @tc.name       : testConstructor0015
         * @tc.desc       : Testing Constructor of Float64Array with Float64Array which construct by array [21,31],and set value of index 10,and get value of index 10.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testConstructor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testConstructor0015";
            try {
                let array = new Float64Array(new Float64Array([21,31]));
                array[10] = 3;
                expect(array[10]).assertEqual(undefined);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_1600
     * @tc.name       : testFloat64ArrayConstructor0016
     * @tc.desc       : Testing Constructor of Float64Array with Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0016";
      try {
        let array = new Float64Array(new Array(21,31));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_1700
     * @tc.name       : testFloat64ArrayConstructor0017
     * @tc.desc       : Testing Constructor of Float64Array with Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0017";
      try {
        let array = new Float32Array(new Array(21,31));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_1800
     * @tc.name       : testFloat64ArrayConstructor0018
     * @tc.desc       : Testing Constructor of Float64Array with Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0018";
      try {
        let array = new Float64Array(new Array(21,31));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_1900
         * @tc.name       : testConstructor0019
         * @tc.desc       : Testing Constructor of Float64Array with ArrayBuffer,and get value of index 0.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testConstructor0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testConstructor0019";
            try {
                let array = new Float64Array(new Float64Array([21,31]));
                array[10] = 3;
                expect(array[10]).assertEqual(undefined);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_2000
     * @tc.name       : testFloat64ArrayConstructor0020
     * @tc.desc       : Testing Constructor of Float64Array with Uint8Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0020";
      try {
        let array = new Float64Array(new Int8Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_2100
     * @tc.name       : testFloat64ArrayConstructor0021
     * @tc.desc       : Testing Constructor of Float64Array with Int8Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0021";
      try {
        let array = new Float64Array(new Int8Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_2200
     * @tc.name       : testFloat64ArrayConstructor0022
     * @tc.desc       : Testing Constructor of Float64Array with Int8Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0022";
      try {
        let array = new Float64Array(new Int8Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_2300
     * @tc.name       : testFloat64ArrayConstructor0023
     * @tc.desc       : Testing Constructor of Float64Array with Int8Array,Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0023";
      try {
        let array = new Float64Array(new Int8Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_2400
     * @tc.name       : testFloat64ArrayConstructor0024
     * @tc.desc       : Testing Constructor of Float64Array with Uint8Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0024";
      try {
        let array = new Float64Array(new Uint8Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_2500
     * @tc.name       : testFloat64ArrayConstructor0025
     * @tc.desc       : Testing Constructor of Float64Array with Uint8Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0025";
      try {
        let array = new Float64Array(new Uint8Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_2600
     * @tc.name       : testFloat64ArrayConstructor0026
     * @tc.desc       : Testing Constructor of Float64Array with Uint8Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0026";
      try {
        let array = new Float64Array(new Uint8Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_2700
     * @tc.name       : testFloat64ArrayConstructor0027
     * @tc.desc       : Testing Constructor of Float64Array with Uint8Array,Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0027";
      try {
        let array = new Float64Array(new Uint8Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_2800
     * @tc.name       : testFloat64ArrayConstructor0028
     * @tc.desc       : Testing Constructor of Float64Array with Uint8ClampedArray,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0028";
      try {
        let array = new Float64Array(new Uint8ClampedArray([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_2900
     * @tc.name       : testFloat64ArrayConstructor0029
     * @tc.desc       : Testing Constructor of Float64Array with Uint8ClampedArray,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0029";
      try {
        let array = new Float64Array(new Uint8ClampedArray([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_3000
     * @tc.name       : testFloat64ArrayConstructor0030
     * @tc.desc       : Testing Constructor of Float64Array with Uint8ClampedArray,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0030";
      try {
        let array = new Float64Array(new Uint8ClampedArray([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_3100
     * @tc.name       : testFloat64ArrayConstructor0031
     * @tc.desc       : Testing Constructor of Float64Array with Uint8ClampedArray,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0031";
      try {
        let array = new Float64Array(new Uint8ClampedArray([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_3200
     * @tc.name       : testFloat64ArrayConstructor0032
     * @tc.desc       : Testing Constructor of Float64Array with Int16Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0032";
      try {
        let array = new Float64Array(new Int16Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_3300
     * @tc.name       : testFloat64ArrayConstructor0033
     * @tc.desc       : Testing Constructor of Float64Array with Int16Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0033";
      try {
        let array = new Float64Array(new Int16Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_3400
     * @tc.name       : testFloat64ArrayConstructor0034
     * @tc.desc       : Testing Constructor of Float64Array with Int16Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0034";
      try {
        let array = new Float64Array(new Int16Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_3500
     * @tc.name       : testFloat64ArrayConstructor0035
     * @tc.desc       : Testing Constructor of Float64Array with Int16Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0035";
      try {
        let array = new Float64Array(new Int16Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_3600
     * @tc.name       : testFloat64ArrayConstructor0036
     * @tc.desc       : Testing Constructor of Float64Array with Uint16Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0036";
      try {
        let array = new Float64Array(new Uint16Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_3700
     * @tc.name       : testFloat64ArrayConstructor0037
     * @tc.desc       : Testing Constructor of Float64Array with Uint16Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0037";
      try {
        let array = new Float64Array(new Uint16Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_3800
     * @tc.name       : testFloat64ArrayConstructor0038
     * @tc.desc       : Testing Constructor of Float64Array with Uint16Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0038";
      try {
        let array = new Float64Array(new Uint16Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_3900
     * @tc.name       : testFloat64ArrayConstructor0039
     * @tc.desc       : Testing Constructor of Float64Array with Uint16Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0039";
      try {
        let array = new Float64Array(new Uint16Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_4000
     * @tc.name       : testFloat64ArrayConstructor0040
     * @tc.desc       : Testing Constructor of Float64Array with Int32Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0040";
      try {
        let array = new Float64Array(new Int32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_4100
     * @tc.name       : testFloat64ArrayConstructor0041
     * @tc.desc       : Testing Constructor of Float64Array with Int32Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0041";
      try {
        let array = new Float64Array(new Int32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_4200
     * @tc.name       : testFloat64ArrayConstructor0042
     * @tc.desc       : Testing Constructor of Float64Array with Int32Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0042";
      try {
        let array = new Float64Array(new Int32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_4300
     * @tc.name       : testFloat64ArrayConstructor0043
     * @tc.desc       : Testing Constructor of Float64Array with Int32Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0043";
      try {
        let array = new Float64Array(new Int32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_4400
     * @tc.name       : testFloat64ArrayConstructor0044
     * @tc.desc       : Testing Constructor of Float64Array with Uint32Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0044";
      try {
        let array = new Float64Array(new Uint32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_4500
     * @tc.name       : testFloat64ArrayConstructor0045
     * @tc.desc       : Testing Constructor of Float64Array with Uint32Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0045";
      try {
        let array = new Float64Array(new Uint32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_4600
     * @tc.name       : testFloat64ArrayConstructor0046
     * @tc.desc       : Testing Constructor of Float64Array with Uint32Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0046";
      try {
        let array = new Float64Array(new Uint32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_4700
     * @tc.name       : testFloat64ArrayConstructor0047
     * @tc.desc       : Testing Constructor of Float64Array with Uint32Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0047";
      try {
        let array = new Float64Array(new Uint32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_4800
     * @tc.name       : testFloat64ArrayConstructor0048
     * @tc.desc       : Testing Constructor of Float64Array with BigInt64Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0048";
      try {
        // creat bigInt64Array
        const bigInt64Array = new BigInt64Array([-21n, 31n]);
        // new Float64Array
        const byteLength = bigInt64Array.buffer.byteLength;
        const float64Array  = new Float64Array(byteLength * 2); // because Float64Array is 8 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigInt64Array) {
          // BigInt => Float64Array
          const bytes = new Float64Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          float64Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(float64Array[0].toString()).assertEqual('NaN');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_4900
     * @tc.name       : testFloat64ArrayConstructor0049
     * @tc.desc       : Testing Constructor of Float64Array with BigInt64Array,and get value is error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0049";
      try {
        let bigInt64Array = new BigInt64Array([21n,31n]);
        new Float64Array(bigInt64Array);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_5000
     * @tc.name       : testFloat64ArrayConstructor0050
     * @tc.desc       : Testing Constructor of Float64Array with BigUint64Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0050";
      try {
        // creat bigInt64Array
        const bigInt64Array = new BigUint64Array([21n, 31n]);
        // new Float64Array
        const byteLength = bigInt64Array.buffer.byteLength;
        const float64Array  = new Float64Array(byteLength * 2); // because Float64 is 8 byte,BigInt64 is 8 byte,buffer * 2.

        let offset = 0;
        for (const num of bigInt64Array) {
          // BigInt => Float64Array
          const bytes = new Float64Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          float64Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(float64Array[0]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_5100
     * @tc.name       : testFloat64ArrayConstructor0051
     * @tc.desc       : Testing Constructor of Float64Array with BigUint64Array, get value error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0051";
      try {
        let array = new Float64Array(new BigUint64Array([21n,31n]));
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_5200
     * @tc.name       : testFloat64ArrayConstructor0052
     * @tc.desc       : Testing Constructor of Float64Array with Float32Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0052";
      try {
        let array = new Float64Array(new Float32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_5300
     * @tc.name       : testFloat64ArrayConstructor0053
     * @tc.desc       : Testing Constructor of Float64Array with Float32Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0053";
      try {
        let array = new Float64Array(new Float32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_5400
     * @tc.name       : testFloat64ArrayConstructor0054
     * @tc.desc       : Testing Constructor of Float64Array with Float32Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0054";
      try {
        let array = new Float64Array(new Float32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_5500
     * @tc.name       : testFloat64ArrayConstructor0055
     * @tc.desc       : Testing Constructor of Float64Array with Float32Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0055";
      try {
        let array = new Float64Array(new Float32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_5600
     * @tc.name       : testFloat64ArrayConstructor0056
     * @tc.desc       : Testing Constructor of Float64Array with ArrayBuffer,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0056";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Float64Array(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_5700
     * @tc.name       : testFloat64ArrayConstructor0057
     * @tc.desc       : Testing Constructor of Float64Array with ArrayBuffer,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0057";
      try {
        let buffer = new ArrayBuffer(16);
        let array = new Float64Array(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_5800
     * @tc.name       : testFloat64ArrayConstructor0058
     * @tc.desc       : Testing Constructor of Float64Array with ArrayBuffer,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0058";
      try {
        let buffer = new ArrayBuffer(16);
        let array = new Float64Array(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_5900
     * @tc.name       : testFloat64ArrayConstructor0059
     * @tc.desc       : Testing Constructor of Float64Array with ArrayBuffer,Set array[10] and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0059";
      try {
        let buffer = new ArrayBuffer(16);
        let array = new Float64Array(buffer);
        array[0] = 21;
        array[1] = 31;
        array[10] = 5;
        expect(array[3]).assertEqual(undefined);
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_6000
     * @tc.name       : testFloat64ArrayConstructor0060
     * @tc.desc       : Testing Constructor of Float64Array with (ArrayBuffer,0,2),and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0060";
      try {
        let buffer = new ArrayBuffer(16);
        let array = new Float64Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_6100
     * @tc.name       : testFloat64ArrayConstructor0061
     * @tc.desc       : Testing Constructor of Float64Array with (ArrayBuffer,0,2),and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0061";
      try {
        let buffer = new ArrayBuffer(16);
        let array = new Float64Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_6200
     * @tc.name       : testFloat64ArrayConstructor0062
     * @tc.desc       : Testing Constructor of Float64Array with (ArrayBuffer,0,2),and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0062";
      try {
        let buffer = new ArrayBuffer(16);
        let array = new Float64Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONSTRUCTOR_6300
     * @tc.name       : testFloat64ArrayConstructor0063
     * @tc.desc       : Testing Constructor of Float64Array with (ArrayBuffer,0,2),
     * Set array[10] and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayConstructor0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayConstructor0063";
      try {
        let buffer = new ArrayBuffer(16);
        let array = new Float64Array(buffer, 0, 2);
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
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTESPERELEMENT_6400
         * @tc.name       : testBytesPerElement0064
         * @tc.desc       : Testing BYTES_PER_ELEMENT of Float64Array.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testBytesPerElement0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testBytesPerElement0064";
            try {
                let bytes = Float64Array.BYTES_PER_ELEMENT;
                expect(bytes).assertEqual(8);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT64ARRAY_BYTESPERELEMENT_6500
     * @tc.name       : testFloat64ArrayLength0065
     * @tc.desc       : Testing length of Float64Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayLength0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayLength0065";
      try {
        let bytes = Float64Array.length;
        expect(bytes).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT64ARRAY_FROM_6600
     * @tc.name       : testFloat64ArrayFrom0066
     * @tc.desc       : Testing static function from 'foo' of Float64Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayFrom0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayFrom0066";
      try {
        expect(Constants.float64ConstructTestArray3[0].toString()).assertEqual('NaN');
        expect(Constants.float64ConstructTestArray3[1].toString()).assertEqual('NaN');
        expect(Constants.float64ConstructTestArray3[2].toString()).assertEqual('NaN');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT64ARRAY_FROM_6700
     * @tc.name       : testFloat64ArrayFrom0067
     * @tc.desc       : Testing static function from "123" of Float64Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayFrom0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayFrom0067";
      try {
        expect(Constants.float64ConstructTestArray6[0]).assertEqual(1);
        expect(Constants.float64ConstructTestArray6[1]).assertEqual(2);
        expect(Constants.float64ConstructTestArray6[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT64ARRAY_FROM_6800
     * @tc.name       : testFloat64ArrayFrom0068
     * @tc.desc       : Testing static function from set() of Float64Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayFrom0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayFrom0068";
      try {
        expect(Constants.float64ConstructTestArray4[0].toString()).assertEqual('NaN');
        expect(Constants.float64ConstructTestArray4[1].toString()).assertEqual('NaN');
        expect(Constants.float64ConstructTestArray4[2].toString()).assertEqual('NaN');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FLOAT64ARRAY_FROM_6900
     * @tc.name       : testFloat64ArrayFrom0069
     * @tc.desc       : Testing static function from map() of Float64Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFloat64ArrayFrom0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testFloat64ArrayFrom0069";
      try {
        expect(Constants.float64ConstructTestArray5[0].toString()).assertEqual('NaN');
        expect(Constants.float64ConstructTestArray5[1].toString()).assertEqual('NaN');
        expect(Constants.float64ConstructTestArray5[2].toString()).assertEqual('NaN');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM_7000
         * @tc.name       : testFrom0070
         * @tc.desc       : Testing static function from of Float64Array.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testFrom0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testFrom0070";
            try {
                let array = Float64Array.from(Array.from([1, 2, 3], (x) => x + x));
                expect(array[0]).assertEqual(2);
                expect(array[1]).assertEqual(4);
                expect(array[2]).assertEqual(6);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_OF_7100
         * @tc.name       : testOf0071
         * @tc.desc       : Testing static function of of Float64Array.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOf0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testOf0071";
            try {
                let array = Float64Array.of();
                expect(array.toString()).assertEqual('');
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_OF_7200
         * @tc.name       : testOf0072
         * @tc.desc       : Testing static function of of Float64Array.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOf0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testOf0072";
            try {
                let array = Float64Array.of(0);
                array[0] = 3;
                expect(array[0]).assertEqual(3);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_OF_7300
         * @tc.name       : testOf0073
         * @tc.desc       : Testing static function of of Float64Array.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOf0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testOf0073";
            try {
                let array = Float64Array.of(10);
                array[0] = 3;
                expect(array[0]).assertEqual(3);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_OF_7400
         * @tc.name       : testOf0074
         * @tc.desc       : Testing static function of of Float64Array.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOf0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testOf0074";
            try {
                let array = Float64Array.of(10);
                array[10] = 3;
                expect(array[10]).assertEqual(undefined);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_OF_7500
         * @tc.name       : testOf0075
         * @tc.desc       : Testing static function of of Float64Array.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOf0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testOf0075";
            try {
                let array = Float64Array.of(10);
                expect(array[1]).assertEqual(undefined);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_OF_7600
         * @tc.name       : testOf0076
         * @tc.desc       : Testing static function of of Float64Array.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOf0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testOf0076";
            try {
                let array = Float64Array.of(21, 31);
                expect(array[0]).assertEqual(21);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_OF_7700
         * @tc.name       : testOf0077
         * @tc.desc       : Testing static function of of Float64Array.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOf0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testOf0077";
            try {
                let array = Float64Array.of(21, 31);
                expect(array[1]).assertEqual(31);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_OF_7800
         * @tc.name       : testOf0078
         * @tc.desc       : Testing static function of of Float64Array.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOf0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testOf0078";
            try {
                let array = Float64Array.of(21, 31);
                expect(array[3]).assertEqual(undefined);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_OF_7900
         * @tc.name       : testOf0079
         * @tc.desc       : Testing static function of of Float64Array.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOf0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testOf0079";
            try {
                let array = Float64Array.of(21, 31);
                array[10] = 3;
                expect(array[10]).assertEqual(undefined);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTEOFFSET_8000
         * @tc.name       : testByteOffset0080
         * @tc.desc       : Testing instance property byteOffset of Float64Array.
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testByteOffset0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            const TAG = "testByteOffset0080";
            try {
                const buffer = new ArrayBuffer(32);
                const arrayOffSet0 = new Float64Array(buffer);
                expect(arrayOffSet0.byteOffset).assertEqual(0);
                const arrayOffSet8 = new Float64Array(buffer, 8);
                expect(arrayOffSet8.byteOffset).assertEqual(8);
            } catch (err) {
                console.error(`${TAG} failed, error: ${err}`);
                expect().assertFail();
            }
        });

    })
}