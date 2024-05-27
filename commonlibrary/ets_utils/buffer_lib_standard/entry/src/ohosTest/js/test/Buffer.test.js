/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import buffer from "@ohos.buffer";
export default function BufferTest() {
describe('BufferTest', function () {

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_00100
   * @tc.name: testAlloc0010
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAlloc0010", 0, function () {
    let buf = buffer.alloc(10);
    expect(buf.length).assertEqual(10);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_00200
   * @tc.name: testAlloc0011
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAlloc0011", 0, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                     'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
      let buf = buffer.alloc(10).fill("ab$#", encode);
      expect(buf.length).assertEqual(10);
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_00300
   * @tc.name: testAlloc0012
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAlloc0012", 0, function () {
    let buf1 = buffer.alloc(10);
    let buf = buffer.alloc(10).fill(buf1);
    expect(buf.length).assertEqual(10);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_00400
   * @tc.name: testAlloc0013
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAlloc0013", 0, function () {
    let buf = buffer.alloc(0);
    expect(buf.length).assertEqual(0);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_00500
   * @tc.name: testAlloc0014
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAlloc0014", 0, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                     'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
      let buf = buffer.alloc(0).fill("ab$#", encode);
      expect(buf.length).assertEqual(0);
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_00600
   * @tc.name: testAlloc0015
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAlloc0015", 0, function () {
    let buf1 = buffer.alloc(10);
    let buf = buffer.alloc(0).fill(buf1);
    expect(buf.length).assertEqual(0);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_00700
   * @tc.name: testAlloc0016
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAlloc0016", 0, function () {
    try {
      let buf = buffer.alloc(-5);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "size" must be number and the value cannot be negative. Received value is: -5');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_00800
   * @tc.name: testAlloc0017
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
   it("testAlloc0017", 0, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                     'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
      let buf = buffer.alloc(10, "ab$#", encode);
      expect(buf.length).assertEqual(10);
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_00900
   * @tc.name: testAlloc0018
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
   it("testAlloc0018", 0, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                     'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
      let buf = buffer.alloc(0, "ab$#", encode);
      expect(buf.length).assertEqual(0);
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01000
   * @tc.name: testAlloc0019
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAlloc0019", 0, function () {
    let buf = buffer.alloc(5.5);
    expect(buf.length).assertEqual(5);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01100
   * @tc.name: testAllocUninitializedFromPool0020
   * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAllocUninitializedFromPool0020", 0, function () {
    let buf = buffer.allocUninitializedFromPool(10);
    expect(buf.length).assertEqual(10);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01200
   * @tc.name: testAllocUninitializedFromPool0021
   * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAllocUninitializedFromPool0021", 0, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                     'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
      let buf = buffer.allocUninitializedFromPool(10).fill("abcd", encode);
      expect(buf.length).assertEqual(10);
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01300
   * @tc.name: testAllocUninitializedFromPool0022
   * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAllocUninitializedFromPool0022", 0, function () {
    let buf1 = buffer.allocUninitializedFromPool(10);
    let buf = buffer.allocUninitializedFromPool(10).fill(buf1);
    expect(buf.length).assertEqual(10);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01400
   * @tc.name: testAllocUninitializedFromPool0023
   * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAllocUninitializedFromPool0023", 0, function () {
    let buf = buffer.allocUninitializedFromPool(0);
    expect(buf.length).assertEqual(0);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01500
   * @tc.name: testAllocUninitializedFromPool0024
   * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
   it("testAllocUninitializedFromPool0024", 0, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                     'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
      let buf = buffer.allocUninitializedFromPool(0).fill("abcd", encode);
      expect(buf.length).assertEqual(0);
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01600
   * @tc.name: testAllocUninitializedFromPool0025
   * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAllocUninitializedFromPool0025", 0, function () {
    let buf1 = buffer.allocUninitializedFromPool(10);
    let buf = buffer.allocUninitializedFromPool(0).fill(buf1);
    expect(buf.length).assertEqual(0);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01700
   * @tc.name: testAllocUninitializedFromPool0026
   * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAllocUninitializedFromPool0026", 0, function () {
    try {
      let buf = buffer.allocUninitializedFromPool(-5);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "size" must be number and the value cannot be negative. Received value is: -5');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01800
   * @tc.name: testAllocUninitializedFromPool0029
   * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAllocUninitializedFromPool0029", 0, function () {
    let buf = buffer.allocUninitializedFromPool(5.5);
    expect(buf.length).assertEqual(5);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01900
   * @tc.name: testByteLength0030
   * @tc.desc: Returns the byte length of a string when encoded using `encoding`.
   *           This is not the same as [`String.prototype.length`], which does not account
   *           for the encoding that is used to convert the string into bytes.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testByteLength0030", 0, function () {
    let byteLen = buffer.byteLength("abcd");
    expect(byteLen).assertEqual(4);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02000
   * @tc.name: testByteLength0031
   * @tc.desc: Returns the byte length of a string when encoded using `encoding`.
   *           This is not the same as [`String.prototype.length`], which does not account
   *           for the encoding that is used to convert the string into bytes.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testByteLength0031", 0, function () {
    let byteLen = buffer.byteLength("测试");
    expect(byteLen).assertEqual(6);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02100
   * @tc.name: testByteLength0032
   * @tc.desc: Returns the byte length of a string when encoded using `encoding`.
   *           This is not the same as [`String.prototype.length`], which does not account
   *           for the encoding that is used to convert the string into bytes.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testByteLength0032", 0, function () {
    let byteLen = buffer.byteLength("$&@*%");
    expect(byteLen).assertEqual(5);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02200
   * @tc.name: testByteLength0033
   * @tc.desc: Returns the byte length of a string when encoded using `encoding`.
   *           This is not the same as [`String.prototype.length`], which does not account
   *           for the encoding that is used to convert the string into bytes.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testByteLength0033", 0, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                     'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    let result = [4, 4, 8, 8, 4, 4, 4, 8, 8, 3, 3, 2];
    for (let i = 0, len = encodeArr.length; i< len; i++) {
      let byteLen = buffer.byteLength("abcd", encodeArr[i]);
      expect(byteLen).assertEqual(result[i]);
    }
  });

    /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02300
   * @tc.name: testByteLength0034
   * @tc.desc: Returns the byte length of a string when encoded using `encoding`.
   *           This is not the same as [`String.prototype.length`], which does not account
   *           for the encoding that is used to convert the string into bytes.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
     it("testByteLength0034", 0, function () {
      try {
        let byteLen = buffer.byteLength(10);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The type of "string" must be string or Buffer, ArrayBuffer. Received value is: number');
      }
    });
  
  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02400
   * @tc.name: testByteLength0035
   * @tc.desc: Returns the byte length of a string when encoded using `encoding`.
   *           This is not the same as [`String.prototype.length`], which does not account
   *           for the encoding that is used to convert the string into bytes.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testByteLength0035", 0, function () {
    let uintarr = new Uint8Array(2);
    uintarr[0] = 21;
    uintarr[1] = 31;
    let byteLen = buffer.byteLength(uintarr.buffer)
    expect(byteLen).assertEqual(2);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02500
   * @tc.name: testIsBuffer0040
   * @tc.desc: Returns true if obj is a Buffer, false otherwise
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIsBuffer0040", 0, function () {
    let buf = buffer.alloc(1);
    let flag = buffer.isBuffer(buf);
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02600
   * @tc.name: testIsBuffer0045
   * @tc.desc: Returns true if obj is a Buffer, false otherwise
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIsBuffer0045", 0, function () {
    let obj = new Object(1);
    let flag = buffer.isBuffer(obj);
    expect(flag).assertEqual(false);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02700
   * @tc.name: testIsEncoding0050
   * @tc.desc: Returns true if encoding is the name of a supported character encoding, or false otherwise.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIsEncoding0050", 0, function () {
    let flag = buffer.isEncoding("utf8");
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02800
   * @tc.name: testIsEncoding0053
   * @tc.desc: Returns true if encoding is the name of a supported character encoding, or false otherwise.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIsEncoding0053", 0, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                     'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
      let flag = buffer.isEncoding(encode);
      expect(flag).assertEqual(true);
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02900
   * @tc.name: testIsEncoding0056
   * @tc.desc: Returns true if encoding is the name of a supported character encoding, or false otherwise.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIsEncoding0056", 0, function () {
    let flag = buffer.isEncoding('gbk');
    expect(flag).assertEqual(false);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03000
   * @tc.name: testStaticCompare0060
   * @tc.desc: Compares buf1 to buf2.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testStaticCompare0060", 0, function () {
    let buf1 = buffer.from("1236");
    let buf2 = buffer.from("1235");
    let res = buffer.compare(buf1, buf2);
    expect(res).assertEqual(1);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03100
   * @tc.name: testStaticCompare0061
   * @tc.desc: Compares buf1 to buf2.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testStaticCompare0061", 0, function () {
    let buf1 = buffer.from("1235");
    let buf2 = buffer.from("1236");
    let res = buffer.compare(buf1, buf2);
    expect(res).assertEqual(-1);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03200
   * @tc.name: testStaticCompare0062
   * @tc.desc: Compares buf1 to buf2.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testStaticCompare0062", 0, function () {
    let buf1 = buffer.from("测试一");
    let buf2 = buffer.from("测试二");
    let res = buffer.compare(buf1, buf2);
    expect(res).assertEqual(-1);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03300
   * @tc.name: testStaticCompare0063
   * @tc.desc: Compares buf1 to buf2.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
   it("testStaticCompare0063", 0, function () {
    let buf1 = buffer.from("测试$&*");
    let buf2 = buffer.from("测试$&*");
    let res = buffer.compare(buf1, buf2);
    expect(res).assertEqual(0);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03400
   * @tc.name: testStaticCompare0064
   * @tc.desc: Compares buf1 to buf2.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testStaticCompare0064", 0, function () {
    let buf1 = buffer.from("1236");
    let buf2 = buffer.from("1236");
    let res = buffer.compare(buf1, buf2);
    expect(res).assertEqual(0);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03500
   * @tc.name: testStaticCompare0065
   * @tc.desc: Compares buf1 to buf2.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testStaticCompare0065", 0, function () {
    let buf2 = buffer.from("1236");
    try {
      let res = buffer.compare(10, buf2);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "buf1" must be Buffer or Uint8Array. Received value is: string');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03600
   * @tc.name: testStaticCompare0066
   * @tc.desc: Compares buf1 to buf2.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testStaticCompare0066", 0, function () {
    let buf1 = buffer.from("1236");
    try {
      let res = buffer.compare(buf1, 10);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "buf2" must be Buffer or Uint8Array. Received value is: string');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03700
   * @tc.name: testConcat0070
   * @tc.desc: Returns a new `Buffer` which is the result of concatenating
   *           all the `Buffer`instances in the `list` together.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testConcat0070", 0, function () {
    let buf1 = buffer.from("1236");
    let buf2 = buffer.from("1235");
    let buf = buffer.concat([buf1, buf2]);
    let str = buf.toString();
    expect(str).assertEqual("12361235");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03800
   * @tc.name: testConcat0071
   * @tc.desc: Returns a new `Buffer` which is the result of concatenating
   *           all the `Buffer`instances in the `list` together.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testConcat0071", 0, function () {
    let buf1 = buffer.from("测试");
    let buf2 = buffer.from("$&*");
    let buf = buffer.concat([buf1, buf2]);
    let str = buf.toString();
    expect(str).assertEqual("测试$&*");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03900
   * @tc.name: testConcat0072
   * @tc.desc: Returns a new `Buffer` which is the result of concatenating
   *           all the `Buffer`instances in the `list` together.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testConcat0072", 0, function () {
    try {
      let buf = buffer.concat("test string");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "list" must be Array. Received value is: string');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04000
   * @tc.name: testConcat0073
   * @tc.desc: Returns a new `Buffer` which is the result of concatenating
   *           all the `Buffer`instances in the `list` together.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
   it("testConcat0073", 0, function () {
    let buf1 = buffer.from("123$");
    let buf2 = buffer.from("*35");
    let buf3 = buffer.concat([buf1, buf2]);
    let buf = buffer.alloc(5).fill(buf3);
    let str = buf.toString();
    expect(str).assertEqual("123$*");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04100
   * @tc.name: testConcat0074
   * @tc.desc: Returns a new `Buffer` which is the result of concatenating
   *           all the `Buffer`instances in the `list` together.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testConcat0074", 0, function () {
    let buf1 = buffer.from("123$");
    let buf2 = buffer.from("*35");
    try {
      let buf = buffer.concat([buf1, buf2], -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "totalLength" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04200
   * @tc.name: testConcat0075
   * @tc.desc: Returns a new `Buffer` which is the result of concatenating
   *           all the `Buffer`instances in the `list` together.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testConcat0075", 0, function () {
    let uintarr = new Uint8Array(4);
    uintarr[0] = 0x31;
    uintarr[1] = 0x32;
    uintarr[2] = 0x33;
    uintarr[3] = 0x35;
    let buf1 = buffer.from("1236");
    let buf = buffer.concat([buf1, uintarr])
    let str = buf.toString()
    expect(str).assertEqual("12361235");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04300
   * @tc.name: testTranscode0080
   * @tc.desc: Re-encodes the given Buffer or Uint8Array instance from one character encoding to another.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testTranscode0080", 0, function () {
    let buf1 = buffer.from("1236");
    let buf = buffer.transcode(buf1, "ascii", "ucs2");
    let str = buf.toString("ucs2")
    expect(str).assertEqual("1236");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04400
   * @tc.name: testTranscode0081
   * @tc.desc: Re-encodes the given Buffer or Uint8Array instance from one character encoding to another.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testTranscode0081", 0, function () {
    let buf1 = buffer.from("测试");
    let buf = buffer.transcode(buf1, "utf8", "ucs2");
    let str = buf.toString("ucs2")
    expect(str).assertEqual("测试");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04500
   * @tc.name: testTranscode0082
   * @tc.desc: Re-encodes the given Buffer or Uint8Array instance from one character encoding to another.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
   it("testTranscode0082", 0, function () {
    try {
      let buf = buffer.transcode(10, "utf8", "ucs2");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "source" must be Buffer or Uint8Array. Received value is: number');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04600
   * @tc.name: testTranscode0083
   * @tc.desc: Re-encodes the given Buffer or Uint8Array instance from one character encoding to another.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
   it("testTranscode0083", 0, function () {
    let buf1 = buffer.from("测试");
    try {
      let buf = buffer.transcode(buf1, 0, "ucs2");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "fromEnc" must be string. Received value is: number');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04700
   * @tc.name: testTranscode0084
   * @tc.desc: Re-encodes the given Buffer or Uint8Array instance from one character encoding to another.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
   it("testTranscode0084", 0, function () {
    let buf1 = buffer.from("测试");
    try {
      let buf = buffer.transcode(buf1, "utf8", 0);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "toEnc" must be string. Received value is: number');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04800
   * @tc.name: testFill0090
   * @tc.desc: Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testFill0090", 0, function () {
    let buf = buffer.alloc(3).fill("abc");
    let str = buf.toString();
    expect(str).assertEqual("abc");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04900
   * @tc.name: testFill0091
   * @tc.desc: Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testFill0091", 0, function () {
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
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05000
   * @tc.name: testFill0092
   * @tc.desc: Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testFill0092", 0, function () {
    let buf = buffer.alloc(3).fill("$*$");
    let str = buf.toString();
    expect(str).assertEqual("$*$");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05100
   * @tc.name: testFill0093
   * @tc.desc: Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testFill0093", 0, function () {
    try {
      let buf = buffer.alloc(3).fill("$*$", -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
    }

  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05200
   * @tc.name: testFill0094
   * @tc.desc: Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testFill0094", 0, function () {
    try {
      let buf = buffer.alloc(3).fill("$*$", 0, 5);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "end" is out of range. It must be >= 0 and <= 3. Received value is: 5');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05300
   * @tc.name: testFill0095
   * @tc.desc: Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
   it("testFill0095", 0, function () {
    try {
      let buf = buffer.alloc(3).fill("$*$", 0, 2, "code");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "encoding" must be BufferEncoding. the encoding code is unknown');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05400
   * @tc.name: testWrite0100
   * @tc.desc: Writes string to buf at offset according to the character encoding in encoding.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWrite0100", 0, function () {
    let buf = buffer.alloc(5);
    let offset = buf.write("abcde", "latin1");
    expect(offset).assertEqual(5);
    let str = buf.toString();
    expect(str).assertEqual("abcde");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05500
   * @tc.name: testWrite0101
   * @tc.desc: Writes string to buf at offset according to the character encoding in encoding.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWrite0101", 0, function () {
    let buf = buffer.alloc(6);
    let offset = buf.write("测试", "utf8");
    expect(offset).assertEqual(6);
    let str = buf.toString();
    expect(str).assertEqual("测试");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05600
   * @tc.name: testWrite0102
   * @tc.desc: Writes string to buf at offset according to the character encoding in encoding.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWrite0102", 0, function () {
    let buf = buffer.alloc(8);
    let offset = buf.write("!@#$%^&*", "ascii");
    expect(offset).assertEqual(8);
    let str = buf.toString("ascii");
    expect(str).assertEqual("!@#$%^&*");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05700
   * @tc.name: testWrite0103
   * @tc.desc: Writes string to buf at offset according to the character encoding in encoding.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
   it("testWrite0103", 0, function () {
    let buf = buffer.alloc(8);
    try {
      let offset = buf.write("abcde", "utf9");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "encoding" must be BufferEncoding. the encoding utf9 is unknown');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05800
   * @tc.name: testWrite0104
   * @tc.desc: Writes string to buf at offset according to the character encoding in encoding.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWrite0104", 0, function () {
    let buf = buffer.alloc(8);
    try {
      let offset = buf.write(10);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "str" must be string. Received value is: number');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05900
   * @tc.name: testWrite0105
   * @tc.desc: Writes string to buf at offset according to the character encoding in encoding.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWrite0105", 0, function () {
    let buf = buffer.alloc(8);
    try {
      let offset = buf.write("abcde", -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 7. Received value is: -1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06000
   * @tc.name: testWrite0106
   * @tc.desc: Writes string to buf at offset according to the character encoding in encoding.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWrite0106", 0, function () {
    let buf = buffer.alloc(8);
    try {
      let offset = buf.write("abcde", 1, 9);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "length" is out of range. It must be >= 0 and <= 8. Received value is: 9');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06100
   * @tc.name: testWrite0107
   * @tc.desc: Writes string to buf at offset according to the character encoding in encoding.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWrite0107", 0, function () {
    let buf = buffer.alloc(8);
    try {
      let offset = buf.write("abcde", 1, "code");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "encoding" must be BufferEncoding. the encoding code is unknown');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06200
   * @tc.name: testCompare0110
   * @tc.desc: Compares buf with target and returns a number indicating whether buf comes before, after,
   *           or is the same as target in sort order. Comparison is based on the actual sequence of 
   *           bytes in each Buffer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testCompare0110", 0, function () {
    let buf1 = buffer.from("1236");
    let buf2 = buffer.from("1235");
    let res = buf1.compare(buf2);
    expect(res).assertEqual(1);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06300
   * @tc.name: testCompare0111
   * @tc.desc: Compares buf with target and returns a number indicating whether buf comes before, after,
   *           or is the same as target in sort order. Comparison is based on the actual sequence of 
   *           bytes in each Buffer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
   it("testCompare0111", 0, function () {
    let buf1 = buffer.from("1236");
    try {
      let res = buf1.compare(10);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "target" must be Buffer or Uint8Array. Received value is: number');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06400
   * @tc.name: testCompare0112
   * @tc.desc: Compares buf with target and returns a number indicating whether buf comes before, after,
   *           or is the same as target in sort order. Comparison is based on the actual sequence of 
   *           bytes in each Buffer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
   it("testCompare0112", 0, function () {
    let buf1 = buffer.from("1236");
    let buf2 = buffer.from("1235");
    try {
      let res = buf1.compare(buf2, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06500
   * @tc.name: testEquals0120
   * @tc.desc: Returns true if both buf and otherBuffer have exactly the same bytes, false otherwise.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testEquals0120", 0, function () {
    let buf1 = buffer.from("1236");
    let buf2 = buffer.from("1235");
    let res = buf1.equals(buf2);
    expect(res).assertEqual(false);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06600
   * @tc.name: testEquals0121
   * @tc.desc: Returns true if both buf and otherBuffer have exactly the same bytes, false otherwise.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testEquals0121", 0, function () {
    let buf1 = buffer.from("1236测试");
    let buf2 = buffer.from("1236测试");
    let res = buf1.equals(buf2);
    expect(res).assertEqual(true);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06700
   * @tc.name: testEquals0122
   * @tc.desc: Returns true if both buf and otherBuffer have exactly the same bytes, false otherwise.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testEquals0122", 0, function () {
    let buf1 = buffer.from("O@O");
    let buf2 = buffer.from("O^O");
    let res = buf1.equals(buf2);
    expect(res).assertEqual(false);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06800
   * @tc.name: testEquals0123
   * @tc.desc: Returns true if both buf and otherBuffer have exactly the same bytes, false otherwise.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testEquals0123", 0, function () {
    let buf1 = buffer.from("1236");
    try {
      let res = buf1.equals("1236");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "otherBuffer" must be Buffer or Uint8Array. Received value is: string');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06900
   * @tc.name: testSubarray0130
   * @tc.desc: Returns a new Buffer that references the same memory as the original,
   *           but offset and cropped by the start and end indices.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testSubarray0130", 0, function () {
    let buf1 = buffer.from("1236");
    let buf = buf1.subarray(0, 3);
    let str = buf.toString();
    expect(str).assertEqual("123");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07000
   * @tc.name: testSubarray0133
   * @tc.desc: Returns a new Buffer that references the same memory as the original,
   *           but offset and cropped by the start and end indices.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testSubarray0133", 0, function () {
    let buf1 = buffer.from("1236");
    let buf = buf1.subarray(3, 4);
    let str = buf.toString();
    expect(str).assertEqual("6");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07100
   * @tc.name: testSubarray0136
   * @tc.desc: Returns a new Buffer that references the same memory as the original,
   *           but offset and cropped by the start and end indices.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testSubarray0136", 0, function () {
    let buf1 = buffer.from("1236");
    let buf = buf1.subarray(-3, 0);
    expect(buf.length).assertEqual(0);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07200
   * @tc.name: testSubarray0139
   * @tc.desc: Returns a new Buffer that references the same memory as the original,
   *           but offset and cropped by the start and end indices.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testSubarray0139", 0, function () {
    let buf1 = buffer.from("1236");
    let buf = buf1.subarray(6, 9);
    expect(buf.length).assertEqual(0);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07300
   * @tc.name: testCopy0140
   * @tc.desc: Copies data from a region of buf to a region in target,
   *           even if the target memory region overlaps with buf.
   *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
   *           and the extra part will not be overwritten.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testCopy0140", 0, function () {
    let buf1 = buffer.from("1236");
    let buf2 = buffer.from("1235");
    let num = buf1.copy(buf2);
    expect(num).assertEqual(4);
    let str = buf2.toString();
    expect(str).assertEqual("1236");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07400
   * @tc.name: testCopy0141
   * @tc.desc: Copies data from a region of buf to a region in target,
   *           even if the target memory region overlaps with buf.
   *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
   *           and the extra part will not be overwritten.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testCopy0141", 0, function () {
    let buf1 = buffer.from("abcdefg");
    let buf2 = buffer.from("1235789");
    let num = buf1.copy(buf2, 2, 1, 3);
    expect(num).assertEqual(2);
    let str = buf2.toString();
    expect(str).assertEqual("12bc789");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07500
   * @tc.name: testCopy0143
   * @tc.desc: Copies data from a region of buf to a region in target,
   *           even if the target memory region overlaps with buf.
   *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
   *           and the extra part will not be overwritten.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testCopy0143", 0, function () {
    let buf1 = buffer.from("123656");
    let buf2 = buffer.from("1235");
    let num = buf1.copy(buf2);
    expect(num).assertEqual(4);
    let str = buf2.toString();
    expect(str).assertEqual("1236");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07600
   * @tc.name: testCopy0144
   * @tc.desc: Copies data from a region of buf to a region in target,
   *           even if the target memory region overlaps with buf.
   *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
   *           and the extra part will not be overwritten.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
   it("testCopy0144", 0, function () {
    let buf1 = buffer.from("123656");
    let buf2 = buffer.from("1235");
    try {
      let num = buf1.copy(buf2, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "targetStart" is out of range. It must be >= 0. Received value is: -1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07700
   * @tc.name: testCopy0145
   * @tc.desc: Copies data from a region of buf to a region in target,
   *           even if the target memory region overlaps with buf.
   *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
   *           and the extra part will not be overwritten.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testCopy0145", 0, function () {
    let buf1 = buffer.from("123656");
    try {
      let num = buf1.copy(10);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "target" must be Buffer or Uint8Array. Received value is: number');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07800
   * @tc.name: testCopy0146
   * @tc.desc: Copies data from a region of buf to a region in target,
   *           even if the target memory region overlaps with buf.
   *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
   *           and the extra part will not be overwritten.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testCopy0146", 0, function () {
    let buf1 = buffer.from("ab$#");
    let buf2 = buffer.from("123556");
    let num = buf1.copy(buf2);
    expect(num).assertEqual(4);
    let str = buf2.toString();
    expect(str).assertEqual("ab$#56");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07900
   * @tc.name: testToString0150
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testToString0150", 0, function () {
    let buf1 = buffer.from("1236");
    let str = buf1.toString();
    expect(str).assertEqual("1236");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08000
   * @tc.name: testToString0151
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testToString0151", 0, function () {
    let buf1 = buffer.from("张三");
    let str = buf1.toString();
    expect(str).assertEqual("张三");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08100
   * @tc.name: testToString0152
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testToString0152", 0, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("binary");
    expect(str).assertEqual("abc");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08200
   * @tc.name: testToString0153
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testToString0153", 0, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("ascii");
    expect(str).assertEqual("abc");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08300
   * @tc.name: testToString0154
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testToString0154", 0, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("base64");
    expect(str).assertEqual("YWJj");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08400
   * @tc.name: testToString0155
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testToString0155", 0, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("hex");
    expect(str).assertEqual("616263");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08500
   * @tc.name: testToString0156
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testToString0156", 0, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("latin1");
    expect(str).assertEqual("abc");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08600
   * @tc.name: testToString0157
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testToString0157", 0, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("ucs2");
    expect(str).assertEqual("扡");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08700
   * @tc.name: testToString0158
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testToString0158", 0, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("utf16le");
    expect(str).assertEqual("扡");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08800
   * @tc.name: testToString0159
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testToString0159", 0, function () {
    let buf1 = buffer.from("!@#$%^&*");
    let str = buf1.toString();
    expect(str).assertEqual("!@#$%^&*");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08900
   * @tc.name: testToJSON0160
   * @tc.desc: Returns a JSON representation of buf.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testToJSON0160", 0, function () {
    let buf1 = buffer.from("1236");
    let obj = buf1.toJSON();
    expect(obj.data.join("")).assertEqual("49505154");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09000
   * @tc.name: testIndexOf0170
   * @tc.desc: The index of the first occurrence of value in buf.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIndexOf0170", 0, function () {
    let buf1 = buffer.from("13236");
    let index = buf1.indexOf("3");
    expect(index).assertEqual(1);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09100
   * @tc.name: testIndexOf0171
   * @tc.desc: The index of the first occurrence of value in buf.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIndexOf0171", 0, function () {
    let buf1 = buffer.from("13236");
    let index = buf1.indexOf("3", 2);
    expect(index).assertEqual(3);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09200
   * @tc.name: testIndexOf0173
   * @tc.desc: The index of the first occurrence of value in buf.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIndexOf0173", 0, function () {
    let buf1 = buffer.from("13236235");
    let index = buf1.indexOf("23");
    expect(index).assertEqual(2);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09300
   * @tc.name: testIndexOf0174
   * @tc.desc: The index of the first occurrence of value in buf.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIndexOf0174", 0, function () {
    let buf1 = buffer.from("测试特殊字符$#@!");
    let index = buf1.indexOf("@");
    expect(index).assertEqual(20);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09400
   * @tc.name: testIndexOf0175
   * @tc.desc: The index of the first occurrence of value in buf.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIndexOf0175", 0, function () {
    let buf1 = buffer.from("13236235");
    let index = buf1.indexOf("23", 3);
    expect(index).assertEqual(5);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09500
   * @tc.name: testIndexOf0176
   * @tc.desc: The index of the first occurrence of value in buf.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIndexOf0176", 0, function () {
    let buf1 = buffer.from("13236");
    let index = buf1.indexOf("a");
    expect(index).assertEqual(-1);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09600
   * @tc.name: testIndexOf0177
   * @tc.desc: Returns true if value was found in buf, false otherwise.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
   it("testIndexOf0177", 0, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                      'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    let buf = buffer.from("13236");
    for (const encode of encodeArr) {
      let index = buf.indexOf("ab", 0, encode);
      expect(index).assertEqual(-1);
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09700
   * @tc.name: testIndexOf0178
   * @tc.desc: The index of the first occurrence of value in buf.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIndexOf0178", 0, function () {
    let buf1 = buffer.from("13236");
    try {
      let index = buf1.indexOf(true);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "value" must be string or number, Buffer, Uint8Array. Received value is: boolean');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09800
   * @tc.name: testIndexOf0179
   * @tc.desc: The index of the first occurrence of value in buf.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIndexOf0179", 0, function () {
    let buf1 = buffer.from("13236");
    try {
      let index = buf1.indexOf("a", "code");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "encoding" must be BufferEncoding. the encoding code is unknown');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09900
   * @tc.name: testLastIndexOf0180
   * @tc.desc: The index of the last occurrence of value in buf.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testLastIndexOf0180", 0, function () {
    let buf1 = buffer.from("13236");
    let index = buf1.lastIndexOf("3");
    expect(index).assertEqual(3);
  });
})}