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
import { buffer } from '@kit.ArkTS';

export default function bufferTest() {
  describe("ActsBufferTest", () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0100
     * @tc.name       : testAlloc0001
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferAlloc0001';
      try {
        let buf1 = buffer.alloc(0);
        expect(buf1.length).assertEqual(0);
        expect(buf1.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0200
     * @tc.name       : testAlloc0002
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferAlloc0002';
      try {
        let buf2 = buffer.alloc(3, 'a');
        expect(buf2.length).assertEqual(3);
        expect(buf2.toString()).assertEqual('aaa');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0300
     * @tc.name       : testAlloc0003
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferAlloc0003';
      try {
        let buf3 = buffer.alloc(5, buffer.from('hello'));
        const result = buf3.toString();
        console.log(`${TAG}result${result}`);
        expect(buf3.toString()).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0400
     * @tc.name       : testAlloc0004
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferAlloc0004';
      try {
        let buf4 = buffer.alloc(0, 0);
        const result = buf4.toString();
        console.log(`${TAG}result${result}`);
        expect(buf4.length).assertEqual(0);
        expect(buf4.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0500
     * @tc.name       : testAlloc0005
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferAlloc0005';
      try {
        let buf5 = buffer.alloc(0, -1);
        expect(buf5.length).assertEqual(0);
        expect(buf5.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0600
     * @tc.name       : testAlloc0006
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferAlloc0006';
      try {
        let buf6 = buffer.alloc(0, Infinity);
        expect(buf6.length).assertEqual(0);
        expect(buf6.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0700
     * @tc.name       : testAlloc0007
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferAlloc0007';
      try {
        let buf7 = buffer.alloc(0, -Infinity);
        expect(buf7.length).assertEqual(0);
        expect(buf7.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0800
     * @tc.name       : testAlloc0008
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferAlloc0008';
      try {
        let buf8 = buffer.alloc(3, 1);
        expect(buf8.length).assertEqual(3);
        for (let i = 0; i < buf8.length; i++) {
          expect(buf8[i]).assertEqual(1);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0900
     * @tc.name       : testAlloc0009
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferAlloc0009';
      try {
        let buf9 = buffer.alloc(3, '');
        expect(buf9.length).assertEqual(3);
        for (let i = 0; i < buf9.length; i++) {
          expect(buf9[i]).assertEqual(0);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1000
     * @tc.name       : testAlloc0010
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferAlloc0010';
      try {
        let buf10 = buffer.alloc(3, undefined);
        expect(buf10.length).assertEqual(3);
        for (let i = 0; i < buf10.length; i++) {
          expect(buf10[i]).assertEqual(0);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1100
     * @tc.name       : testAlloc0011
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferAlloc0011';
      try {
        let buf11 = buffer.alloc(11, 'aGVsbG8gd29ybGQ=', 'base64');
        console.log(`${TAG} buf11:${buf11.toString()}`);
        expect(buf11.length).assertEqual(11);
        expect(buf11.toString()).assertEqual('hello world');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1200
     * @tc.name       : testAlloc0012
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferAlloc0012';
      try {
        let buf12 = buffer.alloc(3, 'hello', 'utf8');
        expect(buf12.length).assertEqual(3);
        expect(buf12.toString()).assertEqual('hel');
        expect(buf12.toString('base64')).assertEqual('aGVs');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1300
     * @tc.name       : testAlloc0013
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferAlloc0013';
      try {
        let buf = buffer.alloc(0, 0);
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1400
     * @tc.name       : testAlloc0014
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferAlloc0014';
      try {
        let buf = buffer.alloc(0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 'base64');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1500
     * @tc.name       : testAlloc0015
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferAlloc0015';
      try {
        let buf = buffer.alloc(0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 'utf-8');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1600
     * @tc.name       : testAlloc0016
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferAlloc0016';
      try {
        let buf = buffer.alloc(0, -1, 'base64');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1700
     * @tc.name       : testAlloc0017
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferAlloc0017';
      try {
        let buf = buffer.alloc(0, -1, 'utf-8');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1800
     * @tc.name       : testAlloc0018
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAlloc0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferAlloc0018';
      try {
        let buf = buffer.alloc(0, -1, 'base64');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_0100
     * @tc.name       : testByteLength0001
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferByteLength0001';
      try {
        let str = '\u00bd + \u00bc = \u00be'
        const res = buffer.byteLength(str);
        expect(res).assertEqual(12);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_0200
     * @tc.name       : testByteLength0002
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferByteLength0002';
      try {
        let buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
        const res = buffer.byteLength(buf);
        expect(res).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_0300
     * @tc.name       : testByteLength0003
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferByteLength0003';
      try {
        let uint8Array = new Uint8Array([0x74, 0x79, 0x70, 0x65, 0x64]);
        const res = buffer.byteLength(uint8Array);
        expect(res).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_0400
     * @tc.name       : testByteLength0004
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferByteLength0004';
      try {
        let arrayBuffer = new ArrayBuffer(8);
        let dataView = new DataView(arrayBuffer);
        const res = buffer.byteLength(dataView);
        expect(res).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_0500
     * @tc.name       : testByteLength0005
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferByteLength0005';
      try {
        let arrayBuffer = new ArrayBuffer(8);
        expect(buffer.byteLength(arrayBuffer)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_0600
     * @tc.name       : testByteLength0006
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferByteLength0006';
      try {
        const sharedBuffer = new SharedArrayBuffer(8);
        expect(buffer.byteLength(sharedBuffer)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_0700
     * @tc.name       : testByteLength0007
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferByteLength0007';
      try {
        let buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
        const res = buffer.byteLength(buf, 'utf8');
        expect(res).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_0800
     * @tc.name       : testByteLength0008
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferByteLength0008';
      try {
        let buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
        const res = buffer.byteLength(buf, 'base64');
        expect(res).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_0900
     * @tc.name       : testByteLength0009
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferByteLength0009';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const dataView = new DataView(arrayBuffer);
        dataView.setUint8(0, 104);
        dataView.setUint8(1, 101);
        dataView.setUint8(2, 108);
        dataView.setUint8(3, 108);
        dataView.setUint8(4, 111);
        let buf = buffer.byteLength(dataView);
        expect(buf).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_1000
     * @tc.name       : testByteLength0010
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferByteLength0010';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const dataView = new DataView(arrayBuffer);
        dataView.setUint8(0, 104);
        dataView.setUint8(1, 101);
        dataView.setUint8(2, 108);
        dataView.setUint8(3, 108);
        dataView.setUint8(4, 111);
        let buf = buffer.byteLength(dataView, 'utf8');
        expect(buf).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTE_LENGTH_1100
     * @tc.name       : testByteLength0011
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLength0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferByteLength0011';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const dataView = new DataView(arrayBuffer);
        dataView.setUint8(0, 104);
        dataView.setUint8(1, 101);
        dataView.setUint8(2, 108);
        dataView.setUint8(3, 108);
        dataView.setUint8(4, 111);
        let buf = buffer.byteLength(dataView, 'base64');
        expect(buf).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0100
     * @tc.name       : testConcat0001
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferConcat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferConcat0001';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        let buf = buffer.concat([buf1, buf2]);
        // expect(buf.toString('hex')).assertEqual('3132333461626364');
        expect(buf.length).assertEqual(8);
        expect(buf.toString('utf8')).assertEqual('1234abcd');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0200
     * @tc.name       : testConcat0002
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferConcat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferConcat0002';
      try {
        let uint8Arr1 = new Uint8Array([1, 2, 3, 4]);
        let uint8Arr2 = new Uint8Array([5, 6, 7, 8]);
        let buf3 = buffer.concat([uint8Arr1, uint8Arr2]);
        expect(buf3.toString('hex')).assertEqual('0102030405060708');
        expect(buf3.length).assertEqual(8);
        expect(buf3.toString('utf8')).assertEqual('\u0001\u0002\u0003\u0004\u0005\u0006\u0007\u0008');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0300
     * @tc.name       : testConcat0003
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferConcat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferConcat0003';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        let buf4 = buffer.concat([buf1, buf2], undefined);
        expect(buf4.toString('hex')).assertEqual('3132333461626364');
        expect(buf4.length).assertEqual(8);
        expect(buf4.toString('utf8')).assertEqual('1234abcd');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0400
     * @tc.name       : testConcat0004
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferConcat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferConcat0004';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        let buf5 = buffer.concat([buf1, buf2], 0);
        expect(buf5.toString()).assertEqual('1234abcd');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0500
     * @tc.name       : testConcat0005
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferConcat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferConcat0005';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        buffer.concat([buf1, buf2], -1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}`);
        expect(e.message)
          .assertEqual('The value of "totalLength" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0600
     * @tc.name       : testConcat0006
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferConcat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      6
      const TAG = 'testBufferConcat0006';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        buffer.concat([buf1, buf2], Infinity);
        expect().assertFail();
      } catch (e) {

        console.error(`${TAG} failed: ${e.message}`);
        expect(e.message)
          .assertEqual('The value of "totalLength" is out of range. It must be >= 0 and <= 4294967296. Received value is: Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0700
     * @tc.name       : testConcat0007
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferConcat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferConcat0007';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        buffer.concat([buf1, buf2], -Infinity);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
        console.error(`${TAG} failed: ${e.message}`);
        expect(e.message)
          .assertEqual('The value of "totalLength" is out of range. It must be >= 0 and <= 4294967296. Received value is: -Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0800
     * @tc.name       : testConcat0008
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level
     */
    it('testBufferConcat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferConcat0008';
      try {
        let buf1 = buffer.from("L234");
        let buf2 = buffer.from("abcd");
        let buf3 = buffer.concat([buf1, buf2], 1);
        expect(buf3.toString()).assertEqual('L');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0900
     * @tc.name       : testConcat0009
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferConcat0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferConcat0009';
      try {
        const arr1 = new Uint8Array([104, 101, 108, 108, 111]);
        const arr2 = new Uint8Array([119, 111, 114, 108, 100]);
        const buf1 = buffer.from(arr1);
        const buf2 = buffer.from(arr2);
        const concatBuf = buffer.concat([buf1, buf2], -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "totalLength" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_1000
     * @tc.name       : testConcat0010
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferConcat0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferConcat0010';
      try {
        const arr1 = new Uint8Array([104, 101, 108, 108, 111]);
        const arr2 = new Uint8Array([119, 111, 114, 108, 100]);
        const buf1 = buffer.from(arr1);
        const buf2 = buffer.from(arr2);
        const concatBuf = buffer.concat([buf1, buf2], 1);
        expect(concatBuf.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_0100
     * @tc.name       : testFrom10001
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10001';
      try {
        const ab1 = new ArrayBuffer(8);
        const buf1 = buffer.from(ab1);
        expect(buf1.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_0200
     * @tc.name       : testFrom10002
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10002';
      try {
        const ab2 = new SharedArrayBuffer(8);
        const buf2 = buffer.from(ab2);
        expect(buf2.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_0300
     * @tc.name       : testFrom10003
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10003';
      try {
        const ab1 = new ArrayBuffer(8);
        const buf3 = buffer.from(ab1, undefined);
        expect(buf3.length).assertEqual(8);
      } catch (e) {
        expect(e.code).assertEqual(10200001);
        console.error(`${TAG} failed: ${e.message}` + e);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_0400
     * @tc.name       : testFrom10004
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10004';
      try {
        const ab1 = new ArrayBuffer(8);
        const buf4 = buffer.from(ab1, 0);
        expect(buf4.length).assertEqual(8);
      } catch (e) {
        expect(e.code).assertEqual(10200001);
        console.error(`${TAG} failed: ${e.message}` + e);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_0500
     * @tc.name       : testFrom10005
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10005';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, -1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.code).assertEqual(10200001);
        expect(e.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 8. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_0600
     * @tc.name       : testFrom10006
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10006';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, Infinity);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 8. Received value is: Infinity')

      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_0700
     * @tc.name       : testFrom10007
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10007';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, -Infinity);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 8. Received value is: -Infinity')

      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_0800
     * @tc.name       : testFrom10008
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10008';
      try {
        const ab1 = new ArrayBuffer(8);
        const res = buffer.from(ab1, 4, 0);
        expect(res.length).assertEqual(0);
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_0900
     * @tc.name       : testFrom10009
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10009';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, 0, -1);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "length" is out of range. It must be >= 0 and <= 8. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_1000
     * @tc.name       : testFrom10010
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10010';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, 0, Infinity);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "length" is out of range. It must be >= 0 and <= 8. Received value is: Infinity')

      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_1100
     * @tc.name       : testFrom10011
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10011';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, 0, -Infinity);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect(e.message)
          .assertEqual('The value of "length" is out of range. It must be >= 0 and <= 8. Received value is: -Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_1200
     * @tc.name       : testFrom10012
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10012';
      try {
        const ab1 = new ArrayBuffer(8);
        const res = buffer.from(ab1, 0, 1);
        expect(ab1.byteLength).assertEqual(8);
        expect(res.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_1300
     * @tc.name       : testFrom10013
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10013';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const uint8Array = new Uint8Array(arrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111]);
        const buf = buffer.from(arrayBuffer, Infinity, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 5. Received value is: Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM1_1400
     * @tc.name       : testFrom10014
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom10014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom10014';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const uint8Array = new Uint8Array(arrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111]);
        const buf = buffer.from(arrayBuffer, Infinity, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 5. Received value is: Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM2_0100
     * @tc.name       : testFrom20001
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom20001';
      try {
        const buf1 = buffer.from('test');
        const buf2 = buffer.from(buf1);
        expect(buf2.toString()).assertEqual('test');
        buf1[0] = 'T'.charCodeAt(0);
        expect(buf2.toString()).assertEqual('test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM2_0200
     * @tc.name       : testFrom20002
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom20002';
      try {
        const uint8Arr = new Uint8Array([1, 2, 3]);
        const buf3 = buffer.from(uint8Arr);
        const result: number[] = [];
        for (let i = 0; i < buf3.length; i++) {
          result.push(buf3[i]);
        }
        console.log(`${TAG} result: ${result}`);
        expect(result.join(',')).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM2_0300
     * @tc.name       : testFrom20003
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom20003';
      try {
        const invalidInput = new String('invalid');
        const result = buffer.from(invalidInput);
        expect(result.length).assertEqual(7);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM2_0400
     * @tc.name       : testFrom20004
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom20004';
      try {
        buffer.from(undefined);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}`);
        expect(e.message)
          .assertEqual('Parameter error. The type of "value" must be Buffer or ArrayBuffer, Array, Array-like, string, object. Received value is: undefined');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM2_0500
     * @tc.name       : testFrom20005
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom20005';
      try {
        const emptyBuf = buffer.from(new Uint8Array(0));
        expect(emptyBuf.length).assertEqual(0);
      } catch (e) {
        expect(e.code).assertEqual(10200001);
        console.error(`${TAG} failed: ${e.message}` + e);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM2_0600
     * @tc.name       : testFrom20006
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom20006';
      try {
        const sharedArrayBuffer = new SharedArrayBuffer(10);
        const uint8Array = new Uint8Array(sharedArrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111, 119, 111, 114, 108, 100]);
        const buf = buffer.from(sharedArrayBuffer, undefined);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM2_0700
     * @tc.name       : testFrom20007
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom20007';
      try {
        const sharedArrayBuffer = new SharedArrayBuffer(10);
        const uint8Array = new Uint8Array(sharedArrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111, 119, 111, 114, 108, 100]);
        const buf = buffer.from(sharedArrayBuffer, 0);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM2_0800
     * @tc.name       : testFrom20008
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom20008';
      try {
        const sharedArrayBuffer = new SharedArrayBuffer(10);
        const uint8Array = new Uint8Array(sharedArrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111, 119, 111, 114, 108, 100]);
        const buf = buffer.from(sharedArrayBuffer, 0, 0);
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_0100
     * @tc.name       : testFrom30001
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30001';
      try {
        let buf = buffer.from(new String('this is a test'), 11, 0);
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (error) {
        console.error(`${TAG} failed:${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_0200
     * @tc.name       : testFrom30002
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30002';
      try {
        let buf = buffer.from(new String('this is a test'), 11, -1);
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (error) {
        console.error(`${TAG} error:${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_0300
     * @tc.name       : testFrom30003
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30003';
      try {
        let buf = buffer.from(new String('this is a test'), 11, Infinity);
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_0400
     * @tc.name       : testFrom30004
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30004';
      try {
        let buf = buffer.from(new String('hello world'), 1, -Infinity);
        expect(buf.length).assertEqual(11);
        expect(buf.toString()).assertEqual('hello world');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_0500
     * @tc.name       : testFrom30005
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30005';
      try {
        let buf = buffer.from(new String('hello world'), 'test', 1);
        expect(buf).assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect(error.message)
          .assertEqual('Parameter error. The type of "encoding" must be BufferEncoding. the encoding test is unknown');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_0600
     * @tc.name       : testFrom30006
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30006';
      try {
        let buf = buffer.from(new String('this is a test'), 'utf8', -1);
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_0700
     * @tc.name       : testFrom30007
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30007';
      try {
        let buf = buffer.from(new String('this is a test'), 'utf8', Infinity);
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_0800
     * @tc.name       : testFrom30008
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30008';
      try {
        let buf = buffer.from(new String('this is a test'), 'utf8', -Infinity);
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_0900
     * @tc.name       : testFrom30009
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30009';
      try {
        class Person {
          name: string;
          age: number;

          constructor(name: string, age: number) {
            this.name = name;
            this.age = age;
          }
        }

        const person = new Person("Alice", 30);
        buffer.from(person, 11, 0);
        buffer.from(person, 11, -1);
        buffer.from(person, 11, Infinity);
        buffer.from(person, 11, -Infinity);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} error:${e.message}`);
        expect(e.message)
          .assertEqual('Parameter error. The type of "value" must be Buffer or ArrayBuffer, Array, Array-like. Received value is: Person');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_1000
     * @tc.name       : testFrom30010
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30010';
      try {
        const testStringObject = new String('hello');
        const buf = buffer.from(testStringObject, 'utf-8', -1);
        expect(buf.toString('utf-8')).assertEqual('hello');
        expect(buf.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM3_1100
     * @tc.name       : testFrom30011
     * @tc.desc       : Test the function of the interface From3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom30011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom30011';
      try {
        class MyClass {
          public value: string;

          constructor(value: string) {
            this.value = value;
          }

          toString(): string {
            return this.value;
          }
        }

        const testStringObject = new MyClass('hello');
        const buf = buffer.from(testStringObject, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('Parameter error. The type of "value" must be Buffer or ArrayBuffer, Array, Array-like. Received value is: MyClass');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM4_0100
     * @tc.name       : testFrom40001
     * @tc.desc       : Test the function of the interface From4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom40001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom40001';
      try {
        let buf = buffer.from('this is a test');
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM4_0200
     * @tc.name       : testFrom40002
     * @tc.desc       : Test the function of the interface From4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom40002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom40002';
      try {
        let buf = buffer.from('abc', 'base64');
        expect(buf.toString()).assertEqual('i·');
        expect(buf.length).assertEqual(2);
        expect(buf.toString('base64')).assertEqual('abc=');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FROM4_0300
     * @tc.name       : testFrom40003
     * @tc.desc       : Test the function of the interface From4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFrom40003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFrom40003';
      try {
        let buf = buffer.from('this is a test', 'utf-8');
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0100
     * @tc.name       : testCompare0001
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0001';
      try {
        let buf1 = buffer.from('1234');
        let buf2 = buffer.from('0123');
        let res = buf1.compare(buf2);
        expect(res).assertEqual(1);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0200
     * @tc.name       : testCompare0002
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCompare0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0002';
      try {
        let buf1 = buffer.from('1234');
        let buf2 = new Uint8Array([1, 2, 3, 4]);
        let res = buf1.compare(buf2);
        console.info(Number(res).toString());
        expect(res).assertEqual(1);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0300
     * @tc.name       : testCompare0003
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCompare0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0003';
      try {
        let buf1 = new Uint8Array([1, 2, 3, 4]);
        let buf2 = buffer.from('1234');
        let res = buf2.compare(buf1);
        console.info(Number(res).toString());
        expect(res).assertEqual(1);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0400
     * @tc.name       : testCompare0004
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCompare0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCompare0004';
      try {
        let buf1 = new Uint8Array([1, 2, 3, 4]);
        let buf2 = new Uint8Array([1, 2, 3, 4]);
        let buf1Buffer = buffer.from(buf1);
        let buf2Buffer = buffer.from(buf2);
        let res = buf1Buffer.compare(buf2Buffer);
        console.info(Number(res).toString());
        expect(res).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0100
     * @tc.name       : testTranscode0001
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferTranscode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferTranscode0001';
      try {
        let buf = buffer.from('€')
        let newBuf = buffer.transcode(buf, 'base64', 'base64');
        expect(newBuf.toString()).assertEqual('€');
        expect(newBuf.length).assertEqual(3);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0200
     * @tc.name       : testTranscode0002
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferTranscode0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferTranscode0002';
      try {
        let buf = buffer.from('hello world');
        let newBuf = buffer.transcode(buf, 'base64', 'utf-8');
        expect(newBuf.toString()).assertEqual('aGVsbG8gd29ybGQ=');
        expect(newBuf.length).assertEqual(16);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0300
     * @tc.name       : testTranscode0003
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferTranscode0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferTranscode0003';
      try {
        let buf = buffer.from('hello world');
        let newBuf = buffer.transcode(buf, 'utf-8', 'base64');
        console.log(`${TAG} newBuf:${newBuf}`)
        // expect(newBuf.toString('base64')).assertEqual('helljx9/AAA=');
        expect(newBuf.length).assertEqual(8);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0400
     * @tc.name       : testTranscode0004
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferTranscode0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferTranscode0004';
      try {
        let buf = buffer.from('hello world');
        let newBuf = buffer.transcode(buf, 'utf-8', 'utf-8');
        expect(newBuf.toString()).assertEqual('hello world');
        expect(newBuf.length).assertEqual(11);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`)

      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0500
     * @tc.name       : testTranscode0005
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferTranscode0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferTranscode0005';
      try {
        let buf = new Uint8Array([1, 2, 3, 4]);
        let newBuf = buffer.transcode(buf, 'base64', 'base64');
        // expect(newBuf.toString('base64')).assertEqual('IHFDjx8=');
        expect(newBuf.length).assertEqual(5);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0600
     * @tc.name       : testTranscode0006
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferTranscode0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferTranscode0006';
      try {
        let buf = new Uint8Array([1, 2, 3, 4]);
        let newBuf = buffer.transcode(buf, 'base64', 'utf-8');
        expect(newBuf.toString('utf-8')).assertEqual('1,2,3,4');
        expect(newBuf.length).assertEqual(7);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0700
     * @tc.name       : testTranscode0007
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferTranscode0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferTranscode0007';
      try {
        let buf = new Uint8Array([1, 2, 3, 4]);
        let newBuf = buffer.transcode(buf, 'utf-8', 'base64');
        // expect(newBuf.toString('base64')).assertEqual('IHFDjx8=');
        expect(newBuf.length).assertEqual(5);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0800
     * @tc.name       : testTranscode0008
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferTranscode0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferTranscode0008';
      try {
        let buf = new Uint8Array([1, 2, 3, 4]);
        let newBuf = buffer.transcode(buf, 'utf-8', 'utf-8');
        expect(newBuf.toString('utf-8')).assertEqual('1,2,3,4');
        expect(newBuf.length).assertEqual(7);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0100
     * @tc.name       : testFill0001
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0001';
      try {
        const buf = buffer.allocUninitializedFromPool(5);
        buf.fill(0x41);
        const result = buf.toString('utf-8');
        expect(result).assertEqual('AAAAA');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0200
     * @tc.name       : testFill0002
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0002';
      try {
        const buf = buffer.allocUninitializedFromPool(3);
        buf.fill('a');
        expect(buf.toString()).assertEqual('aaa');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0300
     * @tc.name       : testFill0003
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0003';
      try {
        // const source = buffer.from([0x46, 0x47]);
        // const buf = buffer.allocUninitializedFromPool(5);
        // buf.fill(source);
        // const expected = buffer.from([0x46, 0x47, 0x46, 0x47, 0x46]);
        // expect(buf.equals(expected)).assertTrue();
        let buf1 = buffer.from([1])
        let buf2 = buffer.allocUninitializedFromPool(4);
        buf2.fill(buf1)
        for (let i = 0; i < buf2.length; i++) {
          expect(buf2[i]).assertEqual(1);
        }
        let expectedBuf = buffer.from([1, 1, 1, 1]);
        expect(buf2.equals(expectedBuf)).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0400
     * @tc.name       : testFill0004
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0004';
      try {
        let uint = new Uint8Array([0x48, 0x49]);
        let buf = buffer.allocUninitializedFromPool(5);
        buf.fill(uint);
        let expectedBuf = buffer.from([72, 73, 72, 73, 72]);
        expect(buf.equals(expectedBuf)).assertTrue();
      } catch (error) {
        console.error(`${TAG} error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0500
     * @tc.name       : testFill0005
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0005';
      try {
        const buf = buffer.alloc(3)
        buf.fill(3)
        const res = buffer.from([3, 3, 3]);
        expect(buf.equals(res)).assertTrue();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0600
     * @tc.name       : testFill0006
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0006';
      try {
        const buf = buffer.alloc(6);
        buf.fill('D', 0);
        expect(buf.toString()).assertEqual('DDDDDD');
      } catch (error) {
        6
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0700
     * @tc.name       : testFill0007
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0007';
      try {
        const buf = buffer.alloc(6);
        buf.fill('D', -1);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} error:${error.message}`);
        expect(error.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1')

      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0800
     * @tc.name       : testFill0008
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0008';
      try {
        const buf = buffer.alloc(6);
        buf.fill('D', Infinity);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} error:${e.message}`);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 4294967296. Received value is: Infinity')

      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0900
     * @tc.name       : testFill0009
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0009';
      try {
        const buf = buffer.alloc(6);
        buf.fill('D', -Infinity);
        expect().assertFail();
      } catch (e) {
        console.error(`${TAG} failed,error:${e.message}`);
        expect(e.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 4294967296. Received value is: -Infinity');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_1000
     * @tc.name       : testFill0010
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0010';
      try {
        const buf = buffer.alloc(3);
        buf.fill('A', 1);
        expect(buf.toString()).assertEqual('\x00AA');
        expect(buf[1]).assertEqual(0x41);
        expect(buf[2]).assertEqual(0x41);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_1100
     * @tc.name       : testFill0011
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0011';
      try {
        const buf = buffer.alloc(3)
        buf.fill('A', 0, 0);
        expect(buf.toString()).assertEqual('\x00\x00\x00');
      } catch (error) {
        console.error(`${TAG}error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_1200
     * @tc.name       : testFill0012
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0012';
      try {
        const buf = buffer.alloc(5);
        buf.fill(0x4B, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, -1);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect(error.message)
          .assertEqual('The value of "end" is out of range. It must be >= 0 and <= 5. Received value is: -1');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_1300
     * @tc.name       : testFill0013
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0013';
      try {
        const buf = buffer.alloc(5);
        buf.fill(0x4B, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, Infinity);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect(error.message)
          .assertEqual('The value of "end" is out of range. It must be >= 0 and <= 5. Received value is: Infinity');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_1400
     * @tc.name       : testFill0014
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0014';
      try {
        const buf = buffer.alloc(5);
        buf.fill(0x4B, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, -Infinity);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect(error.message)
          .assertEqual('The value of "end" is out of range. It must be >= 0 and <= 5. Received value is: -Infinity');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_1500
     * @tc.name       : testFill0015
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0015';
      try {
        const buf = buffer.alloc(3);
        buf.fill('A', 0, 1);
        expect(buf.toString()).assertEqual('A\x00\x00');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_1600
     * @tc.name       : testFill0016
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0016';
      try {
        const buf = buffer.alloc(5);
        buf.fill('A', 0, 5, 'base64');
        expect(buf.toString('base64')).assertEqual('AAAAAAA=');
      } catch (error) {
        console.error(`${TAG} error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_1700
     * @tc.name       : testFill0017
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFill0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferFill0017';
      try {
        const buf = buffer.alloc(5);
        buf.fill('a', 0, 5, 'utf8');
        expect(buf.toString('utf8')).assertEqual('aaaaa');
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0100
     * @tc.name       : testBufferCompare0001
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0001';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        expect(buf1.compare(buf2)).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0200
     * @tc.name       : testBufferCompare0002
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0002';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const u8 = new Uint8Array([0, 2, 3]);
        expect(buf1.compare(u8)).assertEqual(1);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0300
     * @tc.name       : testBufferCompare0003
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0003';
      try {
        const buf1 = buffer.from([3, 2, 1]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, 0);
        expect(buf1.compare(buf2, 0)).assertEqual(1);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0400
     * @tc.name       : testBufferCompare0004
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0004';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([3, 2, 1]);
        const result = buf1.compare(buf2, -1);
        expect(result).assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect(error.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0500
     * @tc.name       : testBufferCompare0005
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0005';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([3, 2, 1]);
        const result = buf1.compare(buf2, Infinity);
        expect(result).assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect(error.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: Infinity');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0600
     * @tc.name       : testBufferCompare0006
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0006';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([3, 2, 1]);
        const result = buf1.compare(buf2, -Infinity);
        expect(result).assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect(error.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: -Infinity');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0700
     * @tc.name       : testBufferCompare0007
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0007';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([3, 2, 1]);
        const result = buf1.compare(buf2, 1);
        expect(result).assertEqual(-1);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0800
     * @tc.name       : testBufferCompare0008
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0008';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined);
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0900
     * @tc.name       : testBufferCompare0009
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0009';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, undefined, 0);
        const result = buf1.compare(buf2);
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1000
     * @tc.name       : testCompare0010
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0010';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([4, 5, 6]);
        buf1.compare(buf2, undefined, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "targetEnd" is out of range. It must be >= 0 and <= 3. Received value is: -1');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1100
     * @tc.name       : testCompare0011
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0011';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3, 4]);
        const result = buf1.compare(buf2, undefined, Infinity);
        expect(result).assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect(error.message)
          .assertEqual('The value of "targetEnd" is out of range. It must be >= 0 and <= 4. Received value is: Infinity');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1200
     * @tc.name       : testCompare0012
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0012';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, -Infinity);
        expect(result).assertFail();
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect(error.message)
          .assertEqual('The value of "targetEnd" is out of range. It must be >= 0 and <= 3. Received value is: -Infinity');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1300
     * @tc.name       : testCompare0013
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0013';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, 1);
        expect(result).assertEqual(1);
      } catch (error) {
        console.error(`${TAG} failed,error:${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1400
     * @tc.name       : testCompare0014
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0014';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([4, 5, 6]);
        buf1.compare(buf2, undefined, undefined);
        expect(buf1.compare(buf2, undefined, undefined)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1500
     * @tc.name       : testCompare0015
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0015';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, 0);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1600
     * @tc.name       : testCompare0016
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0016';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, undefined, undefined, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1700
     * @tc.name       : testCompare0017
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0017';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, undefined, undefined, Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1800
     * @tc.name       : testCompare0018
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0018';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, undefined, undefined, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: -Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_1900
     * @tc.name       : testCompare0019
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0019';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, 1);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_2000
     * @tc.name       : testCompare0020
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0020';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_2100
     * @tc.name       : testCompare0021
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0021';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, 0);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_2200
     * @tc.name       : testCompare0022
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0022';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, -1);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0 and <= 3. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_2300
     * @tc.name       : testCompare0023
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0023';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0 and <= 3. Received value is: Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_2400
     * @tc.name       : testCompare0024
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0024';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0 and <= 3. Received value is: -Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_2500
     * @tc.name       : testCompare0025
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferBufferCompare0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferCompare0025';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, 1);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_0100
     * @tc.name       : testCopy0001
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0001';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_0200
     * @tc.name       : testCopy0002
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0002';
      try {
        const buf1 = buffer.alloc(26);
        for (let i = 0; i < 26; i++) {
          buf1[i] = i + 97;
        }
        const buf2 = new Uint8Array(26);
        buf1.copy(buf2);
        for (let i = 0; i < 26; i++) {
          expect(buf2[i]).assertEqual(97 + i);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_0300
     * @tc.name       : testCopy0003
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0003';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, 0);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        expect().assertFail();
        console.error(`${TAG} failed,error:${err.message}`);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_0400
     * @tc.name       : testCopy0004
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0004';
      try {
        let buf1 = buffer.alloc(6);
        let buf2 = buffer.alloc(6).fill('!');
        buf1.copy(buf2, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_0500
     * @tc.name       : testCopy0005
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0005';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, Infinity);
        expect(buf2.toString()).assertEqual('!!!!!!!!!!!!!!!!!!!!!!!!!!');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_0600
     * @tc.name       : testCopy0006
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0006';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0. Received value is: -Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_0700
     * @tc.name       : testCopy0007
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0007';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, 1);
        expect(buf2.toString()).assertEqual('!abcdefghijklmnopqrstuvwxy');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_0800
     * @tc.name       : testCopy0008
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0008';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_0900
     * @tc.name       : testCopy0009
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0009';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, 0);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1000
     * @tc.name       : testCopy0010
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0010';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1100
     * @tc.name       : testCopy0011
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0011';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, Infinity);
        expect(buf2.toString()).assertEqual('!!!!!!!!!!!!!!!!!!!!!!!!!!');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1200
     * @tc.name       : testCopy0012
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0012';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0. Received value is: -Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1300
     * @tc.name       : testCopy0013
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0013';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, 1);
        expect(buf2.toString()).assertEqual('bcdefghijklmnopqrstuvwxyz!');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1400
     * @tc.name       : testCopy0014
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0014';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1500
     * @tc.name       : testCopy0015
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0015';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, 0);
        expect(buf2.toString()).assertEqual('!!!!!!!!!!!!!!!!!!!!!!!!!!');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1600
     * @tc.name       : testCopy0016
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0016';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1700
     * @tc.name       : testCopy0017
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0017';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, Infinity);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1800
     * @tc.name       : testCopy0018
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0018';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} error:${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0. Received value is: -Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_1900
     * @tc.name       : testCopy0019
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0019';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, 1);
        expect(buf2.toString()).assertEqual('a!!!!!!!!!!!!!!!!!!!!!!!!!');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COPY_2000
     * @tc.name       : testCopy0020
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCopy0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferCopy0020';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, undefined);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0100
     * @tc.name       : testEquals0001
     * @tc.desc       : Test the function of the interface Equals.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferEquals001';
      try {
        const buf1 = buffer.from('ABC');
        const buf2 = buffer.from('414243', 'hex');
        const result = buf1.equals(buf2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0200
     * @tc.name       : testEquals0002
     * @tc.desc       : Test the function of the interface Equals.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferEquals0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferEquals0002';
      try {
        const buf1 = buffer.from('ABC');
        const buf2 = new Uint8Array([1, 2, 3]);
        const result = buf1.equals(buf2);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0300
     * @tc.name       : testEquals0003
     * @tc.desc       : Test the function of the interface Equals.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferEquals0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferEquals0003';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const u8 = new Uint8Array([1, 2, 3]);
        const result = buf1.equals(u8);
        expect(result).assertEqual(true);
        expect([...u8].indexOf(2)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed,error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0400
     * @tc.name       : testEquals0004
     * @tc.desc       : Test the function of the interface Equals.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferEquals0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferEquals0004';
      try {
        const target = buffer.from([1, 2, 3, 4]);
        const source = buffer.from([3, 4, 5]);
        expect(target.equals(source)).assertEqual(
          target[3] === source[0]
        );
      } catch (err) {
        console.error(`${TAG} error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0100
     * @tc.name       : testIncludes0001
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0001';
      try {
        let buf = buffer.from('hello world');
        expect(buf.includes('hello')).assertTrue();
        expect(buf.includes('be')).assertFalse();
      } catch (err) {
        console.error(`${TAG} error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0200
     * @tc.name       : testIncludes0002
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0002';
      try {
        let buf = buffer.from([1, 2, 3, 4]);
        expect(buf.includes(1)).assertTrue();
        expect(buf.includes(5)).assertFalse();
      } catch (err) {
        console.error(`${TAG} error:${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0300
     * @tc.name       : testIncludes0003
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0003';
      try {
        let buf = buffer.from('hello world');
        let searchBuf = buffer.from('world');
        expect(buf.includes(searchBuf)).assertTrue();
        expect(buf.includes(buffer.from('test'))).assertFalse();
      } catch (e) {
        console.error(`${TAG} error:${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0400
     * @tc.name       : testIncludes0004
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0004';
      try {
        let buf = buffer.from('hello world');
        let arr = new Uint8Array([0x68, 0x65]);
        expect(buf.includes(arr)).assertTrue();
        expect(buf.includes(new Uint8Array([0x7a]))).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0500
     * @tc.name       : testIncludes0005
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0005';
      try {
        let buf = buffer.from('hello');
        const result = buf.includes('hello', 0);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0600
     * @tc.name       : testIncludes0006
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0006';
      try {
        let buf = buffer.from('abcdefg');
        buf.includes('def', -1);
        expect(buf.includes('def', -1)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0700
     * @tc.name       : testIncludes0007
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0007';
      try {
        let buf = buffer.from('abc');
        expect(buf.includes('a', Infinity)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0800
     * @tc.name       : testIncludes0008
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0008';
      try {
        let buf = buffer.from('abc');
        expect(buf.includes('c', -Infinity)).assertTrue();
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0900
     * @tc.name       : testIncludes0009
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferBufferIncludes0009';
      try {
        let buf = buffer.from('abc');
        expect(buf.includes('a', 1)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1000
     * @tc.name       : testIncludes0010
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0010';
      try {
        let buf = buffer.from('abc');
        expect(buf.includes('a', undefined)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1100
     * @tc.name       : testIncludes0011
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0011';
      try {

        let buf = buffer.from('test');
        expect(buf.includes('dGVzdA==', undefined, 'base64')).assertTrue();
        expect(buf.includes('abcd', undefined, 'base64')).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1200
     * @tc.name       : testIncludes0012
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0012';
      try {
        let buf = buffer.from('你好');
        expect(buf.includes('你好', undefined, 'utf-8')).assertTrue();
        expect(buf.includes('hello', undefined, 'utf-8')).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1300
     * @tc.name       : testIncludes0013
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0013';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = buffer.from([102, 103]);
        const includesTrue = buf.includes(subBuf, Infinity);
        expect(includesTrue).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1400
     * @tc.name       : testIncludes0014
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0014';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = buffer.from([102, 103]);
        const includesTrue = buf.includes(subBuf, Infinity, 'utf-8');
        expect(includesTrue).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1500
     * @tc.name       : testIncludes0015
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0015';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = buffer.from([102, 103]);
        const includesTrue = buf.includes(subBuf, 1, 'utf-8');
        expect(includesTrue).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1600
     * @tc.name       : testIncludes0016
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0016';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = buffer.from([102, 103]);
        const includesTrue = buf.includes(subBuf, 1, 'base64');
        expect(includesTrue).assertEqual(true)

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1700
     * @tc.name       : testIncludes0017
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0017';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf);
        expect(includes).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1800
     * @tc.name       : testIncludes0018
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0018';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf, Infinity, 'utf-8');
        expect(includes).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1900
     * @tc.name       : testIncludes0019
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0019';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf, Infinity, 'base64');
        expect(includes).assertEqual(false)

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_2000
     * @tc.name       : testBufferIncludes0020
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0020';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf, 1, 'utf-8');
        expect(includes).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_2100
     * @tc.name       : testBufferIncludes0021
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludes0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIncludes0021';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf, 1);
        expect(includes).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_0100
     * @tc.name       : testIndexOf0001
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0001';
      try {
        let buf = buffer.from('this is a buffer');
        let result = buf.indexOf('this');
        expect(result).assertEqual(0);
        expect(buf.indexOf('is')).assertEqual(2);
        expect(buf.indexOf('a')).assertEqual(8);
        expect(buf.indexOf('buffer')).assertEqual(10);
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_0200
     * @tc.name       : testIndexOf0002
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0002';
      try {
        let buf = buffer.from([1, 2, 3, 4]);
        let result = buf.indexOf(3);
        expect(result).assertEqual(2);
        expect(buf.indexOf(4)).assertEqual(3);
        expect(buf.indexOf(1)).assertEqual(0);
        expect(buf.indexOf(5)).assertEqual(-1);
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_0300
     * @tc.name       : testIndexOf0003
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0003';
      try {
        let buf = buffer.from([1, 2, 3, 4, 5, 6]);
        let buf1 = buffer.from([1, 2, 3]);
        let result = buf.indexOf(buf1);
        expect(result).assertEqual(0);
      } catch (e) {
        console.error(`${TAG} failed: ${e.message}` + e);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_0400
     * @tc.name       : testIndexOf0004
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0004';
      try {
        let buf = buffer.from('this');
        let uint8Arr = new Uint8Array([0x74]);
        let result = buf.indexOf(uint8Arr);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INDEX_OF_0500
     * @tc.name       : testIndexOf0005
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBufferIndexOf0005';
      try {
        let buf = buffer.from('this is a buffer');
        expect(buf.indexOf('this', 0).toString()).assertEqual('0');
        expect(buf.indexOf('is', 0).toString()).assertEqual('2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  });
}