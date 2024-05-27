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

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10000
   * @tc.name: testLastIndexOf0181
   * @tc.desc: The index of the last occurrence of value in buf.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testLastIndexOf0181", 0, function () {
    let buf1 = buffer.from("13236");
    let index = buf1.lastIndexOf("3", 2);
    expect(index).assertEqual(1);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10100
   * @tc.name: testLastIndexOf0183
   * @tc.desc: The index of the last occurrence of value in buf.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testLastIndexOf0183", 0, function () {
    let buf1 = buffer.from("13236235");
    let index = buf1.lastIndexOf("23");
    expect(index).assertEqual(5);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10200
   * @tc.name: testLastIndexOf0184
   * @tc.desc: The index of the last occurrence of value in buf.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testLastIndexOf0184", 0, function () {
    let buf1 = buffer.from("13236235");
    let index = buf1.lastIndexOf("23", 3);
    expect(index).assertEqual(2);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10300
   * @tc.name: testLastIndexOf0186
   * @tc.desc: The index of the last occurrence of value in buf.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testLastIndexOf0186", 0, function () {
    let buf1 = buffer.from("13236");
    let index = buf1.lastIndexOf("a");
    expect(index).assertEqual(-1);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10400
   * @tc.name: testLastIndexOf0187
   * @tc.desc: Returns true if value was found in buf, false otherwise.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testLastIndexOf0187", 0, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                      'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    let buf = buffer.from("13236");
    for (const encode of encodeArr) {
      let index = buf.lastIndexOf("ab", 0, encode);
      expect(index).assertEqual(-1);
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10500
   * @tc.name: testLastIndexOf0188
   * @tc.desc: The index of the last occurrence of value in buf.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testLastIndexOf0188", 0, function () {
    let buf1 = buffer.from("13236");
    try {
      let index = buf1.lastIndexOf(true);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "value" must be string or number, Buffer, Uint8Array. Received value is: boolean');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10600
   * @tc.name: testLastIndexOf0189
   * @tc.desc: The index of the last occurrence of value in buf.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testLastIndexOf0189", 0, function () {
    let buf1 = buffer.from("13236");
    try {
      let index = buf1.lastIndexOf("a", "code");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "encoding" must be BufferEncoding. the encoding code is unknown');
    }
  });

  /**\
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10700
   * @tc.name: testIncludes0190
   * @tc.desc: Returns true if value was found in buf, false otherwise.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIncludes0190", 0, function () {
    let buf1 = buffer.from("13236");
    let flag = buf1.includes("3");
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10800
   * @tc.name: testIncludes0191
   * @tc.desc: Returns true if value was found in buf, false otherwise.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIncludes0191", 0, function () {
    let buf1 = buffer.from("13236");
    let flag = buf1.includes("3", 2);
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10900
   * @tc.name: testIncludes0193
   * @tc.desc: Returns true if value was found in buf, false otherwise.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIncludes0193", 0, function () {
    let buf1 = buffer.from("13236");
    let flag = buf1.includes("32");
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11000
   * @tc.name: testIncludes0194
   * @tc.desc: Returns true if value was found in buf, false otherwise.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIncludes0194", 0, function () {
    let buf1 = buffer.from("13236");
    let flag = buf1.includes("32", 2);
    expect(flag).assertEqual(false);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11100
   * @tc.name: testIncludes0195
   * @tc.desc: Returns true if value was found in buf, false otherwise.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIncludes0195", 0, function () {
    let buf1 = buffer.from("测试特殊字符$#@!");
    let flag = buf1.includes("#@");
    expect(flag).assertEqual(true);
    flag = buf1.includes("测试");
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11200
   * @tc.name: testIncludes0196
   * @tc.desc: Returns true if value was found in buf, false otherwise.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIncludes0196", 0, function () {
    let buf1 = buffer.from("13236");
    let flag = buf1.includes("abc");
    expect(flag).assertEqual(false);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11300
   * @tc.name: testIncludes0197
   * @tc.desc: Returns true if value was found in buf, false otherwise.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIncludes0197", 0, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                     'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
      let buf = buffer.from("13236");
      let flag = buf.includes("abc", 0, encode);
      expect(flag).assertEqual(false);
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11400
   * @tc.name: testIncludes0198
   * @tc.desc: Returns true if value was found in buf, false otherwise.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIncludes0198", 0, function () {
    let buf1 = buffer.from("13236");
    try {
      let flag = buf1.includes(true);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "value" must be string or number, Buffer, Uint8Array. Received value is: boolean');
    }
  });
 
  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11500
   * @tc.name: testSwap160200
   * @tc.desc: Interprets buf as an array of unsigned 16-bit integers and swaps the byte order in-place.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testSwap160200", 0, function () {
    let buf1 = buffer.from("1323");
    buf1.swap16();
    let str = buf1.toString("hex");
    expect(str).assertEqual("33313332");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11600
   * @tc.name: testSwap160201
   * @tc.desc: Interprets buf as an array of unsigned 16-bit integers and swaps the byte order in-place.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testSwap160201", 0, function () {
    let buf1 = buffer.from("132");
    try {
      buf1.swap16();
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Buffer size must be a multiple of 16-bits');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11700
   * @tc.name: testSwap320210
   * @tc.desc: Interprets buf as an array of unsigned 32-bit integers and swaps the byte order in-place.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testSwap320210", 0, function () {
    let buf1 = buffer.from("1234");
    buf1.swap32();
    let str = buf1.toString();
    expect(str).assertEqual("4321");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11800
   * @tc.name: testswap320211
   * @tc.desc: Interprets buf as an array of unsigned 16-bit integers and swaps the byte order in-place.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
   it("testswap320211", 0, function () {
    let buf1 = buffer.from("132");
    try {
      buf1.swap32();
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Buffer size must be a multiple of 32-bits');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11900
   * @tc.name: testSwap640220
   * @tc.desc: Interprets buf as an array of unsigned 64-bit integers and swaps the byte order in-place.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testSwap640220", 0, function () {
    let buf1 = buffer.from("12345678");
    buf1.swap64();
    let str = buf1.toString();
    expect(str).assertEqual("87654321");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12000
   * @tc.name: testSwap640221
   * @tc.desc: Interprets buf as an array of unsigned 64-bit integers and swaps the byte order in-place.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
   it("testSwap640221", 0, function () {
    let buf1 = buffer.from("1234567");
    try {
      buf1.swap64();
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Buffer size must be a multiple of 64-bits');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12100
   * @tc.name: testKeys0230
   * @tc.desc: Creates and returns an iterator of buf keys (indices).
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testKeys0230", 0, function () {
    let buf1 = buffer.from("1234");
    let keys = buf1.keys();
    let index = 0;
    for (const key of keys) {
      expect(key).assertEqual(index);
      index++;
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12200
   * @tc.name: testKeys0235
   * @tc.desc: Creates and returns an iterator of buf keys (indices).
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testKeys0235", 0, function () {
    let uarr = new Uint8Array(4);
    uarr[0] = 0x31;
    uarr[1] = 0x32;
    uarr[2] = 0x33;
    uarr[3] = 0x34;
    let buf1 = buffer.from(uarr);
    let keys = buf1.keys();
    let index = 0;
    for (const key of keys) {
      expect(key).assertEqual(index);
      index++;
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12300
   * @tc.name: testValues0240
   * @tc.desc: Creates and returns an iterator for buf values (bytes).
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testValues0240", 0, function () {
    let buf1 = buffer.from("1234");
    let keys = buf1.values();
    let va = 49;
    for (const value of keys) {
      expect(value).assertEqual(va);
      va++;
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12400
   * @tc.name: testValues0245
   * @tc.desc: Creates and returns an iterator for buf values (bytes).
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testValues0245", 0, function () {
    let uarr = new Uint8Array(4);
    uarr[0] = 0x31;
    uarr[1] = 0x32;
    uarr[2] = 0x33;
    uarr[3] = 0x34;
    let buf1 = buffer.from(uarr);
    let keys = buf1.values();
    let va = 0x31;
    for (const value of keys) {
      expect(value).assertEqual(va);
      va++;
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12500
   * @tc.name: testEntries0250
   * @tc.desc: Creates and returns an iterator of [index, byte] pairs from the contents of buf.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testEntries0250", 0, function () {
    let buf1 = buffer.from("1234");
    let entries = buf1.entries();
    let va = 49, index = 0;
    for (const [key, value] of entries) {
      expect(key).assertEqual(index);
      expect(value).assertEqual(va);
      va++;
      index++;
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12600
   * @tc.name: testEntries0255
   * @tc.desc: Creates and returns an iterator of [index, byte] pairs from the contents of buf
   *           which is contructed from an Uint8Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testEntries0255", 0, function () {
    let uarr = new Uint8Array(4);
    uarr[0] = 0x31;
    uarr[1] = 0x32;
    uarr[2] = 0x33;
    uarr[3] = 0x34;
    let buf1 = buffer.from(uarr);
    let entries = buf1.entries();
    let va = 49, index = 0;
    for (const [key, value] of entries) {
      expect(key).assertEqual(index);
      expect(value).assertEqual(va);
      va++;
      index++;
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12700
   * @tc.name: testfrom0260
   * @tc.desc: Copies the passed buffer data onto a new Buffer instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testfrom0260", 0, function () {
    let uarr = new Uint8Array(3);
    uarr[0] = 0x12;
    uarr[1] = 0x34;
    uarr[2] = 0x56;
    let buf = buffer.from(uarr);
    let str = buf.toString("hex");
    expect(str).assertEqual("123456");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12800
   * @tc.name: testfrom0261
   * @tc.desc: Allocates a new Buffer using an array of bytes in the range 0 – 255.
   *           Array entries outside that range will be truncated to fit into it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testfrom0261", 0, function () {
    const buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
    let str = buf.toString("hex");
    expect(str).assertEqual("627566666572");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12900
   * @tc.name: testfrom0262
   * @tc.desc: This creates a view of the ArrayBuffer without copying the underlying memory.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testfrom0262", 0, function () {
    const arr = new Uint8Array(2);
    arr[0] = 97;
    arr[1] = 98;
    const buf = buffer.from(arr.buffer);
    arr[0] = 99
    buf[1] = 100
    let str = buf.toString("hex");
    expect(str).assertEqual("6364");
    expect(arr[1]).assertEqual(100);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13000
   * @tc.name: testfrom0263
   * @tc.desc: This creates a view of the ArrayBuffer without copying the underlying memory.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testfrom0263", 0, function () {
    const arr = new Uint8Array(2);
    arr[0] = 97;
    arr[1] = 98;
    const buf = buffer.from(arr.buffer, 1);
    buf[0] = 99;
    let str = buf.toString("hex");
    expect(str).assertEqual("63");
    expect(arr[1]).assertEqual(99);
    expect(buf[0]).assertEqual(99);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13100
   * @tc.name: testfrom0264
   * @tc.desc: Copies the passed buffer data onto a new Buffer instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testfrom0264", 0, function () {
    const buf1 = buffer.from('buffer');
    const buf2 = buffer.from(buf1);
    buf1[0] = 0x61;
    let str = buf1.toString();
    expect(str).assertEqual("auffer");
    str = buf2.toString();
    expect(str).assertEqual("buffer");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13200
   * @tc.name: testfrom0265
   * @tc.desc: Creates a new Buffer containing string. The encoding parameter identifies the character encoding
   *           to be used when converting string into bytes.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testfrom0265", 0, function () {
    const buf1 = buffer.from('this is a test');
    let str = buf1.toString();
    expect(str).assertEqual("this is a test");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13300
   * @tc.name: testfrom0266
   * @tc.desc: Creates a new Buffer containing string. The encoding parameter identifies the character encoding
   *           to be used when converting string into bytes.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testfrom0266", 0, function () {
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
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13400
   * @tc.name: testfrom0267
   * @tc.desc: For the object whose value returned by valueof() function is strictly equal to object
   *           or supports symbol To primitive object, a new buffer instance is created.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testfrom0267", 0, function () {
    const buf = buffer.from(new String('this is a test'));
    let str = buf.toString();
    expect(str).assertEqual("this is a test");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13500
   * @tc.name: testfrom0268
   * @tc.desc: For the object whose value returned by valueof() function is strictly equal to object
   *           or supports symbol To primitive object, a new buffer instance is created.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testfrom0268", 0, function () {
    class Foo {
      [Symbol.toPrimitive]() {
        return 'this is a test';
      }
    }
    const buf = buffer.from(new Foo(), 'utf8');
    let str = buf.toString();
    expect(str).assertEqual("this is a test");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13600
   * @tc.name: testfrom0269
   * @tc.desc: Create a new buffer containing a newline character string. Creating using base64 encoding
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testfrom0269", 0, function () {
    const str = `MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC/OgIQLaulKklB\npZltSaWwM3Cnzcmvh+LoqYFYjCePUxnoJRDusFqy4sjwBx9fn/XSxxJ9A0KxMtXa\nr7YFjwQo3FsIjLZ3+8wS+Kydcg==`;
    const buf = buffer.from(str, 'base64');
    let ref = buf.readInt8(buf.length - 1);
    expect(ref).assertEqual(114);
  });
  
  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13700
   * @tc.name: testBlobConstructor0270
   * @tc.desc: Creates a new Blob object containing a concatenation of the given sources.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testBlobConstructor0270", 0, async function () {
    let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
    let promise = blob2.text();
    promise.then((value) => {
      expect(value).assertEqual("abc");
    });
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13800
   * @tc.name: testBlobConstructor0271
   * @tc.desc: Creates a new Blob object containing a concatenation of the given sources.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testBlobConstructor0271", 0, async function () {
    let arrBuf = new ArrayBuffer(3);
    let uint8arr = new Uint8Array(arrBuf);
    uint8arr[0] = 97;
    uint8arr[1] = 98;
    uint8arr[2] = 99;
    let blob2 = new buffer.Blob([arrBuf], { type: "new type", endings: "transparent" });
    blob2.text().then((value) => {
      expect(value).assertEqual("abc");
    });
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13900
   * @tc.name: testBlobConstructor0272
   * @tc.desc: Creates a new Blob object containing a concatenation of the given sources.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testBlobConstructor0272", 0, async function () {
    let uint8arr = new Uint8Array(3);
    uint8arr[0] = 97;
    uint8arr[1] = 98;
    uint8arr[2] = 99;
    let blob2 = new buffer.Blob([uint8arr], { type: "new type", endings: "transparent" });
    blob2.text().then((value) => {
      expect(value).assertEqual("abc");
    });
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14000
   * @tc.name: testBlobConstructor0273
   * @tc.desc: Creates a new Blob object containing a concatenation of the given sources.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testBlobConstructor0273", 0, async function () {
    let arrBuf = new ArrayBuffer(3);
    let uint8arr = new Uint8Array(arrBuf);
    uint8arr[0] = 97;
    uint8arr[1] = 98;
    uint8arr[2] = 99;
    let view = new DataView(arrBuf);
    let blob2 = new buffer.Blob([view], { type: "new type", endings: "transparent" });
    blob2.text().then((value) => {
      expect(value).assertEqual("abc");
    });
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14100
   * @tc.name: testBlobConstructor0274
   * @tc.desc: Creates a new Blob object containing a concatenation of the given sources.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testBlobConstructor0274", 0, async function () {
    let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
    let blob = new buffer.Blob([blob2]);
    blob.text().then((value) => {
      expect(value).assertEqual("abc");
    });
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14200
   * @tc.name: testBlobConstructor0275
   * @tc.desc: Creates a new Blob object containing a concatenation of the given sources.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
   it("testBlobConstructor0275", 0, async function () {
    try {
      let blob = new buffer.Blob(["a", "b", "c"], 10);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "options" must be Object. Received value is: number');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14300
   * @tc.name: testBlobConstructor0276
   * @tc.desc: Creates a new Blob object containing a concatenation of the given sources.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
   it("testBlobConstructor0276", 0, async function () {
    try {
      let blob = new buffer.Blob("abc", { type: "new type", endings: "transparent" });
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "sources" must be Iterable. Received value is: string');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14400
   * @tc.name: testBlobArrayBuffer0280
   * @tc.desc: Returns a promise that fulfills with an <ArrayBuffer> containing a copy of the Blob data.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testBlobArrayBuffer0280", 0, async function () {
    let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
    blob2.arrayBuffer().then((value) => {
      let arr = new Uint8Array(value)
      for (let i = 0, len = arr.length; i < len; i++) {
        expect(arr[i]).assertEqual(97 + i);
      }
    });
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14500
   * @tc.name: testBlobText0290
   * @tc.desc: Returns a promise that fulfills with the contents of the Blob decoded as a UTF-8 string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testBlobText0290", 0, async function () {
    let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
    blob2.text().then((value) => {
      expect(value).assertEqual("abc");
    });
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14600
   * @tc.name: testBlobSlice0300
   * @tc.desc: Creates and returns a new Blob containing a subset of this Blob objects data.
   *           The original Blob is not altered.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testBlobSlice0300", 0, async function () {
    let blob2 = new buffer.Blob(["c", "b", "a"], { type: "new type", endings: "transparent" });
    let blob = blob2.slice(0, 1);
    blob.arrayBuffer().then((value) => {
      let arr = new Uint8Array(value)
      expect(arr[0]).assertEqual(99);
    });
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14700
   * @tc.name: testWriteInt32BE0310
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid signed 32-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt32BE0310", 0, function () {
    let buf = buffer.alloc(4);
    let ref = buf.writeInt32BE(0x12345678, 0);
    expect(ref).assertEqual(4);

  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14800
   * @tc.name: testWriteInt32BE0311
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid signed 32-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt32BE0311", 0, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32BE(0x12345678, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14900
   * @tc.name: testWriteInt32BE0312
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid signed 32-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt32BE0312", 0, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32BE(0x123456789, 0);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 4886718345');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15000
   * @tc.name: testWriteInt32BE0313
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid signed 32-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt32BE0313", 0, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32BE(0x12345678, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15100
   * @tc.name: testWriteInt32BE0314
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid signed 32-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
   it("testWriteInt32BE0314", 0, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32BE("string", 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The type of "value" must be number. Received value is: string');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15200
   * @tc.name: testWriteInt32LE0320
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid signed 32-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt32LE0320", 0, function () {
    let buf = buffer.alloc(4);
    let ref = buf.writeInt32LE(0x12345678, 0);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15300
   * @tc.name: testWriteInt32LE0321
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid signed 32-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt32LE0321", 0, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32LE(0x12345678, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15400
   * @tc.name: testWriteInt32LE0322
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid signed 32-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt32LE0322", 0, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32LE(0x123456789, 0);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 4886718345');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15500
   * @tc.name: testWriteInt32LE0323
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid signed 32-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt32LE0323", 0, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32LE(0x12345678, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15600
   * @tc.name: testWriteInt16BE0330
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid signed 16-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt16BE0330", 0, function () {
    let buf = buffer.alloc(2);
    let ref = buf.writeInt16BE(0x7bca, 0);
    expect(ref).assertEqual(2);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15700
   * @tc.name: testWriteInt16BE0331
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid signed 16-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt16BE0331", 0, function () {
    let buf = buffer.alloc(2);
    try {
      let ref = buf.writeInt16BE(0x7bca, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15800
   * @tc.name: testWriteInt16BE0332
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid signed 16-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt16BE0332", 0, function () {
    let buf = buffer.alloc(2);
    try {
      let ref = buf.writeInt16BE(0x123456, 0);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 1193046');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15900
   * @tc.name: testWriteInt16BE0333
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid signed 16-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt16BE0333", 0, function () {
    let buf = buffer.alloc(2);
    try {
      let ref = buf.writeInt16BE(0x7bca, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16000
   * @tc.name: testWriteInt16LE0340
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid signed 16-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt16LE0340", 0, function () {
    let buf = buffer.alloc(2);
    let ref = buf.writeInt16LE(0x1234, 0);
    expect(ref).assertEqual(2);

  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16100
   * @tc.name: testWriteInt16LE0341
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid signed 16-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt16LE0341", 0, function () {
    let buf = buffer.alloc(2);
    try {
      let ref = buf.writeInt16LE(0x7bca, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16200
   * @tc.name: testWriteInt16LE0342
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid signed 16-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt16LE0342", 0, function () {
    let buf = buffer.alloc(2);
    try {
      let ref = buf.writeInt16LE(0x123456, 0);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 1193046');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16300
   * @tc.name: testWriteInt16LE0343
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid signed 16-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt16LE0343", 0, function () {
    let buf = buffer.alloc(2);
    try {
      let ref = buf.writeInt16LE(0x1234, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16400
   * @tc.name: testWriteInt80350
   * @tc.desc: Writes value to buf at the specified offset.
   *           value must be a valid signed 8-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt80350", 0, function () {
    let buf = buffer.allocUninitializedFromPool(2);
    let ref = buf.writeInt8(2, 0);
    expect(ref).assertEqual(1);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16500
   * @tc.name: testWriteInt80351
   * @tc.desc: Writes value to buf at the specified offset.
   *           value must be a valid signed 8-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt80351", 0, function () {
    let buf = buffer.allocUninitializedFromPool(2);
    try {
      let ref = buf.writeInt8(2, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: -1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16600
   * @tc.name: testWriteInt80352
   * @tc.desc: Writes value to buf at the specified offset.value must be a valid signed 8-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt80352", 0, function () {
    let buf = buffer.allocUninitializedFromPool(2);
    try {
      let ref = buf.writeInt8(0x13245, 0);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -128 and <= 127. Received value is: 78405');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16700
   * @tc.name: testWriteInt80353
   * @tc.desc: Writes value to buf at the specified offset.value must be a valid signed 8-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteInt80353", 0, function () {
    let buf = buffer.allocUninitializedFromPool(2);
    let ref = buf.writeInt8(0x2, 1);
    expect(ref).assertEqual(2);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16800
   * @tc.name: testWriteUInt16BE0360
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid unsigned 16-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUInt16BE0360", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt16BE(0xdead, 0);
    expect(ref).assertEqual(2);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16900
   * @tc.name: testWriteUInt16BE0361
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid unsigned 16-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUInt16BE0361", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt16BE(0xdeadfc, 0);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 14593532');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17000
   * @tc.name: testWriteUInt16BE0362
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid unsigned 16-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUInt16BE0362", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt16BE(0xdead, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 2. Received value is: -1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17100
   * @tc.name: testWriteUInt16BE0363
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid unsigned 16-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUInt16BE0363", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt16BE(0xdead, 1);
    expect(ref).assertEqual(3);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17200
   * @tc.name: testWriteUInt16LE0370
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid unsigned 16-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUInt16LE0370", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt16LE(0xdead, 0);
    expect(ref).assertEqual(2);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17300
   * @tc.name: testWriteUInt16LE0371
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid unsigned 16-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUInt16LE0371", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt16LE(0xdeadfc, 0);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 14593532');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17400
   * @tc.name: testWriteUInt16LE0372
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid unsigned 16-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUInt16LE0372", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt16LE(0xdead, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 2. Received value is: -1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17500
   * @tc.name: testWriteUInt16LE0373
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid unsigned 16-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUInt16LE0373", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt16LE(0xdead, 1);
    expect(ref).assertEqual(3);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17600
   * @tc.name: testWriteUInt32BE0380
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid unsigned 32-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUInt32BE0380", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt32BE(0xfeedface, 0);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17700
   * @tc.name: testWriteUInt32BE0381
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid unsigned 32-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUInt32BE0381", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt32BE(0xfeedface, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17800
   * @tc.name: testWriteUInt32BE0382
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid unsigned 32-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUInt32BE0382", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt32BE(0xfeedface, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17900
   * @tc.name: testWriteUInt32LE0390
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid unsigned 32-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUInt32LE0390", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt32LE(0xfeedface, 0);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18000
   * @tc.name: testWriteUInt32LE0391
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid unsigned 32-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUInt32LE0391", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt32LE(0xfeedface, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18100
   * @tc.name: testWriteUInt32LE0392
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid unsigned 32-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUInt32LE0392", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt32LE(0xfeedface, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18200
   * @tc.name: testWriteUInt80400
   * @tc.desc: Writes value to buf at the specified offset. value must be a valid unsigned 8-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUInt80400", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt8(0x42, 3);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18300
   * @tc.name: testWriteUInt80401
   * @tc.desc: Writes value to buf at the specified offset. value must be a valid unsigned 8-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUInt80401", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt8(0x42, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 3. Received value is: -1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18400
   * @tc.name: testWriteUInt80402
   * @tc.desc: Writes value to buf at the specified offset. value must be a valid unsigned 8-bit integer.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUInt80402", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt8(0x42, 1);
    expect(ref).assertEqual(2);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18500
   * @tc.name: testWriteUIntBE0410
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as big-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUIntBE0410", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUIntBE(0x13141516, 0, 4);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18600
   * @tc.name: testWriteUIntBE0411
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as big-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUIntBE0411", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUIntBE(0x13141516, 0, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 320083222');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18700
   * @tc.name: testWriteUIntBE0412
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as big-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUIntBE0412", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUIntBE(0x13141516, 1, 4);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18800
   * @tc.name: testWriteUIntLE0420
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as little-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUIntLE0420", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUIntLE(0x13141516, 0, 4);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18900
   * @tc.name: testWriteUIntLE0421
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as little-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUIntLE0421", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUIntLE(0x13141516, 0, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 320083222');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19000
   * @tc.name: testWriteUIntLE0422
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as little-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUIntLE0422", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUIntLE(0x13141516, 1, 4);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19100
   * @tc.name: testWriteUIntLE0423
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as little-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteUIntLE0423", 0, function () {
    let buf = buffer.allocUninitializedFromPool(5);
    let ref = buf.writeUIntLE(0x13141516, 1, 4);
    expect(ref).assertEqual(5);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19200
   * @tc.name: testWriteIntBE0430
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as big-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteIntBE0430", 0, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    let ref = buf.writeIntBE(0x1234567890ab, 0, 6);
    expect(ref).assertEqual(6);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19300
   * @tc.name: testWriteIntBE0431
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as big-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteIntBE0431", 0, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    try {
      let ref = buf.writeIntBE(0x1234567890ab, 1, 6);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19400
   * @tc.name: testWriteIntLE0440
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as little-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteIntLE0440", 0, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    let ref = buf.writeIntLE(0x1234567890ab, 0, 6);
    expect(ref).assertEqual(6);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19500
   * @tc.name: testWriteIntLE0441
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as little-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteIntLE0441", 0, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    try {
      let ref = buf.writeIntLE(0x1234567890ab, 1, 6);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19600
   * @tc.name: testWriteDoubleBE0450
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteDoubleBE0450", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    let ref = buf.writeDoubleBE(123.456, 0);
    expect(ref).assertEqual(8);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19700
   * @tc.name: testWriteDoubleBE0451
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteDoubleBE0451", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    try {
      let ref = buf.writeDoubleBE(123.456, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19800
   * @tc.name: testWriteDoubleLE0460
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteDoubleLE0460", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    let ref = buf.writeDoubleLE(123.456, 0);
    expect(ref).assertEqual(8);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19900
   * @tc.name: testWriteDoubleLE0461
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteDoubleLE0461", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    try {
      let ref = buf.writeDoubleLE(123.456, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_20000
   * @tc.name: testWriteFloatBE0470
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteFloatBE0470", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeFloatBE(0xcabcbcbc, 0);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_20100
   * @tc.name: testWriteFloatBE0471
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteFloatBE0471", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeFloatBE(0xcabcbcbc, 5);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 5');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_20200
   * @tc.name: testWriteFloatLE0480
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteFloatLE0480", 0, function () {
    let buf = buffer.allocUninitializedFromPool(16);
    let ref = buf.writeFloatLE(0xcabcbcbc, 12);
    expect(ref).assertEqual(16);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_20300
   * @tc.name: testWriteFloatLE0481
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteFloatLE0481", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeFloatLE(0xcabcbcbc, 5);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 5');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_20400
   * @tc.name: testWriteBigInt64BE0490
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteBigInt64BE0490", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    let ref = buf.writeBigInt64BE(0x0102030405060708n, 0);
    expect(ref).assertEqual(8);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BUFFER_20500
   * @tc.name: testWriteBigInt64BE0491
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testWriteBigInt64BE0491", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    try {
      let ref = buf.writeBigInt64BE(0x0102030405060708n, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });
})}