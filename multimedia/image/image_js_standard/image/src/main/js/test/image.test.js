/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import image from '@ohos.multimedia.image'
import fileio from '@ohos.fileio'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { testPng, testJpg } from './testImg'
import { tcBuf020, tcBuf020_1, tcBuf021, tcBuf021_1, tcBuf022 } from './testImg'
import featureAbility from '@ohos.ability.featureAbility'

export default function imageJsTest() {
    describe('imageJsTest', function () {
        let filePath;
        let fdNumber;
        let globalpixelmap;
        async function getFd(fileName) {
            let context = await featureAbility.getContext();
            await context.getFilesDir().then((data) => {
                filePath = data + '/' + fileName;
                console.info('image case filePath is ' + filePath);
            })
            await fileio.open(filePath).then((data) => {
                fdNumber = data;
                console.info("image case open fd success " + fdNumber);
            }, (err) => {
                console.info("image cese open fd fail" + err)
            }).catch((err) => {
                console.info("image case open fd err " + err);
            })
        }
        beforeAll(async function () {
            console.info('beforeAll case');
        })

        beforeEach(function () {
            console.info('beforeEach case');
        })

        afterEach(async function () {
            if (globalpixelmap != undefined) {
                console.info('globalpixelmap release start');
                try {
                    await globalpixelmap.release();
                } catch (error) {
                    console.info('globalpixelmap release fail');
                }
            }
            console.info('afterEach case');
        })

        afterAll(async function () {
            console.info('afterAll case');
        })

        /**
             * @tc.number    : TC_001
             * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer)
             * @tc.desc      : 1.create InitializationOptions object
             *                 2.set editable,pixeFormat,size
             *                 3.using color and opts create newPixelMap
             *                 4.return newpixelmap not empty
             * @tc.size      : MEDIUM
             * @tc.type      : Functional
             * @tc.level     : Level 0
             */
        it('TC_001', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(Color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    expect(pixelmap != undefined).assertTrue();
                    console.info('TC_001 success');
                    done();
                })
                .catch(error => {
                    console.log('TC_001 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

        /**
         * @tc.number    : TC_001-1
         * @tc.name      : create pixelmap-callback (editable: false, pixelFormat: RGBA_8888, size: { height: 4, width: 6 },bytes = buffer)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixelFormat,size
         *                 3.using colorand opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
        */
        it('TC_001-1', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: false, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('TC_001-1 success');
                done();
            })
        })

        /**
         * @tc.number    : TC_001-2
         * @tc.name      : createpixelmap-promise (editable: true, pixelFormat: RGB_565, size: { height: 6, width: 8 },bytes = buffer)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixelFormat,size
         *                 3.using colorand opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_001-2', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 2, size: { height: 6, width: 8 } }
            image.createPixelMap(Color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    expect(pixelmap != undefined).assertTrue();
                    console.info('TC_001-2 success');
                    done();
                })
                .catch(error => {
                    console.log('TC_001-2 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

        /**
         * @tc.number    : TC_001-3
         * @tc.name      : createpixelmap-callback (editable: false, pixelFormat: RGB_565, size: { height: 6, width: 8 },bytes = buffer)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixelFormat,size
         *                 3.using colorand opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_001-3', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: false, pixelFormat: 2, size: { height: 6, width: 8 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('TC_001-3 success');
                done();

            })
        })

        /**
         * @tc.number    : TC_001-4
         * @tc.name      : createpixelmap-promise(editable: true, pixelFormat: unkonwn, size: { height: 6, width: 8 })
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixelFormat,size
         *                 3.using colorand opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_001-4', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 0, size: { height: 6, width: 8 } }
            image.createPixelMap(Color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    expect(pixelmap != undefined).assertTrue();
                    console.info('TC_001-4 success');
                    done();
                })
                .catch(error => {
                    console.log('TC_001-4 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

        /**
         * @tc.number    : TC_001-5
         * @tc.name      : create pixelmap-callback(editable: false, pixelFormat: unkonwn, size: { height: 6, width: 8 })
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixelFormat,size
         *                 3.using colorand opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_001-5', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: false, pixelFormat: 0, size: { height: 6, width: 8 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('TC_001-5 success');
                done();
            })
        })

        /**
         * @tc.number    : TC_001-6
         * @tc.name      : create pixelmap-callback(editable: true, pixelFormat: RGBA_8888, size: { height: 6, width: 8 } bytes > buffer )
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_001-6', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 6, width: 8 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('TC_001-6 success');
                done();
            })
        })

        /**
         * @tc.number    : TC_001-7
         * @tc.name      : create pixelmap-callback(editable: true, pixelFormat: RGB_565, size: { height: 2, width: 3 }, bytes < buffer)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_001-7', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 2, size: { height: 2, width: 3 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('TC_001-7 success');
                done();
            })
        })

        /**
         * @tc.number    : TC_001-8
         * @tc.name      : create pixelmap-callback(editable: true, pixelFormat: unkonwn, size: { height: -1, width: -1 })
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_001-8', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 0, size: { height: -1, width: -1 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                expect(pixelmap == undefined).assertTrue();
                console.info('TC_001-8 success');
                done();
            })
        })

        /**
         * @tc.number    : TC_001-9
         * @tc.name      : create pixelmap-callback(editable: true, pixelFormat: unsupported format, size: { height: 6, width: 8 })
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size(Unsupported formats are converted to RGBA_8888)
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_001-9', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 21, size: { height: 6, width: 8 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('TC_001-9 success');
                done();
            })
        })

        /**
         * @tc.number    : TC_020
         * @tc.name      : readPixelsToBuffer-promise
         * @tc.desc      : read all pixels to an buffer
         *                 1.create PixelMap,buffer
         *                 2.call readPixelsToBuffer
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_020', 0, async function (done) {
            console.info('TC_020 in');
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
                        console.info('TC_020 createPixelMap failed');
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
                                console.info('TC_020 failed');
                                expect(false).assertTrue();
                                done();
                                break;
                            }
                        }
                        if (res) {
                            console.info('TC_020 success');
                            expect(true).assertTrue()
                            done();
                        }
                    }).catch(error => {
                        console.log('TC_020 read error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }).catch(error => {
                    console.log('TC_020 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

        /**
         * @tc.number    : TC_020-1
         * @tc.name      : readPixelsToBuffer-callback
         * @tc.desc      : read all pixels to an buffer
         *                 1.create PixelMap,buffer
         *                 2.call readPixelsToBuffer
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_020-1', 0, async function (done) {
            console.info('TC_020-1 in');
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }

            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('TC_020-1 createPixelMap failed');
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
                                console.info('TC_020-1 failed');
                                expect(false).assertTrue();
                                done();
                                break;
                            }
                        }
                        if (res) {
                            console.info('TC_020-1 success');
                            expect(true).assertTrue()
                            done();
                        }
                    })
                }
            })
        })

        /**
         * @tc.number    : TC_020-2
         * @tc.name      : readPixelsToBuffer-callback(buffer:0)
         * @tc.desc      : read all pixels to an buffer
         *                 1.create PixelMap,buffer
         *                 2.call readPixelsToBuffer
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_020-2', 0, async function (done) {
            console.info('TC_020-2 in');
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }

            let opts = { editable: true, pixelFormat: 2, size: { height: 6, width: 8 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('TC_020-2 createPixelMap failed');
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
                                console.info('TC_020-2 failed');
                                expect(false).assertTrue();
                                done();
                                break;
                            }
                        }
                        if (res) {
                            console.info('TC_020-2 success');
                            expect(true).assertTrue()
                            done();
                        }
                    })
                }
            })
        })

        /**
         * @tc.number    : TC_021
         * @tc.name      : readPixels-promise
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.promise return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_021', 0, async function (done) {
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
                        console.info('TC_021 createPixelMap failed');
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
                                console.info('TC_021 failed');
                                expect(false).assertTrue();
                                done();
                                break;
                            }
                        }
                        if (res) {
                            console.info('TC_021 success');
                            expect(true).assertTrue()
                            done();
                        }
                    })
                })
                .catch(error => {
                    console.log('TC_021 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

        /**
         * @tc.number    : TC_021-1
         * @tc.name      : readPixels-callback
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.promise return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_021-1', 0, async function (done) {
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('TC_020-1 createPixelMap failed');
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
                            console.info('TC_021-1 buffer ' + bufferArr[i]);
                            if (bufferArr[i] != tcBuf021_1[i]) {
                                res = false;
                                console.info('TC_021-1 failed');
                                expect(false).assertTrue();
                                done();
                                break;
                            }
                        }
                        if (res) {
                            console.info('TC_021-1 success');
                            expect(true).assertTrue()
                            done();
                        }
                    })
                }
            })
        })

        /**
         * @tc.number    : TC_021-2
         * @tc.name      : readPixels-callback( region: { size: { height: 1, width: 2 }, x: -1, y: -1 })
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.promise return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_021-2', 0, async function (done) {
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
                    console.info('TC_021-2 create pixelmap fail');
                    done();
                } else {
                    const area = {
                        pixels: new ArrayBuffer(20),
                        offset: 0,
                        stride: 8,
                        region: { size: { height: 1, width: 2 }, x: -1, y: -1 }
                    }
                    pixelmap.readPixels(area).then(() => {
                        console.info('TC_021-2 failed');
                        expect(false).assertTrue();
                        done();
                    }).catch(() => {
                        expect(true).assertTrue();
                        console.info('TC_021-2 success');
                        done();
                    })
                }
            })
        })

        /**
         * @tc.number    : TC_021-3
         * @tc.name      : readPixels-promise(buffer:0)
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.promise return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_021-3', 0, async function (done) {
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
                    console.info('TC_021-3 create pixelmap failed');
                    done();
                } else {
                    const area = {
                        pixels: new ArrayBuffer(0),
                        offset: 0,
                        stride: 8,
                        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                    }
                    pixelmap.readPixels(area).then(() => {
                        console.info('TC_021-3 failed');
                        expect(false).assertTrue();
                        done();
                    }).catch(() => {
                        expect(true).assertTrue();
                        console.info('TC_021-3 success');
                        done();
                    })
                }
            })
        })

        /**
         * @tc.number    : TC_021-4
         * @tc.name      : readPixels-promise(offset > buffer)
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.promise return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_021-4', 0, async function (done) {
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
                    console.info('TC_021-4 createPixelMap success');
                    done();
                }
                const area = {
                    pixels: new ArrayBuffer(20),
                    offset: 21,
                    stride: 8,
                    region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                }
                pixelmap.readPixels(area).then(() => {
                    console.info('TC_021-4 failed');
                    expect(false).assertTrue();
                    done();
                }).catch(() => {
                    expect(true).assertTrue();
                    console.info('TC_021-4 success');
                    done();
                })
            })
        })

        /**
         * @tc.number    : TC_021-5
         * @tc.name      : readPixels-promise(region: { size: { height: -1, width:-1}, x: 0, y: 0 })
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.promise return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_021-5', 0, async function (done) {
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
                    console.info('TC_021-5 createPixelMap success');
                    done();
                }
                const area = {
                    pixels: new ArrayBuffer(20),
                    offset: 0,
                    stride: 8,
                    region: { size: { height: -1, width: -1 }, x: 0, y: 0 }
                }
                pixelmap.readPixels(area).then(() => {
                    console.info('TC_021-5 failed');
                    expect(false).assertTrue();
                    done();
                }).catch(() => {
                    expect(true).assertTrue();
                    console.info('TC_021-5 success');
                    done();
                })
            })
        })

        /**
         * @tc.number    : TC_022
         * @tc.name      : writePixels-promise
         * @tc.desc      : 1.create PixelMap
         *                 2.call writePixels
         *                 3.call return undefined
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_022', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('TC_022 createPixelMap failed');
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
                                    console.info('TC_022 failed');
                                    expect(false).assertTrue();
                                    done();
                                    break;
                                }
                            }
                            if (res) {
                                console.info('TC_022 success');
                                expect(true).assertTrue()
                                done();
                            }
                        })
                    })
                })
                .catch(error => {
                    console.log('TC_022 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

        /**
        * @tc.number    : TC_022-1
        * @tc.name      : writePixels-callback
        * @tc.desc      : 1.create PixelMap
        *                 2.call writePixels
        *                 3.call return undefined
        *                 4.callbackcall return undefined
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 1
       */
        it('TC_022-1', 0, async function (done) {
            try {
                const color = new ArrayBuffer(96);
                let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
                image.createPixelMap(color, opts, (err, pixelmap) => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('TC_022-1 createPixelMap failed');
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
                                    console.info('TC_022-1 failed');
                                    expect(false).assertTrue();
                                    done();
                                    break;
                                }
                            }
                            if (res) {
                                console.info('TC_022-1 success');
                                expect(true).assertTrue()
                                done();
                            }
                        })
                    })
                })
            } catch (error) {
                console.info('TC_022-1 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_023
         * @tc.name      : writeBufferToPixels-promise
         * @tc.desc      : 1.create PixelMap,buffer
         *                 2.call writeBufferToPixels
         *                 3.call return undefined
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_023', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('TC_023 createPixelMap failed');
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
                                    console.info('TC_023 failed');
                                    expect(false).assertTrue()
                                    done();
                                    break;
                                }
                            }
                            if (res) {
                                console.info('TC_023 success');
                                expect(true).assertTrue();
                                done();
                            }
                        })
                    })
                })
                .catch(error => {
                    console.log('TC_023 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

        /**
         * @tc.number    : TC_023-1
         * @tc.name      : writeBufferToPixels-callback
         * @tc.desc      : 1.create PixelMap,buffer
         *                 2.call writeBufferToPixels
         *                 3.call return undefined
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_023-1', 0, async function (done) {
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
                    console.info('TC_023-1 failed');
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
                                    console.info('TC_023-1 Success');
                                    expect(true).assertTrue()
                                    done();
                                    break;
                                }
                            }
                        }
                        if (res) {
                            console.info('TC_023-1 no change after writeBuffer');
                            expect(false).assertTrue();
                            done();
                        }
                    })
                })
            })
        })

        /**
         * @tc.number    : TC_024
         * @tc.name      : getImageInfo-pixelmap-promise
         * @tc.desc      : 1.create PixelMap,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_024', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 2, size: { height: 6, width: 8 } }
            image.createPixelMap(color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('TC_024 createPixelMap failed');
                        expect(false).assertTrue()
                        done();
                    }
                    pixelmap.getImageInfo().then(imageInfo => {
                        if (imageInfo == undefined) {
                            console.info('TC_024 imageInfo is empty');
                            expect(false).assertTrue()
                            done();
                        }
                        if (imageInfo.size.height == 4 && imageInfo.size.width == 6) {
                            console.info('TC_024 success ');
                            expect(true).assertTrue()
                            done();
                        }
                        done();
                    }).catch(error => {
                        console.log('TC_024 getimageinfo error: ' + error);
                        expect().assertFail();
                        done();
                    })
                    done();
                })
                .catch(error => {
                    console.log('TC_024 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

        /**
         * @tc.number    : TC_024-1
         * @tc.name      : getImageInfo-pixelmap-callback
         * @tc.desc      : 1.create PixelMap,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_024-1', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                if (pixelmap == undefined) {
                    globalpixelmap = pixelmap;
                    expect(false).assertTrue()
                    console.info('TC_024-1 create pixelmap fail');
                    done();
                }
                pixelmap.getImageInfo((err, imageInfo) => {
                    if (imageInfo == undefined) {
                        console.info('TC_024-1 imageInfo is empty');
                        expect(false).assertTrue()
                        done();
                    }
                    if (imageInfo.size.height == 4 && imageInfo.size.width == 6) {
                        console.info('TC_024-1 imageInfo success');
                        expect(true).assertTrue()
                        done();
                    }
                    done();
                })
            })
        })

        /**
         * @tc.number    : TC_025-1
         * @tc.name      : getBytesNumberPerRow
         * @tc.desc      : 1.create PixelMap
         *                 2.set PixelMap
         *                 3.call getBytesNumberPerRow
         *                 4. call return number
         *                 5.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_025-1', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            const expectNum = 4 * opts.size.width;
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue()
                    console.info('TC_25-1 create pixelmap fail');
                    done();
                } else {
                    const num = pixelmap.getBytesNumberPerRow();
                    console.info('TC_025-1 num is ' + num);
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
         * @tc.number    : TC_026-1
         * @tc.name      : getPixelBytesNumber
         * @tc.desc      : 1.create PixelMap
         *                 2.set Pixel
         *                 3.call getPixelBytesNumber
         *                 4. call return number
         *                 5.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_026-1', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            const expectNum = 4 * opts.size.width * opts.size.height;
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue()
                    console.info('TC_026-1 create pixelmap fail');
                    done();
                } else {
                    const num = pixelmap.getPixelBytesNumber();
                    console.info('TC_026-1 num is ' + num);
                    expect(num == expectNum).assertTrue();
                    if (num == expectNum) {
                        console.info('TC_026-1 success');
                    } else {
                        console.info('TC_026-1 fail');
                    }
                    done();
                }
            })
        })

        /**
         * @tc.number    : TC_027
         * @tc.name      : release-pixelmap-promise
         * @tc.desc      : 1.create PixelMap
         *                 2.set Pixel
         *                 3.call release
         *                 4.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_027', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts).then(pixelmap => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('TC_027 createPixelMap failed');
                    expect(false).assertTrue()
                    done();
                }
                pixelmap.release().then(() => {
                    console.info('TC_027 success');
                    expect(true).assertTrue();
                    done();
                }).catch(error => {
                    console.log('TC_027 error: ' + error);
                    expect().assertFail();
                    done();
                })
            }).catch(error => {
                console.log('TC_027 createPixelMap failed error: ' + error);
                expect().assertFail();
                done();
            })
        })

        /**
         * @tc.number    : TC_027-1
         * @tc.name      : release-pixelmap-callback
         * @tc.desc      : 1.create PixelMap
         *                 2.set Pixel
         *                 3.call release
         *                 4.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_027-1', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('TC_027-1 createPixelMap failed');
                    expect(false).assertTrue()
                    done();
                }
                pixelmap.release(() => {
                    expect(true).assertTrue();
                    console.log('TC_027-1 success');
                    done();
                })
            })
        })



        /**
         * @tc.number    : TC_041
         * @tc.name      : createImageSource(uri)-jpg
         * @tc.desc      : 1.set uri
         *                 2.call createImageSource(uri)
         *                 3.return imagesource
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_041', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                expect(imageSourceApi != undefined).assertTrue();
                console.info('TC_041 success');
                fileio.closeSync(fdNumber);
                done();
            } catch (error) {
                console.info('TC_041 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_041-1
         * @tc.name      : createImageSource(uri)-bmp
         * @tc.desc      : 1.seturi
         *                 2.call createImageSource(uri)
         *                 3.return imagesource
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_041-1', 0, async function (done) {
            try {
                await getFd('test.bmp');
                const imageSourceApi = image.createImageSource(fdNumber);
                expect(imageSourceApi != undefined).assertTrue();
                console.info('TC_041-1 success');
                done();
            } catch (error) {
                console.info('TC_041-1 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_041-2
         * @tc.name      : createImageSource(uri)-gif
         * @tc.desc      : 1.seturi
         *                 2.call createImageSource(uri)
         *                 3.return imagesource
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_041-2', 0, async function (done) {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                expect(imageSourceApi != undefined).assertTrue();
                console.info('TC_041-2 success');
                done();
            } catch (error) {
                console.info('TC_041-2 error: ' + error);
                expect(false).assertTrue();
                done();
            }

        })

        /**
         * @tc.number    : TC_041-3
         * @tc.name      : createImageSource(uri)-png
         * @tc.desc      : 1.seturi
         *                 2.call createImageSource(uri)
         *                 3.return imagesource
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_041-3', 0, async function (done) {
            try {
                await getFd('test.png');
                const imageSourceApi = image.createImageSource(fdNumber);
                expect(imageSourceApi != undefined).assertTrue();
                console.info('TC_041-3 success');
                done();
            } catch (error) {
                console.info('TC_041-3 error: ' + error);
                expect(false).assertTrue();
                done();
            }

        })

        /**
         * @tc.number    : TC_041-4
         * @tc.name      : createImageSource(uri)-wrong suffix file 
         * @tc.desc      : 1.call createImageSource(uri)
         *                 2.Incoming wrong suffix file 
         *                 3.imagesource null
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_041-4', 0, async function (done) {
            const imageSourceApi = image.createImageSource('file:///data/local/tmp/test.123');
            expect(imageSourceApi == undefined).assertTrue();
            console.info('TC_041-4 success');
            done();
        })

        /**
         * @tc.number    : TC_041-5
         * @tc.name      : createImageSource(uri)-wrong uri
         * @tc.desc      : 1.call createImageSource(uri)
         *                 2.set wrong uri
         *                 3.return null
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_041-5', 0, async function (done) {
            try {
                const imageSourceApi = image.createImageSource('file:///multimedia/test.jpg');
                expect(imageSourceApi == undefined).assertTrue();
                console.info('TC_041-5 success');
                done();
            } catch (error) {
                console.info('TC_041-5 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_042
         * @tc.name      : createImageSource(fd)
         * @tc.desc      : 1.call createImageSource
         *                 2.set fd
         *                 3.return imagesource
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_042', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_042 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo((err, imageInfo) => {
                        if (err) {
                            expect(false).assertTrue();
                            console.info('TC_042 err: ' + err);
                            done();
                            return
                        }
                        if (imageInfo != undefined) {
                            expect(true).assertTrue();
                            fileio.closeSync(fdNumber);
                            done();
                        } else {
                            console.info('TC_042 failed');
                            expect(false).assertTrue();
                            done();
                        }

                    })
                }
            } catch (error) {
                console.info('TC_042 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_042-1
         * @tc.name      : createImageSource(fd) fd<0
         * @tc.desc      : 1.call createImageSource
         *                 2.set wrong fd
         *                 3.return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_042-1', 0, async function (done) {
            const imageSourceApi = image.createImageSource(-2);
            expect(imageSourceApi == undefined).assertTrue();
            console.info('TC_042-1 success');
            done();
        })

        /**
         * @tc.number    : TC_043
         * @tc.name      : createImageSource(data)
         * @tc.desc      : 1.setdata
         *                 2.createImageSource
         *                 3.return imagesource
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_043', 0, async function (done) {
            const data = testJpg.buffer;
            const imageSourceApi = image.createImageSource(data);
            if (imageSourceApi == undefined) {
                console.info('TC_043 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo((err, imageInfo) => {
                    console.info('TC_043 imageInfo');
                    expect(imageInfo != undefined).assertTrue();
                    done();
                })
            }
        })

        /**
         * @tc.number    : TC_043-1
         * @tc.name      : createImageSource(data) buffer:0
         * @tc.desc      : 1.setdata
         *                 2.createImageSource
         *                 3.return imagesource
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_043-1', 0, async function (done) {
            const data = new ArrayBuffer(0);
            const imageSourceApi = image.createImageSource(data);
            expect(imageSourceApi == undefined).assertTrue();
            console.info('TC_043-1 success');
            done();
        })

        /**
         * @tc.number    : TC_044
         * @tc.name      : release-imagesource-promise-jpg
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.return undefined
         * @tc.size      : MEDIUM  
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_044', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_044 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.release().then(() => {
                        console.info('TC_044 success');
                        expect(true).assertTrue();
                        done();
                    }).catch(error => {
                        console.info('TC_044 error');
                        expect(false).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_044 err:' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_044-1
         * @tc.name      : release-imagesource-callback-jpg
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_044-1', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_044-1 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.release(() => {
                        console.info('TC_044-1 Success');
                        expect(true).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_044-1 err:' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_045
         * @tc.name      : getImageInfo(callback: AsyncCallback<ImageInfo>)-jpg
         * @tc.desc      : 1.create imageSource
         *                 2.imageSourcecall getImageInfo(ImageInfo)
         *                 3.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */

        it('TC_045', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_045 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo((err, imageInfo) => {
                        if (err) {
                            expect(false).assertTrue();
                            console.info('TC_045 err:' + err);
                            done();
                            return
                        }
                        if (imageInfo != undefined) {
                            console.info('TC_045 imageInfo.size.height:' + imageInfo.size.height);
                            console.info('TC_045 imageInfo.size.width:' + imageInfo.size.width);
                            expect(true).assertTrue();
                            fileio.closeSync(fdNumber);
                            done();
                        } else {
                            console.info('TC_045 failed');
                            expect(false).assertTrue();
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('TC_045 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })


        /**
         * @tc.number    : TC_045-1
         * @tc.name      : getImageInfo(callback: AsyncCallback<ImageInfo>)-bmp
         * @tc.desc      : 1.create imageSource
         *                 2.imageSourcecall getImageInfo(ImageInfo)
         *                 3.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_045-1', 0, async function (done) {
            try {
                await getFd('test.bmp');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_045-1 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo((err, imageInfo) => {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('TC_045-1 imageInfo.size.height:' + imageInfo.size.height);
                        console.info('TC_045-1 imageInfo.size.width:' + imageInfo.size.width);
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_045-1 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_045-2
         * @tc.name      : getImageInfo(callback: AsyncCallback<ImageInfo>)-png
         * @tc.desc      : 1.create imageSource
         *                 2.imageSourcecall getImageInfo(ImageInfo)
         *                 3.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_045-2', 0, async function (done) {
            try {
                await getFd('test.png');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_045-2 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo((err, imageInfo) => {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('TC_045-2 imageInfo.size.height:' + imageInfo.size.height);
                        console.info('TC_045-2 imageInfo.size.width:' + imageInfo.size.width);
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_045-2 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_045-3
         * @tc.name      : getImageInfo(callback: AsyncCallback<ImageInfo>)-gif
         * @tc.desc      : 1.create ImageInfo
         *                 2.call getImageInfo(index, ImageInfo)
         *                 3.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_045-3', 0, async function (done) {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_045-3 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo((err, imageInfo) => {
                        if (err) {
                            expect(false).assertTrue();
                            console.info('TC_045-3 error' + err);
                            done();
                            return
                        }
                        if (imageInfo != undefined && imageInfo != null) {
                            expect(true).assertTrue();
                            console.info('TC_045-3 imageInfo.size.height:' + imageInfo.size.height);
                            console.info('TC_045-3 imageInfo.size.width:' + imageInfo.size.width);
                            console.info('TC_045-3 success')
                            done();
                        } else {
                            expect(false).assertTrue();
                            console.info('TC_045-3 failed')
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('TC_045-3 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_046
         * @tc.name      : getImageInfo(index: number, callback: AsyncCallback<ImageInfo>)-jpg
         * @tc.desc      : 1.create ImageInfo
         *                 2.call getImageInfo(index, ImageInfo)
         *                 3.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_046', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_046 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(0, (err, imageInfo) => {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('TC_046 imageInfo.size.height:' + imageInfo.size.height);
                        console.info('TC_046 imageInfo.size.width:' + imageInfo.size.width);
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_046 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_046-1
         * @tc.name      : getImageInfo(index: number, callback: AsyncCallback<ImageInfo>)-bmp
         * @tc.desc      : 1.create ImageInfo
         *                 2.call getImageInfo(index, ImageInfo)
         *                 3.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_046-1', 0, async function (done) {
            try {
                await getFd('test.bmp');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_046-1 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(0, (err, imageInfo) => {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('TC_046-1 imageInfo.size.height:' + imageInfo.size.height);
                        console.info('TC_046-1 imageInfo.size.width:' + imageInfo.size.width);
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_046-1 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number: TC_046-2
         * @tc.name  : getImageInfo(index: number, callback: AsyncCallback<ImageInfo>)-png
         * @tc.desc  : 1.create ImageInfo
         *             2.call getImageInfo(index, ImageInfo)
         *             3.callback return undefined
         * @tc.size  : MEDIUM MEDIUM
         * @tc.type  : Functional
         * @tc.level : Level 1
         */
        it('TC_046-2', 0, async function (done) {
            try {
                await getFd('test.png');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_046-2 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(0, (err, imageInfo) => {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('TC_046-2 imageInfo.size.height:' + imageInfo.size.height);
                        console.info('TC_046-2 imageInfo.size.width:' + imageInfo.size.width);
                        done();
                    })
                }
            } catch {
                console.info('TC_046-2 error: ' + error);
                expect(false).assertTrue();
                done();
            }

        })

        /**
         * @tc.number: TC_046-3
         * @tc.name  : getImageInfo(index: number, callback: AsyncCallback<ImageInfo>)-gif
         * @tc.desc  : 1.create ImageInfo
         *             2.call getImageInfo(index, ImageInfo)
         *             3.callback return undefined
         * @tc.size  : MEDIUM MEDIUM
         * @tc.type  : Functional
         * @tc.level : Level 1
         */
        it('TC_046-3', 0, async function (done) {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_046-3 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(0, (err, imageInfo) => {
                        if (err) {
                            expect(false).assertTrue();
                            console.info('TC_046-3 error' + err);
                            done();
                            return
                        }
                        if (imageInfo != undefined && imageInfo != null) {
                            expect(true).assertTrue();
                            console.info('TC_046-3 imageInfo.size.height:' + imageInfo.size.height);
                            console.info('TC_046-3 imageInfo.size.width:' + imageInfo.size.width);
                            console.info('TC_046-3 success')
                            done();
                        } else {
                            expect(false).assertTrue();
                            console.info('TC_046-3 failed')
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('TC_046-3 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number: TC_046-4
         * @tc.name  : getImageInfo(index: number, callback: AsyncCallback<ImageInfo>)-gif(frame:1)-index:1
         * @tc.desc  : 1.create ImageInfo
         *             2.call getImageInfo(index, ImageInfo)
         *             3.callback return undefined
         * @tc.size  : MEDIUM
         * @tc.type  : Functional
         * @tc.level : Level 1
         */
        it('TC_046-4', 0, async function (done) {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_046-4 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(1, (err, imageInfo) => {
                        if (imageInfo == undefined) {
                            expect(true).assertTrue();
                            done();
                        } else {
                            expect(false).assertTrue();
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('TC_046-4 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number: TC_046-5
         * @tc.name  : getImageInfo(index: number, callback: AsyncCallback<ImageInfo>)-gif-index:-1
         * @tc.desc  : 1.create ImageInfo
         *             2.call getImageInfo(index, ImageInfo)
         *             3.callback return undefined
         * @tc.size  : MEDIUM 
         * @tc.type  : Functional
         * @tc.level : Level 1
         */
        it('TC_046-5', 0, async function (done) {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_046-5 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(-1, (err, imageInfo) => {
                        expect(imageInfo == undefined).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_046-5 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_047
         * @tc.name      : getImageInfo(index?: number): Promise<ImageInfo>-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageInfo(index)
         *                 3.callbackcall ,return imageinfo
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_047', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_047 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(0)
                        .then(imageInfo => {
                            expect(imageInfo != undefined).assertTrue();
                            console.info('TC_047 imageInfo');
                            console.info('imageInfo.size.height:' + imageInfo.size.height);
                            console.info('imageInfo.size.width:' + imageInfo.size.width);
                            done();
                        }).catch(error => {
                            console.log('TC_047 error: ' + error);
                            expect().assertFail();
                            done();
                        })
                }
            } catch (error) {
                console.info('TC_047 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_047-1
         * @tc.name      : getImageInfo(index?: number): Promise<ImageInfo>-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageInfo(index)
         *                 3.callbackcall ,return imageinfo
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_047-1', 0, async function (done) {
            try {
                await getFd('test.bmp');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_047-1 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(0)
                        .then(imageInfo => {
                            expect(imageInfo != undefined).assertTrue();
                            console.info('TC_047-1 imageInfo');
                            console.info('imageInfo.size.height:' + imageInfo.size.height);
                            console.info('imageInfo.size.width:' + imageInfo.size.width);
                            done();
                        }).catch(error => {
                            console.log('TC_047-1 error: ' + error);
                            expect().assertFail();
                            done();
                        })
                }
            } catch (error) {
                console.info('TC_047-1 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_047-2
         * @tc.name      : getImageInfo(index?: number): Promise<ImageInfo>-png
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageInfo(index)
         *                 3.callbackcall ,return imageinfo
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_047-2', 0, async function (done) {
            try {
                await getFd('test.png');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_047-2 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(0)
                        .then(imageInfo => {
                            expect(imageInfo != undefined).assertTrue();
                            console.info('TC_047-2 imageInfo');
                            console.info('imageInfo.size.height:' + imageInfo.size.height);
                            console.info('imageInfo.size.width:' + imageInfo.size.width);
                            done();
                        }).catch(error => {
                            console.log('TC_047-2 error: ' + error);
                            expect().assertFail();
                            done();
                        })
                }
            } catch (error) {
                console.info('TC_047-2 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_047-3
         * @tc.name      : getImageInfo(index?: number): Promise<ImageInfo>-gif
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageInfo(index)
         *                 3.callbackcall ,return imageinfo
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_047-3', 0, async function (done) {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_047-3 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(0)
                        .then(imageInfo => {
                            if (imageInfo != undefined && imageInfo != null) {
                                expect(true).assertTrue();
                                console.info('TC_047-3 imageInfo.size.height:' + imageInfo.size.height);
                                console.info('TC_047-3 imageInfo.size.width:' + imageInfo.size.width);
                                done();
                            } else {
                                expect(false).assertTrue();
                                console.info('TC_047-3 failed');
                                done();
                            }
                        }).catch(error => {
                            console.log('TC_047-3 error: ' + error);
                            expect().assertFail();
                            done();
                        })
                }
            } catch (error) {
                console.info('TC_047-3 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number: TC_047-4
         * @tc.name  : getImageInfo(index?: number): Promise<ImageInfo>-gif(frame:1)-index:1
         * @tc.desc  : 1.create imagesource
         *             2.call getImageInfo(index=1)
         *             3.callback return imageinfo undefined
         * @tc.size  : MEDIUM 
         * @tc.type  : Functional
         * @tc.level : Level 1
         */
        it('TC_047-4', 0, async function (done) {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_047-4 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(1)
                        .then(() => {
                            console.log('TC_047-4 failed');
                            expect().assertFail();
                            done();
                        }).catch(error => {
                            console.log('TC_047-4 success');
                            expect(true).assertTrue();
                            done();
                        })
                }
            } catch (error) {
                console.info('TC_047-4 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_047-5
         * @tc.name      : getImageInfo(index?: number): Promise<ImageInfo>-gif-index:-1
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageInfo(index=-1)
         *                 3.callback return imageinfo undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_047-5', 0, async function (done) {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_047-5 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(-1)
                        .then(() => {
                            console.log('TC_047-5 failed');
                            expect().assertFail();
                            done();
                        }).catch(error => {
                            console.log('TC_047-5 success');
                            expect(true).assertTrue();
                            done();
                        })
                }
            } catch (error) {
                console.info('TC_047-5 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_050-14
         * @tc.name      : createPixelMap-promise-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_050-14', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_050-14 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap().then(pixelmap => {
                        globalpixelmap = pixelmap;
                        console.info('TC_050-14 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }).catch(error => {
                        console.log('TC_050-14 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_050-14 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_050-15
         * @tc.name      : createPixelMap-callback-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_050-15', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_050-15 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap((err, pixelmap) => {
                        globalpixelmap = pixelmap;
                        console.info('TC_050-15 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_050-15 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_053
         * @tc.name      : createIncrementalSource-updateData-png
         * @tc.desc      : 1.create imagesource
         *                 2.update data
         *                 3.create pixelmap
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_053', 0, async function (done) {
            try {
                let testimagebuffer = testPng;
                console.info('TC_053 0003 ' + testimagebuffer.length);
                let bufferSize = testimagebuffer.length;
                let offset = 0;
                const incSouce = image.createIncrementalSource(new ArrayBuffer(1));
                let ret;
                let isFinished = false;
                while (offset < testimagebuffer.length) {
                    console.info('TC_053 0006 ' + testimagebuffer.length);
                    var oneStep = testimagebuffer.slice(offset, offset + bufferSize);
                    console.info('TC_053 0007 ' + oneStep.length);
                    if (oneStep.length < bufferSize) {
                        isFinished = true;
                    }
                    ret = await incSouce.updateData(oneStep, isFinished, 0, oneStep.length);
                    if (!ret) {
                        console.info('TC_053 updateData failed');
                        expect(ret).assertTrue();
                        break;
                    }
                    offset = offset + oneStep.length;
                    console.info('TC_053 0011 ' + offset);
                }
                if (ret) {
                    console.info('TC_053 updateData success ');
                    let decodingOptions = {
                        sampleSize: 1
                    };
                    incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
                        console.info('TC_053 0014' + pixelmap);
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    })
                } else {
                    done();
                }
            } catch (error) {
                console.info('TC_053 updateData failed ' + error);
            }
        })

        /**
         * @tc.number    : TC_053-1
         * @tc.name      : createIncrementalSource-updateData-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.update data
         *                 3.create pixelmap
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_053-1', 0, async function (done) {
            try {
                let testimagebuffer = testJpg;
                console.info('TC_053-1 0003 ' + testimagebuffer.length);
                let bufferSize = testimagebuffer.length;
                let offset = 0;
                const incSouce = image.createIncrementalSource(new ArrayBuffer(1));
                let isFinished = false;
                let ret;
                while (offset < testimagebuffer.length) {
                    console.info('TC_053-1 0006 ' + testimagebuffer.length);
                    var oneStep = testimagebuffer.slice(offset, offset + bufferSize);
                    console.info('TC_053-1 0007 ' + oneStep.length);
                    if (oneStep.length < bufferSize) {
                        isFinished = true;
                    }
                    ret = await incSouce.updateData(oneStep, isFinished, 0, oneStep.length);
                    if (!ret) {
                        console.info('TC_053-1 updateData failed');
                        expect(ret).assertTrue();
                        break;
                    }
                    offset = offset + oneStep.length;
                    console.info('TC_053-1 0011 ' + offset);
                }
                if (ret) {
                    console.info('TC_053-1 updateData success ');
                    let decodingOptions = {
                        sampleSize: 1
                    };
                    incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    })
                } else {
                    done();
                }
            } catch (error) {
                console.info('TC_053-1 updateData failed ' + error);
            }
        })

        /**
         * @tc.number    : TC_064
         * @tc.name      : release ImageSource - promise - png  
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_064', 0, async function (done) {
            try {
                await getFd('test.png');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_064 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.release().then(() => {
                        console.info('TC_064 success');
                        expect(true).assertTrue();
                        done();
                    }).catch(error => {
                        console.log('TC_064 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_064 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_064-1
         * @tc.name      : release ImageSource - callback - png 
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_064-1', 0, async function (done) {
            try {
                await getFd('test.png');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_064-1 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.release(async (err) => {
                        if (err) {
                            console.info('TC_064-1 err:' + err);
                            expect(false).assertTrue();
                            done();
                            return
                        }
                        console.info('TC_064-1 Success');
                        expect(true).assertTrue();
                        expect(true).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_064-1 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_065
         * @tc.name      : release ImageSource - promise - bmp 
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_065', 0, async function (done) {
            try {
                await getFd('test.bmp');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_065 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.release().then(() => {
                        console.info('TC_065 success');
                        expect(true).assertTrue();
                        done();
                    }).catch(error => {
                        console.log('TC_065 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_065 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_065-1
         * @tc.name      : release ImageSource - callback - bmp 
         * @tc.desc      : 1.create ImageSource
         *                 2.create SourceStream
         *                 3.return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_065-1', 0, async function (done) {
            try {
                await getFd('test.bmp');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_065-1 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.release(async () => {
                        console.info('TC_065-1 Success');
                        expect(true).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_065-1 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_066
         * @tc.name      : release ImageSource - promise - gif
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_066', 0, async function (done) {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_066 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.release().then(() => {
                        console.info('TC_066 success');
                        expect(true).assertTrue();
                        done();
                    }).catch(error => {
                        console.log('TC_066 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_066 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_066-1
         * @tc.name      : release ImageSource - callback - gif
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_066-1', 0, async function (done) {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_066-1 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.release(() => {
                        console.info('TC_066-1 Success');
                        expect(true).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_066-1 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_067-14
         * @tc.name      : createPixelMap-promise-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_067-14', 0, async function (done) {
            try {
                await getFd('moving_test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_067-14 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap().then(pixelmap => {
                        globalpixelmap = pixelmap;
                        console.info('TC_067-14 success ');
                        expect(pixelmap !== undefined).assertTrue();
                        done();
                    }).catch(error => {
                        console.log('TC_067-14 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_067-14 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_067-15
         * @tc.name      : createPixelMap-pcallback-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_067-15', 0, async function (done) {
            try {
                await getFd('moving_test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_067-15 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap((err, pixelmap) => {
                        globalpixelmap = pixelmap;
                        console.info('TC_067-15 success ');
                        expect(pixelmap !== undefined).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_067-15 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_068-14
         * @tc.name      : createPixelMap-promise-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_068-14', 0, async function (done) {
            try {
                await getFd('test.bmp');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_068-14 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap().then(pixelmap => {
                        globalpixelmap = pixelmap;
                        console.info('TC_068-14 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }).catch(error => {
                        console.log('TC_068-14 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_068-14 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_068-15
         * @tc.name      : createPixelMap-callback-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_068-15', 0, async function (done) {
            try {
                await getFd('test.bmp');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_068-15 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap((err, pixelmap) => {
                        globalpixelmap = pixelmap;
                        console.info('TC_068-15 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_068-15 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_163-14
         * @tc.name      : createPixelMap-promise-png
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_163-14', 0, async function (done) {
            try {
                await getFd('test.png');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_163-14 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap().then(pixelmap => {
                        globalpixelmap = pixelmap;
                        console.info('TC_163-14 success');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }).catch(error => {
                        console.log('TC_163-14 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_163-14 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_163-15
         * @tc.name      : createPixelMap-callback-png
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_163-15', 0, async function (done) {
            try {
                await getFd('test.png');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_163-15 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap((err, pixelmap) => {
                        globalpixelmap = pixelmap;
                        console.info('TC_163-15 success');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_163-15 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_164
         * @tc.name      : imagesource supportedFormats
         * @tc.desc      : 1.create imagesource
         *                 2.call supportedFormats
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_164', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_164 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    expect(imageSourceApi.supportedFormats != undefined).assertTrue();
                    console.info(imageSourceApi.supportedFormats);
                    console.info('TC_164 success ');
                    done();
                }
            } catch (error) {
                console.info('TC_164 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_166
         * @tc.name      : imagepacker supportedFormats
         * @tc.desc      : 1.create imagepacker
         *                 2.call supportedFormats
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('TC_166', 0, async function (done) {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
                console.info('TC_166 create image packer failed');
                expect(false).assertTrue();
                done();
            } else {
                expect(imagePackerApi.supportedFormats != undefined).assertTrue();
                console.info(imagePackerApi.supportedFormats);
                console.info('TC_166 success ');
                done();
            }
        })

        /**
         * @tc.number    : TC_168
         * @tc.name      : isEditable
         * @tc.desc      : 1.create pixelmap
         *                 2.call isEditable 
         *                 3.return true
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_168', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(Color, opts, (error, pixelmap) => {
                if (pixelmap == undefined) {
                    console.info('TC_168 create pixelmap failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    expect(pixelmap.isEditable == true).assertTrue();
                    console.info('TC_168 success ');
                    done();
                }
            })
        })

        /**
         * @tc.number    : editable_001
         * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: ARGB_8888,
         *                 size: { height: 4, width: 6 },bytes = buffer)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixelFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('editable_001', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let edit = true;
            let opts = { editable: true, pixelFormat: 1, size: { height: 4, width: 6 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                expect(pixelmap != undefined).assertTrue();
                console.info('editable_001 editable: ' + pixelmap.isEditable);
                expect(pixelmap.isEditable == opts.editable).assertTrue();
                console.info('editable_001 edit: ' + edit);
                expect(pixelmap.isEditable == edit).assertTrue();
                done();
            })
        })

        /**
         * @tc.number    : editable_002
         * @tc.name      : create pixelmap-callback (editable: false, pixelFormat: ARGB_8888,
         *                 size: { height: 4, width: 6 },bytes = buffer)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixelFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('editable_002', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let edit = false;
            let opts = { editable: false, pixelFormat: 1, size: { height: 4, width: 6 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                expect(pixelmap != undefined).assertTrue();
                console.info('editable_002 editable: ' + pixelmap.isEditable);
                expect(pixelmap.isEditable == opts.editable).assertTrue();
                console.info('editable_002 edit: ' + edit);
                expect(pixelmap.isEditable == edit).assertTrue();
                done();
            })
        })

        /**
         * @tc.number    : editable_003
         * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGB_565,
         *                 size: { height: 4, width: 6 }, bytes = buffer)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('editable_003', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let edit = true;
            let opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } }
            image.createPixelMap(Color, opts)
                .then(pixelmap => {
                    console.info('editable_003 editable: ' + pixelmap.isEditable);
                    expect(pixelmap != undefined).assertTrue();
                    expect(pixelmap.isEditable == opts.editable).assertTrue();
                    expect(pixelmap.isEditable == edit).assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('editable_003 err' + error);
                    expect(false).assertTrue();
                    done();
                })
        })

        /**
         * @tc.number    : editable_004
         * @tc.name      : create pixelmap-promise (editable: false, pixelFormat: RGB_565,
         *                 size: { height: 4, width: 6 }, bytes = buffer)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('editable_004', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let edit = false;
            let opts = { editable: false, pixelFormat: 2, size: { height: 4, width: 6 } }
            image.createPixelMap(Color, opts)
                .then(pixelmap => {
                    console.info('editable_004 editable: ' + pixelmap.isEditable);
                    expect(pixelmap != undefined).assertTrue();
                    expect(pixelmap.isEditable == opts.editable).assertTrue();
                    expect(pixelmap.isEditable == edit).assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('editable_004 err' + error);
                    expect(false).assertTrue();
                    done();
                })
        })
    })
}
