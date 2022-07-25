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
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'

export default function Image() {
describe('Image', function () {
    var pathJpg = '/data/storage/el2/base/files/test.jpg';
    var pathWebp = '/data/storage/el2/base/files/test_large.webp';
    var pathPng = '/data/storage/el2/base/files/test.png';
    var pathBmp = '/data/storage/el2/base/files/test.bmp';
    var pathGif = '/data/storage/el2/base/files/test.gif';
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

    async function applyPermission() {
        let appInfo = await bundle.getApplicationInfo('ohos.acts.multimedia.image.Webp', 0, 100);
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

    async function createPixMapCbErr(done, testNum, arg) {
        let fdNumber = fileio.openSync(pathWebp);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info(`${testNum} create image source failed`);
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.createPixelMap(arg, (err, pixelmap) => {
                if (pixelmap == undefined) {
                    expect(true).assertTrue();
                    console.info(`${testNum} success `);
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    }
    async function createPixMapPromiseErr(done, testNum, arg) {
        let fdNumber = fileio.openSync(pathWebp);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info(`${testNum} create image source failed`);
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.createPixelMap(arg).then(pixelmap => {
                console.log(`${testNum} failed`);
                expect().assertFail();
                done();
            }).catch(error => {
                console.log(`${testNum} success `);
                expect(true).assertTrue();
                done();
            })
        }
    }
    async function packingPromise(done, testNum, arg) {
        console.info(`${testNum} enter`);
        var height = 4
        var width = 6
        var pixelSize = 4
        var widthSize = width * pixelSize
        var bufferSize = height * widthSize
        const color = new ArrayBuffer(bufferSize);
        var colorArr = new Uint8Array(color);
        for (var h = 0; h < height / 2; h++) {
            for (var w = 0; w < width / 2; w++) {
                var pos = widthSize * h + pixelSize * w
                colorArr[pos + 0] = 255; // r
                colorArr[pos + 1] = 0;
                colorArr[pos + 2] = 0;
                colorArr[pos + 3] = 255;
            }
        }
        for (var h = 0; h < height / 2; h++) {
            for (var w = width / 2; w < width; w++) {
                var pos = widthSize * h + pixelSize * w
                colorArr[pos + 0] = 0;
                colorArr[pos + 1] = 255; // g
                colorArr[pos + 2] = 0;
                colorArr[pos + 3] = 255;
            }
        }
        for (var h = height / 2; h < height; h++) {
            for (var w = 0; w < width / 2; w++) {
                var pos = widthSize * h + pixelSize * w
                colorArr[pos + 0] = 0;
                colorArr[pos + 1] = 0;
                colorArr[pos + 2] = 255; // b
                colorArr[pos + 3] = 255;
            }
        }
        for (var h = height / 2; h < height; h++) {
            for (var w = width / 2; w < width; w++) {
                var pos = widthSize * h + pixelSize * w
                colorArr[pos + 0] = 0;
                colorArr[pos + 1] = 0;
                colorArr[pos + 2] = 0;
                colorArr[pos + 3] = 255;
            }
        }

        let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts)
            .then(pixelmap => {
                if (pixelmap == undefined) {
                    console.info('${testNum} create pixelmap failed');
                    expect(false).assertTrue()
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info(`${testNum} create image packer failed`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        imagePackerApi.packing(pixelmap, arg)
                            .then(data => {
                                console.info(`${testNum} success`);
                                expect(data != undefined).assertTrue();
                                var dataArr = new Uint8Array(data);
                                console.info(`${testNum} dataArr.length=` + dataArr.length);
                                for (var i = 0; i < dataArr.length; i++) {
                                    console.info(`dataArr[` + i + `]=` + dataArr[i]);
                                }
                                done();
                            }).catch(error => {
                                console.log(`${testNum} error: ` + error);
                                expect(false).assertFail();
                                done();
                            })
                    }
                }
            })
        console.info(`${testNum} leave`);
    }

    async function packingCb(done, testNum, arg) {
        console.info(`${testNum} enter`);
        var height = 4
        var width = 6
        var pixelSize = 4
        var widthSize = width * pixelSize
        var bufferSize = height * widthSize
        const color = new ArrayBuffer(bufferSize);
        var colorArr = new Uint8Array(color);
        for (var h = 0; h < height / 2; h++) {
            for (var w = 0; w < width / 2; w++) {
                var pos = widthSize * h + pixelSize * w
                colorArr[pos + 0] = 255; // r
                colorArr[pos + 1] = 0;
                colorArr[pos + 2] = 0;
                colorArr[pos + 3] = 255;
            }
        }
        for (var h = 0; h < height / 2; h++) {
            for (var w = width / 2; w < width; w++) {
                var pos = widthSize * h + pixelSize * w
                colorArr[pos + 0] = 0;
                colorArr[pos + 1] = 255; // g
                colorArr[pos + 2] = 0;
                colorArr[pos + 3] = 255;
            }
        }
        for (var h = height / 2; h < height; h++) {
            for (var w = 0; w < width / 2; w++) {
                var pos = widthSize * h + pixelSize * w
                colorArr[pos + 0] = 0;
                colorArr[pos + 1] = 0;
                colorArr[pos + 2] = 255; // b
                colorArr[pos + 3] = 255;
            }
        }
        for (var h = height / 2; h < height; h++) {
            for (var w = width / 2; w < width; w++) {
                var pos = widthSize * h + pixelSize * w
                colorArr[pos + 0] = 0;
                colorArr[pos + 1] = 0;
                colorArr[pos + 2] = 0;
                colorArr[pos + 3] = 255;
            }
        }

        let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts)
            .then(pixelmap => {
                if (pixelmap == undefined) {
                    console.info('${testNum} create pixelmap failed');
                    expect(false).assertTrue()
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info(`${testNum} create image packer failed`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        imagePackerApi.packing(pixelmap, arg, (err, data) => {
                            console.info(`${testNum} success`);
                            expect(data != undefined).assertTrue();
                            var dataArr = new Uint8Array(data);
                            console.info(`${testNum} dataArr.length=` + dataArr.length);
                            for (var i = 0; i < dataArr.length; i++) {
                                console.info(`dataArr[` + i + `]=` + dataArr[i]);
                            }
                            done();
                        })
                    }
                }
            }).catch(error => {
                console.log(`${testNum} error: ` + error);
                expect(false).assertFail();
                done();
            })
        console.info(`${testNum} leave`);
    }

    async function packingPromiseErr(done, testNum, arg) {
        console.info(`${testNum} enter`);
        var height = 4
        var width = 6
        var pixelSize = 4
        var widthSize = width * pixelSize
        var bufferSize = height * widthSize
        const color = new ArrayBuffer(bufferSize);
        var colorArr = new Uint8Array(color);
        for (var h = 0; h < height / 2; h++) {
            for (var w = 0; w < width / 2; w++) {
                var pos = widthSize * h + pixelSize * w
                colorArr[pos + 0] = 255; // r
                colorArr[pos + 1] = 0;
                colorArr[pos + 2] = 0;
                colorArr[pos + 3] = 255;
            }
        }
        for (var h = 0; h < height / 2; h++) {
            for (var w = width / 2; w < width; w++) {
                var pos = widthSize * h + pixelSize * w
                colorArr[pos + 0] = 0;
                colorArr[pos + 1] = 255; // g
                colorArr[pos + 2] = 0;
                colorArr[pos + 3] = 255;
            }
        }
        for (var h = height / 2; h < height; h++) {
            for (var w = 0; w < width / 2; w++) {
                var pos = widthSize * h + pixelSize * w
                colorArr[pos + 0] = 0;
                colorArr[pos + 1] = 0;
                colorArr[pos + 2] = 255; // b
                colorArr[pos + 3] = 255;
            }
        }
        for (var h = height / 2; h < height; h++) {
            for (var w = width / 2; w < width; w++) {
                var pos = widthSize * h + pixelSize * w
                colorArr[pos + 0] = 0;
                colorArr[pos + 1] = 0;
                colorArr[pos + 2] = 0;
                colorArr[pos + 3] = 255;
            }
        }

        let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts)
            .then(pixelmap => {
                if (pixelmap == undefined) {
                    console.info('${testNum} create pixelmap failed');
                    expect(false).assertTrue()
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info(`${testNum} create image packer failed`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        imagePackerApi.packing(pixelmap, arg)
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
            })
        console.info(`${testNum} leave`);
    }

    async function packingCbErr(done, testNum, arg) {
        console.info(`${testNum} enter`);
        var height = 4
        var width = 6
        var pixelSize = 4
        var widthSize = width * pixelSize
        var bufferSize = height * widthSize
        const color = new ArrayBuffer(bufferSize);
        var colorArr = new Uint8Array(color);
        for (var h = 0; h < height / 2; h++) {
            for (var w = 0; w < width / 2; w++) {
                var pos = widthSize * h + pixelSize * w
                colorArr[pos + 0] = 255; // r
                colorArr[pos + 1] = 0;
                colorArr[pos + 2] = 0;
                colorArr[pos + 3] = 255;
            }
        }
        for (var h = 0; h < height / 2; h++) {
            for (var w = width / 2; w < width; w++) {
                var pos = widthSize * h + pixelSize * w
                colorArr[pos + 0] = 0;
                colorArr[pos + 1] = 255; // g
                colorArr[pos + 2] = 0;
                colorArr[pos + 3] = 255;
            }
        }
        for (var h = height / 2; h < height; h++) {
            for (var w = 0; w < width / 2; w++) {
                var pos = widthSize * h + pixelSize * w
                colorArr[pos + 0] = 0;
                colorArr[pos + 1] = 0;
                colorArr[pos + 2] = 255; // b
                colorArr[pos + 3] = 255;
            }
        }
        for (var h = height / 2; h < height; h++) {
            for (var w = width / 2; w < width; w++) {
                var pos = widthSize * h + pixelSize * w
                colorArr[pos + 0] = 0;
                colorArr[pos + 1] = 0;
                colorArr[pos + 2] = 0;
                colorArr[pos + 3] = 255;
            }
        }

        let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        image.createPixelMap(color, opts)
            .then(pixelmap => {
                if (pixelmap == undefined) {
                    console.info('${testNum} create pixelmap failed');
                    expect(false).assertTrue()
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info(`${testNum} create image packer failed`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        imagePackerApi.packing(pixelmap, arg, (err, data) => {
                            console.info(`${testNum} success`);
                            expect(data == undefined).assertTrue();
                            done();
                        })
                    }
                }
            }).catch(error => {
                console.log(`${testNum} error: ` + error);
                expect(true).assertTrue();
                done();
            })
        console.info(`${testNum} leave`);
    }

    /**
    * @tc.number    : wbp_001
    * @tc.name      : createPixelMap - promise-webp
    * @tc.desc      : 1.create imagesource
    *                 2.set index and DecodeOptions
    *                 3.create PixelMap
    *                 4.return pixelmap
    * @tc.size      : MEDIUM 
    * @tc.type      : Functional
    * @tc.level     : Level 1
    */
    it('wbp_001', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathWebp);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('wbp_001 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };

                imageSourceApi.createPixelMap(decodingOptions).then(pixelmap => {
                    if (pixelmap != undefined) {
                        expect(true).assertTrue();
                        console.info('wbp_001 success ');
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        } catch (error) {
            console.info('wbp_001 error: ' + error);
            expect(false).assertTrue();
            done();
        }

    })

    /**
     * @tc.number    : wbp_002
     * @tc.name      : createPixelMap - callback-webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('wbp_002', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathWebp);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('wbp_002 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };

                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (pixelmap != undefined) {
                        expect(true).assertTrue();
                        console.info('wbp_002 success ');
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        } catch (error) {
            console.info('wbp_002 error: ' + error);
            expect(false).assertTrue();
            done();
        }

    })

    /**
     * @tc.number    : wbp_003
     * @tc.name      : createPixelMap-promise-webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('wbp_003', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathWebp);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('wbp_003 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.createPixelMap().then(pixelmap => {
                    expect(pixelmap != undefined).assertTrue();
                    console.info('wbp_003 success ');
                    done();
                }).catch(error => {
                    console.log('wbp_003 error: ' + error);
                    expect().assertFail();
                    done();
                })
            }
        } catch (error) {
            console.info('wbp_003 err ' + error);
        }

    })

    /**
     * @tc.number    : wbp_004
     * @tc.name      : createPixelMap-callback-webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('wbp_004', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathWebp);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('wbp_004 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.createPixelMap((err, pixelmap) => {
                    expect(pixelmap != undefined).assertTrue();
                    console.info('wbp_004 success ');
                    done();
                })
            }
        } catch (error) {
            console.info('wbp_004 err ' + error);
        }

    })

    /**
     * @tc.number    : wbp_005
     * @tc.name      : createPixelMap-callback -{sampleSize: -1} -webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('wbp_005', 0, async function (done) {
        let decodingOptions = {
            sampleSize: -1,
            editable: true,
            desiredSize: { width: 1, height: 2 },
            rotate: 10,
            desiredPixelFormat: 2,
            desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
            index: 0
        };
        createPixMapCbErr(done, 'wbp_005', decodingOptions)
    })

    /**
     * @tc.number    : wbp_006
     * @tc.name      : createPixelMap-callback -{index: -1} -webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('wbp_006', 0, async function (done) {
        let decodingOptions = {
            sampleSize: 1,
            editable: true,
            desiredSize: { width: 1, height: 2 },
            rotate: 10,
            desiredPixelFormat: 0,
            desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
            index: -1
        };
        createPixMapCbErr(done, 'wbp_006', decodingOptions)
    })

    /**
     * @tc.number    : wbp_007
     * @tc.name      : createPixelMap-callback -{rotate: 500} -webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('wbp_007', 0, async function (done) {
        let decodingOptions = {
            sampleSize: 1,
            editable: true,
            desiredSize: { width: 1, height: 2 },
            rotate: 500,
            desiredPixelFormat: 3,
            desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
            index: 0
        };
        createPixMapCbErr(done, 'wbp_007', decodingOptions)
    })

    /**
    * @tc.number    : wbp_007-1
    * @tc.name      : createPixelMap-callback -{rotate: -10} -webp
    * @tc.desc      : 1.create imagesource
    *                 2.set index and DecodeOptions
    *                 3.create PixelMap
    *                 4.return pixelmap undefined
    * @tc.size      : MEDIUM 
    * @tc.type      : Functional
    * @tc.level     : Level 1
    */
    it('wbp_007-1', 0, async function (done) {
        let decodingOptions = {
            sampleSize: 1,
            editable: true,
            desiredSize: { width: 1, height: 2 },
            rotate: -10,
            desiredPixelFormat: 3,
            desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
            index: 0
        };
        createPixMapCbErr(done, 'wbp_007-1', decodingOptions)
    })

    /**
   * @tc.number    : wbp_007-2
   * @tc.name      : createPixelMap-callback editable: false -webp
   * @tc.desc      : 1.create imagesource
   *                 2.set index and DecodeOptions
   *                 3.create PixelMap
   *                 4.return pixelmap undefined
   * @tc.size      : MEDIUM 
   * @tc.type      : Functional
   * @tc.level     : Level 1
   */
    it('wbp_007-2', 0, async function (done) {
        let decodingOptions = {
            sampleSize: 1,
            editable: false,
            desiredSize: { width: 1, height: 2 },
            rotate: 10,
            desiredPixelFormat: 33,
            desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
            index: 0
        };
        createPixMapCbErr(done, 'wbp_007-2', decodingOptions)
    })

    /**
    * @tc.number    : wbp_008
    * @tc.name      : createPixelMap-callback -{ size: { height: 1, width: 2 }, x: -1, y: -1 }-webp
    * @tc.desc      : 1.create imagesource
    *                 2.set index and DecodeOptions
    *                 3.create PixelMap
    *                 4.return pixelmap undefined
    * @tc.size      : MEDIUM 
    * @tc.type      : Functional
    * @tc.level     : Level 1
    */
    it('wbp_008', 0, async function (done) {
        let decodingOptions = {
            sampleSize: 1,
            editable: true,
            desiredSize: { width: 1, height: 2 },
            rotate: 10,
            desiredPixelFormat: 2,
            desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
            index: 0
        };
        createPixMapCbErr(done, 'wbp_008', decodingOptions)
    })

    /**
    * @tc.number    : wbp_009
    * @tc.name      : createPixelMap-callback -size: { height: 10000, width: 10000 } -webp
    * @tc.desc      : 1.create imagesource
    *                 2.set index and DecodeOptions
    *                 3.create PixelMap
    *                 4.return pixelmap undefined
    * @tc.size      : MEDIUM 
    * @tc.type      : Functional
    * @tc.level     : Level 1
    */
    it('wbp_009', 0, async function (done) {
        let decodingOptions = {
            sampleSize: 1,
            editable: true,
            desiredSize: { width: 1, height: 2 },
            rotate: 10,
            desiredPixelFormat: 3,
            desiredRegion: { size: { height: 10000, width: 10000 }, x: 0, y: 0 },
            index: 0
        };
        createPixMapCbErr(done, 'wbp_009', decodingOptions)
    })

    /**
    * @tc.number    : wbp_010
    * @tc.name      : createPixelMap-callback - sampleSize: -1 -webp
    * @tc.desc      : 1.create imagesource
    *                 2.set index and DecodeOptions
    *                 3.create PixelMap
    *                 4.return pixelmap undefined
    * @tc.size      : MEDIUM 
    * @tc.type      : Functional
    * @tc.level     : Level 1
    */
    it('wbp_010', 0, async function (done) {
        let decodingOptions = {
            sampleSize: -1,
            editable: true,
            desiredSize: { width: 1, height: 2 },
            rotate: 10,
            desiredPixelFormat: 2,
            desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
            index: 0
        };
        createPixMapPromiseErr(done, 'wbp_010', decodingOptions)
    })

    /**
    * @tc.number    : wbp_011
    * @tc.name      : createPixelMap-callback - index: -1 -webp
    * @tc.desc      : 1.create imagesource
    *                 2.set index and DecodeOptions
    *                 3.create PixelMap
    *                 4.return pixelmap undefined
    * @tc.size      : MEDIUM 
    * @tc.type      : Functional
    * @tc.level     : Level 1
    */
    it('wbp_011', 0, async function (done) {
        let decodingOptions = {
            sampleSize: 1,
            editable: true,
            desiredSize: { width: 1, height: 2 },
            rotate: 10,
            desiredPixelFormat: 2,
            desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
            index: -1
        };
        createPixMapPromiseErr(done, 'wbp_011', decodingOptions)
    })

    /**
    * @tc.number    : wbp_012
    * @tc.name      : createPixelMap-callback - desiredPixelFormat: 1 -webp
    * @tc.desc      : 1.create imagesource
    *                 2.set index and DecodeOptions
    *                 3.create PixelMap
    *                 4.return pixelmap undefined
    * @tc.size      : MEDIUM 
    * @tc.type      : Functional
    * @tc.level     : Level 1
    */
    it('wbp_012', 0, async function (done) {
        let decodingOptions = {
            sampleSize: 2,
            editable: true,
            desiredSize: { width: 1, height: 2 },
            rotate: 500,
            desiredPixelFormat: 1,
            desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
            index: 0
        };
        createPixMapPromiseErr(done, 'wbp_012', decodingOptions)
    })


    /**
    * @tc.number    : wbp_013
    * @tc.name      : createPixelMap-callback - { size: { height: 1, width: 2 }, x: -1, y: -1 } -webp
    * @tc.desc      : 1.create imagesource
    *                 2.set index and DecodeOptions
    *                 3.create PixelMap
    *                 4.return pixelmap undefined
    * @tc.size      : MEDIUM 
    * @tc.type      : Functional
    * @tc.level     : Level 1
    */
    it('wbp_013', 0, async function (done) {
        let decodingOptions = {
            sampleSize: 1,
            editable: true,
            desiredSize: { width: 1, height: 2 },
            rotate: 10,
            desiredPixelFormat: 3,
            desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
            index: 0
        };
        createPixMapPromiseErr(done, 'wbp_013', decodingOptions)
    })

    /**
    * @tc.number    : wbp_014
    * @tc.name      : createPixelMap-callback -  size: { height: 10000, width:10000 } -webp
    * @tc.desc      : 1.create imagesource
    *                 2.set index and DecodeOptions
    *                 3.create PixelMap
    *                 4.return pixelmap undefined
    * @tc.size      : MEDIUM 
    * @tc.type      : Functional
    * @tc.level     : Level 1
    */
    it('wbp_014', 0, async function (done) {
        let decodingOptions = {
            sampleSize: 1,
            editable: true,
            desiredSize: { width: 1, height: 2 },
            rotate: 10,
            desiredPixelFormat: 2,
            desiredRegion: { size: { height: 10000, width: 10000 }, x: 0, y: 0 },
            index: 0
        };
        createPixMapPromiseErr(done, 'wbp_014', decodingOptions)
    })

    /**
     * @tc.number    : wbp_015
     * @tc.name      : packing - callback-webp
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('wbp_015', 0, async function (done) {
        let packOpts = { format: ["image/webp"], quality: 90 }
        packingCb(done, 'wbp_015', packOpts)
    })

    /**
     * @tc.number    : wbp_016
     * @tc.name      : packing - promise-webp
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('wbp_016', 0, async function (done) {
        let packOpts = { format: ["image/webp"], quality: 100 }
        packingPromise(done, 'wbp_016', packOpts)
    })

    /**
     * @tc.number    : wbp_017
     * @tc.name      : packing - promise-webp-wrong quality
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('wbp_017', 0, async function (done) {
        let packOpts = { format: ["image/webp"], quality: 123 }
        packingPromiseErr(done, 'wbp_017', packOpts)
    })

    /**
     * @tc.number    : wbp_018
     * @tc.name      : packing - promise-webp
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('wbp_018', 0, async function (done) {
        let packOpts = { format: ["image/gif"], quality: 90 }
        packingPromiseErr(done, 'wbp_018', packOpts)
    })

    /**
     * @tc.number    : wbp_019
     * @tc.name      : packing - promise-webp-no format
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('wbp_019', 0, async function (done) {
        let packOpts = { quality: 90 }
        packingPromiseErr(done, 'wbp_019', packOpts)
    })

    /**
     * @tc.number    : wbp_020
     * @tc.name      : packing - promise-webp-no format
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('wbp_020', 0, async function (done) {
        let packOpts = { format: ["image/jpeg"] }
        packingPromiseErr(done, 'wbp_020', packOpts)
    })

    /**
     * @tc.number    : wbp_021
     * @tc.name      : packing - callback-webp-wrong format
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('wbp_021', 0, async function (done) {
        let packOpts = { format: ["image/gif"], quality: 100 }
        packingCbErr(done, 'wbp_021', packOpts)
    })

    /**
     * @tc.number    : wbp_022
     * @tc.name      : packing - callback-webp-wrong quality
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('wbp_022', 0, async function (done) {
        let packOpts = { format: ["image/jpeg"], quality: 112 }
        packingCbErr(done, 'wbp_022', packOpts)
    })

    /**
     * @tc.number    : wbp_023
     * @tc.name      : packing - callback-webp-no quality
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('wbp_023', 0, async function (done) {
        let packOpts = { format: ["image/jpeg"] }
        packingCbErr(done, 'wbp_023', packOpts)
    })

    /**
     * @tc.number    : wbp_024
     * @tc.name      : packing - callback-webp-no format
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('wbp_024', 0, async function (done) {
        let packOpts = { quality: 90 }
        packingCbErr(done, 'wbp_024', packOpts)
    })

    /**
    * @tc.number    : wbp_025
    * @tc.name      : packing - callback-webp-quality -1
    * @tc.desc      : 1.create ImageSource
    *                 2.call packing
    *                 3.return array
    * @tc.size      : MEDIUM 
    * @tc.type      : Functional
    * @tc.level     : Level 1
    */
    it('wbp_025', 0, async function (done) {
        let packOpts = { format: ["image/jpeg"], quality: -1 }
        packingCbErr(done, 'wbp_025', packOpts)
    })

    /**
     * @tc.number    : wbp_026
     * @tc.name      : packing - promise-webp-quality -1
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('wbp_026', 0, async function (done) {
        let packOpts = { format: ["image/jpeg"], quality: -1 }
        packingPromiseErr(done, 'wbp_026', packOpts)
    })


    /**
    * @tc.number    : wbp_027
    * @tc.name      : packing - callback-webp-quality 0
    * @tc.desc      : 1.create ImageSource
    *                 2.call packing
    *                 3.return array
    * @tc.size      : MEDIUM 
    * @tc.type      : Functional
    * @tc.level     : Level 1
    */
    it('wbp_027', 0, async function (done) {
        let packOpts = { format: ["image/jpeg"], quality: 0 }
        packingPromise(done, 'wbp_027', packOpts)
    })

    /**
     * @tc.number    : wbp_028
     * @tc.name      : packing - promise-webp-quality 0
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('wbp_028', 0, async function (done) {
        let packOpts = { format: ["image/jpeg"], quality: 0 }
        packingPromise(done, 'wbp_028', packOpts)
    })
})}
