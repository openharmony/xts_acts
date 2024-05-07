/*
* Copyright (C) 2024 Huawei Device Co., Ltd.
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
import zlib from '@ohos.zlib'
import { describe, it, expect } from '@ohos/hypium'
import base from '@ohos.base'

export default function ActsZipTest() { 
 describe('ActsZipTest', function () {
    /**
     * @tc.number     : ACTS_ZipTest_01
     * @tc.name       : actsZipTest01
     * @tc.desc       : test deflateInit2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest01', 0, async function (done) {
        console.info("==================ACTS_ZipTest_01 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
        nextIn: arrayBufferIn,
        availableIn: 1,
        nextOut: arrayBufferOut,
        availableOut: 1
        };
        let zip = zlib.createZipSync()
        await zip.deflateInit2(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED, zlib.CompressMethod.DEFLATED, 15,
          zlib.MemLevel.MEM_LEVEL_DEFAULT, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then((data) => {
            console.info('deflateInit2 success');
            expect(data).assertEqual(0);
            expect(zlib.CompressMethod.DEFLATED).assertEqual(8);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        done();
        console.info("==================ACTS_ZipTest_01 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_02
     * @tc.name       : actsZipTest02
     * @tc.desc       : test deflateInit
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest02', 0, async function (done) {
        console.info("==================ACTS_ZipTest_02 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i);
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync()
        await zip.deflateInit({nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1},
          zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
            console.info('deflateInit success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        done();
        console.info("==================ACTS_ZipTest_02 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_03
     * @tc.name       : actsZipTest03
     * @tc.desc       : test deflateParams
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest03', 0, async function (done) {
        console.info("==================ACTS_ZipTest_03 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
        nextIn: arrayBufferIn,
        availableIn: 1,
        nextOut: arrayBufferOut,
        availableOut: 1
        };
        let zip = zlib.createZipSync()
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
            console.info('deflateInit success')
            expect(data).assertEqual(0)
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.deflateParams(zStream, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
          zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then((data) => {
          console.info('deflateParams success')
          expect(data).assertEqual(0)
        }).catch((errData: base.BusinessError) => {
          console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail()
        })
        done();
        console.info("==================ACTS_ZipTest_03 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_04
     * @tc.name       : actsZipTest04
     * @tc.desc       : test deflatePrime
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest04', 0, async function (done) {
        console.info("==================ACTS_ZipTest_04 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
        nextIn: arrayBufferIn,
        availableIn: 1,
        nextOut: arrayBufferOut,
        availableOut: 1
        };
        let zip = zlib.createZipSync();
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
            console.info('deflateInit success')
            expect(data).assertEqual(0)
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.deflatePrime({nextOut: arrayBufferOut}, 5, 2).then((data) => {
            console.info('deflatePrime success')
            expect(data).assertEqual(0)
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        done();
        console.info("==================ACTS_ZipTest_04 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_05
     * @tc.name       : actsZipTest05
     * @tc.desc       : test deflateTune
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest05', 0, async function (done) {
        console.info("==================ACTS_ZipTest_05 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
        nextIn: arrayBufferIn,
        availableIn: 1,
        nextOut: arrayBufferOut,
        availableOut: 1
        };
        let zip = zlib.createZipSync();
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
            console.info('deflateInit success')
            expect(data).assertEqual(0)
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.deflateTune({nextOut:arrayBufferOut}, 2, 2, 2, 2).then((data) => {
          console.info('deflateTune success:')
          expect(data).assertEqual(0)
        }).catch((errData: base.BusinessError) => {
          console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail()
        })
        done();
        console.info("==================ACTS_ZipTest_05 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_06
     * @tc.name       : actsZipTest06
     * @tc.desc       : test deflateSetDictionary and deflateGetDictionary
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest06', 0, async function (done) {
        console.info("==================ACTS_ZipTest_06 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
        nextIn: arrayBufferIn,
        availableIn: 1,
        nextOut: arrayBufferOut,
        availableOut: 1
        };
        let zip = zlib.createZipSync();
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
            console.info('deflateInit success')
            expect(data).assertEqual(0)
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.deflateSetDictionary({nextOut:arrayBufferOut}, arrayBufferOut).then((data) => {
            console.info('deflateSetDictionary success')
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.deflateGetDictionary({nextOut:arrayBufferOut}, arrayBufferOut).then((data) => {
            console.info('deflateGetDictionary success')
            expect(data.status).assertEqual(0)
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        done();
        console.info("==================ACTS_ZipTest_06 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_07
     * @tc.name       : actsZipTest07
     * @tc.desc       : test deflateReset
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest07', 0, async function (done) {
        console.info("==================ACTS_ZipTest_07 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
        nextIn: arrayBufferIn,
        availableIn: 1,
        nextOut: arrayBufferOut,
        availableOut: 1
        };
        let zip = zlib.createZipSync();
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
            console.info('deflateInit success')
            expect(data).assertEqual(0)
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.deflateReset({nextOut:arrayBufferOut}).then((data) => {
            console.info('deflateReset success')
            expect(data).assertEqual(0)
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        done();
        console.info("==================ACTS_ZipTest_07 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_08
     * @tc.name       : actsZipTest08
     * @tc.desc       : test deflateResetKeep
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest08', 0, async function (done) {
        console.info("==================actsZipTest08 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
        nextIn: arrayBufferIn,
        availableIn: 1,
        nextOut: arrayBufferOut,
        availableOut: 1
        };
        let zip = zlib.createZipSync();
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
            console.info('deflateInit success')
            expect(data).assertEqual(0)
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.deflateResetKeep({nextOut: arrayBufferOut}).then((data) => {
            console.info('deflateResetKeep success')
            expect(data).assertEqual(0)
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        done();
        console.info("==================actsZipTest08 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_09
     * @tc.name       : actsZipTest09
     * @tc.desc       : test deflateBound
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest09', 0, async function (done) {
        console.info("==================actsZipTest09 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
        nextIn: arrayBufferIn,
        availableIn: 1,
        nextOut: arrayBufferOut,
        availableOut: 1
        };
        let zip = zlib.createZipSync();
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
            console.info('deflateInit success')
            expect(data).assertEqual(0)
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.deflateBound({nextOut: arrayBufferOut}, 12).then((data) => {
            console.info('deflateBound success')
            expect(data).assertEqual(25)
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        done();
        console.info("==================actsZipTest09 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_10
     * @tc.name       : actsZipTest10
     * @tc.desc       : test deflatePending
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest10', 0, async function (done) {
        console.info("==================actsZipTest10 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
        nextIn: arrayBufferIn,
        availableIn: 1,
        nextOut: arrayBufferOut,
        availableOut: 1
        };
        let zip = zlib.createZipSync();
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
            console.info('deflateInit success')
            expect(data).assertEqual(0)
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.deflatePending({nextOut: arrayBufferOut}).then((data) => {
            console.info('deflatePending success')
            expect(data.status).assertEqual(0)
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        done();
        console.info("==================actsZipTest10 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_11
     * @tc.name       : actsZipTest11
     * @tc.desc       : test deflateCopy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest11', 0, async function (done) {
        console.info("==================actsZipTest11 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
        nextIn: arrayBufferIn,
        availableIn: 1,
        nextOut: arrayBufferOut,
        availableOut: 1
        };
        let zip = zlib.createZipSync();
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
            console.info('deflateInit success')
            expect(data).assertEqual(0)
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.deflateCopy(zip).then((data) => {
            console.info('deflateCopy success')
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        done();
        console.info("==================actsZipTest11 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_12
     * @tc.name       : actsZipTest12
     * @tc.desc       : test deflateSetHeader
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest12', 0, async function (done) {
        console.info("==================actsZipTest12 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
        nextIn: arrayBufferIn,
        availableIn: 1,
        nextOut: arrayBufferOut,
        availableOut: 1
        };
        let zip = zlib.createZipSync()
        await zip.deflateInit2(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED, zlib.CompressMethod.DEFLATED, 28,
          zlib.MemLevel.MEM_LEVEL_DEFAULT, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then((data) => {
            console.info('deflateInit2 success');
            expect(data).assertEqual(0)
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
            expect(errData).assertFail()
        })
        await zip.deflateSetHeader({nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut,availableOut: 1},
          {isText: true, os: 1, time: 1, xflags: 1, extra: arrayBufferIn, extraLen: 12, name: arrayBufferIn, 
          comment: arrayBufferOut, hcrc: true, done: true}).then((data)=>{
            console.info('deflateSetHeader success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
            expect(errData).assertFail()
        })
        done();
        console.info("==================actsZipTest12 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_13
     * @tc.name       : actsZipTest13
     * @tc.desc       : test deflate and inflate
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest13', 0, async function (done) {
        console.info("==================actsZipTest13 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
        nextIn: arrayBufferIn,
        availableIn: 1,
        nextOut: arrayBufferOut,
        availableOut: 1
        };
        let zip = zlib.createZipSync();
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
            console.info('deflateInit success')
            expect(data).assertEqual(0)
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
            expect(errData).assertFail()
        })
        await zip.deflate({availableOut: 8}, zlib.CompressFlushMode.FINISH).then((data) => {
            console.info('deflate success')
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
            expect(errData).assertFail()
        })
        await zip.deflateEnd({ nextOut: arrayBufferOut }).then(data => {
            console.info('deflateEnd success')
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.inflateInit({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}
        ).then(data => {
            console.info('inflateInit success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.inflate({availableIn: 8, availableOut: 8}, zlib.CompressFlushMode.NO_FLUSH).then((data) => {
            console.info('inflate success')
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
            })
        await zip.inflateEnd({nextOut: arrayBufferOut}).then((data) => {
            console.info('inflateEnd success')
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        done();
        console.info("==================actsZipTest13 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_14
     * @tc.name       : actsZipTest14
     * @tc.desc       : test getZStream
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest14', 0, async function (done) {
        console.info("==================actsZipTest14 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        await zlib.createZip().then(data => {
            console.info('createZip success');
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.getZStream().then(data => {
            console.info('getZStream success');
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.inflateInit({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}
        ).then(data => {
            console.info('inflateInit success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        done();
        console.info("==================actsZipTest14 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_15
     * @tc.name       : actsZipTest15
     * @tc.desc       : test inflateCopy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest15', 0, async function (done) {
        console.info("==================actsZipTest15 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        await zip.inflateInit({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}
        ).then(data => {
            console.info('inflateInit success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.inflateCopy(zip).then((data) => {
            console.info('inflateCopy success')
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        done();
        console.info("==================actsZipTest15 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_16
     * @tc.name       : actsZipTest16
     * @tc.desc       : test inflateValidate
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest16', 0, async function (done) {
        console.info("==================actsZipTest16 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        await zip.inflateInit({nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}
        ).then(data => {
            console.info('inflateInit success')
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.inflateValidate({availableIn: 1}, 1).then(data => {
            console.info('inflateValidate success')
            expect(data).assertEqual(0)
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        done();
        console.info("==================actsZipTest16 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_17
     * @tc.name       : actsZipTest17
     * @tc.desc       : test inflateUndermine
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest17', 0, async function (done) {
        console.info("==================actsZipTest17 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        await zip.inflateInit({nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}
        ).then(data => {
            console.info('inflateInit success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.inflateUndermine({availableOut: 1}, 5).then(data => {
            console.info('inflateUndermine success');
            expect(data).assertFail()
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800005);
        })
        done();
        console.info("==================actsZipTest17 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_18
     * @tc.name       : actsZipTest18
     * @tc.desc       : test inflateSyncPoint
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest18', 0, async function (done) {
        console.info("==================actsZipTest18 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        await zip.inflateInit({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}
        ).then(data => {
            console.info('inflateInit success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.inflateSyncPoint({availableIn: 1}).then(data => {
            console.info('inflateSyncPoint success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        done();
        console.info("==================actsZipTest18 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_19
     * @tc.name       : actsZipTest19
     * @tc.desc       : test inflateSync
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest19', 0, async function (done) {
        console.info("==================actsZipTest19 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        await zip.inflateInit({nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}
        ).then(data => {
            console.info('inflateInit success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.inflateSync({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}).then(data => {
            console.info('inflateSync success');
            expect(data).assertFail()
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800005);
        })
        done();
        console.info("==================actsZipTest19 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_20
     * @tc.name       : actsZipTest20
     * @tc.desc       : test inflateResetKeep
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest20', 0, async function (done) {
        console.info("==================actsZipTest20 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        await zip.inflateInit({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}
        ).then(data => {
            console.info('inflateInit success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.inflateResetKeep({availableIn: 1}).then(data => {
            console.info('inflateResetKeep success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        done();
        console.info("==================actsZipTest20 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_21
     * @tc.name       : actsZipTest21
     * @tc.desc       : test inflateReset2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest21', 0, async function (done) {
        console.info("==================actsZipTest21 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        await zip.inflateInit({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}
        ).then(data => {
            console.info('inflateInit success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.inflateReset2({availableOut: 8}, 15).then(data => {
            console.info('inflateReset2 success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        done();
        console.info("==================actsZipTest21 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_22
     * @tc.name       : actsZipTest22
     * @tc.desc       : test inflateReset
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest22', 0, async function (done) {
        console.info("==================actsZipTest22 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        await zip.inflateInit({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}
        ).then(data => {
            console.info('inflateInit success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.inflateReset({availableIn: 1, availableOut: 8}).then(data => {
            console.info('inflateReset success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        done();
        console.info("==================actsZipTest22 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_23
     * @tc.name       : actsZipTest23
     * @tc.desc       : test inflatePrime
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest23', 0, async function (done) {
        console.info("==================actsZipTest23 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        await zip.inflateInit({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}
        ).then(data => {
            console.info('inflateInit success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        await zip.inflatePrime({nextOut: arrayBufferOut}, 5, 2).then(data => {
            console.info('inflatePrime success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail()
        })
        done();
        console.info("==================actsZipTest23 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_24
     * @tc.name       : actsZipTest24
     * @tc.desc       : test inflateGetHeader
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest24', 0, async function (done) {
        console.info("==================actsZipTest24 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        await zip.inflateInit2({nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}, 28
        ).then(data => {
            console.info('inflateInit2 success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        await zip.inflateGetHeader({availableIn: 1, availableOut: 1},
          {isText: true, os: 1, time: 1, xflags: 1, extra: arrayBufferIn, extraLen: 12, 
          name: arrayBufferIn, comment: arrayBufferOut, hcrc: true, done: true}).then(data => {
            console.info('inflateGetHeader success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        done();
        console.info("==================actsZipTest24 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_25
     * @tc.name       : actsZipTest25
     * @tc.desc       : test inflateGetDictionary
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest25', 0, async function (done) {
        console.info("==================actsZipTest25 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        await zip.inflateInit2({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}, 28
        ).then(data => {
            console.info('inflateInit2 success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        await zip.inflateGetDictionary({nextOut: arrayBufferOut}, arrayBufferOut).then((data) => {
            console.info('inflateGetDictionary success:')
            expect(data.status).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        done();
        console.info("==================actsZipTest25 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_26
     * @tc.name       : actsZipTest26
     * @tc.desc       : test zlibVersion
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest26', 0, async function (done) {
        console.info("==================actsZipTest26 start==================");
        let zip = zlib.createZipSync();
        await zip.zlibVersion().then((data) => {
            console.info('zlibVersion success')
            expect(typeof (data)).assertEqual("string");
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        done();
        console.info("==================actsZipTest26 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_27
     * @tc.name       : actsZipTest27
     * @tc.desc       : test zlibCompileFlags
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest27', 0, async function (done) {
        console.info("==================actsZipTest27 start==================");
        let zip = zlib.createZipSync();
        await zip.zlibCompileFlags().then((data) => {
            console.info('zlibCompileFlags success')
            expect(data == 85 || data == 169).assertTrue();
        }).catch((errData: base.BusinessError) => {
            console.info('zlibCompileFlags fail')
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        done();
        console.info("==================actsZipTest27 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_28
     * @tc.name       : actsZipTest28
     * @tc.desc       : test compress
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest28', 0, async function (done) {
        console.info("==================actsZipTest28 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        await zip.compress(arrayBufferOut, arrayBufferIn).then((data) => {
            console.info('compress success:');
            expect(data.status).assertEqual(0);
            expect(data.destLen).assertEqual(20);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        done();
        console.info("==================actsZipTest28 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_29
     * @tc.name       : actsZipTest29
     * @tc.desc       : test uncompress
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest29', 0, async function (done) {
        console.info("==================actsZipTest29 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        await zip.compress(arrayBufferOut, arrayBufferIn, 12).then((data) => {
            console.info('compress success');
            expect(data.status).assertEqual(0);
            expect(data.destLen).assertEqual(20);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        await zip.uncompress(arrayBufferIn, arrayBufferOut, 20).then((data) => {
            console.info('uncompress success');
            expect(data.status).assertEqual(0);
            expect(data.destLen).assertEqual(12);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        done();
        console.info("==================actsZipTest29 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_30
     * @tc.name       : actsZipTest30
     * @tc.desc       : test compress2 and uncompress2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest30', 0, async function (done) {
        console.info("==================actsZipTest30 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        await zip.compress2(arrayBufferOut, arrayBufferIn, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data) => {
            console.info('compress2 success');
            expect(data.status).assertEqual(0);
            expect(data.destLen).assertEqual(20);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        await zip.uncompress2(arrayBufferIn, arrayBufferOut, 20).then((data) => {
            console.info('uncompress2 success');
            expect(data.status).assertEqual(0);
            expect(data.destLength).assertEqual(12);
            expect(data.sourceLength).assertEqual(20);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        done();
        console.info("==================actsZipTest30 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_31
     * @tc.name       : actsZipTest31
     * @tc.desc       : test compressBound
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest31', 0, async function (done) {
        console.info("==================actsZipTest31 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        await zip.compressBound(str.length).then((data) => {
            console.info('compressBound success')
            expect(data).assertEqual(25);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        done();
        console.info("==================actsZipTest31 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_32
     * @tc.name       : actsZipTest32
     * @tc.desc       : test inflateBack
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest32', 0, async function (done) {
        console.info("==================actsZipTest32 start==================");
        let readIn:(inDesc:object) => ArrayBuffer = (inDesc:object): ArrayBuffer => {
        console.info("inDesc = ", JSON.stringify(inDesc));
        let buffer = new ArrayBuffer(26)
        let array = new Uint8Array(buffer);
        array.set([31,139,8,0,0,0,0,0,0,10,243,72,205,201,201,231,2,0,22,53,150,49,6,0,0,0]);
        return buffer;
        }

        let writeOut:(outDesc: object, buffer: ArrayBuffer, length: number) => number = (outDesc: object, buffer: ArrayBuffer, length: number): number => {
            console.info("outDesc = ", outDesc);
            console.info("buffer = ", buffer);
            console.info("length = ", length);
            let array = new Uint8Array(buffer);
            let dataString = "";
            for (let i = 0; i < length; i++) {
            dataString += String.fromCharCode(array[i]);
            }
            console.info('writeOut ', dataString);
            return 0;
        }

        let have = 0;
        let first = 1;
        let arrayBuffer =  new ArrayBuffer(26);
        let next = new Uint8Array(arrayBuffer);
        let last = 0;
        let index = 0;
        let flags = 0;
        let NEXT2:() => number = (): number => {
            let o6: object = new Object()
            if (!have) {
            arrayBuffer = readIn(o6)
            next = new Uint8Array(arrayBuffer);
            console.info('readIn next = ', next.length)
            have = next.length;
            }
            if (have) {
            have--;
            last = next[index];
            index++;
            }
            else {
            last = -1;
            }
            return last;
        }

        let inflateBackTest:() => void = ( async() => {
            try {
            have = 0;
            first = 1;
            arrayBuffer =  new ArrayBuffer(26);
            next = new Uint8Array(arrayBuffer);
            last = 0;
            index = 0;
            flags = 0;
            let sr = zlib.createZipSync();
            let buffer = new ArrayBuffer(1024)
            await sr.inflateBackInit({}, 15, buffer).then((result) => {
                console.info('inflateBackInit Call result res', result)
                expect(result).assertEqual(0);
            })
            let ret = 0;
            for (;;) {
                if (NEXT2() == -1) {
                ret = 0;
                console.info('inflateBackTest Call result NEXT2() == -1')
                break;
                }
                console.info('have =  last = ', have, last)
                if (last != 31 || (NEXT2() != 139 && last >= 157 && last <= 157)) {
                ret = first ? -3 : -1;
                console.info('inflateBackTest Call result last != 31 || (NEXT2() != 139 && last != 157)')
                break;
                }
                first = 0;
                ret = -5;
                if (NEXT2() != 8) {
                if (last < 0) {
                    console.info('inflateBackTest Call result 1 last == -1')
                    break;
                }
                }
                flags = NEXT2();
                NEXT2();
                NEXT2();
                NEXT2();
                NEXT2();
                NEXT2();
                NEXT2();
                if (last < 0) {
                console.info('inflateBackTest Call result 2 last == -1')
                break;
                }
                console.info('index =  have = ', next[index], have)
                let newArrayBuffer = new ArrayBuffer(have);
                let newNext = new Uint8Array(newArrayBuffer);
                for (let i = 0 ; i < have; i++) {
                newNext[i] = next[26-have+i];
                }
                console.info('newArrayBuffer.length = ', newArrayBuffer.byteLength)
                console.info('newNext.length = ', newNext.length)
                let zStream: zlib.ZStream = {
                nextIn: newArrayBuffer,
                availableIn: have,
                };
                await sr.inflateBack(
                zStream,
                readIn,
                {fileName:'test.gz'},
                writeOut,
                {fileName:'test.gz'}).then((result) => {
                ret = result;
                console.info('inflateBack Call result res', result)
                expect(result).assertEqual(1);
                })
                if (ret == 1) {
                console.info('inflateBackTest Call result success')
                break;
                }
            }
            await sr.inflateBackEnd({}).then((result) => {
                console.info('inflateBackEnd Call result res', result)
                expect(result).assertEqual(0);
            })
            }
            catch(errData) {
            console.error(`errData is message:${errData}`);
            expect(errData).assertFail();
            }
        })
        inflateBackTest();
        done();
        console.info("==================actsZipTest32 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_33
     * @tc.name       : actsZipTest33
     * @tc.desc       : test deflateInit2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest33', 0, async function (done) {
        console.info("==================actsZipTest33 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
        await zip.deflateInit2({}, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED, 6, 15, zlib.MemLevel.MEM_LEVEL_DEFAULT,
            zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then((data) => {
            console.info('deflateInit2 success');
            expect(data).assertFail();
        })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        try {
        await zip.deflateInit2({}, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED, 6, null, zlib.MemLevel.MEM_LEVEL_DEFAULT,
            zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then((data) => {
            console.info('deflateInit2 success');
            expect(data).assertFail();
        })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        done();
        console.info("==================actsZipTest33 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_34
     * @tc.name       : actsZipTest34
     * @tc.desc       : test deflateInit
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest34', 0, async function (done) {
        console.info("==================actsZipTest34 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
        await zip.deflateInit({}, 10).then((data) => {
            console.info('deflateInit success');
            expect(data).assertFail();
        })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        try {
            await zip.deflateInit(null, null).then((data) => {
            console.info('deflateInit success');
            expect(data).assertFail();
        })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        done();
        console.info("==================actsZipTest34 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_35
     * @tc.name       : actsZipTest35
     * @tc.desc       : test compress
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest35', 0, async function (done) {
        console.info("==================actsZipTest35 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(10);
        let zip = zlib.createZipSync();
        try {
        await zip.compress(arrayBufferOut, arrayBufferIn, 12).then((data) => {
            console.info('compress success:');
            expect(data).assertFail();
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800007);
        }
        try {
        await zip.compress(arrayBufferOut, null, null).then((data) => {
            console.info('compress success:');
            expect(data).assertFail();
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        done();
        console.info("==================actsZipTest35 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_36
     * @tc.name       : actsZipTest36
     * @tc.desc       : test compress2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest36', 0, async function (done) {
        console.info("==================actsZipTest36 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(10);
        let zip = zlib.createZipSync();
        try {
        await zip.compress2(arrayBufferOut, arrayBufferIn, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION).then((data) => {
            console.info('compress2 success:');
            expect(data).assertFail();
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800007);
        }
        try {
        await zip.compress2(arrayBufferOut, arrayBufferIn, null).then((data) => {
            console.info('compress2 success:');
            expect(data).assertFail();
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        done();
        console.info("==================actsZipTest36 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_37
     * @tc.name       : actsZipTest37
     * @tc.desc       : test compressBound
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest37', 0, async function (done) {
        console.info("==================actsZipTest37 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
        await zip.compressBound(null).then((data) => {
            console.info('compressBound success:');
            expect(data).assertFail();
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        done();
        console.info("==================actsZipTest37 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_38
     * @tc.name       : actsZipTest38
     * @tc.desc       : test uncompress
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest38', 0, async function (done) {
        console.info("==================actsZipTest38 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let zip = zlib.createZipSync();
        let arrayBufferOut = new ArrayBuffer(100);
        try {
        await zip.uncompress(arrayBufferOut, arrayBufferIn, 12).then((data) => {
            console.info('ucompress success:');
            expect(data).assertFail();
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800005);
        }
        try {
        await zip.uncompress(arrayBufferOut, null, null).then((data) => {
            console.info('ucompress success:');
            expect(data).assertFail();
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        done();
        console.info("==================actsZipTest38 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_39
     * @tc.name       : actsZipTest39
     * @tc.desc       : test uncompress2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest39', 0, async function (done) {
        console.info("==================actsZipTest39 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
        await zip.uncompress2(arrayBufferOut, arrayBufferIn, 12).then((data) => {
            console.info('uncompress2 success:');
            expect(data).assertFail();
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800005);
        }
        try {
        await zip.uncompress2(arrayBufferOut, null, null).then((data) => {
            console.info('uncompress2 success:');
            expect(data).assertFail();
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        done();
        console.info("==================actsZipTest39 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_40
     * @tc.name       : actsZipTest40
     * @tc.desc       : test inflateValidate
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest40', 0, async function (done) {
        console.info("==================actsZipTest40 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
        await zip.inflateValidate({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1},
          null).then(data => {
            console.info('inflateValidate success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        try {
        await zip.inflateValidate({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1},
          1).then(data => {
            console.info('inflateValidate success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest40 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_41
     * @tc.name       : actsZipTest41
     * @tc.desc       : test inflateUndermine
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest41', 0, async function (done) {
        console.info("==================actsZipTest41 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
        await zip.inflateUndermine({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1},
          null).then(data => {
            console.info('inflateUndermine success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        try {
        await zip.inflateUndermine({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1},
          1).then(data => {
            console.info('inflateUndermine success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest41 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_42
     * @tc.name       : actsZipTest42
     * @tc.desc       : test inflateSyncPoint
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest42', 0, async function (done) {
        console.info("==================actsZipTest42 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
        await zip.inflateSyncPoint({nextIn: null, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}).then(data => {
          console.info('inflateSyncPoint success')
          expect(data).assertFail()
        })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        try {
        await zip.inflateSyncPoint({nextIn: arrayBufferOut, availableIn: 0, nextOut: arrayBufferIn, availableOut: 0}).then(data => {
            console.info('inflateSyncPoint success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest42 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_43
     * @tc.name       : actsZipTest43
     * @tc.desc       : test inflateSync
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest43', 0, async function (done) {
        console.info("==================actsZipTest43 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
        await zip.inflateSync({nextIn: null, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}).then(data => {
          console.info('inflateSync success')
          expect(data).assertFail()
        })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        try {
        await zip.inflateSync({nextIn: arrayBufferOut, availableIn: 0, nextOut: arrayBufferIn, availableOut: 0}).then(data => {
            console.info('inflateSync success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest43 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_44
     * @tc.name       : actsZipTest44
     * @tc.desc       : test inflateSetDictionary
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest44', 0, async function (done) {
        console.info("==================actsZipTest44 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
            await zip.inflateSetDictionary({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferIn, availableOut: 1}, null).then(data => {
            console.info('inflateSetDictionary success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        try {
            await zip.inflateSetDictionary({nextIn: arrayBufferOut, availableIn: 2, nextOut: arrayBufferIn, availableOut: 2}, arrayBufferOut).then(data => {
            console.info('inflateSetDictionary success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest44 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_45
     * @tc.name       : actsZipTest45
     * @tc.desc       : test inflateResetKeep
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest45', 0, async function (done) {
        console.info("==================actsZipTest45 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
            await zip.inflateResetKeep({nextIn: null, availableIn: 1, nextOut: arrayBufferIn, availableOut: 1}).then(data => {
            console.info('inflateResetKeep success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        try {
            await zip.inflateResetKeep({nextIn: arrayBufferOut, availableIn: 2, nextOut: arrayBufferIn, availableOut: 2}).then(data => {
            console.info('inflateResetKeep success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest45 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_46
     * @tc.name       : actsZipTest46
     * @tc.desc       : test inflateReset
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest46', 0, async function (done) {
        console.info("==================actsZipTest46 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
            await zip.inflateReset({nextIn: null, availableIn: 1, nextOut: arrayBufferIn, availableOut: 1}).then(data => {
            console.info('inflateReset success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        try {
            await zip.inflateReset({nextIn: arrayBufferOut, availableIn: 2, nextOut: arrayBufferIn, availableOut: 2}).then(data => {
            console.info('inflateReset success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest46 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_47
     * @tc.name       : actsZipTest47
     * @tc.desc       : test inflateReset2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest47', 0, async function (done) {
        console.info("==================actsZipTest47 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
        await zip.inflateReset2({nextIn: null, availableIn: 1, nextOut: arrayBufferIn, availableOut: 1}, null).then(data => {
            console.info('inflateReset2 success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        try {
        await zip.inflateReset2({nextIn: arrayBufferOut, availableIn: 2, nextOut: arrayBufferIn, availableOut: 2}, 10).then(data => {
            console.info('inflateReset2 success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest47 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_48
     * @tc.name       : actsZipTest48
     * @tc.desc       : test inflatePrime
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest48', 0, async function (done) {
        console.info("==================actsZipTest48 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
        await zip.inflatePrime({nextIn: null, availableIn: 1, nextOut: arrayBufferIn, availableOut: 1}, null, null).then(data => {
            console.info('inflatePrime success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        try {
        await zip.inflatePrime({nextIn: arrayBufferOut, availableIn: 2, nextOut: arrayBufferIn, availableOut: 2}, 10, 10).then(data => {
            console.info('inflatePrime success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest48 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_49
     * @tc.name       : actsZipTest49
     * @tc.desc       : test inflateMark
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest49', 0, async function (done) {
        console.info("==================actsZipTest49 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
        await zip.inflateMark({nextIn: null, availableIn: 1, nextOut: arrayBufferIn, availableOut: 1}).then(data => {
            console.info('inflateMark success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        done();
        console.info("==================actsZipTest49 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_50
     * @tc.name       : actsZipTest50
     * @tc.desc       : test inflateInit2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest50', 0, async function (done) {
        console.info("==================actsZipTest50 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
        await zip.inflateInit2({nextIn: arrayBufferOut, availableIn: 2, nextOut: arrayBufferIn, availableOut: 2}, null).then(data => {
            console.info('inflateInit2 success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        try {
        await zip.inflateInit2({}, 2).then(data => {
            console.info('inflateInit2 success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest50 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_51
     * @tc.name       : actsZipTest51
     * @tc.desc       : test inflateInit
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest51', 0, async function (done) {
        console.info("==================actsZipTest51 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
        await zip.inflateInit({nextIn: null, availableIn: 2, nextOut: arrayBufferIn, availableOut: 2}).then(data => {
            console.info('inflateInit success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        done();
        console.info("==================actsZipTest51 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_52
     * @tc.name       : actsZipTest52
     * @tc.desc       : test inflateGetHeader
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest52', 0, async function (done) {
        console.info("==================actsZipTest52 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
        await zip.inflateGetHeader({nextIn: null, availableIn: 2, nextOut: arrayBufferIn, availableOut: 2}, null).then(data => {
            console.info('inflateGetHeader success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        try {
        await zip.inflateGetHeader({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}, {isText: true}).then(data => {
            console.info('inflateGetHeader success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest52 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_53
     * @tc.name       : actsZipTest53
     * @tc.desc       : test inflateGetDictionary
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest53', 0, async function (done) {
        console.info("==================actsZipTest53 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
        await zip.inflateGetDictionary({nextIn: null, availableIn: 2, nextOut: arrayBufferIn, availableOut: 2}, null).then(data => {
            console.info('inflateGetDictionary success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        try {
        await zip.inflateGetDictionary({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferIn, availableOut: 1}, arrayBufferIn).then(data => {
            console.info('inflateGetDictionary success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest53 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_54
     * @tc.name       : actsZipTest54
     * @tc.desc       : test inflateEnd
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest54', 0, async function (done) {
        console.info("==================actsZipTest54 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
        await zip.inflateEnd({nextIn: null, availableIn: 2, nextOut: arrayBufferIn, availableOut: 2}).then(data => {
            console.info('inflateEnd success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        try {
        await zip.inflateEnd({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferIn, availableOut: 1}).then(data => {
            console.info('inflateEnd success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest54 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_55
     * @tc.name       : actsZipTest55
     * @tc.desc       : test inflateCopy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest55', 0, async function (done) {
        console.info("==================actsZipTest55 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
        await zip.inflateCopy(null).then(data => {
            console.info('inflateCopy success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        try {
        await zip.inflateCopy(zip).then(data => {
            console.info('inflateCopy success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest55 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_56
     * @tc.name       : actsZipTest56
     * @tc.desc       : test inflate
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest56', 0, async function (done) {
        console.info("==================actsZipTest55 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
            await zip.inflate({nextIn: null, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}, zlib.CompressFlushMode.FINISH).then(data => {
            console.info('inflate success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        try {
            await zip.inflate({}, zlib.CompressFlushMode.FINISH).then(data => {
            console.info('inflate success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest56 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_57
     * @tc.name       : actsZipTest57
     * @tc.desc       : test deflate
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest57', 0, async function (done) {
        console.info("==================actsZipTest57 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
            await zip.deflate({nextIn: null, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}, zlib.CompressFlushMode.FINISH).then(data => {
            console.info('inflate success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        try {
            await zip.deflate({}, zlib.CompressFlushMode.FINISH).then(data => {
            console.info('inflate success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest57 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_58
     * @tc.name       : actsZipTest58
     * @tc.desc       : test deflateBound
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest58', 0, async function (done) {
        console.info("==================actsZipTest58 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
            await zip.deflateBound({nextIn: null, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}, 12).then(data => {
            console.info('deflateBound success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        done();
        console.info("==================actsZipTest58 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_59
     * @tc.name       : actsZipTest59
     * @tc.desc       : test deflateSetHeader
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest59', 0, async function (done) {
        console.info("==================actsZipTest59 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
            await zip.deflateSetHeader({nextIn: null, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}, {}).then(data => {
            console.info('deflateSetHeader success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        try {
            await zip.deflateSetHeader({nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}, {}).then(data => {
            console.info('deflateSetHeader success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest59 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_60
     * @tc.name       : actsZipTest60
     * @tc.desc       : test inflateCodesUsed
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest60', 0, async function (done) {
        console.info("==================actsZipTest60 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
            await zip.inflateCodesUsed({nextIn: null, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}).then(data => {
            console.info('inflateCodesUsed success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        done();
        console.info("==================actsZipTest60 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_61
     * @tc.name       : actsZipTest61
     * @tc.desc       : test deflateCopy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest61', 0, async function (done) {
        console.info("==================actsZipTest61 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
            await zip.deflateCopy(null).then(data => {
            console.info('deflateCopy success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        try {
            await zip.deflateCopy(zip).then(data => {
            console.info('deflateCopy success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest61 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_62
     * @tc.name       : actsZipTest62
     * @tc.desc       : test deflateSetDictionary
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest62', 0, async function (done) {
        console.info("==================actsZipTest62 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
            await zip.deflateSetDictionary({nextIn: null, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}, arrayBufferIn).then(data => {
            console.info('deflateSetDictionary success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        try {
            await zip.deflateSetDictionary({nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}, arrayBufferIn).then(data => {
            console.info('deflateSetDictionary success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest62 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_63
     * @tc.name       : actsZipTest63
     * @tc.desc       : test deflateGetDictionary
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest63', 0, async function (done) {
        console.info("==================actsZipTest63 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
            await zip.deflateGetDictionary({nextIn: null, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}, arrayBufferIn).then(data => {
            console.info('deflateGetDictionary success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        try {
            await zip.deflateGetDictionary({nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}, arrayBufferIn).then(data => {
            console.info('deflateGetDictionary success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest63 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_64
     * @tc.name       : actsZipTest64
     * @tc.desc       : test deflateTune
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest64', 0, async function (done) {
        console.info("==================actsZipTest64 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
            await zip.deflateTune({nextIn: null, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}, 1, 2, 34, null).then(data => {
            console.info('deflateTune success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        try {
            await zip.deflateTune({nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}, 1, 2, 3, 4).then(data => {
            console.info('deflateTune success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest64 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_65
     * @tc.name       : actsZipTest65
     * @tc.desc       : test deflateReset
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest65', 0, async function (done) {
        console.info("==================actsZipTest65 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
            await zip.deflateReset({nextIn: null, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}).then(data => {
            console.info('deflateReset success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        try {
            await zip.deflateReset({nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}).then(data => {
            console.info('deflateReset success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest65 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_66
     * @tc.name       : actsZipTest66
     * @tc.desc       : test deflateResetKeep
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest66', 0, async function (done) {
        console.info("==================actsZipTest66 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
            await zip.deflateResetKeep({nextIn: null, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}).then(data => {
            console.info('deflateResetKeep success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        try {
            await zip.deflateResetKeep({nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}).then(data => {
            console.info('deflateResetKeep success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest66 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_67
     * @tc.name       : actsZipTest67
     * @tc.desc       : test deflatePending
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest67', 0, async function (done) {
        console.info("==================actsZipTest67 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
            await zip.deflatePending({nextIn: null, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}).then(data => {
            console.info('deflatePending success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        try {
            await zip.deflatePending({nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}).then(data => {
            console.info('deflatePending success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest67 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_68
     * @tc.name       : actsZipTest68
     * @tc.desc       : test deflateParams
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest68', 0, async function (done) {
        console.info("==================actsZipTest68 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
            await zip.deflateParams({}, null, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
            console.info('deflateParams success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        try {
            await zip.deflateParams({}, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(data => {
            console.info('deflateParams success')
            expect(data).assertFail()
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest68 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_69
     * @tc.name       : actsZipTest69
     * @tc.desc       : test deflatePrime
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest69', 0, async function (done) {
        console.info("==================actsZipTest69 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
            await zip.deflatePrime({}, null, 1).then(data => {
            console.info('deflatePrime success')
            expect(data).assertFail();
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401)
        }
        try {
            await zip.deflatePrime({}, 1, 1).then(data => {
            console.info('deflatePrime success')
            expect(data).assertFail();
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        done();
        console.info("==================actsZipTest69 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_70
     * @tc.name       : actsZipTest70
     * @tc.desc       : test inflateCodesUsed
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest70', 0, async function (done) {
        console.info("==================actsZipTest70 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        await zip.inflateInit({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}
        ).then(data => {
            console.info('inflateInit success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        await zip.inflateCodesUsed({nextIn: arrayBufferIn, availableIn: 1, nextOut: arrayBufferOut, availableOut: 8}).then(data => {
            console.info('inflateCodesUsed success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        done();
        console.info("==================actsZipTest70 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_71
     * @tc.name       : actsZipTest71
     * @tc.desc       : test inflateMark
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest71', 0, async function (done) {
        console.info("==================actsZipTest71 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
        nextIn: arrayBufferIn,
        availableIn: 1,
        nextOut: arrayBufferOut,
        availableOut: 1
        };
        let zip = zlib.createZipSync();
        await zip.inflateInit({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}
        ).then(data => {
            console.info('inflateInit success');
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        await zip.inflateMark({nextIn: arrayBufferOut, availableIn: 1, nextOut: arrayBufferOut, availableOut: 1}).then(data => {
            console.info('inflateMark success');
            expect(data).assertEqual(-65536);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        done();
        console.info("==================actsZipTest71 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_72
     * @tc.name       : actsZipTest72
     * @tc.desc       : test inflate
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest72', 0, async function (done) {
        console.info("==================actsZipTest72 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
            await zip.inflateInit({nextIn: arrayBufferOut, availableIn: 2}).then(data => {
            console.info('inflateInit success')
            expect(data).assertEqual(0)
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        }
        await zip.inflate({nextOut: arrayBufferIn, availableOut: 20}, zlib.CompressFlushMode.NO_FLUSH).then((data) => {
            console.info('inflate success')
            expect(data).assertFail();
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
            expect(errData.code).assertEqual(17800005);
            expect(zlib.CompressFlushMode.NO_FLUSH).assertEqual(0);
            expect(zlib.CompressFlushMode.PARTIAL_FLUSH).assertEqual(1);
        })
        done();
        console.info("==================actsZipTest72 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_73
     * @tc.name       : actsZipTest73
     * @tc.desc       : test inflate
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest73', 0, async function (done) {
        console.info("==================actsZipTest73 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        await zip.compress(arrayBufferOut, arrayBufferIn, 20).then((data) => {
            console.info('compress success');
            expect(data.status).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        await zip.uncompress(arrayBufferIn, arrayBufferOut, 20).then((data) => {
            console.info('uncompress success', data.status);
            expect(data.status).assertEqual(0);
            expect(data.destLen).assertEqual(12);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800007);
        })
        done();
        console.info("==================actsZipTest73 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_74
     * @tc.name       : actsZipTest74
     * @tc.desc       : test inflateSync
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest74', 0, async function (done) {
        console.info("==================actsZipTest74 start==================");
        let str = 'hello, hello!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        await zip.deflateInit({}, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION).then((data) => {
            console.info('deflateInit success')
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        await zip.deflate({nextIn: arrayBufferIn, availableIn: 3, nextOut: arrayBufferOut, availableOut: 100}, zlib.CompressFlushMode.FULL_FLUSH).then((data) => {
            console.info('deflate success')
            expect(data).assertEqual(0);
            expect(zlib.CompressFlushMode.FINISH).assertEqual(4);
            expect(zlib.CompressFlushMode.BLOCK).assertEqual(5);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        await zip.deflate({ availableIn: 11}, zlib.CompressFlushMode.FINISH).then((data) => {
            console.info('deflate success')
            expect(data).assertEqual(1);
            expect(zlib.CompressFlushMode.SYNC_FLUSH).assertEqual(2);
            expect(zlib.CompressFlushMode.FULL_FLUSH).assertEqual(3);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        })
        await zip.deflateEnd({}).then(data => {
                console.info('deflateEnd success')
                expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
        try {
            await zip.inflateInit({nextIn: arrayBufferOut, availableIn: 2}).then(data => {
                console.info('inflateInit2 success')
                expect(data).assertEqual(0);
                })
            } catch (errData) {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            }
            await zip.inflate({nextOut: arrayBufferIn, availableOut: 28}, zlib.CompressFlushMode.NO_FLUSH).then((data) => {
                console.info('inflate success')
                expect(data).assertEqual(0);
                expect(zlib.CompressFlushMode.TREES).assertEqual(6);
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            await zip.inflateSync({availableIn: 26}).then(data => {
                console.info('inflateSync success');
                expect(data).assertEqual(0);
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
            })
            await zip.inflateEnd({nextOut: arrayBufferOut}).then((data) => {
                console.info('inflateEnd success')
                expect(data).assertEqual(0);
            }).catch((errData: base.BusinessError) => {
                console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
        })
        done();
        console.info("==================actsZipTest74 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_75
     * @tc.name       : actsZipTest75
     * @tc.desc       : test inflateSetDictionary
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('actsZipTest75', 0, async function (done) {
        console.info("==================actsZipTest75 start==================");
        let str = 'hello, hello!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
            byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        let dictionary = 'hello'
        let dictionarybuf = new ArrayBuffer(dictionary.length);
        let dictionarybufdata = new Uint8Array(dictionarybuf);
        for (let i = 0, j = dictionary.length; i < j; i++) {
            dictionarybufdata[i] = str.charCodeAt(i);
        }
        await zip.deflateInit({}, zlib.CompressLevel.COMPRESS_LEVEL_BEST_COMPRESSION).then((data) => {
            console.info('deflateInit success')
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
            expect(errData).assertFail();
        })
        await zip.deflateSetDictionary({}, dictionarybuf).then((data) => {
            console.info('deflateSetDictionary success')
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
            expect(errData).assertFail();
        })
        await zip.deflate({nextIn: arrayBufferIn, availableIn: 14, nextOut: arrayBufferOut, availableOut: 100},
          zlib.CompressFlushMode.FINISH).then((data) => {
            console.info('deflate success')
            expect(data).assertEqual(1);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
            expect(errData).assertFail();
        })
        await zip.deflateEnd({}).then(data => {
            console.info('deflateEnd success')
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
            expect(errData).assertFail();
        })
        try {
            await zip.inflateInit({nextIn: arrayBufferOut, availableIn: 100}).then(data => {
                console.info('inflateInit success')
                expect(data).assertEqual(0);
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
            expect(errData).assertFail()
        }
        await zip.inflate({nextOut: arrayBufferIn, availableOut: 28}, zlib.CompressFlushMode.NO_FLUSH).then((data) => {
            console.info('inflate success')
            expect(data).assertEqual(2)
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
            expect(errData).assertFail()
        })
        await zip.inflateSetDictionary({}, dictionarybuf).then((data) => {
            console.info('inflateSetDictionary success')
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
            expect(errData).assertFail();
        })
        await zip.inflateEnd({nextOut: arrayBufferOut}).then((data) => {
            console.info('inflateEnd success')
            expect(data).assertEqual(0);
        }).catch((errData: base.BusinessError) => {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`)
            expect(errData).assertFail();
        })
        done();
        console.info("==================actsZipTest75 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_76
     * @tc.name       : actsZipTest76
     * @tc.desc       : test deflateEnd
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest76', 0, async function (done) {
        console.info("==================actsZipTest76 start==================");
        let zip = zlib.createZipSync();
        try {
          await zip.deflateEnd({nextOut: null}).then(data => {
            console.info('deflateEnd success')
            expect(data).assertFail();
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        done();
        console.info("==================actsZipTest76 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_77
     * @tc.name       : actsZipTest77
     * @tc.desc       : test inflateBackEnd
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest77', 0, async function (done) {
        console.info("==================actsZipTest77 start==================");
        let zip = zlib.createZipSync();
        try {
            await zip.inflateBackInit({ }, null, null).then(data => {
            console.info('inflateBackInit success')
            expect(data).assertFail();
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        try {
            await zip.inflateBackEnd({}).then(data => {
            console.info('inflateBackInit success')
            expect(data).assertFail();
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }
        try {
            await zip.inflateBackEnd({nextOut: null}).then(data => {
            console.info('inflateBackInit success')
            expect(data).assertFail();
            })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        done();
        console.info("==================actsZipTest77 end==================");
    })

    /**
     * @tc.number     : ACTS_ZipTest_78
     * @tc.name       : actsZipTest78
     * @tc.desc       : test inflateBack
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('actsZipTest78', 0, async function (done) {
        console.info("==================actsZipTest78 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
        byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
        await zip.inflateBack({}, null, null, null, null).then(data => {
            console.info('inflateBack success')
            expect(data).assertFail();
        })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
        }

        try {
        await zip.inflateBackInit({}, 15, arrayBufferOut).then(data => {
            console.info('inflateBackInit success')
            expect(data).assertEqual(0);
        })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
        }

        try {
        await zip.inflateBack({ }, null, null, null, null).then(data => {
            console.info('inflateBack success')
            expect(data).assertFail();
        })
        } catch (errData) {
            console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(401);
        }
        done();
        console.info("==================actsZipTest78 end==================");
    })
 })
}