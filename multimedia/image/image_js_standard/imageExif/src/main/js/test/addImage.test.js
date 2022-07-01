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
import { testPng } from '../../../../../image/src/main/js/test/testImg'

describe('Image', function () {

    beforeAll(async function () {
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

    function createPixMapPromise(done, testNum, opts) {
        const Color = new ArrayBuffer(96);
        image.createPixelMap(Color, opts)
            .then(pixelmap => {
                expect(pixelmap != undefined).assertTrue();
                console.info(`${testNum} success`);
                done();
            })
            .catch(error => {
                console.log(`${testNum} error: ` + error);
                expect(false).assertTrue();
                done();
            })
    }

    function createPixMapCb(done, testNum, opts) {
        const Color = new ArrayBuffer(96);
        image.createPixelMap(Color, opts, (err, pixelmap) => {
            expect(pixelmap != undefined).assertTrue();
            console.info(`${testNum} success`);
            done();
        })
    }

    /**
     * @tc.number    : addImage_001
     * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 1, alphaType: 0)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('add_01_001', 0, async function (done) {
        let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, scaleMode: 1, alphaType: 0 }
        createPixMapPromise(done, 'add_01_001', opts);
    })

    /**
     * @tc.number    : add_01_002
     * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 1, alphaType: 1)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('add_01_002', 0, async function (done) {
        let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, scaleMode: 1, alphaType: 1 }
        createPixMapPromise(done, 'add_01_002', opts);
    })

    /**
     * @tc.number    : add_01_003
     * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 2, alphaType: 2)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('add_01_003', 0, async function (done) {
        let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, scaleMode: 2, alphaType: 2 }
        createPixMapPromise(done, 'add_01_003', opts);
    })

    /**
     * @tc.number    : add_01_004
     * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 2, alphaType: 3)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('add_01_004', 0, async function (done) {
        let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, scaleMode: 2, alphaType: 3 }
        createPixMapPromise(done, 'add_01_004', opts);
    })

    /**
     * @tc.number    : add_02_001
     * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 2, alphaType: 0)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('add_02_001', 0, async function (done) {
        let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, scaleMode: 2, alphaType: 0 }
        createPixMapCb(done, 'add_02_001', opts);
    })

    /**
     * @tc.number    : add_02_002
     * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 2, alphaType: 1)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('add_02_002', 0, async function (done) {
        let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, scaleMode: 2, alphaType: 1 }
        createPixMapCb(done, 'add_02_002', opts);
    })

    /**
     * @tc.number    : add_02_003
     * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 1, alphaType: 2)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('add_02_003', 0, async function (done) {
        let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, scaleMode: 1, alphaType: 2 }
        createPixMapCb(done, 'add_02_003', opts);
    })

    /**
     * @tc.number    : add_02_004
     * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 1, alphaType: 3)
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixeFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.return newpixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('add_02_004', 0, async function (done) {
        let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, scaleMode: 1, alphaType: 3 }
        createPixMapCb(done, 'add_02_004', opts);
    })

    /**
     * @tc.number    : add_053
     * @tc.name      : createIncrementalSource-updateData-png-promise
     * @tc.desc      : 1.create imagesource
     *                 2.update data
     *                 3.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('add_053', 0, async function (done) {
        try {
            let testimagebuffer = testPng;
            console.info('add_053 0003 ' + testimagebuffer.length);
            let bufferSize = 5000;
            let offset = 0;
            const incSouce = image.createIncrementalSource(new ArrayBuffer(1));
            let ret;
            let isFinished = false;
            while (offset < testimagebuffer.length) {
                console.info('add_053 0006 ' + testimagebuffer.length);
                var oneStep = testimagebuffer.slice(offset, offset + bufferSize);
                console.info('add_053 0007 ' + oneStep.length);
                if (oneStep.length < bufferSize) {
                    isFinished = true;
                }
                ret = await incSouce.updateData(oneStep, isFinished, 0, oneStep.length);
                if (!ret) {
                    console.info('add_053 updateData failed');
                    expect(ret).assertTrue();
                    break;
                }
                offset = offset + oneStep.length;
                console.info('add_053 0011 ' + offset);
            }
            if (ret) {
                console.info('add_053 updateData success ');
                let decodingOptions = {
                    sampleSize: 1
                };
                incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
                    console.info('add_053 0014' + pixelmap);
                    expect(pixelmap != undefined).assertTrue();
                    done();
                })
            } else {
                expect(false).assertTrue();
                done();
            }
        } catch (error) {
            expect(false).assertTrue();
            console.info('add_053 updateData failed ' + error);
        }
    })

    /**
     * @tc.number    : add_053-1
     * @tc.name      : createIncrementalSource-updateData-png-promise
     * @tc.desc      : 1.create imagesource
     *                 2.update data
     *                 3.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('add_053-1', 0, async function (done) {
        try {
            let testimagebuffer = testPng;
            console.info('add_053-1 0001 ' + testimagebuffer.length);
            let bufferSize = 5000;
            let offset = 0;
            const incSouce = image.createIncrementalSource(new ArrayBuffer(1));
            let ret;
            let isFinished = false;
            while (offset < testimagebuffer.length) {
                var oneStep = testimagebuffer.slice(offset, offset + bufferSize);
                console.info('add_053-1 0002 ' + oneStep.length);
                if (oneStep.length < bufferSize) {
                    isFinished = true;
                }
                ret = await new Promise(res => {
                    incSouce.updateData(oneStep, isFinished, 0, oneStep.length, (err, ret) => {
                        res(ret);
                    })
                })
                if (!ret) {
                    console.info('add_053-1 updateData failed');
                    expect(ret).assertTrue();
                    break;
                }
                offset = offset + oneStep.length;
                console.info('add_053-1 0003 ' + offset);
            }
            if (ret) {
                console.info('add_053-1 updateData success ');
                let decodingOptions = {
                    sampleSize: 1
                };
                incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
                    console.info('add_053-1 0004' + pixelmap);
                    expect(pixelmap != undefined).assertTrue();
                    done();
                })
            } else {
                expect(false).assertTrue();
                done();
            }
        } catch (error) {
            expect(false).assertTrue();
            console.info('add_053-1 updateData failed ' + error);
        }
    })
})