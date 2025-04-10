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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections } from '@kit.ArkTS';
import {
  arrowFunc,
  getArray,
  getArrayBuffer,
  getASON,
  getAsyncLock,
  getBigInt,
  getBitVector,
  getBoolean,
  getConcatArray,
  getEnum,
  getMap,
  getNull,
  getNumber,
  getSendableUnionArray,
  getSet,
  getString,
  getTopLevelClassInstance,
  getTopLevelFunction,
  getTypedArrayFloat32Array,
  getTypedArrayInt16Array,
  getTypedArrayInt32Array,
  getTypedArrayInt8Array,
  getTypedArrayUint16Array,
  getTypedArrayUint32Array,
  getTypedArrayUint8Array,
  getTypedArrayUint8ClampedArray,
  getUndefined,
  identityFunction,
  ISendable,
  ModifiedTopLevelSendableFunction,
  SendableConstEnum,
  SendableDefaultArrowClass,
  SendableDefaultArrowNewClass,
  SendableDefaultArrowOutClass,
  SendableDefaultClass,
  SendableDefaultExpressionArrowOutClass,
  SendableDefaultExpressionOutClass,
  SendableDefaultFuncClass,
  SendableDefaultFuncInClass,
  SendableDefaultNonFuncClass,
  SendableDefaultNonParameterFuncClass,
  SendableDefaultOutArrowClass,
  SendableDefaultParameterFuncClass,
  SendableFuncType,
  topLevelSendableClass
} from './SendableClass';

@Sendable
export class SendableDefaultExpressionOutArrowClass implements ISendable {
  myString: string = getString();
  myNumber: number = getNumber();
  myBoolean: boolean = getBoolean();
  myBigInt: bigint = getBigInt();
  myUndefined: undefined | string | number | null = getUndefined();
  myNull: undefined | string | number | null = getNull();
  topLevelClassInstance: topLevelSendableClass = getTopLevelClassInstance();
  topLevelFunction: SendableFuncType = getTopLevelFunction();
  myEnum: SendableConstEnum = getEnum();
  myArray: collections.Array<number> = getArray();
  myMap: collections.Map<number, number> = getMap();
  mySet: collections.Set<number> = getSet();
  myTypedArrayInt8Array: collections.Int8Array = getTypedArrayInt8Array();
  myTypedArrayUint8Array: collections.Uint8Array = getTypedArrayUint8Array();
  myTypedArrayInt16Array: collections.Int16Array = getTypedArrayInt16Array();
  myTypedArrayUint16Array: collections.Uint16Array = getTypedArrayUint16Array();
  myTypedArrayInt32Array: collections.Int32Array = getTypedArrayInt32Array();
  myTypedArrayUint32Array: collections.Uint32Array = getTypedArrayUint32Array();
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = getTypedArrayUint8ClampedArray();
  myTypedArrayFloat32Array: collections.Float32Array = getTypedArrayFloat32Array();
  myArrayBuffer: collections.ArrayBuffer = getArrayBuffer();
  myConcatArray: collections.ConcatArray<number> = getConcatArray();
  myBitVector: collections.BitVector = getBitVector();
  myASON: ISendable = getASON();
  myAsyncLock: ArkTSUtils.locks.AsyncLock = getAsyncLock();
  mySendableUnionArray: string | number | boolean | bigint = getSendableUnionArray();

  constructor() {
  }
}


