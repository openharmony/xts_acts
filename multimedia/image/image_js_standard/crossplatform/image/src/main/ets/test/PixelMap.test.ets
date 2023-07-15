/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import image from "@ohos.multimedia.image";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { testPng, testJpg } from './testImg'
import { scale2x1, translate3x1, rotate90, flipH, testBmp, testGif, crop3x3, scale1x4, setAlpha8, translate1x3 } from './testImg2'
import { tcBuf020, tcBuf020_1, tcBuf021, tcBuf021_1, tcBuf022 } from './testImg'

export default function PixelMap() {
    describe("PixelMap", function () {
        let globalpixelmap;
        beforeAll(async function () {
            console.info("beforeAll case");
        });

        beforeEach(function () {
            console.info("beforeEach case");
        });

        afterEach(async function () {
            console.info('afterEach case');
            if (globalpixelmap != undefined) {
                console.info('globalpixelmap release start');
                try {
                    await globalpixelmap.release();
                } catch (error) {
                    console.info('globalpixelmap release fail');
                }
            }
        });

        afterAll(async function () {
            console.info("afterAll case");
        });

        function loger(caseName) {
            return {
                myName: caseName,
                log: function (msg) {
                    console.info(this.myName + ' ' + msg);
                }
            }
        }

        async function genPixelMap() {
            var color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }

            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            return image.createPixelMap(color, opts);
        }

        async function getDensityTest(done, testNum, imageData, decodingOptions?) {
            try {
                var sourceOptions = { sourceDensity: 120 };
                let imageSource = image.createImageSource(imageData, sourceOptions);
                if (imageSource != undefined) {
                    let pixelMap = await imageSource.createPixelMap(decodingOptions);
                    if (pixelMap != undefined) {
                        var density = pixelMap.getDensity();
                        expect(decodingOptions ? (density == 240) : (density == 120)).assertTrue();
                        done();
                    } else {
                        console.info(`${testNum} failed`);
                        expect(false).assertTrue();
                        done();
                    }
                } else {
                    console.info(`${testNum} failed`);
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                console.info(`${testNum} failed` + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function opacityErr(done, testNum, param, type) {
            let logger = loger(testNum)
            try {
                var pixelMap = await genPixelMap()
                logger.log("pixelMap " + (pixelMap != undefined));
                if (pixelMap != undefined) {
                    if (type == 'callback') {
                        pixelMap.opacity(param, (error) => {
                            if (error) {
                                expect(true).assertTrue();
                                done();
                            } else {
                                expect(false).assertTrue();
                                done();
                            }
                        })
                    } else {
                        try {
                            await pixelMap.opacity(param)
                            expect(false).assertTrue();
                            logger.log('failed');
                            done();
                        } catch (error) {
                            expect(true).assertTrue();
                            logger.log('success');
                            done();
                        }
                    }
                } else {
                    logger.log('creat pixelMap failed ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function checkAlphaPixelmap(done, logger, alphaPixelMap) {
            logger.log("AlphaPixelMap " + alphaPixelMap);
            if (alphaPixelMap != undefined) {
                var imageInfo = await alphaPixelMap.getImageInfo();
                logger.log("AlphaPixelMap pixelformat " + imageInfo.pixelFormat);
                expect(imageInfo.pixelFormat == 6).assertTrue();
                done();
            } else {
                logger.log('creat alphaPixelMap failed');
                expect(false).assertTrue();
                done();
            }
        }

        async function createAlphaPixelmapTest(done, testNum, type, imageData) {
            let logger = loger(testNum)
            try {
                let imageSource = image.createImageSource(imageData);
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    let pixelMap = await imageSource.createPixelMap();
                    logger.log("PixelMap " + pixelMap);
                    if (pixelMap != undefined) {
                        if (type == 'callback') {
                            pixelMap.createAlphaPixelmap(async (err, alphaPixelMap) => {
                                await checkAlphaPixelmap(done, logger, alphaPixelMap)
                            })
                        } else {
                            var alphaPixelMap = await pixelMap.createAlphaPixelmap();
                            await checkAlphaPixelmap(done, logger, alphaPixelMap)
                        }
                    } else {
                        logger.log('creat pixelMap failed');
                        expect(false).assertTrue();
                        done();
                    }
                } else {
                    logger.log('creat ImageSource failed');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function checkPixelMapInterface(done, logger, pixelMap, orgInfo, sizeCheck, data) {
            var newInfo = await pixelMap.getImageInfo()
            sizeCheck(done, logger, orgInfo, newInfo)
            var pixelSize = pixelMap.getPixelBytesNumber();
            logger.log(`new pixel size ${pixelSize}`);
            var readBuffer = new ArrayBuffer(pixelSize);
            await pixelMap.readPixelsToBuffer(readBuffer);
            var bufferArr2 = new Uint8Array(readBuffer);
            for (var i = 0; i < bufferArr2.length; i++) {
                if (bufferArr2[i] != data[i]) {
                    logger.log(`pixel[${i}] current[${bufferArr2[i]}] target[${data[i]}]`);
                    expect(false).assertTrue();
                    done();
                    break;
                }
            }
            expect(true).assertTrue();
            done();
        }

        async function pixelMapModifySizeTest(done, testNum, type, pixelMapInterface, sizeCheck, data, ...params) {
            let logger = loger(testNum)
            try {
                var pixelMap = await genPixelMap()
                logger.log("pixelMap " + (pixelMap != undefined));
                if (pixelMap != undefined) {
                    var orgInfo = await pixelMap.getImageInfo()

                    if (type == 'callback') {
                        pixelMap[pixelMapInterface](...params, async () => {
                            await checkPixelMapInterface(done, logger, pixelMap, orgInfo, sizeCheck, data)
                        })
                    } else {
                        await pixelMap[pixelMapInterface](...params);
                        await checkPixelMapInterface(done, logger, pixelMap, orgInfo, sizeCheck, data)
                    }
                } else {
                    logger.log('create pixelMap fail ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function pixelMapModifySizeTestErr(done, testNum, type, pixelMapInterface, ...params) {
            let logger = loger(testNum)
            try {
                var pixelMap = await genPixelMap();
                logger.log("pixelMap " + (pixelMap != undefined));
                if (pixelMap != undefined) {
                    if (type == 'callback') {
                        pixelMap[pixelMapInterface](...params, async (error) => {
                            if (error) {
                                expect(true).assertTrue();
                                done();
                            } else {
                                expect(false).assertTrue();
                                done();
                            }
                        })
                    } else {
                        try {
                            await pixelMap[pixelMapInterface](...params);
                            expect(false).assertTrue();
                            done();
                        } catch (error) {
                            expect(true).assertTrue();
                            done();
                        }
                    }
                } else {
                    logger.log('create pixelMap fail ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : TEST_ISEDITABLE_001
         * @tc.name      : testIsEditable001
         * @tc.desc      : 1.create pixelmap
         *                 2.call isEditable
         *                 3.return true
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('testIsEditable001', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
            image.createPixelMap(Color, opts, (error, pixelmap) => {
                if (pixelmap == undefined) {
                    console.info('testIsEditable001 create pixelmap failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    expect(pixelmap.isEditable == true).assertTrue();
                    console.info('testIsEditable001 success ');
                    done();
                }
            })
        })

        /**
         * @tc.number    : TEST_ISEDITABLE_002
         * @tc.name      : testIsEditable002
         * @tc.desc      : 1.create pixelmap
         *                 2.call isEditable
         *                 3.return false
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('testIsEditable002', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
            image.createPixelMap(Color, opts, (error, pixelmap) => {
                if (pixelmap == undefined) {
                    console.info('testIsEditable002 create pixelmap failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    expect(pixelmap.isEditable == false).assertTrue();
                    console.info('testIsEditable002 success ');
                    done();
                }
            })
        })

        /**
         * @tc.number    : TEST_READPIXELSTOBUFFER_PROMISE_001
         * @tc.name      : testReadPixelsToBufferPromise001
         * @tc.desc      : read all pixels to an buffer
         *                 1.create PixelMap,buffer
         *                 2.call readPixelsToBuffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testReadPixelsToBufferPromise001', 0, async function (done) {
            console.info('testReadPixelsToBufferPromise001 in');
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }

            let opts = { editable: true, pixelFormat: 4, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('testReadPixelsToBufferPromise001 createPixelMap failed');
                        expect(false).assertTrue()
                        done();
                    }
                    const readBuffer = new ArrayBuffer(96);
                    pixelmap.readPixelsToBuffer(readBuffer).then(() => {
                        var bufferArr2 = new Uint8Array(readBuffer);
                        var res = true;
                        for (var i = 0; i < bufferArr2.length; i++) {
                            if (bufferArr2[i] != tcBuf020[i]) {
                                res = false;
                                console.info('TC_20_buffer' + bufferArr2[i]);
                                console.info('testReadPixelsToBufferPromise001 failed');
                                expect(false).assertTrue();
                                done();
                                break;
                            }
                        }
                        if (res) {
                            console.info('testReadPixelsToBufferPromise001 success');
                            expect(true).assertTrue()
                            done();
                        }
                    }).catch(error => {
                        console.log('testReadPixelsToBufferPromise001 read error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }).catch(error => {
                    console.log('testReadPixelsToBufferPromise001 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

        /**
         * @tc.number    : TEST_READPIXELSTOBUFFER_CB_001
         * @tc.name      : testReadPixelsToBufferCb001
         * @tc.desc      : read all pixels to an buffer
         *                 1.create PixelMap,buffer
         *                 2.call readPixelsToBuffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testReadPixelsToBufferCb001', 0, async function (done) {
            console.info('testReadPixelsToBufferCb001 in');
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }

            let opts = { editable: true, pixelFormat: 4, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('testReadPixelsToBufferCb001 createPixelMap failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    const readBuffer = new ArrayBuffer(96);
                    pixelmap.readPixelsToBuffer(readBuffer, () => {
                        var bufferArr = new Uint8Array(readBuffer);
                        var res = true;
                        for (var i = 0; i < bufferArr.length; i++) {
                            if (bufferArr[i] != tcBuf020_1[i]) {
                                res = false;
                                console.info('testReadPixelsToBufferCb001 failed');
                                expect(false).assertTrue();
                                done();
                                break;
                            }
                        }
                        if (res) {
                            console.info('testReadPixelsToBufferCb001 success');
                            expect(true).assertTrue()
                            done();
                        }
                    })
                }
            })
        })

        /**
         * @tc.number    : TEST_READPIXELSTOBUFFER_CB_002
         * @tc.name      : testReadPixelsToBufferCb002
         * @tc.desc      : read all pixels to an buffer
         *                 1.create PixelMap,buffer
         *                 2.call readPixelsToBuffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testReadPixelsToBufferCb002', 0, async function (done) {
            console.info('testReadPixelsToBufferCb002 in');
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }

            let opts = { editable: true, pixelFormat: 2, size: { height: 6, width: 8 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('testReadPixelsToBufferCb002 createPixelMap failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    const readBuffer = new ArrayBuffer(0);
                    pixelmap.readPixelsToBuffer(readBuffer, () => {
                        var bufferArr = new Uint8Array(readBuffer);
                        var res = true;
                        for (var i = 0; i < bufferArr.length; i++) {
                            if (bufferArr[i] == 0) {
                                res = false;
                                console.info('testReadPixelsToBufferCb002 failed');
                                expect(false).assertTrue();
                                done();
                                break;
                            }
                        }
                        if (res) {
                            console.info('testReadPixelsToBufferCb002 success');
                            expect(true).assertTrue()
                            done();
                        }
                    })
                }
            })
        })

        /**
         * @tc.number    : TEST_READPIXELS_PROMISE_001
         * @tc.name      : testReadPixelsPromise001
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.promise return array
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testReadPixelsPromise001', 0, async function (done) {
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('testReadPixelsPromise001 createPixelMap failed');
                        expect(false).assertTrue()
                        done();
                    }
                    const area = {
                        pixels: new ArrayBuffer(8),
                        offset: 0,
                        stride: 8,
                        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                    }
                    pixelmap.readPixels(area).then(() => {
                        var bufferArr2 = new Uint8Array(area.pixels);
                        var res = true;
                        for (var i = 0; i < bufferArr2.length; i++) {
                            if (bufferArr2[i] != tcBuf021[i]) {
                                res = false;
                                console.info('testReadPixelsPromise001 failed');
                                expect(false).assertTrue();
                                done();
                                break;
                            }
                        }
                        if (res) {
                            console.info('testReadPixelsPromise001 success');
                            expect(true).assertTrue()
                            done();
                        }
                    })
                })
                .catch(error => {
                    console.log('testReadPixelsPromise001 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

        /**
         * @tc.number    : TEST_READPIXELS_PROMISE_002
         * @tc.name      : testReadPixelsPromise002
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.promise return array
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testReadPixelsPromise002', 0, async function (done) {
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue();
                    console.info('testReadPixelsPromise002 create pixelmap failed');
                    done();
                } else {
                    const area = {
                        pixels: new ArrayBuffer(0),
                        offset: 0,
                        stride: 8,
                        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                    }
                    pixelmap.readPixels(area).then(() => {
                        console.info('testReadPixelsPromise002 failed');
                        expect(false).assertTrue();
                        done();
                    }).catch(() => {
                        expect(true).assertTrue();
                        console.info('testReadPixelsPromise002 success');
                        done();
                    })
                }
            })
        })

        /**
         * @tc.number    : TEST_READPIXELS_PROMISE_003
         * @tc.name      : testReadPixelsPromise003
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.promise return array
         *                 4.callbackcall return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testReadPixelsPromise003', 0, async function (done) {
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue();
                    console.info('testReadPixelsPromise003 createPixelMap success');
                    done();
                }
                const area = {
                    pixels: new ArrayBuffer(20),
                    offset: 21,
                    stride: 8,
                    region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                }
                pixelmap.readPixels(area).then(() => {
                    console.info('testReadPixelsPromise003 failed');
                    expect(false).assertTrue();
                    done();
                }).catch(() => {
                    expect(true).assertTrue();
                    console.info('testReadPixelsPromise003 success');
                    done();
                })
            })
        })

        /**
         * @tc.number    : TEST_READPIXELS_PROMISE_004
         * @tc.name      : testReadPixelsPromise004
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.promise return array
         *                 4.callbackcall return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testReadPixelsPromise004', 0, async function (done) {
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue();
                    console.info('testReadPixelsPromise004 createPixelMap success');
                    done();
                }
                const area = {
                    pixels: new ArrayBuffer(20),
                    offset: 0,
                    stride: 8,
                    region: { size: { height: -1, width: -1 }, x: 0, y: 0 }
                }
                pixelmap.readPixels(area).then(() => {
                    console.info('testReadPixelsPromise004 failed');
                    expect(false).assertTrue();
                    done();
                }).catch(() => {
                    expect(true).assertTrue();
                    console.info('testReadPixelsPromise004 success');
                    done();
                })
            })
        })

        /**
         * @tc.number    : TEST_READPIXELS_CB_001
         * @tc.name      : testReadPixelsCb001
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.promise return array
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testReadPixelsCb001', 0, async function (done) {
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('testReadPixelsToBufferCb001 createPixelMap failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    const area = {
                        pixels: new ArrayBuffer(8),
                        offset: 0,
                        stride: 8,
                        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                    }
                    pixelmap.readPixels(area, () => {
                        var bufferArr = new Uint8Array(area.pixels);
                        var res = true;
                        for (var i = 0; i < bufferArr.length; i++) {
                            console.info('testReadPixelsCb001 buffer ' + bufferArr[i]);
                            if (bufferArr[i] != tcBuf021_1[i]) {
                                res = false;
                                console.info('testReadPixelsCb001 failed');
                                expect(false).assertTrue();
                                done();
                                break;
                            }
                        }
                        if (res) {
                            console.info('testReadPixelsCb001 success');
                            expect(true).assertTrue()
                            done();
                        }
                    })
                }
            })
        })

        /**
         * @tc.number    : TEST_READPIXELS_CB_002
         * @tc.name      : testReadPixelsCb001
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.promise return array
         *                 4.callbackcall return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testReadPixelsCb001', 0, async function (done) {
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue();
                    console.info('testReadPixelsCb001 create pixelmap fail');
                    done();
                } else {
                    const area = {
                        pixels: new ArrayBuffer(20),
                        offset: 0,
                        stride: 8,
                        region: { size: { height: 1, width: 2 }, x: -1, y: -1 }
                    }
                    pixelmap.readPixels(area).then(() => {
                        console.info('testReadPixelsCb001 failed');
                        expect(false).assertTrue();
                        done();
                    }).catch(() => {
                        expect(true).assertTrue();
                        console.info('testReadPixelsCb001 success');
                        done();
                    })
                }
            })
        })

        /**
         * @tc.number    : TEST_WRITEPIXELS_PROMISE_001
         * @tc.name      : testWritePixelsPromise001
         * @tc.desc      : 1.create PixelMap
         *                 2.call writePixels
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testWritePixelsPromise001', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('testWritePixelsPromise001 createPixelMap failed');
                        expect(false).assertTrue()
                        done();
                    }

                    const area = {
                        pixels: new ArrayBuffer(8),
                        offset: 0,
                        stride: 8,
                        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                    }
                    var bufferArr = new Uint8Array(area.pixels);
                    for (var i = 0; i < bufferArr.length; i++) {
                        bufferArr[i] = i + 1;
                    }
                    console.info('============ bufferArr ' + JSON.stringify(bufferArr));
                    pixelmap.writePixels(area).then(() => {
                        const readArea = {
                            pixels: new ArrayBuffer(8),
                            offset: 0,
                            stride: 8,
                            region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                        }
                        console.info('============ bufferArr ' + JSON.stringify(readArea));
                        pixelmap.readPixels(readArea).then(() => {
                            var readArr = new Uint8Array(readArea.pixels);
                            var res = true;
                            for (var i = 0; i < readArr.length; i++) {
                                if (readArr[i] != tcBuf022[i]) {
                                    res = false;
                                    console.info('testWritePixelsPromise001 failed');
                                    expect(false).assertTrue();
                                    done();
                                    break;
                                }
                            }
                            if (res) {
                                console.info('testWritePixelsPromise001 success');
                                expect(true).assertTrue()
                                done();
                            }
                        })
                    })
                })
                .catch(error => {
                    console.log('testWritePixelsPromise001 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

        /**
         * @tc.number    : TEST_WRITEPIXELS_CB_001
         * @tc.name      : testWritePixelsCb001
         * @tc.desc      : 1.create PixelMap
         *                 2.call writePixels
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testWritePixelsCb001', 0, async function (done) {
            try {
                const color = new ArrayBuffer(96);
                let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
                image.createPixelMap(color, opts, (err, pixelmap) => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('testWritePixelsCb001 createPixelMap failed');
                        expect(false).assertTrue()
                        done();
                    }
                    const area = {
                        pixels: new ArrayBuffer(8),
                        offset: 0,
                        stride: 8,
                        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                    }
                    var bufferArr = new Uint8Array(area.pixels);
                    for (var i = 0; i < bufferArr.length; i++) {
                        bufferArr[i] = i + 1;
                    }
                    pixelmap.writePixels(area, () => {
                        const readArea = {
                            pixels: new ArrayBuffer(8),
                            offset: 0,
                            stride: 8,
                            region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                        }
                        pixelmap.readPixels(readArea, () => {
                            var readArr = new Uint8Array(readArea.pixels);
                            var res = true;
                            for (var i = 0; i < readArr.length; i++) {
                                if (readArr[i] != tcBuf022[i]) {
                                    res = false;
                                    console.info('testWritePixelsCb001 failed');
                                    expect(false).assertTrue();
                                    done();
                                    break;
                                }
                            }
                            if (res) {
                                console.info('testWritePixelsCb001 success');
                                expect(true).assertTrue()
                                done();
                            }
                        })
                    })
                })
            } catch (error) {
                console.info('testWritePixelsCb001 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_WRITEBUFFERTOPIXELS_PROMISE_001
         * @tc.name      : testWriteBufferToPixelsPromise001
         * @tc.desc      : 1.create PixelMap,buffer
         *                 2.call writeBufferToPixels
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testWriteBufferToPixelsPromise001', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('testWriteBufferToPixelsPromise001 createPixelMap failed');
                        expect(false).assertTrue()
                        done();
                    }

                    const writeColor = new ArrayBuffer(96);
                    var bufferArr = new Uint8Array(writeColor);
                    for (var i = 0; i < bufferArr.length; i++) {
                        bufferArr[i] = i + 1;
                    }
                    pixelmap.writeBufferToPixels(writeColor).then(() => {
                        const readBuffer = new ArrayBuffer(96);
                        pixelmap.readPixelsToBuffer(readBuffer).then(() => {
                            var bufferArr = new Uint8Array(readBuffer);
                            var res = true;
                            for (var i = 0; i < bufferArr.length; i++) {
                                if (bufferArr[i] == 0) {
                                    res = false;
                                    console.info('testWriteBufferToPixelsPromise001 failed');
                                    expect(false).assertTrue()
                                    done();
                                    break;
                                }
                            }
                            if (res) {
                                console.info('testWriteBufferToPixelsPromise001 success');
                                expect(true).assertTrue();
                                done();
                            }
                        })
                    })
                })
                .catch(error => {
                    console.log('testWriteBufferToPixelsPromise001 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

        /**
         * @tc.number    : TEST_WRITEBUFFERTOPIXELS_CB_001
         * @tc.name      : testWriteBufferToPixelsCb001
         * @tc.desc      : 1.create PixelMap,buffer
         *                 2.call writeBufferToPixels
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testWriteBufferToPixelsCb001', 0, async function (done) {
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts).then(pixelmap => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue()
                    console.info('testWriteBufferToPixelsCb001 failed');
                    done();
                }
                const writeColor = new ArrayBuffer(96);
                pixelmap.writeBufferToPixels(writeColor, () => {
                    const readBuffer = new ArrayBuffer(96);
                    pixelmap.readPixelsToBuffer(readBuffer, () => {
                        var bufferArr = new Uint8Array(readBuffer);
                        var res = true;
                        for (var i = 0; i < bufferArr.length; i++) {
                            if (res) {
                                if (bufferArr[i] == 0) {
                                    res = false;
                                    console.info('testWriteBufferToPixelsCb001 Success');
                                    expect(true).assertTrue()
                                    done();
                                    break;
                                }
                            }
                        }
                        if (res) {
                            console.info('testWriteBufferToPixelsCb001 no change after writeBuffer');
                            expect(false).assertTrue();
                            done();
                        }
                    })
                })
            })
        })

        /**
         * @tc.number    : TEST_GETIMAGEINFO_PROMISE_001
         * @tc.name      : testGetImageInfoPromise001
         * @tc.desc      : 1.create PixelMap,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImageInfoPromise001', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('testGetImageInfoPromise001 createPixelMap failed');
                        expect(false).assertTrue()
                        done();
                    }
                    pixelmap.getImageInfo().then(imageInfo => {
                        if (imageInfo == undefined) {
                            console.info('testGetImageInfoPromise001 imageInfo is empty');
                            expect(false).assertTrue()
                            done();
                        }
                        if (imageInfo.size == null || imageInfo.density == null) {
                            console.info('testGetImageInfoPromise001 imageInfo size&density is empty');
                            expect(false).assertTrue()
                            done();
                        }
                        if (imageInfo.size.height == 4 && imageInfo.size.width == 6) {
                            console.info('testGetImageInfoPromise001 success ');
                            expect(true).assertTrue()
                            done();
                        }
                        done();
                    }).catch(error => {
                        console.log('testGetImageInfoPromise001 getimageinfo error: ' + error);
                        expect().assertFail();
                        done();
                    })
                    done();
                })
                .catch(error => {
                    console.log('testGetImageInfoPromise001 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

        /**
         * @tc.number    : TEST_GETIMAGEINFO_CB_001
         * @tc.name      : testGetImageInfoCb001
         * @tc.desc      : 1.create PixelMap,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImageInfoCb001', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                if (pixelmap == undefined) {
                    globalpixelmap = pixelmap;
                    expect(false).assertTrue()
                    console.info('testGetImageInfoCb001 create pixelmap fail');
                    done();
                }
                pixelmap.getImageInfo((err, imageInfo) => {
                    if (imageInfo == undefined) {
                        console.info('testGetImageInfoCb001 imageInfo is empty');
                        expect(false).assertTrue()
                        done();
                    }
                    if (imageInfo.size.height == 4 && imageInfo.size.width == 6) {
                        console.info('testGetImageInfoCb001 imageInfo success');
                        expect(true).assertTrue()
                        done();
                    }
                    done();
                })
            })
        })

        /**
         * @tc.number    : TEST_GETBYTESNUMBERPERROW_001
         * @tc.name      : testGetBytesNumberPerRow001
         * @tc.desc      : 1.create PixelMap
         *                 2.set PixelMap
         *                 3.call getBytesNumberPerRow
         *                 4.call return number
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetBytesNumberPerRow001', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            const expectNum = 4 * opts.size.width;
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue()
                    console.info('testGetBytesNumberPerRow001 create pixelmap fail');
                    done();
                } else {
                    const num = pixelmap.getBytesNumberPerRow();
                    console.info('testGetBytesNumberPerRow001 num is ' + num);
                    expect(num == expectNum).assertTrue();
                    if (num == expectNum) {
                        console.info('TC_25-1 success');
                    } else {
                        console.info('TC_25-1 fail');
                    }
                    done();
                }
            })
        })

        /**
         * @tc.number    : TEST_GETPIXELBYTESNUMBER_001
         * @tc.name      : testGetPixelBytesNumber001
         * @tc.desc      : 1.create PixelMap
         *                 2.set Pixel
         *                 3.call getPixelBytesNumber
         *                 4.call return number
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetPixelBytesNumber001', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            const expectNum = 4 * opts.size.width * opts.size.height;
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue()
                    console.info('testGetPixelBytesNumber001 create pixelmap fail');
                    done();
                } else {
                    const num = pixelmap.getPixelBytesNumber();
                    console.info('testGetPixelBytesNumber001 num is ' + num);
                    expect(num == expectNum).assertTrue();
                    if (num == expectNum) {
                        console.info('testGetPixelBytesNumber001 success');
                    } else {
                        console.info('testGetPixelBytesNumber001 fail');
                    }
                    done();
                }
            })
        })

        /**
         * @tc.number    : TEST_GETDENSITY_001
         * @tc.name      : testGetDensity001
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap
         *               : 3.getDensity
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetDensity001', 0, async function (done) {
            var imageData = testPng.buffer;
            await getDensityTest(done, 'testGetDensity001', imageData);
        })

        /**
         * @tc.number    : TEST_GETDENSITY_002
         * @tc.name      : testGetDensity002
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap
         *               : 3.getDensity
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetDensity002', 0, async function (done) {
            var imageData = testJpg.buffer;
            await getDensityTest(done, 'testGetDensity002', imageData);
        })

        /**
         * @tc.number    : TEST_GETDENSITY_003
         * @tc.name      : testGetDensity003
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap
         *               : 3.getDensity
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetDensity003', 0, async function (done) {
            var imageData = testBmp.buffer;
            await getDensityTest(done, 'testGetDensity003', imageData);
        })

        /**
         * @tc.number    : TEST_GETDENSITY_004
         * @tc.name      : testGetDensity003
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap
         *               : 3.getDensity
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetDensity004', 0, async function (done) {
            var imageData = testGif.buffer;
            await getDensityTest(done, 'testGetDensity004', imageData);
        })

        /**
         * @tc.number    : TEST_GETDENSITY_005
         * @tc.name      : testGetDensity005
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap with fitDensity
         *               : 3.getDensity
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetDensity005', 0, async function (done) {
            var imageData = testPng.buffer;
            let decodingOptions = { fitDensity: 240 };
            await getDensityTest(done, 'testGetDensity005', imageData, decodingOptions);
        })

        /**
         * @tc.number    : TEST_GETDENSITY_006
         * @tc.name      : testGetDensity006
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap with fitDensity
         *               : 3.getDensity
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetDensity006', 0, async function (done) {
            var imageData = testJpg.buffer;
            let decodingOptions = { fitDensity: 240 };
            await getDensityTest(done, 'testGetDensity006', imageData, decodingOptions);
        })

        /**
         * @tc.number    : TEST_GETDENSITY_007
         * @tc.name      : testGetDensity007
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap with fitDensity
         *               : 3.getDensity
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetDensity007', 0, async function (done) {
            var imageData = testBmp.buffer;
            let decodingOptions = { fitDensity: 240 };
            await getDensityTest(done, 'testGetDensity007', imageData, decodingOptions);
        })

        /**
         * @tc.number    : TEST_GETDENSITY_008
         * @tc.name      : testGetDensity008
         * @tc.desc      : 1.create ImageSource
         *               : 2.create PixelMap with fitDensity
         *               : 3.getDensity
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetDensity008', 0, async function (done) {
            var imageData = testGif.buffer;
            let decodingOptions = { fitDensity: 240 };
            await getDensityTest(done, 'testGetDensity008', imageData, decodingOptions);
        })

        /**
         * @tc.number    : TEST_OPACITY_PROMISE_001
         * @tc.name      : testOpacityPromise001
         * @tc.desc      : 1.create pixelmap
         *               : 2.setAlpha
         *               : 3.get PixelBytesNumber
         *               : 4.read Pixels To Buffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testOpacityPromise001', 0, async function (done) {
            let logger = loger('testOpacityPromise001')
            try {
                var pixelMap = await genPixelMap()
                logger.log("pixelMap " + (pixelMap != undefined));
                if (pixelMap != undefined) {
                    await pixelMap.opacity(0.8)
                    var pixelSize = pixelMap.getPixelBytesNumber();
                    logger.log(`new pixel size ${pixelSize}`);
                    var readBuffer = new ArrayBuffer(pixelSize);
                    await pixelMap.readPixelsToBuffer(readBuffer);
                    var bufferArr2 = new Uint8Array(readBuffer);
                    for (var i = 0; i < bufferArr2.length; i++) {
                        if (bufferArr2[i] != setAlpha8[i]) {
                            logger.log(`pixel[${i}] current[${bufferArr2[i]}] target[${setAlpha8[i]}]`);
                            expect(false).assertTrue();
                            break;
                        }
                    }
                    expect(true).assertTrue();
                    done();
                } else {
                    logger.log('creat pixelMap failed ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_OPACITY_PROMISE_002
         * @tc.name      : testOpacityPromise002
         * @tc.desc      : 1.create pixelmap
         *               : 2.opacity
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testOpacityPromise002', 0, async function (done) {
            opacityErr(done, 'testOpacityPromise002', { a: 1 }, 'Promise')
        })

        /**
         * @tc.number    : TEST_OPACITY_PROMISE_003
         * @tc.name      : testOpacityPromise003
         * @tc.desc      : 1.create pixelmap
         *               : 2.opacity
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testOpacityPromise003', 0, async function (done) {
            opacityErr(done, 'testOpacityPromise003', 'a', 'Promise')
        })

        /**
         * @tc.number    : TEST_OPACITY_PROMISE_004
         * @tc.name      : testOpacityPromise004
         * @tc.desc      : 1.create pixelmap
         *               : 2.opacity
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testOpacityPromise004', 0, async function (done) {
            opacityErr(done, 'testOpacityPromise004', null, 'Promise')
        })

        /**
         * @tc.number    : TEST_OPACITY_PROMISE_005
         * @tc.name      : testOpacityPromise005
         * @tc.desc      : 1.create pixelmap
         *               : 2.opacity
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testOpacityPromise005', 0, async function (done) {
            opacityErr(done, 'testOpacityPromise005', 2, 'Promise')
        })

        /**
         * @tc.number    : TEST_OPACITY_CB_001
         * @tc.name      : testOpacityCb001
         * @tc.desc      : 1.create pixelmap
         *               : 2.setAlpha
         *               : 3.get PixelBytesNumber
         *               : 4.read Pixels To Buffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testOpacityCb001', 0, async function (done) {
            let logger = loger('testOpacityCb001')
            try {
                var pixelMap = await genPixelMap()
                logger.log("pixelMap " + (pixelMap != undefined));
                if (pixelMap != undefined) {
                    pixelMap.opacity(0.8, async (err) => {
                        var pixelSize = pixelMap.getPixelBytesNumber();
                        logger.log(`new pixel size ${pixelSize}`);
                        var readBuffer = new ArrayBuffer(pixelSize);
                        await pixelMap.readPixelsToBuffer(readBuffer);
                        var bufferArr2 = new Uint8Array(readBuffer);
                        for (var i = 0; i < bufferArr2.length; i++) {
                            if (bufferArr2[i] != setAlpha8[i]) {
                                logger.log(`pixel[${i}] current[${bufferArr2[i]}] target[${setAlpha8[i]}]`);
                                expect(false).assertTrue();
                                break;
                            }
                        }
                        expect(true).assertTrue();
                        done();
                    })
                } else {
                    logger.log('creat pixelMap failed ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_OPACITY_CB_002
         * @tc.name      : testOpacityCb002
         * @tc.desc      : 1.create pixelmap
         *               : 2.opacity
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testOpacityCb002', 0, async function (done) {
            opacityErr(done, 'testOpacityCb002', { a: 1 }, 'callback')
        })

        /**
         * @tc.number    : TEST_OPACITY_CB_003
         * @tc.name      : testOpacityCb003
         * @tc.desc      : 1.create pixelmap
         *               : 2.opacity
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testOpacityCb003', 0, async function (done) {
            opacityErr(done, 'testOpacityCb003', 'a', 'callback')
        })

        /**
         * @tc.number    : TEST_OPACITY_CB_004
         * @tc.name      : testOpacityCb004
         * @tc.desc      : 1.create pixelmap
         *               : 2.opacityErr
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testOpacityCb004', 0, async function (done) {
            opacityErr(done, 'testOpacityCb004', null, 'callback')
        })

        /**
         * @tc.number    : TEST_OPACITY_CB_005
         * @tc.name      : testOpacityCb005
         * @tc.desc      : 1.create pixelmap
         *               : 2.opacity
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testOpacityCb005', 0, async function (done) {
            opacityErr(done, 'testOpacityCb005', 2, 'callback')
        })

        /**
         * @tc.number    : TEST_CREATEALPHAPIXELMAP_PROMISE_001
         * @tc.name      : testCreateAlphaPixelmapPromise001
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.create AlphaPixelmap
         *               : 4.call getImageInfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreateAlphaPixelmapPromise001', 0, async function (done) {
            var imageData = testPng.buffer;
            await createAlphaPixelmapTest(done, 'testCreateAlphaPixelmapPromise001', 'promise', imageData);
        })

        /**
         * @tc.number    : TEST_CREATEALPHAPIXELMAP_PROMISE_002
         * @tc.name      : testCreateAlphaPixelmapPromise002
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.create AlphaPixelmap
         *               : 4.call getImageInfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreateAlphaPixelmapPromise002', 0, async function (done) {
            var imageData = testJpg.buffer;
            await createAlphaPixelmapTest(done, 'testCreateAlphaPixelmapPromise002', 'promise', imageData);
        })

        /**
         * @tc.number    : TEST_CREATEALPHAPIXELMAP_PROMISE_003
         * @tc.name      : testCreateAlphaPixelmapPromise003
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.create AlphaPixelmap
         *               : 4.call getImageInfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreateAlphaPixelmapPromise003', 0, async function (done) {
            var imageData = testBmp.buffer;
            await createAlphaPixelmapTest(done, 'testCreateAlphaPixelmapPromise003', 'promise', imageData);
        })

        /**
         * @tc.number    : TEST_CREATEALPHAPIXELMAP_PROMISE_004
         * @tc.name      : testCreateAlphaPixelmapPromise004
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.create AlphaPixelmap
         *               : 4.call getImageInfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreateAlphaPixelmapPromise004', 0, async function (done) {
            var imageData = testGif.buffer;
            await createAlphaPixelmapTest(done, 'testCreateAlphaPixelmapPromise004', 'promise', imageData);
        })

        /**
         * @tc.number    : TEST_CREATEALPHAPIXELMAP_CB_001
         * @tc.name      : testCreateAlphaPixelmapCb001
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.create AlphaPixelmap
         *               : 4.call getImageInfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreateAlphaPixelmapCb001', 0, async function (done) {
            var imageData = testPng.buffer;
            await createAlphaPixelmapTest(done, 'testCreateAlphaPixelmapCb001', 'callback', imageData);
        })

        /**
         * @tc.number    : TEST_SCALE_PROMISE_001
         * @tc.name      : testScalePromise001
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testScalePromise001', 0, async function (done) {

            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.width == orgInfo.size.width * 2) {
                    logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
                    expect(true).assertTrue();
                    done();
                } else {
                    logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
                    expect(false).assertTrue();
                    done();
                }
            }

            let logger = loger('testScalePromise001')
            try {
                var pixelMap = await genPixelMap()
                logger.log("pixelMap " + (pixelMap != undefined));
                if (pixelMap != undefined) {
                    var orgInfo = await pixelMap.getImageInfo();
                    await pixelMap.scale(2.0, 1.0);
                    var newInfo = await pixelMap.getImageInfo()
                    sizeCheck(done, logger, orgInfo, newInfo)
                } else {
                    logger.log('create pixelMap fail ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_SCALE_PROMISE_002
         * @tc.name      : testScalePromise002
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testScalePromise002', 0, async function (done) {

            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.height == orgInfo.size.height * 4) {
                    logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
                    expect(true).assertTrue();
                    done();
                } else {
                    logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
                    expect(false).assertTrue();
                    done();
                }
            }

            let logger = loger('testScalePromise002')
            try {
                var pixelMap = await genPixelMap()
                logger.log("pixelMap " + (pixelMap != undefined));
                if (pixelMap != undefined) {
                    var orgInfo = await pixelMap.getImageInfo();
                    await pixelMap.scale(1.0, 4.0);
                    var newInfo = await pixelMap.getImageInfo()
                    sizeCheck(done, logger, orgInfo, newInfo)
                } else {
                    logger.log('create pixelMap fail ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_SCALE_PROMISE_003
         * @tc.name      : testScalePromise003
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testScalePromise003', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testScalePromise003', 'promise', 'scale', { a: 10 }, 1.0)
        })

        /**
         * @tc.number    : TEST_SCALE_PROMISE_004
         * @tc.name      : testScalePromise004
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testScalePromise004', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testScalePromise004', 'promise', 'scale', 'a', 1.0)
        })

        /**
         * @tc.number    : TEST_SCALE_PROMISE_005
         * @tc.name      : testScalePromise005
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testScalePromise005', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testScalePromise005', 'promise', 'scale', 1.0, null)

        })

        /**
         * @tc.number    : TEST_SCALE_PROMISE_006
         * @tc.name      : testScalePromise006
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testScalePromise006', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testScalePromise006', 'promise', 'scale', 1.0, true)

        })

        /**
         * @tc.number    : TEST_SCALE_CB_001
         * @tc.name      : testScaleCb001
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testScaleCb001', 0, async function (done) {
            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.height == orgInfo.size.height * 4) {
                    logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
                    expect(true).assertTrue();
                    done();
                } else {
                    logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
                    expect(false).assertTrue();
                    done();
                }
            }

            let logger = loger('testScaleCb001')
            try {
                var pixelMap = await genPixelMap()
                logger.log("pixelMap " + (pixelMap != undefined));
                if (pixelMap != undefined) {
                    var orgInfo = await pixelMap.getImageInfo();
                    pixelMap.scale(1.0, 4.0, async () => {
                        var newInfo = await pixelMap.getImageInfo()
                        sizeCheck(done, logger, orgInfo, newInfo)
                    })
                } else {
                    logger.log('create pixelMap fail ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_SCALE_CB_002
         * @tc.name      : testScaleCb002
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testScaleCb002', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testScaleCb002', 'callback', 'scale', { a: 10 }, 1.0)
        })

        /**
         * @tc.number    : TEST_SCALE_CB_003
         * @tc.name      : testScaleCb003
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testScaleCb003', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testScaleCb003', 'callback', 'scale', 'a', 1.0)
        })

        /**
         * @tc.number    : TEST_SCALE_CB_004
         * @tc.name      : testScaleCb004
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testScaleCb004', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testScaleCb004', 'callback', 'scale', 1.0, null)
        })

        /**
         * @tc.number    : TEST_SCALE_CB_005
         * @tc.name      : testScaleCb005
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testScaleCb005', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testScaleCb005', 'callback', 'scale', 1.0, true)
        })

        /**
         * @tc.number    : TEST_TRANSLATE_PROMISE_001
         * @tc.name      : testTranslatePromise001
         * @tc.desc      : 1.create pixelmap
         *               : 2.call translate
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTranslatePromise001', 0, async function (done) {
            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.width != orgInfo.size.width + 3) {
                    logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
                    expect(false).assertTrue();
                    done();
                }
            }
            await pixelMapModifySizeTest(done, 'testTranslatePromise001', 'promise', 'translate', sizeCheck, translate3x1, 3.0, 1.0)
        })

        /**
         * @tc.number    : TEST_TRANSLATE_PROMISE_002
         * @tc.name      : testTranslatePromise002
         * @tc.desc      : 1.create pixelmap
         *               : 2.call translate
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTranslatePromise002', 0, async function (done) {
            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.height != orgInfo.size.height + 3) {
                    logger.log(`org height ${orgInfo.size.height}, new height ${newInfo.size.height} `);
                    expect(false).assertTrue();
                    done();
                }
            }
            await pixelMapModifySizeTest(done, 'testTranslatePromise002', 'promise', 'translate', sizeCheck, translate1x3, 1.0, 3.0)
        })

        /**
         * @tc.number    : TEST_TRANSLATE_PROMISE_003
         * @tc.name      : testTranslatePromise003
         * @tc.desc      : 1.create pixelmap
         *               : 2.call translate
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTranslatePromise003', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testTranslatePromise003', 'promise', 'translate', { a: 10 }, 1.0)
        })

        /**
         * @tc.number    : TEST_TRANSLATE_PROMISE_004
         * @tc.name      : testTranslatePromise004
         * @tc.desc      : 1.create pixelmap
         *               : 2.call translate
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTranslatePromise004', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testTranslatePromise004', 'promise', 'translate', 'a', 1.0)
        })

        /**
         * @tc.number    : TEST_TRANSLATE_PROMISE_005
         * @tc.name      : testTranslatePromise005
         * @tc.desc      : 1.create pixelmap
         *               : 2.call translate
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTranslatePromise005', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testTranslatePromise005', 'promise', 'translate', 1.0, null)
        })

        /**
         * @tc.number    : TEST_TRANSLATE_PROMISE_006
         * @tc.name      : testTranslatePromise006
         * @tc.desc      : 1.create pixelmap
         *               : 2.call translate
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTranslatePromise006', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testTranslatePromise006', 'promise', 'translate', 1.0, false)
        })

        /**
         * @tc.number    : TEST_TRANSLATE_CB_001
         * @tc.name      : testTranslateCb001
         * @tc.desc      : 1.create pixelmap
         *               : 2.call translate
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTranslateCb001', 0, async function (done) {
            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.height != orgInfo.size.height + 3) {
                    logger.log(`org height ${orgInfo.size.height}, new height ${newInfo.size.height} `);
                    expect(false).assertTrue();
                    done();
                }
            }
            await pixelMapModifySizeTest(done, 'testTranslateCb001', 'callback', 'translate', sizeCheck, translate1x3, 1.0, 3.0)
        })

        /**
         * @tc.number    : TEST_TRANSLATE_CB_002
         * @tc.name      : testTranslateCb002
         * @tc.desc      : 1.create pixelmap
         *               : 2.call translate
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTranslateCb002', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testTranslateCb002', 'callback', 'translate', { a: 10 }, 1.0)
        })

        /**
         * @tc.number    : TEST_TRANSLATE_CB_003
         * @tc.name      : testTranslateCb003
         * @tc.desc      : 1.create pixelmap
         *               : 2.call translate
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTranslateCb003', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testTranslateCb003', 'callback', 'translate', 'a', 1.0)
        })

        /**
         * @tc.number    : TEST_TRANSLATE_CB_004
         * @tc.name      : testTranslateCb004
         * @tc.desc      : 1.create pixelmap
         *               : 2.call translate
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTranslateCb004', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testTranslateCb004', 'callback', 'translate', 1.0, null)
        })

        /**
         * @tc.number    : TEST_TRANSLATE_CB_005
         * @tc.name      : testTranslateCb005
         * @tc.desc      : 1.create pixelmap
         *               : 2.call translate
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTranslateCb005', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testTranslateCb005', 'callback', 'translate', 1.0, false)
        })

        /**
         * @tc.number    : TEST_ROTATE_PROMISE_001
         * @tc.name      : testRotatePromise001
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testRotatePromise001', 0, async function (done) {
            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.width != orgInfo.size.height) {
                    logger.log(`org height ${orgInfo.size.height}, new width ${newInfo.size.width} `);
                    expect(false).assertTrue();
                    done();
                }
            }
            await pixelMapModifySizeTest(done, 'testRotatePromise001', 'promise', 'rotate', sizeCheck, rotate90, 90.0)
        })

        /**
         * @tc.number    : TEST_ROTATE_PROMISE_002
         * @tc.name      : testRotatePromise002
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testRotatePromise002', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testRotatePromise002', 'promise', 'rotate', 'a')
        })

        /**
         * @tc.number    : TEST_ROTATE_PROMISE_003
         * @tc.name      : testRotatePromise003
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testRotatePromise003', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testRotatePromise003', 'promise', 'rotate', { a: 10 })
        })

        /**
         * @tc.number    : TEST_ROTATE_PROMISE_004
         * @tc.name      : testRotatePromise004
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testRotatePromise004', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testRotatePromise004', 'promise', 'rotate', null)
        })

        /**
         * @tc.number    : TEST_ROTATE_PROMISE_005
         * @tc.name      : testRotatePromise004
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testRotatePromise004', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testRotatePromise004', 'promise', 'rotate', false)
        })

        /**
         * @tc.number    : TEST_ROTATE_CB_001
         * @tc.name      : testRotateCb001
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testRotateCb001', 0, async function (done) {
            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.width != orgInfo.size.height) {
                    logger.log(`org height ${orgInfo.size.height}, new width ${newInfo.size.width} `);
                    expect(false).assertTrue();
                    done();
                }
            }
            await pixelMapModifySizeTest(done, 'testRotateCb001', 'callback', 'rotate', sizeCheck, rotate90, 90.0)
        })

        /**
         * @tc.number    : TEST_ROTATE_CB_002
         * @tc.name      : testRotateCb002
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testRotateCb002', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testRotateCb002', 'callback', 'rotate', 'a')
        })

        /**
         * @tc.number    : TEST_ROTATE_CB_003
         * @tc.name      : testRotateCb003
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testRotateCb003', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testRotateCb003', 'callback', 'rotate', { a: 10 })
        })

        /**
         * @tc.number    : TEST_ROTATE_CB_004
         * @tc.name      : testRotateCb004
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testRotateCb004', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testRotateCb004', 'callback', 'rotate', null)
        })

        /**
         * @tc.number    : TEST_ROTATE_CB_005
         * @tc.name      : testRotateCb005
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testRotateCb005', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testRotateCb005', 'callback', 'rotate', false)
        })

        /**
         * @tc.number    : TEST_FLIP_PROMISE_001
         * @tc.name      : testFlipPromise001
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testFlipPromise001', 0, async function (done) {
            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.width != orgInfo.size.width) {
                    logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
                    expect(false).assertTrue();
                    done();
                }
            }
            await pixelMapModifySizeTest(done, 'testFlipPromise001', 'promise', 'flip', sizeCheck, flipH, false, true)
        })

        /**
         * @tc.number    : TEST_FLIP_PROMISE_002
         * @tc.name      : testFlipPromise002
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testFlipPromise002', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testFlipPromise002', 'promise', 'flip', 'false', true)
        })

        /**
         * @tc.number    : TEST_FLIP_PROMISE_003
         * @tc.name      : testFlipPromise003
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testFlipPromise003', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testFlipPromise003', 'promise', 'flip', 1, true)
        })

        /**
         * @tc.number    : TEST_FLIP_PROMISE_004
         * @tc.name      : testFlipPromise004
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testFlipPromise004', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testFlipPromise004', 'promise', 'flip', true, { a: 10 })
        })

        /**
         * @tc.number    : TEST_FLIP_PROMISE_005
         * @tc.name      : testFlipPromise005
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testFlipPromise005', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testFlipPromise005', 'promise', 'flip', true, null)
        })

        /**
         * @tc.number    : TEST_FLIP_CB_001
         * @tc.name      : testFlipCb001
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testFlipCb001', 0, async function (done) {
            function sizeCheck(done, logger, orgInfo, newInfo) {
                if (newInfo.size.width != orgInfo.size.width) {
                    logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
                    expect(false).assertTrue();
                    done();
                }
            }
            await pixelMapModifySizeTest(done, 'testFlipCb001', 'callback', 'flip', sizeCheck, flipH, false, true)
        })

        /**
         * @tc.number    : TEST_FLIP_CB_002
         * @tc.name      : testFlipCb002
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testFlipCb002', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testFlipCb002', 'callback', 'flip', 'false', true)
        })

        /**
         * @tc.number    : TEST_FLIP_CB_003
         * @tc.name      : testFlipCb003
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testFlipCb003', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testFlipCb003', 'callback', 'flip', 1, true)
        })

        /**
         * @tc.number    : TEST_FLIP_CB_004
         * @tc.name      : testFlipCb004
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testFlipCb004', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testFlipCb004', 'callback', 'flip', true, { a: 10 })
        })

        /**
         * @tc.number    : TEST_FLIP_CB_005
         * @tc.name      : testFlipCb005
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testFlipCb005', 0, async function (done) {
            await pixelMapModifySizeTestErr(done, 'testFlipCb005', 'callback', 'flip', true, null)
        })

        /**
         * @tc.number    : TEST_CROP_PROMISE_001
         * @tc.name      : testCropPromise001
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('testCropPromise001', 0, async function (done) {
            var region = { size: { height: 3, width: 3 }, x: 1, y: 1 };
            function sizeCheck(done, logger, orgInfo, newInfo) {
                orgInfo = region;
                if (newInfo.size.width != orgInfo.size.width) {
                    logger.log(`orgInfo width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
                    expect(false).assertTrue();
                    done();
                }
            }
            await pixelMapModifySizeTest(done, 'testCropPromise001', 'promise', 'crop', sizeCheck, crop3x3, region)
        })

        /**
         * @tc.number    : TEST_CROP_PROMISE_002
         * @tc.name      : testCropPromise002
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCropPromise002', 0, async function (done) {
            var region = { size: { height: 3, width: 3 }, x: -1, y: 1 };
            await pixelMapModifySizeTestErr(done, 'testCropPromise002', 'promise', 'crop', region)
        })

        /**
         * @tc.number    : TEST_CROP_PROMISE_003
         * @tc.name      : testCropPromise003
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCropPromise003', 0, async function (done) {
            var region = { size: { height: 3, width: 3 }, x: 1, y: -1 };
            await pixelMapModifySizeTestErr(done, 'v', 'promise', 'crop', region)
        })

        /**
         * @tc.number    : TEST_CROP_PROMISE_004
         * @tc.name      : testCropPromise004
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCropPromise004', 0, async function (done) {
            var region = { size: { height: 3, width: -3 }, x: 1, y: 1 };
            await pixelMapModifySizeTestErr(done, 'testCropPromise004', 'promise', 'crop', region)
        })

        /**
         * @tc.number    : TEST_CROP_PROMISE_005
         * @tc.name      : testCropPromise005
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCropPromise005', 0, async function (done) {
            var region = { size: { height: -3, width: 3 }, x: 1, y: 1 };
            await pixelMapModifySizeTestErr(done, 'testCropPromise005', 'promise', 'crop', region)
        })

        /**
         * @tc.number    : TEST_CROP_CB_001
         * @tc.name      : testCropCb001
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCropCb001', 0, async function (done) {
            var region = { size: { height: 3, width: 3 }, x: 1, y: 1 };
            function sizeCheck(done, logger, orgInfo, newInfo) {
                orgInfo = region;
                if (newInfo.size.width != orgInfo.size.width) {
                    logger.log(`orgInfo width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
                    expect(false).assertTrue();
                    done();
                }
            }
            await pixelMapModifySizeTest(done, 'testCropCb001', 'callback', 'crop', sizeCheck, crop3x3, region)
        })

        /**
         * @tc.number    : TEST_CROP_CB_002
         * @tc.name      : testCropCb002
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCropCb002', 0, async function (done) {
            var region = { size: { height: 3, width: 3 }, x: -1, y: 1 };
            await pixelMapModifySizeTestErr(done, 'testCropCb002', 'callback', 'crop', region)
        })

        /**
         * @tc.number    : TEST_CROP_CB_003
         * @tc.name      : testCropCb003
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCropCb003', 0, async function (done) {
            var region = { size: { height: 3, width: 3 }, x: 1, y: -1 };
            await pixelMapModifySizeTestErr(done, 'testCropCb003', 'callback', 'crop', region)
        })

        /**
         * @tc.number    : TEST_CROP_CB_004
         * @tc.name      : testCropCb004
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCropCb004', 0, async function (done) {
            var region = { size: { height: 3, width: -3 }, x: 1, y: 1 };
            await pixelMapModifySizeTestErr(done, 'testCropCb004', 'callback', 'crop', region)
        })

        /**
         * @tc.number    : TEST_CROP_CB_005
         * @tc.name      : testCropCb005
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCropCb005', 0, async function (done) {
            var region = { size: { height: -3, width: 3 }, x: 1, y: 1 };
            await pixelMapModifySizeTestErr(done, 'testCropCb005', 'callback', 'crop', region)
        })

        /**
         * @tc.number    : test_Release_Promise_001
         * @tc.name      : testReleasePromise001
         * @tc.desc      : 1.create PixelMap
         *                 2.set Pixel
         *                 3.call release
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testReleasePromise001', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts).then(pixelmap => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('testReleasePromise001 createPixelMap failed');
                    expect(false).assertTrue()
                    done();
                }
                pixelmap.release().then(() => {
                    console.info('testReleasePromise001 success');
                    expect(true).assertTrue();
                    done();
                }).catch(error => {
                    console.log('testReleasePromise001 error: ' + error);
                    expect().assertFail();
                    done();
                })
            }).catch(error => {
                console.log('testReleasePromise001 createPixelMap failed error: ' + error);
                expect().assertFail();
                done();
            })
        })

        /**
         * @tc.number    : test_Release_Cb_001
         * @tc.name      : testReleaseCb001
         * @tc.desc      : 1.create PixelMap
         *                 2.set Pixel
         *                 3.call release
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testReleaseCb001', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('testReleaseCb001 createPixelMap failed');
                    expect(false).assertTrue()
                    done();
                }
                pixelmap.release(() => {
                    expect(true).assertTrue();
                    console.log('testReleaseCb001 success');
                    done();
                })
            })
        })
    });
}
