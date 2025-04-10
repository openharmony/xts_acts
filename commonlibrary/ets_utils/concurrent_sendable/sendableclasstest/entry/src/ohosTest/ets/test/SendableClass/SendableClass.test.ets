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