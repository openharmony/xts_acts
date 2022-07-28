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

export default function Image_test() {
describe('Image_test', function () {
    var pathJpg = '/data/storage/el2/base/files/test.jpg';
    var pathBmp = '/data/storage/el2/base/files/test.bmp';
    var pathPng = '/data/storage/el2/base/files/test.png';
    var pathMovingGif = '/data/storage/el2/base/files/moving_test.gif';
    var pathTiff = '/data/storage/el2/base/files/test.tiff';
    let globalpixelmap;

    beforeAll(async function () {
        await applyPermission();
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

    async function applyPermission() {
        let appInfo = await bundle.getApplicationInfo('ohos.acts.multimedia.image.DecodeOptions', 0, 100);
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
            let fdNumber = fileio.openSync(pathPng);
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
                    let packOpts = { format: ["image/jpeg"], quality: 99 }
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
            let fdNumber = fileio.openSync(pathPng);
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
                    let packOpts = { format: ["image/jpeg"], quality: 1 }
                    imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
                        console.info('TC_062-1 success');
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
            let fdNumber = fileio.openSync(pathPng);
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
                    let packOpts = { format: ["image/gif"], quality: 98 }
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
            let fdNumber = fileio.openSync(pathPng);
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
                    let packOpts = { format: ["image/jpeg"], quality: 101 }
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
            let fdNumber = fileio.openSync(pathPng);
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
            let fdNumber = fileio.openSync(pathPng);
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
                    let packOpts = { format: ["image/jpeg"] }
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
            let fdNumber = fileio.openSync(pathPng);
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
            let fdNumber = fileio.openSync(pathPng);
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
                    let packOpts = { format: ["image/jpeg"], quality: 100 }
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
            let fdNumber = fileio.openSync(pathPng);
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
                    let packOpts = { format: ["image/jpeg"], quality: 0 }
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
            let fdNumber = fileio.openSync(pathPng);
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
                    let packOpts = { format: ["image/jpeg"], quality: -1 }
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

    /**
     * @tc.number    : TC_063
     * @tc.name      : release ImagePacker - promise
     * @tc.desc      : 1.create ImagePacker
     *                 2.call release
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_063', 0, async function (done) {
        const imagePackerApi = image.createImagePacker();
        if (imagePackerApi == undefined) {
            console.info('TC_063 create image packer failed');
            expect(false).assertTrue();
            done();
        } else {
            imagePackerApi.release().then(() => {
                console.info('TC_063 success');
                expect(true).assertTrue();
                done();
            }).catch(() => {
                console.log('TC_063 error: ' + error);
                expect(false).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_063-1 
     * @tc.name      : release ImagePacker - callback
     * @tc.desc      : 1.create ImagePacker
     *                 2.call release
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_063-1', 0, async function (done) {
        const imagePackerApi = image.createImagePacker();
        if (imagePackerApi == undefined) {
            console.info('TC_063-1 create image packer failed');
            expect(false).assertTrue();
            done();
        } else {
            imagePackerApi.release(() => {
                console.info('TC_063-1 success');
                expect(true).assertTrue();
                done();
            })
        }
    })


    /**
     * @tc.number    : TC_050
     * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGBA_8888-jpg
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_050 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 3,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    globalpixelmap = pixelmap;

                    console.info('TC_050 success ');
                    expect(pixelmap != undefined).assertTrue();
                    done();
                })
            }
        } catch (error) {
            console.info('TC_050 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })
    /**
     * @tc.number    : TC_050-1
     * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGB_565-jpg
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-1', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_050-1 create image source failed');
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
                    globalpixelmap = pixelmap;
                    console.info('TC_050-1 success ');
                    expect(pixelmap != undefined).assertTrue();
                    done();
                })
            }
        } catch (error) {
            console.info('TC_050-1 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })
    /**
     * @tc.number    : TC_050-2
     * @tc.name      : createPixelMap(decodingOptions)-pixelformat:unknown-jpg
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-2', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_050-2 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    globalpixelmap = pixelmap;

                    console.info('TC_050-2 success ');
                    expect(pixelmap != undefined).assertTrue();
                    done();
                })
            }
        } catch (error) {
            console.info('TC_050-2 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })
    /**
     * @tc.number    : TC_050-3
     * @tc.name      : createPixelMap(decodingOptions: index 1})-jpg
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-3', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_050-3 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 1
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    globalpixelmap = pixelmap;

                    if (pixelmap == undefined) {
                        console.info('TC_050-3 success ');
                        expect(true).assertTrue();
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        } catch (error) {
            console.info('TC_050-3 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_050-4
     * @tc.name      : createPixelMap(decodingOptions:index -1})-jpg
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-4', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_050-4 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: -1
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    globalpixelmap = pixelmap;

                    if (pixelmap == undefined) {
                        console.error('TC_050-4 success');
                        expect(true).assertTrue();
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        } catch (error) {
            console.info('TC_050-4 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_050-5
     * @tc.name      : createPixelMap(decodingOptions:sampleSize -1})-jpg
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-5', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_050-5 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: -1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    globalpixelmap = pixelmap;

                    if (pixelmap == undefined) {
                        console.info('TC_050-5 success ');
                        expect(true).assertTrue();
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        } catch (error) {
            console.info('TC_050-5 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_050-6
     * @tc.name      : createPixelMap(decodingOptions:rotate -10})-jpg
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-6', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_050-6 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: -10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    globalpixelmap = pixelmap;

                    if (pixelmap == undefined) {
                        console.info('TC_050-6 success ');
                        expect(true).assertTrue();
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        } catch (error) {
            console.info('TC_050-6 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_050-7
     * @tc.name      : createPixelMap(decodingOptions:unsupported pixelformat)-jpg 
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-7', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_050-7 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 60,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    globalpixelmap = pixelmap;
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('TC_050-7 success ');
                        expect(true).assertTrue();
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        } catch (error) {
            console.info('TC_050-7 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_050-8
     * @tc.name      : createPixelMap(decodingOptions:editable false})-jpg
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1             
     */
    it('TC_050-8', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_050-8 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: false,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    globalpixelmap = pixelmap;

                    console.info('TC_050-8 success');
                    expect(pixelmap != undefined).assertTrue();
                    done();
                })
            }
        } catch (error) {
            console.info('TC_050-8 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_050-9
     * @tc.name      : createPixelMap(decodingOptions:desiredSize>imagesize)-jpg
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-9', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_050-9 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 10000, height: 10000 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    globalpixelmap = pixelmap;

                    console.info('TC_050-9 success ');
                    expect(pixelmap != undefined).assertTrue();
                    done();
                })
            }
        } catch (error) {
            console.info('TC_050-9 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_050-10
     * @tc.name      : createPixelMap(decodingOptions:desiredRegion>imagesize)-jpg
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-10', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_050-10 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 10000, width: 10000 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    globalpixelmap = pixelmap;

                    if (pixelmap == undefined) {
                        console.info('TC_050-10 success ');
                        expect(true).assertTrue();
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        } catch (error) {
            console.info('TC_050-10 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_050-11
     * @tc.name      : createPixelMapdecodingOptions:x -1 y -1)-jpg
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-11', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_050-11 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    globalpixelmap = pixelmap;

                    if (pixelmap == undefined) {
                        console.info('TC_050-11 success ');
                        expect(true).assertTrue();
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        } catch (error) {
            console.info('TC_050-11 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
 * @tc.number    : TC_050-12
 * @tc.name      : createPixelMap(decodingOptions:x > image.height y > image.width)-jpg
 * @tc.desc      : 1.create imagesource
 *                 2.set index and DecodeOptions
 *                 3.create PixelMap
 *                 4.callback return undefined
 * @tc.size      : MEDIUM
 * @tc.type      : Functional
 * @tc.level     : Level 1
 */
    it('TC_050-12', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_050-12 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 10000, y: 10000 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    globalpixelmap = pixelmap;

                    if (pixelmap == undefined) {
                        console.info('TC_050-12 success ');
                        expect(true).assertTrue();
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        } catch (error) {
            console.info('TC_050-12 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_050-13
     * @tc.name      : createPixelMap(decodingOptions:rotate>360)-jpg
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_050-13', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_050-13 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 500,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 1, y: 2 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    globalpixelmap = pixelmap;

                    if (pixelmap == undefined) {
                        console.info('TC_050-13 success ');
                        expect(true).assertTrue();
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        } catch (error) {
            console.info('TC_050-13 error: ' + error);
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
            let fdNumber = fileio.openSync(pathJpg);
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
            let fdNumber = fileio.openSync(pathJpg);
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
     * @tc.number    : TC_067
     * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGBA_8888-gif
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067', 0, async function (done) {
        let fdNumber = fileio.openSync(pathMovingGif);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_067 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 3,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                console.info('TC_067 createPixelMap ');
                expect(pixelmap != undefined).assertTrue();
                done();
            })
        }
    })
    /**
     * @tc.number    : TC_067-1
     * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGBA_565-gif
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067-1', 0, async function (done) {
        let fdNumber = fileio.openSync(pathMovingGif);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_067-1 create image source failed');
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
                globalpixelmap = pixelmap;

                console.info('TC_067-1 success ');
                expect(pixelmap != undefined).assertTrue();
                done();
            })
        }
    })
    /**
     * @tc.number    : TC_067-2
     * @tc.name      : createPixelMap(decodingOptions)-pixelformat:unkonwn-gif
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067-2', 0, async function (done) {
        let fdNumber = fileio.openSync(pathMovingGif);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_067-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                console.info('TC_067-2 success ');
                expect(pixelmap != undefined).assertTrue();
                done();
            })
        }
    })
    /**
     * @tc.number    : TC_067-3
     * @tc.name      : createPixelMap(decodingOptions:index 1})-gif 
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067-3', 0, async function (done) {
        let fdNumber = fileio.openSync(pathMovingGif);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_067-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 1
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                console.info('TC_067-3 success ');
                expect(pixelmap != undefined).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_067-4
     * @tc.name      : createPixelMap(decodingOptions:index -1})-gif
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067-4', 0, async function (done) {
        let fdNumber = fileio.openSync(pathMovingGif);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_067-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: -1
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_067-4 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_067-5
     * @tc.name      : createPixelMap(decodingOptions:sampleSize -1})-gif
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067-5', 0, async function (done) {
        let fdNumber = fileio.openSync(pathMovingGif);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_067-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: -1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_067-5 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_067-6
     * @tc.name      : createPixelMap(decodingOptions:rotate -10})-gif
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067-6', 0, async function (done) {
        let fdNumber = fileio.openSync(pathMovingGif);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_067-6 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: -10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_067-6 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_067-7
     * @tc.name      : createPixelMap(decodingOptions:unsupported pixelformat)-gif 
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067-7', 0, async function (done) {
        let fdNumber = fileio.openSync(pathMovingGif);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_067-7 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 60,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_067-7 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })
    /**
     * @tc.number    : TC_067-8
     * @tc.name      : createPixelMap(decodingOptions:editable false})-gif
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067-8', 0, async function (done) {
        let fdNumber = fileio.openSync(pathMovingGif);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_067-8 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: false,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                console.info('TC_067-8 success');
                expect(pixelmap != undefined).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_067-9
     * @tc.name      : createPixelMap(decodingOptions:desiredSize>imagesize)-gif
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067-9', 0, async function (done) {
        let fdNumber = fileio.openSync(pathMovingGif);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_067-9 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 10000, height: 10000 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                console.info('TC_067-9 success ');
                expect(pixelmap != undefined).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_067-10
     * @tc.name      : createPixelMap(decodingOptions:desiredRegion>imagesize)-gif
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067-10', 0, async function (done) {
        let fdNumber = fileio.openSync(pathMovingGif);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info(' TC_067-10 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 10000, width: 10000 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_067-10 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_067-11
     * @tc.name      : createPixelMapdecodingOptions:x -1 y -1)-gif
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067-11', 0, async function (done) {
        let fdNumber = fileio.openSync(pathMovingGif);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_067-11 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_067-11 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_067-12
     * @tc.name      : createPixelMap(decodingOptions:x > image.height y > image.width)-gif
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067-12', 0, async function (done) {
        let fdNumber = fileio.openSync(pathMovingGif);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_067-12 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 10000, y: 10000 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_067-12 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_067-13
     * @tc.name      : createPixelMap(decodingOptions:rotate>360)-gif
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_067-13', 0, async function (done) {
        let fdNumber = fileio.openSync(pathMovingGif);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_067-13 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 500,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 1, y: 2 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_067-13 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
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
        let fdNumber = fileio.openSync(pathMovingGif);
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
        let fdNumber = fileio.openSync(pathMovingGif);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_067-15 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.createPixelMap((err, pixelmap) => {

                console.info('TC_067-15 success ');
                expect(pixelmap !== undefined).assertTrue();
                done();
            })
        }
    })


    /**
     * @tc.number    : TC_068
     * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGBA_8888-bmp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068', 0, async function (done) {
        let fdNumber = fileio.openSync(pathBmp);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_068 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 3,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                console.info('TC_068 success ');
                expect(pixelmap != undefined).assertTrue();
                done();
            })
        }
    })
    /**
     * @tc.number    : TC_068-1
     * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGB_565-bmp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-1', 0, async function (done) {
        let fdNumber = fileio.openSync(pathBmp);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_068-1 create image source failed');
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
                globalpixelmap = pixelmap;

                console.info('TC_068-1 success ');
                expect(pixelmap != undefined).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_068-2
     * @tc.name      : createPixelMap(decodingOptions)-pixelformat:unkonwn-bmp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-2', 0, async function (done) {
        let fdNumber = fileio.openSync(pathBmp);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_068-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                console.info('TC_068-2 success ');
                expect(pixelmap != undefined).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_068-3
     * @tc.name      : createPixelMap(decodingOptions: index 1})-bmp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-3', 0, async function (done) {
        let fdNumber = fileio.openSync(pathBmp);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_068-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 1
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_068-3 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_068-4
     * @tc.name      : createPixelMap(decodingOptions:index -1})-bmp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-4', 0, async function (done) {
        let fdNumber = fileio.openSync(pathBmp);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_068-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: -1
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_068-4 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_068-5
     * @tc.name      : createPixelMap(decodingOptions:sampleSize -1})-bmp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-5', 0, async function (done) {
        let fdNumber = fileio.openSync(pathBmp);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_068-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: -1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_068-5 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_068-6
     * @tc.name      : createPixelMap(decodingOptions:rotate -10})-bmp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-6', 0, async function (done) {
        let fdNumber = fileio.openSync(pathBmp);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_068-6 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: -10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_068-6 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_068-7
     * @tc.name      : createPixelMap(decodingOptions:unsupported pixelformat)-bmp 
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-7', 0, async function (done) {
        let fdNumber = fileio.openSync(pathBmp);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_068-7 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 60,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_068-7 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_068-8
     * @tc.name      : createPixelMap(decodingOptions:editable false})-bmp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-8', 0, async function (done) {
        let fdNumber = fileio.openSync(pathBmp);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_068-8 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: false,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                console.info('TC_068-8 success');
                expect(pixelmap != undefined).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_068-9
     * @tc.name      : createPixelMap(decodingOptions:desiredSize>imagesize)-bmp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-9', 0, async function (done) {
        let fdNumber = fileio.openSync(pathBmp);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_068-9 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1500, height: 1500 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                console.info('TC_068-9 success ');
                expect(pixelmap != undefined).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_068-10
     * @tc.name      : createPixelMap(decodingOptions:desiredRegion>imagesize)-bmp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-10', 0, async function (done) {
        let fdNumber = fileio.openSync(pathBmp);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info(' TC_068-10 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 10000, width: 10000 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_068-10 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_068-11
     * @tc.name      : createPixelMapdecodingOptions:x -1 y -1)-bmp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-11', 0, async function (done) {
        let fdNumber = fileio.openSync(pathBmp);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_068-11 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_068-11 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_068-12
     * @tc.name      : createPixelMap(decodingOptions:x > image.height y > image.width)-bmp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-12', 0, async function (done) {
        let fdNumber = fileio.openSync(pathBmp);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_068-12 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 10000, y: 10000 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_068-12 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })
    /**
     * @tc.number    : TC_068-13
     * @tc.name      : createPixelMap(decodingOptions:rotate>360)-jpg
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-13', 0, async function (done) {
        let fdNumber = fileio.openSync(pathBmp);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_068-13 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 500,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 1, y: 2 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_068-13 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_163
     * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGBA_8888-png
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163', 0, async function (done) {
        let fdNumber = fileio.openSync(pathPng);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_163 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 3,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                console.info('TC_163 success');
                expect(pixelmap != undefined).assertTrue();
                done();
            })
        }
    })
    /**
     * @tc.number    : TC_163-1
     * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGB_565-png
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163-1', 0, async function (done) {
        let fdNumber = fileio.openSync(pathPng);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_163-1 create image source failed');
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
                globalpixelmap = pixelmap;

                console.info('TC_163-1 success');
                expect(pixelmap != undefined).assertTrue();
                done();
            })
        }
    })
    /**
     * @tc.number    : TC_163-2
     * @tc.name      : createPixelMap(decodingOptions)-pixelformat:unkonwn-png
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163-2', 0, async function (done) {
        let fdNumber = fileio.openSync(pathPng);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_163-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                console.info('TC_163-2 success');
                expect(pixelmap != undefined).assertTrue();
                done();
            })
        }
    })
    /**
     * @tc.number    : TC_163-3
     * @tc.name      : createPixelMap(decodingOptions: index 1})-png
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163-3', 0, async function (done) {
        let fdNumber = fileio.openSync(pathPng);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_163-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 1
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_163-3 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_163-4
     * @tc.name      : createPixelMap(decodingOptions:index -1})-png
     * @tc.desc      : 1.create imagesource
     *                 2.set decodingOptions
     *                 3.call createPixelMap
     *                 4.set index=-1,options
     *                 5.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163-4', 0, async function (done) {
        let fdNumber = fileio.openSync(pathPng);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_163-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: -1
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_163-4 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_163-5
     * @tc.name      : createPixelMap(decodingOptions:sampleSize -1})-png
     * @tc.desc      : 1.create imagesource
     *                 2.set decodingOptions
     *                 3.call createPixelMap
     *                 4.set index=-1,options
     *                 5.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163-5', 0, async function (done) {
        let fdNumber = fileio.openSync(pathPng);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_163-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: -1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_163-5 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_163-6
     * @tc.name      : createPixelMap(decodingOptions:rotate -10})-png
     * @tc.desc      : 1.create imagesource
     *                 2.set decodingOptions
     *                 3.call createPixelMap
     *                 4.set index=-1,options
     *                 5.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163-6', 0, async function (done) {
        let fdNumber = fileio.openSync(pathPng);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_163-6 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: -10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_163-6 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_163-7
     * @tc.name      : createPixelMap(decodingOptions:unsupported pixelformat)-png
     * @tc.desc      : 1.create imagesource
     *                 2.set decodingOptions
     *                 3.call createPixelMap
     *                 4.set index=-1,options
     *                 5.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163-7', 0, async function (done) {
        let fdNumber = fileio.openSync(pathPng);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_163-7 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 60,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_163-7 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_163-8
     * @tc.name      : createPixelMap(decodingOptions:editable false})-png
     * @tc.desc      : 1.create imagesource
     *                 2.set decodingOptions
     *                 3.call createPixelMap
     *                 4.set index=-1,options
     *                 5.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163-8', 0, async function (done) {
        let fdNumber = fileio.openSync(pathPng);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_163-8 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: false,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                console.info('TC_163-8 success');
                expect(pixelmap != undefined).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_163-9
     * @tc.name      : createPixelMap(decodingOptions:desiredSize>imagesize)-png
     * @tc.desc      : 1.create imagesource
     *                 2.set decodingOptions
     *                 3.call createPixelMap
     *                 4.set index=-1,options
     *                 5.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */

    it('TC_163-9', 0, async function (done) {
        let fdNumber = fileio.openSync(pathPng);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_163-9 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1500, height: 1500 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                console.info('TC_163-9 success');
                expect(pixelmap != undefined).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_163-10
     * @tc.name      : createPixelMap(decodingOptions:desiredRegion>imagesize)-png
     * @tc.desc      : 1.create imagesource
     *                 2.set decodingOptions
     *                 3.call createPixelMap
     *                 4.set index=-1,options
     *                 5.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163-10', 0, async function (done) {
        let fdNumber = fileio.openSync(pathPng);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info(' TC_163-10 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 10000, width: 10000 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_163-10 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_163-11
     * @tc.name      : createPixelMapdecodingOptions:x -1 y -1)-png
     * @tc.desc      : 1.create imagesource
     *                 2.set decodingOptions
     *                 3.call createPixelMap
     *                 4.set index=-1,options
     *                 5.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163-11', 0, async function (done) {
        let fdNumber = fileio.openSync(pathPng);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_163-11 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_163-11 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_163-12
     * @tc.name      : createPixelMap(decodingOptions:x > image.height y > image.width)-png
     * @tc.desc      : 1.create imagesource
     *                 2.set decodingOptions
     *                 3.call createPixelMap
     *                 4.set index=-1,options
     *                 5.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163-12', 0, async function (done) {
        let fdNumber = fileio.openSync(pathPng);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_163-12 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 10000, y: 10000 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_163-12 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })
    /**
         * @tc.number    : TC_163-13
         * @tc.name      : createPixelMap(decodingOptions:rotate>360)-png
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
    it('TC_163-13', 0, async function (done) {
        let fdNumber = fileio.openSync(pathPng);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_163-13 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 500,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 1, y: 2 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                if (pixelmap == undefined) {
                    console.info('TC_163-13 success ');
                    expect(true).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_167
     * @tc.name      : createPixelMap-unsupported image format
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_167', 0, async function (done) {
        let fdNumber = fileio.openSync(pathTiff);
        const imageSourceApi = image.createImageSource(fdNumber);
        let decodingOptions = {
            sampleSize: 1,
            editable: true,
            desiredSize: { width: 1, height: 2 },
            rotate: 10,
            desiredPixelFormat: 3,
            desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
            index: 0
        };
        imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
            globalpixelmap = pixelmap;

            console.info('TC_167 success ');
            expect(pixelmap == undefined).assertTrue();
            done();
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
        let fdNumber = fileio.openSync(pathJpg);
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_169 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 90,
                desiredPixelFormat: 3,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;

                pixelmap.getImageInfo((err, imageInfo) => {
                    if (imageInfo != undefined) {
                        console.info('TC_169 success');
                        expect(imageInfo.size.height == 2).assertTrue();
                        expect(imageInfo.size.width == 1).assertTrue();
                        done();
                    } else {
                        console.info('TC_169 imageInfo is empty');
                        expect(false).assertTrue()
                        done();
                    }
                })
            })
        }
    })
})
}
