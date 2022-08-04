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
import featureAbility from '@ohos.ability.featureAbility'
import fileio from '@ohos.fileio'

export default function imagePacking() {
describe('imagePacking', function () {
    let filePath;
    let fdNumber;
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

    afterEach(function () {
        console.info('afterEach case');
    })

    afterAll(function () {
        console.info('afterAll case');
    })

    function packingPromise(done, testNum, pixFormat, arg) {
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

    function packingCb(done, testNum, pixFormat, arg) {
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

    function packingCbFail(done, testNum, pixFormat, arg) {
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

    function packingPromiseFail(done, testNum, pixFormat, arg) {
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
        packingPromise(done, 'SUB_IMAGE_packing_P_001', 2, packOpts)
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
        packingPromiseFail(done, 'SUB_IMAGE_packing_P_002', 2, packOpts)
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
        packingPromiseFail(done, 'SUB_IMAGE_packing_P_003', 2, packOpts)
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
        packingPromiseFail(done, 'SUB_IMAGE_packing_P_004', 2, packOpts)
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
        packingPromiseFail(done, 'SUB_IMAGE_packing_P_005', 2, packOpts)
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
        packingPromise(done, 'SUB_IMAGE_packing_P_006', 5, packOpts)
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
        packingPromiseFail(done, 'SUB_IMAGE_packing_P_007', 5, packOpts)
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
        packingPromiseFail(done, 'SUB_IMAGE_packing_P_008', 5, packOpts)
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
        packingPromiseFail(done, 'SUB_IMAGE_packing_P_009', 5, packOpts)
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
        packingPromiseFail(done, 'SUB_IMAGE_packing_P_010', 5, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packingCb_001
     * @tc.name      : SUB_IMAGE_packingCb_001
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packingCb_001', 0, async function (done) {
        let packOpts = { format: "image/jpeg", quality: 99 }
        packingCb(done, 'SUB_IMAGE_packingCb_001', 2, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packingCb_002
     * @tc.name      : SUB_IMAGE_packingCb_002 - callback - RGB565 quality 123
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packingCb_002', 0, async function (done) {
        let packOpts = { format: "image/jpeg", quality: 123 }
        packingCbFail(done, 'SUB_IMAGE_packingCb_002', 2, packOpts)

    })

    /**
     * @tc.number    : SUB_IMAGE_packingCb_003
     * @tc.name      : SUB_IMAGE_packingCb_003 - callback - RGB565 quality null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packingCb_003', 0, async function (done) {
        let packOpts = { format: "image/jpeg" }
        packingCbFail(done, 'SUB_IMAGE_packingCb_003', 2, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packingCb_004
     * @tc.name      : SUB_IMAGE_packingCb_004 - callback - RGB565 format null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packingCb_004', 0, async function (done) {
        let packOpts = { quality: 99 }
        packingCbFail(done, 'SUB_IMAGE_packingCb_004', 2, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packingCb_005
     * @tc.name      : SUB_IMAGE_packingCb_005 - callback - RGB565 wrong format
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packingCb_005', 0, async function (done) {
        let packOpts = { format: "image/png", quality: 99 }
        packingCbFail(done, 'SUB_IMAGE_packingCb_005', 2, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packingCb_006
     * @tc.name      : SUB_IMAGE_packingCb_006
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packingCb_006', 0, async function (done) {
        let packOpts = { format: "image/jpeg", quality: 50 }
        packingCb(done, 'SUB_IMAGE_packingCb_006', 5, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packingCb_007
     * @tc.name      : SUB_IMAGE_packingCb_007 - callback - RGB888 quality 123
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packingCb_007', 0, async function (done) {
        let packOpts = { format: "image/jpeg", quality: 123 }
        packingCbFail(done, 'SUB_IMAGE_packingCb_007', 5, packOpts)

    })

    /**
     * @tc.number    : SUB_IMAGE_packingCb_008
     * @tc.name      : SUB_IMAGE_packingCb_008 - callback - RGB888 quality null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packingCb_008', 0, async function (done) {
        let packOpts = { format: "image/jpeg" }
        packingCbFail(done, 'SUB_IMAGE_packingCb_008', 5, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packingCb_009
     * @tc.name      : SUB_IMAGE_packingCb_009 - callback - RGB888 format null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packingCb_009', 0, async function (done) {
        let packOpts = { quality: 99 }
        packingCbFail(done, 'SUB_IMAGE_packingCb_009', 5, packOpts)
    })

    /**
     * @tc.number    : SUB_IMAGE_packingCb_010
     * @tc.name      : SUB_IMAGE_packingCb_010 - callback - RGB888 wrong format
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_packingCb_010', 0, async function (done) {
        let packOpts = { format: "image/png", quality: 99 }
        packingCbFail(done, 'SUB_IMAGE_packingCb_010', 5, packOpts)
    })

    /**
         * @tc.number    : TC_062
         * @tc.name      : packing ImageSource - promise
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
     it('TC_062', 0, async function (done) {
        try {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_062 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                    console.info('TC_062 create image packer failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let packOpts = { format: "image/jpeg", quality: 99 }
                    imagePackerApi.packing(imageSourceApi, packOpts)
                        .then(data => {
                            console.info('TC_062 success');
                            expect(data != undefined).assertTrue();
                            done();
                        }).catch(error => {
                            console.log('TC_062 error: ' + error);
                            expect(false).assertFail();
                            done();
                        })
                }
            }
        } catch (error) {
            console.info('TC_062 error: ' + error);
            expect(false).assertTrue();
            done();
        }

    })

    /**
     * @tc.number    : TC_062-1 
     * @tc.name      : packing ImageSource - callback
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     *                 4.callbackcall return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_062-1', 0, async function (done) {
        try {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_062-1 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                    console.info('TC_062-1 create image packer failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let packOpts = { format: "image/jpeg", quality: 1 }
                    imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
                        console.info('TC_062-1 success' + JSON.stringify(data));
                        expect(data != undefined).assertTrue();
                        done();
                    })
                }
            }
        } catch (error) {
            console.info('TC_062-1 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_062-2
     * @tc.name      : packing ImageSource - callback - wrong format
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     *                 4.callbackcall return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_062-2', 0, async function (done) {
        try {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_062-2 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                    console.info('TC_062-2 create image packer failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let packOpts = { format: "image/gif", quality: 98 }
                    imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
                        console.info('TC_062-2 success');
                        expect(data == undefined).assertTrue();
                        console.info(data);
                        done();
                    })
                }
            }
        } catch (error) {
            console.info('TC_062-2 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_062-3
     * @tc.name      : packing ImageSource - callback - wrong quality
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.call return array
     *                 4.callbackcall return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_062-3', 0, async function (done) {
        try {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_062-3 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                    console.info('TC_062-3 create image packer failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let packOpts = { format: "image/jpeg", quality: 101 }
                    imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
                        console.info('TC_062-3 success');
                        expect(data == undefined).assertTrue();
                        console.info(data);
                        done();
                    })
                }
            }
        } catch (error) {
            console.info('TC_062-3 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_062-4 
     * @tc.name      : createImagePacker
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     *                 4.callbackcall return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_062-4', 0, async function (done) {
        try {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_062-4 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                    console.info('TC_062-4 create image packer failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('TC_062-4 create image packer success');
                    expect(true).assertTrue();
                    done();
                }
            }
        } catch (error) {
            console.info('TC_062-4 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_062-5
     * @tc.name      : packing ImageSource - promise - no quality
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.call return array
     *                 4.callbackcall return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */

    it('TC_062-5', 0, async function (done) {
        try {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_062-5 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                    console.info('TC_062-5 create image packer failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let packOpts = { format: "image/jpeg" }
                    imagePackerApi.packing(imageSourceApi, packOpts)
                        .then(data => {
                            console.info('TC_062-5 failed');
                            expect(data == undefined).assertTrue();
                            done();
                        }).catch(error => {
                            console.log('TC_062-5 error: ' + error);
                            console.log('TC_062-5 success');
                            expect(true).assertTrue();
                            done();
                        })
                }
            }
        } catch (error) {
            console.info('TC_062-5 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_062-6
     * @tc.name      : packing ImageSource - promise - no format
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.call return array
     *                 4.callbackcall return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_062-6', 0, async function (done) {
        try {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_062-6 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                    console.info('TC_062-6 create image packer failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let packOpts = { quality: 50 }
                    imagePackerApi.packing(imageSourceApi, packOpts)
                        .then(data => {
                            console.info('TC_062-6 failed');
                            expect(data == undefined).assertTrue();
                            done();
                        }).catch(error => {
                            console.log('TC_062-6 error: ' + error);
                            console.log('TC_062-6 success');
                            expect(true).assertTrue();
                            done();
                        })
                }
            }
        } catch (error) {
            console.info('TC_062-6 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
         * @tc.number    : TC_062-7 
         * @tc.name      : packing ImageSource - callback - quality 100
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */

    it('TC_062-7', 0, async function (done) {
        try {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_062-7 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                    console.info('TC_062-7 create image packer failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let packOpts = { format: "image/jpeg", quality: 100 }
                    imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
                        if (err) {
                            expect(false).assertTrue();
                            console.info('TC_062-7 error: ' + err);
                            done();
                            return
                        }
                        if (data != undefined) {
                            console.info('TC_062-7 success');
                            expect(true).assertTrue();
                            done();
                        } else {
                            except(false).assertTrue();
                            console.info('TC_062-7 failed');
                            done();
                        }
                    })
                }
            }
        } catch (error) {
            console.info('TC_062-7 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_062-8 
     * @tc.name      : packing ImageSource - callback - quality 0
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     *                 4.callbackcall return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_062-8', 0, async function (done) {
        try {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_062-8 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                    console.info('TC_062-8 create image packer failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let packOpts = { format: "image/jpeg", quality: 0 }
                    imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
                        console.info('TC_062-8 success');
                        expect(data != undefined).assertTrue();
                        done();
                    })
                }
            }
        } catch (error) {
            console.info('TC_062-8 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_062-9 
     * @tc.name      : packing ImageSource - callback - quality -1
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     *                 4.callbackcall return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_062-9', 0, async function (done) {
        try {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_062-9 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                    console.info('TC_062-9 create image packer failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let packOpts = { format: "image/jpeg", quality: -1 }
                    imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
                        console.info('TC_062-9 success');
                        expect(data == undefined).assertTrue();
                        done();
                    })
                }
            }
        } catch (error) {
            console.info('TC_062-9 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

})}
