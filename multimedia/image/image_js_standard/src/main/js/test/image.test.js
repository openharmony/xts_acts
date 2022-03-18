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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import { testPng, testJpg } from './testImg'

describe('Image', function () {

    beforeAll(function () {
        console.info('beforeAll case');
    })

    beforeEach(function () {
        isTimeOut = false;
        console.info('beforeEach case');
    })

    afterEach(function () {
        console.info('afterEach case');
    })

    afterAll(function () {
        console.info('afterAll case');
    })

    /**
     * @tc.number    : TC_001
     * @tc.name      : create pixelmap object
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set color,colorlength,offset,width,height,pixeFormat,alphyType
     *                 3.using color,colorlength,offsetwidth and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_001', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 2, width: 3 } }
        image.createPixelMap(Color, opts)
            .then( pixelmap => {
                expect(pixelmap !== null).assertTrue();
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
     * @tc.name      : create pixelmap object
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set color,colorlength,offset,width,height,pixeFormat,alphyType
     *                 3.using color,colorlength, offset,width and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_001-1', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 2, width: 3 } }
        image.createPixelMap(Color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_001-1 success');
            done();
        })
        .catch(error => {
            console.log('TC_001-1 error: ' + error);
            expect().assertFail();
            done();
        })
    })
    
    /**
     * @tc.number    : TC_001-2
     * @tc.name      : create pixelmap object
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set color,colorlength,offset,width,height,pixeFormat,alphyType
     *                 3.usingcolor,colorlength, offset,width and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_001-2', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { alphaType: 1, editable: true, pixelFormat: 0, scaleMode: 2, size: { height: 2, width: 3 } }
        image.createPixelMap(Color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
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
     * @tc.name      : create pixelmap object
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set color,colorlength,offset,width,height,pixeFormat,alphyType
     *                 3.usingcolor,colorlength,offset,width and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_001-3', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { alphaType: 2, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 2, width: 3 } }
        image.createPixelMap(Color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_001-3 success');
            done();
        })
        .catch(error => {
            console.log('TC_001-3 error: ' + error);
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    : TC_001-4
     * @tc.name      : create pixelmap object
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set color,colorlength,offset,width,height,pixeFormat,alphyType
     *                 3.usingcolor,colorlength,offset,width and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_001-4', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { alphaType: 3, editable: false, pixelFormat: 2, scaleMode: 2, size: { height: 2, width: 3 } }
        image.createPixelMap(Color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
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
     * @tc.name      : create pixelmap object
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set color,colorlength,offset,width,height,pixeFormat,alphyType
     *                 3.usingcolor,colorlength,offset,width and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_001-5', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { alphaType: 3, editable: true, pixelFormat: 2, scaleMode: 1, size: { height: -1, width: -1 } }
        image.createPixelMap(Color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_001-5 success');
            done();
        }).catch(error => {
            console.log('TC_001-4 error: ' + error);
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    : TC_020
     * @tc.name      : read Pixels To Buffer
     * @tc.desc      : read all pixels to an buffer
     *                 1.create PixelMap,buffer
     *                 2.call readPixelsToBuffer
     *                 3.return null
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

        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts)
            .then( pixelmap => {
                console.info('TC_020 createPixelMap in');
                if (pixelmap == null) {
                    console.info('TC_020 createPixelMap failed');
                    expect(false).assertTrue()
                    done();
                }

                const readBuffer = new ArrayBuffer(96);
                pixelmap.readPixelsToBuffer(readBuffer).then(() => {
                    var bufferArr = new Uint8Array(readBuffer);
                    var res = true;
                    for (var i = 0; i < bufferArr.length; i++) {
                        if(res) {
                            if (bufferArr[i] !== 0) {
                                res = false;
                                console.info('TC_020 Success');
                                expect(true).assertTrue();
                                done();
                                break;
                            }
                        }
                    }
                    if (res) {
                        console.info('TC_020 buffer is all empty');
                        expect(false).assertTrue()
                        done();
                    }
                })
            })
            .catch(error => {
                console.log('TC_020 error: ' + error);
                expect().assertFail();
                done();
            })
    })
    
    /**
     * @tc.number    : TC_020-1
     * @tc.name      : read Pixels To Buffer
     * @tc.desc      : read all pixels to an buffer
     *                 1.create PixelMap,buffer
     *                 2.call readPixelsToBuffer
     *                 3.return null
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

        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts, (pixelmap) => {
                console.info('TC_020-1 createPixelMap in');
                expect(pixelmap !== null).assertTrue();
                console.info('TC_020-1 success');
                done();
        })
                const readBuffer = new ArrayBuffer(96);
                pixelmap.readPixelsToBuffer(readBuffer,() => {
                    var bufferArr = new Uint8Array(readBuffer);
                    var res = true;
                    for (var i = 0; i < bufferArr.length; i++) {
                        if(res) {
                            if (bufferArr[i] !== 0) {
                                res = false;
                                console.info('TC_020-1 Success');
                                expect(true).assertTrue();
                                done();
                                break;
                            }
                        }
                    }
                    if (res) {
                        console.info('TC_020-1 buffer is all empty');
                        expect(false).assertTrue()
                        done();
                    }
                })
            
            .catch(error => {
                console.log('TC_020-1 error: ' + error);
                expect().assertFail();
                done();
            })
    })

    /**
     * @tc.number    : TC_020-2
     * @tc.name      : read Pixels To Buffer
     * @tc.desc      : read all pixels to an buffer
     *                 1.create PixelMap,buffer
     *                 2.call readPixelsToBuffer
     *                 3.return null
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

        let opts = { alphaType: 0, editable: true, pixelFormat: 2, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts, (pixelmap) => {
            console.info('TC_020-2 createPixelMap in');
            expect(pixelmap !== null).assertTrue();
            console.info('TC_020-2 success');
            done();
        })
        const readBuffer = new ArrayBuffer(0);
        pixelmap.readPixelsToBuffer(readBuffer,() => {
            var bufferArr = new Uint8Array(readBuffer);
            var res = true;
            for (var i = 0; i < bufferArr.length; i++) {
                if(res) {
                    if (bufferArr[i] !== 0) {
                        res = false;
                        console.info('TC_020-2 Success');
                        expect(true).assertTrue();
                        done();
                        break;
                    }
                }
            }
            if (res) {
                console.info('TC_020-2 buffer is all empty');
                expect(false).assertTrue()
                done();
            }
        })
        .catch(error => {
            console.log('TC_020-2 error: ' + error);
            expect().assertFail();
            done();
        })
    })
    
    /**
     * @tc.number    : TC_021
     * @tc.name      : read Pixels
     * @tc.desc      : 1.create PixelMap
     *                 2.call readPixels
     *                 3.promise return array
     *                 4.callbackcall return null
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
        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts)
            .then( pixelmap => {
                if (pixelmap == null) {
                    console.info('TC_021 createPixelMap failed');
                    expect(false).assertTrue()
                    done();
                }

                const area = { pixels: new ArrayBuffer(20),
                    offset: 0,
                    stride: 8,
                    region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                }
                pixelmap.readPixels(area).then(() => {
                    var bufferArr = new Uint8Array(area.pixels);
                    var res = true;
                    for (var i = 0; i < bufferArr.length; i++) {
                        console.info('TC_021 buffer ' + bufferArr[i]);
                        if(res) {
                            if (bufferArr[i] == 0) {
                                res = false;
                                console.info('TC_021 Success');
                                expect(true).assertTrue();
                                done();
                                break;
                            }
                        }
                    }
                    if (res) {
                        console.info('TC_021 buffer is all empty');
                        expect(false).assertTrue()
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
     * @tc.name      : read Pixels
     * @tc.desc      : 1.create PixelMap
     *                 2.call readPixels
     *                 3.promise return array
     *                 4.callbackcall return null
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
        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_021-1 success');
            done();
        })
        const area = { pixels: new ArrayBuffer(20),
            offset: 0,
            stride: 8,
            region: { size: { height: 1, width: 2 }, x: 0, y: 0 }}
        pixelmap.readPixels(area,(data) => {
            if(data !== null) {
                var bufferArr = new Uint8Array(area.pixels);
                var res = true;
                for (var i = 0; i < bufferArr.length; i++) {
                    console.info('TC_021-1 buffer ' + bufferArr[i]);
                    if(res) {
                        if(bufferArr[i] == 0) {
                            res = false;
                            console.info('TC_021-1 Success');
                            expect(true).assertTrue();
                            done();
                            break;
                        }
                    }
                }
                if (res) {
                    console.info('TC_021-1 buffer is all empty');
                    expect(false).assertTrue()
                    done();
                }
            } else {
                console.info('TC_021-1 fail');
                expect(false).assertTrue()
                done();
            }
        })
        .catch(error => {
            console.log('TC_021-1 error: ' + error);
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    : TC_021-2
     * @tc.name      : read Pixels
     * @tc.desc      : 1.create PixelMap
     *                 2.call readPixels
     *                 3.promise return array
     *                 4.callbackcall return null
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
        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_021-2 success');
            done();
        })
        const area = { pixels: new ArrayBuffer(20),
            offset: 0,
            stride: 8,
            region: { size: { height: 1, width: 2 }, x: -1, y: 0 }}
        pixelmap.readPixels(area,(data) => {
            if(data !== null){
                var bufferArr = new Uint8Array(area.pixels);
                var res = true;
                for (var i = 0; i < bufferArr.length; i++) {
                    console.info('TC_021-2 buffer ' + bufferArr[i]);
                    if(res) {
                        if (bufferArr[i] == 0) {
                            res = false;
                            console.info('TC_021-2 Success');
                            expect(true).assertTrue();
                            done();
                            break;
                        }
                    }
                }
                if (res) {
                    console.info('TC_021-2 buffer is all empty');
                    expect(false).assertTrue()
                    done();
                }
            }
        })
        .catch(error => {
            console.log('TC_021-2 error: ' + error);
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    : TC_021-3
     * @tc.name      : read Pixels
     * @tc.desc      : 1.create PixelMap
     *                 2.call readPixels
     *                 3.promise return array
     *                 4.callbackcall return null
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
        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_021-3 success');
            done();
        })
        const area = { pixels: new ArrayBuffer(0),
            offset: 0,
            stride: 8,
            region: { size: { height: 1, width: 2 }, x: 0, y: 0 }}
        pixelmap.readPixels(area,(data) => {
            if(data !== null){
                var bufferArr = new Uint8Array(area.pixels);
                var res = true;
                for (var i = 0; i < bufferArr.length; i++) {
                    console.info('TC_021-3 buffer ' + bufferArr[i]);
                    if(res) {
                        if (bufferArr[i] == 0) {
                            res = false;
                            console.info('TC_021-3 Success');
                            expect(true).assertTrue();
                            done();
                            break;
                        }
                    }
                }
                if (res) {
                    console.info('TC_021-3 buffer is all empty');
                    expect(false).assertTrue()
                    done();
                }
            }
        })
        .catch(error => {
            console.log('TC_021-3 error: ' + error);
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    : TC_021-4
     * @tc.name      : read Pixels
     * @tc.desc      : 1.create PixelMap
     *                 2.call readPixels
     *                 3.promise return array
     *                 4.callbackcall return null
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
        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_021-4 success');
            done();
        })
        const area = { pixels: new ArrayBuffer(20),
            offset: 21,
            stride: 8,
            region: { size: { height: 1, width: 2 }, x: 0, y: 0 }}
        pixelmap.readPixels(area,(data) => {
            if(data !== null){
                var bufferArr = new Uint8Array(area.pixels);
                var res = true;
                for (var i = 0; i < bufferArr.length; i++) {
                    console.info('TC_021-4 buffer ' + bufferArr[i]);
                    if(res) {
                        if (bufferArr[i] == 0) {
                            res = false;
                            console.info('TC_021-4 Success');
                            expect(true).assertTrue();
                            done();
                            break;
                        }
                    }
                }
                if (res) {
                    console.info('TC_021-4 buffer is all empty');
                    expect(false).assertTrue()
                    done();
                }
            }
        })
        .catch(error => {
            console.log('TC_021-4 error: ' + error);
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    : TC_021-5
     * @tc.name      : read Pixels
     * @tc.desc      : 1.create PixelMap
     *                 2.call readPixels
     *                 3.promise return array
     *                 4.callbackcall return null
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
        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_021-5 success');
            done();
        })
        const area = { pixels: new ArrayBuffer(20),
            offset: 0,
            stride: 8,
            region: { size: { height: -1, width:-1}, x: 0, y: 0 }}
        pixelmap.readPixels(area,(data) => {
            if(data !== null){
                var bufferArr = new Uint8Array(area.pixels);
                var res = true;
                for (var i = 0; i < bufferArr.length; i++) {
                    console.info('TC_021-5 buffer ' + bufferArr[i]);
                    if(res) {
                        if (bufferArr[i] == 0) {
                            res = false;
                            console.info('TC_021-5 Success');
                            expect(true).assertTrue();
                            done();
                            break;
                        }
                    }
                }
                if (res) {
                    console.info('TC_021-5 buffer is all empty');
                    expect(false).assertTrue()
                    done();
                }
            }
        })
        .catch(error => {
            console.log('TC_021-5 error: ' + error);
            expect().assertFail();
            done();
        })
    })   
    
    /**
     * @tc.number    : TC_022
     * @tc.name      : write Pixels
     * @tc.desc      : 1.create PixelMap
     *                 2.call writePixels
     *                 3.call return null
     *                 4.callbackcall return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_022', 0, async function (done) {
        const color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts)
            .then( pixelmap => {
                if (pixelmap == null) {
                    console.info('TC_022 createPixelMap failed');
                    expect(false).assertTrue()
                    done();
                }

                const area = { pixels: new ArrayBuffer(20),
                    offset: 0,
                    stride: 8,
                    region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                }
                var bufferArr = new Uint8Array(area.pixels);
                for (var i = 0; i < bufferArr.length; i++) {
                    bufferArr[i] = i;
                }

                pixelmap.writePixels(area).then(() => {
                    const readArea = { pixels: new ArrayBuffer(20),
                        offset: 0,
                        stride: 8,
                        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                    }
                    pixelmap.readPixels(readArea).then(() => {
                        var readArr = new Uint8Array(readArea.pixels);
                        var res = true;
                        for (var i = 0; i < readArr.length; i++) {
                            if(res) {
                                if (readArr[i] !== 0) {
                                    res = false;
                                    console.info('TC_022 Success');
                                    expect(true).assertTrue();
                                    done();
                                    break;
                                }
                            }
                        }
                        if (res) {
                            console.info('TC_022 buffer is all empty');
                            expect(false).assertTrue()
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
     * @tc.name      : write Pixels
     * @tc.desc      : 1.create PixelMap
     *                 2.call writePixels
     *                 3.call return null
     *                 4.callbackcall return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
    */
    it('TC_022-1', 0, async function (done) {
        const color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_022-1 success');
            done();
        })
        const area = { pixels: new ArrayBuffer(20),
            offset: 0,
            stride: 8,
            region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
        }
        var bufferArr = new Uint8Array(area.pixels);
        for (var i = 0; i < bufferArr.length; i++) {
            bufferArr[i] = i;
        }
        pixelmap.writePixels(area,() => {
            const readArea = { pixels: new ArrayBuffer(20),
                offset: 0,
                stride: 8,
                region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
            }
            pixelmap.readPixels(readArea,() => {
                var readArr = new Uint8Array(readArea.pixels);
                var res = true;
                for (var i = 0; i < readArr.length; i++) {
                    if(res) {
                        if (readArr[i] !== 0) {
                            res = false;
                            console.info('TC_022-1 Success');
                            expect(true).assertTrue();
                            done();
                            break;
                        }
                    }
                }
                if (res) {
                    console.info('TC_022-1 buffer is all empty');
                    expect(false).assertTrue()
                    done();
                }
            })
        })
        .catch(error => {
            console.log('TC_022-1 error: ' + error);
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    : TC_023
     * @tc.name      : write Buffer To Pixels
     * @tc.desc      : 1.create PixelMap,buffer
     *                 2.call writeBufferToPixels
     *                 3.call return null
     *                 4.callbackcall return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_023', 0, async function (done) {
        const color = new ArrayBuffer(96);
        var bufferArr = new Uint8Array(color);
        for (var i = 0; i < bufferArr.length; i++) {
            bufferArr[i] = i;
        }
        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 4, width: 6 }}
        image.createPixelMap(color, opts)
            .then( pixelmap => {
                if (pixelmap == null) {
                    console.info('TC_023 createPixelMap failed');
                    expect(false).assertTrue()
                    done();
                }

                const writeColor = new ArrayBuffer(96);
                pixelmap.writeBufferToPixels(writeColor).then(() => {
                    const readBuffer = new ArrayBuffer(96);
                    pixelmap.readPixelsToBuffer(readBuffer).then(() => {
                        var bufferArr = new Uint8Array(readBuffer);
                        var res = true;
                        for (var i = 0; i < bufferArr.length; i++) {
                            if(res) {
                                if (bufferArr[i] !== i) {
                                    res = false;
                                    console.info('TC_023 Success');
                                    expect(true).assertTrue()
                                    done();
                                    break;
                                }
                            }
                        }
                        if (res) {
                            console.info('TC_023 no change after writeBuffer');
                            expect(false).assertTrue();
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
     * @tc.name      : write Buffer To Pixels
     * @tc.desc      : 1.create PixelMap,buffer
     *                 2.call writeBufferToPixels
     *                 3.call return null
     *                 4.callbackcall return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_023-1', 0, async function (done) {
        const color = new ArrayBuffer(96);
        var bufferArr = new Uint8Array(color);
        for (var i = 0; i < bufferArr.length; i++) {
            bufferArr[i] = i;
        }
        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts,pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_023-1 success');
            done();
        })
        const writeColor = new ArrayBuffer(96);
        pixelmap.writeBufferToPixels(writeColor,() => {
            const readBuffer = new ArrayBuffer(96);
            pixelmap.readPixelsToBuffer(readBuffer,() => {
                var bufferArr = new Uint8Array(readBuffer);
                var res = true;
                for (var i = 0; i < bufferArr.length; i++) {
                    if(res) {
                        if (bufferArr[i] !== i) {
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
        .catch(error => {
            console.log('TC_023-1 error: ' + error);
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    : TC_024
     * @tc.name      : get Image In fo
     * @tc.desc      : 1.create PixelMap,ImageInfo
     *                 2.call getImageInfo
     *                 3.call return imageinfo
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_024', 0, async function (done) {
        const color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 2, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts)
            .then( pixelmap => {
                if (pixelmap == null) {
                    console.info('TC_024 createPixelMap failed');
                    expect(false).assertTrue()
                    done();
                }
                pixelmap.getImageInfo().then( imageInfo => {
                    if (imageInfo !== null) {
                        console.info('TC_024 imageInfo is ready');
                        expect(imageInfo.size.height == 4).assertTrue();
                        expect(imageInfo.size.width == 6).assertTrue();
                        expect(imageInfo.pixelFormat == 2).assertTrue();
                        done();
                    } else {
                        console.info('TC_024 imageInfo is empty');
                        expect(false).assertTrue()
                        done();
                    }
                })
            })
            .catch(error => {
                console.log('TC_024 error: ' + error);
                expect().assertFail();
                done();
            })
    })

    /**
     * @tc.number    : TC_024-1
     * @tc.name      : get Image In fo
     * @tc.desc      : 1.create PixelMap,ImageInfo
     *                 2.call getImageInfo
     *                 3.call return imageinfo
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_024-1', 0, async function (done) {
        const color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_024-1 success');
            done();
        })
        pixelmap.getImageInfo( imageInfo => {
            if (imageInfo !== null) {
                console.info('TC_024-1 imageInfo is ready');
                expect(imageInfo.size.height == 4).assertTrue();
                expect(imageInfo.size.width == 6).assertTrue();
                expect(imageInfo.pixelFormat == 4).assertTrue();
                done();
            } else {
                console.info('TC_024-1 imageInfo is empty');
                expect(false).assertTrue()
                done();
            }
        })
        .catch(error => {
            console.log('TC_024-1 error: ' + error);
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    : TC_025-1
     * @tc.name      : get Bytes Number PerRow
     * @tc.desc      : 1.create PixelMap
     *                 2.set PixelMap
     *                 3.call getBytesNumberPerRow
     *                 4. call return number
     *                 5.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_025-1', 0, async function (done) {
        const color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 4, width: 6 } }
        const expectNum = opts.pixelFormat * opts.size.width;
        image.createPixelMap(color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_25-1 success');
            done();
        })
        pixelmap.getBytesNumberPerRow().then(num => {
            console.info('TC_025-1 num is ' + num);
            expect(num == expectNum).assertTrue();
            done();
        })
        .catch(error => {
            console.log('TC_025-1 error: ' + error);
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    : TC_026-1
     * @tc.name      : get Pixel Bytes Number
     * @tc.desc      : 1.create PixelMap
     *                 2.set Pixel
     *                 3.call getPixelBytesNumber
     *                 4. call return number
     *                 5.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_026-1', 0, async function (done) {
        const color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 4, width: 6 } }
        const expectNum = opts.pixelFormat * opts.size.width * opts.size.height;
        image.createPixelMap(color, opts,pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_026-1 success');
            done();
        })
        pixelmap.getPixelBytesNumber().then(num => {
            console.info('TC_026-1 num is ' + num);
            expect(num == expectNum).assertTrue();
            done();
        })
        .catch(error => {
            console.log('TC_026-1 error: ' + error);
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    : TC_027
     * @tc.name      : release
     * @tc.desc      : 1.create PixelMap
     *                 2.set Pixel
     *                 3.call release
     *                 4.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_027', 0, async function (done) {
        const color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts).then(pixelmap => {
                if (pixelmap == null) {
                    console.info('TC_027 createPixelMap failed');
                    expect(false).assertTrue()
                    done();
                }
                pixelmap.release().then(() => {
                    console.info('TC_027 success');
                    expect(true).assertTrue();
                    done();
                })
            .catch(error => {
                console.log('TC_027 error: ' + error);
                expect().assertFail();
                done();
            })
        })
    })

    /**
     * @tc.number    : TC_027-1 
     * @tc.name      : release(callback)
     * @tc.desc      : 1.create PixelMap
     *                 2.set Pixel
     *                 3.call release
     *                 4.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_027-1', 0, async function (done) {
        const color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts, (error,pixelmap) => {
            if (pixelmap == null) {
                console.info('TC_027-1 createPixelMap failed');
                expect(false).assertTrue()
                done();
            }
            pixelmap.release(()=>{
                expect(true).assertTrue();
                console.log('TC_027-1 success');
                done();
            })    
        })   
    })

    /**
     * @tc.number    : TC_041
     * @tc.name      : create Image Source(uri)
     * @tc.desc      : 1.set uri
     *                 2.call createImageSource(uri)
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_041', 0, async function (done) {
        const imageSourceApi = image.createImageSource('file:///data/local/tmp/test.jpg');
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_041 finished');
        done();
    })

    /**
     * @tc.number    : TC_041-1
     * @tc.name      : create Image Source(uri)
     * @tc.desc      : 1.seturi
     *                 2.call createImageSource(uri)
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_041-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource('file:///data/local/tmp/test.bmp');
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_041-1 finished');
        done();
    })

    /**
     * @tc.number    : TC_041-2
     * @tc.name      : create Image Source(uri)
     * @tc.desc      : 1.seturi
     *                 2.call createImageSource(uri)
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_041-2', 0, async function (done) {
        const imageSourceApi = image.createImageSource('file:///data/local/tmp/test.gif');
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_041-2 finished');
        done();
    })

    /**
     * @tc.number    : TC_041-3
     * @tc.name      : create Image Source(uri)
     * @tc.desc      : 1.seturi
     *                 2.call createImageSource(uri)
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_041-3', 0, async function (done) {
        const imageSourceApi = image.createImageSource('file:///data/local/tmp/test.png');
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_041-3 finished');
        done();
    })

    /**
     * @tc.number    : TC_041-4
     * @tc.name      : create Image Source(uri)
     * @tc.desc      : 1.call createImageSource(uri)
     *                 2.Incoming wrong suffix file 
     *                 3.imagesource null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_041-4', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.tif');
        expect(imageSourceApi == null).assertTrue();
        console.info('TC_041-4 finished');
        done();
    })

    /**
     * @tc.number    : TC_041-5
     * @tc.name      : create Image Source(uri)
     * @tc.desc      : 1.call createImageSource(uri)
     *                 2.set wrong uri
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_041-5', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/multiedia/test.jpg');
        expect(imageSourceApi == null).assertTrue();
        console.info('TC_041-5 finished');
        done();
    })

    /**
     * @tc.number    : TC_042
     * @tc.name      : create Image Source(fd)
     * @tc.desc      : 1.call createImageSource
     *                 2.set fd
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_042', 0, async function (done) {
        const imageSourceApi = image.createImageSource(29);
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_042 finished');
        done();
    })

    /**
     * @tc.number    : TC_042-1 
     * @tc.name      : create Image Source(fd) bmp
     * @tc.desc      : 1.call createImageSource
     *                 2.set fd
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_042-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource(30);
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_042-1 finished');
        done();
    })

    /**
     * @tc.number    : TC_042-2 
     * @tc.name      : create Image Source(fd) png
     * @tc.desc      : 1.call createImageSource
     *                 2.set fd
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_042-2', 0, async function (done) {
        const imageSourceApi = image.createImageSource(28);
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_042-2 finished');
        done();
    })

    /**
     * @tc.number    : TC_042-3
     * @tc.name      : create Image Source(fd)  gif
     * @tc.desc      : 1.call createImageSource
     *                 2.set fd
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_042-3', 0, async function (done) {
        const imageSourceApi = image.createImageSource(27);
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_042-3 finished');
        done();
    })

    /**
     * @tc.number    : TC_042-4
     * @tc.name      : create Image Source(fd)
     * @tc.desc      : 1.call createImageSource
     *                 2.set wrong fd
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_042-4', 0, async function (done) {
        const imageSourceApi = image.createImageSource(-2);
        expect(imageSourceApi == null).assertTrue();
        console.info('TC_042-4 finished');
        done();
    })

    /**
     * @tc.number    : TC_043
     * @tc.name      : create Image Source(data)
     * @tc.desc      : 1.setdata
     *                 2.createImageSource
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_043', 0, async function (done) {
        console.info('TC_043 start');
        const data = new ArrayBuffer(96);
        const imageSourceApi = image.createImageSource(data);
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_043 finished');
        done();
    })

    /**
     * @tc.number    : TC_043-1
     * @tc.name      : create Image Source(data) bmp
     * @tc.desc      : 1.setdata
     *                 2.createImageSource
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_043-1', 0, async function (done) {
        console.info('TC_043-1 start');
        const data = new ArrayBuffer(104);
        const imageSourceApi = image.createImageSource(data);
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_043-1 finished');
        done();
    })

    /**
     * @tc.number    : TC_043-2
     * @tc.name      : create Image Source(data) png
     * @tc.desc      : 1.setdata
     *                 2.createImageSource
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_043-2', 0, async function (done) {
        console.info('TC_043-2 start');
        const data = new ArrayBuffer(112);
        const imageSourceApi = image.createImageSource(data);
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_043-2 finished');
        done();
    })

    /**
     * @tc.number    : TC_043-3
     * @tc.name      : create Image Source(data) gif
     * @tc.desc      : 1.setdata
     *                 2.createImageSource
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_043-3', 0, async function (done) {
        console.info('TC_043-3 start');
        const data = new ArrayBuffer(112);
        const imageSourceApi = image.createImageSource(data);
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_043-3 finished');
        done();
    })

    /**
     * @tc.number    : TC_043-4
     * @tc.name      : create Image Source(data) 
     * @tc.desc      : 1.setdata
     *                 2.createImageSource
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_043-4', 0, async function (done) {
        console.info('TC_043-4 start');
        const data = new ArrayBuffer(0);
        const imageSourceApi = image.createImageSource(data);
        expect(imageSourceApi == null).assertTrue();
        console.info('TC_043-4 finished');
        done();
    })

    /**
     * @tc.number    : TC_044
     * @tc.name      : release()
     * @tc.desc      : 1.create ImageSource
     *                 2.call release()
     *                 3.return null
     * @tc.size      : MEDIUM  
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_044', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_044 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.release().then(()=>{
                console.info('TC_044 release');
                expect(true).assertTrue();
                done();
            }).catch(error => {
                console.info('TC_044 release');
                expect(false).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_044-1
     * @tc.name      : release()
     * @tc.desc      : 1.create ImageSource
     *                 2.call release()
     *                 3.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_044-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
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
    })

    /**
     * @tc.number    : TC_045
     * @tc.name      : get Image Info(ImageInfo)
     * @tc.desc      : 1.create imageSource
     *                 2.imageSourcecall getImageInfo(ImageInfo)
     *                 3.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_045', 0, async function (done) {
        console.info('TC_045');
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_045 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            console.info('TC_045 suc');
            imageSourceApi.getImageInfo(imageInfo => {
                console.info('TC_045 imageInfo');
                expect(imageInfo !== null).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_045-1
     * @tc.name      : get Image Info(ImageInfo)
     * @tc.desc      : 1.create imageSource
     *                 2.imageSourcecall getImageInfo(ImageInfo)
     *                 3.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_045-1', 0, async function (done) {
        console.info('TC_045-1');
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        if (imageSourceApi == null) {
            console.info('TC_045 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            console.info('TC_045-1 suc');
            imageSourceApi.getImageInfo(imageInfo => {
                console.info('TC_045-1 imageInfo');
                expect(imageInfo !== null).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_045-2
     * @tc.name      : get Image Info(ImageInfo)
     * @tc.desc      : 1.create imageSource
     *                 2.imageSourcecall getImageInfo(ImageInfo)
     *                 3.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_045-2', 0, async function (done) {
        console.info('TC_045-2');
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_045-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            console.info('TC_045-2 suc');
            imageSourceApi.getImageInfo(imageInfo => {
                console.info('TC_045-2 imageInfo');
                expect(imageInfo !== null).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_045-3
     * @tc.name      : get Image Info(index, ImageInfo)
     * @tc.desc      : 1.create ImageInfo
     *                 2.call getImageInfo(index, ImageInfo)
     *                 3.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_045-3', 0, async function (done) {
        console.info('TC_045-3');
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_045-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            console.info('TC_045-3 suc');
            imageSourceApi.getImageInfo(imageInfo => {
                console.info('TC_045-3 imageInfo');
                expect(imageInfo !== null).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_046
     * @tc.name      : get Image Info(index, ImageInfo)
     * @tc.desc      : 1.create ImageInfo
     *                 2.call getImageInfo(index, ImageInfo)
     *                 3.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_046', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_046 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageInfo(0,(error, imageInfo) => {
                console.info('TC_046 imageInfo');
                expect(imageInfo !== null).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_046-1
     * @tc.name      : get Image Info(index, ImageInfo)
     * @tc.desc      : 1.create ImageInfo
     *                 2.call getImageInfo(index, ImageInfo)
     *                 3.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_046-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        if (imageSourceApi == null) {
            console.info('TC_046-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageInfo(0,imageInfo => {
                console.info('TC_046-1 imageInfo');
                expect(imageInfo !== null).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number: TC_046-2
     * @tc.name  : getImageInfo(index, ImageInfo)
     * @tc.desc  : 1.create ImageInfo
     *             2.call getImageInfo(index, ImageInfo)
     *             3.callback return null
     * @tc.size  : MEDIUM MEDIUM
     * @tc.type  : Functional
     * @tc.level : Level 1
     */    
    it('TC_046-2', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_046-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageInfo(0,imageInfo => {
                console.info('TC_046-2 imageInfo');
                expect(imageInfo !== null).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number: TC_046-3
     * @tc.name  : get Image Info(index, ImageInfo)
     * @tc.desc  : 1.create ImageInfo
     *             2.call getImageInfo(index, ImageInfo)
     *             3.callback return null
     * @tc.size  : MEDIUM MEDIUM
     * @tc.type  : Functional
     * @tc.level : Level 1
     */    
    it('TC_046-3', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_046-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageInfo(0,imageInfo => {
                console.info('TC_046-3 imageInfo');
                expect(imageInfo !== null).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number: TC_046-4
     * @tc.name  : get Image Info(index, ImageInfo)
     * @tc.desc  : 1.create ImageInfo
     *             2.call getImageInfo(index, ImageInfo)
     *             3.callback return null
     * @tc.size  : MEDIUM
     * @tc.type  : Functional
     * @tc.level : Level 1
     */    
    it('TC_046-4', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_046-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageInfo(1,imageInfo => {
                console.info('TC_046-4 imageInfo');
                expect(imageInfo == null).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number: TC_046-5
     * @tc.name  : get Image Info(index, ImageInfo)
     * @tc.desc  : 1.create ImageInfo
     *             2.call getImageInfo(index, ImageInfo)
     *             3.callback return null
     * @tc.size  : MEDIUM 
     * @tc.type  : Functional
     * @tc.level : Level 1
     */    
    it('TC_046-5', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_046-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageInfo(-1,imageInfo => {
                console.info('TC_046-5 imageInfo');
                expect(imageInfo == null).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_047
     * @tc.name      : get Image Info(index) return Image Info
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageInfo(index)
     *                 3.callbackcall ,return imageinfo
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_047', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_047 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageInfo(0)
            .then(imageInfo => {
                console.info('TC_047 imageInfo');
                expect(imageInfo !== null).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_047-1
     * @tc.name      : get Image Info(index) return Image Info
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageInfo(index)
     *                 3.callbackcall ,return imageinfo
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_047-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        if (imageSourceApi == null) {
            console.info('TC_047-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageInfo(0)
            .then(imageInfo => {
                console.info('TC_047-1 imageInfo');
                expect(imageInfo !== null).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_047-2
     * @tc.name      : get Image Info(index) return Image Info
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageInfo(index)
     *                 3.callbackcall ,return imageinfo
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_047-2', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_047-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageInfo(0)
            .then(imageInfo => {
                console.info('TC_047-2 imageInfo');
                expect(imageInfo !== null).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_047-3
     * @tc.name      : get Image Info(index) return ImageInfo
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageInfo(index)
     *                 3.callbackcall ,return imageinfo
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_047-3', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_047-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageInfo(0)
            .then(imageInfo => {
                console.info('TC_047-3  ');
                expect(imageInfo !== null).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number: TC_047-4
     * @tc.name  : get Image Info(index) return ImageInfo
     * @tc.desc  : 1.create imagesource
     *             2.call getImageInfo(index=1)
     *             3.callback return imageinfo null
     * @tc.size  : MEDIUM 
     * @tc.type  : Functional
     * @tc.level : Level 1
     */    
    it('TC_047-4', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_047-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageInfo(1)
            .then((error,imageInfo) => {
                expect(imageInfo == null).assertTrue();
                console.info('TC_047-4 suc');
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_047-5
     * @tc.name      : get Image Info(index) return ImageInfo
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageInfo(index=-1)
     *                 3.callback return imageinfo null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */   
    it('TC_047-5', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_047-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageInfo(-1)
            .then((error,imageInfo) => { 
                expect(imageInfo == null).assertTrue();
                console.info('TC_047-5 success');
                done();
            })
        }
    })
        
    /**
     * @tc.number    : TC_050
     * @tc.name      : Decode the image to generate a bitmap 
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_050 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:3,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:0
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_050 createPixelMap ');
                expect(pixelmap !== null ).assertTrue();
                done();
            })
        }        
    })

    /**
     * @tc.number    : TC_050-1
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_050-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_050-1 createPixelMap ');
                expect(pixelmap !== null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_050-2
     * @tc.name      : Decode the image to generate a bitmap 
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-2', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_050-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_050-2 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_050-3
     * @tc.name      : Decode the image to generate a bitmap  
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-3', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_050-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:-1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_050-3 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_050-4
     * @tc.name      : Decode the image to generate a bitmap  
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-4', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_050-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:-10,
                desiredPixelFormat:2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_050-4 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_050-5
     * @tc.name      : Decode the image to generate a bitmap  
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-5', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_050-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: false, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:1,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_050-5 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_050-6
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1             
     */
    it('TC_050-6', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_050-6 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: false, 
                desiredSize:{ width:1, height:2},
                rotate:-10,
                desiredPixelFormat:11,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_050-6 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_050-7
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-7', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_050-7 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: false, 
                desiredSize:{ width:1, height:2},
                rotate:-10,
                desiredPixelFormat:11,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_050-7 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_050-8
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-8', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_050-8 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:400, height:400},
                rotate:10,
                desiredPixelFormat:1,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:0
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_050-8 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_050-9
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-9', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_050-9 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:1,
                desiredRegion: { size: { height: 400, width: 500 }, x: 0, y: 0 },
                index:0
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_050-9 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })
        
    /**
     * @tc.number    : TC_050-10
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_050-10', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_050-10 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:1,
                desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                index:0
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_050-10 createPixelMap');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_050-11
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-11', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_050-11 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.createPixelMap().then(pixelmap => {
                console.info('TC_050-11 createPixelMap ');
                expect(pixelmap !== null ).assertTrue();
                done();
            }).catch(error => {
                console.log('TC_050-11 error: ' + error);
                expect().assertFail();
                done();
            })
        }        
    })

    /**
     * @tc.number    : TC_050-12
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-12', 0, async function (done) { 
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_050-12 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.createPixelMap(pixelmap => {
                console.info('TC_050-12 createPixelMap ');
                expect(pixelmap !== null ).assertTrue();
                done();
            })
        }        
    })

    /**
     * @tc.number    : TC_050-13
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-13', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_050-13 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 400, y: 400 },
                index:0
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_050-13 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }        
    })

    /**
     * @tc.number    : TC_050-14
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-14', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_050-14 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:500,
                desiredPixelFormat:2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 400, y: 400 },
                index:0
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_050-14 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }        
    })

    /**
     * @tc.number    : TC_053
     * @tc.name      : Decode the image to generate a bitmap
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
                    sampleSize:1
                };
                incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
                    console.info('TC_053 0014' + pixelmap);
                    expect(pixelmap !== undefined ).assertTrue();
                    done();
                })
            } else {
                done();
            }
            done();
        } catch (error) {
            console.info('TC_053 updateData failed ' + error);
        }    
    })

    /**
     * @tc.number    : TC_053-1
     * @tc.name      : Decode the image to generate a bitmap
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
                    sampleSize:1
                };
                incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
                    expect(pixelmap !== undefined ).assertTrue();
                    done();
                })
            } else {
                done();
            }
            done();
        } catch (error) {
            console.info('TC_053-1 updateData failed ' + error);
        }   
    })

    /**
     * @tc.number    : TC_062
     * @tc.name      : packing
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     *                 4.callbackcall return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_062', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_062 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == null) {
                console.info('TC_062 create image packer failed');
                expect(false).assertTrue();
                done();
            } else {
                let packOpts = { format:["image/jpeg"], quality:98 }
                imagePackerApi.packing(imageSourceApi, packOpts)
                .then( data => {
                    console.info('TC_062 finished');
                    expect(data !== null).assertTrue();
                    done();
                })
                
            }
        }
    })

    /**
     * @tc.number    : TC_062-1 
     * @tc.name      : packing
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     *                 4.callbackcall return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_062-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_062-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == null) {
                console.info('TC_062-1 create image packer failed');
                expect(false).assertTrue();
                done();
            } else {
                let packOpts = { format:["image/jpeg"], quality:98 }
                imagePackerApi.packing(imageSourceApi, packOpts, data => {
                    console.info('TC_062-1 finished');
                    expect(data !== null).assertTrue();
                    done();
                })
            }
        }
    })

    /**
     * @tc.number    : TC_062-2
     * @tc.name      : packing ImageSource
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     *                 4.callbackcall return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_062-2', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_062-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == null) {
                console.info('TC_062-2 create image packer failed');
                expect(false).assertTrue();
                done();
            } else {
                let packOpts = { format:["image/gif"], quality:98 }
                imagePackerApi.packing(imageSourceApi, packOpts, data => {
                    console.info('TC_062-2 finished');
                    expect(data == null).assertTrue();
                    console.info(data);
                    done();
                })
            }
        }
    })

    /**
     * @tc.number    : TC_062-3
     * @tc.name      : packing ImageSource
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.call return array
     *                 4.callbackcall return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_062-3', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_062-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == null) {
                console.info('TC_062-3 create image packer failed');
                expect(false).assertTrue();
                done();
            } else {
                let packOpts = { format:["image/jpg"], quality:101 }
                imagePackerApi.packing(imageSourceApi, packOpts, data => {
                    console.info('TC_062-3 finished');
                    expect(data == null).assertTrue();
                    console.info(data);
                    done();
                })
            }
        }
    })

    /**
     * @tc.number    : TC_062-4 
     * @tc.name      : packing
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     *                 4.callbackcall return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_062-4', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_062-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == null) {
                console.info('TC_062-4 create image packer failed');
                expect(false).assertTrue();
                done();
            } else {
                console.info('TC_062-4 create image packer success');
                expect(true).assertTrue();
                done();
            }
        }
    })

    /**
     * @tc.number    : TC_063
     * @tc.name      : release ImagePacker 
     * @tc.desc      : 1.create ImagePacker
     *                 2.call release
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_063', 0, async function (done) {
        const imagePackerApi = image.createImagePacker();
        if (imagePackerApi == null) {
            console.info('TC_063 create image packer failed');
            expect(false).assertTrue();
            done();
        } else {
            imagePackerApi.release().then(()=>{
                console.info('TC_063 release');
                expect(true).assertTrue();
                done();
            }).catch(()=>{
                console.log('TC_063 error: ' + error);
                expect(false).assertTrue();
                done();
            }) 
        }
    })

    /**
     * @tc.number    : TC_063-1 
     * @tc.name      : release ImagePacker  
     * @tc.desc      : 1.create ImagePacker
     *                 2.call release
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_063-1', 0, async function (done) {
        const imagePackerApi = image.createImagePacker();
        if (imagePackerApi == null) {
            console.info('TC_063-1 create image packer failed');
            expect(false).assertTrue();
            done();
        } else {
            imagePackerApi.release(()=>{
            console.info('TC_063-1 release');
            expect(true).assertTrue();
            done();
            })
        }
    })

    /**
     * @tc.number    : TC_064
     * @tc.name      : release()  
     * @tc.desc      : 1.create ImageSource
     *                 2.call release()
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_064', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_064 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.release().then(()=>{
                console.info('TC_064 release');
                expect(true).assertTrue();
                done();  
            }).catch(error => {
                console.log('TC_064 error: ' + error);
                expect().assertFail();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_064-1
     * @tc.name      : release()
     * @tc.desc      : 1.create ImageSource
     *                 2.call release()
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_064-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_064-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.release(() => {
                console.info('TC_064-1 Success');
                expect(true).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_065
     * @tc.name      : release()
     * @tc.desc      : 1.create ImageSource
     *                 2.call release()
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_065', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        if (imageSourceApi == null) {
            console.info('TC_065 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.release().then(()=>{
                console.info('TC_065 release');
                expect(true).assertTrue();
                done();  
            }).catch(error => {
                console.log('TC_065 error: ' + error);
                expect().assertFail();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_065-1
     * @tc.name      : release()
     * @tc.desc      : 1.create ImageSource
     *                 2.create SourceStream
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_065-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        if (imageSourceApi == null) {
            console.info('TC_065-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.release(() => {
                console.info('TC_065-1 Success');
                expect(true).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_066
     * @tc.name      : release()
     * @tc.desc      : 1.create ImageSource
     *                 2.call release()
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_066', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_066 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.release().then(()=>{
                console.info('TC_065 release');
                expect(true).assertTrue();
                done();
            }).catch(error => {
                console.log('TC_065 error: ' + error);
                expect().assertFail();
                done();
            })
        }
    })
       
    /**
     * @tc.number    : TC_066-1
     * @tc.name      : release()
     * @tc.desc      : 1.create ImageSource
     *                 2.call release()
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_066-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_066-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.release(() => {
                console.info('TC_066-1 Success');
                expect(true).assertTrue();
                done();
            }).catch(()=>{
                console.info('TC_066-1 release');
                expect(false).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_067
     * @tc.name      : Decode the image to generate a bitmap  gif
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_067 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:0
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_067 createPixelMap ');
                expect(pixelmap !== null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_067-1
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_067-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_067-1 createPixelMap ');
                expect(pixelmap !== null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_067-2
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067-2', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_067-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_067-2 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_067-3
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067-3', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_067-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:-1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_067-3 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_067-4
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_067-4', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_067-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:-10,
                desiredPixelFormat:2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_067-4 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_067-5
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_067-5', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_067-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: false, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:1,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_067-5 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_067-6
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_067-6', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_067-6 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: false, 
                desiredSize:{ width:1, height:2},
                rotate:-10,
                desiredPixelFormat:11,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_067-6 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })  

    /**
     * @tc.number    : TC_067-7
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_067-7', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_067-7 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: false, 
                desiredSize:{ width:1, height:2},
                rotate:-10,
                desiredPixelFormat:11,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_067-7 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_067-8
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */ 
    it('TC_067-8', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info(' TC_067-8 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:400, height:400},
                rotate:10,
                desiredPixelFormat:1,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:0
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info(' TC_067-8 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_067-9
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */ 
    it('TC_067-9', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_067-9 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:1,
                desiredRegion: { size: { height: 400, width: 500 }, x: 0, y: 0 },
                index:0
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_067-9 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    }) 

    /**
     * @tc.number    : TC_067-10
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */ 
    it('TC_067-10', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_067-10 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:1,
                desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                index:0
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_067-10 createPixelMap');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })  
    
    /**
     * @tc.number    : TC_067-11
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
     it('TC_067-11', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_067-11 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.createPixelMap().then(pixelmap => {
                console.info('TC_067-11 createPixelMap ');
                expect(pixelmap !== null ).assertTrue();
                done();
            }).catch(error => {
                console.log('TC_067-11 error: ' + error);
                expect().assertFail();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_067-12
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067-12', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_067-12 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.createPixelMap(pixelmap => {
                console.info('TC_067-12 createPixelMap ');
                expect(pixelmap !== null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_067-13
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067-13', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_067-13 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 400, y: 400 },
                index:0
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_067-13 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_067-14
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067-14', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_067-14 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:500,
                desiredPixelFormat:2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 400, y: 400 },
                index:0
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_067-14 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_068
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        if (imageSourceApi == null) {
            console.info('TC_068 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:0 
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_068 createPixelMap ');
                expect(pixelmap !== null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_068-1
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        if (imageSourceApi == null) {
            console.info('TC_068-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_068-1 createPixelMap ');
                expect(pixelmap !== null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_068-2
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_068-2', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        if (imageSourceApi == null) {
            console.info('TC_068-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_068-2 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_068-3
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_068-3', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        if (imageSourceApi == null) {
            console.info('TC_068-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:-1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_068-3 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    }) 

    /**
     * @tc.number    : TC_068-4
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */ 
    it('TC_068-4', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        if (imageSourceApi == null) {
            console.info('TC_068-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:-10,
                desiredPixelFormat:2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_068-4 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })  

    /**
     * @tc.number    : TC_068-5
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */ 
    it('TC_068-5', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        if (imageSourceApi == null) {
            console.info('TC_068-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: false, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:1,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_068-5 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_068-6
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */  
    it('TC_068-6', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        if (imageSourceApi == null) {
            console.info('TC_068-6 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: false, 
                desiredSize:{ width:1, height:2},
                rotate:-10,
                desiredPixelFormat:11,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_068-6 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    }) 

    /**
     * @tc.number    : TC_068-7
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */ 
    it('TC_068-7', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
            console.info('TC_068-7 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: false, 
                desiredSize:{ width:1, height:2},
                rotate:-10,
                desiredPixelFormat:11,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_068-7 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    }) 

    /**
     * @tc.number    : TC_068-8
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */ 
    it('TC_068-8', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        if (imageSourceApi == null) {
            console.info(' TC_068-8 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:400, height:400},
                rotate:10,
                desiredPixelFormat:1,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:0
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info(' TC_068-8 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    }) 

    /**
     * @tc.number    : TC_068-9
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_068-9', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        if (imageSourceApi == null) {
            console.info('TC_068-9 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:1,
                desiredRegion: { size: { height: 400, width: 500 }, x: 0, y: 0 },
                index:0
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_068-9 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    }) 

    /**
     * @tc.number    : TC_068-10
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */ 
    it('TC_068-10', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        if (imageSourceApi == null) {
            console.info('TC_068-10 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:1,
                desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                index:0
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_068-10 createPixelMap');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_068-11
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-11', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        if (imageSourceApi == null) {
            console.info('TC_068-11 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.createPixelMap().then(pixelmap => {
                console.info('TC_068-11 createPixelMap ');
                expect(pixelmap !== null ).assertTrue();
                done();
            }).catch(error => {
                console.log('TC_068-11 error: ' + error);
                expect().assertFail();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_068-12
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-12', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        if (imageSourceApi == null) {
            console.info('TC_068-12 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.createPixelMap(pixelmap => {
                console.info('TC_068-12 createPixelMap ');
                expect(pixelmap !== null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_068-13
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-13', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        if (imageSourceApi == null) {
            console.info('TC_068-13 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 440, y:440 },
                index:0 
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_068-13 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_068-14
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-14', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        if (imageSourceApi == null) {
            console.info('TC_068-14 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:550,
                desiredPixelFormat:2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 440, y:440 },
                index:0 
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_068-14 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_163
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_163 create image source failed');
            expect(false).assertTrue();
            done();
        } else {     
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:0  
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_163 createPixelMap');
                expect(pixelmap !== null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_163-1
     * @tc.name      : Decode the image to generate a bitmap 
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_163-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_163-1 createPixelMap ');
                expect(pixelmap !== null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_163-2
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set decodingOptions
     *                 3.call createPixelMap
     *                 4.set index=-1,options
     *                 5.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163-2', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_163-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_163-2 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_163-3
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set decodingOptions
     *                 3.call createPixelMap
     *                 4.set index=-1,options
     *                 5.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_163-3', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_163-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:-1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_163-3 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_163-4
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set decodingOptions
     *                 3.call createPixelMap
     *                 4.set index=-1,options
     *                 5.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */ 
    it('TC_163-4', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_163-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:-10,
                desiredPixelFormat:2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_163-4 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })  

    /**
     * @tc.number    : TC_163-5
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set decodingOptions
     *                 3.call createPixelMap
     *                 4.set index=-1,options
     *                 5.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */ 
    it('TC_163-5', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_163-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: false, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:1,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_163-5 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })  

    /**
     * @tc.number    : TC_163-6
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set decodingOptions
     *                 3.call createPixelMap
     *                 4.set index=-1,options
     *                 5.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */  
    it('TC_163-6', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_163-6 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: false, 
                desiredSize:{ width:1, height:2},
                rotate:-10,
                desiredPixelFormat:11,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_163-6 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_163-7
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set decodingOptions
     *                 3.call createPixelMap
     *                 4.set index=-1,options
     *                 5.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_163-7', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_163-7 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: false, 
                desiredSize:{ width:1, height:2},
                rotate:-10,
                desiredPixelFormat:11,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:-1
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_163-7 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_163-8
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set decodingOptions
     *                 3.call createPixelMap
     *                 4.set index=-1,options
     *                 5.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */    
    it('TC_163-8', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info(' TC_163-8 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:400, height:400},
                rotate:10,
                desiredPixelFormat:1,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:0
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info(' TC_163-8 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    }) 

    /**
     * @tc.number    : TC_163-9
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set decodingOptions
     *                 3.call createPixelMap
     *                 4.set index=-1,options
     *                 5.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */ 
    it('TC_163-9', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_163-9 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:1,
                desiredRegion: { size: { height: 400, width: 500 }, x: 0, y: 0 },
                index:0
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_163-9 createPixelMap ');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_163-10
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set decodingOptions
     *                 3.call createPixelMap
     *                 4.set index=-1,options
     *                 5.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */ 
    it('TC_163-10', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_163-10 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:1,
                desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                index:0
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_163-10 createPixelMap');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })
    
    /**
     * @tc.number    : TC_163-11
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163-11', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_163-11 create image source failed');
            expect(false).assertTrue();
            done();
        } else {     
            imageSourceApi.createPixelMap().then(pixelmap => {
                console.info('TC_163-11 createPixelMap');
                expect(pixelmap !== null ).assertTrue();
                done();
            }).catch(error => {
                console.log('TC_163-11 error: ' + error);
                expect().assertFail();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_163-12
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163-12', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_163-12 create image source failed');
            expect(false).assertTrue();
            done();
        } else {     
            imageSourceApi.createPixelMap(pixelmap => {
                console.info('TC_163-12 createPixelMap');
                expect(pixelmap !== null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_163-13
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163-13', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_163-13 create image source failed');
            expect(false).assertTrue();
            done();
        } else {     
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:10,
                desiredPixelFormat:2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 500, y:500 },
                index:0  
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_163-13 createPixelMap');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_163-14
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163-14', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_163-14 create image source failed');
            expect(false).assertTrue();
            done();
        } else {     
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:400,
                desiredPixelFormat:2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 500, y:500 },
                index:0  
            };
            imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
                console.info('TC_163-14 createPixelMap');
                expect(pixelmap == null ).assertTrue();
                done();
            })
        }
    })     

    /**
     * @tc.number    : TC_164
     * @tc.name      : supportedFormats
     * @tc.desc      : 1.create imagesource
     *                 2.call supportedFormats
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */    
    it('TC_164', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_164 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            expect(imageSourceApi.supportedFormats != null).assertTrue();
            console.info(imageSourceApi.supportedFormats); 
            console.info('TC_164 suc ');
            done();
        }
    })

    /**
     * @tc.number    : TC_166
     * @tc.name      : supportedFormats
     * @tc.desc      : 1.create imagepacker
     *                 2.call supportedFormats
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */    
    it('TC_166', 0, async function (done) {
        const imagePackerApi = image.createImagePacker();
        if (imagePackerApi == null) {
            console.info('TC_166 create image packer failed');
            expect(false).assertTrue();
            done();
        } else {
            expect(imagePackerApi.supportedFormats != null).assertTrue();
            console.info(imagePackerApi.supportedFormats); 
            console.info('TC_166 success ');
            done();
        }
    })

    /**
     * @tc.number    : TC_167
     * @tc.name      : Decode the image to generate a bitmap
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_167', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.arw');
        let decodingOptions = {
            sampleSize:1,
            editable: true, 
            desiredSize:{ width:1, height:2},
            rotate:10,
            desiredPixelFormat:3,
            desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
            index:0
        };
        imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
            console.info('TC_167 createPixelMap ');
            expect(pixelmap == null ).assertTrue();
            done();
        })
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
        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 2, width: 3 } }
        image.createPixelMap(Color, opts, (error,pixelmap) => {
            if(pixelmap == null){
                console.info('TC_168 create pixelmap failed');
                expect(false).assertTrue();
                done();  
            }else {
                expect(pixelmap.isEditable == true).assertTrue();
                console.info('TC_168 success ');
                done();
            }
        })   
    })

    /**
     * @tc.number    : TC_169
     * @tc.name      : Decode the image to generate a bitmap 
     * @tc.desc      : 1.create imagesource
     *                 2.create pixelmap
     *                 3.call getimageinfo
     *                 4.Judging the length and width are opposite to the original
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
     it('TC_169', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_169 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize:1,
                editable: true, 
                desiredSize:{ width:1, height:2},
                rotate:90,
                desiredPixelFormat:3,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index:0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                console.info('TC_169 createPixelMap ');
                pixelmap.getImageInfo( (err,imageInfo) => {
                    if (imageInfo !== null) {
                        console.info('TC_169 imageInfo is ready');
                        expect(imageInfo.size.height == 2).assertTrue();
                        expect(imageInfo.size.width == 1).assertTrue();
                        done();
                    }else {
                        console.info('TC_169 imageInfo is empty');
                        expect(false).assertTrue()
                        done();
                    }
                })
            })
        }
    })

    /**
     * @tc.number    : TC_174
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_174', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_174 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            console.info('TC_174 start modifyImageProperty');
            imageSourceApi.modifyImageProperty("BitsPerSample","4")
            .then(() => {
                console.info('TC_174 start ImageProperty');
                imageSourceApi.getImageProperty("BitsPerSample").then((value) => {
                    console.info('TC_174 BitsPerSample ' + value);
                    expect(value == '4').assertTrue();
                    done();  
                }).catch((err)=>{
                    console.info(`TC_174 getimageproperty failed, err:${err}`);
                    expect(false).assertTrue();
                    done();
                })
            }).catch((err)=>{
                console.info(`TC_174 modifyImageProperty failed, err:${err}`);
                expect(false).assertTrue();
                done();
            })
        }
    }) 

    /**
     * @tc.number    : TC_174-1
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_174-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_174-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.modifyImageProperty("Orientation","2")
            .then(() => {
                imageSourceApi.getImageProperty("Orientation").then((value) => {
                    console.info('TC_174-1 Orientation ' + value);
                    expect(value == '2').assertTrue();
                    done();
                }).catch((err)=>{
                    console.info(`TC_174-1 getimageproperty failed, err:${err}`);
                    expect(false).assertTrue();
                    done();
                })
            }).catch((err)=>{
                console.info(`TC_174-1 modifyImageProperty failed, err:${err}`);
                expect(false).assertTrue();
                done();
            })
        }
    })  

    /**
     * @tc.number    : TC_174-2
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_174-2', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_174-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.modifyImageProperty("ImageLength","200")
            .then(() => {
                imageSourceApi.getImageProperty("ImageLength").then((value) => {
                    console.info('TC_174-2 ImageLength ' + value);
                    expect(value == '200').assertTrue();
                    done();
                }).catch((err)=>{
                    console.info(`TC_174-2 getimageproperty failed, err:${err}`);
                    expect(false).assertTrue();
                    done();
                })
            }).catch((err)=>{
                console.info(`TC_174-2 modifyImageProperty failed, err:${err}`);
                expect(false).assertTrue();
                done();
            })
        }
    })  

    /**
     * @tc.number    : TC_174-3
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_174-3', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_174-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.modifyImageProperty("ImageWidth","200")
            .then(() => {
                imageSourceApi.getImageProperty("ImageWidth").then((value) => {
                    console.info('TC_174-3 ImageWidth ' + value);
                    expect(value == '200').assertTrue();
                    done();
                }).catch((err)=>{
                    console.info(`TC_174-3 getimageproperty failed, err:${err}`);
                    expect(false).assertTrue();
                    done();
                })
            }).catch((err)=>{
                console.info(`TC_174-3 modifyImageProperty failed, err:${err}`);
                expect(false).assertTrue();
                done();
            })
        }
    })  

    /**
     * @tc.number    : TC_174-4
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_174-4', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_174-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.modifyImageProperty("GPSLatitude","114,3").then(() => {
                imageSourceApi.getImageProperty("GPSLatitude").then( value => {
                    console.info('TC_174-4 GPSLatitude ' + value);
                    expect(value == "114,3").assertTrue();
                    done();
                }).catch((err)=>{
                    console.info(`TC_174-4 getImageProperty failed, err:${err}`);
                    expect(false).assertTrue();
                    done();
                })
            }).catch((err)=>{
                console.info(`TC_174-4 modifyImageProperty failed, err:${err}`);
                expect(false).assertTrue();
                done();
            })
        }
    })  

    /**
     * @tc.number    : TC_174-5
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_174-5', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_174-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.modifyImageProperty("GPSLongitude","18,2")
            .then(() => {
                imageSourceApi.getImageProperty("GPSLongitude").then((value) => {
                    console.info('TC_174-5 GPSLongitude ' + value);
                    expect(value == "18,2").assertTrue();
                    done();
                }).catch((err)=>{
                    console.info(`TC_174-5 getimageproperty failed, err:${err}`);
                    expect(false).assertTrue();
                    done();
                })
            }).catch((err)=>{
                console.info(`TC_174-5 modifyImageProperty failed, err:${err}`);
                expect(false).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_174-6
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_174-6', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_174-6 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:1,defaultValue:'1'};
            imageSourceApi.modifyImageProperty("GPSLatitudeRef","N",property).then(() => {
                imageSourceApi.getImageProperty("GPSLatitudeRef",property).then((value) => {
                    console.info('TC_174-6 GPSLatitudeRef ' + value);
                    expect(value == 'N').assertTrue();
                    done();
                }).catch((err)=>{
                    console.info(`TC_174-6 getimageproperty failed, err:${err}`);
                    expect(false).assertTrue();
                    done();
                })
            }).catch((err)=>{
                console.info(`TC_174-6 modifyImageProperty failed, err:${err}`);
                expect(false).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_174-7
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_174-7', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_174-7 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:1,defaultValue:'1'};
            imageSourceApi.modifyImageProperty("GPSLatitudeRef","W",property).then(() => {
                imageSourceApi.getImageProperty("GPSLatitudeRef",property).then((value) => {
                    console.info('TC_174-7 GPSLatitudeRef ' + value);
                    expect(value == 'W').assertTrue();
                    done();
                }).catch((err)=>{
                    console.info(`TC_174-7 getimageproperty failed, err:${err}`);
                    expect(false).assertTrue();
                    done();
                })
            }).catch((err)=>{
                console.info(`TC_174-7 modifyImageProperty failed, err:${err}`);
                expect(false).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_175
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_175', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_175 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.modifyImageProperty("BitsPerSample","4",() => {
                imageSourceApi.getImageProperty("BitsPerSample",(error,value) => {
                    console.info('TC_175 BitsPerSample ' + value);
                    expect(value == "4").assertTrue();
                    done();
                })
            })
        }
    })

    /**
     * @tc.number    : TC_175-1
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_175-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_175-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.modifyImageProperty("Orientation","2",() => {
                imageSourceApi.getImageProperty("Orientation",(error,value) => {
                    console.info('TC_175-1 Orientation ' + value);
                    expect(value == "2").assertTrue();
                    done();
                })
            })
        }
    })

    /**
     * @tc.number    : TC_175-2
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_175-2', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_175-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.modifyImageProperty("ImageLength","200",() => {
                imageSourceApi.getImageProperty("ImageLength",(error,value) => {
                    console.info('TC_175-2 ImageLength ' + value);
                    expect(value == "200").assertTrue();
                    done();
                })
            })
        }
    })

    /**
     * @tc.number    : TC_175-3
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_175-3', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_175-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.modifyImageProperty("ImageWidth","200",() => {
                imageSourceApi.getImageProperty("ImageWidth",(error,value) => {
                    console.info('TC_175-3 ImageWidth ' + value);
                    expect(value == "200").assertTrue();
                    done();
                })
            })
        }
    })

    /**
     * @tc.number    : TC_175-4
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_175-4', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_175-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.modifyImageProperty("GPSLatitude","114,3",() => {
                imageSourceApi.getImageProperty("GPSLatitude",(error,value) => {
                    console.info('TC_175-4 GPSLatitude ' + value);
                    expect(value == "114,3").assertTrue();
                    done();
                })
            })
        }
    })

    /**
     * @tc.number    : TC_175-5
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_175-5', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_175-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.modifyImageProperty("GPSLongitude","18,2",() => {
                imageSourceApi.getImageProperty("GPSLongitude",(error,value) => {
                    console.info('TC_175-5 GPSLongitude ' + value);
                    expect(value == "18,2").assertTrue();
                    done();
                })
            })
        }
    })

    /**
     * @tc.number    : TC_175-6
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_175-6', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_175-6 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.modifyImageProperty("GPSLatitudeRef","N",() => {
                imageSourceApi.getImageProperty("GPSLatitudeRef",(error,value) => {
                    console.info('TC_175-6 GPSLatitudeRef ' + value);
                    expect(value == "N").assertTrue();
                    done();
                })
            })
        }
    })

    /**
     * @tc.number    : TC_175-7
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_175-7', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_175-7 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.modifyImageProperty("GPSLongitudeRef","W",() => {
                imageSourceApi.getImageProperty("GPSLongitudeRef",(error,value) => {
                    console.info('TC_175-7 GPSLongitudeRef ' + value);
                    expect(value == "W").assertTrue();
                    done();
                })
            })
        }
    })

    /**
     * @tc.number    : TC_176
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_176', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_176 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:1,defaultValue:'1'}
            imageSourceApi.modifyImageProperty("BitsPerSample","4",property,() => {
                imageSourceApi.getImageProperty("BitsPerSample",property,(error,value) => {
                    console.info('TC_176 BitsPerSample ' + value);
                    expect(value == "4").assertTrue();
                    done();
                })
            })
        }
    })

    /**
     * @tc.number    : TC_176-1
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_176-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_176-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:1,defaultValue:'1'}
            imageSourceApi.modifyImageProperty("Orientation","2",property,() => {
                imageSourceApi.getImageProperty("Orientation",property,(error,value) => {
                    console.info('TC_176-1 Orientation ' + value);
                    expect(value == "2").assertTrue();
                    done();
                })
            })
        }
    })

    /**
     * @tc.number    : TC_176-2
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_176-2', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_176-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:1,defaultValue:'1'}
            imageSourceApi.modifyImageProperty("ImageLength","200",property,() => {
                imageSourceApi.getImageProperty("ImageLength",property,(error,value) => {
                    console.info('TC_176-2 ImageLength ' + value);
                    expect(value == "200").assertTrue();
                    done();
                })
            })
        }
    })

    /**
     * @tc.number    : TC_176-3
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_176-3', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_176-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:1,defaultValue:'1'}
            imageSourceApi.modifyImageProperty("ImageWidth","200",property,() => {
                imageSourceApi.getImageProperty("ImageWidth",property,(error,value) => {
                    console.info('TC_176-3 ImageWidth ' + value);
                    expect(value == "200").assertTrue();
                    done();
                })
            })
        }
    })

    /**
     * @tc.number    : TC_176-4
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_176-4', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_176-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:1,defaultValue:'1'}
            imageSourceApi.modifyImageProperty("GPSLatitude","114,3",property,() => {
                imageSourceApi.getImageProperty("GPSLatitude",property,(error,value) => {
                    console.info('TC_176-4 GPSLatitude ' + value);
                    expect(value == "114,3").assertTrue();
                    done();
                })
            })
        }
    })

    /**
     * @tc.number    : TC_176-5
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_176-5', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_176-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:1,defaultValue:'1'}
            imageSourceApi.modifyImageProperty("GPSLongitude","18,2",property,() => {
                imageSourceApi.getImageProperty("GPSLongitude",property,(error,value) => {
                    console.info('TC_176-5 GPSLongitude ' + value);
                    expect(value == "18,2").assertTrue();
                    done();
                })
            })
        }
    })

    /**
     * @tc.number    : TC_176-6
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_176-6', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_176-6 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:1,defaultValue:'1'}
            imageSourceApi.modifyImageProperty("GPSLatitudeRef","N",property,() => {
                imageSourceApi.getImageProperty("GPSLatitudeRef",property,(error,value) => {
                    console.info('TC_176-6 GPSLatitudeRef ' + value);
                    expect(value == "N").assertTrue();
                    done();
                })
            })
        }
    })

    /**
     * @tc.number    : TC_176-7
     * @tc.name      : modifyImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_176-7', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_176-7 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:1,defaultValue:'1'}
            imageSourceApi.modifyImageProperty("GPSLongitudeRef","W",property,() => {
                imageSourceApi.getImageProperty("GPSLongitudeRef",property,(error,value) => {
                    console.info('TC_176-7 GPSLongitudeRef ' + value);
                    expect(value == "W").assertTrue();
                    done();
                })
            })
        }
    })

    /**
     * @tc.number    : TC_171
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(BitsPerSample)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_171 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("BitsPerSample")
            .then(data => {
                console.info('TC_171 BitsPerSample ' + data);
                expect(data !== null && data !== undefined && data !== '' ).assertTrue();
                done();
            })
            .catch(error => {
                console.log('TC_171 error: ' + error);
                expect(false).assertFail();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_171-1
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(Orientation)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_171-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("Orientation")
            .then(data => {
                console.info('TC_171-1 Orientation ' + data);
                expect(data !== null && data !== undefined && data !== '' ).assertTrue();
                done();
            })
            .catch(error => {
                console.log('TC_171-1 error: ' + error);
                expect(false).assertFail();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_171-2
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ImageLength)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-2', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_171-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("ImageLength")
            .then(data => {
                console.info('TC_171-2 ImageLength ' + data);
                expect(data !== null && data !== undefined && data !== '' ).assertTrue();
                done();
            })
            .catch(error => {
                console.log('TC_171-2 error: ' + error);
                expect(false).assertFail();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_171-3
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ImageWidth)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-3', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_171-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("ImageWidth")
            .then(data => {
                console.info('TC_171-3 ImageWidth ' + data);
                expect(data !== null && data !== undefined && data !== '' ).assertTrue();
                done();
            })
            .catch(error => {
                console.log('TC_171-3 error: ' + error);
                expect(false).assertFail();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_171-4
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLatitude)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-4', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_171-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLatitude")
            .then(data => {
                console.info('TC_171-4 GPSLatitude ' + data);
                expect(data !== null && data !== undefined && data !== '' ).assertTrue();
                done();
            })
            .catch(error => {
                console.log('TC_171-4 error: ' + error);
                expect(false).assertFail();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_171-5
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLongitude)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-5', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_171-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLongitude")
            .then(data => {
                console.info('TC_171-5 GPSLongitude ' + data);
                expect(data !== null && data !== undefined && data !== '' ).assertTrue();
                done();
            })
            .catch(error => {
                console.log('TC_171-5 error: ' + error);
                expect(false).assertFail();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_171-6
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLatitudeRef)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-6', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_171-6 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLatitudeRef")
            .then(data => {
                console.info('TC_171-6 GPSLatitudeRef ' + data);
                expect(data !== null && data !== undefined && data !== '' ).assertTrue();
                done();
            })
            .catch(error => {
                console.log('TC_171-6 error: ' + error);
                expect(false).assertFail();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_171-7
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLongitudeRef)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-7', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_171-7 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLongitudeRef")
            .then(data => {
                console.info('TC_171-7 GPSLongitudeRef ' + data);
                expect(data !== null && data !== undefined && data !== '' ).assertTrue();
                done();
            })
            .catch(error => {
                console.log('TC_171-7 error: ' + error);
                expect(false).assertFail();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_171-8
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ImageLength)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-8', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_171-8 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("DateTimeOriginal")
            .then(data => {
                console.info('TC_171-8 DateTimeOriginal ' + data);
                expect(data !== null && data !== undefined && data !== '' ).assertTrue();
                done();
            })
            .catch(error => {
                console.log('TC_171-8 error: ' + error);
                expect(false).assertFail();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_172
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(BitsPerSample)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_172 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("BitsPerSample",(error,data) => {
                console.info('TC_172 BitsPerSample ' + data);
                expect(data !== null && data !== undefined && data !== '' ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_172-1
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(Orientation)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_172-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("Orientation",(error,data) => {
                console.info('TC_172-1 Orientation ' + data);
                expect(data !== undefined && data !== null && data !== '').assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_172-2
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(ImageLength)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-2', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_172-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("ImageLength",(error,data) => {
                console.info('TC_172-2 ImageLength ' + data);
                expect(data !== null && data !== undefined && data !== '' ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_172-3
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(ImageWidth)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-3', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_172-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("ImageWidth",(error,data) => {
                console.info('TC_172-3 ImageWidth ' + data);
                expect(data !== null && data !== undefined && data !== '' ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_172-4
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(GPSLatitude)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-4', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_172-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLatitude",(error,data) => {
                console.info('TC_172-4 GPSLatitude ' + data);
                expect(data !== null && data !== undefined && data !== '' ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_172-5
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(GPSLongitude)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-5', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_172-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLongitude",(error,data) => {
                console.info('TC_172-5 GPSLongitude ' + data);
                expect(data !== null && data !== undefined && data !== '' ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_172-6
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(GPSLatitudeRef)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-6', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_172-6 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLatitudeRef",(error,data) => {
                console.info('TC_172-6 GPSLatitudeRef ' + data);
                expect(data !== null && data !== undefined && data !== '' ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_172-7
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(GPSLongitudeRef)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-7', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_172-7 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLongitudeRef",(error,data) => {
                console.info('TC_172-7 GPSLongitudeRef ' + data);
                expect(data !== null && data !== undefined && data !== '' ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_172-8
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(DateTimeOriginal)
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-8', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_172-8 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("DateTimeOriginal",(error,data) => {
                console.info('TC_172-8 DateTimeOriginal ' + data);
                expect(data !== null && data !== undefined && data !== '' ).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_173
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(BitsPerSample,property)
     *                 4.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_173 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:0,defaultValue:'9999'}
            imageSourceApi.getImageProperty("BitsPerSample",property,(error,data) => {
                console.info('TC_173 BitsPerSample ' + data);
                expect(data !== null && data !== undefined && data !== '').assertTrue();
                expect(data !== '9999').assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_173-1
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(Orientation,property)
     *                 4.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_173-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:0,defaultValue:'9999'}
            imageSourceApi.getImageProperty("Orientation",property,(error,data) => {
                console.info('TC_173-1 Orientation ' + data);
                expect(data !== null && data !== undefined && data !== '').assertTrue();
                expect(data !== '9999').assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_173-2
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ImageLength,property)
     *                 4.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-2', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_173-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:0,defaultValue:'9999'}
            imageSourceApi.getImageProperty("ImageLength",property,(error,data) => {
                console.info('TC_173-2 ImageLength ' + data);
                expect(data !== null && data !== undefined && data !== '').assertTrue();
                expect(data !== '9999').assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_173-3
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ImageWidth,property)
     *                 4.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-3', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_173-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:0,defaultValue:'9999'}
            imageSourceApi.getImageProperty("ImageWidth",property,(error,data) => {
                console.info('TC_173-3 ImageWidth ' + data);
                expect(data !== null && data !== undefined && data !== '').assertTrue();
                expect(data !== '9999').assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_173-4
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLatitude,property)
     *                 4.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-4', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_173-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:0,defaultValue:'9999'}
            imageSourceApi.getImageProperty("GPSLatitude",property,(error,data) => {
                console.info('TC_173-4 GPSLatitude ' + data);
                expect(data !== null && data !== undefined && data !== '').assertTrue();
                expect(data !== '9999').assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_173-5
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLongitude,property)
     *                 4.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-5', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_173-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:0,defaultValue:'9999'}
            imageSourceApi.getImageProperty("GPSLongitude",property,(error,data) => {
                console.info('TC_173-5 GPSLongitude ' + data);
                expect(data !== null && data !== undefined && data !== '').assertTrue();
                expect(data !== '9999').assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_173-6
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLatitudeRef,property)
     *                 4.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-6', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_173-6 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:0,defaultValue:'9999'}
            imageSourceApi.getImageProperty("GPSLatitudeRef",property,(error,data) => {
                console.info('TC_173-6 GPSLatitudeRef ' + data);
                expect(data !== null && data !== undefined && data !== '').assertTrue();
                expect(data !== '9999').assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_173-7
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLongitudeRef,property)
     *                 4.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-7', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_173-7 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:0,defaultValue:'9999'}
            imageSourceApi.getImageProperty("GPSLongitudeRef",property,(error,data) => {
                console.info('TC_173-7 GPSLongitudeRef ' + data);
                expect(data !== null && data !== undefined && data !== '').assertTrue();
                expect(data !== '9999').assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_173-8
     * @tc.name      : getImageProperty
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(DateTimeOriginal,property)
     *                 4.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-8', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
        if (imageSourceApi == null) {
            console.info('TC_173-8 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:0,defaultValue:'9999'}
            imageSourceApi.getImageProperty("DateTimeOriginal",property,(error,data) => {
                console.info('TC_173-8 DateTimeOriginal ' + data);
                expect(data !== null && data !== undefined && data !== '').assertTrue();
                expect(data !== '9999').assertTrue();
                done();
            })
        }
    })
})