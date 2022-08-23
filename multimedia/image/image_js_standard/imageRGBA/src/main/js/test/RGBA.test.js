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
        console.info('beforeEach case');
    })

    afterEach(function () {
        console.info('afterEach case');
    })

    afterAll(function () {
        console.info('afterAll case');
    })

    /**
     * @tc.number    : RGBA_001
     * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_F16,
     *                                          size: { height: 4, width: 6 }, bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('RGBA_001', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: 7, size: { height: 4, width: 6 } }
        image.createPixelMap(Color, opts)
            .then(pixelmap => {
                expect(pixelmap != undefined).assertTrue();
                expect(pixelmap.isEditable == opts.editable).assertTrue();
                done();
            })
            .catch(error => {
                console.log('RGBA_001 err' + error);
                expect(false).assertTrue();
                done();
            })
    })

    /**
     * @tc.number    : RGBA_002
     * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: RGBA_F16,
     *                                           size: { height: 4, width: 6 },bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixelFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
    */
    it('RGBA_002', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: 7, size: { height: 4, width: 6 } }
        image.createPixelMap(Color, opts, (err, pixelmap) => {
            if (err != undefined) {
                console.info('RGBA_002 err: ' + err);
                expect(false).assertTrue();
                done();
                return;
            }
            expect(pixelmap != undefined).assertTrue();
            expect(pixelmap.isEditable == opts.editable).assertTrue();
            done();
        })
    })

    /**
     * @tc.number    : RGBA_003
     * @tc.name      : create pixelmap-promise (editable: false, pixelFormat: RGBA_F16,
     *                                          size: { height: 4, width: 6 }, bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('RGBA_003', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: false, pixelFormat: 7, size: { height: 4, width: 6 } }
        image.createPixelMap(Color, opts)
            .then(pixelmap => {
                expect(pixelmap != undefined).assertTrue();
                expect(pixelmap.isEditable == opts.editable).assertTrue();
                done();
            })
            .catch(error => {
                console.log('RGBA_003 err' + error);
                expect(false).assertTrue();
                done();
            })
    })

    /**
    * @tc.number    : RGBA_004
    * @tc.name      : create pixelmap-callback (editable: false, pixelFormat: RGBA_F16,
    *                                           size: { height: 4, width: 6 },bytes = buffer)
    * @tc.desc      : 1.create InitializationOptions object
    *                 2.set editable,pixelFormat,size
    *                 3.using color and opts create newPixelMap
    *                 4.return newpixelmap not empty
    * @tc.size      : MEDIUM 
    * @tc.type      : Functional
    * @tc.level     : Level 0
    */
    it('RGBA_004', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: false, pixelFormat: 7, size: { height: 4, width: 6 } }
        image.createPixelMap(Color, opts, (err, pixelmap) => {
            if (err != undefined) {
                console.info('RGBA_002 err: ' + err);
                expect(false).assertTrue();
                done();
                return;
            }
            expect(pixelmap != undefined).assertTrue();
            expect(pixelmap.isEditable == opts.editable).assertTrue();
            done();
        })

    })

    /**
     * @tc.number    : RGBA_005
     * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: ALPHA_8,
     *                                          size: { height: 4, width: 6 }, bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('RGBA_005', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: 6, size: { height: 4, width: 6 } }
        image.createPixelMap(Color, opts)
            .then(pixelmap => {
                expect(pixelmap != undefined).assertTrue();
                expect(pixelmap.isEditable == opts.editable).assertTrue();
                done();
            })
            .catch(error => {
                console.log('RGBA_005 err' + error);
                expect(false).assertTrue();
                done();
            })
    })

    /**
     * @tc.number    : RGBA_006
     * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGB_565,
     *                                          size: { height: 4, width: 6 }, bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('RGBA_006', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } }
        image.createPixelMap(Color, opts)
            .then(pixelmap => {
                expect(pixelmap != undefined).assertTrue();
                expect(pixelmap.isEditable == opts.editable).assertTrue();
                done();
            })
            .catch(error => {
                console.log('RGBA_006 err' + error);
                expect(false).assertTrue();
                done();
            })
    })

    /**
     * @tc.number    : RGBA_007
     * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: ARGB_8888,
     *                                          size: { height: 4, width: 6 }, bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('RGBA_007', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(Color, opts)
            .then(pixelmap => {
                expect(pixelmap != undefined).assertTrue();
                expect(pixelmap.isEditable == opts.editable).assertTrue();
                done();
            })
            .catch(error => {
                console.log('RGBA_007 err' + error);
                expect(false).assertTrue();
                done();
            })
    })

    /**
     * @tc.number    : RGBA_008
     * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: ALPHA_8,
     *                                           size: { height: 4, width: 6 },bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixelFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
    */
    it('RGBA_008', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: 6, size: { height: 4, width: 6 } }
        image.createPixelMap(Color, opts, (err, pixelmap) => {
            if (err != undefined) {
                console.info('RGBA_008 err: ' + err);
                expect(false).assertTrue();
                done();
                return;
            }
            expect(pixelmap != undefined).assertTrue();
            expect(pixelmap.isEditable == opts.editable).assertTrue();
            done();
        })

    })

    /**
     * @tc.number    : RGBA_009
     * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: RGB_565,
     *                                           size: { height: 4, width: 6 },bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixelFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
    */
    it('RGBA_009', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } }
        image.createPixelMap(Color, opts, (err, pixelmap) => {
            if (err != undefined) {
                console.info('RGBA_009 err: ' + err);
                expect(false).assertTrue();
                done();
                return;
            }
            expect(pixelmap != undefined).assertTrue();
            expect(pixelmap.isEditable == opts.editable).assertTrue();
            done();
        })

    })

    /**
     * @tc.number    : RGBA_010
     * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: ARGB_8888,
     *                                           size: { height: 4, width: 6 },bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixelFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
    */
    it('RGBA_010', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: 1, size: { height: 4, width: 6 } }
        image.createPixelMap(Color, opts, (err, pixelmap) => {
            if (err != undefined) {
                console.info('RGBA_010 err: ' + err);
                expect(false).assertTrue();
                done();
                return;
            }
            expect(pixelmap != undefined).assertTrue();
            expect(pixelmap.isEditable == opts.editable).assertTrue();
            done();
        })
    })

    /**
     * @tc.number    : RGBA_011
     * @tc.name      : create pixelmap-callback(editable: true, pixelFormat: unkonwn, size: { height: -1, width: 8 })
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('RGBA_011', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: 0, size: { height: -1, width: 8 } }
        image.createPixelMap(Color, opts, (err, pixelmap) => {
            if (err) {
                console.info('RGBA_011 err: ' + err);
                expect(pixelmap == undefined).assertTrue();
                console.info('RGBA_011 pass');
                done();
            } else {
                expect(false).assertTrue();
                done();
            }
        })
    })

    /**
     * @tc.number    : RGBA_012
     * @tc.name      : create pixelmap-callback(editable: true, pixelFormat: ARGB_8888, size: { height: 6, width: -1 })
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('RGBA_012', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: 1, size: { height: 6, width: -1 } }
        image.createPixelMap(Color, opts, (err, pixelmap) => {
            if (err) {
                console.info('RGBA_012 err: ' + err);
                expect(pixelmap == undefined).assertTrue();
                console.info('RGBA_012 pass');
                done();
            } else {
                expect(false).assertTrue();
                done();
            }
        })
    })

    /**
     * @tc.number    : RGBA_013
     * @tc.name      : create pixelmap-promise(editable: true, pixelFormat: unkonwn, size: { height: -1, width: 8 })
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
         */
    it('RGBA_013', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: 0, size: { height: -1, width: 8 } }
        image.createPixelMap(Color, opts).then(pixelmap => {
            expect(false).assertTrue();
            console.info('RGBA_013 failed');
            done();
        }).catch(error => {
            console.log('RGBA_013 err: ' + error);
            expect(true).assertTrue();
            done();
        })
    })

    /**
     * @tc.number    : RGBA_014
     * @tc.name      : create pixelmap-promise(editable: true, pixelFormat: unkonwn, size: { height: 6, width: -1 })
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
         */
    it('RGBA_014', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: 0, size: { height: 6, width: -1 } }
        image.createPixelMap(Color, opts).then(pixelmap => {
            expect(false).assertTrue();
            console.info('RGBA_014 failed');
            done();
        }).catch(error => {
            console.log('RGBA_014 error: ' + error);
            expect(true).assertTrue();
            done();
        })
    })

    /**
     * @tc.number    : RGBA_015
     * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: BGRA8888,
     *                                          size: { height: 4, width: 6 }, bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
     it('RGBA_015', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: 4, size: { height: 4, width: 6 } }
        image.createPixelMap(Color, opts)
            .then(pixelmap => {
                console.log('RGBA_015 pixelFormat: 4');
                expect(pixelmap != undefined).assertTrue();
                expect(pixelmap.isEditable == opts.editable).assertTrue();
                done();
            })
            .catch(error => {
                console.log('RGBA_015 err: ' + error);
                expect(false).assertTrue();
                done();
            })
    })

    /**
     * @tc.number    : RGBA_016
     * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: BGRA8888,
     *                                           size: { height: 4, width: 6 },bytes = buffer)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixelFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
    */
    it('RGBA_016', 0, async function (done) {
        const Color = new ArrayBuffer(96);
        let opts = { editable: true, pixelFormat: 4, size: { height: 4, width: 6 } }
        image.createPixelMap(Color, opts, (err, pixelmap) => {
            if (err != undefined) {
                console.log('RGBA_016 err: ' + err);
                expect(false).assertTrue();
                done();
                return;
            }
            console.log('RGBA_016 pixelFormat: image.PixelMapFormat.BGRA_8888');
            expect(pixelmap != undefined).assertTrue();
            expect(pixelmap.isEditable == opts.editable).assertTrue();
            done();
        })
    })
})