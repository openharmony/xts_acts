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
import { testPng, testJpg } from './testImg'
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'

export default function Image_test() {
describe('Image_test', function () {
    var pathJpg = '/data/storage/el2/base/files/test.jpg';
    var pathBmp = '/data/storage/el2/base/files/test.bmp';
    var pathGif = '/data/storage/el2/base/files/test.gif';
    var pathPng = '/data/storage/el2/base/files/test.png';
    var pathMovingGif = '/data/storage/el2/base/files/moving_test.gif';
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
        let appInfo = await bundle.getApplicationInfo('ohos.acts.multimedia.image', 0, 100);
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
     * @tc.number    : TC_041
     * @tc.name      : createImageSource(uri)-jpg
     * @tc.desc      : 1.set uri
     *                 2.call createImageSource(uri)
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_041', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            expect(imageSourceApi != undefined).assertTrue();
            console.info('TC_041 success');
            fileio.closeSync(fdNumber);
            done();
        } catch (error) {
            console.info('TC_041 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_041-1
     * @tc.name      : createImageSource(uri)-bmp
     * @tc.desc      : 1.seturi
     *                 2.call createImageSource(uri)
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_041-1', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathBmp);
            const imageSourceApi = image.createImageSource(fdNumber);
            expect(imageSourceApi != undefined).assertTrue();
            console.info('TC_041-1 success');
            done();
        } catch (error) {
            console.info('TC_041-1 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_041-2
     * @tc.name      : createImageSource(uri)-gif
     * @tc.desc      : 1.seturi
     *                 2.call createImageSource(uri)
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_041-2', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathGif);
            const imageSourceApi = image.createImageSource(fdNumber);
            expect(imageSourceApi != undefined).assertTrue();
            console.info('TC_041-2 success');
            done();
        } catch (error) {
            console.info('TC_041-2 error: ' + error);
            expect(false).assertTrue();
            done();
        }

    })

    /**
     * @tc.number    : TC_041-3
     * @tc.name      : createImageSource(uri)-png
     * @tc.desc      : 1.seturi
     *                 2.call createImageSource(uri)
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_041-3', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathPng);
            const imageSourceApi = image.createImageSource(fdNumber);
            expect(imageSourceApi != undefined).assertTrue();
            console.info('TC_041-3 success');
            done();
        } catch (error) {
            console.info('TC_041-3 error: ' + error);
            expect(false).assertTrue();
            done();
        }

    })

    /**
     * @tc.number    : TC_041-4
     * @tc.name      : createImageSource(uri)-wrong suffix file 
     * @tc.desc      : 1.call createImageSource(uri)
     *                 2.Incoming wrong suffix file 
     *                 3.imagesource null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_041-4', 0, async function (done) {
        const imageSourceApi = image.createImageSource('file:///data/local/tmp/test.123');
        expect(imageSourceApi == undefined).assertTrue();
        console.info('TC_041-4 success');
        done();
    })

    /**
     * @tc.number    : TC_041-5
     * @tc.name      : createImageSource(uri)-wrong uri
     * @tc.desc      : 1.call createImageSource(uri)
     *                 2.set wrong uri
     *                 3.return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_041-5', 0, async function (done) {
        try {
            const imageSourceApi = image.createImageSource('file:///multimedia/test.jpg');
            expect(imageSourceApi == undefined).assertTrue();
            console.info('TC_041-5 success');
            done();
        } catch (error) {
            console.info('TC_041-5 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_042
     * @tc.name      : createImageSource(fd)
     * @tc.desc      : 1.call createImageSource
     *                 2.set fd
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_042', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_042 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo((err, imageInfo) => {
                    if (err) {
                        expect(false).assertTrue();
                        console.info('TC_042 err: ' + err);
                        done();
                        return
                    }
                    if (imageInfo != undefined) {
                        expect(true).assertTrue();
                        fileio.closeSync(fdNumber);
                        done();
                    } else {
                        console.info('TC_042 failed');
                        expect(false).assertTrue();
                        done();
                    }

                })
            }
        } catch (error) {
            console.info('TC_042 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_042-1
     * @tc.name      : createImageSource(fd) fd<0
     * @tc.desc      : 1.call createImageSource
     *                 2.set wrong fd
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_042-1', 0, async function (done) {
        const imageSourceApi = image.createImageSource(-2);
        expect(imageSourceApi == undefined).assertTrue();
        console.info('TC_042-1 success');
        done();
    })

    /**
     * @tc.number    : TC_043
     * @tc.name      : createImageSource(data)
     * @tc.desc      : 1.setdata
     *                 2.createImageSource
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_043', 0, async function (done) {
        const data = testJpg.buffer;
        const imageSourceApi = image.createImageSource(data);
        if (imageSourceApi == undefined) {
            console.info('TC_043 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageInfo((err, imageInfo) => {
                console.info('TC_043 imageInfo');
                expect(imageInfo != undefined).assertTrue();
                done();
            })
        }
    })

    /**
     * @tc.number    : TC_043-1
     * @tc.name      : createImageSource(data) buffer:0
     * @tc.desc      : 1.setdata
     *                 2.createImageSource
     *                 3.return imagesource
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_043-1', 0, async function (done) {
        const data = new ArrayBuffer(0);
        const imageSourceApi = image.createImageSource(data);
        expect(imageSourceApi == undefined).assertTrue();
        console.info('TC_043-1 success');
        done();
    })

    /**
     * @tc.number    : TC_044
     * @tc.name      : release-imagesource-promise-jpg
     * @tc.desc      : 1.create ImageSource
     *                 2.call release()
     *                 3.return undefined
     * @tc.size      : MEDIUM  
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_044', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_044 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.release().then(() => {
                    console.info('TC_044 success');
                    expect(true).assertTrue();
                    done();
                }).catch(error => {
                    console.info('TC_044 error');
                    expect(false).assertTrue();
                    done();
                })
            }
        } catch (error) {
            console.info('TC_044 err:' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_044-1
     * @tc.name      : release-imagesource-callback-jpg
     * @tc.desc      : 1.create ImageSource
     *                 2.call release()
     *                 3.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_044-1', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
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
        } catch (error) {
            console.info('TC_044-1 err:' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_045
     * @tc.name      : getImageInfo(callback: AsyncCallback<ImageInfo>)-jpg
     * @tc.desc      : 1.create imageSource
     *                 2.imageSourcecall getImageInfo(ImageInfo)
     *                 3.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */

    it('TC_045', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_045 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo((err, imageInfo) => {
                    if (err) {
                        expect(false).assertTrue();
                        console.info('TC_045 err:' + err);
                        done();
                        return
                    }
                    if (imageInfo != undefined) {
                        console.info('TC_045 imageInfo.size.height:' + imageInfo.size.height);
                        console.info('TC_045 imageInfo.size.width:' + imageInfo.size.width);
                        expect(true).assertTrue();
                        fileio.closeSync(fdNumber);
                        done();
                    } else {
                        console.info('TC_045 failed');
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        } catch (error) {
            console.info('TC_045 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })


    /**
     * @tc.number    : TC_045-1
     * @tc.name      : getImageInfo(callback: AsyncCallback<ImageInfo>)-bmp
     * @tc.desc      : 1.create imageSource
     *                 2.imageSourcecall getImageInfo(ImageInfo)
     *                 3.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_045-1', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathBmp);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_045-1 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo((err, imageInfo) => {
                    expect(imageInfo != undefined).assertTrue();
                    console.info('TC_045-1 imageInfo.size.height:' + imageInfo.size.height);
                    console.info('TC_045-1 imageInfo.size.width:' + imageInfo.size.width);
                    done();
                })
            }
        } catch (error) {
            console.info('TC_045-1 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_045-2
     * @tc.name      : getImageInfo(callback: AsyncCallback<ImageInfo>)-png
     * @tc.desc      : 1.create imageSource
     *                 2.imageSourcecall getImageInfo(ImageInfo)
     *                 3.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_045-2', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathPng);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_045-2 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo((err, imageInfo) => {
                    expect(imageInfo != undefined).assertTrue();
                    console.info('TC_045-2 imageInfo.size.height:' + imageInfo.size.height);
                    console.info('TC_045-2 imageInfo.size.width:' + imageInfo.size.width);
                    done();
                })
            }
        } catch (error) {
            console.info('TC_045-2 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_045-3
     * @tc.name      : getImageInfo(callback: AsyncCallback<ImageInfo>)-gif
     * @tc.desc      : 1.create ImageInfo
     *                 2.call getImageInfo(index, ImageInfo)
     *                 3.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_045-3', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathGif);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_045-3 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo((err, imageInfo) => {
                    if (err) {
                        expect(false).assertTrue();
                        console.info('TC_045-3 error' + err);
                        done();
                        return
                    }
                    if (imageInfo != undefined && imageInfo != null) {
                        expect(true).assertTrue();
                        console.info('TC_045-3 imageInfo.size.height:' + imageInfo.size.height);
                        console.info('TC_045-3 imageInfo.size.width:' + imageInfo.size.width);
                        console.info('TC_045-3 success')
                        done();
                    } else {
                        expect(false).assertTrue();
                        console.info('TC_045-3 failed')
                        done();
                    }
                })
            }
        } catch (error) {
            console.info('TC_045-3 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_046
     * @tc.name      : getImageInfo(index: number, callback: AsyncCallback<ImageInfo>)-jpg
     * @tc.desc      : 1.create ImageInfo
     *                 2.call getImageInfo(index, ImageInfo)
     *                 3.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_046', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_046 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo(0, (err, imageInfo) => {
                    expect(imageInfo != undefined).assertTrue();
                    console.info('TC_046 imageInfo.size.height:' + imageInfo.size.height);
                    console.info('TC_046 imageInfo.size.width:' + imageInfo.size.width);
                    done();
                })
            }
        } catch (error) {
            console.info('TC_046 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_046-1
     * @tc.name      : getImageInfo(index: number, callback: AsyncCallback<ImageInfo>)-bmp
     * @tc.desc      : 1.create ImageInfo
     *                 2.call getImageInfo(index, ImageInfo)
     *                 3.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_046-1', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathBmp);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_046-1 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo(0, (err, imageInfo) => {
                    expect(imageInfo != undefined).assertTrue();
                    console.info('TC_046-1 imageInfo.size.height:' + imageInfo.size.height);
                    console.info('TC_046-1 imageInfo.size.width:' + imageInfo.size.width);
                    done();
                })
            }
        } catch (error) {
            console.info('TC_046-1 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number: TC_046-2
     * @tc.name  : getImageInfo(index: number, callback: AsyncCallback<ImageInfo>)-png
     * @tc.desc  : 1.create ImageInfo
     *             2.call getImageInfo(index, ImageInfo)
     *             3.callback return undefined
     * @tc.size  : MEDIUM MEDIUM
     * @tc.type  : Functional
     * @tc.level : Level 1
     */
    it('TC_046-2', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathPng);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_046-2 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo(0, (err, imageInfo) => {
                    expect(imageInfo != undefined).assertTrue();
                    console.info('TC_046-2 imageInfo.size.height:' + imageInfo.size.height);
                    console.info('TC_046-2 imageInfo.size.width:' + imageInfo.size.width);
                    done();
                })
            }
        } catch {
            console.info('TC_046-2 error: ' + error);
            expect(false).assertTrue();
            done();
        }

    })

    /**
     * @tc.number: TC_046-3
     * @tc.name  : getImageInfo(index: number, callback: AsyncCallback<ImageInfo>)-gif
     * @tc.desc  : 1.create ImageInfo
     *             2.call getImageInfo(index, ImageInfo)
     *             3.callback return undefined
     * @tc.size  : MEDIUM MEDIUM
     * @tc.type  : Functional
     * @tc.level : Level 1
     */
    it('TC_046-3', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathGif);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_046-3 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo(0, (err, imageInfo) => {
                    if (err) {
                        expect(false).assertTrue();
                        console.info('TC_046-3 error' + err);
                        done();
                        return
                    }
                    if (imageInfo != undefined && imageInfo != null) {
                        expect(true).assertTrue();
                        console.info('TC_046-3 imageInfo.size.height:' + imageInfo.size.height);
                        console.info('TC_046-3 imageInfo.size.width:' + imageInfo.size.width);
                        console.info('TC_046-3 success')
                        done();
                    } else {
                        expect(false).assertTrue();
                        console.info('TC_046-3 failed')
                        done();
                    }
                })
            }
        } catch (error) {
            console.info('TC_046-3 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number: TC_046-4
     * @tc.name  : getImageInfo(index: number, callback: AsyncCallback<ImageInfo>)-gif(frame:1)-index:1
     * @tc.desc  : 1.create ImageInfo
     *             2.call getImageInfo(index, ImageInfo)
     *             3.callback return undefined
     * @tc.size  : MEDIUM
     * @tc.type  : Functional
     * @tc.level : Level 1
     */
    it('TC_046-4', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathGif);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_046-4 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo(1, (err, imageInfo) => {
                    if (imageInfo == undefined) {
                        expect(true).assertTrue();
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        } catch (error) {
            console.info('TC_046-4 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number: TC_046-5
     * @tc.name  : getImageInfo(index: number, callback: AsyncCallback<ImageInfo>)-gif-index:-1
     * @tc.desc  : 1.create ImageInfo
     *             2.call getImageInfo(index, ImageInfo)
     *             3.callback return undefined
     * @tc.size  : MEDIUM 
     * @tc.type  : Functional
     * @tc.level : Level 1
     */
    it('TC_046-5', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathGif);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_046-5 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo(-1, (err, imageInfo) => {
                    expect(imageInfo == undefined).assertTrue();
                    done();
                })
            }
        } catch (error) {
            console.info('TC_046-5 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_047
     * @tc.name      : getImageInfo(index?: number): Promise<ImageInfo>-jpg
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageInfo(index)
     *                 3.callbackcall ,return imageinfo
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_047', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_047 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo(0)
                    .then(imageInfo => {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('TC_047 imageInfo');
                        console.info('imageInfo.size.height:' + imageInfo.size.height);
                        console.info('imageInfo.size.width:' + imageInfo.size.width);
                        done();
                    }).catch(error => {
                        console.log('TC_047 error: ' + error);
                        expect().assertFail();
                        done();
                    })
            }
        } catch (error) {
            console.info('TC_047 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_047-1
     * @tc.name      : getImageInfo(index?: number): Promise<ImageInfo>-bmp
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageInfo(index)
     *                 3.callbackcall ,return imageinfo
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_047-1', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathBmp);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_047-1 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo(0)
                    .then(imageInfo => {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('TC_047-1 imageInfo');
                        console.info('imageInfo.size.height:' + imageInfo.size.height);
                        console.info('imageInfo.size.width:' + imageInfo.size.width);
                        done();
                    }).catch(error => {
                        console.log('TC_047-1 error: ' + error);
                        expect().assertFail();
                        done();
                    })
            }
        } catch (error) {
            console.info('TC_047-1 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_047-2
     * @tc.name      : getImageInfo(index?: number): Promise<ImageInfo>-png
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageInfo(index)
     *                 3.callbackcall ,return imageinfo
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_047-2', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathPng);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_047-2 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo(0)
                    .then(imageInfo => {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('TC_047-2 imageInfo');
                        console.info('imageInfo.size.height:' + imageInfo.size.height);
                        console.info('imageInfo.size.width:' + imageInfo.size.width);
                        done();
                    }).catch(error => {
                        console.log('TC_047-2 error: ' + error);
                        expect().assertFail();
                        done();
                    })
            }
        } catch (error) {
            console.info('TC_047-2 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_047-3
     * @tc.name      : getImageInfo(index?: number): Promise<ImageInfo>-gif
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageInfo(index)
     *                 3.callbackcall ,return imageinfo
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_047-3', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathGif);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_047-3 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo(0)
                    .then(imageInfo => {
                        if (imageInfo != undefined && imageInfo != null) {
                            expect(true).assertTrue();
                            console.info('TC_047-3 imageInfo.size.height:' + imageInfo.size.height);
                            console.info('TC_047-3 imageInfo.size.width:' + imageInfo.size.width);
                            done();
                        } else {
                            expect(false).assertTrue();
                            console.info('TC_047-3 failed');
                            done();
                        }
                    }).catch(error => {
                        console.log('TC_047-3 error: ' + error);
                        expect().assertFail();
                        done();
                    })
            }
        } catch (error) {
            console.info('TC_047-3 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number: TC_047-4
     * @tc.name  : getImageInfo(index?: number): Promise<ImageInfo>-gif(frame:1)-index:1
     * @tc.desc  : 1.create imagesource
     *             2.call getImageInfo(index=1)
     *             3.callback return imageinfo undefined
     * @tc.size  : MEDIUM 
     * @tc.type  : Functional
     * @tc.level : Level 1
     */
    it('TC_047-4', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathGif);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_047-4 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo(1)
                    .then(() => {
                        console.log('TC_047-4 failed');
                        expect().assertFail();
                        done();
                    }).catch(error => {
                        console.log('TC_047-4 success');
                        expect(true).assertTrue();
                        done();
                    })
            }
        } catch (error) {
            console.info('TC_047-4 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_047-5
     * @tc.name      : getImageInfo(index?: number): Promise<ImageInfo>-gif-index:-1
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageInfo(index=-1)
     *                 3.callback return imageinfo undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_047-5', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathGif);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_047-5 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo(-1)
                    .then(() => {
                        console.log('TC_047-5 failed');
                        expect().assertFail();
                        done();
                    }).catch(error => {
                        console.log('TC_047-5 success');
                        expect(true).assertTrue();
                        done();
                    })
            }
        } catch (error) {
            console.info('TC_047-5 error: ' + error);
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
     * @tc.number    : TC_053
     * @tc.name      : createIncrementalSource-updateData-png
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
            let ret;
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
                    sampleSize: 1
                };
                incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
                    console.info('TC_053 0014' + pixelmap);
                    expect(pixelmap != undefined).assertTrue();
                    done();
                })
            } else {
                done();
            }
        } catch (error) {
            console.info('TC_053 updateData failed ' + error);
        }
    })

    /**
     * @tc.number    : TC_053-1
     * @tc.name      : createIncrementalSource-updateData-jpg
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
            let ret;
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
                    sampleSize: 1
                };
                incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
                    expect(pixelmap != undefined).assertTrue();
                    done();
                })
            } else {
                done();
            }
        } catch (error) {
            console.info('TC_053-1 updateData failed ' + error);
        }
    })

    /**
     * @tc.number    : TC_064
     * @tc.name      : release ImageSource - promise - png  
     * @tc.desc      : 1.create ImageSource
     *                 2.call release()
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_064', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathPng);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_064 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.release().then(() => {
                    console.info('TC_064 success');
                    expect(true).assertTrue();
                    done();
                }).catch(error => {
                    console.log('TC_064 error: ' + error);
                    expect().assertFail();
                    done();
                })
            }
        } catch (error) {
            console.info('TC_064 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_064-1
     * @tc.name      : release ImageSource - callback - png 
     * @tc.desc      : 1.create ImageSource
     *                 2.call release()
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_064-1', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathPng);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_064-1 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.release(async (err) => {
                    if (err) {
                        console.info('TC_064-1 err:' + err);
                        expect(false).assertTrue();
                        done();
                        return
                    }
                    console.info('TC_064-1 Success');
                    expect(true).assertTrue();
                    expect(true).assertTrue();
                    done();
                })
            }
        } catch (error) {
            console.info('TC_064-1 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_065
     * @tc.name      : release ImageSource - promise - bmp 
     * @tc.desc      : 1.create ImageSource
     *                 2.call release()
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_065', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathBmp);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_065 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.release().then(() => {
                    console.info('TC_065 success');
                    expect(true).assertTrue();
                    done();
                }).catch(error => {
                    console.log('TC_065 error: ' + error);
                    expect().assertFail();
                    done();
                })
            }
        } catch (error) {
            console.info('TC_065 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_065-1
     * @tc.name      : release ImageSource - callback - bmp 
     * @tc.desc      : 1.create ImageSource
     *                 2.create SourceStream
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_065-1', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathBmp);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_065-1 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.release(async () => {
                    console.info('TC_065-1 Success');
                    expect(true).assertTrue();
                    done();
                })
            }
        } catch (error) {
            console.info('TC_065-1 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_066
     * @tc.name      : release ImageSource - promise - gif
     * @tc.desc      : 1.create ImageSource
     *                 2.call release()
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_066', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathGif);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_066 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.release().then(() => {
                    console.info('TC_066 success');
                    expect(true).assertTrue();
                    done();
                }).catch(error => {
                    console.log('TC_066 error: ' + error);
                    expect().assertFail();
                    done();
                })
            }
        } catch (error) {
            console.info('TC_066 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_066-1
     * @tc.name      : release ImageSource - callback - gif
     * @tc.desc      : 1.create ImageSource
     *                 2.call release()
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_066-1', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathGif);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
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
        } catch (error) {
            console.info('TC_066-1 error: ' + error);
            expect(false).assertTrue();
            done();
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
        try {
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
        } catch (error) {
            console.info('TC_067-14 error: ' + error);
            expect(false).assertTrue();
            done();
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
        try {
            let fdNumber = fileio.openSync(pathMovingGif);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_067-15 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.createPixelMap((err, pixelmap) => {
                    globalpixelmap = pixelmap;
                    console.info('TC_067-15 success ');
                    expect(pixelmap !== undefined).assertTrue();
                    done();
                })
            }
        } catch (error) {
            console.info('TC_067-15 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_068-14
     * @tc.name      : createPixelMap-promise-bmp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-14', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathBmp);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_068-14 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.createPixelMap().then(pixelmap => {
                    globalpixelmap = pixelmap;
                    console.info('TC_068-14 success ');
                    expect(pixelmap != undefined).assertTrue();
                    done();
                }).catch(error => {
                    console.log('TC_068-14 error: ' + error);
                    expect().assertFail();
                    done();
                })
            }
        } catch (error) {
            console.info('TC_068-14 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_068-15
     * @tc.name      : createPixelMap-callback-bmp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_068-15', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathBmp);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_068-15 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.createPixelMap((err, pixelmap) => {
                    globalpixelmap = pixelmap;
                    console.info('TC_068-15 success ');
                    expect(pixelmap != undefined).assertTrue();
                    done();
                })
            }
        } catch (error) {
            console.info('TC_068-15 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_163-14
     * @tc.name      : createPixelMap-promise-png
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163-14', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathPng);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_163-14 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.createPixelMap().then(pixelmap => {
                    globalpixelmap = pixelmap;
                    console.info('TC_163-14 success');
                    expect(pixelmap != undefined).assertTrue();
                    done();
                }).catch(error => {
                    console.log('TC_163-14 error: ' + error);
                    expect().assertFail();
                    done();
                })
            }
        } catch (error) {
            console.info('TC_163-14 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_163-15
     * @tc.name      : createPixelMap-callback-png
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return null
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_163-15', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathPng);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_163-15 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.createPixelMap((err, pixelmap) => {
                    globalpixelmap = pixelmap;
                    console.info('TC_163-15 success');
                    expect(pixelmap != undefined).assertTrue();
                    done();
                })
            }
        } catch (error) {
            console.info('TC_163-15 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_164
     * @tc.name      : imagesource supportedFormats
     * @tc.desc      : 1.create imagesource
     *                 2.call supportedFormats
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_164', 0, async function (done) {
        try {
            let fdNumber = fileio.openSync(pathJpg);
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_164 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                expect(imageSourceApi.supportedFormats != undefined).assertTrue();
                console.info(imageSourceApi.supportedFormats);
                console.info('TC_164 success ');
                done();
            }
        } catch (error) {
            console.info('TC_164 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : TC_166
     * @tc.name      : imagepacker supportedFormats
     * @tc.desc      : 1.create imagepacker
     *                 2.call supportedFormats
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('TC_166', 0, async function (done) {
        const imagePackerApi = image.createImagePacker();
        if (imagePackerApi == undefined) {
            console.info('TC_166 create image packer failed');
            expect(false).assertTrue();
            done();
        } else {
            expect(imagePackerApi.supportedFormats != undefined).assertTrue();
            console.info(imagePackerApi.supportedFormats);
            console.info('TC_166 success ');
            done();
        }
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
        let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        image.createPixelMap(Color, opts, (error, pixelmap) => {
            if (pixelmap == undefined) {
                console.info('TC_168 create pixelmap failed');
                expect(false).assertTrue();
                done();
            } else {
                expect(pixelmap.isEditable == true).assertTrue();
                console.info('TC_168 success ');
                done();
            }
        })
    })
})}