export default function sendableClassTest() {
  describe('ActsSendableClassTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_0100
     * @tc.name       : testSendableDefaultClass0001
     * @tc.desc       : Test SendableDefaultClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0001';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.myString = 'new string';
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_0200
     * @tc.name       : testSendableDefaultClass0002
     * @tc.desc       : Test SendableDefaultClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0002';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.myNumber = 100;
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_0300
     * @tc.name       : testSendableDefaultClass0003
     * @tc.desc       : Test SendableDefaultClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0003';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.myBoolean = false;
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_0400
     * @tc.name       : testSendableDefaultClass0004
     * @tc.desc       : Test SendableDefaultClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0004';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.myBigInt = 987654321098765432109876543210987654321n;
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_0500
     * @tc.name       : testSendableDefaultClass0005
     * @tc.desc       : Test SendableDefaultClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0005';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.myUndefined = 123;
        expect(instance.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_0600
     * @tc.name       : testSendableDefaultClass0006
     * @tc.desc       : Test SendableDefaultClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0006';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.myNull = 'not null anymore';
        expect(instance.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_0700
     * @tc.name       : testSendableDefaultClass0007
     * @tc.desc       : Test SendableDefaultClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0007';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        instance.topLevelClassInstance.num = 2;
        expect(instance.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_0800
     * @tc.name       : testSendableDefaultClass0008
     * @tc.desc       : Test SendableDefaultClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0008';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.topLevelFunction === 'function').assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        instance.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_0900
     * @tc.name       : testSendableDefaultClass0009
     * @tc.desc       : Test SendableDefaultClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0009';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        instance.myEnum = SendableConstEnum.OPTION_2;
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1000
     * @tc.name       : testSendableDefaultClass0010
     * @tc.desc       : Test SendableDefaultClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0010';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        expect(instance.myArray.toString()).assertEqual('');
        instance.myArray.push(4, 5);
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1100
     * @tc.name       : testSendableDefaultClass0011
     * @tc.desc       : Test SendableDefaultClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0011';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        instance.myMap.set(1, 2);
        expect(instance.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1200
     * @tc.name       : testSendableDefaultClass0012
     * @tc.desc       : Test SendableDefaultClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0012';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        instance.mySet.add(123);
        expect(instance.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1300
     * @tc.name       : testSendableDefaultClass0013
     * @tc.desc       : Test SendableDefaultClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0013';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt8Array.fill(2);
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1400
     * @tc.name       : testSendableDefaultClass0014
     * @tc.desc       : Test SendableDefaultClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0014';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8Array.fill(2);
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1500
     * @tc.name       : testSendableDefaultClass0015
     * @tc.desc       : Test SendableDefaultClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0015';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt16Array.fill(2);
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1600
     * @tc.name       : testSendableDefaultClass0016
     * @tc.desc       : Test SendableDefaultClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0016';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint16Array.fill(2);
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1700
     * @tc.name       : testSendableDefaultClass0017
     * @tc.desc       : Test SendableDefaultClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0017';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt32Array.fill(2);
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1800
     * @tc.name       : testSendableDefaultClass0018
     * @tc.desc       : Test SendableDefaultClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0018';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint32Array.fill(2);
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1900
     * @tc.name       : testSendableDefaultClass0019
     * @tc.desc       : Test SendableDefaultClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0019';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8ClampedArray.fill(2);
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2000
     * @tc.name       : testSendableDefaultClass0020
     * @tc.desc       : Test SendableDefaultClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0020';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayFloat32Array.fill(2);
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2100
     * @tc.name       : testSendableDefaultClass0021
     * @tc.desc       : Test SendableDefaultClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0021';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        expect(instance.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2200
     * @tc.name       : testSendableDefaultClass0022
     * @tc.desc       : Test SendableDefaultClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0022';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        expect(instance.myConcatArray[1]).assertEqual(2);
        expect(instance.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2300
     * @tc.name       : testSendableDefaultClass0023
     * @tc.desc       : Test SendableDefaultClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0023';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.myBitVector.push(1);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2400
     * @tc.name       : testSendableDefaultClass0024
     * @tc.desc       : Test SendableDefaultClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0024';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myASON).assertEqual('object');
        expect((instance.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2500
     * @tc.name       : testSendableDefaultClass0025
     * @tc.desc       : Test SendableDefaultClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0025';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2600
     * @tc.name       : testSendableDefaultClass0026
     * @tc.desc       : Test SendableDefaultClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0026';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.mySendableUnionArray).assertEqual('number');
        expect(instance.mySendableUnionArray).assertEqual(1);
        instance.mySendableUnionArray = 2;
        expect(instance.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2700
     * @tc.name       : testSendableDefaultFuncClass0001
     * @tc.desc       : Test SendableDefaultFuncClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0001';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.myString = 'new string';
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2800
     * @tc.name       : testSendableDefaultFuncClass0002
     * @tc.desc       : Test SendableDefaultFuncClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0002';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.myNumber = 100;
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2900
     * @tc.name       : testSendableDefaultFuncClass0003
     * @tc.desc       : Test SendableDefaultFuncClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0003';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.myBoolean = false;
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3000
     * @tc.name       : testSendableDefaultFuncClass0004
     * @tc.desc       : Test SendableDefaultFuncClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0004';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.myBigInt = 987654321098765432109876543210987654321n;
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3100
     * @tc.name       : testSendableDefaultFuncClass0005
     * @tc.desc       : Test SendableDefaultFuncClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0005';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.myUndefined = 123;
        expect(instance.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3200
     * @tc.name       : testSendableDefaultFuncClass0006
     * @tc.desc       : Test SendableDefaultFuncClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0006';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.myNull = 'not null anymore';
        expect(instance.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3300
     * @tc.name       : testSendableDefaultFuncClass0007
     * @tc.desc       : Test SendableDefaultFuncClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0007';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        instance.topLevelClassInstance.num = 2;
        expect(instance.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3400
     * @tc.name       : testSendableDefaultFuncClass0008
     * @tc.desc       : Test SendableDefaultFuncClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0008';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.topLevelFunction === 'function').assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        instance.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3500
     * @tc.name       : testSendableDefaultFuncClass0009
     * @tc.desc       : Test SendableDefaultFuncClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0009';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        instance.myEnum = SendableConstEnum.OPTION_2;
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3600
     * @tc.name       : testSendableDefaultFuncClass0010
     * @tc.desc       : Test SendableDefaultFuncClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0010';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        expect(instance.myArray.toString()).assertEqual('');
        instance.myArray.push(4, 5);
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3700
     * @tc.name       : testSendableDefaultFuncClass0011
     * @tc.desc       : Test SendableDefaultFuncClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0011';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        instance.myMap.set(1, 2);
        expect(instance.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3800
     * @tc.name       : testSendableDefaultFuncClass0012
     * @tc.desc       : Test SendableDefaultFuncClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0012';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        instance.mySet.add(123);
        expect(instance.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3900
     * @tc.name       : testSendableDefaultFuncClass0013
     * @tc.desc       : Test SendableDefaultFuncClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0013';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt8Array.fill(2);
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4000
     * @tc.name       : testSendableDefaultFuncClass0014
     * @tc.desc       : Test SendableDefaultFuncClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0014';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8Array.fill(2);
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4100
     * @tc.name       : testSendableDefaultFuncClass0015
     * @tc.desc       : Test SendableDefaultFuncClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0015';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt16Array.fill(2);
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4200
     * @tc.name       : testSendableDefaultFuncClass0016
     * @tc.desc       : Test SendableDefaultFuncClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0016';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint16Array.fill(2);
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4300
     * @tc.name       : testSendableDefaultFuncClass0017
     * @tc.desc       : Test SendableDefaultFuncClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0017';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt32Array.fill(2);
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4400
     * @tc.name       : testSendableDefaultFuncClass0018
     * @tc.desc       : Test SendableDefaultFuncClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0018';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint32Array.fill(2);
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4500
     * @tc.name       : testSendableDefaultFuncClass0019
     * @tc.desc       : Test SendableDefaultFuncClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0019';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8ClampedArray.fill(2);
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4600
     * @tc.name       : testSendableDefaultFuncClass0020
     * @tc.desc       : Test SendableDefaultFuncClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0020';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayFloat32Array.fill(2);
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4700
     * @tc.name       : testSendableDefaultFuncClass0021
     * @tc.desc       : Test SendableDefaultFuncClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0021';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        expect(instance.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4800
     * @tc.name       : testSendableDefaultFuncClass0022
     * @tc.desc       : Test SendableDefaultFuncClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0022';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        expect(instance.myConcatArray[1]).assertEqual(2);
        expect(instance.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4900
     * @tc.name       : testSendableDefaultFuncClass0023
     * @tc.desc       : Test SendableDefaultFuncClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0023';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.myBitVector.push(1);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5000
     * @tc.name       : testSendableDefaultFuncClass0024
     * @tc.desc       : Test SendableDefaultFuncClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0024';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myASON).assertEqual('object');
        expect((instance.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5100
     * @tc.name       : testSendableDefaultFuncClass0025
     * @tc.desc       : Test SendableDefaultFuncClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0025';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5200
     * @tc.name       : testSendableDefaultFuncClass0026
     * @tc.desc       : Test SendableDefaultFuncClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0026';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.mySendableUnionArray).assertEqual('number');
        expect(instance.mySendableUnionArray).assertEqual(1);
        instance.mySendableUnionArray = 2;
        expect(instance.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5300
     * @tc.name       : testSendableDefaultArrowClass0001
     * @tc.desc       : Test SendableDefaultArrowClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0001';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.myString = 'new string';
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5400
     * @tc.name       : testSendableDefaultArrowClass0002
     * @tc.desc       : Test SendableDefaultArrowClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0002';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.myNumber = 100;
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5500
     * @tc.name       : testSendableDefaultArrowClass0003
     * @tc.desc       : Test SendableDefaultArrowClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0003';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.myBoolean = false;
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5600
     * @tc.name       : testSendableDefaultArrowClass0004
     * @tc.desc       : Test SendableDefaultArrowClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0004';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.myBigInt = 987654321098765432109876543210987654321n;
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5700
     * @tc.name       : testSendableDefaultArrowClass0005
     * @tc.desc       : Test SendableDefaultArrowClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0005';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.myUndefined = 123;
        expect(instance.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5800
     * @tc.name       : testSendableDefaultArrowClass0006
     * @tc.desc       : Test SendableDefaultArrowClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0006';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.myNull = 'not null anymore';
        expect(instance.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5900
     * @tc.name       : testSendableDefaultArrowClass0007
     * @tc.desc       : Test SendableDefaultArrowClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0007';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        instance.topLevelClassInstance.num = 2;
        expect(instance.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6000
     * @tc.name       : testSendableDefaultArrowClass0008
     * @tc.desc       : Test SendableDefaultArrowClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0008';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.topLevelFunction === 'function').assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        instance.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6100
     * @tc.name       : testSendableDefaultArrowClass0009
     * @tc.desc       : Test SendableDefaultArrowClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0009';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        instance.myEnum = SendableConstEnum.OPTION_2;
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6200
     * @tc.name       : testSendableDefaultArrowClass0010
     * @tc.desc       : Test SendableDefaultArrowClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0010';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        expect(instance.myArray.toString()).assertEqual('');
        instance.myArray.push(4, 5);
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6300
     * @tc.name       : testSendableDefaultArrowClass0011
     * @tc.desc       : Test SendableDefaultArrowClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0011';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        instance.myMap.set(1, 2);
        expect(instance.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6400
     * @tc.name       : testSendableDefaultArrowClass0012
     * @tc.desc       : Test SendableDefaultArrowClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0012';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        instance.mySet.add(123);
        expect(instance.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6500
     * @tc.name       : testSendableDefaultArrowClass0013
     * @tc.desc       : Test SendableDefaultArrowClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0013';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt8Array.fill(2);
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6600
     * @tc.name       : testSendableDefaultArrowClass0014
     * @tc.desc       : Test SendableDefaultArrowClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0014';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8Array.fill(2);
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6700
     * @tc.name       : testSendableDefaultArrowClass0015
     * @tc.desc       : Test SendableDefaultArrowClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0015';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt16Array.fill(2);
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6800
     * @tc.name       : testSendableDefaultArrowClass0016
     * @tc.desc       : Test SendableDefaultArrowClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0016';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint16Array.fill(2);
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6900
     * @tc.name       : testSendableDefaultArrowClass0017
     * @tc.desc       : Test SendableDefaultArrowClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0017';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt32Array.fill(2);
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7000
     * @tc.name       : testSendableDefaultArrowClass0018
     * @tc.desc       : Test SendableDefaultArrowClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0018';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint32Array.fill(2);
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7100
     * @tc.name       : testSendableDefaultArrowClass0019
     * @tc.desc       : Test SendableDefaultArrowClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0019';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8ClampedArray.fill(2);
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7200
     * @tc.name       : testSendableDefaultArrowClass0020
     * @tc.desc       : Test SendableDefaultArrowClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0020';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayFloat32Array.fill(2);
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7300
     * @tc.name       : testSendableDefaultArrowClass0021
     * @tc.desc       : Test SendableDefaultArrowClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0021';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        expect(instance.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7400
     * @tc.name       : testSendableDefaultArrowClass0022
     * @tc.desc       : Test SendableDefaultArrowClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0022';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        expect(instance.myConcatArray[1]).assertEqual(2);
        expect(instance.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7500
     * @tc.name       : testSendableDefaultArrowClass0023
     * @tc.desc       : Test SendableDefaultArrowClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0023';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.myBitVector.push(1);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7600
     * @tc.name       : testSendableDefaultArrowClass0024
     * @tc.desc       : Test SendableDefaultArrowClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0024';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myASON).assertEqual('object');
        expect((instance.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7700
     * @tc.name       : testSendableDefaultArrowClass0025
     * @tc.desc       : Test SendableDefaultArrowClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0025';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7800
     * @tc.name       : testSendableDefaultArrowClass0026
     * @tc.desc       : Test SendableDefaultArrowClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0026';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.mySendableUnionArray).assertEqual('number');
        expect(instance.mySendableUnionArray).assertEqual(1);
        instance.mySendableUnionArray = 2;
        expect(instance.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7900
     * @tc.name       : testSendableDefaultArrowOutClass0001
     * @tc.desc       : Test SendableDefaultArrowOutClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0001';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.myString = 'new string';
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8000
     * @tc.name       : testSendableDefaultArrowOutClass0002
     * @tc.desc       : Test SendableDefaultArrowOutClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0002';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.myNumber = 100;
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8100
     * @tc.name       : testSendableDefaultArrowOutClass0003
     * @tc.desc       : Test SendableDefaultArrowOutClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0003';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.myBoolean = false;
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8200
     * @tc.name       : testSendableDefaultArrowOutClass0004
     * @tc.desc       : Test SendableDefaultArrowOutClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0004';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.myBigInt = 987654321098765432109876543210987654321n;
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8300
     * @tc.name       : testSendableDefaultArrowOutClass0005
     * @tc.desc       : Test SendableDefaultArrowOutClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0005';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.myUndefined = 123;
        expect(instance.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8400
     * @tc.name       : testSendableDefaultArrowOutClass0006
     * @tc.desc       : Test SendableDefaultArrowOutClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0006';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.myNull = 'not null anymore';
        expect(instance.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8500
     * @tc.name       : testSendableDefaultArrowOutClass0007
     * @tc.desc       : Test SendableDefaultArrowOutClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0007';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        instance.topLevelClassInstance.num = 2;
        expect(instance.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8600
     * @tc.name       : testSendableDefaultArrowOutClass0008
     * @tc.desc       : Test SendableDefaultArrowOutClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0008';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.topLevelFunction === 'function').assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        instance.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8700
     * @tc.name       : testSendableDefaultArrowOutClass0009
     * @tc.desc       : Test SendableDefaultArrowOutClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0009';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        instance.myEnum = SendableConstEnum.OPTION_2;
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8800
     * @tc.name       : testSendableDefaultArrowOutClass0010
     * @tc.desc       : Test SendableDefaultArrowOutClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0010';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        expect(instance.myArray.toString()).assertEqual('');
        instance.myArray.push(4, 5);
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8900
     * @tc.name       : testSendableDefaultArrowOutClass0011
     * @tc.desc       : Test SendableDefaultArrowOutClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0011';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        instance.myMap.set(1, 2);
        expect(instance.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9000
     * @tc.name       : testSendableDefaultArrowOutClass0012
     * @tc.desc       : Test SendableDefaultArrowOutClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0012';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        instance.mySet.add(123);
        expect(instance.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9100
     * @tc.name       : testSendableDefaultArrowOutClass0013
     * @tc.desc       : Test SendableDefaultArrowOutClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0013';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt8Array.fill(2);
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9200
     * @tc.name       : testSendableDefaultArrowOutClass0014
     * @tc.desc       : Test SendableDefaultArrowOutClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0014';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8Array.fill(2);
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9300
     * @tc.name       : testSendableDefaultArrowOutClass0015
     * @tc.desc       : Test SendableDefaultArrowOutClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0015';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt16Array.fill(2);
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9400
     * @tc.name       : testSendableDefaultArrowOutClass0016
     * @tc.desc       : Test SendableDefaultArrowOutClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0016';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint16Array.fill(2);
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9500
     * @tc.name       : testSendableDefaultArrowOutClass0017
     * @tc.desc       : Test SendableDefaultArrowOutClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0017';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt32Array.fill(2);
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9600
     * @tc.name       : testSendableDefaultArrowOutClass0018
     * @tc.desc       : Test SendableDefaultArrowOutClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0018';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint32Array.fill(2);
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9700
     * @tc.name       : testSendableDefaultArrowOutClass0019
     * @tc.desc       : Test SendableDefaultArrowOutClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0019';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8ClampedArray.fill(2);
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9800
     * @tc.name       : testSendableDefaultArrowOutClass0020
     * @tc.desc       : Test SendableDefaultArrowOutClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0020';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayFloat32Array.fill(2);
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9900
     * @tc.name       : testSendableDefaultArrowOutClass0021
     * @tc.desc       : Test SendableDefaultArrowOutClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0021';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        expect(instance.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10000
     * @tc.name       : testSendableDefaultArrowOutClass0022
     * @tc.desc       : Test SendableDefaultArrowOutClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0022';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        expect(instance.myConcatArray[1]).assertEqual(2);
        expect(instance.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10100
     * @tc.name       : testSendableDefaultArrowOutClass0023
     * @tc.desc       : Test SendableDefaultArrowOutClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0023';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.myBitVector.push(1);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10200
     * @tc.name       : testSendableDefaultArrowOutClass0024
     * @tc.desc       : Test SendableDefaultArrowOutClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0024';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myASON).assertEqual('object');
        expect((instance.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10300
     * @tc.name       : testSendableDefaultArrowOutClass0025
     * @tc.desc       : Test SendableDefaultArrowOutClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0025';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10400
     * @tc.name       : testSendableDefaultArrowOutClass0026
     * @tc.desc       : Test SendableDefaultArrowOutClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultArrowOutClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0026';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.mySendableUnionArray).assertEqual('number');
        expect(instance.mySendableUnionArray).assertEqual(1);
        instance.mySendableUnionArray = 2;
        expect(instance.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10500
     * @tc.name       : testSendableDefaultFuncInClass0001
     * @tc.desc       : Test SendableDefaultFuncInClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0001';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.myString = 'new string';
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10600
     * @tc.name       : testSendableDefaultFuncInClass0002
     * @tc.desc       : Test SendableDefaultFuncInClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0002';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.myNumber = 100;
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10700
     * @tc.name       : testSendableDefaultFuncInClass0003
     * @tc.desc       : Test SendableDefaultFuncInClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0003';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.myBoolean = false;
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10800
     * @tc.name       : testSendableDefaultFuncInClass0004
     * @tc.desc       : Test SendableDefaultFuncInClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0004';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.myBigInt = 987654321098765432109876543210987654321n;
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10900
     * @tc.name       : testSendableDefaultFuncInClass0005
     * @tc.desc       : Test SendableDefaultFuncInClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0005';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.myUndefined = 123;
        expect(instance.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11000
     * @tc.name       : testSendableDefaultFuncInClass0006
     * @tc.desc       : Test SendableDefaultFuncInClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0006';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.myNull = 'not null anymore';
        expect(instance.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11100
     * @tc.name       : testSendableDefaultFuncInClass0007
     * @tc.desc       : Test SendableDefaultFuncInClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0007';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        instance.topLevelClassInstance.num = 2;
        expect(instance.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11200
     * @tc.name       : testSendableDefaultFuncInClass0008
     * @tc.desc       : Test SendableDefaultFuncInClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0008';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.topLevelFunction === 'function').assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        instance.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11300
     * @tc.name       : testSendableDefaultFuncInClass0009
     * @tc.desc       : Test SendableDefaultFuncInClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0009';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        instance.myEnum = SendableConstEnum.OPTION_2;
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11400
     * @tc.name       : testSendableDefaultFuncInClass0010
     * @tc.desc       : Test SendableDefaultFuncInClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0010';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        expect(instance.myArray.toString()).assertEqual('');
        instance.myArray.push(4, 5);
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11500
     * @tc.name       : testSendableDefaultFuncInClass0011
     * @tc.desc       : Test SendableDefaultFuncInClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0011';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        instance.myMap.set(1, 2);
        expect(instance.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11600
     * @tc.name       : testSendableDefaultFuncInClass0012
     * @tc.desc       : Test SendableDefaultFuncInClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0012';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        instance.mySet.add(123);
        expect(instance.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11700
     * @tc.name       : testSendableDefaultFuncInClass0013
     * @tc.desc       : Test SendableDefaultFuncInClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0013';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt8Array.fill(2);
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11800
     * @tc.name       : testSendableDefaultFuncInClass0014
     * @tc.desc       : Test SendableDefaultFuncInClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0014';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8Array.fill(2);
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11900
     * @tc.name       : testSendableDefaultFuncInClass0015
     * @tc.desc       : Test SendableDefaultFuncInClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0015';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt16Array.fill(2);
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_12000
     * @tc.name       : testSendableDefaultFuncInClass0016
     * @tc.desc       : Test SendableDefaultFuncInClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0016';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint16Array.fill(2);
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_12100
     * @tc.name       : testSendableDefaultFuncInClass0017
     * @tc.desc       : Test SendableDefaultFuncInClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0017';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt32Array.fill(2);
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_12200
     * @tc.name       : testSendableDefaultFuncInClass0018
     * @tc.desc       : Test SendableDefaultFuncInClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0018';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint32Array.fill(2);
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_12300
     * @tc.name       : testSendableDefaultFuncInClass0019
     * @tc.desc       : Test SendableDefaultFuncInClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0019';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8ClampedArray.fill(2);
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_12400
     * @tc.name       : testSendableDefaultFuncInClass0020
     * @tc.desc       : Test SendableDefaultFuncInClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0020';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayFloat32Array.fill(2);
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_12500
     * @tc.name       : testSendableDefaultFuncInClass0021
     * @tc.desc       : Test SendableDefaultFuncInClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableDefaultFuncInClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0021';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        expect(instance.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })