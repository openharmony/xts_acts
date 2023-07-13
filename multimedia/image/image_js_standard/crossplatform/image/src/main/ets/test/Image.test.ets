/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import image from "@ohos.multimedia.image";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { testPng, testJpg } from './testImg'
import { testGif, testBmp } from './testImg2';
import { prepareImageFile, prepareImageFileFd } from './Common'
import fileIO from '@ohos.file.fs';

export default function Image() {
    describe("Image", function () {
        let context;
        let filePath;
        let fileFd;
        let globalpixelmap;

        async function getFilePath(fileName, imageArray) {
            filePath = context.cacheDir + '/' + fileName;
            let result = await prepareImageFile(filePath, imageArray);
            expect(result).assertTrue();
        }

        async function getFileFd(fileName, imageArray) {
            filePath = context.cacheDir + '/' + fileName;
            fileFd = await prepareImageFileFd(filePath, imageArray);
            expect(fileFd != null).assertTrue();
        }

        beforeAll(async function () {
            context = globalThis.abilityContext;
            console.info("beforeAll case");
        });

        beforeEach(async function () {
            console.info("beforeEach case");
        });

        afterEach(async function () {
            console.info('afterEach case');
            if (fileFd != null) {
                fileIO.close(fileFd);
                fileFd = null;
            }
            if (globalpixelmap != undefined) {
                console.info('globalpixelmap release start');
                try {
                    await globalpixelmap.release();
                } catch (error) {
                    console.info('globalpixelmap release fail');
                }
            }
        });

        afterAll(async function () {
            console.info("afterAll case");
        });

        function createPixMapPromise(done, testNum, opts) {
            const Color = new ArrayBuffer(96);
            image
                .createPixelMap(Color, opts)
                .then((pixelmap) => {
                    console.info(`${testNum} success`);
                    expect(pixelmap != undefined).assertTrue();
                    done();
                })
                .catch((error) => {
                    console.log(`${testNum} error: ` + error);
                    expect(false).assertTrue();
                    done();
                });
        }

        function createPixMapCb(done, testNum, opts) {
            const Color = new ArrayBuffer(96);
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                if (err) {
                    expect(false).assertTrue();
                    console.info(`${testNum} err` + err);
                    done();
                    return
                }
                expect(pixelmap != undefined).assertTrue();
                console.info(`${testNum} success`);
                done();
            });
        }

        async function createImageSourceUri(done, testNum, fileName, imageArray) {
            try {
                await getFilePath(fileName, imageArray);
                const imageSourceApi = image.createImageSource(filePath);
                expect(imageSourceApi != undefined).assertTrue();
                console.info(`${testNum} success`);
                done();
            } catch (error) {
                console.info(`${testNum} error` + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function createImageSourceUriOptions(done, testNum, fileName, imageArray, opts) {
            try {
                await getFilePath(fileName, imageArray);
                const imageSourceApi = image.createImageSource(filePath, opts);
                expect(imageSourceApi != undefined).assertTrue();
                console.info(`${testNum} success`);
                done();
            } catch (error) {
                console.info(`${testNum} error` + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function createImageSourceFdOptions(done, testNum, fileName, imageArray, opts) {
            try {
                await getFileFd(fileName, imageArray);
                const imageSourceApi = image.createImageSource(fileFd, opts);
                expect(imageSourceApi != undefined).assertTrue();
                console.info(`${testNum} success`);
                done();
            } catch (error) {
                console.info(`${testNum} error` + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function createImageSourceBufOptions(done, testNum, imageArray, opts) {
            const data = imageArray.buffer;
            const imageSourceApi = image.createImageSource(data, opts);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo((err, imageInfo) => {
                    console.info(`${testNum} success`);
                    expect(imageInfo != undefined).assertTrue();
                    done();
                })
            }
        }

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_PROMISE_001
         * @tc.name      : testCreatePixelMapPromise001
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapPromise001", 0, async function (done) {
            let opts = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }, scaleMode: image.ScaleMode.CENTER_CROP, alphaType: image.AlphaType.UNKNOWN };
            createPixMapPromise(done, "testCreatePixelMapPromise001", opts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_PROMISE_002
         * @tc.name      : testCreatePixelMapPromise002
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapPromise002", 0, async function (done) {
            let opts = { editable: true, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 4, width: 6 }, scaleMode: image.ScaleMode.CENTER_CROP, alphaType: image.AlphaType.OPAQUE };
            createPixMapPromise(done, "testCreatePixelMapPromise002", opts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_PROMISE_003
         * @tc.name      : testCreatePixelMapPromise003
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapPromise003", 0, async function (done) {
            let opts = { editable: true, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 4, width: 6 }, scaleMode: image.ScaleMode.FIT_TARGET_SIZE, alphaType: image.AlphaType.PREMUL };
            createPixMapPromise(done, "testCreatePixelMapPromise003", opts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_PROMISE_004
         * @tc.name      : testCreatePixelMapPromise004
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapPromise004", 0, async function (done) {
            let opts = { editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 }, scaleMode: image.ScaleMode.FIT_TARGET_SIZE, alphaType: image.AlphaType.UNPREMUL };
            createPixMapPromise(done, "testCreatePixelMapPromise004", opts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_PROMISE_005
         * @tc.name      : testCreatePixelMapPromise005
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapPromise005", 0, async function (done) {
            let opts = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 4, width: 6 } }
            createPixMapPromise(done, "testCreatePixelMapPromise005", opts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_PROMISE_006
         * @tc.name      : testCreatePixelMapPromise006
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixelFormat,size
         *                 3.using colorand opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapPromise006", 0, async function (done) {
            let opts = { editable: true, pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 6, width: 8 } }
            createPixMapPromise(done, "testCreatePixelMapPromise006", opts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_PROMISE_007
         * @tc.name      : testCreatePixelMapPromise007
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixelFormat,size
         *                 3.using colorand opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapPromise007", 0, async function (done) {
            let opts = { editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 6, width: 8 } }
            createPixMapPromise(done, "testCreatePixelMapPromise007", opts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_CB_001
         * @tc.name      : testCreatePixelMapCb001
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapCb001", 0, async function (done) {
            let opts = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }, scaleMode: image.ScaleMode.FIT_TARGET_SIZE, alphaType: image.AlphaType.UNKNOWN };
            createPixMapCb(done, "testCreatePixelMapCb001", opts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_CB_002
         * @tc.name      : testCreatePixelMapCb002
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapCb002", 0, async function (done) {
            let opts = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }, scaleMode: image.ScaleMode.FIT_TARGET_SIZE, alphaType: image.AlphaType.OPAQUE };
            createPixMapCb(done, "testCreatePixelMapCb002", opts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_CB_003
         * @tc.name      : testCreatePixelMapCb003
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapCb003", 0, async function (done) {
            let opts = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }, scaleMode: image.ScaleMode.CENTER_CROP, alphaType: image.AlphaType.PREMUL };
            createPixMapCb(done, "testCreatePixelMapCb003", opts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_CB_004
         * @tc.name      : testCreatePixelMapCb004
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapCb004", 0, async function (done) {
            let opts = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 }, scaleMode: image.ScaleMode.CENTER_CROP, alphaType: image.AlphaType.UNPREMUL };
            createPixMapCb(done, "testCreatePixelMapCb004", opts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_CB_005
         * @tc.name      : testCreatePixelMapCb005
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixelFormat,size
         *                 3.using colorand opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapCb005", 0, async function (done) {
            let opts = { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
            createPixMapCb(done, "testCreatePixelMapCb005", opts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_CB_006
         * @tc.name      : testCreatePixelMapCb006
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixelFormat,size
         *                 3.using colorand opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapCb006", 0, async function (done) {
            let opts = { editable: false, pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 6, width: 8 } }
            createPixMapCb(done, "testCreatePixelMapCb006", opts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_CB_007
         * @tc.name      : testCreatePixelMapCb007
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixelFormat,size
         *                 3.using colorand opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapCb007", 0, async function (done) {
            let opts = { editable: false, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 6, width: 8 } }
            createPixMapCb(done, "testCreatePixelMapCb007", opts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_CB_008
         * @tc.name      : testCreatePixelMapCb008
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapCb008", 0, async function (done) {
            let opts = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 6, width: 8 } }
            createPixMapCb(done, "testCreatePixelMapCb008", opts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_CB_009
         * @tc.name      : testCreatePixelMapCb009
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapCb009", 0, async function (done) {
            let opts = { editable: true, pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 2, width: 3 } }
            createPixMapCb(done, "testCreatePixelMapCb009", opts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_CB_010
         * @tc.name      : testCreatePixelMapCb010
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapCb010", 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: -1, width: -1 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                if (err) {
                    expect(true).assertTrue();
                    console.info('testCreatePixelMapCb010 success' + err);
                    done();
                    return
                }
                expect(false).assertTrue();
                console.info('testCreatePixelMapCb010 fail');
                done();
            })
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_CB_011
         * @tc.name      : testCreatePixelMapCb011
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size(Unsupported formats are converted to RGBA_8888)
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapCb011", 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 21, size: { height: 6, width: 8 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                if (err) {
                    expect(false).assertTrue();
                    console.info('testCreatePixelMapCb011 err' + err);
                    done();
                    return
                }
                expect(pixelmap != undefined).assertTrue();
                console.info('testCreatePixelMapCb011 success');
                done();
            })
        });

        /**
         * @tc.number    : TEST_CREATEIMAGESOURCE_URI_001
         * @tc.name      : testCreateImageSourceUri001
         * @tc.desc      : 1.set uri
         *                 2.call createImageSource(uri)
         *                 3.return imagesource
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreateImageSourceUri001', 0, async function (done) {
            createImageSourceUri(done, 'testCreateImageSourceUri001', 'test.jpg', testJpg);
        })

        /**
         * @tc.number    : TEST_CREATEIMAGESOURCE_URI_002
         * @tc.name      : testCreateImageSourceUri002
         * @tc.desc      : 1.seturi
         *                 2.call createImageSource(uri)
         *                 3.return imagesource
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreateImageSourceUri002', 0, async function (done) {
            createImageSourceUri(done, 'testCreateImageSourceUri002', 'test.bmp', testBmp);
        })

        /**
         * @tc.number    : TEST_CREATEIMAGESOURCE_URI_003
         * @tc.name      : testCreateImageSourceUri003
         * @tc.desc      : 1.seturi
         *                 2.call createImageSource(uri)
         *                 3.return imagesource
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreateImageSourceUri003', 0, async function (done) {
            createImageSourceUri(done, 'testCreateImageSourceUri003', 'test.gif', testGif);
        })

        /**
         * @tc.number    : TEST_CREATEIMAGESOURCE_URI_004
         * @tc.name      : testCreateImageSourceUri004
         * @tc.desc      : 1.seturi
         *                 2.call createImageSource(uri)
         *                 3.return imagesource
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreateImageSourceUri004', 0, async function (done) {
            createImageSourceUri(done, 'testCreateImageSourceUri004', 'test.png', testPng);
        })

        /**
         * @tc.number    : TEST_CREATEIMAGESOURCE_URI_005
         * @tc.name      : testCreateImageSourceUri005
         * @tc.desc      : 1.call createImageSource(uri)
         *                 2.Incoming wrong suffix file 
         *                 3.imagesource null
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreateImageSourceUri005', 0, async function (done) {
            try {
                await getFilePath('test.123', testJpg);
                let imageSourceApi = image.createImageSource(filePath);
                if (imageSourceApi == undefined) {
                    console.info('testCreateImageSourceUri005 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap((err, pixelmap) => {
                        if (err) {
                            console.info('testCreateImageSourceUri005 create pixelmap failed: ' + err);
                            expect(false).assertTrue();
                            done();
                            return
                        }
                        globalpixelmap = pixelmap;
                        console.info('testCreateImageSourceUri005 success');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                expect(false).assertTrue();
                console.info('testCreateImageSourceUri005 err:' + error);
                done();
            }
        })

        /**
         * @tc.number    : TEST_CREATEIMAGESOURCE_URI_006
         * @tc.name      : testCreateImageSourceUri006
         * @tc.desc      : 1.call createImageSource(uri)
         *                 2.set wrong uri
         *                 3.return null
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreateImageSourceUri006', 0, async function (done) {
            try {
                const imageSourceApi = image.createImageSource('file:///multimedia/test.jpg');
                expect(imageSourceApi == undefined).assertTrue();
                console.info('testCreateImageSourceUri006 success');
                done();
            } catch (error) {
                console.info('testCreateImageSourceUri006 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_CREATEIMAGESOURCE_FD_001
         * @tc.name      : testCreateImageSourceFd001
         * @tc.desc      : 1.call createImageSource
         *                 2.set fd
         *                 3.return imagesource
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreateImageSourceFd001', 0, async function (done) {
            try {
                await getFileFd('test.jpg', testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testCreateImageSourceFd001 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo((err, imageInfo) => {
                        if (err) {
                            expect(false).assertTrue();
                            console.info('testCreateImageSourceFd001 err: ' + err);
                            done();
                            return
                        }
                        if (imageInfo != undefined) {
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info('testCreateImageSourceFd001 failed');
                            expect(false).assertTrue();
                            done();
                        }

                    })
                }
            } catch (error) {
                console.info('testCreateImageSourceFd001 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_CREATEIMAGESOURCE_FD_002
         * @tc.name      : testCreateImageSourceFd002
         * @tc.desc      : 1.call createImageSource
         *                 2.set wrong fd
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreateImageSourceFd002', 0, async function (done) {
            const imageSourceApi = image.createImageSource(-2);
            expect(imageSourceApi == undefined).assertTrue();
            console.info('testCreateImageSourceFd002 success');
            done();
        })

        /**
         * @tc.number    : TEST_CREATEIMAGESOURCE_BUF_001
         * @tc.name      : testCreateImageSourceBuf001
         * @tc.desc      : 1.setdata
         *                 2.createImageSource
         *                 3.return imagesource
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreateImageSourceBuf001', 0, async function (done) {
            const data = testJpg.buffer;
            const imageSourceApi = image.createImageSource(data);
            if (imageSourceApi == undefined) {
                console.info('testCreateImageSourceBuf001 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageInfo((err, imageInfo) => {
                    console.info('testCreateImageSourceBuf001 imageInfo');
                    expect(imageInfo != undefined).assertTrue();
                    done();
                })
            }
        })

        /**
         * @tc.number    : TEST_CREATEIMAGESOURCE_BUF_002
         * @tc.name      : testCreateImageSourceBuf002
         * @tc.desc      : 1.setdata
         *                 2.createImageSource
         *                 3.return imagesource
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreateImageSourceBuf002', 0, async function (done) {
            const data = new ArrayBuffer(0);
            const imageSourceApi = image.createImageSource(data);
            expect(imageSourceApi == undefined).assertTrue();
            console.info('testCreateImageSourceBuf002 success');
            done();
        })

        /**
         * @tc.number    : TEST_CREATEIMAGESOURCE_URI_OPTIONS_001
         * @tc.name      : testCreateImageSourceUriOptions001
         * @tc.desc      : 1.set SourceOptions
         *                 2.createImageSource
         *                 3.return imagesource not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreateImageSourceUriOptions001", 0, async function (done) {
            let opts = { sourceDensity: 240, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
            createImageSourceUriOptions(done, 'testCreateImageSourceUri001', 'test.jpg', testJpg, opts);
        });

        /**
         * @tc.number    : TEST_CREATEIMAGESOURCE_FD_OPTIONS_001
         * @tc.name      : testCreateImageSourceFdOptions001
         * @tc.desc      : 1.set SourceOptions
         *                 2.createImageSource
         *                 3.return imagesource not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreateImageSourceFdOptions001", 0, async function (done) {
            let opts = { sourceDensity: 240, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
            createImageSourceFdOptions(done, 'testCreateImageSourceFdOptions001', 'test.jpg', testJpg, opts);
        });

        /**
         * @tc.number    : TEST_CREATEIMAGESOURCE_BUF_OPTIONS_001
         * @tc.name      : testCreateImageSourceBufOptions001
         * @tc.desc      : 1.set SourceOptions
         *                 2.createImageSource
         *                 3.return imagesource not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreateImageSourceBufOptions001", 0, async function (done) {
            let opts = { sourceDensity: 240, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
            createImageSourceBufOptions(done, 'testCreateImageSourceBufOptions001', testJpg, opts);
        });

        /**
         * @tc.number    : TEST_CREATEINCREMENTALSOURCE_001
         * @tc.name      : testCreateIncrementalSource001
         * @tc.desc      : 1.set ArrayBuffer
         *                 2.CreateIncrementalSource
         *                 3.return imagesource not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreateIncrementalSource001", 0, async function (done) {
            const imageSourceApi = image.CreateIncrementalSource(new ArrayBuffer(96));
            if (imageSourceApi != undefined) {
                expect(true).assertTrue();
                console.info('testCreateIncrementalSource001 success');
            } else {
                expect(false).assertTrue();
                console.info('testCreateIncrementalSource001 fail');
            }
            done();
        });

        /**
         * @tc.number    : TEST_CREATEINCREMENTALSOURCE_OPTIONS_001
         * @tc.name      : testCreateIncrementalSourceOptions001
         * @tc.desc      : 1.set SourceOptions
         *                 2.CreateIncrementalSource
         *                 3.return imagesource not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreateIncrementalSourceOptions001", 0, async function (done) {
            let opts = { sourceDensity: 240, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
            const imageSourceApi = image.CreateIncrementalSource(new ArrayBuffer(96), opts);
            if (imageSourceApi != undefined) {
                expect(true).assertTrue();
                console.info('testCreateIncrementalSourceOptions001 success');
            } else {
                expect(false).assertTrue();
                console.info('testCreateIncrementalSourceOptions001 fail');
            }
            done();
        });

        /**
         * @tc.number    : TEST_CREATEIMAGEPACKER_001
         * @tc.name      : testCreateImagePacker001
         * @tc.desc      : create ImagePacker
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreateImagePacker001", 0, async function (done) {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
                console.info("testCreateImagePacker001 create image packer failed");
                expect(false).assertTrue();
                done();
            } else {
                console.info("testCreateImagePacker001 create image packer success");
                expect(true).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_IMAGEFORMAT_001
         * @tc.name      : testImageFormat001
         * @tc.desc      : test ImageFormat
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("testImageFormat001", 0, async function (done) {
            expect(image.ImageFormat.YCBCR_422_SP==1000).assertTrue();
            expect(image.ImageFormat.JPEG==2000).assertTrue();
            done();
        });
    });
}
