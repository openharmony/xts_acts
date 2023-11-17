// @ts-nocheck
/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, it, expect } from 'hypium/index'
// @ts-ignore
import featureAbility from '@ohos.ability.featureAbility';
import image from "@ohos.multimedia.image";
import fs from "@ohos.file.fs";
import colorSpaceManager from "@ohos.graphics.colorSpaceManager";

export default function ImageColorSpaceTransferTest() {
    describe('ImageColorSpaceTransferTest', function () {
        const ERR_CODE = 62980115;
        const WIDTH = 3472;
        const HEIGHT = 4640;
        async function getFd(fileName) {
            let context = await featureAbility.getContext();
            let filePath;
            await context.getFilesDir().then((data) => {
                filePath = data + "/" + fileName;
                console.info("image case filePath is " + filePath);
            });
            let file = await fs.open(filePath, 0o0)
            return file.fd
        }
        function Logger(caseName) {
            return {
                myName: caseName,
                log: function (msg) {
                    console.info(this.myName + " " + msg);
                },
            };
        }
        async function createPixelmapTestPromise(done, testNum, ...colorSpaceName) {
            let logger = Logger(testNum);
            try {
                let fd = await getFd("colorspace.jpg")
                let imageSource = image.createImageSource(fd);
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    let csm = colorSpaceManager.create(...colorSpaceName);
                    let decodingOptions = { desiredColorSpace: csm };
                    let pixelMap = await imageSource.createPixelMap(decodingOptions);
                    logger.log("PixelMap " + pixelMap);
                    if (pixelMap != undefined) {
                        let info = await pixelMap.getImageInfo();
                        console.log(`${testNum} file size width: ${info.size.width}`);
                        console.log(`${testNum} file size height: ${info.size.height}`);
                        expect(info.size.width == WIDTH).assertTrue();
                        expect(info.size.height == HEIGHT).assertTrue();
                        done();
                    } else {
                        logger.log('creat pixelMap failed ');
                        expect(false).assertTrue();
                        done();
                    }
                } else {
                    logger.log('creat imageSource failed ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }
        async function createPixelmapTestCb(done, testNum, ...colorSpaceName) {
            let logger = Logger(testNum);
            try {
                let fd = await getFd("colorspace.jpg")
                let imageSource = image.createImageSource(fd);
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    let csm = colorSpaceManager.create(...colorSpaceName);
                    let decodingOptions = { desiredColorSpace: csm };
                    imageSource.createPixelMap(decodingOptions, async (err, pixelMap) => {
                        if (err) {
                            logger.log("PixelMap err " + err)
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        let info = await pixelMap.getImageInfo();
                        console.log(`${testNum} file size width: ${info.size.width}`);
                        console.log(`${testNum} file size height: ${info.size.height}`);
                        expect(info.size.width == WIDTH).assertTrue();
                        expect(info.size.height == HEIGHT).assertTrue();
                        done();
                    });
                } else {
                    logger.log('creat imageSource failed ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function applyColorSpacePromiseTest(done, testNum, ...colorSpaceName) {
            let logger = Logger(testNum);
            try {
                let fd = await getFd("colorspace.jpg")
                let imageSource = image.createImageSource(fd);
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    let decodingOptions = {};
                    let pixelMap = await imageSource.createPixelMap(decodingOptions);
                    if (pixelMap != undefined) {
                        let csmModify = colorSpaceManager.create(...colorSpaceName);
                        await pixelMap.applyColorSpace(csmModify)
                        let pixelSize = pixelMap.getPixelBytesNumber();
                        logger.log(`new pixel size ${pixelSize}`);
                        let readBuffer0 = new ArrayBuffer(pixelSize);
                        await pixelMap.readPixelsToBuffer(readBuffer0);
                        let bufferArr0 = new Uint8Array(readBuffer0);
                        for (let i = 0; i < 50; i++) {
                            logger.log("PixelMap buffer[" + i + "] = " + bufferArr0[i]);
                        }
                        expect(true).assertTrue();
                        done();
                    } else {
                        logger.log('creat pixelMap failed ');
                        expect(false).assertTrue();
                        done();
                    }
                } else {
                    logger.log('creat imageSource failed ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function applyColorSpaceCbTest(done, testNum, ...colorSpaceName) {
            let logger = Logger(testNum);
            try {
                let fd = await getFd("colorspace.jpg")
                let imageSource = image.createImageSource(fd);
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    let decodingOptions = {};
                    let pixelMap = await imageSource.createPixelMap(decodingOptions);
                    if (pixelMap != undefined) {
                        let csmModify = colorSpaceManager.create(...colorSpaceName);
                        pixelMap.applyColorSpace(csmModify, async (err) => {
                            if (err) {
                                logger.log("applyColorSpace err " + err);
                                done();
                                return;
                            }
                            let pixelSize = pixelMap.getPixelBytesNumber();
                            logger.log(`new pixel size ${pixelSize}`);
                            let readBuffer0 = new ArrayBuffer(pixelSize);
                            await pixelMap.readPixelsToBuffer(readBuffer0);
                            logger.log(`new readBuffer0 size ${readBuffer0.byteLength}`);
                            let bufferArr0 = new Uint8Array(readBuffer0);
                            for (let i = 0; i < 50; i++) {
                                logger.log("PixelMap buffer[" + i + "] = " + bufferArr0[i]);
                            }
                            expect(true).assertTrue();
                            done();
                        })
                    } else {
                        logger.log('creat pixelMap failed ');
                        expect(false).assertTrue();
                        done();
                    }
                } else {
                    logger.log('creat imageSource failed ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function applyColorSpaceCbErrTest(done, testNum, csmModify) {
            let logger = Logger(testNum);
            try {
                let fd = await getFd("colorspace.jpg")
                let imageSource = image.createImageSource(fd);
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    let decodingOptions = {};
                    let pixelMap = await imageSource.createPixelMap(decodingOptions);
                    if (pixelMap != undefined) {
                        pixelMap.applyColorSpace(csmModify, async (err) => {
                            logger.log('applyColorSpace failed ' + err);
                            expect(err == ERR_CODE).assertTrue();
                            done();
                        })
                    } else {
                        logger.log('creat pixelMap failed ');
                        expect(false).assertTrue();
                        done();
                    }
                } else {
                    logger.log('creat imageSource failed ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function applyColorSpacePromiseErrTest(done, testNum, csmModify) {
            let logger = Logger(testNum);
            try {
                let fd = await getFd("colorspace.jpg")
                let imageSource = image.createImageSource(fd);
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    let decodingOptions = {};
                    let pixelMap = await imageSource.createPixelMap(decodingOptions);
                    if (pixelMap != undefined) {
                        try {
                            await pixelMap.applyColorSpace(csmModify);
                            expect(false).assertTrue();
                            done();
                        } catch (error) {
                            logger.log('applyColorSpace fail' + error);
                            expect(error == ERR_CODE).assertTrue();
                            done();
                        }
                    } else {
                        logger.log('creat pixelMap failed ');
                        expect(false).assertTrue();
                        done();
                    }
                } else {
                    logger.log('creat imageSource failed ');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                logger.log('failed ' + error);
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0100
         * @tc.name      : createPixelmap_promise_001
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0100', 0, async function (done) {
            await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0100',
                colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0200
         * @tc.name      : createPixelmap_promise_002
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0200', 0, async function (done) {
            await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0200',
                colorSpaceManager.ColorSpace.DCI_P3)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0300
         * @tc.name      : createPixelmap_promise_003
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0300', 0, async function (done) {
            await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0300',
                colorSpaceManager.ColorSpace.DISPLAY_P3)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0400
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0400
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0400', 0, async function (done) {
            await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0400',
                colorSpaceManager.ColorSpace.SRGB)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0500
         * @tc.name      : createPixelmap_promise_005
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0500', 0, async function (done) {
            let bt2020 = {
                redX: 0.708,
                redY: 0.292,
                greenX: 0.170,
                greenY: 0.797,
                blueX: 0.131,
                blueY: 0.046,
                whitePointX: 0.31271,
                whitePointY: 0.32902
            }
            let gamma = 2.4;
            await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_0500',
                bt2020, gamma)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0100
         * @tc.name      : createPixelmap_callback_001
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0100', 0, async function (done) {
            await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0100',
                colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0200
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0200
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0200', 0, async function (done) {
            await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0200',
                colorSpaceManager.ColorSpace.DCI_P3)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0300
         * @tc.name      : createPixelmap_callback_003
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0300', 0, async function (done) {
            await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0300',
                colorSpaceManager.ColorSpace.DISPLAY_P3)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0400
         * @tc.name      : createPixelmap_callback_004
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0400', 0, async function (done) {
            await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0400',
                colorSpaceManager.ColorSpace.SRGB)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0500
         * @tc.name      : createPixelmap_callback_005
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0500', 0, async function (done) {
            let bt2020 = {
                redX: 0.708,
                redY: 0.292,
                greenX: 0.170,
                greenY: 0.797,
                blueX: 0.131,
                blueY: 0.046,
                whitePointX: 0.31271,
                whitePointY: 0.32902
            }
            let gamma = 2.4;
            await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_0500',
                bt2020, gamma)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0100
         * @tc.name      : applyColorSpace_promise_001
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0100', 0, async function (done) {
            await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0100',
                colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0200
         * @tc.name      : applyColorSpace_promise_002
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0200', 0, async function (done) {
            await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0200',
                colorSpaceManager.ColorSpace.DCI_P3)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0300
         * @tc.name      : applyColorSpace_promise_003
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0300', 0, async function (done) {
            await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0300',
                colorSpaceManager.ColorSpace.DISPLAY_P3)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0400
         * @tc.name      : applyColorSpace_promise_004
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0400', 0, async function (done) {
            await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0400',
                colorSpaceManager.ColorSpace.SRGB)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0500
         * @tc.name      : applyColorSpace_promise_005
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0500', 0, async function (done) {
            let bt2020 = {
                redX: 0.708,
                redY: 0.292,
                greenX: 0.170,
                greenY: 0.797,
                blueX: 0.131,
                blueY: 0.046,
                whitePointX: 0.31271,
                whitePointY: 0.32902
            }
            let gamma = 2.4;
            await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_0500',
                bt2020, gamma)
        })

        /**
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0100
         * @tc.name      : applyColorSpace_callback_001
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0100', 0, async function (done) {
            await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0100',
                colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
        })

        /**
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0200
         * @tc.name      : applyColorSpace_callback_002
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0200', 0, async function (done) {
            await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0200',
                colorSpaceManager.ColorSpace.DCI_P3)
        })

        /**
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0300
         * @tc.name      : applyColorSpace_callback_003
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0300', 0, async function (done) {
            await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0300',
                colorSpaceManager.ColorSpace.DISPLAY_P3)
        })

        /**
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0400
         * @tc.name      : applyColorSpace_callback_004
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0400', 0, async function (done) {
            await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0400',
                colorSpaceManager.ColorSpace.SRGB)
        })

        /**
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0500
         * @tc.name      : applyColorSpace_callback_005
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0500', 0, async function (done) {
            let bt2020 = {
                redX: 0.708,
                redY: 0.292,
                greenX: 0.170,
                greenY: 0.797,
                blueX: 0.131,
                blueY: 0.046,
                whitePointX: 0.31271,
                whitePointY: 0.32902
            }
            let gamma = 2.4;
            await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_0500',
                bt2020, gamma)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0100
         * @tc.name      : applyColorSpace_callback_err_001
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0100', 0, async function (done) {
            await applyColorSpaceCbErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0100',
                'wrong')
        })
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0200
         * @tc.name      : applyColorSpace_callback_err_002
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0200', 0, async function (done) {
            await applyColorSpaceCbErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0200',
                100)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0300
         * @tc.name      : applyColorSpace_callback_err_003
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0300', 0, async function (done) {
            await applyColorSpaceCbErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0300',
                -100)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0400
         * @tc.name      : applyColorSpace_callback_err_004
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0400', 0, async function (done) {
            await applyColorSpaceCbErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_ERR_0400',
                null)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0100
         * @tc.name      : applyColorSpace_promise_err_001
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0100', 0, async function (done) {
            await applyColorSpacePromiseErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0100',
                'wrong')
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0200
         * @tc.name      : applyColorSpace_promise_err_002
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0200', 0, async function (done) {
            await applyColorSpacePromiseErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0200',
                100)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0300
         * @tc.name      : applyColorSpace_promise_err_003
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0300', 0, async function (done) {
            await applyColorSpacePromiseErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0300',
                -100)
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0400
         * @tc.name      : applyColorSpace_promise_err_004
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.applyColorSpace
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0400', 0, async function (done) {
            await applyColorSpacePromiseErrTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_ERR_0400',
                null)
        })
    })
}
