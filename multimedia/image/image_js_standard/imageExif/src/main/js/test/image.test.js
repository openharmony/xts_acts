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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import {tc_020buf, tc_020_1buf, tc_021buf, tc_021_1buf, tc_022buf} from './testImg'
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'

describe('Image', function () {
    var pathExifJpg = '/data/storage/el2/base/files/test_exif.jpg';

    beforeAll(async function () {
        await applyPermission();
        console.info('beforeAll case');
    })

    beforeEach(function () {
        console.info('beforeEach case');
    })

    afterEach(async function () {
        console.info('afterEach case');
    })

    afterAll(async function () {
        console.info('afterAll case');
    })

    async function applyPermission(){
        let appInfo = await bundle.getApplicationInfo('ohos.acts.multimedia.image.Exif',0,100);
        let atManager = abilityAccessCtrl.createAtManager();
        if(atManager != null){
            let tokenID = appInfo.accessTokenId;
            console.info('[permission]case accessTokenId is' + tokenID);
            let permissionName1 = 'ohos.permission.MEDIA_LOCATION';
            let permissionName2 = 'ohos.permission.READ_MEDIA';
            let permissionName3 = 'ohos.permission.WRITE_MEDIA';
            await atManager.grantUserGrantedPermission(tokenID,permissionName1).then((result)=>{
                console.info('[permission]case grantUserGrantedPermission success:' + result);
            }).catch((err)=>{
                console.info('[permission]case grantUserGrantedPermission failed:' + err);
            });
            await atManager.grantUserGrantedPermission(tokenID,permissionName2).then((result)=>{
                console.info('[permission]case grantUserGrantedPermission success:' + result);
            }).catch((err)=>{
                console.info('[permission]case grantUserGrantedPermission failed:' + err);
            });
            await atManager.grantUserGrantedPermission(tokenID,permissionName3).then((result)=>{
                console.info('[permission]case grantUserGrantedPermission success:' + result);
            }).catch((err)=>{
                console.info('[permission]case grantUserGrantedPermission failed:' + err);
            });
        }else{
            console.info('[permission]case apply permission failed,createAtManager failed');
        }
    }
    
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
            .then( pixelmap => {
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
            .then( pixelmap => {
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
            .then( pixelmap => {
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
            expect(pixelmap == undefined).assertTrue();
            console.info('TC_001-8 success');
            done();
        })
    })

    /**
     * @tc.number    : TC_001-9
     * @tc.name      : create pixelmap-callback(editable: true, pixelFormat: unsupported format, size: { height: 6, width: 8 })
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_001-9', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: 1, size: { height: 6, width: 8 } }
        image.createPixelMap(Color, opts, (err, pixelmap) => {
            expect(pixelmap == undefined).assertTrue();
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
            .then( pixelmap => {
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
                             if (bufferArr2[i] != tc_020buf[i]) {
                                res = false;
                                console.info('TC_20_buffer'+ bufferArr2[i]);
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
            if(pixelmap == undefined){
                console.info('TC_020-1 createPixelMap failed');
                expect(false).assertTrue();
                done();
            }else{
                const readBuffer = new ArrayBuffer(96);
                pixelmap.readPixelsToBuffer(readBuffer,() => {
                    var bufferArr = new Uint8Array(readBuffer);
                    var res = true;
                    for (var i = 0; i < bufferArr.length; i++) {
                        if (bufferArr[i] != tc_020_1buf[i]) {
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
        image.createPixelMap(color, opts, (err,pixelmap) => {
            if(pixelmap == undefined){
                console.info('TC_020-2 createPixelMap failed');
                expect(false).assertTrue();
                done();
            }else{
                const readBuffer = new ArrayBuffer(0);
                pixelmap.readPixelsToBuffer(readBuffer,() => {
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
            .then( pixelmap => {
                if (pixelmap == undefined) {
                    console.info('TC_021 createPixelMap failed');
                    expect(false).assertTrue()
                    done();
                }
                const area = { pixels: new ArrayBuffer(8),
                    offset: 0,
                    stride: 8,
                    region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                }
                pixelmap.readPixels(area).then(() => {
                    var bufferArr2 = new Uint8Array(area.pixels);
                    var res = true;
                    for (var i = 0; i < bufferArr2.length; i++) {
                        if (bufferArr2[i] != tc_021buf[i]) {
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
            if(pixelmap == undefined){
                console.info('TC_020-1 createPixelMap failed');
                expect(false).assertTrue();
                done();
            }else{
                const area = { pixels: new ArrayBuffer(8),
                    offset: 0,
                    stride: 8,
                    region: { size: { height: 1, width: 2 }, x: 0, y: 0 }}
                pixelmap.readPixels(area, () => {
                    var bufferArr = new Uint8Array(area.pixels);
                    var res = true;
                    for (var i = 0; i < bufferArr.length; i++) {
                        console.info('TC_021-1 buffer ' + bufferArr[i]);
                        if(bufferArr[i] != tc_021_1buf[i]) {
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
        image.createPixelMap(color, opts, (err,pixelmap) => {
            if(pixelmap == undefined){
                expect(false).assertTrue();
                console.info('TC_021-2 create pixelmap fail');
                done();
            }else{
                const area = { pixels: new ArrayBuffer(20),
                    offset: 0,
                    stride: 8,
                    region: { size: { height: 1, width: 2 }, x: -1, y: -1 }}
                pixelmap.readPixels(area).then(()=>{
                    console.info('TC_021-2 failed');
                    expect(false).assertTrue();
                    done();
                }).catch(()=>{
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
        image.createPixelMap(color, opts, (err,pixelmap) => {
            if(pixelmap == undefined){
                expect(false).assertTrue();
                console.info('TC_021-3 create pixelmap failed');
                done();
            }else{
                const area = { pixels: new ArrayBuffer(0),
                    offset: 0,
                    stride: 8,
                    region: { size: { height: 1, width: 2 }, x: 0, y: 0 }}
                pixelmap.readPixels(area).then(()=>{
                    console.info('TC_021-3 failed');
                    expect(false).assertTrue();
                    done();
                }).catch(()=>{
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
            if(pixelmap == undefined){
                expect(false).assertTrue();
                console.info('TC_021-4 createPixelMap success');
                done();
            }
            const area = { pixels: new ArrayBuffer(20),
                offset: 21,
                stride: 8,
                region: { size: { height: 1, width: 2 }, x: 0, y: 0 }}
            pixelmap.readPixels(area).then(()=>{
                console.info('TC_021-4 failed');
                expect(false).assertTrue();
                done();
            }).catch(()=>{
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
        image.createPixelMap(color, opts, (err,pixelmap) => {
            if(pixelmap == undefined){
                expect(false).assertTrue();
                console.info('TC_021-5 createPixelMap success');
                done();
            }
            const area = { pixels: new ArrayBuffer(20),
                offset: 0,
                stride: 8,
                region: { size: { height: -1, width:-1}, x: 0, y: 0 }}
            pixelmap.readPixels(area).then(()=>{
                console.info('TC_021-5 failed');
                expect(false).assertTrue();
                done();
            }).catch(()=>{
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
            .then( pixelmap => {
                if (pixelmap == undefined) {
                    console.info('TC_022 createPixelMap failed');
                    expect(false).assertTrue()
                    done();
                }

                const area = { pixels: new ArrayBuffer(8),
                    offset: 0,
                    stride: 8,
                    region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                }
                var bufferArr = new Uint8Array(area.pixels);
                for (var i = 0; i < bufferArr.length; i++) {
                    bufferArr[i] = i + 1;
                }

                pixelmap.writePixels(area).then(() => {
                    const readArea = { pixels: new ArrayBuffer(8),
                        offset: 0,
                        stride: 8,
                        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                    }
                    pixelmap.readPixels(readArea).then(() => {
                        var readArr = new Uint8Array(readArea.pixels);
                        var res = true;
                        for (var i = 0; i < readArr.length; i++) {
                            if (readArr[i] != tc_022buf[i]) {
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
    const color = new ArrayBuffer(96);
    let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
    image.createPixelMap(color, opts, (err, pixelmap) => {
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
                    if (readArr[i] != tc_022buf[i]) {
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
        .catch(error => {
            console.log('TC_022-1 error: ' + error);
            expect().assertFail();
            done();
        })
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
        let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }}
        image.createPixelMap(color, opts)
            .then( pixelmap => {
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
        image.createPixelMap(color, opts).then( pixelmap => {
            if(pixelmap == undefined){
                expect(false).assertTrue()
                console.info('TC_023-1 failed');
                done();
            }
            const writeColor = new ArrayBuffer(96);
            pixelmap.writeBufferToPixels(writeColor,() => {
                const readBuffer = new ArrayBuffer(96);
                pixelmap.readPixelsToBuffer(readBuffer,() => {
                    var bufferArr = new Uint8Array(readBuffer);
                    var res = true;
                    for (var i = 0; i < bufferArr.length; i++) {
                        if(res) {
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
        .then( pixelmap => {
            if (pixelmap == undefined) {
                console.info('TC_024 createPixelMap failed');
                expect(false).assertTrue()
                done();
            }
            pixelmap.getImageInfo().then( imageInfo => {
                if (imageInfo == undefined) {
                    console.info('TC_024 imageInfo is empty');
                    expect(false).assertTrue()
                    done();
                }
                if(imageInfo.size.height == 4 && imageInfo.size.width == 6){
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
        image.createPixelMap(color, opts, (err,pixelmap) => {
            if(pixelmap == undefined){
                expect(false).assertTrue()
                console.info('TC_024-1 create pixelmap fail');
                done();
            }
            pixelmap.getImageInfo( (err,imageInfo) => {
                if (imageInfo == undefined) {
                    console.info('TC_024-1 imageInfo is empty');
                    expect(false).assertTrue()
                    done();
                }
                if(imageInfo.size.height == 4 && imageInfo.size.width == 6){
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
        image.createPixelMap(color, opts, (err,pixelmap) => {
            if(pixelmap == undefined){
                expect(false).assertTrue()
                console.info('TC_25-1 create pixelmap fail');
                done();
            } else {
                const num = pixelmap.getBytesNumberPerRow();
                console.info('TC_025-1 num is ' + num);
                expect(num == expectNum).assertTrue();
                if(num == expectNum) {
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
        image.createPixelMap(color, opts,(err,pixelmap) => {
            if(pixelmap == undefined){
                expect(false).assertTrue()
                console.info('TC_026-1 create pixelmap fail');
                done();
            } else {
                const num = pixelmap.getPixelBytesNumber();
                console.info('TC_026-1 num is ' + num);
                expect(num == expectNum).assertTrue();
                if(num == expectNum) {
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
            if (pixelmap == undefined) {
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
     * @tc.number    : TC_171
     * @tc.name      : getImageProperty(BitsPerSample)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(BitsPerSample)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
     it('TC_171', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_171 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("BitsPerSample")
                .then(data => {
                    console.info('TC_171 BitsPerSample ' + data);
                    expect(data != undefined).assertTrue();
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
     * @tc.name      : getImageProperty(Orientation)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(Orientation)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-1', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_171-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("Orientation")
                .then(data => {
                    console.info('TC_171-1 Orientation ' + data);
                    expect(data != undefined && data != '' ).assertTrue();
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
     * @tc.name      : getImageProperty(ImageLength)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ImageLength)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-2', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_171-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("ImageLength")
                .then(data => {
                    console.info('TC_171-2 ImageLength ' + data);
                    expect(data != undefined && data != '' ).assertTrue();
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
     * @tc.name      : getImageProperty(ImageWidth)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ImageWidth)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-3', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_171-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("ImageWidth")
                .then(data => {
                    console.info('TC_171-3 ImageWidth ' + data);
                    expect(data != undefined && data != '' ).assertTrue();
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
     * @tc.name      : getImageProperty(GPSLatitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLatitude)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-4', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_171-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLatitude")
                .then(data => {
                    console.info('TC_171-4 GPSLatitude ' + data);
                    expect(data != undefined && data != '' ).assertTrue();
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
     * @tc.name      : getImageProperty(GPSLongitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLongitude)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-5', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_171-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLongitude")
                .then(data => {
                    console.info('TC_171-5 GPSLongitude ' + data);
                    expect(data != undefined && data != '' ).assertTrue();
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
     * @tc.name      : getImageProperty(GPSLatitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLatitudeRef)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-6', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_171-6 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLatitudeRef")
                .then(data => {
                    console.info('TC_171-6 GPSLatitudeRef ' + data);
                    expect(data != undefined && data != '' ).assertTrue();
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
     * @tc.name      : getImageProperty(GPSLongitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLongitudeRef)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-7', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_171-7 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLongitudeRef")
                .then(data => {
                    console.info('TC_171-7 GPSLongitudeRef ' + data);
                    expect(data != undefined && data != '' ).assertTrue();
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
     * @tc.name      : getImageProperty(DateTimeOriginal)
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ImageLength)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-8', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_171-8 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("DateTimeOriginal")
                .then(data => {
                    console.info('TC_171-8 DateTimeOriginal ' + data);
                    expect(data != undefined && data != '' ).assertTrue();
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
     * @tc.name      : getImageProperty(BitsPerSample)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(BitsPerSample)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_172 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("BitsPerSample",(error,data) => {
                if (error){
                    console.info('TC_172 getImageProperty BitsPerSample error');
                    expect(false).assertTrue();
                    done();
                }else{
                    console.info('TC_172 BitsPerSample ' + data);
                    expect(data != undefined).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_172-1
     * @tc.name      : getImageProperty(Orientation)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(Orientation)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-1', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_172-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("Orientation",(error,data) => {
                if (error){
                    console.info('TC_172-1 getImageProperty Orientation error');
                    expect(false).assertTrue();
                    done();
                }else{
                    console.info('TC_172-1 Orientation ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_172-2
     * @tc.name      : getImageProperty(ImageLength)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(ImageLength)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-2', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_172-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("ImageLength",(error,data) => {
                if (error){
                    console.info('TC_172-2 getImageProperty ImageLength error');
                    expect(false).assertTrue();
                    done();
                }else{
                    console.info('TC_172-2 ImageLength ' + data);
                    expect(data != undefined && data != '' ).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_172-3
     * @tc.name      : getImageProperty(ImageWidth)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(ImageWidth)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-3', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_172-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("ImageWidth",(error,data) => {
                if (error){
                    console.info('TC_172-3 getImageProperty ImageWidth error');
                    expect(false).assertTrue();
                    done();
                }else{
                    console.info('TC_172-3 ImageWidth ' + data);
                    expect(data != undefined && data != '' ).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_172-4
     * @tc.name      : getImageProperty(GPSLatitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(GPSLatitude)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-4', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_172-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLatitude",(error,data) => {
                if (error){
                    console.info('TC_172-4 getImageProperty GPSLatitude error');
                    expect(false).assertTrue();
                    done();
                }else{
                    console.info('TC_172-4 GPSLatitude ' + data);
                    expect(data != undefined && data != '' ).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_172-5
     * @tc.name      : getImageProperty(GPSLongitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(GPSLongitude)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-5', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_172-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLongitude",(error,data) => {
                if (error){
                    console.info('TC_172-5 getImageProperty GPSLongitude error');
                    expect(false).assertTrue();
                    done();
                }else{
                    console.info('TC_172-5 GPSLongitude ' + data);
                    expect(data != undefined && data != '' ).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_172-6
     * @tc.name      : getImageProperty(GPSLatitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(GPSLatitudeRef)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-6', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_172-6 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLatitudeRef",(error,data) => {
                if (error){
                    console.info('TC_172-6 getImageProperty GPSLatitudeRef error');
                    expect(false).assertTrue();
                    done();
                }else{
                    console.info('TC_172-6 GPSLatitudeRef ' + data);
                    expect(data != undefined && data != '' ).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_172-7
     * @tc.name      : getImageProperty(GPSLongitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(GPSLongitudeRef)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-7', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_172-7 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLongitudeRef",(error,data) => {
                if (error){
                    console.info('TC_172-7 getImageProperty GPSLongitudeRef error');
                    expect(false).assertTrue();
                    done();
                }else{
                    console.info('TC_172-7 GPSLongitudeRef ' + data);
                    expect(data != undefined && data != '' ).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_172-8
     * @tc.name      : getImageProperty(DateTimeOriginal)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(DateTimeOriginal)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-8', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_172-8 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("DateTimeOriginal",(error,data) => {
                if (error){
                    console.info('TC_172-8 getImageProperty DateTimeOriginal error');
                    expect(false).assertTrue();
                    done();
                }else{
                    console.info('TC_172-8 DateTimeOriginal ' + data);
                    expect(data != undefined && data != '' ).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_173
     * @tc.name      : getImageProperty(BitsPerSample,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(BitsPerSample,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_173 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:0,defaultValue:'9999'}
            imageSourceApi.getImageProperty("BitsPerSample",property,(error,data) => {
                if (error){
                    console.info('TC_173 getImageProperty BitsPerSample error');
                    expect(false).assertTrue();
                    done();
                }else{
                    console.info('TC_173 BitsPerSample ' + data);
                    expect(data != '9999' && data != undefined).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_173-1
     * @tc.name      : getImageProperty(Orientation,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(Orientation,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-1', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_173-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:0,defaultValue:'9999'}
            imageSourceApi.getImageProperty("Orientation",property,(error,data) => {
                if (error){
                    console.info('TC_173-1 getImageProperty Orientation error');
                    expect(false).assertTrue();
                    done();
                }else{
                    console.info('TC_173-1 Orientation ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_173-2
     * @tc.name      : getImageProperty(ImageLength,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ImageLength,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-2', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_173-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:0,defaultValue:'9999'}
            imageSourceApi.getImageProperty("ImageLength",property,(error,data) => {
                if (error){
                    console.info('TC_173-2 getImageProperty ImageLength error');
                    expect(false).assertTrue();
                    done();
                }else{
                    console.info('TC_173-2 ImageLength ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_173-3
     * @tc.name      : getImageProperty(ImageWidth,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ImageWidth,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-3', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_173-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:0,defaultValue:'9999'}
            imageSourceApi.getImageProperty("ImageWidth",property,(error,data) => {
                if (error){
                    console.info('TC_173-3 getImageProperty ImageWidth error');
                    expect(false).assertTrue();
                    done();
                }else{
                    console.info('TC_173-3 ImageWidth ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_173-4
     * @tc.name      : getImageProperty(GPSLatitude,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLatitude,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-4', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_173-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:0,defaultValue:'9999'}
            imageSourceApi.getImageProperty("GPSLatitude",property,(error,data) => {
                if (error){
                    console.info('TC_173-4 getImageProperty GPSLatitude error');
                    expect(false).assertTrue();
                    done();
                }else{
                    console.info('TC_173-4 GPSLatitude ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_173-5
     * @tc.name      : getImageProperty(GPSLongitude,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLongitude,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-5', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_173-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:0,defaultValue:'9999'}
            imageSourceApi.getImageProperty("GPSLongitude",property,(error,data) => {
                if (error){
                    console.info('TC_173-5 getImageProperty GPSLongitude error');
                    expect(false).assertTrue();
                    done();
                }else{
                    console.info('TC_173-5 GPSLongitude ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_173-6
     * @tc.name      : getImageProperty(GPSLatitudeRef,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLatitudeRef,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-6', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_173-6 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:0,defaultValue:'9999'}
            imageSourceApi.getImageProperty("GPSLatitudeRef",property,(error,data) => {
                if (error){
                    console.info('TC_173-6 getImageProperty GPSLatitudeRef error');
                    expect(false).assertTrue();
                    done();
                }else{
                    console.info('TC_173-6 GPSLatitudeRef ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_173-7
     * @tc.name      : getImageProperty(GPSLongitudeRef,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLongitudeRef,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-7', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_173-7 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:0,defaultValue:'9999'}
            imageSourceApi.getImageProperty("GPSLongitudeRef",property,(error,data) => {
                if (error){
                    console.info('TC_173-7 getImageProperty GPSLongitudeRef error');
                    expect(false).assertTrue();
                    done();
                }else{
                    console.info('TC_173-7 GPSLongitudeRef ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_173-8
     * @tc.name      : getImageProperty(DateTimeOriginal,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(DateTimeOriginal,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-8', 0, async function (done) {
        let fdNumber = fileio.openSync(pathExifJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_173-8 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = {index:0,defaultValue:'9999'}
            imageSourceApi.getImageProperty("DateTimeOriginal",property,(error,data) => {
                if (error){
                    console.info('TC_173-8 getImageProperty DateTimeOriginal error');
                    expect(false).assertTrue();
                    done();
                }else{
                    console.info('TC_173-8 DateTimeOriginal ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })
})
