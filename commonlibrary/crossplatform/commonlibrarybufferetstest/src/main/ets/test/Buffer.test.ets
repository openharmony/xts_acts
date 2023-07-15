/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import buffer from "@ohos.buffer";

type BufferEncoding = "ascii" | "utf8" | "utf-8" | "utf16le" | "ucs2" | "ucs-2" | "base64" | "base64url" | "latin1" | "binary" | "hex";
export default function BufferTest() {
  describe("BufferTest", function () {
    /**
     * @tc.number    : TEST_ALLOC_001
     * @tc.name      : testAlloc001
     * @tc.desc      : Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.alloc(10);
     */
    it("testAlloc001", 0, function () {
      let buf = buffer.alloc(10);
      expect(buf.length).assertEqual(10);
    });

    /**
     * @tc.number    : TEST_ALLOC_002
     * @tc.name      : testAlloc002
     * @tc.desc      : Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.alloc(10).fill(string);
     */
    it("testAlloc002", 0, function () {
      let encodeArr: BufferEncoding[] = ["utf8", "utf-8", "ucs2", "ucs-2", "ascii", "latin1", "binary", "utf16le", "base64", "base64url", "hex"];
      for (const encode of encodeArr) {
        let buf = buffer.alloc(10).fill("ab$#", undefined, undefined, encode);
        expect(buf.length).assertEqual(10);
      }
    });

    /**
     * @tc.number    : TEST_ALLOC_003
     * @tc.name      : testAlloc003
     * @tc.desc      : Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.alloc(10).fill(buffer);
     */
    it("testAlloc003", 0, function () {
      let buf1 = buffer.alloc(10);
      let buf = buffer.alloc(10).fill(buf1);
      expect(buf.length).assertEqual(10);
    });

    /**
     * @tc.number    : TEST_ALLOC_004
     * @tc.name      : testAlloc004
     * @tc.desc      : Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.alloc(0);
     */
    it("testAlloc004", 0, function () {
      let buf = buffer.alloc(0);
      expect(buf.length).assertEqual(0);
    });

    /**
     * @tc.number    : TEST_ALLOC_005
     * @tc.name      : testAlloc005
     * @tc.desc      : Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.alloc(0).fill(string, encode);
     */
    it("testAlloc005", 0, function () {
      let encodeArr: BufferEncoding[] = ["utf8", "utf-8", "ucs2", "ucs-2", "ascii", "latin1", "binary", "utf16le", "base64", "base64url", "hex"];
      for (const encode of encodeArr) {
        let buf = buffer.alloc(0).fill("ab$#", undefined, undefined, encode);
        expect(buf.length).assertEqual(0);
      }
    });

    /**
     * @tc.number    : TEST_ALLOC_006
     * @tc.name      : testAlloc006
     * @tc.desc      : Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.alloc(0).fill(buffer);
     */
    it("testAlloc006", 0, function () {
      let buf1 = buffer.alloc(10);
      let buf = buffer.alloc(0).fill(buf1);
      expect(buf.length).assertEqual(0);
    });

    /**
     * @tc.number    : TEST_ALLOC_007
     * @tc.name      : testAlloc007
     * @tc.desc      : Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.alloc(-5);
     */
    it("testAlloc007", 0, function () {
      try {
        let buf = buffer.alloc(-5);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The type of "size" must be number and the value cannot be negative. Received value is: -5');
      }
    });

    /**
     * @tc.number    : TEST_ALLOC_008
     * @tc.name      : testAlloc008
     * @tc.desc      : Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.alloc(10, string, encode);
     */
    it("testAlloc008", 0, function () {
      let encodeArr: BufferEncoding[] = ["utf8", "utf-8", "ucs2", "ucs-2", "ascii", "latin1", "binary", "utf16le", "base64", "base64url", "hex"];
      for (const encode of encodeArr) {
        let buf = buffer.alloc(10, "ab$#", encode);
        expect(buf.length).assertEqual(10);
      }
    });

    /**
     * @tc.number    : TEST_ALLOC_009
     * @tc.name      : testAlloc009
     * @tc.desc      : Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.alloc(0).fill(string, encode);
     */
    it("testAlloc009", 0, function () {
      let encodeArr: BufferEncoding[] = ["utf8", "utf-8", "ucs2", "ucs-2", "ascii", "latin1", "binary", "utf16le", "base64", "base64url", "hex"];
      for (const encode of encodeArr) {
        let buf = buffer.alloc(0, "ab$#", encode);
        expect(buf.length).assertEqual(0);
      }
    });

    /**
     * @tc.number    : TEST_ALLOC_010
     * @tc.name      : testAlloc010
     * @tc.desc      : Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.alloc(5.5);
     */
    it("testAlloc010", 0, function () {
      let buf = buffer.alloc(5.5);
      expect(buf.length).assertEqual(5);
    });

    /**
     * @tc.number    : TEST_ALLOC_UNINITIALIZED_001
     * @tc.name      : testAllocUninitialized001
     * @tc.desc      : Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.allocUninitialized(10);
     */
    it("testAllocUninitialized001", 0, function () {
      let buf = buffer.allocUninitialized(10);
      expect(buf.length).assertEqual(10);
    });

    /**
     * @tc.number    : TEST_ALLOC_UNINITIALIZED_002
     * @tc.name      : testAllocUninitialized002
     * @tc.desc      : Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.allocUninitialized(0);
     */
    it("testAllocUninitialized002", 0, function () {
      let buf = buffer.allocUninitialized(0);
      expect(buf.length).assertEqual(0);
    });

    /**
     * @tc.number    : TEST_ALLOC_UNINITIALIZED_003
     * @tc.name      : testAllocUninitialized003
     * @tc.desc      : Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.allocUninitialized(-5);
     */
    it("testAllocUninitialized003", 0, function () {
      try {
        let buf = buffer.allocUninitialized(-5);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The type of "size" must be number and the value cannot be negative. Received value is: -5');
      }
    });

    /**
     * @tc.number    : TEST_ALLOC_UNINITIALIZED_FROM_POOL_001
     * @tc.name      : testAllocUninitializedFromPool001
     * @tc.desc      : Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.allocUninitializedFromPool(10);
     */
    it("testAllocUninitializedFromPool001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(10);
      expect(buf.length).assertEqual(10);
    });

    /**
     * @tc.number    : TEST_ALLOC_UNINITIALIZED_FROM_POOL_002
     * @tc.name      : testAllocUninitializedFromPool002
     * @tc.desc      : Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.allocUninitializedFromPool(10);
     */
    it("testAllocUninitializedFromPool002", 0, function () {
      let encodeArr: BufferEncoding[] = ["utf8", "utf-8", "ucs2", "ucs-2", "ascii", "latin1", "binary", "utf16le", "base64", "base64url", "hex"];
      for (const encode of encodeArr) {
        let buf = buffer.allocUninitializedFromPool(10).fill("abcd", undefined, undefined, encode);
        expect(buf.length).assertEqual(10);
      }
    });

    /**
     * @tc.number    : TEST_ALLOC_UNINITIALIZED_FROM_POOL_003
     * @tc.name      : testAllocUninitializedFromPool003
     * @tc.desc      : Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.allocUninitializedFromPool(10).fill(buffer);
     */
    it("testAllocUninitializedFromPool003", 0, function () {
      let buf1 = buffer.allocUninitializedFromPool(10);
      let buf = buffer.allocUninitializedFromPool(10).fill(buf1);
      expect(buf.length).assertEqual(10);
    });

    /**
     * @tc.number    : TEST_ALLOC_UNINITIALIZED_FROM_POOL_004
     * @tc.name      : testAllocUninitializedFromPool004
     * @tc.desc      : Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.allocUninitializedFromPool(0);
     */
    it("testAllocUninitializedFromPool004", 0, function () {
      let buf = buffer.allocUninitializedFromPool(0);
      expect(buf.length).assertEqual(0);
    });

    /**
     * @tc.number    : TEST_ALLOC_UNINITIALIZED_FROM_POOL_005
     * @tc.name      : testAllocUninitializedFromPool005
     * @tc.desc      : Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.allocUninitializedFromPool(0).fill(string, encode);
     */
    it("testAllocUninitializedFromPool005", 0, function () {
      let encodeArr: BufferEncoding[] = ["utf8", "utf-8", "ucs2", "ucs-2", "ascii", "latin1", "binary", "utf16le", "base64", "base64url", "hex"];
      for (const encode of encodeArr) {
        let buf = buffer.allocUninitializedFromPool(0).fill("abcd", undefined, undefined, encode);
        expect(buf.length).assertEqual(0);
      }
    });

    /**
     * @tc.number    : TEST_ALLOC_UNINITIALIZED_FROM_POOL_006
     * @tc.name      : testAllocUninitializedFromPool006
     * @tc.desc      : Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.allocUninitializedFromPool(10).fill(buffer);
     */
    it("testAllocUninitializedFromPool006", 0, function () {
      let buf1 = buffer.allocUninitializedFromPool(10);
      let buf = buffer.allocUninitializedFromPool(0).fill(buf1);
      expect(buf.length).assertEqual(0);
    });

    /**
     * @tc.number    : TEST_ALLOC_UNINITIALIZED_FROM_POOL_007
     * @tc.name      : testAllocUninitializedFromPool007
     * @tc.desc      : Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.allocUninitializedFromPool(-5);
     */
    it("testAllocUninitializedFromPool007", 0, function () {
      try {
        let buf = buffer.allocUninitializedFromPool(-5);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The type of "size" must be number and the value cannot be negative. Received value is: -5');
      }
    });

    /**
     * @tc.number    : TEST_ALLOC_UNINITIALIZED_FROM_POOL_008
     * @tc.name      : testAllocUninitializedFromPool008
     * @tc.desc      : Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.allocUninitializedFromPool(5.5);
     */
    it("testAllocUninitializedFromPool008", 0, function () {
      let buf = buffer.allocUninitializedFromPool(5.5);
      expect(buf.length).assertEqual(5);
    });

    /**
     * @tc.number    : TEST_BYTE_LENGTH_001
     * @tc.name      : testByteLength001
     * @tc.desc      : Returns the byte length of a string when encoded using `encoding`.
     *                 This is not the same as [`String.prototype.length`], which does not account
     *                 for the encoding that is used to convert the string into bytes.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.byteLength("abcd");
     */
    it("testByteLength001", 0, function () {
      let byteLen = buffer.byteLength("abcd");
      expect(byteLen).assertEqual(4);
    });

    /**
     * @tc.number    : TEST_BYTE_LENGTH_002
     * @tc.name      : testByteLength002
     * @tc.desc      : Returns the byte length of a string when encoded using `encoding`.
     *                 This is not the same as [`String.prototype.length`], which does not account
     *                 for the encoding that is used to convert the string into bytes.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.byteLength("测试");
     */
    it("testByteLength002", 0, function () {
      let byteLen = buffer.byteLength("测试");
      expect(byteLen).assertEqual(6);
    });

    /**
     * @tc.number    : TEST_BYTE_LENGTH_003
     * @tc.name      : testByteLength003
     * @tc.desc      : Returns the byte length of a string when encoded using `encoding`.
     *                 This is not the same as [`String.prototype.length`], which does not account
     *                 for the encoding that is used to convert the string into bytes.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.byteLength("$&@*%");
     */
    it("testByteLength003", 0, function () {
      let byteLen = buffer.byteLength("$&@*%");
      expect(byteLen).assertEqual(5);
    });

    /**
     * @tc.number    : TEST_BYTE_LENGTH_004
     * @tc.name      : testByteLength004
     * @tc.desc      : Returns the byte length of a string when encoded using `encoding`.
     *                 This is not the same as [`String.prototype.length`], which does not account
     *                 for the encoding that is used to convert the string into bytes.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.byteLength(string, encode);
     */
    it("testByteLength004", 0, function () {
      let encodeArr: BufferEncoding[] = ["utf8", "utf-8", "ucs2", "ucs-2", "ascii", "latin1", "binary", "utf16le", "base64", "base64url", "hex"];
      let result = [4, 4, 8, 8, 4, 4, 4, 8, 3, 3, 2];
      for (let i = 0, len = encodeArr.length; i < len; i++) {
        let byteLen = buffer.byteLength("abcd", encodeArr[i]);
        expect(byteLen).assertEqual(result[i]);
      }
    });

    /**
     * @tc.number    : TEST_BYTE_LENGTH_005
     * @tc.name      : testByteLength005
     * @tc.desc      : Returns the byte length of a string when encoded using `encoding`.
     *                 This is not the same as [`String.prototype.length`], which does not account
     *                 for the encoding that is used to convert the string into bytes.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.byteLength(arrayBuffer);
     */
    it("testByteLength005", 0, function () {
      let uintarr = new Uint8Array(2);
      uintarr[0] = 21;
      uintarr[1] = 31;
      let byteLen = buffer.byteLength(uintarr.buffer);
      expect(byteLen).assertEqual(2);
    });

    /**
     * @tc.number    : TEST_CONCAT_001
     * @tc.name      : testConcat001
     * @tc.desc      : Returns a new `Buffer` which is the result of concatenating
     *                 all the `Buffer`instances in the `list` together.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let buf1 = buffer.from("1236");
     *                 let buf2 = buffer.from("1235");
     *                 let buf = buffer.concat([buf1, buf2]);
     */
    it("testConcat001", 0, function () {
      let buf1 = buffer.from("1236");
      let buf2 = buffer.from("1235");
      let buf = buffer.concat([buf1, buf2]);
      let str = buf.toString();
      expect(str).assertEqual("12361235");
    });

    /**
     * @tc.number    : TEST_CONCAT_002
     * @tc.name      : testConcat002
     * @tc.desc      : Returns a new `Buffer` which is the result of concatenating
     *                 all the `Buffer`instances in the `list` together.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let buf1 = buffer.from("测试");
     *                 let buf2 = buffer.from("$&*");
     *                 let buf = buffer.concat([buf1, buf2]);
     */
    it("testConcat002", 0, function () {
      let buf1 = buffer.from("测试");
      let buf2 = buffer.from("$&*");
      let buf = buffer.concat([buf1, buf2]);
      let str = buf.toString();
      expect(str).assertEqual("测试$&*");
    });

    /**
     * @tc.number    : TEST_CONCAT_003
     * @tc.name      : testConcat003
     * @tc.desc      : Returns a new `Buffer` which is the result of concatenating
     *                 all the `Buffer`instances in the `list` together.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let buf1 = buffer.from("123$");
     *                 let buf2 = buffer.from("*35");
     *                 let buf = buffer.concat([buf1, buf2]);
     */
    it("testConcat003", 0, function () {
      let buf1 = buffer.from("123$");
      let buf2 = buffer.from("*35");
      let buf3 = buffer.concat([buf1, buf2]);
      let buf = buffer.alloc(5).fill(buf3);
      let str = buf.toString();
      expect(str).assertEqual("123$*");
    });

    /**
     * @tc.number    : TEST_CONCAT_004
     * @tc.name      : testConcat004
     * @tc.desc      : Returns a new `Buffer` which is the result of concatenating
     *                 all the `Buffer`instances in the `list` together.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let buf1 = buffer.from("123$");
     *                 let buf2 = buffer.from("*35");
     *                 let buf = buffer.concat([buf1, buf2]);
     */
    it("testConcat004", 0, function () {
      let buf1 = buffer.from("123$");
      let buf2 = buffer.from("*35");
      try {
        let buf = buffer.concat([buf1, buf2], -1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "totalLength" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
      }
    });

    /**
     * @tc.number    : TEST_FROM_001
     * @tc.name      : testFrom001
     * @tc.desc      : Copies the passed buffer data onto a new Buffer instance.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.from(uint8Array);
     */
    it("testFrom001", 0, function () {
      let uarr = new Uint8Array(3);
      uarr[0] = 0x12;
      uarr[1] = 0x34;
      uarr[2] = 0x56;
      let buf = buffer.from(uarr);
      let str = buf.toString("hex");
      expect(str).assertEqual("123456");
    });

    /**
     * @tc.number    : TEST_FROM_002
     * @tc.name      : testFrom002
     * @tc.desc      : Allocates a new Buffer using an array of bytes in the range 0 – 255.
     *                 Array entries outside that range will be truncated to fit into it.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.from(array);
     */
    it("testFrom002", 0, function () {
      const buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
      let str = buf.toString("hex");
      expect(str).assertEqual("627566666572");
    });

    /**
     * @tc.number    : TEST_FROM_003
     * @tc.name      : testFrom003
     * @tc.desc      : This creates a view of the ArrayBuffer without copying the underlying memory.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.from(arrayBuffer);
     */
    it("testFrom003", 0, function () {
      const arr = new Uint8Array(2);
      arr[0] = 97;
      arr[1] = 98;
      const buf = buffer.from(arr.buffer);
      arr[0] = 99;
      buf[1] = 100;
      let str = buf.toString("hex");
      expect(str).assertEqual("6364");
      expect(arr[1]).assertEqual(100);
    });

    /**
     * @tc.number    : TEST_FROM_004
     * @tc.name      : testFrom004
     * @tc.desc      : This creates a view of the ArrayBuffer without copying the underlying memory.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.from(arrayBuffer, byteOffset);
     */
    it("testFrom004", 0, function () {
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
     * @tc.number    : TEST_FROM_005
     * @tc.name      : testFrom005
     * @tc.desc      : This creates a view of the ArrayBuffer without copying the underlying memory.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer2.from(buffer1);
     */
    it("testFrom005", 0, function () {
      const buf1 = buffer.from("buffer");
      const buf2 = buffer.from(buf1);
      buf1[0] = 0x61;
      let str = buf1.toString();
      expect(str).assertEqual("auffer");
      str = buf2.toString();
      expect(str).assertEqual("buffer");
    });

    /**
     * @tc.number    : TEST_FROM_006
     * @tc.name      : testFrom006
     * @tc.desc      : This creates a view of the ArrayBuffer without copying the underlying memory.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.from(string);
     */
    it("testFrom006", 0, function () {
      const buf1 = buffer.from("this is a test");
      let str = buf1.toString();
      expect(str).assertEqual("this is a test");
    });

    /**
     * @tc.number    : TEST_FROM_007
     * @tc.name      : testFrom007
     * @tc.desc      : Creates a new Buffer containing string. The encoding parameter identifies the character encoding
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.from(string, encoding);
     */
    it("testFrom007", 0, function () {
      const buf1 = buffer.from("F1刘FG", "hex");
      let str = buf1.toString("hex");
      expect(str).assertEqual("f1");

      let buf2 = buffer.from("F1FG", "ascii");
      str = buf2.toString("ascii");
      expect(str).assertEqual("F1FG");

      let buf3 = buffer.from("F1FG刘", "base64");
      str = buf3.toString("base64");
      expect(str).assertEqual("F1FG");

      let buf4 = buffer.from("F1FG刘", "base64url");
      str = buf4.toString("base64url");
      expect(str).assertEqual("F1FG");

      let buf5 = buffer.from("F1FG", "binary");
      str = buf5.toString("binary");
      expect(str).assertEqual("F1FG");

      let buf6 = buffer.from("F1FG", "latin1");
      str = buf6.toString("latin1");
      expect(str).assertEqual("F1FG");

      let buf7 = buffer.from("F1FG刘", "ucs2");
      str = buf7.toString("ucs2");
      expect(str).assertEqual("F1FG刘");

      let buf8 = buffer.from("F1FG刘", "utf16le");
      str = buf8.toString("utf16le");
      expect(str).assertEqual("F1FG刘");

      let buf9 = buffer.from("F1FG刘", "ucs2");
      str = buf9.toString("ucs2");
      expect(str).assertEqual("F1FG刘");

      let buf10 = buffer.from("F1FG刘", "utf-8");
      str = buf10.toString("utf-8");
      expect(str).assertEqual("F1FG刘");

      let buf11 = buffer.from("F1FG刘", "utf8");
      str = buf11.toString("utf8");
      expect(str).assertEqual("F1FG刘");
    });

    /**
     * @tc.number    : TEST_FROM_008
     * @tc.name      : testFrom008
     * @tc.desc      : For the object whose value returned by valueof() function is strictly equal to object
     *                 or supports symbol To primitive object, a new buffer instance is created.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.from(object);
     */
    it("testFrom008", 0, function () {
      const buf = buffer.from(new String("this is a test"));
      let str = buf.toString();
      expect(str).assertEqual("this is a test");
    });

    /**
     * @tc.number    : TEST_FROM_009
     * @tc.name      : testFrom009
     * @tc.desc      : For the object whose value returned by valueof() function is strictly equal to object
     *                 or supports symbol To primitive object, a new buffer instance is created.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.from(object);
     */
    it("testFrom009", 0, function () {
      const buf = buffer.from(new String("this is a test"), "utf8", 14);
      let str = buf.toString();
      expect(str).assertEqual("this is a test");
    });

    /**
     * @tc.number    : TEST_IS_BUFFER_001
     * @tc.name      : testIsBuffer001
     * @tc.desc      : Returns true if obj is a Buffer, false otherwise
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.isBuffer(buf);
     */
    it("testIsBuffer001", 0, function () {
      let buf = buffer.alloc(1);
      let flag = buffer.isBuffer(buf);
      expect(flag).assertEqual(true);
    });

    /**
     * @tc.number    : TEST_IS_BUFFER_002
     * @tc.name      : testIsBuffer002
     * @tc.desc      : Returns true if obj is a Buffer, false otherwise
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.isBuffer(buf);
     */
    it("testIsBuffer002", 0, function () {
      let obj = new Object(1);
      let flag = buffer.isBuffer(obj);
      expect(flag).assertEqual(false);
    });

    /**
     * @tc.number    : TEST_IS_ENCODING_001
     * @tc.name      : testIsEncoding001
     * @tc.desc      : Returns true if encoding is the name of a supported character encoding, or false otherwise.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.isEncoding("utf8");
     */
    it("testIsEncoding001", 0, function () {
      let flag = buffer.isEncoding("utf8");
      expect(flag).assertEqual(true);
    });

    /**
     * @tc.number    : TEST_IS_ENCODING_002
     * @tc.name      : testIsEncoding002
     * @tc.desc      : Returns true if encoding is the name of a supported character encoding, or false otherwise.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.isEncoding(encode);
     */
    it("testIsEncoding002", 0, function () {
      let encodeArr = ["utf8", "utf-8", "ucs2", "ucs-2", "ascii", "latin1", "binary", "utf16le", "utf-16le", "base64", "base64url", "hex"];
      for (const encode of encodeArr) {
        let flag = buffer.isEncoding(encode);
        expect(flag).assertEqual(true);
      }
    });

    /**
     * @tc.number    : TEST_IS_ENCODING_003
     * @tc.name      : testIsEncoding003
     * @tc.desc      : Returns true if encoding is the name of a supported character encoding, or false otherwise.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.isEncoding('gbk');
     */
    it("testIsEncoding003", 0, function () {
      let flag = buffer.isEncoding("gbk");
      expect(flag).assertEqual(false);
    });

    /**
     * @tc.number    : TEST_COMPARE_001
     * @tc.name      : testCompare001
     * @tc.desc      : Compares buf with target and returns a number indicating whether buf comes before, after,
     *                 or is the same as target in sort order. Comparison is based on the actual sequence of
     *                 bytes in each Buffer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.isEncoding('gbk');
     */
    it("testCompare001", 0, function () {
      let buf1 = buffer.from("1236");
      let buf2 = buffer.from("1235");
      let res = buffer.compare(buf1, buf2);
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    : TEST_TRANSCODE_001
     * @tc.name      : testTranscode001
     * @tc.desc      : Re-encodes the given Buffer or Uint8Array instance from one character encoding to another.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.transcode(buf1, "ascii", "ucs2");
     */
    it("testTranscode001", 0, function () {
      let buf1 = buffer.from("1236");
      let buf = buffer.transcode(buf1, "ascii", "ucs2");
      let str = buf.toString("ucs2");
      expect(str).assertEqual("1236");
    });

    /**
     * @tc.number    : TEST_TRANSCODE_002
     * @tc.name      : testTranscode002
     * @tc.desc      : Re-encodes the given Buffer or Uint8Array instance from one character encoding to another.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.transcode(buf1, "ascii", "ucs2");
     */
    it("testTranscode002", 0, function () {
      let buf1 = buffer.from("测试");
      let buf = buffer.transcode(buf1, "utf8", "ucs2");
      let str = buf.toString("ucs2");
      expect(str).assertEqual("测试");
    });

    /**
     * @tc.number    : TEST_FILL_001
     * @tc.name      : testFill001
     * @tc.desc      : Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.alloc(3).fill("abc");
     */
    it("testFill001", 0, function () {
      let buf = buffer.alloc(3).fill("abc");
      let str = buf.toString();
      expect(str).assertEqual("abc");
    });

    /**
     * @tc.number    : TEST_FILL_002
     * @tc.name      : testFill002
     * @tc.desc      : Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.alloc(10).fill('F1刘FG', 0, 10, 'hex');
     */
    it("testFill002", 0, function () {
      const buf1 = buffer.alloc(10).fill("F1刘FG", 0, 10, "hex");
      let str = buf1.toString("hex");
      expect(str).assertEqual("f1f1f1f1f1f1f1f1f1f1");

      let buf2 = buffer.alloc(10).fill("F1刘FG", 0, 10, "ascii");
      str = buf2.toString("hex");
      expect(str).assertEqual("46311846474631184647");

      let buf3 = buffer.alloc(10).fill("F1FG", 0, 10, "base64");
      str = buf3.toString("hex");
      expect(str).assertEqual("17514617514617514617");

      let buf4 = buffer.alloc(10).fill("F1刘FG", 0, 10, "binary");
      str = buf4.toString("hex");
      expect(str).assertEqual("46311846474631184647");

      let buf5 = buffer.alloc(10).fill("F1刘FG", 0, 10, "latin1");
      str = buf5.toString("hex");
      expect(str).assertEqual("46311846474631184647");

      let buf6 = buffer.alloc(10).fill("F1刘FG", 0, 10, "ucs2");
      str = buf6.toString("hex");
      expect(str).assertEqual("46003100185246004700");

      let buf7 = buffer.alloc(10).fill("F1刘FG", 0, 10, "utf8");
      str = buf7.toString("hex");
      expect(str).assertEqual("4631e5889846474631e5");
    });

    /**
     * @tc.number    : TEST_FILL_003
     * @tc.name      : testFill003
     * @tc.desc      : Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.alloc(3).fill("$*$");
     */
    it("testFill003", 0, function () {
      let buf = buffer.alloc(3).fill("$*$");
      let str = buf.toString();
      expect(str).assertEqual("$*$");
    });

    /**
     * @tc.number    : TEST_FILL_004
     * @tc.name      : testFill004
     * @tc.desc      : Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.alloc(3).fill("$*$");
     */
    it("testFill004", 0, function () {
      try {
        let buf = buffer.alloc(3).fill("$*$", -1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
      }
    });

    /**
     * @tc.number    : TEST_FILL_005
     * @tc.name      : testFill005
     * @tc.desc      : Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buffer.alloc(3).fill("$*$", 0, 5);
     */
    it("testFill005", 0, function () {
      try {
        let buf = buffer.alloc(3).fill("$*$", 0, 5);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "end" is out of range. It must be >= 0 and <= 3. Received value is: 5');
      }
    });

    /**
     * @tc.number    : TEST_COMPARE_002
     * @tc.name      : testCompare002
     * @tc.desc      : Compares buf with target and returns a number indicating whether buf comes before, after,
     *                 or is the same as target in sort order. Comparison is based on the actual sequence of
     *                 bytes in each Buffer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.compare(buf2);
     */
    it("testCompare002", 0, function () {
      let buf1 = buffer.from("1236");
      let buf2 = buffer.from("1235");
      let res = buf1.compare(buf2);
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    : TEST_COMPARE_003
     * @tc.name      : testCompare003
     * @tc.desc      : Compares buf with target and returns a number indicating whether buf comes before, after,
     *                 or is the same as target in sort order. Comparison is based on the actual sequence of
     *                 bytes in each Buffer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.compare(buf2, -1);
     */
    it("testCompare003", 0, function () {
      let buf1 = buffer.from("1236");
      let buf2 = buffer.from("1235");
      try {
        let res = buf1.compare(buf2, -1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
      }
    });

    /**
     * @tc.number    : TEST_COPY_001
     * @tc.name      : testCopy001
     * @tc.desc      : Copies data from a region of buf to a region in target,
     *                 even if the target memory region overlaps with buf.
     *                 If sourceEnd is greater than the length of the target, the length of the target shall prevail,
     *                 and the extra part will not be overwritten.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.copy(buf2);
     */
    it("testCopy001", 0, function () {
      let buf1 = buffer.from("1236");
      let buf2 = buffer.from("1235");
      let num = buf1.copy(buf2);
      expect(num).assertEqual(4);
      let str = buf2.toString();
      expect(str).assertEqual("1236");
    });

    /**
     * @tc.number    : TEST_COPY_002
     * @tc.name      : testCopy002
     * @tc.desc      : Copies data from a region of buf to a region in target,
     *                 even if the target memory region overlaps with buf.
     *                 If sourceEnd is greater than the length of the target, the length of the target shall prevail,
     *                 and the extra part will not be overwritten.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.copy(buf2, targetStart, sourceStart, sourceEnd);
     */
    it("testCopy002", 0, function () {
      let buf1 = buffer.from("abcdefg");
      let buf2 = buffer.from("1235789");
      let num = buf1.copy(buf2, 2, 1, 3);
      expect(num).assertEqual(2);
      let str = buf2.toString();
      expect(str).assertEqual("12bc789");
    });

    /**
     * @tc.number    : TEST_COPY_003
     * @tc.name      : testCopy003
     * @tc.desc      : Copies data from a region of buf to a region in target,
     *                 even if the target memory region overlaps with buf.
     *                 If sourceEnd is greater than the length of the target, the length of the target shall prevail,
     *                 and the extra part will not be overwritten.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.copy(buf2);
     */
    it("testCopy003", 0, function () {
      let buf1 = buffer.from("123656");
      let buf2 = buffer.from("1235");
      let num = buf1.copy(buf2);
      expect(num).assertEqual(4);
      let str = buf2.toString();
      expect(str).assertEqual("1236");
    });

    /**
     * @tc.number    : TEST_COPY_004
     * @tc.name      : testCopy004
     * @tc.desc      : Copies data from a region of buf to a region in target,
     *                 even if the target memory region overlaps with buf.
     *                 If sourceEnd is greater than the length of the target, the length of the target shall prevail,
     *                 and the extra part will not be overwritten.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.copy(buf2);
     */
    it("testCopy004", 0, function () {
      let buf1 = buffer.from("123656");
      let buf2 = buffer.from("1235");
      try {
        let num = buf1.copy(buf2, -1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "targetStart" is out of range. It must be >= 0. Received value is: -1');
      }
    });

    /**
     * @tc.number    : TEST_COPY_005
     * @tc.name      : testCopy005
     * @tc.desc      : Copies data from a region of buf to a region in target,
     *                 even if the target memory region overlaps with buf.
     *                 If sourceEnd is greater than the length of the target, the length of the target shall prevail,
     *                 and the extra part will not be overwritten.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.copy(buf2);
     */
    it("testCopy005", 0, function () {
      let buf1 = buffer.from("ab$#");
      let buf2 = buffer.from("123556");
      let num = buf1.copy(buf2);
      expect(num).assertEqual(4);
      let str = buf2.toString();
      expect(str).assertEqual("ab$#56");
    });

    /**
     * @tc.number    : TEST_BUFFER_LENGTH_001
     * @tc.name      : testBufferLength001
     * @tc.desc      : Returns the number of bytes in buf.
     * @tc.size      : MediumTest
     * @tc.type      : Field
     * @tc.level     : level 0
     */
    it("testBufferLength001", 0, function () {
      let buf = buffer.from("1236");
      let len = buf.length;
      expect(len).assertEqual(4);
    });

    /**
     * @tc.number    : TEST_BUFFER_BYTE_OFFSET_001
     * @tc.name      : testBufferByteOffset001
     * @tc.desc      : Returns the number of bytes in buf.
     * @tc.size      : MediumTest
     * @tc.type      : Field
     * @tc.level     : level 0
     */
    it("testBufferByteOffset001", 0, function () {
      let buf = buffer.from("1236");
      let offset = buf.byteOffset;
      expect(offset >= 0).assertTrue();
    });

    /**
     * @tc.number    : TEST_BUFFER_BUFFER_001
     * @tc.name      : testBufferBuffer001
     * @tc.desc      : Returns the number of bytes in buf.
     * @tc.size      : MediumTest
     * @tc.type      : Field
     * @tc.level     : level 0
     */
    it("testBufferBuffer001", 0, function () {
      let buf = buffer.from("1236");
      console.info(typeof buf.buffer);
      expect(buf.buffer != null).assertTrue();
    });

    /**
     * @tc.number    : TEST_EQUALS_001
     * @tc.name      : testEquals001
     * @tc.desc      : Returns true if both buf and otherBuffer have exactly the same bytes, false otherwise.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.equals(buf2);
     */
    it("testEquals001", 0, function () {
      let buf1 = buffer.from("1236");
      let buf2 = buffer.from("1235");
      let res = buf1.equals(buf2);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number    : TEST_EQUALS_002
     * @tc.name      : testEquals002
     * @tc.desc      : Returns true if both buf and otherBuffer have exactly the same bytes, false otherwise.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.equals(buf2);
     */
    it("testEquals002", 0, function () {
      let buf1 = buffer.from("1236测试");
      let buf2 = buffer.from("1236测试");
      let res = buf1.equals(buf2);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number    : TEST_EQUALS_003
     * @tc.name      : testEquals003
     * @tc.desc      : Returns true if both buf and otherBuffer have exactly the same bytes, false otherwise.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.equals(buf2);
     */
    it("testEquals003", 0, function () {
      let buf1 = buffer.from("O@O");
      let buf2 = buffer.from("O^O");
      let res = buf1.equals(buf2);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number    : TEST_INCLUDES_001
     * @tc.name      : testIncludes001
     * @tc.desc      : Returns true if value was found in buf, false otherwise.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let buf1 = buffer.from("13236"); buf1.includes("3");
     */
    it("testIncludes001", 0, function () {
      let buf1 = buffer.from("13236");
      let flag = buf1.includes("3");
      expect(flag).assertEqual(true);
    });

    /**
     * @tc.number    : TEST_INCLUDES_002
     * @tc.name      : testIncludes002
     * @tc.desc      : Returns true if value was found in buf, false otherwise.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let buf1 = buffer.from("13236"); buf1.includes("3", 2);
     */
    it("testIncludes002", 0, function () {
      let buf1 = buffer.from("13236");
      let flag = buf1.includes("3", 2);
      expect(flag).assertEqual(true);
    });

    /**
     * @tc.number    : TEST_INCLUDES_003
     * @tc.name      : testIncludes003
     * @tc.desc      : Returns true if value was found in buf, false otherwise.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let buf1 = buffer.from("13236"); buf1.includes("32");
     */
    it("testIncludes003", 0, function () {
      let buf1 = buffer.from("13236");
      let flag = buf1.includes("32");
      expect(flag).assertEqual(true);
    });

    /**
     * @tc.number    : TEST_INCLUDES_004
     * @tc.name      : testIncludes004
     * @tc.desc      : Returns true if value was found in buf, false otherwise.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let buf1 = buffer.from("13236"); buf1.includes("32");
     */
    it("testIncludes004", 0, function () {
      let buf1 = buffer.from("13236");
      let flag = buf1.includes("32", 2);
      expect(flag).assertEqual(false);
    });

    /**
     * @tc.number    : TEST_INCLUDES_005
     * @tc.name      : testIncludes005
     * @tc.desc      : Returns true if value was found in buf, false otherwise.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let buf1 = buffer.from("13236"); buf1.includes("32");
     */
    it("testIncludes005", 0, function () {
      let buf1 = buffer.from("测试特殊字符$#@!");
      let flag = buf1.includes("#@");
      expect(flag).assertEqual(true);
      flag = buf1.includes("测试");
      expect(flag).assertEqual(true);
    });

    /**
     * @tc.number    : TEST_INCLUDES_006
     * @tc.name      : testIncludes006
     * @tc.desc      : Returns true if value was found in buf, false otherwise.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let buf1 = buffer.from("13236"); buf1.includes("32");
     */
    it("testIncludes006", 0, function () {
      let buf1 = buffer.from("13236");
      let flag = buf1.includes("abc");
      expect(flag).assertEqual(false);
    });

    /**
     * @tc.number    : TEST_INDEX_OF_001
     * @tc.name      : testIndexOf001
     * @tc.desc      : The index of the first occurrence of value in buf.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let buf1 = buffer.from("13236"); buf1.indexOf("3");
     */
    it("testIndexOf001", 0, function () {
      let buf1 = buffer.from("13236");
      let index = buf1.indexOf("3");
      expect(index).assertEqual(1);
    });

    /**
     * @tc.number    : TEST_INDEX_OF_002
     * @tc.name      : testIndexOf002
     * @tc.desc      : The index of the first occurrence of value in buf.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let buf1 = buffer.from("13236"); buf1.indexOf("3");
     */
    it("testIndexOf002", 0, function () {
      let buf1 = buffer.from("13236");
      let index = buf1.indexOf("3", 2);
      expect(index).assertEqual(3);
    });

    /**
     * @tc.number    : TEST_INDEX_OF_003
     * @tc.name      : testIndexOf003
     * @tc.desc      : The index of the first occurrence of value in buf.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let index = buf1.indexOf(value);
     */
    it("testIndexOf003", 0, function () {
      let buf1 = buffer.from("13236235");
      let index = buf1.indexOf("23");
      expect(index).assertEqual(2);
    });

    /**
     * @tc.number    : TEST_INDEX_OF_004
     * @tc.name      : testIndexOf004
     * @tc.desc      : The index of the first occurrence of value in buf.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let index = buf1.indexOf(value);
     */
    it("testIndexOf004", 0, function () {
      let buf1 = buffer.from("测试特殊字符$#@!");
      let index = buf1.indexOf("@");
      expect(index).assertEqual(20);
    });

    /**
     * @tc.number    : TEST_INDEX_OF_005
     * @tc.name      : testIndexOf005
     * @tc.desc      : The index of the first occurrence of value in buf.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let index = buf1.indexOf(value, byteOffset);
     */
    it("testIndexOf005", 0, function () {
      let buf1 = buffer.from("13236235");
      let index = buf1.indexOf("23", 3);
      expect(index).assertEqual(5);
    });

    /**
     * @tc.number    : TEST_INDEX_OF_006
     * @tc.name      : testIndexOf006
     * @tc.desc      : The index of the first occurrence of value in buf.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let buf1 = buffer.from("13236"); buf1.indexOf("a");
     */
    it("testIndexOf006", 0, function () {
      let buf1 = buffer.from("13236");
      let index = buf1.indexOf("a");
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.number    : TEST_KEYS_001
     * @tc.name      : testKeys001
     * @tc.desc      : Creates and returns an iterator of buf keys (indices).
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.keys();
     */
    it("testKeys001", 0, function () {
      let buf1 = buffer.from("1234");
      let keys = buf1.keys();
      let index = 0;
      for (const key of keys) {
        expect(key).assertEqual(index);
        index++;
      }
    });

    /**
     * @tc.number    : TEST_KEYS_002
     * @tc.name      : testKeys002
     * @tc.desc      : Creates and returns an iterator of buf keys (indices).
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.keys();
     */
    it("testKeys002", 0, function () {
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
     * @tc.number    : TEST_VALUES_001
     * @tc.name      : testValues001
     * @tc.desc      : Creates and returns an iterator for buf values (bytes).
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.values();
     */
    it("testValues001", 0, function () {
      let buf1 = buffer.from("1234");
      let keys = buf1.values();
      let va = 49;
      for (const value of keys) {
        expect(value).assertEqual(va);
        va++;
      }
    });

    /**
     * @tc.number    : TEST_VALUES_002
     * @tc.name      : testValues002
     * @tc.desc      : Creates and returns an iterator for buf values (bytes).
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.values();
     */
    it("testValues002", 0, function () {
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
     * @tc.number    : TEST_ENTRIES_001
     * @tc.name      : testEntries001
     * @tc.desc      : Creates and returns an iterator of [index, byte] pairs from the contents of buf
     *                 which is contructed from an Uint8Array.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.entries();
     */
    it("testEntries001", 0, function () {
      let buf1 = buffer.from("1234");
      let entries = buf1.entries();
      let va = 49,
        index = 0;
      for (const [key, value] of entries) {
        expect(key).assertEqual(index);
        expect(value).assertEqual(va);
        va++;
        index++;
      }
    });

    /**
     * @tc.number    : TEST_ENTRIES_002
     * @tc.name      : testEntries002
     * @tc.desc      : Creates and returns an iterator of [index, byte] pairs from the contents of buf
     *                 which is contructed from an Uint8Array.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.entries();
     */
    it("testEntries002", 0, function () {
      let uarr = new Uint8Array(4);
      uarr[0] = 0x31;
      uarr[1] = 0x32;
      uarr[2] = 0x33;
      uarr[3] = 0x34;
      let buf1 = buffer.from(uarr);
      let entries = buf1.entries();
      let va = 49,
        index = 0;
      for (const [key, value] of entries) {
        expect(key).assertEqual(index);
        expect(value).assertEqual(va);
        va++;
        index++;
      }
    });

    /**
     * @tc.number    : TEST_LAST_INDEX_OF_001
     * @tc.name      : testLastIndexOf001
     * @tc.desc      : The index of the last occurrence of value in buf.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let buf1 = buffer.from("13236"); buf1.lastIndexOf("3");
     */
    it("testLastIndexOf001", 0, function () {
      let buf1 = buffer.from("13236");
      let index = buf1.lastIndexOf("3");
      expect(index).assertEqual(3);
    });

    /**
     * @tc.number    : TEST_LAST_INDEX_OF_002
     * @tc.name      : testLastIndexOf002
     * @tc.desc      : The index of the last occurrence of value in buf.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let buf1 = buffer.from("13236"); buf1.lastIndexOf("3", 2);
     */
    it("testLastIndexOf002", 0, function () {
      let buf1 = buffer.from("13236");
      let index = buf1.lastIndexOf("3", 2);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.number    : TEST_LAST_INDEX_OF_003
     * @tc.name      : testLastIndexOf003
     * @tc.desc      : The index of the last occurrence of value in buf.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let buf1 = buffer.from("13236235"); buf1.lastIndexOf("23");
     */
    it("testLastIndexOf003", 0, function () {
      let buf1 = buffer.from("13236235");
      let index = buf1.lastIndexOf("23");
      expect(index).assertEqual(5);
    });

    /**
     * @tc.number    : TEST_LAST_INDEX_OF_004
     * @tc.name      : testLastIndexOf004
     * @tc.desc      : The index of the last occurrence of value in buf.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let buf1 = buffer.from("13236235"); buf1.lastIndexOf("23", 3);
     */
    it("testLastIndexOf004", 0, function () {
      let buf1 = buffer.from("13236235");
      let index = buf1.lastIndexOf("23", 3);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.number    : TEST_LAST_INDEX_OF_005
     * @tc.name      : testLastIndexOf005
     * @tc.desc      : The index of the last occurrence of value in buf.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let buf1 = buffer.from("13236"); buf1.lastIndexOf("a");
     */
    it("testLastIndexOf005", 0, function () {
      let buf1 = buffer.from("13236");
      let index = buf1.lastIndexOf("a");
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.number    : TEST_LAST_INDEX_OF_006
     * @tc.name      : testLastIndexOf006
     * @tc.desc      : Returns true if value was found in buf, false otherwise.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let buf = buffer.from("13236"); buf.lastIndexOf("a", 0, "utf8");
     */
    it("testLastIndexOf006", 0, function () {
      let encodeArr: BufferEncoding[] = ["utf8", "utf-8", "ucs2", "ucs-2", "ascii", "latin1", "binary", "utf16le", "base64", "base64url", "hex"];
      let buf = buffer.from("13236");
      for (const encode of encodeArr) {
        let index = buf.lastIndexOf("ab", 0, encode);
        expect(index).assertEqual(-1);
      }
    });

    /**
     * @tc.number    : TEST_READ_BIG_INT_64_BE_001
     * @tc.name      : testReadBigInt64BE001
     * @tc.desc      : Reads a signed, big-endian 64-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadBigInt64BE001", 0, function () {
      let buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x79, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
      const result = buf.readBigInt64BE(0).toString(16);
      expect(result).assertEqual("6364656667686979");
    });

    /**
     * @tc.number    : TEST_READ_BIG_INT_64_BE_002
     * @tc.name      : testReadBigInt64BE002
     * @tc.desc      : Reads a signed, big-endian 64-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadBigInt64BE002", 0, function () {
      let buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
      try {
        let ref = buf.readBigInt64BE(1).toString(16);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_READ_BIG_INT_64_LE_001
     * @tc.name      : testReadBigInt64LE001
     * @tc.desc      : Reads a signed, little-endian 64-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadBigInt64LE001", 0, function () {
      let buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
      let ref = buf.readBigInt64LE(0).toString(16);
      expect(ref).assertEqual("7069686766656463");
    });

    /**
     * @tc.number    : TEST_READ_BIG_INT_64_LE_002
     * @tc.name      : testReadBigInt64LE002
     * @tc.desc      : Reads a signed, little-endian 64-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadBigInt64LE002", 0, function () {
      let buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
      try {
        let ref = buf.readBigInt64LE(1).toString(16);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_READ_BIG_U_INT_64_BE_001
     * @tc.name      : testReadBigUInt64BE001
     * @tc.desc      : Reads a unsigned, big-endian 64-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadBigUInt64BE001", 0, function () {
      let buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
      let ref = buf.readBigUInt64BE(0).toString(16);
      expect(ref).assertEqual("6364656667686970");
    });

    /**
     * @tc.number    : TEST_READ_BIG_U_INT_64_BE_002
     * @tc.name      : testReadBigUInt64BE002
     * @tc.desc      : Reads a unsigned, big-endian 64-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadBigUInt64BE002", 0, function () {
      let buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
      try {
        let ref = buf.readBigUInt64BE(1).toString(16);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_READ_BIG_U_INT_64_LE_001
     * @tc.name      : testReadBigUInt64LE001
     * @tc.desc      : Reads a unsigned, little-endian 64-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadBigUInt64LE001", 0, function () {
      let buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
      let ref = buf.readBigUInt64LE(0).toString(16);
      expect(ref).assertEqual("7069686766656463");
    });

    /**
     * @tc.number    : TEST_READ_BIG_U_INT_64_LE_002
     * @tc.name      : testReadBigUInt64LE002
     * @tc.desc      : Reads a unsigned, little-endian 64-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadBigUInt64LE002", 0, function () {
      let buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
      try {
        let ref = buf.readBigUInt64LE(1).toString(16);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_READ_DOUBLE_BE_001
     * @tc.name      : testReadDoubleBE001
     * @tc.desc      : Reads a 64-bit, big-endian double from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadDoubleBE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(8);
      buf.writeDoubleBE(123.456, 0);
      let ref = buf.readDoubleBE();
      expect(ref).assertEqual(123.456);
    });

    /**
     * @tc.number    : TEST_READ_DOUBLE_BE_002
     * @tc.name      : testReadDoubleBE002
     * @tc.desc      : Reads a 64-bit, big-endian double from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadDoubleBE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(8);
      buf.writeDoubleBE(123.456, 0);
      try {
        let ref = buf.readDoubleBE(1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_READ_DOUBLE_LE_001
     * @tc.name      : testReadDoubleLE001
     * @tc.desc      : Reads a 64-bit, little-endian double from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadDoubleLE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(8);
      buf.writeDoubleLE(123.456, 0);
      let ref = buf.readDoubleLE();
      expect(ref).assertEqual(123.456);
    });

    /**
     * @tc.number    : TEST_READ_DOUBLE_LE_002
     * @tc.name      : testReadDoubleLE002
     * @tc.desc      : Reads a 64-bit, little-endian double from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadDoubleLE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(8);
      buf.writeDoubleLE(123.456, 0);
      try {
        let ref = buf.readDoubleLE(1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_READ_FLOAT_BE_001
     * @tc.name      : testReadFloatBE001
     * @tc.desc      : Reads a 32-bit, big-endian float from buf at the specified offset.
     * @tc.size      : .
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadFloatBE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeFloatBE(0xcabcbcbc, 0);
      let ref = buf.readFloatBE(0).toString(16);
      expect(ref).assertEqual("cabcbd00");
    });

    /**
     * @tc.number    : TEST_READ_FLOAT_BE_002
     * @tc.name      : testReadFloatBE002
     * @tc.desc      : Reads a 32-bit, big-endian float from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadFloatBE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeFloatBE(0xcabcbcbc, 0);
      try {
        let ref = buf.readFloatBE(1).toString(16);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_READ_FLOAT_LE_001
     * @tc.name      : testReadFloatLE001
     * @tc.desc      : Reads a 32-bit, little-endian float from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadFloatLE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeFloatLE(0xcabcbcbc, 0);
      let ref = buf.readFloatLE(0).toString(16);
      expect(ref).assertEqual("cabcbd00");
    });

    /**
     * @tc.number    : TEST_READ_FLOAT_LE_002
     * @tc.name      : testReadFloatLE002
     * @tc.desc      : Reads a 32-bit, little-endian float from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadFloatLE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeFloatLE(0xcabcbcbc, 0);
      try {
        let ref = buf.readFloatLE(1).toString(16);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_READ_INT_8_001
     * @tc.name      : testReadInt8001
     * @tc.desc      : Reads a signed 8-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadInt8001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(2);
      buf.writeInt8(0x12);
      let ref = buf.readInt8(0).toString(16);
      expect(ref).assertEqual("12");
    });

    /**
     * @tc.number    : TEST_READ_INT_8_002
     * @tc.name      : testReadInt8002
     * @tc.desc      : Reads a signed 8-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadInt8002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(2);
      buf.writeInt8(0x12);
      try {
        let ref = buf.readInt8(2).toString(16);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: 2');
      }
    });

    /**
     * @tc.number    : TEST_READ_INT_16_BE_001
     * @tc.name      : testReadInt16BE001
     * @tc.desc      : Reads a signed, big-endian 16-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadInt16BE001", 0, function () {
      let buf = buffer.alloc(2);
      buf.writeInt16BE(0x1234, 0);
      let ref = buf.readInt16BE(0).toString(16);
      expect(ref).assertEqual("1234");
    });

    /**
     * @tc.number    : TEST_READ_INT_16_BE_002
     * @tc.name      : testReadInt16BE002
     * @tc.desc      : Reads a signed, big-endian 16-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadInt16BE002", 0, function () {
      let buf = buffer.alloc(2);
      buf.writeInt16BE(0x1234, 0);
      try {
        let ref = buf.readInt16BE(1).toString(16);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_READ_INT_16_LE_001
     * @tc.name      : testReadInt16LE001
     * @tc.desc      : Reads a signed, little-endian 16-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadInt16LE001", 0, function () {
      let buf = buffer.alloc(2);
      buf.writeInt16BE(0x1234, 0);
      let ref = buf.readInt16LE(0).toString(16);
      expect(ref).assertEqual("3412");
    });

    /**
     * @tc.number    : TEST_READ_INT_16_LE_002
     * @tc.name      : testReadInt16LE002
     * @tc.desc      : Reads a signed, little-endian 16-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadInt16LE002", 0, function () {
      let buf = buffer.alloc(2);
      buf.writeInt16BE(0x1234, 0);
      try {
        let ref = buf.readInt16LE(1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_READ_INT_32_BE_001
     * @tc.name      : testReadInt32BE001
     * @tc.desc      : Reads a signed, big-endian 32-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadInt32BE001", 0, function () {
      let buf = buffer.alloc(4);
      buf.writeInt32BE(0x12345678, 0);
      let ref = buf.readInt32BE(0).toString(16);
      expect(ref).assertEqual("12345678");
    });

    /**
     * @tc.number    : TEST_READ_INT_32_BE_002
     * @tc.name      : testReadInt32BE002
     * @tc.desc      : Reads a signed, big-endian 32-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadInt32BE002", 0, function () {
      let buf = buffer.alloc(4);
      buf.writeInt32BE(0x12345678, 0);
      try {
        let ref = buf.readInt32BE(1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_READ_INT_32_LE_001
     * @tc.name      : testReadInt32LE001
     * @tc.desc      : Reads a signed, little-endian 32-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadInt32LE001", 0, function () {
      let buf = buffer.alloc(4);
      buf.writeInt32BE(0x12345678, 0);
      let ref = buf.readInt32LE(0).toString(16);
      expect(ref).assertEqual("78563412");
    });

    /**
     * @tc.number    : TEST_READ_INT_32_LE_002
     * @tc.name      : testReadInt32LE002
     * @tc.desc      : Reads a signed, little-endian 32-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadInt32LE002", 0, function () {
      let buf = buffer.alloc(4);
      buf.writeInt32BE(0x12345678, 0);
      try {
        let ref = buf.readInt32LE(1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_READ_INT_BE_001
     * @tc.name      : testReadIntBE001
     * @tc.desc      : Reads byteLength number of bytes from buf at the specified offset and interprets
     *                 the result as a big-endian, two's complement signed value supporting up to 48 bits of accuracy.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadIntBE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(6);
      buf.writeIntBE(0x123456789011, 0, 6);
      let ref = buf.readIntBE(0, 5).toString(16);
      expect(ref).assertEqual("1234567890");
    });

    /**
     * @tc.number    : TEST_READ_INT_BE_002
     * @tc.name      : testReadIntBE002
     * @tc.desc      : Reads byteLength number of bytes from buf at the specified offset and interprets
     *                 the result as a big-endian, two's complement signed value supporting up to 48 bits of accuracy.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadIntBE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(6);
      buf.writeIntBE(0x123456789011, 0, 6);
      try {
        let ref = buf.readIntBE(2, 5).toString(16);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: 2');
      }
    });

    /**
     * @tc.number    : TEST_READ_INT_LE_001
     * @tc.name      : testReadIntLE001
     * @tc.desc      : Reads byteLength number of bytes from buf at the specified offset and interprets
     *                 the result as a little-endian, two's complement signed value supporting up to 48 bits of accuracy.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadIntLE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(6);
      buf.writeIntLE(0x123456789011, 0, 6);
      let ref = buf.readIntLE(0, 5).toString(16);
      expect(ref).assertEqual("3456789011");
    });

    /**
     * @tc.number    : TEST_READ_INT_LE_002
     * @tc.name      : testReadIntLE002
     * @tc.desc      : Reads byteLength number of bytes from buf at the specified offset and interprets
     *                 the result as a little-endian, two's complement signed value supporting up to 48 bits of accuracy.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadIntLE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(6);
      buf.writeIntLE(0x123456789011, 0, 6);
      try {
        let ref = buf.readIntLE(2, 5).toString(16);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: 2');
      }
    });

    /**
     * @tc.number    : TEST_READ_U_INT_8_001
     * @tc.name      : testReadUInt8001
     * @tc.desc      : Reads an unsigned 8-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadUInt8001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt8(0x42);
      let ref = buf.readUInt8(0).toString(16);
      expect(ref).assertEqual("42");
    });

    /**
     * @tc.number    : TEST_READ_U_INT_8_002
     * @tc.name      : testReadUInt8002
     * @tc.desc      : Reads an unsigned 8-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadUInt8002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt8(0x42);
      try {
        let ref = buf.readUInt8(4).toString(16);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 3. Received value is: 4');
      }
    });

    /**
     * @tc.number    : TEST_READ_U_INT_16_BE_001
     * @tc.name      : testReadUInt16BE001
     * @tc.desc      : Reads an unsigned, big-endian 16-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadUInt16BE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt16BE(0x1234, 0);
      let ref = buf.readUInt16BE(0).toString(16);
      expect(ref).assertEqual("1234");
    });

    /**
     * @tc.number    : TEST_READ_U_INT_16_BE_002
     * @tc.name      : testReadUInt16BE002
     * @tc.desc      : Reads an unsigned, big-endian 16-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadUInt16BE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt16BE(0x1234, 0);
      try {
        let ref = buf.readUInt16BE(3).toString(16);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 2. Received value is: 3');
      }
    });

    /**
     * @tc.number    : TEST_READ_U_INT_16_LE_001
     * @tc.name      : testReadUInt16LE001
     * @tc.desc      : Reads an unsigned, little-endian 16-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadUInt16LE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt16LE(0x1234, 0);
      let ref = buf.readUInt16LE(0).toString(16);
      expect(ref).assertEqual("1234");
    });

    /**
     * @tc.number    : TEST_READ_U_INT_16_LE_002
     * @tc.name      : testReadUInt16LE002
     * @tc.desc      : Reads an unsigned, little-endian 16-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadUInt16LE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt16LE(0x1234, 0);
      try {
        let ref = buf.readUInt16LE(3).toString(16);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 2. Received value is: 3');
      }
    });

    /**
     * @tc.number    : TEST_READ_U_INT_32_BE_001
     * @tc.name      : testReadUInt32BE001
     * @tc.desc      : Reads an unsigned, big-endian 32-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadUInt32BE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt32BE(0x12345678, 0);
      let ref = buf.readUInt32BE(0).toString(16);
      expect(ref).assertEqual("12345678");
    });

    /**
     * @tc.number    : TEST_READ_U_INT_32_BE_002
     * @tc.name      : testReadUInt32BE002
     * @tc.desc      : Reads an unsigned, big-endian 32-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadUInt32BE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt32BE(0x12345678, 0);
      try {
        let ref = buf.readUInt32BE(1).toString(16);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_READ_U_INT_32_LE_001
     * @tc.name      : testReadUInt32LE001
     * @tc.desc      : Reads an unsigned, little-endian 32-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadUInt32LE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt32LE(0x12345678, 0);
      let ref = buf.readUInt32LE(0).toString(16);
      expect(ref).assertEqual("12345678");
    });

    /**
     * @tc.number    : TEST_READ_U_INT_32_LE_002
     * @tc.name      : testReadUInt32LE002
     * @tc.desc      : Reads an unsigned, little-endian 32-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadUInt32LE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt32LE(0x12345678, 0);
      try {
        let ref = buf.readUInt32LE(1).toString(16);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_READ_U_INT_BE_001
     * @tc.name      : testReadUIntBE001
     * @tc.desc      : Reads an unsigned 8-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadUIntBE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUIntBE(0x13141516, 0, 4);
      let ref = buf.readUIntBE(0, 3).toString(16);
      expect(ref).assertEqual("131415");
    });

    /**
     * @tc.number    : TEST_READ_U_INT_BE_002
     * @tc.name      : testReadUIntBE002
     * @tc.desc      : Reads an unsigned 8-bit integer from buf at the specified offset.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadUIntBE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUIntBE(0x13141516, 0, 4);
      try {
        let ref = buf.readUIntBE(2, 3).toString(16);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: 2');
      }
    });

    /**
     * @tc.number    : TEST_READ_U_INT_LE_001
     * @tc.name      : testReadUIntLE001
     * @tc.desc      : Reads byteLength number of bytes from buf at the specified offset and interprets
     *                 the result as an unsigned, little-endian integer supporting up to 48 bits of accuracy.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadUIntLE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUIntLE(0x13141516, 0, 4);
      let ref = buf.readUIntLE(0, 3).toString(16);
      expect(ref).assertEqual("141516");
    });

    /**
     * @tc.number    : TEST_READ_U_INT_LE_002
     * @tc.name      : testReadUIntLE002
     * @tc.desc      : Reads byteLength number of bytes from buf at the specified offset and interprets
     *                 the result as an unsigned, little-endian integer supporting up to 48 bits of accuracy.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testReadUIntLE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUIntLE(0x13141516, 0, 4);
      try {
        let ref = buf.readUIntLE(2, 3).toString(16);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: 2');
      }
    });

    /**
     * @tc.number    : TEST_SUBARRAY_001
     * @tc.name      : testSubarray001
     * @tc.desc      : Returns a new Buffer that references the same memory as the original,
     *                 but offset and cropped by the start and end indices.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.subarray(0, 3);
     */
    it("testSubarray001", 0, function () {
      let buf1 = buffer.from("1236");
      let buf = buf1.subarray(0, 3);
      let str = buf.toString();
      expect(str).assertEqual("123");
    });

    /**
     * @tc.number    : TEST_SUBARRAY_002
     * @tc.name      : testSubarray002
     * @tc.desc      : Returns a new Buffer that references the same memory as the original,
     *                 but offset and cropped by the start and end indices.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.subarray(3, 4);
     */
    it("testSubarray002", 0, function () {
      let buf1 = buffer.from("1236");
      let buf = buf1.subarray(3, 4);
      let str = buf.toString();
      expect(str).assertEqual("6");
    });

    /**
     * @tc.number    : TEST_SUBARRAY_003
     * @tc.name      : testSubarray003
     * @tc.desc      : Returns a new Buffer that references the same memory as the original,
     *                 but offset and cropped by the start and end indices.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.subarray(-3, 0);
     */
    it("testSubarray003", 0, function () {
      let buf1 = buffer.from("1236");
      let buf = buf1.subarray(-3, 0);
      expect(buf.length).assertEqual(0);
    });

    /**
     * @tc.number    : TEST_SUBARRAY_004
     * @tc.name      : testSubarray004
     * @tc.desc      : Returns a new Buffer that references the same memory as the original,
     *                 but offset and cropped by the start and end indices.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.subarray(6, 9);
     */
    it("testSubarray004", 0, function () {
      let buf1 = buffer.from("1236");
      let buf = buf1.subarray(6, 9);
      expect(buf.length).assertEqual(0);
    });

    /**
     * @tc.number    : TEST_SWAP_16_001
     * @tc.name      : testSwap16001
     * @tc.desc      : Interprets buf as an array of unsigned 16-bit integers and swaps the byte order in-place.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.swap16();
     */
    it("testSwap16001", 0, function () {
      let buf1 = buffer.from("1323");
      buf1.swap16();
      let str = buf1.toString("hex");
      expect(str).assertEqual("33313332");
    });

    /**
     * @tc.number    : TEST_SWAP_16_002
     * @tc.name      : testSwap16002
     * @tc.desc      : Interprets buf as an array of unsigned 16-bit integers and swaps the byte order in-place.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.swap16();
     */
    it("testSwap16002", 0, function () {
      let buf1 = buffer.from("132");
      try {
        buf1.swap16();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual("Buffer size must be a multiple of 16-bits");
      }
    });

    /**
     * @tc.number    : TEST_SWAP_32_001
     * @tc.name      : testSwap32001
     * @tc.desc      : Interprets buf as an array of unsigned 32-bit integers and swaps the byte order in-place.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.swap32();
     */
    it("testSwap32001", 0, function () {
      let buf1 = buffer.from("1234");
      buf1.swap32();
      let str = buf1.toString();
      expect(str).assertEqual("4321");
    });

    /**
     * @tc.number    : TEST_SWAP_32_002
     * @tc.name      : testSwap32002
     * @tc.desc      : Interprets buf as an array of unsigned 16-bit integers and swaps the byte order in-place.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.swap32();
     */
    it("testSwap32002", 0, function () {
      let buf1 = buffer.from("132");
      try {
        buf1.swap32();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual("Buffer size must be a multiple of 32-bits");
      }
    });

    /**
     * @tc.number    : TEST_SWAP_64_001
     * @tc.name      : testSwap64001
     * @tc.desc      : Interprets buf as an array of unsigned 64-bit integers and swaps the byte order in-place.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.swap64();
     */
    it("testSwap64001", 0, function () {
      let buf1 = buffer.from("12345678");
      buf1.swap64();
      let str = buf1.toString();
      expect(str).assertEqual("87654321");
    });

    /**
     * @tc.number    : TEST_SWAP_64_002
     * @tc.name      : testSwap64002
     * @tc.desc      : Interprets buf as an array of unsigned 64-bit integers and swaps the byte order in-place.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.swap64();
     */
    it("testSwap64002", 0, function () {
      let buf1 = buffer.from("1234567");
      try {
        buf1.swap64();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual("Buffer size must be a multiple of 64-bits");
      }
    });

    /**
     * @tc.number    : TEST_TO_JSON_001
     * @tc.name      : testToJSON001
     * @tc.desc      : Returns a JSON representation of buf.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.toJSON();
     */
    it("testToJSON001", 0, function () {
      let buf1 = buffer.from([0x1, 0x2, 0x3, 0x4, 0x5]);
      let obj = buf1.toJSON();
      expect(obj["data"].length == 5).assertTrue();
    });

    /**
     * @tc.number    : TEST_TO_STRING_001
     * @tc.name      : testToString001
     * @tc.desc      : Decodes buf to a string according to the specified character encoding in encoding.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.toString();
     */
    it("testToString001", 0, function () {
      let buf1 = buffer.from("1236");
      let str = buf1.toString();
      expect(str).assertEqual("1236");
    });

    /**
     * @tc.number    : TEST_TO_STRING_002
     * @tc.name      : testToString002
     * @tc.desc      : Decodes buf to a string according to the specified character encoding in encoding.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.toString();
     */
    it("testToString002", 0, function () {
      let buf1 = buffer.from("张三");
      let str = buf1.toString();
      expect(str).assertEqual("张三");
    });

    /**
     * @tc.number    : TEST_TO_STRING_003
     * @tc.name      : testToString003
     * @tc.desc      : Decodes buf to a string according to the specified character encoding in encoding.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.toString("binary");
     */
    it("testToString003", 0, function () {
      let buf1 = buffer.from("abc");
      let str = buf1.toString("binary");
      expect(str).assertEqual("abc");
    });

    /**
     * @tc.number    : TEST_TO_STRING_004
     * @tc.name      : testToString004
     * @tc.desc      : Decodes buf to a string according to the specified character encoding in encoding.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.toString("binary");
     */
    it("testToString004", 0, function () {
      let buf1 = buffer.from("abc");
      let str = buf1.toString("ascii");
      expect(str).assertEqual("abc");
    });

    /**
     * @tc.number    : TEST_TO_STRING_005
     * @tc.name      : testToString005
     * @tc.desc      : Decodes buf to a string according to the specified character encoding in encoding.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.toString("base64");
     */
    it("testToString005", 0, function () {
      let buf1 = buffer.from("abc");
      let str = buf1.toString("base64");
      expect(str).assertEqual("YWJj");
    });

    /**
     * @tc.number    : TEST_TO_STRING_006
     * @tc.name      : testToString006
     * @tc.desc      : Decodes buf to a string according to the specified character encoding in encoding.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.toString("hex");
     */
    it("testToString006", 0, function () {
      let buf1 = buffer.from("abc");
      let str = buf1.toString("hex");
      expect(str).assertEqual("616263");
    });

    /**
     * @tc.number    : TEST_TO_STRING_007
     * @tc.name      : testToString007
     * @tc.desc      : Decodes buf to a string according to the specified character encoding in encoding.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.toString("latin1");
     */
    it("testToString007", 0, function () {
      let buf1 = buffer.from("abc");
      let str = buf1.toString("latin1");
      expect(str).assertEqual("abc");
    });

    /**
     * @tc.number    : TEST_TO_STRING_008
     * @tc.name      : testToString008
     * @tc.desc      : Decodes buf to a string according to the specified character encoding in encoding.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.toString("ucs2");
     */
    it("testToString008", 0, function () {
      let buf1 = buffer.from("abc");
      let str = buf1.toString("ucs2");
      expect(str).assertEqual("扡");
    });

    /**
     * @tc.number    : TEST_TO_STRING_009
     * @tc.name      : testToString009
     * @tc.desc      : Decodes buf to a string according to the specified character encoding in encoding.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.toString("utf16le");
     */
    it("testToString009", 0, function () {
      let buf1 = buffer.from("abc");
      let str = buf1.toString("utf16le");
      expect(str).assertEqual("扡");
    });

    /**
     * @tc.number    : TEST_TO_STRING_010
     * @tc.name      : testToString010
     * @tc.desc      : Decodes buf to a string according to the specified character encoding in encoding.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf1.toString();
     */
    it("testToString010", 0, function () {
      let buf1 = buffer.from("!@#$%^&*");
      let str = buf1.toString();
      expect(str).assertEqual("!@#$%^&*");
    });

    /**
     * @tc.number    : TEST_WRITE_001
     * @tc.name      : testWrite001
     * @tc.desc      : Writes string to buf at offset according to the character encoding in encoding.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf.write("abcde", "latin1");
     */
    it("testWrite001", 0, function () {
      let buf = buffer.alloc(8);
      try {
        let offset = buf.write("abcde", -1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 7. Received value is: -1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_002
     * @tc.name      : testWrite002
     * @tc.desc      : Writes string to buf at offset according to the character encoding in encoding.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf.write("abcde", "latin1");
     */
    it("testWrite002", 0, function () {
      let buf = buffer.alloc(8);
      try {
        let offset = buf.write("abcde", 1, 9);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "length" is out of range. It must be >= 0 and <= 8. Received value is: 9');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_003
     * @tc.name      : testWrite003
     * @tc.desc      : Writes string to buf at offset according to the character encoding in encoding.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : buf.write("abcd", 0 ,4);
     */
    it("testWrite003", 0, function () {
      let buf = buffer.alloc(4);
      buf.write("abcd", 0, 4);
      const result = buf.toString();
      expect(result).assertEqual("abcd");
    });

    /**
     * @tc.number    : TEST_WRITE_BIG_INT_64_BE_001
     * @tc.name      : testWriteBigInt64BE001
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteBigInt64BE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(8);
      let ref = buf.writeBigInt64BE(BigInt(0x0102030405060708), 0);
      expect(ref).assertEqual(8);
    });

    /**
     * @tc.number    : TEST_WRITE_BIG_INT_64_BE_002
     * @tc.name      : testWriteBigInt64BE002
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteBigInt64BE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigInt64BE(BigInt(0x0102030405060708), 1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_BIG_INT_64_LE_001
     * @tc.name      : testWriteBigInt64LE001
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteBigInt64LE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(8);
      let ref = buf.writeBigInt64LE(BigInt(0x0102030405060708), 0);
      expect(ref).assertEqual(8);
    });

    /**
     * @tc.number    : TEST_WRITE_BIG_INT_64_LE_002
     * @tc.name      : testWriteBigInt64LE002
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteBigInt64LE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigInt64LE(BigInt(0x0102030405060708), 1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_BIG_U_INT_64_BE_001
     * @tc.name      : testWriteBigUInt64BE001
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteBigUInt64BE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(8);
      let ref = buf.writeBigUInt64BE(BigInt(0x0102030405060708), 0);
      expect(ref).assertEqual(8);
    });

    /**
     * @tc.number    : TEST_WRITE_BIG_U_INT_64_BE_002
     * @tc.name      : testWriteBigUInt64BE002
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteBigUInt64BE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigUInt64BE(BigInt(0x0102030405060708), 1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_BIG_U_INT_64_LE_001
     * @tc.name      : testWriteBigUInt64LE001
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteBigUInt64LE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(8);
      let ref = buf.writeBigUInt64LE(BigInt(0x0102030405060708), 0);
      expect(ref).assertEqual(8);
    });

    /**
     * @tc.number    : TEST_WRITE_BIG_U_INT_64_LE_002
     * @tc.name      : testWriteBigUInt64LE002
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteBigUInt64LE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigUInt64LE(BigInt(0x0102030405060708), 1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_DOUBLE_BE_001
     * @tc.name      : testWriteDoubleBE001
     * @tc.desc      : Writes string to buf at offset according to the character encoding in encoding.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteDoubleBE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(8);
      let ref = buf.writeDoubleBE(123.456, 0);
      expect(ref).assertEqual(8);
    });

    /**
     * @tc.number    : TEST_WRITE_DOUBLE_BE_002
     * @tc.name      : testWriteDoubleBE002
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteDoubleBE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeDoubleBE(123.456, 1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_DOUBLE_LE_001
     * @tc.name      : testWriteDoubleLE001
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteDoubleLE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(8);
      let ref = buf.writeDoubleLE(123.456, 0);
      expect(ref).assertEqual(8);
    });

    /**
     * @tc.number    : TEST_WRITE_DOUBLE_LE_002
     * @tc.name      : testWriteDoubleLE002
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteDoubleLE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeDoubleLE(123.456, 1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_FLOAT_BE_001
     * @tc.name      : testWriteFloatBE001
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteFloatBE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      let ref = buf.writeFloatBE(0xcabcbcbc, 0);
      expect(ref).assertEqual(4);
    });

    /**
     * @tc.number    : TEST_WRITE_FLOAT_BE_002
     * @tc.name      : testWriteFloatBE002
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteFloatBE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeFloatBE(0xcabcbcbc, 5);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 5');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_FLOAT_LE_001
     * @tc.name      : testWriteFloatLE001
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteFloatLE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(16);
      let ref = buf.writeFloatLE(0xcabcbcbc, 12);
      expect(ref).assertEqual(16);
    });

    /**
     * @tc.number    : TEST_WRITE_FLOAT_LE_002
     * @tc.name      : testWriteFloatLE002
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteFloatLE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeFloatLE(0xcabcbcbc, 5);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 5');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_INT_8_001
     * @tc.name      : testWriteInt8001
     * @tc.desc      : Writes value to buf at the specified offset.
     *                 value must be a valid signed 8-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteInt8001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(2);
      let ref = buf.writeInt8(2, 0);
      expect(ref).assertEqual(1);
    });

    /**
     * @tc.number    : TEST_WRITE_INT_8_002
     * @tc.name      : testWriteInt8002
     * @tc.desc      : Writes value to buf at the specified offset.
     *                 value must be a valid signed 8-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteInt8002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(2);
      try {
        let ref = buf.writeInt8(2, -1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: -1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_INT_8_003
     * @tc.name      : testWriteInt8003
     * @tc.desc      : Writes value to buf at the specified offset.value must be a valid signed 8-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteInt8003", 0, function () {
      let buf = buffer.allocUninitializedFromPool(2);
      try {
        let ref = buf.writeInt8(0x13245, 0);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -128 and <= 127. Received value is: 78405');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_INT_8_004
     * @tc.name      : testWriteInt8004
     * @tc.desc      : Writes value to buf at the specified offset.value must be a valid signed 8-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteInt8004", 0, function () {
      let buf = buffer.allocUninitializedFromPool(2);
      let ref = buf.writeInt8(0x2, 1);
      expect(ref).assertEqual(2);
    });

    /**
     * @tc.number    : TEST_WRITE_INT_16_BE_001
     * @tc.name      : testWriteInt16BE001
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     *                 The value must be a valid signed 16-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeInt32LE(0x12345678, 0);
     */
    it("testWriteInt16BE001", 0, function () {
      let buf = buffer.alloc(2);
      let ref = buf.writeInt16BE(0x7bca, 0);
      expect(ref).assertEqual(2);
    });

    /**
     * @tc.number    : TEST_WRITE_INT_16_BE_002
     * @tc.name      : testWriteInt16BE002
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     *                 The value must be a valid signed 16-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteInt16BE002", 0, function () {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16BE(0x7bca, -1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_INT_16_BE_003
     * @tc.name      : testWriteInt16BE003
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     *                 The value must be a valid signed 16-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteInt16BE003", 0, function () {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16BE(0x123456, 0);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 1193046');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_INT_16_BE_004
     * @tc.name      : testWriteInt16BE004
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     *                 The value must be a valid signed 16-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteInt16BE004", 0, function () {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16BE(0x7bca, 1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_INT_16_LE_001
     * @tc.name      : testWriteInt16LE001
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     *                 The value must be a valid signed 16-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeInt16LE(0x1234, 0);
     */
    it("testWriteInt16LE001", 0, function () {
      let buf = buffer.alloc(2);
      let ref = buf.writeInt16LE(0x1234, 0);
      expect(ref).assertEqual(2);
    });

    /**
     * @tc.number    : TEST_WRITE_INT_16_LE_002
     * @tc.name      : testWriteInt16LE002
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     *                 The value must be a valid signed 16-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteInt16LE002", 0, function () {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16LE(0x7bca, -1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_INT_16_LE_003
     * @tc.name      : testWriteInt16LE003
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     *                 The value must be a valid signed 16-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteInt16LE003", 0, function () {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16LE(0x123456, 0);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 1193046');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_INT_16_LE_004
     * @tc.name      : testWriteInt16LE004
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     *                 The value must be a valid signed 16-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteInt16LE004", 0, function () {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16LE(0x1234, 1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_INT_32_BE_001
     * @tc.name      : testWriteInt32BE001
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     *                 The value must be a valid signed 32-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example: let ref = buf.writeInt32BE(0x12345678, 0);
     */
    it("testWriteInt32BE001", 0, function () {
      let buf = buffer.alloc(4);
      let ref = buf.writeInt32BE(0x12345678, 0);
      expect(ref).assertEqual(4);
    });

    /**
     * @tc.number    : TEST_WRITE_INT_32_BE_002
     * @tc.name      : testWriteInt32BE002
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     *                 The value must be a valid signed 32-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteInt32BE002", 0, function () {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32BE(0x12345678, -1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_INT_32_BE_003
     * @tc.name      : testWriteInt32BE003
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     *                 The value must be a valid signed 32-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteInt32BE003", 0, function () {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32BE(0x123456789, 0);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 4886718345');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_INT_32_LE_001
     * @tc.name      : testWriteInt32LE001
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     *                 The value must be a valid signed 32-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeInt32LE(0x12345678, 0);
     */
    it("testWriteInt32LE001", 0, function () {
      let buf = buffer.alloc(4);
      let ref = buf.writeInt32LE(0x12345678, 0);
      expect(ref).assertEqual(4);
    });

    /**
     * @tc.number    : TEST_WRITE_INT_32_LE_002
     * @tc.name      : testWriteInt32LE002
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     *                 The value must be a valid signed 32-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeInt32LE(0x12345678, -1);
     */
    it("testWriteInt32LE002", 0, function () {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32LE(0x12345678, -1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_INT_32_LE_003
     * @tc.name      : testWriteInt32LE003
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     *                 The value must be a valid signed 32-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeInt32LE(0x12345678, 0);
     */
    it("testWriteInt32LE003", 0, function () {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32LE(0x123456789, 0);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 4886718345');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_INT_32_LE_004
     * @tc.name      : testWriteInt32LE004
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     *                 The value must be a valid signed 32-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeInt32LE(0x12345678, 1);
     */
    it("testWriteInt32LE004", 0, function () {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32LE(0x12345678, 1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_INT_BE_001
     * @tc.name      : testWriteIntBE001
     * @tc.desc      : Writes byteLength bytes of value to buf at the specified offset as big-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeInt32LE(0x12345678, 1);
     */
    it("testWriteIntBE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(6);
      let ref = buf.writeIntBE(0x1234567890ab, 0, 6);
      expect(ref).assertEqual(6);
    });

    /**
     * @tc.number    : TEST_WRITE_INT_BE_002
     * @tc.name      : testWriteIntBE002
     * @tc.desc      : Writes byteLength bytes of value to buf at the specified offset as big-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeInt32LE(0x12345678, 1);
     */
    it("testWriteIntBE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntBE(0x1234567890ab, 1, 6);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_INT_LE_001
     * @tc.name      : testWriteIntLE001
     * @tc.desc      : Writes byteLength bytes of value to buf at the specified offset as little-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeInt32LE(0x12345678, 1);
     */
    it("testWriteIntLE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(6);
      let ref = buf.writeIntLE(0x1234567890ab, 0, 6);
      expect(ref).assertEqual(6);
    });

    /**
     * @tc.number    : TEST_WRITE_INT_LE_002
     * @tc.name      : testWriteIntLE002
     * @tc.desc      : Writes byteLength bytes of value to buf at the specified offset as little-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeIntLE(0x1234567890ab, 1, 6);
     */
    it("testWriteIntLE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntLE(0x1234567890ab, 1, 6);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_8_001
     * @tc.name      : testWriteUInt8001
     * @tc.desc      : Writes value to buf at the specified offset. value must be a valid unsigned 8-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeUInt8(0x42, 3);
     */
    it("testWriteUInt8001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      let ref = buf.writeUInt8(0x42, 3);
      expect(ref).assertEqual(4);
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_8_002
     * @tc.name      : testWriteUInt8002
     * @tc.desc      : Writes value to buf at the specified offset. value must be a valid unsigned 8-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeUInt8(0x42, -1);
     */
    it("testWriteUInt8002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt8(0x42, -1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 3. Received value is: -1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_8_003
     * @tc.name      : testWriteUInt8003
     * @tc.desc      : Writes value to buf at the specified offset. value must be a valid unsigned 8-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeUInt8(0x42, 1);
     */
    it("testWriteUInt8003", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      let ref = buf.writeUInt8(0x42, 1);
      expect(ref).assertEqual(2);
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_16_BE_001
     * @tc.name      : testWriteUInt16BE001
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     *                 The value must be a valid unsigned 16-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeUInt8(0x42, 1);
     */
    it("testWriteUInt16BE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      let ref = buf.writeUInt16BE(0xdead, 0);
      expect(ref).assertEqual(2);
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_16_BE_002
     * @tc.name      : testWriteUInt16BE002
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     *                 The value must be a valid unsigned 16-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeUInt16BE(0xdeadfc, 0);
     */
    it("testWriteUInt16BE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16BE(0xdeadfc, 0);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 14593532');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_16_BE_003
     * @tc.name      : testWriteUInt16BE003
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     *                 The value must be a valid unsigned 16-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeUInt16BE(0xdeadfc, 0);
     */
    it("testWriteUInt16BE003", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16BE(0xdead, -1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 2. Received value is: -1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_16_BE_004
     * @tc.name      : testWriteUInt16BE004
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     *                 The value must be a valid unsigned 16-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeUInt16LE(0xdead, 1);
     */
    it("testWriteUInt16BE004", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      let ref = buf.writeUInt16BE(0xdead, 1);
      expect(ref).assertEqual(3);
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_16_LE_001
     * @tc.name      : testWriteUInt16LE001
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     *                 The value must be a valid unsigned 16-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeUInt16LE(0xdead, 0);
     */
    it("testWriteUInt16LE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      let ref = buf.writeUInt16LE(0xdead, 0);
      expect(ref).assertEqual(2);
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_16_LE_002
     * @tc.name      : testWriteUInt16LE002
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     *                 The value must be a valid unsigned 16-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteUInt16LE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16LE(0xdeadfc, 0);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 14593532');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_16_LE_003
     * @tc.name      : testWriteUInt16LE003
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     *                 The value must be a valid unsigned 16-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteUInt16LE003", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16LE(0xdead, -1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 2. Received value is: -1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_16_LE_004
     * @tc.name      : testWriteUInt16LE004
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     *                 The value must be a valid unsigned 16-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeUInt16LE(0xdead, 0);
     */
    it("testWriteUInt16LE004", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      let ref = buf.writeUInt16LE(0xdead, 1);
      expect(ref).assertEqual(3);
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_32_BE_001
     * @tc.name      : testWriteUInt32BE001
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     *                 The value must be a valid unsigned 32-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeUInt32BE(0xfeedface, 0);
     */
    it("testWriteUInt32BE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      let ref = buf.writeUInt32BE(0xfeedface, 0);
      expect(ref).assertEqual(4);
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_32_BE_002
     * @tc.name      : testWriteUInt32BE002
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     *                 The value must be a valid unsigned 32-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeUInt32BE(0xfeedface, -1);
     */
    it("testWriteUInt32BE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt32BE(0xfeedface, -1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_32_BE_003
     * @tc.name      : testWriteUInt32BE003
     * @tc.desc      : Writes value to buf at the specified offset as big-endian.
     *                 The value must be a valid unsigned 32-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeUInt32BE(0xfeedface, 1);
     */
    it("testWriteUInt32BE003", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt32BE(0xfeedface, 1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_32_LE_001
     * @tc.name      : testWriteUInt32LE001
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     *                 The value must be a valid unsigned 32-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeUInt32LE(0xfeedface, 0);
     */
    it("testWriteUInt32LE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      let ref = buf.writeUInt32LE(0xfeedface, 0);
      expect(ref).assertEqual(4);
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_32_LE_002
     * @tc.name      : testWriteUInt32LE002
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     *                 The value must be a valid unsigned 32-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeUInt32LE(0xfeedface, -1);
     */
    it("testWriteUInt32LE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt32LE(0xfeedface, -1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_32_LE_003
     * @tc.name      : testWriteUInt32LE003
     * @tc.desc      : Writes value to buf at the specified offset as little-endian.
     *                 The value must be a valid unsigned 32-bit integer.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeUInt32LE(0xfeedface, 1);
     */
    it("testWriteUInt32LE003", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt32LE(0xfeedface, 1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_BE_001
     * @tc.name      : testWriteUIntBE001
     * @tc.desc      : Writes byteLength bytes of value to buf at the specified offset as big-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeUInt8(0x42, 3);
     */
    it("testWriteUIntBE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      let ref = buf.writeUIntBE(0x13141516, 0, 4);
      expect(ref).assertEqual(4);
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_BE_002
     * @tc.name      : testWriteUIntBE002
     * @tc.desc      : Writes byteLength bytes of value to buf at the specified offset as big-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteUIntBE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUIntBE(0x13141516, 0, 1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 320083222');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_BE_003
     * @tc.name      : testWriteUIntBE003
     * @tc.desc      : Writes byteLength bytes of value to buf at the specified offset as big-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteUIntBE003", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUIntBE(0x13141516, 1, 4);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_LE_001
     * @tc.name      : testWriteUIntLE001
     * @tc.desc      : Writes byteLength bytes of value to buf at the specified offset as little-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let ref = buf.writeUIntLE(0x13141516, 0, 4);
     */
    it("testWriteUIntLE001", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      let ref = buf.writeUIntLE(0x13141516, 0, 4);
      expect(ref).assertEqual(4);
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_LE_002
     * @tc.name      : testWriteUIntLE002
     * @tc.desc      : Writes byteLength bytes of value to buf at the specified offset as little-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteUIntLE002", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUIntLE(0x13141516, 0, 1);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 320083222');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_LE_003
     * @tc.name      : testWriteUIntLE003
     * @tc.desc      : Writes byteLength bytes of value to buf at the specified offset as little-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteUIntLE003", 0, function () {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUIntLE(0x13141516, 1, 4);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
     * @tc.number    : TEST_WRITE_U_INT_LE_004
     * @tc.name      : testWriteUIntLE004
     * @tc.desc      : Writes byteLength bytes of value to buf at the specified offset as little-endian.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     */
    it("testWriteUIntLE004", 0, function () {
      let buf = buffer.allocUninitializedFromPool(5);
      let ref = buf.writeUIntLE(0x13141516, 1, 4);
      expect(ref).assertEqual(5);
    });

    /**
     * @tc.number    : TEST_BLOB_CONSTRUCTOR_001
     * @tc.name      : testBlobConstructor001
     * @tc.desc      : Creates a new Blob object containing a concatenation of the given sources.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
     */
    it("testBlobConstructor001", 0, async function () {
      let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
      let promise = blob2.text();
      promise.then((value) => {
        expect(value).assertEqual("abc");
      });
    });

    /**
     * @tc.number    : TEST_BLOB_CONSTRUCTOR_002
     * @tc.name      : testBlobConstructor002
     * @tc.desc      : Creates a new Blob object containing a concatenation of the given sources.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let blob2 = new buffer.Blob([arrBuf], { type: "new type", endings: "transparent" });
     */
    it("testBlobConstructor002", 0, async function () {
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
     * @tc.number    : TEST_BLOB_CONSTRUCTOR_003
     * @tc.name      : testBlobConstructor003
     * @tc.desc      : Creates a new Blob object containing a concatenation of the given sources.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let blob2 = new buffer.Blob([uint8arr], { type: "new type", endings: "transparent" })
     */
    it("testBlobConstructor003", 0, async function () {
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
     * @tc.number    : TEST_BLOB_CONSTRUCTOR_004
     * @tc.name      : testBlobConstructor004
     * @tc.desc      : Creates a new Blob object containing a concatenation of the given sources.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let blob2 = new buffer.Blob([view], { type: "new type", endings: "transparent" })
     */
    it("testBlobConstructor004", 0, async function () {
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
     * @tc.number    : TEST_BLOB_CONSTRUCTOR_005
     * @tc.name      : testBlobConstructor005
     * @tc.desc      : Creates a new Blob object containing a concatenation of the given sources.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
     *                 let blob = new buffer.Blob([blob2]);
     */
    it("testBlobConstructor005", 0, async function () {
      let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
      let blob = new buffer.Blob([blob2]);
      blob.text().then((value) => {
        expect(value).assertEqual("abc");
      });
    });

    /**
     * @tc.number    : TEST_BLOB_SIZE_001
     * @tc.name      : testBlobSize001
     * @tc.desc      : The total size of the Blob in bytes.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 0
     */
    it("testBlobSize001", 0, function () {
      let blob = new buffer.Blob(["a", "b", "c"]);
      let size = blob.size;
      expect(size).assertEqual(3);
    });

    /**
     * @tc.number    : TEST_BLOB_TYPE_001
     * @tc.name      : testBlobType001
     * @tc.desc      : The content-type of the Blob.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 0
     */
    it("testBlobType001", 0, function () {
      let blob = new buffer.Blob(["a", "b", "c"], { type: "mime", endings: "transparent" });
      let type = blob.type;
      expect(type).assertEqual("mime");
    });

    /**
     * @tc.number    : TEST_BLOB_ARRAY_BUFFER_001
     * @tc.name      : testBlobArrayBuffer001
     * @tc.desc      : Returns a promise that fulfills with an <ArrayBuffer> containing a copy of the Blob data.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
     */
    it("testBlobArrayBuffer001", 0, async function () {
      let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
      blob2.arrayBuffer().then((value) => {
        let arr = new Uint8Array(value);
        for (let i = 0, len = arr.length; i < len; i++) {
          expect(arr[i]).assertEqual(97 + i);
        }
      });
    });

    /**
     * @tc.number    : TEST_BLOB_Slice_001
     * @tc.name      : testBlobSlice001
     * @tc.desc      : Creates and returns a new Blob containing a subset of this Blob objects data.
     *                 The original Blob is not altered.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
     *                 let blob = blob2.slice(0, 1);
     */
    it("testBlobSlice001", 0, async function () {
      let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
      let blob = blob2.slice(0, 1);
      blob.arrayBuffer().then((value) => {
        let arr = new Uint8Array(value);
        expect(arr[0]).assertEqual(97);
        expect(arr[1]).assertEqual(98);
        expect(arr[2]).assertEqual(99);
      });
    });

    /**
     * @tc.number    : TEST_BLOB_TEXT_001
     * @tc.name      : testBlobText001
     * @tc.desc      : Returns a promise that fulfills with the contents of the Blob decoded as a UTF-8 string.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : level 2
     * For example   : let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
     */
    it("testBlobText001", 0, async function () {
      let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
      blob2.text().then((value) => {
        expect(value).assertEqual("abc");
      });
    });
  });
}
