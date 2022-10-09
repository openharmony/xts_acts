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
   * @tc.name: testAlloc0010
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * For example: buffer.alloc(10);
   * @tc.author: liuganlin
   */
  it("testAlloc0010", 0, function () {
    let buf = buffer.alloc(10);
    expect(buf.length).assertEqual(10);
  });

  /**
   * @tc.name: testAlloc0011
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * For example: buffer.alloc(10).fill(string);
   * @tc.author: liuganlin
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
   * @tc.name: testAlloc0012
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * For example: buffer.alloc(10).fill(buffer);
   * @tc.author: liuganlin
   */
  it("testAlloc0012", 0, function () {
    let buf1 = buffer.alloc(10);
    let buf = buffer.alloc(10).fill(buf1);
    expect(buf.length).assertEqual(10);
  });

  /**
   * @tc.name: testAlloc0013
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * For example: buffer.alloc(0);
   * @tc.author: liuganlin
   */
  it("testAlloc0013", 0, function () {
    let buf = buffer.alloc(0);
    expect(buf.length).assertEqual(0);
  });

  /**
   * @tc.name: testAlloc0014
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * For example: buffer.alloc(0).fill(string, encode);
   * @tc.author: liuganlin
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
   * @tc.name: testAlloc0015
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * For example: buffer.alloc(0).fill(buffer);
   * @tc.author: liuganlin
   */
  it("testAlloc0015", 0, function () {
    let buf1 = buffer.alloc(10);
    let buf = buffer.alloc(0).fill(buf1);
    expect(buf.length).assertEqual(0);
  });

  /**
   * @tc.name: testAlloc0016
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * For example: buffer.alloc(-5);
   * @tc.author: liuganlin
   */
  it("testAlloc0016", 0, function () {
    try {
      let buf = buffer.alloc(-5);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "size" is out of range');
    }
  });

  /**
   * @tc.name: testAlloc0017
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * For example: buffer.alloc(10, string, encode);
   * @tc.author: lengchangjing
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
   * @tc.name: testAlloc0018
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * For example: buffer.alloc(0).fill(string, encode);
   * @tc.author: lengchangjing
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
   * @tc.name: testAlloc0019
   * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * For example: buffer.alloc(5.5);
   * @tc.author: liuganlin
   */
  it("testAlloc0019", 0, function () {
    let buf = buffer.alloc(5.5);
    expect(buf.length).assertEqual(5);
  });

  /**
   * @tc.name: testAllocUninitializedFromPool0020
   * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * For example: buffer.allocUninitializedFromPool(10);
   * @tc.author: liuganlin
   */
  it("testAllocUninitializedFromPool0020", 0, function () {
    let buf = buffer.allocUninitializedFromPool(10);
    expect(buf.length).assertEqual(10);
  });

  /**
   * @tc.name: testAllocUninitializedFromPool0021
   * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * For example: buffer.allocUninitializedFromPool(10).fill(string, encode);
   * @tc.author: liuganlin
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
   * @tc.name: testAllocUninitializedFromPool0022
   * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * For example: buffer.allocUninitializedFromPool(10).fill(buffer);
   * @tc.author: liuganlin
   */
  it("testAllocUninitializedFromPool0022", 0, function () {
    let buf1 = buffer.allocUninitializedFromPool(10);
    let buf = buffer.allocUninitializedFromPool(10).fill(buf1);
    expect(buf.length).assertEqual(10);
  });

  /**
   * @tc.name: testAllocUninitializedFromPool0023
   * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * For example: buffer.allocUninitializedFromPool(0);
   * @tc.author: liuganlin
   */
  it("testAllocUninitializedFromPool0023", 0, function () {
    let buf = buffer.allocUninitializedFromPool(0);
    expect(buf.length).assertEqual(0);
  });

  /**
   * @tc.name: testAllocUninitializedFromPool0024
   * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * For example: buffer.allocUninitializedFromPool(0).fill(string, encode);
   * @tc.author: liuganlin
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
   * @tc.name: testAllocUninitializedFromPool0025
   * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * For example: buffer.allocUninitializedFromPool(10).fill(buffer);
   * @tc.author: liuganlin
   */
  it("testAllocUninitializedFromPool0025", 0, function () {
    let buf1 = buffer.allocUninitializedFromPool(10);
    let buf = buffer.allocUninitializedFromPool(0).fill(buf1);
    expect(buf.length).assertEqual(0);
  });

  /**
   * @tc.name: testAllocUninitializedFromPool0026
   * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * For example: buffer.allocUninitializedFromPool(-5);
   * @tc.author: liuganlin
   */
  it("testAllocUninitializedFromPool0026", 0, function () {
    try {
      let buf = buffer.allocUninitializedFromPool(-5);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "size" is out of range');
    }
  });

  /**
   * @tc.name: testAllocUninitializedFromPool0029
   * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * For example: buffer.allocUninitializedFromPool(5.5);
   * @tc.author: liuganlin
   */
  it("testAllocUninitializedFromPool0029", 0, function () {
    let buf = buffer.allocUninitializedFromPool(5.5);
    expect(buf.length).assertEqual(5);
  });

  /**
   * @tc.name: testByteLength0030
   * @tc.desc: Returns the byte length of a string when encoded using `encoding`.
   *           This is not the same as [`String.prototype.length`], which does not account
   *           for the encoding that is used to convert the string into bytes.
   * For example: buffer.byteLength("abcd");
   * @tc.author: liuganlin
   */
  it("testByteLength0030", 0, function () {
    let byteLen = buffer.byteLength("abcd");
    expect(byteLen).assertEqual(4);
  });

  /**
   * @tc.name: testByteLength0031
   * @tc.desc: Returns the byte length of a string when encoded using `encoding`.
   *           This is not the same as [`String.prototype.length`], which does not account
   *           for the encoding that is used to convert the string into bytes.
   * For example: buffer.byteLength("测试");
   * @tc.author: liuganlin
   */
  it("testByteLength0031", 0, function () {
    let byteLen = buffer.byteLength("测试");
    expect(byteLen).assertEqual(6);
  });

  /**
   * @tc.name: testByteLength0032
   * @tc.desc: Returns the byte length of a string when encoded using `encoding`.
   *           This is not the same as [`String.prototype.length`], which does not account
   *           for the encoding that is used to convert the string into bytes.
   * For example: buffer.byteLength("测试");
   * @tc.author: liuganlin
   */
  it("testByteLength0032", 0, function () {
    let byteLen = buffer.byteLength("$&@*%");
    expect(byteLen).assertEqual(5);
  });

  /**
   * @tc.name: testByteLength0032
   * @tc.desc: Returns the byte length of a string when encoded using `encoding`.
   *           This is not the same as [`String.prototype.length`], which does not account
   *           for the encoding that is used to convert the string into bytes.
   * For example: buffer.byteLength(string, encode);
   * @tc.author: liuganlin
   */
  it("testByteLength0032", 0, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                     'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    let result = [4, 4, 8, 8, 4, 4, 4, 8, 8, 3, 3, 2];
    for (let i = 0, len = encodeArr.length; i< len; i++) {
      let byteLen = buffer.byteLength("abcd", encodeArr[i]);
      expect(byteLen).assertEqual(result[i]);
    }
  });
  
  /**
   * @tc.name: testByteLength0035
   * @tc.desc: Returns the byte length of a string when encoded using `encoding`.
   *           This is not the same as [`String.prototype.length`], which does not account
   *           for the encoding that is used to convert the string into bytes.
   * For example: buffer.byteLength(arrayBuffer);
   * @tc.author: liuganlin
   */
  it("testByteLength0035", 0, function () {
    let uintarr = new Uint8Array(2);
    uintarr[0] = 21;
    uintarr[1] = 31;
    let byteLen = buffer.byteLength(uintarr.buffer)
    expect(byteLen).assertEqual(2);
  });

  /**
   * @tc.name: testIsBuffer0040
   * @tc.desc: Returns true if obj is a Buffer, false otherwise
   * For example: buffer.isBuffer(buf);
   * @tc.author: liuganlin
   */
  it("testIsBuffer0040", 0, function () {
    let buf = buffer.alloc(1);
    let flag = buffer.isBuffer(buf);
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.name: testIsBuffer0045
   * @tc.desc: Returns true if obj is a Buffer, false otherwise
   * For example: buffer.isBuffer(buf);
   * @tc.author: liuganlin
   */
  it("testIsBuffer0045", 0, function () {
    let obj = new Object(1);
    let flag = buffer.isBuffer(obj);
    expect(flag).assertEqual(false);
  });

  /**
   * @tc.name: testIsEncoding0050
   * @tc.desc: Returns true if encoding is the name of a supported character encoding, or false otherwise.
   * For example: buffer.isEncoding("utf8");
   * @tc.author: liuganlin
   */
  it("testIsEncoding0050", 0, function () {
    let flag = buffer.isEncoding("utf8");
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.name: testIsEncoding0053
   * @tc.desc: Returns true if encoding is the name of a supported character encoding, or false otherwise.
   * For example: buffer.isEncoding(encode);
   * @tc.author: liuganlin
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
   * @tc.name: testIsEncoding0056
   * @tc.desc: Returns true if encoding is the name of a supported character encoding, or false otherwise.
   * For example: buffer.isEncoding("gbk");
   * @tc.author: liuganlin
   */
  it("testIsEncoding0056", 0, function () {
    let flag = buffer.isEncoding('gbk');
    expect(flag).assertEqual(false);
  });

  /**
   * @tc.name: testStaticCompare0060
   * @tc.desc: Compares buf1 to buf2.
   * For example: let buf1 = buffer.from("1236");
   *              let buf2 = buffer.from("1235");
   *              let res = buffer.compare(buf1, buf2);
   * @tc.author: liuganlin
   */
  it("testStaticCompare0060", 0, function () {
    let buf1 = buffer.from("1236");
    let buf2 = buffer.from("1235");
    let res = buffer.compare(buf1, buf2);
    expect(res).assertEqual(1);
  });

  /**
   * @tc.name: testStaticCompare0061
   * @tc.desc: Compares buf1 to buf2.
   * For example: let buf1 = buffer.from("1236");
   *              let buf2 = buffer.from("1235");
   *              let res = buffer.compare(buf1, buf2);
   * @tc.author: liuganlin
   */
  it("testStaticCompare0061", 0, function () {
    let buf1 = buffer.from("1235");
    let buf2 = buffer.from("1236");
    let res = buffer.compare(buf1, buf2);
    expect(res).assertEqual(-1);
  });

  /**
   * @tc.name: testStaticCompare0062
   * @tc.desc: Compares buf1 to buf2.
   * For example: let buf1 = buffer.from("测试一");
   *              let buf2 = buffer.from("测试二");
   *              let res = buffer.compare(buf1, buf2);
   * @tc.author: liuganlin
   */
  it("testStaticCompare0062", 0, function () {
    let buf1 = buffer.from("测试一");
    let buf2 = buffer.from("测试二");
    let res = buffer.compare(buf1, buf2);
    expect(res).assertEqual(-1);
  });

  /**
   * @tc.name: testStaticCompare0063
   * @tc.desc: Compares buf1 to buf2.
   * For example: let buf1 = buffer.from("测试$&*");
   *              let buf2 = buffer.from("测试$&*");
   *              let res = buffer.compare(buf1, buf2);
   * @tc.author: liuganlin
   */
   it("testStaticCompare0063", 0, function () {
    let buf1 = buffer.from("测试$&*");
    let buf2 = buffer.from("测试$&*");
    let res = buffer.compare(buf1, buf2);
    expect(res).assertEqual(0);
  });

  /**
   * @tc.name: testStaticCompare0060
   * @tc.desc: Compares buf1 to buf2.
   * For example: let buf1 = buffer.from("1236");
   *              let buf2 = buffer.from("1236");
   *              let res = buffer.compare(buf1, buf2);
   * @tc.author: liuganlin
   */
  it("testStaticCompare0065", 0, function () {
    let buf1 = buffer.from("1236");
    let buf2 = buffer.from("1236");
    let res = buffer.compare(buf1, buf2);
    expect(res).assertEqual(0);
  });

  /**
   * @tc.name: testConcat0070
   * @tc.desc: Returns a new `Buffer` which is the result of concatenating
   *           all the `Buffer`instances in the `list` together.
   * For example: let buf1 = buffer.from("1236");
   *              let buf2 = buffer.from("1235");
   *              let buf = buffer.concat([buf1, buf2]);
   * @tc.author: liuganlin
   */
  it("testConcat0070", 0, function () {
    let buf1 = buffer.from("1236");
    let buf2 = buffer.from("1235");
    let buf = buffer.concat([buf1, buf2]);
    let str = buf.toString();
    expect(str).assertEqual("12361235");
  });

  /**
   * @tc.name: testConcat0071
   * @tc.desc: Returns a new `Buffer` which is the result of concatenating
   *           all the `Buffer`instances in the `list` together.
   * For example: let buf1 = buffer.from("测试");
   *              let buf2 = buffer.from("$&*");
   *              let buf = buffer.concat([buf1, buf2]);
   * @tc.author: liuganlin
   */
  it("testConcat0071", 0, function () {
    let buf1 = buffer.from("测试");
    let buf2 = buffer.from("$&*");
    let buf = buffer.concat([buf1, buf2]);
    let str = buf.toString();
    expect(str).assertEqual("测试$&*");
  });

  /**
   * @tc.name: testConcat0073
   * @tc.desc: Returns a new `Buffer` which is the result of concatenating
   *           all the `Buffer`instances in the `list` together.
   * For example: let buf1 = buffer.from("123$");
   *              let buf2 = buffer.from("*35");
   *              let buf = buffer.concat([buf1, buf2]);
   * @tc.author: liuganlin
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
   * @tc.name: testConcat0075
   * @tc.desc: Returns a new `Buffer` which is the result of concatenating
   *           all the `Buffer`instances in the `list` together.
   * For example: let buf1 = buffer.from("1236");
   *              let buf2 = buffer.from("1235");
   *              let buf = buffer.concat([buf1, buf2]);
   * @tc.author: liuganlin
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
   * @tc.name: testTranscode0080
   * @tc.desc: Re-encodes the given Buffer or Uint8Array instance from one character encoding to another.
   * For example: buffer.transcode(buf1, "ascii", "ucs2");
   * @tc.author: liuganlin
   */
  it("testTranscode0080", 0, function () {
    let buf1 = buffer.from("1236");
    let buf = buffer.transcode(buf1, "ascii", "ucs2");
    let str = buf.toString("ucs2")
    expect(str).assertEqual("1236");
  });

  /**
   * @tc.name: testTranscode0081
   * @tc.desc: Re-encodes the given Buffer or Uint8Array instance from one character encoding to another.
   * For example: buffer.transcode(buf1, "ascii", "ucs2");
   * @tc.author: liuganlin
   */
  it("testTranscode0081", 0, function () {
    let buf1 = buffer.from("测试");
    let buf = buffer.transcode(buf1, "utf8", "ucs2");
    let str = buf.toString("ucs2")
    expect(str).assertEqual("测试");
  });

  /**
   * @tc.name: testFill0090
   * @tc.desc: Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
   * For example: buffer.alloc(3).fill("abc");
   * @tc.author: liuganlin
   */
  it("testFill0090", 0, function () {
    let buf = buffer.alloc(3).fill("abc");
    let str = buf.toString();
    expect(str).assertEqual("abc");
  });

  /**
   * @tc.name: testFill0091
   * @tc.desc: Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
   * For example: buffer.alloc(10).fill('F1刘FG', 0, 10, 'hex');
   * @tc.author: liuganlin
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
   * @tc.name: testFill0092
   * @tc.desc: Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
   * For example: buffer.alloc(3).fill("abc");
   * @tc.author: liuganlin
   */
  it("testFill0092", 0, function () {
    let buf = buffer.alloc(3).fill("$*$");
    let str = buf.toString();
    expect(str).assertEqual("$*$");
  });

  /**
   * @tc.name: testWrite0100
   * @tc.desc: Writes string to buf at offset according to the character encoding in encoding.
   * For example: buf.write("abcde", "latin1");
   * @tc.author: liuganlin
   */
  it("testWrite0100", 0, function () {
    let buf = buffer.alloc(5);
    let offset = buf.write("abcde", "latin1");
    expect(offset).assertEqual(5);
    let str = buf.toString();
    expect(str).assertEqual("abcde");
  });

  /**
   * @tc.name: testWrite0101
   * @tc.desc: Writes string to buf at offset according to the character encoding in encoding.
   * For example: buf.write("abcde", "latin1");
   * @tc.author: liuganlin
   */
  it("testWrite0101", 0, function () {
    let buf = buffer.alloc(6);
    let offset = buf.write("测试", "utf8");
    expect(offset).assertEqual(6);
    let str = buf.toString();
    expect(str).assertEqual("测试");
  });

  /**
   * @tc.name: testWrite0102
   * @tc.desc: Writes string to buf at offset according to the character encoding in encoding.
   * For example: buf.write("abcde", "latin1");
   * @tc.author: liuganlin
   */
  it("testWrite0102", 0, function () {
    let buf = buffer.alloc(8);
    let offset = buf.write("!@#$%^&*", "ascii");
    expect(offset).assertEqual(8);
    let str = buf.toString("ascii");
    expect(str).assertEqual("!@#$%^&*");
  });

  /**
   * @tc.name: testCompare0110
   * @tc.desc: Compares buf with target and returns a number indicating whether buf comes before, after,
   *           or is the same as target in sort order. Comparison is based on the actual sequence of 
   *           bytes in each Buffer.
   * For example: buf1.compare(buf2);
   * @tc.author: liuganlin
   */
  it("testCompare0110", 0, function () {
    let buf1 = buffer.from("1236");
    let buf2 = buffer.from("1235");
    let res = buf1.compare(buf2);
    expect(res).assertEqual(1);
  });

  /**
   * @tc.name: testEquals0120
   * @tc.desc: Returns true if both buf and otherBuffer have exactly the same bytes, false otherwise.
   * For example: buf1.equals(buf2);
   * @tc.author: liuganlin
   */
  it("testEquals0120", 0, function () {
    let buf1 = buffer.from("1236");
    let buf2 = buffer.from("1235");
    let res = buf1.equals(buf2);
    expect(res).assertEqual(false);
  });

  /**
   * @tc.name: testEquals0121
   * @tc.desc: Returns true if both buf and otherBuffer have exactly the same bytes, false otherwise.
   * For example: buf1.equals(buf2);
   * @tc.author: liuganlin
   */
  it("testEquals0121", 0, function () {
    let buf1 = buffer.from("1236测试");
    let buf2 = buffer.from("1236测试");
    let res = buf1.equals(buf2);
    expect(res).assertEqual(true);
  });

  /**
   * @tc.name: testEquals0122
   * @tc.desc: Returns true if both buf and otherBuffer have exactly the same bytes, false otherwise.
   * For example: buf1.equals(buf2);
   * @tc.author: liuganlin
   */
  it("testEquals0122", 0, function () {
    let buf1 = buffer.from("O@O");
    let buf2 = buffer.from("O^O");
    let res = buf1.equals(buf2);
    expect(res).assertEqual(false);
  });

  /**
   * @tc.name: testSubarray0130
   * @tc.desc: Returns a new Buffer that references the same memory as the original,
   *           but offset and cropped by the start and end indices.
   * For example: buf1.subarray(0, 3);
   * @tc.author: liuganlin
   */
  it("testSubarray0130", 0, function () {
    let buf1 = buffer.from("1236");
    let buf = buf1.subarray(0, 3);
    let str = buf.toString();
    expect(str).assertEqual("123");
  });

  /**
   * @tc.name: testSubarray0133
   * @tc.desc: Returns a new Buffer that references the same memory as the original,
   *           but offset and cropped by the start and end indices.
   * For example: buf1.subarray(3, 4);
   * @tc.author: liuganlin
   */
  it("testSubarray0133", 0, function () {
    let buf1 = buffer.from("1236");
    let buf = buf1.subarray(3, 4);
    let str = buf.toString();
    expect(str).assertEqual("6");
  });

  /**
   * @tc.name: testSubarray0136
   * @tc.desc: Returns a new Buffer that references the same memory as the original,
   *           but offset and cropped by the start and end indices.
   * For example: buf1.subarray(-3, 0);
   * @tc.author: liuganlin
   */
  it("testSubarray0136", 0, function () {
    let buf1 = buffer.from("1236");
    let buf = buf1.subarray(-3, 0);
    expect(buf.length).assertEqual(0);
  });

  /**
   * @tc.name: testSubarray0139
   * @tc.desc: Returns a new Buffer that references the same memory as the original,
   *           but offset and cropped by the start and end indices.
   * For example: buf1.subarray(6, 9);
   * @tc.author: liuganlin
   */
  it("testSubarray0139", 0, function () {
    let buf1 = buffer.from("1236");
    let buf = buf1.subarray(6, 9);
    expect(buf.length).assertEqual(0);
  });

  /**
   * @tc.name: testCopy0140
   * @tc.desc: Copies data from a region of buf to a region in target,
   *           even if the target memory region overlaps with buf.
   *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
   *           and the extra part will not be overwritten.
   * For example: buf1.copy(buf2);
   * @tc.author: liuganlin
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
   * @tc.name: testCopy0141
   * @tc.desc: Copies data from a region of buf to a region in target,
   *           even if the target memory region overlaps with buf.
   *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
   *           and the extra part will not be overwritten.
   * For example: buf1.copy(buf2, targetStart, sourceStart, sourceEnd);
   * @tc.author: liuganlin
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
   * @tc.name: testCopy0143
   * @tc.desc: Copies data from a region of buf to a region in target,
   *           even if the target memory region overlaps with buf.
   *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
   *           and the extra part will not be overwritten.
   * For example: buf1.copy(buf2);
   * @tc.author: liuganlin
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
   * @tc.name: testCopy0146
   * @tc.desc: Copies data from a region of buf to a region in target,
   *           even if the target memory region overlaps with buf.
   *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
   *           and the extra part will not be overwritten.
   * For example: buf1.copy(buf2);
   * @tc.author: liuganlin
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
   * @tc.name: testToString0150
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * For example: buf1.toString();
   * @tc.author: liuganlin
   */
  it("testToString0150", 0, function () {
    let buf1 = buffer.from("1236");
    let str = buf1.toString();
    expect(str).assertEqual("1236");
  });

  /**
   * @tc.name: testToString0151
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * For example: buf1.toString();
   * @tc.author: liuganlin
   */
  it("testToString0151", 0, function () {
    let buf1 = buffer.from("张三");
    let str = buf1.toString();
    expect(str).assertEqual("张三");
  });

  /**
   * @tc.name: testToString0152
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * For example: buf1.toString("binary");
   * @tc.author: liuganlin
   */
  it("testToString0152", 0, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("binary");
    expect(str).assertEqual("abc");
  });

  /**
   * @tc.name: testToString0153
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * For example: buf1.toString("binary");
   * @tc.author: liuganlin
   */
  it("testToString0153", 0, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("ascii");
    expect(str).assertEqual("abc");
  });

  /**
   * @tc.name: testToString0154
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * For example: buf1.toString("base64");
   * @tc.author: liuganlin
   */
  it("testToString0154", 0, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("base64");
    expect(str).assertEqual("YWJj");
  });

  /**
   * @tc.name: testToString0155
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * For example: buf1.toString("hex");
   * @tc.author: liuganlin
   */
  it("testToString0155", 0, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("hex");
    expect(str).assertEqual("616263");
  });

  /**
   * @tc.name: testToString0156
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * For example: buf1.toString("latin1");
   * @tc.author: liuganlin
   */
  it("testToString0156", 0, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("latin1");
    expect(str).assertEqual("abc");
  });

  /**
   * @tc.name: testToString0157
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * For example: buf1.toString("ucs2");
   * @tc.author: liuganlin
   */
  it("testToString0157", 0, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("ucs2");
    expect(str).assertEqual("扡");
  });

  /**
   * @tc.name: testToString0158
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * For example: buf1.toString("utf16le");
   * @tc.author: liuganlin
   */
  it("testToString0158", 0, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("utf16le");
    expect(str).assertEqual("扡");
  });

  /**
   * @tc.name: testToString0159
   * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
   * For example: buf1.toString();
   * @tc.author: liuganlin
   */
  it("testToString0159", 0, function () {
    let buf1 = buffer.from("!@#$%^&*");
    let str = buf1.toString();
    expect(str).assertEqual("!@#$%^&*");
  });

  /**
   * @tc.name: testToJSON0160
   * @tc.desc: Returns a JSON representation of buf.
   * For example: buf1.toJSON();
   * @tc.author: liuganlin
   */
  it("testToJSON0160", 0, function () {
    let buf1 = buffer.from("1236");
    let obj = buf1.toJSON();
    expect(obj.data.join("")).assertEqual("49505154");
  });

  /**
   * @tc.name: testIndexOf0170
   * @tc.desc: The index of the first occurrence of value in buf.
   * For example: let buf1 = buffer.from("13236"); buf1.indexOf("3");
   * @tc.author: liuganlin
   */
  it("testIndexOf0170", 0, function () {
    let buf1 = buffer.from("13236");
    let index = buf1.indexOf("3");
    expect(index).assertEqual(1);
  });

  /**
   * @tc.name: testIndexOf0171
   * @tc.desc: The index of the first occurrence of value in buf.
   * For example: let buf1 = buffer.from("13236");
   *              buf1.indexOf("3", 2);
   * @tc.author: liuganlin
   */
  it("testIndexOf0171", 0, function () {
    let buf1 = buffer.from("13236");
    let index = buf1.indexOf("3", 2);
    expect(index).assertEqual(3);
  });

  /**
    * @tc.name: testIndexOf0173
    * @tc.desc: The index of the first occurrence of value in buf.
    * For example: let index = buf1.indexOf(value);
    * @tc.author: liuganlin
    */
  it("testIndexOf0173", 0, function () {
    let buf1 = buffer.from("13236235");
    let index = buf1.indexOf("23");
    expect(index).assertEqual(2);
  });

  /**
    * @tc.name: testIndexOf0174
    * @tc.desc: The index of the first occurrence of value in buf.
    * For example: let index = buf1.indexOf(value);
    * @tc.author: liuganlin
    */
  it("testIndexOf0174", 0, function () {
    let buf1 = buffer.from("测试特殊字符$#@!");
    let index = buf1.indexOf("@");
    expect(index).assertEqual(20);
  });

  /**
    * @tc.name: testIndexOf0175
    * @tc.desc: The index of the first occurrence of value in buf.
    * For example: let index = buf1.indexOf(value, byteOffset);
    * @tc.author: liuganlin
    */
  it("testIndexOf0175", 0, function () {
    let buf1 = buffer.from("13236235");
    let index = buf1.indexOf("23", 3);
    expect(index).assertEqual(5);
  });

  /**
   * @tc.name: testIndexOf0176
   * @tc.desc: The index of the first occurrence of value in buf.
   * For example: let buf1 = buffer.from("13236"); buf1.indexOf("a");
   * @tc.author: liuganlin
   */
  it("testIndexOf0176", 0, function () {
    let buf1 = buffer.from("13236");
    let index = buf1.indexOf("a");
    expect(index).assertEqual(-1);
  });

  /**
   * @tc.name: testIndexOf0177
   * @tc.desc: Returns true if value was found in buf, false otherwise.
   * For example: let buf = buffer.from("13236"); buf.indexOf("a", 0, "utf8");
   * @tc.author: lengchangjing
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
   * @tc.name: testLastIndexOf0180
   * @tc.desc: The index of the last occurrence of value in buf.
   * For example: let buf1 = buffer.from("13236"); buf1.lastIndexOf("3");
   * @tc.author: liuganlin
   */
  it("testLastIndexOf0180", 0, function () {
    let buf1 = buffer.from("13236");
    let index = buf1.lastIndexOf("3");
    expect(index).assertEqual(3);
  });

  /**
   * @tc.name: testLastIndexOf0181
   * @tc.desc: The index of the last occurrence of value in buf.
   * For example: let buf1 = buffer.from("13236"); buf1.lastIndexOf("3", 2);
   * @tc.author: liuganlin
   */
  it("testLastIndexOf0181", 0, function () {
    let buf1 = buffer.from("13236");
    let index = buf1.lastIndexOf("3", 2);
    expect(index).assertEqual(1);
  });

  /**
   * @tc.name: testLastIndexOf0183
   * @tc.desc: The index of the last occurrence of value in buf.
   * For example: let buf1 = buffer.from("13236235"); buf1.lastIndexOf("23");
   * @tc.author: liuganlin
   */
  it("testLastIndexOf0183", 0, function () {
    let buf1 = buffer.from("13236235");
    let index = buf1.lastIndexOf("23");
    expect(index).assertEqual(5);
  });

  /**
   * @tc.name: testLastIndexOf0184
   * @tc.desc: The index of the last occurrence of value in buf.
   * For example: let buf1 = buffer.from("13236235"); buf1.lastIndexOf("23", 3);
   * @tc.author: liuganlin
   */
  it("testLastIndexOf0184", 0, function () {
    let buf1 = buffer.from("13236235");
    let index = buf1.lastIndexOf("23", 3);
    expect(index).assertEqual(2);
  });

  /**
   * @tc.name: testLastIndexOf0186
   * @tc.desc: The index of the last occurrence of value in buf.
   * For example: let buf1 = buffer.from("13236"); buf1.lastIndexOf("a");
   * @tc.author: liuganlin
   */
  it("testLastIndexOf0186", 0, function () {
    let buf1 = buffer.from("13236");
    let index = buf1.lastIndexOf("a");
    expect(index).assertEqual(-1);
  });

  /**
   * @tc.name: testLastIndexOf0187
   * @tc.desc: Returns true if value was found in buf, false otherwise.
   * For example: let buf = buffer.from("13236"); buf.lastIndexOf("a", 0, "utf8");
   * @tc.author: lengchangjing
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
   * @tc.name: testIncludes0190
   * @tc.desc: Returns true if value was found in buf, false otherwise.
   * For example: let buf1 = buffer.from("13236"); buf1.includes("3");
   * @tc.author: liuganlin
   */
  it("testIncludes0190", 0, function () {
    let buf1 = buffer.from("13236");
    let flag = buf1.includes("3");
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.name: testIncludes0191
   * @tc.desc: Returns true if value was found in buf, false otherwise.
   * For example: let buf1 = buffer.from("13236"); buf1.includes("3", 2);
   * @tc.author: liuganlin
   */
  it("testIncludes0191", 0, function () {
    let buf1 = buffer.from("13236");
    let flag = buf1.includes("3", 2);
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.name: testIncludes0193
   * @tc.desc: Returns true if value was found in buf, false otherwise.
   * For example: let buf1 = buffer.from("13236"); buf1.includes("32");
   * @tc.author: liuganlin
   */
  it("testIncludes0193", 0, function () {
    let buf1 = buffer.from("13236");
    let flag = buf1.includes("32");
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.name: testIncludes0194
   * @tc.desc: Returns true if value was found in buf, false otherwise.
   * For example: let buf1 = buffer.from("13236"); buf1.includes("32", 2);
   * @tc.author: liuganlin
   */
  it("testIncludes0194", 0, function () {
    let buf1 = buffer.from("13236");
    let flag = buf1.includes("32", 2);
    expect(flag).assertEqual(false);
  });

  /**
   * @tc.name: testIncludes0194
   * @tc.desc: Returns true if value was found in buf, false otherwise.
   * For example: let buf1 = buffer.from("13236"); buf1.includes("32");
   * @tc.author: liuganlin
   */
  it("testIncludes0194", 0, function () {
    let buf1 = buffer.from("测试特殊字符$#@!");
    let flag = buf1.includes("#@");
    expect(flag).assertEqual(true);
    flag = buf1.includes("测试");
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.name: testIncludes0196
   * @tc.desc: Returns true if value was found in buf, false otherwise.
   * For example: let buf1 = buffer.from("13236"); buf1.includes("abc");
   * @tc.author: liuganlin
   */
  it("testIncludes0196", 0, function () {
    let buf1 = buffer.from("13236");
    let flag = buf1.includes("abc");
    expect(flag).assertEqual(false);
  });

  /**
   * @tc.name: testIncludes0197
   * @tc.desc: Returns true if value was found in buf, false otherwise.
   * For example: let buf1 = buffer.from("13236"); buf1.includes("abc", 0, "utf8");
   * @tc.author: lengchangjing
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
   * @tc.name: testSwap160200
   * @tc.desc: Interprets buf as an array of unsigned 16-bit integers and swaps the byte order in-place.
   * For example: buf1.swap16();
   * @tc.author: liuganlin
   */
  it("testSwap160200", 0, function () {
    let buf1 = buffer.from("1323");
    buf1.swap16();
    let str = buf1.toString("hex");
    expect(str).assertEqual("33313332");
  });

  /**
   * @tc.name: testSwap320210
   * @tc.desc: Interprets buf as an array of unsigned 32-bit integers and swaps the byte order in-place.
   * For example: buf1.swap32();
   * @tc.author: liuganlin
   */
  it("testSwap320210", 0, function () {
    let buf1 = buffer.from("1234");
    buf1.swap32();
    let str = buf1.toString();
    expect(str).assertEqual("4321");
  });

  /**
   * @tc.name: testSwap640220
   * @tc.desc: Interprets buf as an array of unsigned 64-bit integers and swaps the byte order in-place.
   * For example: buf1.swap64();
   * @tc.author: liuganlin
   */
  it("testSwap640220", 0, function () {
    let buf1 = buffer.from("12345678");
    buf1.swap64();
    let str = buf1.toString();
    expect(str).assertEqual("87654321");
  });

  /**
   * @tc.name: testKeys0230
   * @tc.desc: Creates and returns an iterator of buf keys (indices).
   * For example: buf1.keys();
   * @tc.author: liuganlin
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
   * @tc.name: testKeys0235
   * @tc.desc: Creates and returns an iterator of buf keys (indices).
   * For example: buf1.keys();
   * @tc.author: liuganlin
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
   * @tc.name: testValues0240
   * @tc.desc: Creates and returns an iterator for buf values (bytes).
   * For example: buf1.values();
   * @tc.author: liuganlin
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
   * @tc.name: testValues0245
   * @tc.desc: Creates and returns an iterator for buf values (bytes).
   * For example: buf1.values();
   * @tc.author: liuganlin
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
   * @tc.name: testEntries0250
   * @tc.desc: Creates and returns an iterator of [index, byte] pairs from the contents of buf.
   * For example: buf1.entries();
   * @tc.author: liuganlin
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
   * @tc.name: testEntries0255
   * @tc.desc: Creates and returns an iterator of [index, byte] pairs from the contents of buf
   *           which is contructed from an Uint8Array.
   * For example: buf1.entries();
   * @tc.author: liuganlin
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
   * @tc.name: testfrom0260
   * @tc.desc: Copies the passed buffer data onto a new Buffer instance.
   * For example: buffer.from(uint8Array);
   * @tc.author: liuganlin
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
   * @tc.name: testfrom0261
   * @tc.desc: Allocates a new Buffer using an array of bytes in the range 0 – 255.
   *           Array entries outside that range will be truncated to fit into it.
   * For example: buffer.from(array);
   * @tc.author: liuganlin
   */
  it("testfrom0261", 0, function () {
    const buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
    let str = buf.toString("hex");
    expect(str).assertEqual("627566666572");
  });

  /**
   * @tc.name: testfrom0262
   * @tc.desc: This creates a view of the ArrayBuffer without copying the underlying memory.
   * For example: buffer.from(arrayBuffer);
   * @tc.author: liuganlin
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
   * @tc.name: testfrom0263
   * @tc.desc: This creates a view of the ArrayBuffer without copying the underlying memory.
   * For example: buffer.from(arrayBuffer, byteOffset);
   * @tc.author: liuganlin
   */
  it("testfrom0263", 0, function () {
    const arr = new Uint8Array(2);
    arr[0] = 97;
    arr[1] = 98;
    const buf = buffer.from(arr.buffer, 1);
    buf[0] = 99;
    buf[1] = 100;
    let str = buf.toString("hex");
    expect(str).assertEqual("63");
    expect(arr[1]).assertEqual(99);
    expect(buf[0]).assertEqual(99);
    expect(buf[1]).assertEqual(undefined);
  });

  /**
   * @tc.name: testfrom0264
   * @tc.desc: Copies the passed buffer data onto a new Buffer instance.
   * For example: buffer2.from(buffer1);
   * @tc.author: liuganlin
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
   * @tc.name: testfrom0265
   * @tc.desc: Creates a new Buffer containing string. The encoding parameter identifies the character encoding
   *           to be used when converting string into bytes.
   * For example: buffer.from(string);
   * @tc.author: liuganlin
   */
  it("testfrom0265", 0, function () {
    const buf1 = buffer.from('this is a test');
    let str = buf1.toString();
    expect(str).assertEqual("this is a test");
  });

  /**
   * @tc.name: testfrom0266
   * @tc.desc: Creates a new Buffer containing string. The encoding parameter identifies the character encoding
   *           to be used when converting string into bytes.
   * For example: buffer.from(string, encoding);
   * @tc.author: liuganlin
   */
  it("testfrom0266", 0, function () {
    const buf1 = buffer.from('F1刘FG', 'hex');
    let str = buf1.toString('hex');
    expect(str).assertEqual("f1");

    let buf2 = buffer.from("F1FG刘", "ascii")
    str = buf2.toString("ascii");
    expect(str).assertEqual("F1FGe");

    let buf3 = buffer.from("F1FG刘", "base64")
    str = buf3.toString("base64");
    expect(str).assertEqual("F1FG");

    let buf4 = buffer.from("F1FG刘", "base64url")
    str = buf4.toString("base64url");
    expect(str).assertEqual("F1FG");

    let buf5 = buffer.from("F1FG刘", "binary")
    str = buf5.toString("binary");
    expect(str).assertEqual("F1FGå");

    let buf6 = buffer.from("F1FG刘", "latin1")
    str = buf6.toString("latin1");
    expect(str).assertEqual("F1FGe");

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
  });

  /**
   * @tc.name: testfrom0267
   * @tc.desc: For the object whose value returned by valueof() function is strictly equal to object
   *           or supports symbol To primitive object, a new buffer instance is created.
   * For example: buffer.from(object);
   * @tc.author: liuganlin
   */
  it("testfrom0267", 0, function () {
    const buf = buffer.from(new String('this is a test'));
    let str = buf.toString();
    expect(str).assertEqual("this is a test");
  });

  /**
   * @tc.name: testfrom0268
   * @tc.desc: For the object whose value returned by valueof() function is strictly equal to object
   *           or supports symbol To primitive object, a new buffer instance is created.
   * For example: buffer.from(object);
   * @tc.author: liuganlin
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
   * @tc.name: testBlobConstructor0270
   * @tc.desc: Creates a new Blob object containing a concatenation of the given sources.
   * For example: let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
   * @tc.author: liuganlin
   */
  it("testBlobConstructor0270", 0, async function () {
    let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
    let promise = blob2.text();
    promise.then((value) => {
      expect(value).assertEqual("abc");
    });
  });

  /**
   * @tc.name: testBlobConstructor0271
   * @tc.desc: Creates a new Blob object containing a concatenation of the given sources.
   * For example: let blob2 = new buffer.Blob([arrBuf], { type: "new type", endings: "transparent" });
   * @tc.author: liuganlin
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
   * @tc.name: testBlobConstructor0272
   * @tc.desc: Creates a new Blob object containing a concatenation of the given sources.
   * For example: let blob2 = new buffer.Blob([uint8arr], { type: "new type", endings: "transparent" })
   * @tc.author: liuganlin
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
   * @tc.name: testBlobConstructor0273
   * @tc.desc: Creates a new Blob object containing a concatenation of the given sources.
   * For example: let blob2 = new buffer.Blob([view], { type: "new type", endings: "transparent" })
   * @tc.author: liuganlin
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
   * @tc.name: testBlobConstructor0274
   * @tc.desc: Creates a new Blob object containing a concatenation of the given sources.
   * For example: let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
   *              let blob = new buffer.Blob([blob2]);
   * @tc.author: liuganlin
   */
  it("testBlobConstructor0274", 0, async function () {
    let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
    let blob = new buffer.Blob([blob2]);
    blob.text().then((value) => {
      expect(value).assertEqual("abc");
    });
  });

  /**
   * @tc.name: testBlobArrayBuffer0280
   * @tc.desc: Returns a promise that fulfills with an <ArrayBuffer> containing a copy of the Blob data.
   * For example: let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
   * @tc.author: liuganlin
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
   * @tc.name: testBlobText0290
   * @tc.desc: Returns a promise that fulfills with the contents of the Blob decoded as a UTF-8 string.
   * For example: let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
   * @tc.author: liuganlin
   */
  it("testBlobText0290", 0, async function () {
    let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
    blob2.text().then((value) => {
      expect(value).assertEqual("abc");
    });
  });

  /**
   * @tc.name: testBlobSlice0300
   * @tc.desc: Creates and returns a new Blob containing a subset of this Blob objects data.
   *           The original Blob is not altered.
   * For example: let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
   *              let blob = blob2.slice(0, 1);
   * @tc.author: liuganlin
   */
  it("testBlobSlice0300", 0, async function () {
    let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
    let blob = blob2.slice(0, 1);
    blob.arrayBuffer().then((value) => {
      let arr = new Uint8Array(value)
      expect(arr[0]).assertEqual(97);
      expect(arr[1]).assertEqual(98);
      expect(arr[2]).assertEqual(99);
    });
  });

  /**
   * @tc.name: testWriteInt32BE0310
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid signed 32-bit integer.
   * For example: let ref = buf.writeInt32BE(0x12345678, 0);
   * @tc.author: liuganlin
   */
  it("testWriteInt32BE0310", 0, function () {
    let buf = buffer.alloc(4);
    let ref = buf.writeInt32BE(0x12345678, 0);
    expect(ref).assertEqual(4);

  });

  /**
   * @tc.name: testWriteInt32BE0311
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid signed 32-bit integer.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteInt32BE0311", 0, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32BE(0x12345678, -1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }

  });

  /**
   * @tc.name: testWriteInt32BE0312
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid signed 32-bit integer.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteInt32BE0312", 0, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32BE(0x123456789, 0);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "value" is out of range');
    }
  });

  /**
   * @tc.name: testWriteInt32BE0313
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid signed 32-bit integer.
   * For example: let ref = buf.writeInt32BE(0x12345678, 1);
   * @tc.author: liuganlin
   */
  it("testWriteInt32BE0313", 0, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32BE(0x12345678, 1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteInt32LE0320
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid signed 32-bit integer.
   * For example: let ref = buf.writeInt32LE(0x12345678, 0);
   * @tc.author: liuganlin
   */
  it("testWriteInt32LE0320", 0, function () {
    let buf = buffer.alloc(4);
    let ref = buf.writeInt32LE(0x12345678, 0);
    expect(ref).assertEqual(4);

  });

  /**
   * @tc.name: testWriteInt32LE0321
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid signed 32-bit integer.
   * For example: let ref = buf.writeInt32LE(0x12345678, -1);
   * @tc.author: liuganlin
   */
  it("testWriteInt32LE0321", 0, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32LE(0x12345678, -1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteInt32LE0322
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid signed 32-bit integer.
   * For example: let ref = buf.writeInt32LE(0x12345678, 0);
   * @tc.author: liuganlin
   */
  it("testWriteInt32LE0322", 0, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32LE(0x123456789, 0);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "value" is out of range');
    }
  });

  /**
   * @tc.name: testWriteInt32LE0323
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid signed 32-bit integer.
   * For example: let ref = buf.writeInt32LE(0x12345678, 1);
   * @tc.author: liuganlin
   */
  it("testWriteInt32LE0323", 0, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32LE(0x12345678, 1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteInt16BE0330
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid signed 16-bit integer.
   * For example: let ref = buf.writeInt32LE(0x12345678, 0);
   * @tc.author: liuganlin
   */
  it("testWriteInt16BE0330", 0, function () {
    let buf = buffer.alloc(2);
    let ref = buf.writeInt16BE(0x7bca, 0);
    expect(ref).assertEqual(2);
  });

  /**
   * @tc.name: testWriteInt16BE0331
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid signed 16-bit integer.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteInt16BE0331", 0, function () {
    let buf = buffer.alloc(2);
    try {
      let ref = buf.writeInt16BE(0x7bca, -1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteInt16BE0332
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid signed 16-bit integer.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteInt16BE0332", 0, function () {
    let buf = buffer.alloc(2);
    try {
      let ref = buf.writeInt16BE(0x123456, 0);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "value" is out of range');
    }
  });

  /**
   * @tc.name: testWriteInt16BE0333
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid signed 16-bit integer.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteInt16BE0333", 0, function () {
    let buf = buffer.alloc(2);
    try {
      let ref = buf.writeInt16BE(0x7bca, 1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteInt16LE0340
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid signed 16-bit integer.
   * For example: let ref = buf.writeInt16LE(0x1234, 0);
   * @tc.author: liuganlin
   */
  it("testWriteInt16LE0340", 0, function () {
    let buf = buffer.alloc(2);
    let ref = buf.writeInt16LE(0x1234, 0);
    expect(ref).assertEqual(2);

  });

  /**
   * @tc.name: testWriteInt16LE0341
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid signed 16-bit integer.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteInt16LE0341", 0, function () {
    let buf = buffer.alloc(2);
    try {
      let ref = buf.writeInt16LE(0x7bca, -1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteInt16LE0342
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid signed 16-bit integer.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteInt16LE0342", 0, function () {
    let buf = buffer.alloc(2);
    try {
      let ref = buf.writeInt16LE(0x123456, 0);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "value" is out of range');
    }
  });

  /**
   * @tc.name: testWriteInt16LE0343
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid signed 16-bit integer.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteInt16LE0343", 0, function () {
    let buf = buffer.alloc(2);
    try {
      let ref = buf.writeInt16LE(0x1234, 1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteInt80350
   * @tc.desc: Writes value to buf at the specified offset.
   *           value must be a valid signed 8-bit integer.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteInt80350", 0, function () {
    let buf = buffer.allocUninitializedFromPool(2);
    let ref = buf.writeInt8(2, 0);
    expect(ref).assertEqual(1);
  });

  /**
   * @tc.name: testWriteInt80351
   * @tc.desc: Writes value to buf at the specified offset.
   *           value must be a valid signed 8-bit integer.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteInt80351", 0, function () {
    let buf = buffer.allocUninitializedFromPool(2);
    try {
      let ref = buf.writeInt8(2, -1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteInt80352
   * @tc.desc: Writes value to buf at the specified offset.value must be a valid signed 8-bit integer.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteInt80352", 0, function () {
    let buf = buffer.allocUninitializedFromPool(2);
    try {
      let ref = buf.writeInt8(0x13245, 0);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "value" is out of range');
    }
  });

  /**
   * @tc.name: testWriteInt80353
   * @tc.desc: Writes value to buf at the specified offset.value must be a valid signed 8-bit integer.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteInt80353", 0, function () {
    let buf = buffer.allocUninitializedFromPool(2);
    let ref = buf.writeInt8(0x2, 1);
    expect(ref).assertEqual(2);
  });

  /**
   * @tc.name: testWriteUInt16BE0360
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid unsigned 16-bit integer.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteUInt16BE0360", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt16BE(0xdead, 0);
    expect(ref).assertEqual(2);
  });

  /**
   * @tc.name: testWriteUInt16BE0361
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid unsigned 16-bit integer.
   * For example: let ref = buf.writeUInt16BE(0xdeadfc, 0);
   * @tc.author: liuganlin
   */
  it("testWriteUInt16BE0361", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt16BE(0xdeadfc, 0);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "value" is out of range');
    }
  });

  /**
   * @tc.name: testWriteUInt16BE0362
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid unsigned 16-bit integer.
   * For example: let ref = buf.writeUInt16BE(0xdead, -1);
   * @tc.author: liuganlin
   */
  it("testWriteUInt16BE0362", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt16BE(0xdead, -1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteUInt16BE0363
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid unsigned 16-bit integer.
   * For example: let ref = buf.writeUInt16LE(0xdead, 1);
   * @tc.author: liuganlin
   */
  it("testWriteUInt16BE0363", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt16BE(0xdead, 1);
    expect(ref).assertEqual(3);
  });

  /**
   * @tc.name: testWriteUInt16LE0370
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid unsigned 16-bit integer.
   * For example: let ref = buf.writeUInt16LE(0xdead, 0);
   * @tc.author: liuganlin
   */
  it("testWriteUInt16LE0370", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt16LE(0xdead, 0);
    expect(ref).assertEqual(2);
  });

  /**
   * @tc.name: testWriteUInt16LE0371
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid unsigned 16-bit integer.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteUInt16LE0371", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt16LE(0xdeadfc, 0);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "value" is out of range');
    }
  });

  /**
   * @tc.name: testWriteUInt16LE0372
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid unsigned 16-bit integer.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteUInt16LE0372", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt16LE(0xdead, -1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteUInt16LE0373
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid unsigned 16-bit integer.
   * For example: let ref = buf.writeUInt16LE(0xdead, 0);
   * @tc.author: liuganlin
   */
  it("testWriteUInt16LE0373", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt16LE(0xdead, 1);
    expect(ref).assertEqual(3);
  });

  /**
   * @tc.name: testWriteUInt32BE0380
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid unsigned 32-bit integer.
   * For example: let ref = buf.writeUInt32BE(0xfeedface, 0);
   * @tc.author: liuganlin
   */
  it("testWriteUInt32BE0380", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt32BE(0xfeedface, 0);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.name: testWriteUInt32BE0381
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid unsigned 32-bit integer.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteUInt32BE0381", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt32BE(0xfeedface, -1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteUInt32BE0382
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   *           The value must be a valid unsigned 32-bit integer.
   * For example: let ref = buf.writeUInt32BE(0xfeedface, 1);
   * @tc.author: liuganlin
   */
  it("testWriteUInt32BE0382", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt32BE(0xfeedface, 1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteUInt32LE0390
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid unsigned 32-bit integer.
   * For example: let ref = buf.writeUInt32LE(0xfeedface, 0);
   * @tc.author: liuganlin
   */
  it("testWriteUInt32LE0390", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt32LE(0xfeedface, 0);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.name: testWriteUInt32LE0391
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid unsigned 32-bit integer.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteUInt32LE0391", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt32LE(0xfeedface, -1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteUInt32LE0392
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   *           The value must be a valid unsigned 32-bit integer.
   * For example: let ref = buf.writeUInt32LE(0xfeedface, 1);
   * @tc.author: liuganlin
   */
  it("testWriteUInt32LE0392", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt32LE(0xfeedface, 1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteUInt80400
   * @tc.desc: Writes value to buf at the specified offset. value must be a valid unsigned 8-bit integer.
   * For example: let ref = buf.writeUInt8(0x42, 3);
   * @tc.author: liuganlin
   */
  it("testWriteUInt80400", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt8(0x42, 3);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.name: testWriteUInt80401
   * @tc.desc: Writes value to buf at the specified offset. value must be a valid unsigned 8-bit integer.
   * For example: let ref = buf.writeUInt8(0x42, -1);
   * @tc.author: liuganlin
   */
  it("testWriteUInt80401", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt8(0x42, -1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteUInt80402
   * @tc.desc: Writes value to buf at the specified offset. value must be a valid unsigned 8-bit integer.
   * For example: let ref = buf.writeUInt8(0x42, 1);
   * @tc.author: liuganlin
   */
  it("testWriteUInt80402", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt8(0x42, 1);
    expect(ref).assertEqual(2);
  });

  /**
   * @tc.name: testWriteUIntBE0410
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as big-endian.
   * For example: let ref = buf.writeUInt8(0x42, 3);
   * @tc.author: liuganlin
   */
  it("testWriteUIntBE0410", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUIntBE(0x13141516, 0, 4);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.name: testWriteUIntBE0411
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as big-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteUIntBE0411", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUIntBE(0x13141516, 0, 1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "value" is out of range');
    }
  });

  /**
   * @tc.name: testWriteUIntBE0412
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as big-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteUIntBE0412", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUIntBE(0x13141516, 1, 4);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteUIntLE0420
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as little-endian.
   * For example: let ref = buf.writeUIntLE(0x13141516, 0, 4);
   * @tc.author: liuganlin
   */
  it("testWriteUIntLE0420", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUIntLE(0x13141516, 0, 4);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.name: testWriteUIntLE0421
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as little-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteUIntLE0421", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUIntLE(0x13141516, 0, 1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "value" is out of range');
    }
  });

  /**
   * @tc.name: testWriteUIntLE0422
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as little-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteUIntLE0422", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUIntLE(0x13141516, 1, 4);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteUIntLE0423
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as little-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteUIntLE0423", 0, function () {
    let buf = buffer.allocUninitializedFromPool(5);
    let ref = buf.writeUIntLE(0x13141516, 1, 4);
    expect(ref).assertEqual(5);
  });

  /**
   * @tc.name: testWriteIntBE0430
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as big-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteIntBE0430", 0, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    let ref = buf.writeIntBE(0x1234567890ab, 0, 6);
    expect(ref).assertEqual(6);
  });

  /**
   * @tc.name: testWriteIntBE0431
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as big-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteIntBE0431", 0, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    try {
      let ref = buf.writeIntBE(0x1234567890ab, 1, 6);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteIntLE0440
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as little-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteIntLE0440", 0, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    let ref = buf.writeIntLE(0x1234567890ab, 0, 6);
    expect(ref).assertEqual(6);
  });

  /**
   * @tc.name: testWriteIntLE0441
   * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as little-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteIntLE0441", 0, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    try {
      let ref = buf.writeIntLE(0x1234567890ab, 1, 6);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteDoubleBE0450
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteDoubleBE0450", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    let ref = buf.writeDoubleBE(123.456, 0);
    expect(ref).assertEqual(8);
  });

  /**
   * @tc.name: testWriteDoubleBE0451
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteDoubleBE0451", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    try {
      let ref = buf.writeDoubleBE(123.456, 1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteDoubleLE0460
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteDoubleLE0460", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    let ref = buf.writeDoubleLE(123.456, 0);
    expect(ref).assertEqual(8);
  });

  /**
   * @tc.name: testWriteDoubleLE0461
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteDoubleLE0461", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    try {
      let ref = buf.writeDoubleLE(123.456, 1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteFloatBE0470
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteFloatBE0470", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeFloatBE(0xcabcbcbc, 0);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.name: testWriteFloatBE0471
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteFloatBE0471", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeFloatBE(0xcabcbcbc, 5);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteFloatLE0480
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteFloatLE0480", 0, function () {
    let buf = buffer.allocUninitializedFromPool(16);
    let ref = buf.writeFloatLE(0xcabcbcbc, 12);
    expect(ref).assertEqual(16);
  });

  /**
   * @tc.name: testWriteFloatLE0481
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteFloatLE0481", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeFloatLE(0xcabcbcbc, 5);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteBigInt64BE0490
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteBigInt64BE0490", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    let ref = buf.writeBigInt64BE(0x0102030405060708n, 0);
    expect(ref).assertEqual(8);
  });

  /**
   * @tc.name: testWriteBigInt64BE0491
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteBigInt64BE0491", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    try {
      let ref = buf.writeBigInt64BE(0x0102030405060708n, 1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteBigInt64LE0500
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteBigInt64LE0500", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    let ref = buf.writeBigInt64LE(0x0102030405060708n, 0);
    expect(ref).assertEqual(8);
  });

  /**
   * @tc.name: testWriteBigInt64LE0501
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteBigInt64LE0501", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    try {
      let ref = buf.writeBigInt64LE(0x0102030405060708n, 1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteBigUInt64BE0510
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteBigUInt64BE0510", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    let ref = buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
    expect(ref).assertEqual(8);
  });

  /**
   * @tc.name: testWriteBigUInt64BE0511
   * @tc.desc: Writes value to buf at the specified offset as big-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteBigUInt64BE0511", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    try {
      let ref = buf.writeBigUInt64BE(0xdecafafecacefaden, 1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testWriteBigUInt64LE0520
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteBigUInt64LE0520", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    let ref = buf.writeBigUInt64LE(0xdecafafecacefaden, 0);
    expect(ref).assertEqual(8);
  });

  /**
   * @tc.name: testWriteBigUInt64LE0521
   * @tc.desc: Writes value to buf at the specified offset as little-endian.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testWriteBigUInt64LE0521", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    try {
      let ref = buf.writeBigUInt64LE(0xdecafafecacefaden, 1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadInt32BE0530
   * @tc.desc: Reads a signed, big-endian 32-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadInt32BE0530", 0, function () {
    let buf = buffer.alloc(4);
    buf.writeInt32BE(0x12345678, 0);
    let ref = buf.readInt32BE(0).toString(16);
    expect(ref).assertEqual("12345678");
  });

  /**
   * @tc.name: testReadInt32BE0531
   * @tc.desc: Reads a signed, big-endian 32-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadInt32BE0531", 0, function () {
    let buf = buffer.alloc(4);
    buf.writeInt32BE(0x12345678, 0);
    try {
      let ref = buf.readInt32BE(1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadInt32LE0540
   * @tc.desc: Reads a signed, little-endian 32-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadInt32LE0540", 0, function () {
    let buf = buffer.alloc(4);
    buf.writeInt32BE(0x12345678, 0);
    let ref = buf.readInt32LE(0).toString(16);
    expect(ref).assertEqual("78563412");
  });

  /**
   * @tc.name: testReadInt32LE0541
   * @tc.desc: Reads a signed, little-endian 32-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadInt32LE0541", 0, function () {
    let buf = buffer.alloc(4);
    buf.writeInt32BE(0x12345678, 0);
    try {
      let ref = buf.readInt32LE(1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadInt16BE0550
   * @tc.desc: Reads a signed, big-endian 16-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadInt16BE0550", 0, function () {
    let buf = buffer.alloc(2);
    buf.writeInt16BE(0x1234, 0);
    let ref = buf.readInt16BE(0).toString(16);
    expect(ref).assertEqual("1234");
  });

  /**
   * @tc.name: testReadInt16BE0551
   * @tc.desc: Reads a signed, big-endian 16-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadInt16BE0551", 0, function () {
    let buf = buffer.alloc(2);
    buf.writeInt16BE(0x1234, 0);
    try {
      let ref = buf.readInt16BE(1).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadInt16LE0560
   * @tc.desc: Reads a signed, little-endian 16-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadInt16LE0560", 0, function () {
    let buf = buffer.alloc(2);
    buf.writeInt16BE(0x1234, 0);
    let ref = buf.readInt16LE(0).toString(16);
    expect(ref).assertEqual("3412");
  });

  /**
   * @tc.name: testReadInt16LE0561
   * @tc.desc: Reads a signed, little-endian 16-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadInt16LE0561", 0, function () {
    let buf = buffer.alloc(2);
    buf.writeInt16BE(0x1234, 0);
    try {
      let ref = buf.readInt16LE(1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadInt80570
   * @tc.desc: Reads a signed 8-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadInt80570", 0, function () {
    let buf = buffer.allocUninitializedFromPool(2);
    buf.writeInt8(0x12);
    let ref = buf.readInt8(0).toString(16);
    expect(ref).assertEqual("12");
  });

  /**
   * @tc.name: testReadInt80571
   * @tc.desc: Reads a signed 8-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadInt80571", 0, function () {
    let buf = buffer.allocUninitializedFromPool(2);
    buf.writeInt8(0x12);
    try {
      let ref = buf.readInt8(2).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadUInt16BE0580
   * @tc.desc: Reads an unsigned, big-endian 16-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadUInt16BE0580", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt16BE(0x1234, 0);
    let ref = buf.readUInt16BE(0).toString(16);
    expect(ref).assertEqual("1234");
  });

  /**
   * @tc.name: testReadUInt16BE0581
   * @tc.desc: Reads an unsigned, big-endian 16-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadUInt16BE0581", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt16BE(0x1234, 0);
    try {
      let ref = buf.readUInt16BE(3).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadUInt16LE0590
   * @tc.desc: Reads an unsigned, little-endian 16-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadUInt16LE0590", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt16LE(0x1234, 0);
    let ref = buf.readUInt16LE(0).toString(16);
    expect(ref).assertEqual("1234");
  });

  /**
   * @tc.name: testReadUInt16LE0591
   * @tc.desc: Reads an unsigned, little-endian 16-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadUInt16LE0591", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt16LE(0x1234, 0);
    try {
      let ref = buf.readUInt16LE(3).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadUInt32BE0600
   * @tc.desc: Reads an unsigned, big-endian 32-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadUInt32BE0600", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt32BE(0x12345678, 0);
    let ref = buf.readUInt32BE(0).toString(16);
    expect(ref).assertEqual("12345678");
  });

  /**
   * @tc.name: testReadUInt32BE0601
   * @tc.desc: Reads an unsigned, big-endian 32-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadUInt32BE0601", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt32BE(0x12345678, 0);
    try {
      let ref = buf.readUInt32BE(1).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadUInt32LE0610
   * @tc.desc: Reads an unsigned, little-endian 32-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadUInt32LE0610", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt32LE(0x12345678, 0);
    let ref = buf.readUInt32LE(0).toString(16);
    expect(ref).assertEqual("12345678");
  });

  /**
   * @tc.name: testReadUInt32LE0611
   * @tc.desc: Reads an unsigned, little-endian 32-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadUInt32LE0611", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt32LE(0x12345678, 0);
    try {
      let ref = buf.readUInt32LE(1).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadUInt80620
   * @tc.desc: Reads an unsigned 8-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadUInt80620", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt8(0x42);
    let ref = buf.readUInt8(0).toString(16);
    expect(ref).assertEqual("42");
  });

  /**
   * @tc.name: testReadUInt80621
   * @tc.desc: Reads an unsigned 8-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadUInt80621", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt8(0x42);
    try {
      let ref = buf.readUInt8(4).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadUIntBE0630
   * @tc.desc: Reads an unsigned 8-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadUIntBE0630", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUIntBE(0x13141516, 0, 4);
    let ref = buf.readUIntBE(0, 3).toString(16);
    expect(ref).assertEqual("131415");
  });

  /**
   * @tc.name: testReadUIntBE0631
   * @tc.desc: Reads an unsigned 8-bit integer from buf at the specified offset.
   * For example: 
   * @tc.author: liuganlin
   */
  it("testReadUIntBE0631", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUIntBE(0x13141516, 0, 4);
    try {
      let ref = buf.readUIntBE(2, 3).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadUIntLE0640
   * @tc.desc: Reads byteLength number of bytes from buf at the specified offset and interprets
   *           the result as an unsigned, little-endian integer supporting up to 48 bits of accuracy.
   * @tc.author: liuganlin
   */
  it("testReadUIntLE0640", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUIntLE(0x13141516, 0, 4);
    let ref = buf.readUIntLE(0, 3).toString(16);
    expect(ref).assertEqual("141516");
  });

  /**
   * @tc.name: testReadUIntLE0641
   * @tc.desc: Reads byteLength number of bytes from buf at the specified offset and interprets
   *           the result as an unsigned, little-endian integer supporting up to 48 bits of accuracy.
   * @tc.author: liuganlin
   */
  it("testReadUIntLE0641", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUIntLE(0x13141516, 0, 4);
    try {
      let ref = buf.readUIntLE(2, 3).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadIntBE0650
   * @tc.desc: Reads byteLength number of bytes from buf at the specified offset and interprets
   *           the result as a big-endian, two's complement signed value supporting up to 48 bits of accuracy.
   * @tc.author: liuganlin
   */
  it("testReadIntBE0650", 0, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    buf.writeIntBE(0x123456789011, 0, 6);
    let ref = buf.readIntBE(0, 5).toString(16);
    expect(ref).assertEqual("1234567890");
  });

  /**
   * @tc.name: testReadIntBE0651
   * @tc.desc: Reads byteLength number of bytes from buf at the specified offset and interprets
   *           the result as a big-endian, two's complement signed value supporting up to 48 bits of accuracy.
   * @tc.author: liuganlin
   */
  it("testReadIntBE0651", 0, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    buf.writeIntBE(0x123456789011, 0, 6);
    try {
      let ref = buf.readIntBE(2, 5).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadIntLE0660
   * @tc.desc: Reads byteLength number of bytes from buf at the specified offset and interprets
   *           the result as a little-endian, two's complement signed value supporting up to 48 bits of accuracy.
   * @tc.author: liuganlin
   */
  it("testReadIntLE0660", 0, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    buf.writeIntLE(0x123456789011, 0, 6);
    let ref = buf.readIntLE(0, 5).toString(16);
    expect(ref).assertEqual("3456789011");
  });

  /**
   * @tc.name: testReadIntLE0661
   * @tc.desc: Reads byteLength number of bytes from buf at the specified offset and interprets
   *           the result as a little-endian, two's complement signed value supporting up to 48 bits of accuracy.
   * @tc.author: liuganlin
   */
  it("testReadIntLE0661", 0, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    buf.writeIntLE(0x123456789011, 0, 6);
    try {
      let ref = buf.readIntLE(2, 5).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadDoubleBE0670
   * @tc.desc: Reads a 64-bit, big-endian double from buf at the specified offset.
   * @tc.author: liuganlin
   */
  it("testReadDoubleBE0670", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeDoubleBE(123.456, 0);
    let ref = buf.readDoubleBE();
    expect(ref).assertEqual(123.456);
  });

  /**
   * @tc.name: testReadDoubleBE0671
   * @tc.desc: Reads a 64-bit, big-endian double from buf at the specified offset.
   * @tc.author: liuganlin
   */
  it("testReadDoubleBE0671", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeDoubleBE(123.456, 0);
    try {
      let ref = buf.readDoubleBE(1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadDoubleLE0680
   * @tc.desc: Reads a 64-bit, little-endian double from buf at the specified offset.
   * @tc.author: liuganlin
   */
  it("testReadDoubleLE0680", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeDoubleLE(123.456, 0);
    let ref = buf.readDoubleLE();
    expect(ref).assertEqual(123.456);
  });

  /**
   * @tc.name: testReadDoubleLE0681
   * @tc.desc: Reads a 64-bit, little-endian double from buf at the specified offset.
   * @tc.author: liuganlin
   */
  it("testReadDoubleLE0681", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeDoubleLE(123.456, 0);
    try {
      let ref = buf.readDoubleLE(1);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadFloatBE0690
   * @tc.desc: Reads a 32-bit, big-endian float from buf at the specified offset.
   * @tc.author: liuganlin
   */
  it("testReadFloatBE0690", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeFloatBE(0xcabcbcbc, 0);
    let ref = buf.readFloatBE(0).toString(16);
    expect(ref).assertEqual("cabcbd00");
  });

  /**
   * @tc.name: testReadFloatBE0691
   * @tc.desc: Reads a 32-bit, big-endian float from buf at the specified offset.
   * @tc.author: liuganlin
   */
  it("testReadFloatBE0691", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeFloatBE(0xcabcbcbc, 0);
    try {
      let ref = buf.readFloatBE(1).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadFloatLE0700
   * @tc.desc: Reads a 32-bit, little-endian float from buf at the specified offset.
   * @tc.author: liuganlin
   */
  it("testReadFloatLE0700", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeFloatLE(0xcabcbcbc, 0);
    let ref = buf.readFloatLE(0).toString(16);
    expect(ref).assertEqual("cabcbd00");
  });

  /**
   * @tc.name: testReadFloatLE0701
   * @tc.desc: Reads a 32-bit, little-endian float from buf at the specified offset.
   * @tc.author: liuganlin
   */
  it("testReadFloatLE0701", 0, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeFloatLE(0xcabcbcbc, 0);
    try {
      let ref = buf.readFloatLE(1).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadBigInt64BE0710
   * @tc.desc: Reads a signed, big-endian 64-bit integer from buf at the specified offset.
   * @tc.author: liuganlin
   */
  it("testReadBigInt64BE0710", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigInt64BE(0x0102030405060708n, 0);
    let ref = buf.readBigInt64BE(0).toString(16);
    expect(ref).assertEqual("102030405060708");
  });

  /**
   * @tc.name: testReadBigInt64BE0711
   * @tc.desc: Reads a signed, big-endian 64-bit integer from buf at the specified offset.
   * @tc.author: liuganlin
   */
  it("testReadBigInt64BE0711", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigInt64BE(0x0102030405060708n, 0);
    try {
      let ref = buf.readBigInt64BE(1).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadBigInt64LE0720
   * @tc.desc: Reads a signed, little-endian 64-bit integer from buf at the specified offset.
   * @tc.author: liuganlin
   */
  it("testReadBigInt64LE0720", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigInt64BE(0x0102030405060708n, 0);
    let ref = buf.readBigInt64LE(0).toString(16);
    expect(ref).assertEqual("807060504030201");
  });

  /**
   * @tc.name: testReadBigInt64LE0721
   * @tc.desc: Reads a signed, little-endian 64-bit integer from buf at the specified offset.
   * @tc.author: liuganlin
   */
  it("testReadBigInt64LE0721", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigInt64BE(0x0102030405060708n, 0);
    try {
      let ref = buf.readBigInt64LE(1).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadBigUInt64BE0730
   * @tc.desc: Reads a unsigned, big-endian 64-bit integer from buf at the specified offset.
   * @tc.author: liuganlin
   */
  it("testReadBigUInt64BE0730", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
    let ref = buf.readBigUInt64BE(0).toString(16);
    expect(ref).assertEqual("decafafecacefade");
  });

  /**
   * @tc.name: testReadBigUInt64BE0731
   * @tc.desc: Reads a unsigned, big-endian 64-bit integer from buf at the specified offset.
   * @tc.author: liuganlin
   */
  it("testReadBigUInt64BE0731", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
    try {
      let ref = buf.readBigUInt64BE(1).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testReadBigUInt64LE0740
   * @tc.desc: Reads a unsigned, little-endian 64-bit integer from buf at the specified offset.
   * @tc.author: liuganlin
   */
  it("testReadBigUInt64LE0740", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
    let ref = buf.readBigUInt64LE(0).toString(16);
    expect(ref).assertEqual("defacecafefacade");
  });

  /**
   * @tc.name: testReadBigUInt64LE0741
   * @tc.desc: Reads a unsigned, little-endian 64-bit integer from buf at the specified offset.
   * @tc.author: liuganlin
   */
  it("testReadBigUInt64LE0741", 0, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
    try {
      let ref = buf.readBigUInt64LE(1).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "offset" is out of range');
    }
  });

  /**
   * @tc.name: testBufferLength0750
   * @tc.desc: Returns the number of bytes in buf.
   * @tc.author: liuganlin
   */
  it("testBufferLength0750", 0, function () {
    let buf = buffer.from("1236");
    let len = buf.length;
    expect(len).assertEqual(4);
  });

  /**
   * @tc.name: testBufferLength0751
   * @tc.desc: Returns the number of bytes in buf.
   * @tc.author: liuganlin
   */
  it("testBufferLength0751", 0, function () {
    let buf = buffer.from("1236");
    buf.length = 10;
    expect(buf.length).assertEqual(4);
  });

  /**
   * @tc.name: testBufferLength0751
   * @tc.desc: Returns the number of bytes in buf.
   * @tc.author: liuganlin
   */
  it("testBufferLength0752", 0, function () {
    let buf = buffer.from("测试特殊字符$#@!");
    let len = buf.length;
    expect(len).assertEqual(22);
  });
  
  /**
   * @tc.name: testBufferByteOffset0755
   * @tc.desc: Returns the offset of bytes in buf.
   * @tc.author: lengchangjing
   */
  it("testBufferByteOffset0755", 0, function () {
    let buf = buffer.from("1236");
    let offset = buf.byteOffset;
    expect(offset >= 0).assertTrue();
  });

  /**
   * @tc.name: testBufferByteOffset0756
   * @tc.desc: Returns the offset of bytes in buf.
   * @tc.author: lengchangjing
   */
  it("testBufferByteOffset0756", 0, function () {
    let buf = buffer.alloc(10);
    let offset = buf.byteOffset;
    expect(offset >= 0).assertTrue();
  });

  /**
   * @tc.name: testBufferByteOffset0757
   * @tc.desc: Returns the offset of bytes in buf.
   * @tc.author: lengchangjing
   */
  it("testBufferByteOffset0757", 0, function () {
    let buf = buffer.allocUninitializedFromPool(10);
    let offset = buf.byteOffset;
    expect(offset >= 0).assertTrue();
  });
  
  /**
   * @tc.name: testBufferByteOffset0758
   * @tc.desc: Returns the offset of bytes in buf.
   * @tc.author: lengchangjing
   */
  it("testBufferByteOffset0758", 0, function () {
    let buf = buffer.allocUninitialized(10);
    let offset = buf.byteOffset;
    expect(offset >= 0).assertTrue();
  });

  /**
   * @tc.name: testBlobSize0760
   * @tc.desc: The total size of the Blob in bytes.
   * @tc.author: liuganlin
   */
  it("testBlobSize0760", 0, function () {
    let blob = new buffer.Blob(["a", "b", "c"]);
    let size = blob.size;
    expect(size).assertEqual(3);
  });

  /**
   * @tc.name: testBlobSize0761
   * @tc.desc: The total size of the Blob in bytes.
   * @tc.author: liuganlin
   */
  it("testBlobSize0761", 0, function () {
    let blob = new buffer.Blob([]);
    let size = blob.size;
    expect(size).assertEqual(0);
  });

  /**
   * @tc.name: testBlobSize0762
   * @tc.desc: The total size of the Blob in bytes.
   * @tc.author: liuganlin
   */
  it("testBlobSize0762", 0, function () {
    let blob = new buffer.Blob(["测试", "$#", "c"]);
    let size = blob.size;
    expect(size).assertEqual(9);
  });

  /**
   * @tc.name: testBlobType0770
   * @tc.desc: The content-type of the Blob.
   * @tc.author: liuganlin
   */
  it("testBlobType0770", 0, function () {
    let blob = new buffer.Blob(["a", "b", "c"], { type: "mime", endings: "transparent" });
    let type = blob.type;
    expect(type).assertEqual("mime");
  });

  /**
   * @tc.name: testBlobType0771
   * @tc.desc: The content-type of the Blob.
   * @tc.author: liuganlin
   */
  it("testBlobType0771", 0, function () {
    let blob = new buffer.Blob(["a", "b", "c"]);
    let type = blob.type;
    expect(type).assertEqual("");
  });

  /**
   * @tc.name: testAllocUninitialized0780
   * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * For example: buffer.allocUninitialized(10);
   * @tc.author: liuganlin
   */
  it("testAllocUninitialized0780", 0, function () {
    let buf = buffer.allocUninitialized(10);
    expect(buf.length).assertEqual(10);
  });

  /**
   * @tc.name: testAllocUninitialized0781
   * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * For example: buffer.allocUninitialized(10);
   * @tc.author: liuganlin
   */
  it("testAllocUninitialized0781", 0, function () {
    let buf = buffer.allocUninitialized(0);
    expect(buf.length).assertEqual(0);
  });

  /**
   * @tc.name: testAllocUninitialized0782
   * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * For example: buffer.allocUninitialized(-5);
   * @tc.author: liuganlin
   */
  it("testAllocUninitialized0782", 0, function () {
    try {
      let buf = buffer.allocUninitialized(-5);
    } catch (err) {
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('The value of "size" is out of range');
    }
  });
})}