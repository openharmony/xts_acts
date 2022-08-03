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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function imagePacking() {
describe('imagePacking', function () {

    beforeAll(async function () {
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

    function packing_Promise(done, testNum, pixFormat, arg) {
        let opts;
        const Color = new ArrayBuffer(96);
        if (pixFormat == 2) {
            opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } }
        } else {
            opts = { editable: true, pixelFormat: 5, size: { height: 4, width: 6 } }
        }
        image.createPixelMap(Color, opts)
            .then(pixelmap => {
                if (pixelmap == undefined) {
                    expect(false).assertTrue()
                    console.info(`${testNum} create pixelmap fail`)
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        expect(false).assertTrue();
                        console.info(`${testNum} create imagepacker fail`)
                        done();
                    } else {
                        imagePackerApi.packing(pixelmap, arg)
                            .then((data) => {
                                var dataArr = new Uint8Array(data);
                                console.info(`${testNum} dataArr.length=` + dataArr.length);
                                for (var i = 0; i < dataArr.length; i++) {
                                    console.info(`dataArr[` + i + `]=` + dataArr[i]);
                                }
                                expect(data != undefined).assertTrue();
                                console.info(`${testNum} success`)
                                done();
                            }).catch(error => {
                                console.log(`${testNum} error:` + error);
                                expect().assertFail();
                                done();
                            })
                    }
                }
            })
            .catch(error => {
                console.log('createpixelmap error: ' + error);
                expect().assertFail();
                done();
            })
    }

    function packing_Cb(done, testNum, pixFormat, arg) {
        let opts;
        const Color = new ArrayBuffer(96);
        if (pixFormat == 2) {
            opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } }
        } else {
            opts = { editable: true, pixelFormat: 5, size: { height: 4, width: 6 } }
        }
        image.createPixelMap(Color, opts)
            .then(pixelmap => {
                if (pixelmap == undefined) {
                    expect(false).assertTrue()
                    console.info(`${testNum} create pixelmap fail`)
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        expect(false).assertTrue();
                        console.info(`${testNum} create imagepacker fail`)
                        done();
                    } else {
                        imagePackerApi.packing(pixelmap, arg, (err, data) => {
                            if (err != undefined) {
                                console.info(`${testNum} packing failerr: ${err}`)
                                expect(false).assertTrue();
                                done();
                                return;
                            }
                            var dataArr = new Uint8Array(data);
                            console.info(`${testNum} dataArr.length=` + dataArr.length);
                            for (var i = 0; i < dataArr.length; i++) {
                                console.info(`dataArr[` + i + `]=` + dataArr[i]);
                            }
                            expect(data != undefined).assertTrue();
                            done();
                        })
                    }
                }
            })
            .catch(error => {
                console.log(`${testNum} createpixelmap error: ` + error);
                expect().assertFail();
                done();
            })
    }

    function packing_Cb_Fail(done, testNum, pixFormat, arg) {
        const Color = new ArrayBuffer(96);
        if (pixFormat == 2) {
            var opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } }
        } else {
            var opts = { editable: true, pixelFormat: 5, size: { height: 4, width: 6 } }
        }

        image.createPixelMap(Color, opts)
            .then(pixelmap => {
                if (pixelmap == undefined) {
                    expect(false).assertTrue()
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        expect(false).assertTrue();
                        done();
                    } else {
                        imagePackerApi.packing(pixelmap, arg, (err, data) => {
                            expect(err != undefined).assertTrue();
                            done();
                        })
                    }
                }
            })
            .catch(error => {
                console.log(`${testNum} createpixelmap error:` + error);
                expect().assertFail();
                done();
            })
    }

    function packing_Promise_Fail(done, testNum, pixFormat, arg) {
        const Color = new ArrayBuffer(96);
        if (pixFormat == 2) {
            var opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } }
        } else {
            var opts = { editable: true, pixelFormat: 5, size: { height: 4, width: 6 } }
        }
        image.createPixelMap(Color, opts)
            .then(pixelmap => {
                if (pixelmap == undefined) {
                    expect(false).assertTrue()
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        expect(false).assertTrue();
                        done();
                    } else {
                        imagePackerApi.packing(pixelmap, arg)
                            .then((data) => {
                                expect(false).assertTrue();
                                done();
                            }).catch(error => {
                                console.log(`${testNum} error:` + error);
                                expect(true).assertTrue();
                                done();
                            })
                    }
                }
            })
            .catch(error => {
                console.log('createpixelmap error: ' + error);
                expect().assertFail();
                done();
            })
    }

    /**
     * @tc.number    : SUB_IMAGE_packing_P_001
     * @tc.name      : SUB_IMAGE_packing_P_001
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_P_001', 0, async function (done) {
        let packOpts = { format: "image/jpeg", quality: 99 }
        packing_Promise(done, 'SUB_IMAGE_packing_P_001', 2, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packing_P_002
     * @tc.name      : SUB_IMAGE_packing_P_002 - Promise - RGB565 quality 123
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_P_002', 0, async function (done) {
        let packOpts = { format: "image/jpeg", quality: 123 }
        packing_Promise_Fail(done, 'SUB_IMAGE_packing_P_002', 2, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packing_P_003
     * @tc.name      : SUB_IMAGE_packing_P_003 - Promise - RGB565 quality null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_P_003', 0, async function (done) {
        let packOpts = { format: "image/jpeg" }
        packing_Promise_Fail(done, 'SUB_IMAGE_packing_P_003', 2, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packing_P_004
     * @tc.name      : SUB_IMAGE_packing_P_004 - Promise - RGB565 format null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_P_004', 0, async function (done) {
        let packOpts = { quality: 99 }
        packing_Promise_Fail(done, 'SUB_IMAGE_packing_P_004', 2, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packing_P_005
     * @tc.name      : SUB_IMAGE_packing_P_005 - Promise - RGB565 wrong format
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_P_005', 0, async function (done) {
        let packOpts = { format: "image/png", quality: 99 }
        packing_Promise_Fail(done, 'SUB_IMAGE_packing_P_005', 2, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packing_P_006
     * @tc.name      : SUB_IMAGE_packing_P_006
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_P_006', 0, async function (done) {
        let packOpts = { format: "image/jpeg", quality: 50 }
        packing_Promise(done, 'SUB_IMAGE_packing_P_006', 5, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packing_P_007
     * @tc.name      : SUB_IMAGE_packing_P_007 - Promise - RGB888 quality 123
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_P_007', 0, async function (done) {
        let packOpts = { format: "image/jpeg", quality: 123 }
        packing_Promise_Fail(done, 'SUB_IMAGE_packing_P_007', 5, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packing_P_008
     * @tc.name      : SUB_IMAGE_packing_P_008 - Promise - RGB888 quality null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_P_008', 0, async function (done) {
        let packOpts = { format: "image/jpeg" }
        packing_Promise_Fail(done, 'SUB_IMAGE_packing_P_008', 5, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packing_P_009
     * @tc.name      : SUB_IMAGE_packing_P_009 - Promise - RGB888 format null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_P_009', 0, async function (done) {
        let packOpts = { quality: 99 }
        packing_Promise_Fail(done, 'SUB_IMAGE_packing_P_009', 5, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packing_P_010
     * @tc.name      : SUB_IMAGE_packing_P_010 - Promise - RGB888 wrong format
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_P_010', 0, async function (done) {
        let packOpts = { format: "image/png", quality: 99 }
        packing_Promise_Fail(done, 'SUB_IMAGE_packing_P_010', 5, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packing_Cb_001
     * @tc.name      : SUB_IMAGE_packing_Cb_001
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_Cb_001', 0, async function (done) {
        let packOpts = { format: "image/jpeg", quality: 99 }
        packing_Cb(done, 'SUB_IMAGE_packing_Cb_001', 2, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packing_Cb_002
     * @tc.name      : SUB_IMAGE_packing_Cb_002 - callback - RGB565 quality 123
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_Cb_002', 0, async function (done) {
        let packOpts = { format: "image/jpeg", quality: 123 }
        packing_Cb_Fail(done, 'SUB_IMAGE_packing_Cb_002', 2, packOpts)

    })

    /**
     * @tc.number    : SUB_IMAGE_packing_Cb_003
     * @tc.name      : SUB_IMAGE_packing_Cb_003 - callback - RGB565 quality null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_Cb_003', 0, async function (done) {
        let packOpts = { format: "image/jpeg" }
        packing_Cb_Fail(done, 'SUB_IMAGE_packing_Cb_003', 2, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packing_Cb_004
     * @tc.name      : SUB_IMAGE_packing_Cb_004 - callback - RGB565 format null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_Cb_004', 0, async function (done) {
        let packOpts = { quality: 99 }
        packing_Cb_Fail(done, 'SUB_IMAGE_packing_Cb_004', 2, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packing_Cb_005
     * @tc.name      : SUB_IMAGE_packing_Cb_005 - callback - RGB565 wrong format
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_Cb_005', 0, async function (done) {
        let packOpts = { format: "image/png", quality: 99 }
        packing_Cb_Fail(done, 'SUB_IMAGE_packing_Cb_005', 2, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packing_Cb_006
     * @tc.name      : SUB_IMAGE_packing_Cb_006
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_Cb_006', 0, async function (done) {
        let packOpts = { format: "image/jpeg", quality: 50 }
        packing_Cb(done, 'SUB_IMAGE_packing_Cb_006', 5, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packing_Cb_007
     * @tc.name      : SUB_IMAGE_packing_Cb_007 - callback - RGB888 quality 123
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_Cb_007', 0, async function (done) {
        let packOpts = { format: "image/jpeg", quality: 123 }
        packing_Cb_Fail(done, 'SUB_IMAGE_packing_Cb_007', 5, packOpts)

    })

    /**
     * @tc.number    : SUB_IMAGE_packing_Cb_008
     * @tc.name      : SUB_IMAGE_packing_Cb_008 - callback - RGB888 quality null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_Cb_008', 0, async function (done) {
        let packOpts = { format: "image/jpeg" }
        packing_Cb_Fail(done, 'SUB_IMAGE_packing_Cb_008', 5, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packing_Cb_009
     * @tc.name      : SUB_IMAGE_packing_Cb_009 - callback - RGB888 format null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_Cb_009', 0, async function (done) {
        let packOpts = { quality: 99 }
        packing_Cb_Fail(done, 'SUB_IMAGE_packing_Cb_009', 5, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packing_Cb_010
     * @tc.name      : SUB_IMAGE_packing_Cb_010 - callback - RGB888 wrong format
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packing_Cb_010', 0, async function (done) {
        let packOpts = { format: "image/png", quality: 99 }
        packing_Cb_Fail(done, 'SUB_IMAGE_packing_Cb_010', 5, packOpts)
    })

})}
