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

export default function Image() {
describe('Image', function () {

    beforeAll(async function () {
        await applyPermission();
        console.info('beforeAll case');
    })

    beforeEach(function () {
        isTimeOut = false;
        console.info('beforeEach case');
    })

    afterEach(async function () {
        console.info('afterEach case');
    })

    afterAll(function () {
        console.info('afterAll case');
    })

    async function applyPermission() {
        console.info('[permission]case applyPermission in');
        let appInfo = await bundle.getApplicationInfo('ohos.acts.multimedia.image.YUV', 0, 100);
        let atManager = abilityAccessCtrl.createAtManager();
        if (atManager != null) {
            let tokenID = appInfo.accessTokenId;
            console.info('[permission]case accessTokenId is' + tokenID);
            let permissionName1 = 'ohos.permission.MEDIA_LOCATION';
            let permissionName2 = 'ohos.permission.READ_MEDIA';
            let permissionName3 = 'ohos.permission.WRITE_MEDIA';
            await atManager.grantUserGrantedPermission(tokenID, permissionName1).then((result) => {
                console.info('[permission]case grantUserGrantedPermission success:' + result);
            }).catch((err) => {
                console.info('[permission]case grantUserGrantedPermission failed:' + err);
            });
            await atManager.grantUserGrantedPermission(tokenID, permissionName2).then((result) => {
                console.info('[permission]case grantUserGrantedPermission success:' + result);
            }).catch((err) => {
                console.info('[permission]case grantUserGrantedPermission failed:' + err);
            });
            await atManager.grantUserGrantedPermission(tokenID, permissionName3).then((result) => {
                console.info('[permission]case grantUserGrantedPermission success:' + result);
            }).catch((err) => {
                console.info('[permission]case grantUserGrantedPermission failed:' + err);
            });
        } else {
            console.info('[permission]case apply permission failed,createAtManager failed');
        }
    }

    function createBuffer(height, width) {
        var ySize = height * width;
        var uvSize = ySize / 2
        var ySum = ySize;
        var uvSum = uvSize / 2;
        var bufferSize = ySize + uvSize;
        var yBase = 0;
        var uvBase = yBase + ySize;
        var yuv = new ArrayBuffer(bufferSize);
        var yuvArr = new Uint8Array(yuv);
        for (var p = 0; p < ySum; p++) {
            var pos = yBase + p;
            yuvArr[pos] = 1 + p;
        }
        for (var p = 0; p < uvSum; p++) {
            var pos = uvBase + p * 2;
            yuvArr[pos + 0] = 41 + p;
            yuvArr[pos + 1] = 71 + p;
        }
        return yuv;
    }

    async function yuvToJpegByPixelMapPromise(done, testNum, sourceOptions, yuvData) {
        try {
            let imageSource = image.createImageSource(yuvData, sourceOptions)
            if (imageSource == undefined) {
                console.info(`${testNum} create ImageSource failed`);
                expect(false).assertTrue()
                done();
            } else {
                imageSource.createPixelMap()
                    .then((pixelmap) => {
                        if (pixelmap == undefined) {
                            expect(false).assertTrue();
                            done();
                        } else {
                            pixelmap.getImageInfo((err, imageInfo) => {
                                if (err != undefined) {
                                    expect(false).assertTrue();
                                    done();
                                    return;
                                }
                                expect(imageInfo != undefined).assertTrue();
                                expect(imageInfo.size.height == 4).assertTrue();
                                expect(imageInfo.size.width == 6).assertTrue();
                                done();
                            })
                        }
                    }).catch(error => {
                        console.info(`${testNum} create Pixelmap failed`);
                        console.log(`${testNum} error:` + error);
                        expect(false).assertTrue();
                        done();
                    })
            }
        } catch (error) {
            logger.log(`${testNum} error:` + error);
            expect(false).assertTrue();
            done();
        }
    }

    async function yuvToJpegByPixelMapPromise_fail(done, testNum, sourceOptions, yuvData) {
        try {
            let imageSource = image.createImageSource(yuvData, sourceOptions)
            if (imageSource == undefined) {
                console.info(`${testNum} create ImageSource failed`);
                expect(false).assertTrue()
                done();
            } else {
                imageSource.createPixelMap()
                    .then((pixelmap) => {
                        expect(false).assertTrue();
                        done();
                    }).catch(error => {
                        console.info(`${testNum} error:` + error);
                        expect(true).assertTrue();
                        done();
                    })
            }
        } catch (error) {
            logger.log(`${testNum} error:` + error);
            expect(false).assertTrue();
            done();
        }
    }

    async function yuvToJpegByPixelMapCallback(done, testNum, sourceOptions, yuvData) {
        console.info(`${testNum} test`);
        try {
            let imageSource = image.createImageSource(yuvData, sourceOptions);
            if (imageSource == undefined) {
                console.info(`${testNum} create ImageSource failed`);
                expect(false).assertTrue()
                done();
            } else {
                imageSource.createPixelMap((err, pixelmap) => {
                    if (err != undefined || pixelmap == undefined) {
                        console.info(`${testNum} err2: ` + err);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    pixelmap.getImageInfo((err, imageInfo) => {
                        if (err != undefined) {
                            console.info(`${testNum} getImageInfo fail`);
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        expect(imageInfo != undefined).assertTrue();
                        expect(imageInfo.size.height == 4).assertTrue();
                        expect(imageInfo.size.width == 6).assertTrue();
                        done();
                    })

                })
            }
        } catch (error) {
            logger.log(`${testNum} error:` + error);
            expect(false).assertTrue();
            done();
        }
    }

    async function yuvToJpegByPixelMapCallback_fail(done, testNum, sourceOptions, yuvData) {
        try {
            let imageSource = image.createImageSource(yuvData, sourceOptions);
            if (imageSource == undefined) {
                console.info(`${testNum} create ImageSource failed`);
                expect(false).assertTrue()
                done();
            } else {
                imageSource.createPixelMap((err, pixelmap) => {
                    if (err != undefined || pixelmap == undefined) {
                        console.info(`${testNum} err: ` + err);
                        expect(true).assertTrue();
                        done();
                        return;
                    }
                    expect(false).assertTrue();
                    done();
                })
            }
        } catch (error) {
            logger.log(`${testNum} error:` + error);
            expect(false).assertTrue();
            done();
        }
    }

    async function yuvToJpegByImageSourcePromise(done, testNum, sourceOptions, arg, yuvData) {
        let imageSource = image.createImageSource(yuvData, sourceOptions);
        if (imageSource == undefined) {
            console.info(`${testNum} create ImageSource failed`);
            expect(false).assertTrue()
            done();
        } else {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
                console.info(`${testNum} create ImagePacker failed`);
                expect(false).assertTrue();
                done();
            } else {
                imagePackerApi.packing(imageSource, arg)
                    .then(data => {
                        console.info(`${testNum} packed`);
                        var dataArr = new Uint8Array(data);
                        console.info(`${testNum} dataArr.length=` + dataArr.length);
                        for (var i = 0; i < dataArr.length; i++) {
                            var str = `dataArr[` + i + `]=`;
                            for (var j = 0; ((j < 20) && (i < dataArr.length)); j++, i++) {
                                str = str + "," + dataArr[i];
                            }
                            console.info(`${testNum} ` + str);
                            i--;
                        }
                        expect(data != undefined).assertTrue();
                        done();
                    }).catch(error => {
                        console.log(`${testNum} error: ` + error);
                        expect(false).assertTrue();
                        done();
                    })
            }
        }
    }

    async function yuvToJpegByImageSourcePromise_fail(done, testNum, sourceOptions, arg, yuvData) {
        let imageSource = image.createImageSource(yuvData, sourceOptions);
        if (imageSource == undefined) {
            console.info(`${testNum} create ImageSource failed`);
            expect(false).assertTrue()
            done();
        } else {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
                console.info(`${testNum} create ImagePacker failed`);
                expect(false).assertTrue();
                done();
            } else {
                imagePackerApi.packing(imageSource, arg)
                    .then(data => {
                        expect(data == undefined).assertTrue();
                        done();
                    }).catch(error => {
                        console.log(`${testNum} error: ` + error);
                        expect(true).assertTrue();
                        done();
                    })
            }
        }
    }

    async function yuvToJpegByImageSourceCallback(done, testNum, sourceOptions, arg, yuvData) {
        let imageSource = image.createImageSource(yuvData, sourceOptions);
        if (imageSource == undefined) {
            console.info(`${testNum} create ImageSource failed`);
            expect(false).assertTrue()
            done();
        } else {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
                console.info(`${testNum} create ImagePacker failed`);
                expect(false).assertTrue();
                done();
            } else {
                imagePackerApi.packing(imageSource, arg, (err, data) => {
                    if (err != undefined) {
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    var dataArr = new Uint8Array(data);
                    console.info(`${testNum} dataArr.length=` + dataArr.length);
                    for (var i = 0; i < dataArr.length; i++) {
                        var str = `dataArr[` + i + `]=`;
                        for (var j = 0; ((j < 20) && (i < dataArr.length)); j++, i++) {
                            str = str + "," + dataArr[i];
                        }
                        console.info(`${testNum} ` + str);
                        i--;
                    }
                    expect(data != undefined).assertTrue();
                    done();
                })
            }
        }
    }

    async function yuvToJpegByImageSourceCallback_fail(done, testNum, sourceOptions, arg, yuvData) {
        let imageSource = image.createImageSource(yuvData, sourceOptions);
        if (imageSource == undefined) {
            console.info(`${testNum} create ImageSource failed`);
            expect(false).assertTrue()
            done();
        } else {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
                console.info(`${testNum} create ImagePacker failed`);
                expect(false).assertTrue();
                done();
            } else {
                imagePackerApi.packing(imageSource, arg, (err, data) => {
                    expect(err != undefined || data == undefined).assertTrue();
                    done();
                })
            }
        }
    }

    /**
     * @tc.number    : SUB_IMAGE_yuv_pixelmap_P_001
     * @tc.name      : SUB_IMAGE_yuv_pixelmap_P_001
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_pixelmap_P_001', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 8, sourceSize: { height: 4, width: 6 } };
        yuvToJpegByPixelMapPromise(done, 'SUB_IMAGE_yuv_pixelmap_P_001', sourceOptions, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_pixelmap_P_002
     * @tc.name      : SUB_IMAGE_yuv_pixelmap_P_002
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_pixelmap_P_002', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 9, sourceSize: { height: 4, width: 6 } };
        yuvToJpegByPixelMapPromise(done, 'SUB_IMAGE_yuv_pixelmap_P_002', sourceOptions, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_pixelmap_P_003
     * @tc.name      : SUB_IMAGE_yuv_pixelmap_P_003 - Promise - wrong buffer
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_pixelmap_P_003', 0, async function (done) {
        let yuvData = new ArrayBuffer(5);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 8, sourceSize: { height: 4, width: 6 } };
        yuvToJpegByPixelMapPromise(done, 'SUB_IMAGE_yuv_pixelmap_P_003', sourceOptions, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_pixelmap_P_004
     * @tc.name      : SUB_IMAGE_yuv_pixelmap_P_004 - Promise - wrong width
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_pixelmap_P_004', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 8, sourceSize: { height: 4, width: 5 } };
        yuvToJpegByPixelMapPromise_fail(done, 'SUB_IMAGE_yuv_pixelmap_P_004', sourceOptions, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_pixelmap_P_005
     * @tc.name      : SUB_IMAGE_yuv_pixelmap_P_005 - Promise - wrong buffer
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_pixelmap_P_005', 0, async function (done) {
        let yuvData = new ArrayBuffer(5);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 9, sourceSize: { height: 4, width: 6 } };
        yuvToJpegByPixelMapPromise(done, 'SUB_IMAGE_yuv_pixelmap_P_005', sourceOptions, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_pixelmap_P_006
     * @tc.name      : SUB_IMAGE_yuv_pixelmap_P_006 - Promise - wrong width
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_pixelmap_P_006', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 9, sourceSize: { height: 4, width: 5 } };
        yuvToJpegByPixelMapPromise_fail(done, 'SUB_IMAGE_yuv_pixelmap_P_006', sourceOptions, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_pixelmap_P_007
     * @tc.name      : SUB_IMAGE_yuv_pixelmap_P_007 - Promise - wrong format
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_pixelmap_P_007', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 10, sourceSize: { height: 4, width: 6 } };
        yuvToJpegByPixelMapPromise_fail(done, 'SUB_IMAGE_yuv_pixelmap_P_007', sourceOptions, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_pixelmap_P_008
     * @tc.name      : SUB_IMAGE_yuv_pixelmap_P_008 - Promise - format null
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_pixelmap_P_008', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourceSize: { height: 4, width: 6 } };
        yuvToJpegByPixelMapPromise_fail(done, 'SUB_IMAGE_yuv_pixelmap_P_008', sourceOptions, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_imagesource_P_001
     * @tc.name      : SUB_IMAGE_yuv_imagesource_P_001
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     *                 3.create ImagePacker
     *                 4.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_imagesource_P_001', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 8, sourceSize: { height: 4, width: 6 } };
        let packOpts = { format: "image/jpeg", quality: 99 }
        yuvToJpegByImageSourcePromise(done, 'SUB_IMAGE_yuv_imagesource_P_001', sourceOptions, packOpts, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_imagesource_P_002
     * @tc.name      : SUB_IMAGE_yuv_imagesource_P_002
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     *                 3.create ImagePacker
     *                 4.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_imagesource_P_002', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 9, sourceSize: { height: 4, width: 6 } };
        let packOpts = { format: "image/jpeg", quality: 99 }
        yuvToJpegByImageSourcePromise(done, 'SUB_IMAGE_yuv_imagesource_P_002', sourceOptions, packOpts, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_imagesource_P_003
     * @tc.name      : SUB_IMAGE_yuv_imagesource_P_003 - Promise - wrong buffer
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     *                 3.create ImagePacker
     *                 4.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_imagesource_P_003', 0, async function (done) {
        let yuvData = new ArrayBuffer(5);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 8, sourceSize: { height: 4, width: 6 } };
        let packOpts = { format: "image/jpeg", quality: 99 }
        yuvToJpegByImageSourcePromise(done, 'SUB_IMAGE_yuv_imagesource_P_003', sourceOptions, packOpts, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_imagesource_P_004
     * @tc.name      : SUB_IMAGE_yuv_imagesource_P_004 - Promise - wrong width
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     *                 3.create ImagePacker
     *                 4.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_imagesource_P_004', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 8, sourceSize: { height: 4, width: 5 } };
        let packOpts = { format: "image/jpeg", quality: 99 }
        yuvToJpegByImageSourcePromise_fail(done, 'SUB_IMAGE_yuv_imagesource_P_004', sourceOptions, packOpts, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_imagesource_P_005
     * @tc.name      : SUB_IMAGE_yuv_imagesource_P_005 - Promise - wrong buffer
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     *                 3.create ImagePacker
     *                 4.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_imagesource_P_005', 0, async function (done) {
        let yuvData = new ArrayBuffer(5);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 9, sourceSize: { height: 4, width: 6 } };
        let packOpts = { format: "image/jpeg", quality: 99 }
        yuvToJpegByImageSourcePromise(done, 'SUB_IMAGE_yuv_imagesource_P_005', sourceOptions, packOpts, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_imagesource_P_006
     * @tc.name      : SUB_IMAGE_yuv_imagesource_P_006 - Promise - wrong width
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     *                 3.create ImagePacker
     *                 4.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_imagesource_P_006', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 9, sourceSize: { height: 4, width: 5 } };
        let packOpts = { format: "image/jpeg", quality: 99 }
        yuvToJpegByImageSourcePromise_fail(done, 'SUB_IMAGE_yuv_imagesource_P_006', sourceOptions, packOpts, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_imagesource_P_007
     * @tc.name      : SUB_IMAGE_yuv_imagesource_P_007 - Promise - wrong format
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     *                 3.create ImagePacker
     *                 4.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_imagesource_P_007', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 10, sourceSize: { height: 4, width: 6 } };
        let packOpts = { format: "image/jpeg", quality: 99 }
        yuvToJpegByImageSourcePromise_fail(done, 'SUB_IMAGE_yuv_imagesource_P_007', sourceOptions, packOpts, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_imagesource_P_008
     * @tc.name      : SUB_IMAGE_yuv_imagesource_P_008 - Promise - format null
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     *                 3.create ImagePacker
     *                 4.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_imagesource_P_008', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourceSize: { height: 4, width: 6 } };
        let packOpts = { format: "image/jpeg", quality: 99 }
        yuvToJpegByImageSourcePromise_fail(done, 'SUB_IMAGE_yuv_imagesource_P_008', sourceOptions, packOpts, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_pixelmap_CB_001
     * @tc.name      : SUB_IMAGE_yuv_pixelmap_CB_001
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_pixelmap_CB_001', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 8, sourceSize: { height: 4, width: 6 } };
        yuvToJpegByPixelMapCallback(done, 'SUB_IMAGE_yuv_pixelmap_CB_001', sourceOptions, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_pixelmap_CB_002
     * @tc.name      : SUB_IMAGE_yuv_pixelmap_CB_002
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_pixelmap_CB_002', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 9, sourceSize: { height: 4, width: 6 } };
        yuvToJpegByPixelMapCallback(done, 'SUB_IMAGE_yuv_pixelmap_CB_002', sourceOptions, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_pixelmap_CB_003
     * @tc.name      : SUB_IMAGE_yuv_pixelmap_CB_003 - Promise - wrong buffer
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_pixelmap_CB_003', 0, async function (done) {
        let yuvData = new ArrayBuffer(5);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 8, sourceSize: { height: 4, width: 6 } };
        yuvToJpegByPixelMapCallback(done, 'SUB_IMAGE_yuv_pixelmap_CB_003', sourceOptions, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_pixelmap_CB_004
     * @tc.name      : SUB_IMAGE_yuv_pixelmap_CB_004 - Promise - wrong width
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_pixelmap_CB_004', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 8, sourceSize: { height: 4, width: 5 } };
        yuvToJpegByPixelMapCallback_fail(done, 'SUB_IMAGE_yuv_pixelmap_CB_004', sourceOptions, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_pixelmap_CB_005
     * @tc.name      : SUB_IMAGE_yuv_pixelmap_CB_005 - Promise - wrong buffer
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_pixelmap_CB_005', 0, async function (done) {
        let yuvData = new ArrayBuffer(5);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 9, sourceSize: { height: 4, width: 6 } };
        yuvToJpegByPixelMapCallback(done, 'SUB_IMAGE_yuv_pixelmap_CB_005', sourceOptions, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_pixelmap_CB_006
     * @tc.name      : SUB_IMAGE_yuv_pixelmap_CB_006 - Promise - wrong width
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_pixelmap_CB_006', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 9, sourceSize: { height: 4, width: 5 } };
        yuvToJpegByPixelMapCallback_fail(done, 'SUB_IMAGE_yuv_pixelmap_CB_006', sourceOptions, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_pixelmap_CB_007
     * @tc.name      : SUB_IMAGE_yuv_pixelmap_CB_007 - Promise - wrong format
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_pixelmap_CB_007', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 10, sourceSize: { height: 4, width: 6 } };
        yuvToJpegByPixelMapCallback_fail(done, 'SUB_IMAGE_yuv_pixelmap_CB_007', sourceOptions, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_pixelmap_CB_008
     * @tc.name      : SUB_IMAGE_yuv_pixelmap_CB_008 - Promise - format null
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_pixelmap_CB_008', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourceSize: { height: 4, width: 6 } };
        yuvToJpegByPixelMapCallback_fail(done, 'SUB_IMAGE_yuv_pixelmap_CB_008', sourceOptions, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_imagesource_CB_001
     * @tc.name      : SUB_IMAGE_yuv_imagesource_CB_001
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     *                 3.create ImagePacker
     *                 4.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_imagesource_CB_001', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 8, sourceSize: { height: 4, width: 6 } };
        let packOpts = { format: "image/jpeg", quality: 99 }
        yuvToJpegByImageSourceCallback(done, 'SUB_IMAGE_yuv_imagesource_CB_001', sourceOptions, packOpts, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_imagesource_CB_002
     * @tc.name      : SUB_IMAGE_yuv_imagesource_CB_002
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     *                 3.create ImagePacker
     *                 4.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_imagesource_CB_002', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 9, sourceSize: { height: 4, width: 6 } };
        let packOpts = { format: "image/jpeg", quality: 99 }
        yuvToJpegByImageSourceCallback(done, 'SUB_IMAGE_yuv_imagesource_CB_002', sourceOptions, packOpts, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_imagesource_CB_003
     * @tc.name      : SUB_IMAGE_yuv_imagesource_CB_003 - Promise - wrong buffer
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     *                 3.create ImagePacker
     *                 4.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_imagesource_CB_003', 0, async function (done) {
        let yuvData = new ArrayBuffer(5);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 8, sourceSize: { height: 4, width: 6 } };
        let packOpts = { format: "image/jpeg", quality: 99 }
        yuvToJpegByImageSourceCallback(done, 'SUB_IMAGE_yuv_imagesource_CB_003', sourceOptions, packOpts, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_imagesource_CB_004
     * @tc.name      : SUB_IMAGE_yuv_imagesource_CB_004 - Promise - wrong width
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     *                 3.create ImagePacker
     *                 4.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_imagesource_CB_004', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 8, sourceSize: { height: 4, width: 5 } };
        let packOpts = { format: "image/jpeg", quality: 99 }
        yuvToJpegByImageSourceCallback_fail(done, 'SUB_IMAGE_yuv_imagesource_CB_004', sourceOptions, packOpts, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_imagesource_CB_005
     * @tc.name      : SUB_IMAGE_yuv_imagesource_CB_005 - Promise - wrong buffer
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     *                 3.create ImagePacker
     *                 4.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_imagesource_CB_005', 0, async function (done) {
        let yuvData = new ArrayBuffer(5);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 9, sourceSize: { height: 4, width: 6 } };
        let packOpts = { format: "image/jpeg", quality: 99 }
        yuvToJpegByImageSourceCallback(done, 'SUB_IMAGE_yuv_imagesource_CB_005', sourceOptions, packOpts, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_imagesource_CB_006
     * @tc.name      : SUB_IMAGE_yuv_imagesource_CB_006 - Promise - wrong width
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     *                 3.create ImagePacker
     *                 4.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_imagesource_CB_006', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 9, sourceSize: { height: 4, width: 5 } };
        let packOpts = { format: "image/jpeg", quality: 99 }
        yuvToJpegByImageSourceCallback_fail(done, 'SUB_IMAGE_yuv_imagesource_CB_006', sourceOptions, packOpts, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_imagesource_CB_007
     * @tc.name      : SUB_IMAGE_yuv_imagesource_CB_007 - Promise - wrong format
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     *                 3.create ImagePacker
     *                 4.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_imagesource_CB_007', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourcePixelFormat: 10, sourceSize: { height: 4, width: 6 } };
        let packOpts = { format: "image/jpeg", quality: 99 }
        yuvToJpegByImageSourceCallback_fail(done, 'SUB_IMAGE_yuv_imagesource_CB_007', sourceOptions, packOpts, yuvData)
    })

    /**
     * @tc.number    : SUB_IMAGE_yuv_imagesource_CB_008
     * @tc.name      : SUB_IMAGE_yuv_imagesource_CB_008 - Promise - format null
     * @tc.desc      : 1.create ImageSource
     *                 2.create pixelmap
     *                 3.create ImagePacker
     *                 4.call packing
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it('SUB_IMAGE_yuv_imagesource_CB_008', 0, async function (done) {
        let yuvData = createBuffer(4, 6);
        let sourceOptions = { sourceDensity: 120, sourceSize: { height: 4, width: 6 } };
        let packOpts = { format: "image/jpeg", quality: 99 }
        yuvToJpegByImageSourceCallback_fail(done, 'SUB_IMAGE_yuv_imagesource_CB_008', sourceOptions, packOpts, yuvData)
    })
})}
