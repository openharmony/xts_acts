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

    /* *
        * @tc.number    : TC_001
        * @tc.name      : create pixelmap object
        * @tc.desc      : 1.创建InitializationOptions对象opts
        *                 2.设置color，colorlength，offset，width，height，pixeFormat，alphyType
        *                 3.使用color，colorlength， offset，width和opts创建PixelMap对象newPixelMap
        *                 4.验证newPixelMap对象不为null
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
    */

    it('TC_001', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 2, width: 3 } }
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

    /* *
        * @tc.number    : TC_001-1
        * @tc.name      : create pixelmap object
        * @tc.desc      : 1.创建InitializationOptions对象opts
        *                 2.设置color，colorlength，offset，width，height，pixeFormat，alphyType
        *                 3.使用color，colorlength， offset，width和opts创建PixelMap对象newPixelMap
        *                 4.验证newPixelMap对象不为null
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
    */

    it('TC_001-1', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 2, width: 3 } }
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
    
    /* *
        * @tc.number    : TC_001-2
        * @tc.name      : create pixelmap object
        * @tc.desc      : 1.创建InitializationOptions对象opts
        *                 2.设置color，colorlength，offset，width，height，pixeFormat，alphyType
        *                 3.使用color，colorlength， offset，width和opts创建PixelMap对象newPixelMap
        *                 4.验证newPixelMap对象不为null
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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

    /* *
        * @tc.number    : TC_001-3
        * @tc.name      : create pixelmap object
        * @tc.desc      : 1.创建InitializationOptions对象opts
        *                 2.设置color，colorlength，offset，width，height，pixeFormat，alphyType
        *                 3.使用color，colorlength， offset，width和opts创建PixelMap对象newPixelMap
        *                 4.验证newPixelMap对象不为null
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
    */

    it('TC_001-3', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { alphaType: 2, editable: true, pixelFormat: 1, scaleMode: 1, size: { height: 2, width: 3 } }
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

    /* *
        * @tc.number    : TC_001-4
        * @tc.name      : create pixelmap object
        * @tc.desc      : 1.创建InitializationOptions对象opts
        *                 2.设置color，colorlength，offset，width，height，pixeFormat，alphyType
        *                 3.使用color，colorlength， offset，width和opts创建PixelMap对象newPixelMap
        *                 4.验证newPixelMap对象不为null
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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

    /* *
        * @tc.number    : TC_001-5
        * @tc.name      : create pixelmap object
        * @tc.desc      : 1.创建InitializationOptions对象opts
        *                 2.设置color，colorlength，offset，width，height，pixeFormat，alphyType
        *                 3.使用color，colorlength， offset，width和opts创建PixelMap对象newPixelMap
        *                 4.验证newPixelMap对象不为null
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
    */

    it('TC_001-5', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { alphaType: 3, editable: true, pixelFormat: 2, scaleMode: 1, size: { height: -1, width: -1 } }
        image.createPixelMap(Color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_001-5 success');
            done();
        })
        .catch(error => {
            console.log('TC_001-5 error: ' + error);
            expect().assertFail();
            done();
        })
    })

    /* *
        * @tc.number    : TC_020
        * @tc.name      : read Pixels To Buffer
        * @tc.desc      : read all pixels to an buffer
        *                 1.创建PixelMap，buffer
        *                 2.调用readPixelsToBuffer读取pixels
        *                 3.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
    */

    it('TC_020', 0, async function (done) {
        console.info('TC_020 in');
        const color = new ArrayBuffer(96);
        var bufferArr = new Uint8Array(color);
        for (var i = 0; i < bufferArr.length; i++) {
            bufferArr[i] = i + 1;
        }

        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts)
            .then( pixelmap => {
                console.info('TC_020 createPixelMap in');
                if (pixelmap == null) {
                    console.info('TC_020 createPixelMap failed');
                    expect(false).assertTrue()
                    done();
                }

                const readBuffer = new ArrayBuffer(96);
                pixelmap.readPixelsToBuffer(readBuffer).then (() => {
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
    
    /* *
        * @tc.number    : TC_020-1
        * @tc.name      : read Pixels To Buffer
        * @tc.desc      : read all pixels to an buffer
        *                 1.创建PixelMap，buffer
        *                 2.调用readPixelsToBuffer读取pixels
        *                 3.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
    */

    it('TC_020-1', 0, async function (done) {
        console.info('TC_020-1 in');
        const color = new ArrayBuffer(96);
        var bufferArr = new Uint8Array(color);
        for (var i = 0; i < bufferArr.length; i++) {
            bufferArr[i] = i + 1;
        }

        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
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

    /* *
        * @tc.number    : TC_020-2
        * @tc.name      : read Pixels To Buffer
        * @tc.desc      : read all pixels to an buffer
        *                 1.创建PixelMap，buffer
        *                 2.调用readPixelsToBuffer读取pixels
        *                 3.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
    */

    it('TC_020-2', 0, async function (done) {
        console.info('TC_020-2 in');
        const color = new ArrayBuffer(96);
        var bufferArr = new Uint8Array(color);
        for (var i = 0; i < bufferArr.length; i++) {
            bufferArr[i] = i + 1;
        }

        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
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
    
    /* *
         * @tc.number    : TC_021
         * @tc.name      : read Pixels
         * @tc.desc      : 1.创建PixelMap
         *                 2.调用readPixels
         *                 3.主动调用返回数组存储number类型值
         *                 4.callback调用返回空
         * @tc.size      : 
         * @tc.type      : Functional
         * @tc.level     : FWK Layer
    */

    it('TC_021', 0, async function (done) {
        const color = new ArrayBuffer(96);
        var bufferArr = new Uint8Array(color);
        for (var i = 0; i < bufferArr.length; i++) {
            bufferArr[i] = i + 1;
        }
        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
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

    /* *
         * @tc.number    : TC_021-1
         * @tc.name      : read Pixels
         * @tc.desc      : 1.创建PixelMap
         *                 2.调用readPixels
         *                 3.主动调用返回数组存储number类型值
         *                 4.callback调用返回空
         * @tc.size      : 
         * @tc.type      : Functional
         * @tc.level     : FWK Layer
    */

    it('TC_021-1', 0, async function (done) {
        const color = new ArrayBuffer(96);
        var bufferArr = new Uint8Array(color);
        for (var i = 0; i < bufferArr.length; i++) {
            bufferArr[i] = i + 1;
        }
        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_021-1 success');
            done();
        })
        const area = { pixels: new ArrayBuffer(20),
            offset: 0,
            stride: 8,
            region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
        }
        pixelmap.readPixels(area,() => {
            var bufferArr = new Uint8Array(area.pixels);
            var res = true;
             for (var i = 0; i < bufferArr.length; i++) {
                console.info('TC_021-1 buffer ' + bufferArr[i]);
                if(res) {
                    if (bufferArr[i] == 0) {
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
        })
        .catch(error => {
            console.log('TC_021-1 error: ' + error);
            expect().assertFail();
            done();
        })
    })

    /* *
         * @tc.number    : TC_021-2
         * @tc.name      : read Pixels
         * @tc.desc      : 1.创建PixelMap
         *                 2.调用readPixels
         *                 3.主动调用返回数组存储number类型值
         *                 4.callback调用返回空
         * @tc.size      : 
         * @tc.type      : Functional
         * @tc.level     : FWK Layer
    */

    it('TC_021-2', 0, async function (done) {
        const color = new ArrayBuffer(96);
        var bufferArr = new Uint8Array(color);
        for (var i = 0; i < bufferArr.length; i++) {
            bufferArr[i] = i + 1;
        }
        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_021-2 success');
            done();
        })
        const area = { pixels: new ArrayBuffer(20),
            offset: 0,
            stride: 8,
            region: { size: { height: 1, width: 2 }, x: -1, y: 0 }
        }
        pixelmap.readPixels(area,() => {
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
        })
        .catch(error => {
            console.log('TC_021-2 error: ' + error);
            expect().assertFail();
            done();
        })
    })

    /* *
         * @tc.number    : TC_021-3
         * @tc.name      : read Pixels
         * @tc.desc      : 1.创建PixelMap
         *                 2.调用readPixels
         *                 3.主动调用返回数组存储number类型值
         *                 4.callback调用返回空
         * @tc.size      : 
         * @tc.type      : Functional
         * @tc.level     : FWK Layer
    */

    it('TC_021-3', 0, async function (done) {
        const color = new ArrayBuffer(96);
        var bufferArr = new Uint8Array(color);
        for (var i = 0; i < bufferArr.length; i++) {
            bufferArr[i] = i + 1;
        }
        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_021-3 success');
            done();
        })
        const area = { pixels: new ArrayBuffer(0),
            offset: 0,
            stride: 8,
            region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
        }
        pixelmap.readPixels(area,() => {
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
        })
        .catch(error => {
            console.log('TC_021-3 error: ' + error);
            expect().assertFail();
            done();
        })
    })

    /* *
         * @tc.number    : TC_021-4
         * @tc.name      : read Pixels
         * @tc.desc      : 1.创建PixelMap
         *                 2.调用readPixels
         *                 3.主动调用返回数组存储number类型值
         *                 4.callback调用返回空
         * @tc.size      : 
         * @tc.type      : Functional
         * @tc.level     : FWK Layer
    */

    it('TC_021-4', 0, async function (done) {
        const color = new ArrayBuffer(96);
        var bufferArr = new Uint8Array(color);
        for (var i = 0; i < bufferArr.length; i++) {
            bufferArr[i] = i + 1;
        }
        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_021-4 success');
            done();
        })
        const area = { pixels: new ArrayBuffer(20),
            offset: 21,
            stride: 8,
            region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
        }
        pixelmap.readPixels(area,() => {
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
        })
        .catch(error => {
            console.log('TC_021-4 error: ' + error);
            expect().assertFail();
            done();
        })
    })

    /* *
         * @tc.number    : TC_021-5
         * @tc.name      : read Pixels
         * @tc.desc      : 1.创建PixelMap
         *                 2.调用readPixels
         *                 3.主动调用返回数组存储number类型值
         *                 4.callback调用返回空
         * @tc.size      : 
         * @tc.type      : Functional
         * @tc.level     : FWK Layer
    */

    it('TC_021-5', 0, async function (done) {
        const color = new ArrayBuffer(96);
        var bufferArr = new Uint8Array(color);
        for (var i = 0; i < bufferArr.length; i++) {
            bufferArr[i] = i + 1;
        }
        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_021-5 success');
            done();
        })
        const area = { pixels: new ArrayBuffer(20),
            offset: 0,
            stride: 8,
            region: { size: { height: -1, width:-1}, x: 0, y: 0 }
        }
        pixelmap.readPixels(area,() => {
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
        })
        .catch(error => {
            console.log('TC_021-5 error: ' + error);
            expect().assertFail();
            done();
        })
    })
    
    /* *
            * @tc.number    : TC_022
            * @tc.name      : write Pixels
            * @tc.desc      : 1.创建PixelMap
            *                 2.调用writePixels
            *                 3.主动调用返回空
            *                 4.callback调用返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
    */

    it('TC_022', 0, async function (done) {
        const color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
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

    /* *
            * @tc.number    : TC_022-1
            * @tc.name      : write Pixels
            * @tc.desc      : 1.创建PixelMap
            *                 2.调用writePixels
            *                 3.主动调用返回空
            *                 4.callback调用返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_022-1', 0, async function (done) {
        const color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
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

    /* *
            * @tc.number    : TC_023
            * @tc.name      : write Buffer To Pixels
            * @tc.desc      : 1.创建PixelMap，buffer
            *                 2.调用writeBufferToPixels
            *                 3.主动调用返回空
            *                 4.callback调用返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_023', 0, async function (done) {
        const color = new ArrayBuffer(96);
        var bufferArr = new Uint8Array(color);
        for (var i = 0; i < bufferArr.length; i++) {
            bufferArr[i] = i;
        }
        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 }}
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
                    pixelmap.readPixelsToBuffer(readBuffer).then (() => {
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

    /* *
            * @tc.number    : TC_023-1
            * @tc.name      : write Buffer To Pixels
            * @tc.desc      : 1.创建PixelMap，buffer
            *                 2.调用writeBufferToPixels
            *                 3.主动调用返回空
            *                 4.callback调用返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_023-1', 0, async function (done) {
        const color = new ArrayBuffer(96);
        var bufferArr = new Uint8Array(color);
        for (var i = 0; i < bufferArr.length; i++) {
            bufferArr[i] = i;
        }
        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
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

    /* *
            * @tc.number    : TC_024
            * @tc.name      : get Image In fo
            * @tc.desc      : 1.创建PixelMap，ImageInfo
            *                 2.调用getImageInfo
            *                 3.主动调用返回imageinfo
            *                 4.callback返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_024', 0, async function (done) {
        const color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
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
                        expect(imageInfo.pixelFormat == 4).assertTrue();
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
    
    /* *
        * @tc.number    : TC_024-1
        * @tc.name      : get Image In fo
        * @tc.desc      : 1.创建PixelMap，ImageInfo
        *                 2.调用getImageInfo
        *                 3.主动调用返回imageinfo
        *                 4.callback返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
        */

    it('TC_024-1', 0, async function (done) {
        const color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
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
    
    /* *
        * @tc.number    : TC_025
        * @tc.name      : get Bytes Number PerRow
        * @tc.desc      : 1.创建PixelMap
        *                 2.写入PixelMap
        *                 3.调用getBytesNumberPerRow
        *                 4.主动调用返回number类型值
        *                 5.callback返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
        */

    it('TC_025', 0, async function (done) {
        const color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
        const expectNum = opts.pixelFormat * opts.size.width;
        image.createPixelMap(color, opts)
            .then( pixelmap => {
                if (pixelmap == null) {
                    console.info('TC_025 createPixelMap failed');
                    expect(false).assertTrue()
                    done();
                }
                pixelmap.getBytesNumberPerRow().then( num => {
                    console.info('TC_025 num is ' + num);
                    expect(num == expectNum).assertTrue();
                    done();
                })
            })
            .catch(error => {
                console.log('TC_025 error: ' + error);
                expect().assertFail();
                done();
            })
    })

    /* *
            * @tc.number    : TC_025-1
            * @tc.name      : get Bytes Number PerRow
            * @tc.desc      : 1.创建PixelMap
            *                 2.写入PixelMap
            *                 3.调用getBytesNumberPerRow
            *                 4.主动调用返回number类型值
            *                 5.callback返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_025-1', 0, async function (done) {
        const color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
        const expectNum = opts.pixelFormat * opts.size.width;
        image.createPixelMap(color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_25-1 success');
            done();
        })
        pixelmap.getBytesNumberPerRow( num => {
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

    /* *
            * @tc.number    : TC_026
            * @tc.name      : get Pixel Bytes Number
            * @tc.desc      : 1.创建PixelMap
            *                 2.写入Pixel
            *                 3.调用getPixelBytesNumber
            *                 4.主动调用返回number类型值
            *                 5.callback返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_026', 0, async function (done) {
        const color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
        const expectNum = opts.pixelFormat * opts.size.width * opts.size.height;
        image.createPixelMap(color, opts)
            .then( pixelmap => {
                if (pixelmap == null) {
                    console.info('TC_026 createPixelMap failed');
                    expect(false).assertTrue()
                    done();
                }
                pixelmap.getPixelBytesNumber().then( num => {
                    console.info('TC_026 num is ' + num);
                    expect(num == expectNum).assertTrue();
                    done();
                })
            })
            .catch(error => {
                console.log('TC_026 error: ' + error);
                expect().assertFail();
                done();
            })
    })

    /* *
            * @tc.number    : TC_026-1
            * @tc.name      : get Pixel Bytes Number
            * @tc.desc      : 1.创建PixelMap
            *                 2.写入Pixel
            *                 3.调用getPixelBytesNumber
            *                 4.主动调用返回number类型值
            *                 5.callback返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_026-1', 0, async function (done) {
        const color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
        const expectNum = opts.pixelFormat * opts.size.width * opts.size.height;
        image.createPixelMap(color, opts,pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_026-1 success');
            done();
        })
        pixelmap.getPixelBytesNumber(num => {
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

    /* *
            * @tc.number    : TC_027
            * @tc.name      : release
            * @tc.desc      : 1.创建PixelMap
            *                 2.写入Pixel
            *                 3.调用release
            *                 4.判断释放成功，返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_027', 0, async function (done) {
        const color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts)
            .then( pixelmap => {
                if (pixelmap == null) {
                    console.info('TC_027 createPixelMap failed');
                    expect(false).assertTrue()
                    done();
                }

                pixelmap.release();
                expect(true).assertTrue();
                done();
            })
            .catch(error => {
                console.log('TC_027 error: ' + error);
                expect().assertFail();
                done();
            })
    })
    
    /* *
            * @tc.number    : TC_027-1 
            * @tc.name      : release(callback)
            * @tc.desc      : 1.创建PixelMap
            *                 2.写入Pixel
            *                 3.调用release
            *                 4.判断释放成功，返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_027-1', 0, async function (done) {
        const color = new ArrayBuffer(96);
        let opts = { alphaType: 0, editable: true, pixelFormat: 3, scaleMode: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts, pixelmap => {
            expect(pixelmap !== null).assertTrue();
            console.info('TC_026-1 success');
            done();
        })
        pixelmap.release(()=>{
            expect(true).assertTrue();
            console.log('TC_027-1 suc');
            done();
        })    
        .catch(error => {
            console.log('TC_027-1 error: ' + error);
            expect().assertFail();
            done();
        })
    })
    
    /* *
            * @tc.number    : TC_041
            * @tc.name      : create Image Source(uri)
            * @tc.desc      : 1.输入uri
            *                 2.调用createImageSource(uri)
            *                 3.返回imagesource
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_041', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_041 finished');
        done();
    })

    /* *
            * @tc.number    : TC_041-1
            * @tc.name      : create Image Source(uri)
            * @tc.desc      : 1.输入uri
            *                 2.调用createImageSource(uri)
            *                 3.返回imagesource
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_041-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_041-1 finished');
        done();
    })

    /* *
            * @tc.number    : TC_041-2
            * @tc.name      : create Image Source(uri)
            * @tc.desc      : 1.输入uri
            *                 2.调用createImageSource(uri)
            *                 3.返回imagesource
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_041-2', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_041-2 finished');
        done();
    })

    /* *
            * @tc.number    : TC_041-3
            * @tc.name      : create Image Source(uri)
            * @tc.desc      : 1.输入uri
            *                 2.调用createImageSource(uri)
            *                 3.返回imagesource
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_041-3', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_041-3 finished');
        done();
    })

    /* *
            * @tc.number    : TC_041-4
            * @tc.name      : create Image Source(uri)
            * @tc.desc      : 1.调用createImageSource(uri)
            *                 2.传入错误后缀文件
            *                 3.imagesource空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_041-4', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.tif');
        expect(imageSourceApi == null).assertTrue();
        console.info('TC_041-4 finished');
        done();
    })

    /* *
            * @tc.number    : TC_041-5
            * @tc.name      : create Image Source(uri)
            * @tc.desc      : 1.调用createImageSource(uri)
            *                 2.输入错误uri
            *                 3.imagesource空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_041-5', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/multiedia/test.jpg');
        expect(imageSourceApi == null).assertTrue();
        console.info('TC_041-5 finished');
        done();
    })

    /* *
            * @tc.number    : TC_042
            * @tc.name      : create Image Source(fd)
            * @tc.desc      : 1.调用createImageSource
            *                 2.传入fd
            *                 3.返回imagesource
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_042', 0, async function (done) {
        const imageSourceApi = image.createImageSource(29);
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_042 finished');
        done();
    })

    /* *
            * @tc.number    : TC_042-1 
            * @tc.name      : create Image Source(fd) bmp
            * @tc.desc      : 1.调用createImageSource
            *                 2.传入fd
            *                 3.返回imagesource
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_042-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource(30);
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_042-1 finished');
        done();
    })

    /* *
            * @tc.number    : TC_042-2 
            * @tc.name      : create Image Source(fd) png
            * @tc.desc      : 1.调用createImageSource
            *                 2.传入fd
            *                 3.返回imagesource
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_042-2', 0, async function (done) {
        const imageSourceApi = image.createImageSource(28);
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_042-2 finished');
        done();
    })

    /* *
            * @tc.number    : TC_042-3
            * @tc.name      : create Image Source(fd)  gif
            * @tc.desc      : 1.调用createImageSource
            *                 2.传入fd
            *                 3.返回imagesource
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_042-3', 0, async function (done) {
        const imageSourceApi = image.createImageSource(27);
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_042-3 finished');
        done();
    })

    /* *
            * @tc.number    : TC_042-4
            * @tc.name      : create Image Source(fd)
            * @tc.desc      : 1.调用createImageSource
            *                 2.传入fd
            *                 3.返回imagesource
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_042-4', 0, async function (done) {
        const imageSourceApi = image.createImageSource(-2);
        expect(imageSourceApi == null).assertTrue();
        console.info('TC_042-4 finished');
        done();
    })

    /* *
            * @tc.number    : TC_042-5
            * @tc.name      : create Image Source(fd)
            * @tc.desc      : 1.调用createImageSource
            *                 2.传入fd
            *                 3.返回imagesource
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_042-5', 0, async function (done) {
        const imageSourceApi = image.createImageSource(-2);
        if(imageSourceApi == null){
            console.info('TC_042-5 success');
            expect(true).assertTrue();
            done();
        }else{
            console.info('TC_042-5 fail');
            expect(false).assertTrue();
            done();
        }
    })

    /* *
            * @tc.number    : TC_043
            * @tc.name      : create Image Source(data)
            * @tc.desc      : 1.输入data
            *                 2.createImageSource
            *                 3.返回imagesource
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_043', 0, async function (done) {
        console.info('TC_043 start');
        const data = new ArrayBuffer(96);
        const imageSourceApi = image.createImageSource(data);
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_043 finished');
        done();
    })

    /* *
            * @tc.number    : TC_043-1
            * @tc.name      : create Image Source(data) bmp
            * @tc.desc      : 1.输入data
            *                 2.createImageSource
            *                 3.返回imagesource
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_043-1', 0, async function (done) {
        console.info('TC_043-1 start');
        const data = new ArrayBuffer(104);
        const imageSourceApi = image.createImageSource(data);
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_043-1 finished');
        done();
    })

    /* *
            * @tc.number    : TC_043-2
            * @tc.name      : create Image Source(data) png
            * @tc.desc      : 1.输入data
            *                 2.createImageSource
            *                 3.返回imagesource
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_043-2', 0, async function (done) {
        console.info('TC_043-2 start');
        const data = new ArrayBuffer(112);
        const imageSourceApi = image.createImageSource(data);
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_043-2 finished');
        done();
    })

    /* *
            * @tc.number    : TC_043-3
            * @tc.name      : create Image Source(data) gif
            * @tc.desc      : 1.输入data
            *                 2.createImageSource
            *                 3.返回imagesource
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_043-3', 0, async function (done) {
        console.info('TC_043-3 start');
        const data = new ArrayBuffer(112);
        const imageSourceApi = image.createImageSource(data);
        expect(imageSourceApi !== null).assertTrue();
        console.info('TC_043-3 finished');
        done();
    })
    
    /* *
        * @tc.number    : TC_043-4
        * @tc.name      : create Image Source(data) 
        * @tc.desc      : 1.输入data
        *                 2.createImageSource
        *                 3.返回imagesource
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
        */

    it('TC_043-4', 0, async function (done) {
        console.info('TC_043-4 start');
        const data = new ArrayBuffer(0);
        const imageSourceApi = image.createImageSource(data);
        expect(imageSourceApi == null).assertTrue();
        console.info('TC_043-4 finished');
        done();
    })

    /* *
        * @tc.number    : TC_044
        * @tc.name      : release()  promise
        * @tc.desc      : 1.创建ImageSource
        *                 2.调用release()
        *                 3.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
        */
    it('TC_044', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_044 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.release();
            console.info('TC_044 release');
            expect(true).assertTrue();
            done();
        }
    })

    /* *
            * @tc.number    : TC_044-1
            * @tc.name      : release()  callback
            * @tc.desc      : 1.创建ImageSource
            *                 2.调用release()
            *                 3.callback时返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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
        // if (imageSourceApi == null) {
        //     console.info('TC_044 create image source failed');
        //     expect(false).assertTrue();
        //     done();
        // } else {
        //     imageSourceApi.release(() => {
        //         console.info('TC_044 Success1');
        //         expect(true).assertTrue();
        //         done();
        //     })
        //     onsole.info('TC_044 Success2');
        //     expect(true).assertTrue();
        //     done();
        // }
    })
    
    /* *
            * @tc.number    : TC_045
            * @tc.name      : get Image Info（ImageInfo）
            * @tc.desc      : 1.创建imageSource
            *                 2.imageSource调用getImageInfo（ImageInfo）
            *                 3.回调返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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

    /* *
            * @tc.number    : TC_045-1
            * @tc.name      : get Image Info（ImageInfo） bmp
            * @tc.desc      : 1.创建imageSource
            *                 2.imageSource调用getImageInfo（ImageInfo）
            *                 3.回调返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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

    /* *
            * @tc.number    : TC_045-2
            * @tc.name      : get Image Info（ImageInfo） png
            * @tc.desc      : 1.创建imageSource
            *                 2.imageSource调用getImageInfo（ImageInfo）
            *                 3.回调返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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

    /* *
            * @tc.number    : TC_045-3
            * @tc.name      : get Image Info（index, ImageInfo)
            * @tc.desc      : 1.创建ImageInfo
            *                 2.调用getImageInfo（index, ImageInfo)
            *                 3.回调返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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

    /* *
            * @tc.number    : TC_046
            * @tc.name      : get Image Info（index, ImageInfo)
            * @tc.desc      : 1.创建ImageInfo
            *                 2.调用getImageInfo（index, ImageInfo)
            *                 3.回调返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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

    /* *
            * @tc.number    : TC_046-1
            * @tc.name      : get Image Info（index, ImageInfo)
            * @tc.desc      : 1.创建ImageInfo
            *                 2.调用getImageInfo（index, ImageInfo)
            *                 3.回调返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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

    /* *
        * @tc.number: TC_046-2
        * @tc.name  : get Image Info（index, ImageInfo)
        * @tc.desc  : 1.创建ImageInfo
        *             2.调用getImageInfo（index, ImageInfo)
        *             3.回调返回空
        * @tc.size  : 
        * @tc.type  : Functional
        * @tc.level : FWK Layer
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

    /* *
        * @tc.number: TC_046-3
        * @tc.name  : get Image Info（index, ImageInfo)
        * @tc.desc  : 1.创建ImageInfo
        *             2.调用getImageInfo（index, ImageInfo)
        *             3.回调返回空
        * @tc.size  : 
        * @tc.type  : Functional
        * @tc.level : FWK Layer
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

    /* *
        * @tc.number: TC_046-4
        * @tc.name  : get Image Info（index, ImageInfo)
        * @tc.desc  : 1.创建ImageInfo
        *             2.调用getImageInfo（index, ImageInfo)
        *             3.回调返回空
        * @tc.size  : 
        * @tc.type  : Functional
        * @tc.level : FWK Layer
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

    /* *
        * @tc.number: TC_046-5
        * @tc.name  : get Image Info（index, ImageInfo)
        * @tc.desc  : 1.创建ImageInfo
        *             2.调用getImageInfo（index, ImageInfo)
        *             3.回调返回空
        * @tc.size  : 
        * @tc.type  : Functional
        * @tc.level : FWK Layer
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

    /* *
            * @tc.number    : TC_047
            * @tc.name      : get Image Info(index) 返回Image Info
            * @tc.desc      : 1.创建imagesource
            *                 2.调用getImageInfo(index)
            *                 3.callback调用，返回imageinfo
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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
   
    /* *
            * @tc.number    : TC_047-1
            * @tc.name      : get Image Info(index) 返回Image Info
            * @tc.desc      : 1.创建imagesource
            *                 2.调用getImageInfo(index)
            *                 3.callback调用，返回imageinfo
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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
   
    /* *
            * @tc.number    : TC_047-2
            * @tc.name      : get Image Info(index) 返回Image Info
            * @tc.desc      : 1.创建imagesource
            *                 2.调用getImageInfo(index)
            *                 3.callback调用，返回imageinfo
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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

    /* *
            * @tc.number    : TC_047-3
            * @tc.name      : get Image Info(index) 返回Image Info
            * @tc.desc      : 1.创建imagesource
            *                 2.调用getImageInfo(index)
            *                 3.callback调用，返回imageinfo
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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

    /* *
        * @tc.number: TC_047-4
        * @tc.name  : get Image Info(index) 返回Image Info
        * @tc.desc  : 1.创建imagesource
        *             2.调用getImageInfo(index=1)
        *             3.callback imageinfo空
        * @tc.size  : 
        * @tc.type  : Functional
        * @tc.level : FWK Layer
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
    
    /* *
            * @tc.number    : TC_047-5
            * @tc.name      : get Image Info(index) 返回Image Info
            * @tc.desc      : 1.创建imagesource
            *                 2.调用getImageInfo(index=-1)
            *                 3.callback imageinfo空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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
                console.info('TC_047-5 suc');
                done();
            })
        }
    })

    /* *
            * @tc.number    : TC_048
            * @tc.name      : get Image Property Int获取Exif信息
            * @tc.desc      : 1.创建imagesource
            *                 2.调用getImagePropertyInt
            *                 3.传入参数（index,key，value）
            *                 4.返回number类型属性值
            *                 5.callback返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    //it('TC_048', 0, async function (done) {
     //   const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
     //   if (imageSourceApi == null) {
     //       console.info('TC_048 create image source failed');
      //      expect(false).assertTrue();
     //       done();
     //   } else {
     //       imageSourceApi.getImagePropertyInt(0, "ImageHeight", -1)
     //       .then(height => {
      //          console.info('TC_048 height ' + height);
      //          expect(height !== -1).assertTrue();
      //          done();
      //      })
      //  }
   // })

    /* *
            * @tc.number    : TC_048-1 callback
            * @tc.name      : get Image Property Int获取Exif信息
            * @tc.desc      : 1.创建imagesource
            *                 2.调用getImagePropertyInt
            *                 3.传入参数（index,key，value）
            *                 4.返回number类型属性值
            *                 5.callback返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

   // it('TC_048-1', 0, async function (done) {
    //    const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
    //    if (imageSourceApi == null) {
    //        console.info('TC_048 create image source failed');
    //        expect(false).assertTrue();
    //        done();
    //    } else {
    //        imageSourceApi.getImagePropertyInt(0, "ImageHeight", -1,height => {
    //            console.info('TC_048 height ' + height);
    //            expect(height !== -1).assertTrue();
    //            done();
    //        })
    //    }
   // })
        
    /* *
            * @tc.number    : TC_049
            * @tc.name      : get Image Property String获取Exif信息
            * @tc.desc      : 1.创建PixelMap
            *                 2.创建ImageInfo
            *                 3.传入索引、key和value
            *                 4.调用getImagePropertyString
            *                 5.判断获取的信息和输入的是否一致，返回string类型属性值
            *                 6.回调返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

   // it('TC_049', 0, async function (done) {
    //    const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
    //    if (imageSourceApi == null) {
    //        console.info('TC_049 create image source failed');
    //        expect(false).assertTrue();
     //       done();
    //    } else {
    //        imageSourceApi.getImagePropertyString(0, "GPSAltitude")
    //        .then(gps => {
    //            console.info('TC_049 GPSAltitude' + gps);
    //            expect(gps !== null && gps.length > 0).assertTrue();
    //            done();
    //        })
    //    }
   // })

    /* *
            * @tc.number    : TC_049-1 callback
            * @tc.name      : get Image Property String获取Exif信息
            * @tc.desc      : 1.创建PixelMap
            *                 2.创建ImageInfo
            *                 3.传入索引、key和value
            *                 4.调用getImagePropertyString
            *                 5.判断获取的信息和输入的是否一致，返回string类型属性值
            *                 6.回调返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    //it('TC_049-1', 0, async function (done) {
    //    const imageSourceApi = image.createImageSource('/data/local/tmp/test_exif.jpg');
    //    if (imageSourceApi == null) {
    //        console.info('TC_049 create image source failed');
    //        expect(false).assertTrue();
    //        done();
    //    } else {
    //        imageSourceApi.getImagePropertyString(0, "GPSAltitude",gps => {
    //            console.info('TC_049 GPSAltitude' + gps);
    //            expect(gps !== null && gps.length > 0).assertTrue();
    //            done();
    //        })
    //    }
    //})
        
    /* *
            * @tc.number    : TC_050
            * @tc.name      : create PixelMap对图片进行解码生成位图
            * @tc.desc      : 1.创建PixelMap
            *                 2.创建imagesource
            *                 3.确定index和DecodeOptions作为参数
            *                 4.调用createPixelMap
            *                 5.callback返回空
            *                 6.当传入参数为DecodeOptions时
            *                 7.callback返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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
                rotateDegrees:10,
                desiredPixelFormat:2,
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

    /* *
            * @tc.number    : TC_050-1
            * @tc.name      : create PixelMap对图片进行解码生成位图
            * @tc.desc      : 1.创建imagesource
            *                 2.设置解码区域
            *                 3.调用createPixelMap
            *                 4.传入指定index，options
            *                 5.返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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
                rotateDegrees:10,
                desiredPixelFormat:1,
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

    /* *
            * @tc.number    : TC_050-2
            * @tc.name      : create PixelMap对图片进行解码生成位图  jpg
            * @tc.desc      : 1.创建imagesource
            *                 2.设置解码区域
            *                 3.调用createPixelMap
            *                 4.传入指定index，options
            *                 5.返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
            * @tc.number    : TC_050-3
            * @tc.name      : create PixelMap对图片进行解码生成位图  jpg
            * @tc.desc      : 1.创建imagesource
            *                 2.设置解码区域
            *                 3.调用createPixelMap
            *                 4.传入指定index，options
            *                 5.返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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
     * @tc.name      : create PixelMap对图片进行解码生成位图  jpg
     * @tc.desc      : 1.创建imagesource
     *                 2.设置解码区域
     *                 3.调用createPixelMap
     *                 4.传入指定index，options
     *                 5.返回空
     * @tc.size      : 
     * @tc.type      : Functional
     * @tc.level     : FWK Layer
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
                rotateDegrees:-10,
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
     * @tc.name      : create PixelMap对图片进行解码生成位图  jpg
     * @tc.desc      : 1.创建imagesource
     *                 2.设置解码区域
     *                 3.调用createPixelMap
     *                 4.传入指定index，options
     *                 5.返回空
     * @tc.size      : 
     * @tc.type      : Functional
     * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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
     * @tc.name      : create PixelMap对图片进行解码生成位图  jpg
     * @tc.desc      : 1.创建imagesource
     *                 2.设置解码区域
     *                 3.调用createPixelMap
     *                 4.传入指定index，options
     *                 5.返回空
     * @tc.size      : 
     * @tc.type      : Functional
     * @tc.level     : FWK Layer              
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
                rotateDegrees:-10,
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

    /* *
            * @tc.number    : TC_050-7
            * @tc.name      : create PixelMap对图片进行解码生成位图  jpg
            * @tc.desc      : 1.创建imagesource
            *                 2.设置解码区域
            *                 3.调用createPixelMap
            *                 4.传入指定index，options
            *                 5.返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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
                rotateDegrees:-10,
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

    /* *
            * @tc.number    : TC_050-8
            * @tc.name      : create PixelMap对图片进行解码生成位图  jpg
            * @tc.desc      : 1.创建imagesource
            *                 2.设置解码区域
            *                 3.调用createPixelMap
            *                 4.传入指定index，options
            *                 5.返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
            * @tc.number    : TC_050-9
            * @tc.name      : create PixelMap对图片进行解码生成位图  jpg
            * @tc.desc      : 1.创建imagesource
            *                 2.设置解码区域
            *                 3.调用createPixelMap
            *                 4.传入指定index，options
            *                 5.返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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
        
    /* *
        * @tc.number    : TC_050-10
        * @tc.name      : create PixelMap对图片进行解码生成位图  jpg
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入指定index，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
            * @tc.number    : TC_051
            * @tc.name      : create PixelMap对图片进行区域解码生成位图
            * @tc.desc      : 1.创建imagesource
            *                 2.设置解码区域
            *                 3.调用createPixelMap
            *                 4.传入index，options
            *                 5.返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

   // it('TC_051', 0, async function (done) {
    //    const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
   //     if (imageSourceApi == null) {
   //         console.info('TC_051 create image source failed');
   //         expect(false).assertTrue();
   //         done();
   //     } else {
   //         let decodingOptions = {
   //             sampleSize:1
    //        };
    //        imageSourceApi.createPixelMap(0, decodingOptions, pixelmap => {
    //            console.info('TC_051 createPixelMap ');
    //            expect(pixelmap !== null ).assertTrue();
    //            done();
     //       })
     //   }
   // })
    
    /* *
        * @tc.number    : TC_052
        * @tc.name      : create Incremental Source(data)进行渐进式解码
        * @tc.desc      : 1.创建 IncrementalSourceOptions
        *                 2.incrementalMode设为INCREMENTAL_DATA
        *                 3.调用createIncrementalSource(data)
        *                 4.返回imagesource
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
        */

    it('TC_052', 0, async function (done) {
        const data = new ArrayBuffer(96);
        const imageSourceApi = image.createIncrementalSource(data);
        console.info('TC_052 create Incremental Source');
        expect(imageSourceApi !== null).assertTrue();
        done();
    })
                    
    /* *
            * @tc.number    : TC_053
            * @tc.name      : update Data更新数据 promise
            * @tc.desc      : 1.创建imagesource
            *                 2.创建sourceStreamPtr_
            *                 3.调用UpdateData(data, isFinal, offset,length)
            *                 4.主动调用时返回布尔值
            *                 5.传入参数为（data, isFinal, offset,length）时
            *                 6.callback调用返回空
            *                 7.传入参数为（data, isFinal）时
            *                 8.callback返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_053', 0, async function (done) {
        const dataBuffer = new ArrayBuffer(96);
        const imageSourceIncrementalSApi = image.createIncrementalSource(dataBuffer);
        let array = [1,2,3,4,5,6,7,8,9,10];
        imageSourceIncrementalSApi.updateData(array, false, 0, 10).then(data => {
            expect(data).assertTrue();
            console.info('TC_053 success');
            done();
        })
    })

    /* *
            * @tc.number    : TC_053-1
            * @tc.name      : update Data更新数据  callback
            * @tc.desc      : 1.创建imagesource
            *                 2.调用UpdateData(data, isFinal, offset,length)
            *                 3.callback调用返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_053-1', 0, async function (done) {
        const dataBuffer = new ArrayBuffer(96);
        const imageSourceIncrementalSApi = image.createIncrementalSource(dataBuffer);
        let array = [1,2,3,4,5,6,7,8,9,10];
        imageSourceIncrementalSApi.updateData(array, false, 0, 10,(error,data )=> {
            if(data !== undefined){
                expect(data).assertTrue();
                console.info('TC_053-1 success');
                done();      
            }else{
                console.info('TC_053-1 create image source failed');
                expect(false).assertTrue();
                done(); 
            }    
        })
    })
    
    /* *
            * @tc.number    : TC_053-2
            * @tc.name      : update Data更新渐进式数据 callback
            * @tc.desc      : 1.创建imagesource
            *                 2.调用UpdateData(data, isFinal)
            *                 3.callback调用返回空 
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_053-2', 0, async function (done) {
        const dataBuffer = new ArrayBuffer(96);
        const imageSourceIncrementalSApi = image.createIncrementalSource(dataBuffer);
        let array = [1,2,3,4,5,6,7,8,9,10];
        imageSourceIncrementalSApi.updateData(array, false,(error,data) => {
            if(data !== undefined){
                expect(data).assertTrue();
                console.info('TC_053-2 success');
                done();      
            }else{
                console.info('TC_053-2 create image source failed');
                expect(false).assertTrue();
                done(); 
            }    
        })
    })

    /* *
            * @tc.number    : TC_062
            * @tc.name      : packing打包ImageSource对象
            * @tc.desc      : 1.创建ImageSource
            *                 2.调用packing
            *                 3.主动调用返回数组存储number类型值
            *                 4.callback调用返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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

    /* *
            * @tc.number    : TC_062-1 
            * @tc.name      : packing打包ImageSource对象(callback)
            * @tc.desc      : 1.创建ImageSource
            *                 2.调用packing
            *                 3.主动调用返回数组存储number类型值
            *                 4.callback调用返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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

    /* *
            * @tc.number    : TC_062-2
            * @tc.name      : packing打包ImageSource对象
            * @tc.desc      : 1.创建ImageSource
            *                 2.调用packing
            *                 3.主动调用返回数组存储number类型值
            *                 4.callback调用返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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

    /* *
            * @tc.number    : TC_062-3
            * @tc.name      : packing打包ImageSource对象
            * @tc.desc      : 1.创建ImageSource
            *                 2.调用packing
            *                 3.主动调用返回数组存储number类型值
            *                 4.callback调用返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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

    /* *
            * @tc.number    : TC_063
            * @tc.name      : release释放ImagePacker实例
            * @tc.desc      : 1.创建ImagePacker
            *                 2.调用release
            *                 3.返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_063', 0, async function (done) {
        const imagePackerApi = image.createImagePacker();
        if (imagePackerApi == null) {
            console.info('TC_063 create image packer failed');
            expect(false).assertTrue();
            done();
        } else {
            imagePackerApi.release();
            console.info('TC_063 release');
            expect(true).assertTrue();
            done();
        }
    })

    /* *
            * @tc.number    : TC_063-1 
            * @tc.name      : release释放ImagePacker实例 callback
            * @tc.desc      : 1.创建ImagePacker
            *                 2.调用release
            *                 3.返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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

    /* *
            * @tc.number    : TC_064
            * @tc.name      : release()  
            * @tc.desc      : 1.创建ImageSource
            *                 2.创建SourceStream
            *                 3.调用release()
            *                 4.主动调用时返回空
            *                 5.callback时返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
    it('TC_064', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.png');
        if (imageSourceApi == null) {
            console.info('TC_064 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.release();
            console.info('TC_064 release');
            expect(true).assertTrue();
            done();
        }
    })

    /* *
            * @tc.number    : TC_064-1  callback
            * @tc.name      : release()
            * @tc.desc      : 1.创建ImageSource
            *                 2.创建SourceStream
            *                 3.调用release()
            *                 4.主动调用时返回空
            *                 5.callback时返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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

    /* *
            * @tc.number    : TC_065
            * @tc.name      : release() bmp promise
            * @tc.desc      : 1.创建ImageSource
            *                 2.创建SourceStream
            *                 3.调用release()
            *                 4.主动调用时返回空
            *                 5.callback时返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
    it('TC_065', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.bmp');
    if (imageSourceApi == null) {
        console.info('TC_065 create image source failed');
        expect(false).assertTrue();
        done();
    } else {
            imageSourceApi.release();
            console.info('TC_065 release');
            expect(true).assertTrue();
            done();
        }
    })

    /* *
            * @tc.number    : TC_065-1 bmp callback
            * @tc.name      : release()
            * @tc.desc      : 1.创建ImageSource
            *                 2.创建SourceStream
            *                 3.调用release()
            *                 4.主动调用时返回空
            *                 5.callback时返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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

    /* *
            * @tc.number    : TC_066
            * @tc.name      : release() gif promise
            * @tc.desc      : 1.创建ImageSource
            *                 2.创建SourceStream
            *                 3.调用release()
            *                 4.主动调用时返回空
            *                 5.callback时返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

    it('TC_066', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.gif');
        if (imageSourceApi == null) {
        console.info('TC_066 create image source failed');
        expect(false).assertTrue();
        done();
    } else {
            imageSourceApi.release();
            console.info('TC_066 release');
            expect(true).assertTrue();
            done();
        }
    })

    /* *
            * @tc.number    : TC_066-1 gif callback
            * @tc.name      : release()
            * @tc.desc      : 1.创建ImageSource
            *                 2.创建SourceStream
            *                 3.调用release()
            *                 4.主动调用时返回空
            *                 5.callback时返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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
            })
        }
    })

    /* *
            * @tc.number    : TC_067
            * @tc.name      : create PixelMap对图片进行解码生成位图  gif
            * @tc.desc      : 1.创建imagesource
            *                 2.设置解码区域
            *                 3.调用createPixelMap
            *                 4.传入指定index，options
            *                 5.返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
            * @tc.number    : TC_067-1
            * @tc.name      : create PixelMap对图片进行解码生成位图
            * @tc.desc      : 1.创建imagesource
            *                 2.设置解码区域
            *                 3.调用createPixelMap
            *                 4.传入指定index，options
            *                 5.返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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
                rotateDegrees:10,
                desiredPixelFormat:1,
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

    /* *
            * @tc.number    : TC_067-2
            * @tc.name      : create PixelMap对图片进行解码生成位图  gif
            * @tc.desc      : 1.创建imagesource
            *                 2.设置解码区域
            *                 3.调用createPixelMap
            *                 4.传入指定index，options
            *                 5.返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
            * @tc.number    : TC_067-3
            * @tc.name      : create PixelMap对图片进行解码生成位图
            * @tc.desc      : 1.创建imagesource
            *                 2.设置解码区域
            *                 3.调用createPixelMap
            *                 4.传入指定index，options
            *                 5.返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
            * @tc.number    : TC_067-4
            * @tc.name      : create PixelMap对图片进行解码生成位图
            * @tc.desc      : 1.创建imagesource
            *                 2.设置解码区域
            *                 3.调用createPixelMap
            *                 4.传入指定index，options
            *                 5.返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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
                rotateDegrees:-10,
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

    /* *
            * @tc.number    : TC_067-5
            * @tc.name      : create PixelMap对图片进行解码生成位图
            * @tc.desc      : 1.创建imagesource
            *                 2.设置解码区域
            *                 3.调用createPixelMap
            *                 4.传入指定index，options
            *                 5.返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
            * @tc.number    : TC_067-6
            * @tc.name      : create PixelMap对图片进行解码生成位图
            * @tc.desc      : 1.创建imagesource
            *                 2.设置解码区域
            *                 3.调用createPixelMap
            *                 4.传入指定index，options
            *                 5.返回空
            * @tc.size      : 
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
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
                rotateDegrees:-10,
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

    /* *
        * @tc.number    : TC_067-7
        * @tc.name      : create PixelMap对图片进行解码生成位图
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入指定index，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:-10,
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

    /* *
        * @tc.number    : TC_067-8
        * @tc.name      : create PixelMap对图片进行解码生成位图
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入指定index，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
        * @tc.number    : TC_067-9
        * @tc.name      : create PixelMap对图片进行解码生成位图
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入指定index，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
        * @tc.number    : TC_067-10
        * @tc.name      : create PixelMap对图片进行解码生成位图
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入指定index，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
        * @tc.number    : TC_068
        * @tc.name      : create PixelMap对图片进行解码生成位图  bmp
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入指定index，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
        * @tc.number    : TC_068-1
        * @tc.name      : create PixelMap对图片进行解码生成位图
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入指定index，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
                desiredPixelFormat:1,
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

    /* *
        * @tc.number    : TC_068-2
        * @tc.name      : create PixelMap对图片进行解码生成位图  bmp
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入指定index，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
        * @tc.number    : TC_068-3
        * @tc.name      : create PixelMap对图片进行解码生成位图  bmp
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入指定index，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
        * @tc.number    : TC_068-4
        * @tc.name      : create PixelMap对图片进行解码生成位图  bmp
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入指定index，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:-10,
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

    /* *
        * @tc.number    : TC_068-5
        * @tc.name      : create PixelMap对图片进行解码生成位图  bmp
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入指定index，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
        * @tc.number    : TC_068-6
        * @tc.name      : create PixelMap对图片进行解码生成位图  bmp
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入指定index，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:-10,
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

    /* *
        * @tc.number    : TC_068-7
        * @tc.name      : create PixelMap对图片进行解码生成位图  bmp
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入指定index，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:-10,
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

    /* *
        * @tc.number    : TC_068-8
        * @tc.name      : create PixelMap对图片进行解码生成位图  bmp
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入指定index，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
        * @tc.number    : TC_068-9
        * @tc.name      : create PixelMap对图片进行解码生成位图  bmp
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入指定index，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
        * @tc.number    : TC_068-10
        * @tc.name      : create PixelMap对图片进行解码生成位图  bmp
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入指定index，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
        * @tc.number    : TC_163
        * @tc.name      : create PixelMap对图片进行解码生成位图  png
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入指定index，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
        * @tc.number    : TC_163-1
        * @tc.name      : create PixelMap对图片进行解码生成位图 bmp
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入指定index，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
                desiredPixelFormat:1,
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

    /* *
        * @tc.number    : TC_163-2
        * @tc.name      : create PixelMap对图片进行解码生成位图  png
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入index=-1，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
        * @tc.number    : TC_163-3
        * @tc.name      : create PixelMap对图片进行解码生成位图  png
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入index=-1，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
        * @tc.number    : TC_163-4
        * @tc.name      : create PixelMap对图片进行解码生成位图  png
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入index=-1，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:-10,
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

    /* *
        * @tc.number    : TC_163-5
        * @tc.name      : create PixelMap对图片进行解码生成位图  png
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入index=-1，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
        * @tc.number    : TC_163-6
        * @tc.name      : create PixelMap对图片进行解码生成位图  png
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入index=-1，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:-10,
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

    /* *
        * @tc.number    : TC_163-7
        * @tc.name      : create PixelMap对图片进行解码生成位图  png
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入index=-1，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:-10,
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

    /* *
        * @tc.number    : TC_163-8
        * @tc.name      : create PixelMap对图片进行解码生成位图  png
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入index=-1，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
        * @tc.number    : TC_163-9
        * @tc.name      : create PixelMap对图片进行解码生成位图  png
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入index=-1，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
        * @tc.number    : TC_163-10
        * @tc.name      : create PixelMap对图片进行解码生成位图  png
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入index=-1，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
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
                rotateDegrees:10,
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

    /* *
        * @tc.number    : TC_164
        * @tc.name      : supportedFormats
        * @tc.desc      : 1.创建imagesource
        *                 2.调用supportedFormats
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
        */
    
    it('TC_164', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.jpg');
        if (imageSourceApi == null) {
            console.info('TC_164 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            expect(imageSourceApi.supportedFormats !==null).assertTrue();
            console.info(imageSourceApi.supportedFormats); 
            console.info('TC_164 suc ');
            done();
        }
    })

    /* *
        * @tc.number    : TC_166
        * @tc.name      : supportedFormats
        * @tc.desc      : 1.创建imagepacker
        *                 2.调用supportedFormats
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
        */
    
    it('TC_166', 0, async function (done) {
        const imagePackerApi = image.createImagePacker();
        if (imagePackerApi == null) {
            console.info('TC_166 create image packer failed');
            expect(false).assertTrue();
            done();
        } else {
            expect(imagePackerApi.supportedFormats !==null).assertTrue();
            console.info(imagePackerApi.supportedFormats); 
            console.info('TC_166 suc ');
            done();
        }
    })

    /* *
        * @tc.number    : TC_167
        * @tc.name      : create PixelMap对图片进行解码生成位图
        * @tc.desc      : 1.创建imagesource
        *                 2.设置解码区域
        *                 3.调用createPixelMap
        *                 4.传入指定index，options
        *                 5.返回空
        * @tc.size      : 
        * @tc.type      : Functional
        * @tc.level     : FWK Layer
        */

    it('TC_167', 0, async function (done) {
        const imageSourceApi = image.createImageSource('/data/local/tmp/test.arw');
        let decodingOptions = {
            sampleSize:1,
            editable: true, 
            desiredSize:{ width:1, height:2},
            rotateDegrees:10,
            desiredPixelFormat:4,
            desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
            index:0
        };
        imageSourceApi.createPixelMap(decodingOptions, pixelmap => {
            console.info('TC_167 createPixelMap ');
            expect(pixelmap == null ).assertTrue();
            done();
        })
    })
})