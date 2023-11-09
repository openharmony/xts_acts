/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, expect, it } from '@ohos/hypium'
import zLib from 'libzlibndk.so'

const Z_OK: number = 0;
const Z_NULL: number = 0;
const Z_BUF_ERROR: number = -5;
const Z_DATA_ERROR: number = -3;
const Z_STREAM_ERROR: number = -2;
const TEST_SUCCESS: number = 1;
const Z_NO_COMPRESSION: number = 0;
const Z_BEST_SPEED: number = 1;
const Z_BEST_COMPRESSION: number = 9;
const Z_DEFAULT_COMPRESSION: number = -1;
const Z_ERROR_COMPRESSION: number = -2;

export default function zlibNdkTest() {
  describe('zlibNdkTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_COMPRESS_0100
     * @tc.name       : testCompress001
     * @tc.desc       : test Compress
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCompress001', 0, async (done: Function) => {
      let data = zLib.compress(Z_OK);
      console.info("testCompress001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_COMPRESS_0200
     * @tc.name       : testCompress002
     * @tc.desc       : test Compress
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCompress002', 0, async (done: Function) => {
      let data = zLib.compress(Z_BUF_ERROR);
      console.info("testCompress002 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_UNCOMPRESS_0100
     * @tc.name       : testUnCompress001
     * @tc.desc       : test unCompress
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUnCompress001', 0, async (done: Function) => {
      let data = zLib.unCompress(Z_OK);
      console.info("testUnCompress001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_UNCOMPRESS_0200
     * @tc.name       : testUnCompress002
     * @tc.desc       : test unCompress
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUnCompress002', 0, async (done: Function) => {
      let data = zLib.unCompress(Z_BUF_ERROR);
      console.info("testUnCompress002 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_UNCOMPRESS_0300
     * @tc.name       : testUnCompress003
     * @tc.desc       : test unCompress
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUnCompress003', 0, async (done: Function) => {
      let data = zLib.unCompress(Z_DATA_ERROR);
      console.info("testUnCompress003 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_COMPRESS2_0100
     * @tc.name       : testCompress2001
     * @tc.desc       : test compress2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCompress2001', 0, async (done: Function) => {
      let data = zLib.compress2(Z_NO_COMPRESSION, Z_OK);
      console.info("testCompress2001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_COMPRESS2_0200
     * @tc.name       : testCompress2002
     * @tc.desc       : test compress2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCompress2002', 0, async (done: Function) => {
      let data = zLib.compress2(Z_BEST_SPEED, Z_OK);
      console.info("testUnCompress002 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_COMPRESS2_0300
     * @tc.name       : testCompress2003
     * @tc.desc       : test compress2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCompress2003', 0, async (done: Function) => {
      let data = zLib.compress2(Z_BEST_COMPRESSION, Z_OK);
      console.info("testCompress2003 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_COMPRESS2_0400
     * @tc.name       : testCompress2004
     * @tc.desc       : test compress2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCompress2004', 0, async (done: Function) => {
      let data = zLib.compress2(Z_DEFAULT_COMPRESSION, Z_OK);
      console.info("testCompress2004 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_COMPRESS2_0500
     * @tc.name       : testCompress2005
     * @tc.desc       : test compress2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCompress2005', 0, async (done: Function) => {
      let data = zLib.compress2(Z_DEFAULT_COMPRESSION, Z_BUF_ERROR);
      console.info("testCompress2005 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_COMPRESS2_0600
     * @tc.name       : testCompress2006
     * @tc.desc       : test compress2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCompress2006', 0, async (done: Function) => {
      let data = zLib.compress2(Z_ERROR_COMPRESSION, Z_STREAM_ERROR);
      console.info("testCompress2006 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_COMPRESSBOUND_0100
     * @tc.name       : testCompressBound001
     * @tc.desc       : test compressBound
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCompressBound001', 0, async (done: Function) => {
      let data = zLib.compressBound();
      console.info("testCompressBound001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_CRC32_0100
     * @tc.name       : testCrc32001
     * @tc.desc       : test crc32
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCrc32001', 0, async (done: Function) => {
      let data = zLib.crc32(Z_NULL);
      console.info("testCrc32001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_CRC32_0200
     * @tc.name       : testCrc32002
     * @tc.desc       : test crc32
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCrc32002', 0, async (done: Function) => {
      let data = zLib.crc32(1);
      console.info("testCrc32002 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_CRC32_Z_0100
     * @tc.name       : testCrc32Z001
     * @tc.desc       : test crc32_z
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCrc32Z001', 0, async (done: Function) => {
      let data = zLib.crc32_z();
      console.info("testCrc32Z001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_CRC32_COMBINE_0100
     * @tc.name       : testCrc32Combine001
     * @tc.desc       : test crc32Combine
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCrc32Combine001', 0, async (done: Function) => {
      let data = zLib.crc32Combine();
      console.info("testCrc32Combine001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_ADLER32_0100
     * @tc.name       : testAdler32001
     * @tc.desc       : test adler32
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testAdler32001', 0, async (done: Function) => {
      let data = zLib.adler32(Z_NULL);
      console.info("testAdler32001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_ADLER32_0200
     * @tc.name       : testAdler32002
     * @tc.desc       : test adler32
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testAdler32002', 0, async (done: Function) => {
      let data = zLib.adler32(1);
      console.info("testAdler32002 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_ADLER32_Z_0100
     * @tc.name       : testAdler32Z001
     * @tc.desc       : test adler32_z
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testAdler32Z001', 0, async (done: Function) => {
      let data = zLib.adler32_z();
      console.info("testAdler32Z001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_ADLER32_COMBINE_0100
     * @tc.name       : testAdler32Combine001
     * @tc.desc       : test adler32Combine
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testAdler32Combine001', 0, async (done: Function) => {
      let data = zLib.adler32Combine();
      console.info("testAdler32Combine001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_DEFLATE_0100
     * @tc.name       : testDeflate001
     * @tc.desc       : test unCompress
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testDeflate001', 0, async (done: Function) => {
      let data = zLib.deflate();
      console.info("testDeflate001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

  })
}