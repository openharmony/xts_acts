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

import image from "@ohos.multimedia.image";
import fileio from "@ohos.fileio";
import colorSpaceManager from "@ohos.graphics.colorSpaceManager";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import { testImg } from "./testImg";
import { testP3 } from "./testImg2";
import featureAbility from "@ohos.ability.featureAbility";
export default function ImageP3() {
    describe("ImageP3", function () {
        const COLORSPACENAME = 5;
        let filePath;
        let fdNumber;
        async function getFd(fileName) {
            let context = await featureAbility.getContext();
            await context.getFilesDir().then((data) => {
                filePath = data + "/" + fileName;
                console.info("image case filePath is " + filePath);
            });
            await fileio
                .open(filePath)
                .then((data) => {
                    fdNumber = data;
                    console.info("image case open fd success " + fdNumber);
                })
                .catch((err) => {
                    console.info("image case open fd err " + err);
                });
        }

        beforeAll(async function () {
            console.info("beforeAll case");
        });

        beforeEach(function () {
            console.info("beforeEach case");
        });

        afterEach(async function () {
            console.info("afterEach case");
        });

        afterAll(async function () {
            console.info("afterAll case");
        });

        function GenPicSource(org) {
            var data;
            data = org.buffer;
            return image.createImageSource(data);
        }

        function Logger(caseName) {
            return {
                myName: caseName,
                log: function (msg) {
                    console.info(this.myName + " " + msg);
                },
            };
        }

        async function setColorCallBack(done, testNum, imageSource, colorSpaceName) {
            let logger = Logger(testNum);
            logger.log("ImageSource " + (imageSource != undefined));
            if (imageSource != undefined) {
                let pixelMap = await imageSource.createPixelMap();
                logger.log("PixelMap " + pixelMap);
                var csm = colorSpaceManager.create(colorSpaceName);
                logger.log("colorSpaceManager.ColorSpace: " + colorSpaceName);
                pixelMap.setColorSpace(csm, async (err) => {
                    if (err != undefined) {
                        expect(false).assertTrue();
                        logger.log("setColorSpace failed " + err);
                        done();
                        return;
                    }
                    var csm1 = await pixelMap.getColorSpace();
                    logger.log("getColorSpace " + csm1);
                    var csmn = csm1.getColorSpaceName();
                    logger.log("getColorSpaceName " + csmn);
                    expect(csmn == colorSpaceName).assertTrue();
                    done();
                });
            } else {
                logger.log("createimageSource fail");
                expect(false).assertTrue();
                done();
            }
        }

        async function setColorPromise(done, testNum, imageSource, colorSpaceName) {
            let logger = Logger(testNum);
            try {
                logger.log("ImageSource " + (imageSource != undefined));
                if (imageSource != undefined) {
                    let pixelMap = await imageSource.createPixelMap();
                    logger.log("PixelMap " + pixelMap);
                    var csm = colorSpaceManager.create(colorSpaceName);
                    logger.log("colorSpaceManager.ColorSpace: " + colorSpaceName);
                    await pixelMap.setColorSpace(csm);
                    var csm1 = await pixelMap.getColorSpace();
                    logger.log("getColorSpace " + csm1);
                    var csmn = csm1.getColorSpaceName();
                    logger.log("getColorSpaceName " + csmn);
                    expect(csmn == colorSpaceName).assertTrue();
                    done();
                } else {
                    logger.log("createimageSource fail");
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                expect(false).assertTrue();
                logger.log("failed " + error);
                done();
            }
        }

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETCOLORSPACE_PROMISE_0100
         * @tc.name      : SUB_GRAPHIC_IMAGE_GETCOLORSPACE_PROMISE_0100
         * @tc.desc      : 1.create imagesource
         *                 2.createPixelMap
         *                 3.getColorSpace and getColorSpaceName
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETCOLORSPACE_PROMISE_0100", 0, async function (done) {
            let logger = Logger("SUB_GRAPHIC_IMAGE_GETCOLORSPACE_PROMISE_0100");
            try {
                let imageSource = GenPicSource(testImg);
                if (imageSource != undefined) {
                    let pixelMap = await imageSource.createPixelMap();
                    var csm = await pixelMap.getColorSpace();
                    logger.log("getColorSpace csm " + csm);
                    var csmn = csm.getColorSpaceName();
                    logger.log("getColorSpaceName " + csmn);
                    expect(csmn == COLORSPACENAME).assertTrue();
                    done();
                } else {
                    logger.log("createimageSource fail");
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                expect(false).assertTrue();
                logger.log("failed " + error);
                done();
            }
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETCOLORSPACE_CALLBACK_0100
         * @tc.name      : SUB_GRAPHIC_IMAGE_GETCOLORSPACE_CALLBACK_0100
         * @tc.desc      : 1.create imagesource
         *                 2.createPixelMap
         *                 3.getColorSpace and getColorSpaceName
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETCOLORSPACE_CALLBACK_0100", 0, async function (done) {
            let logger = Logger("SUB_GRAPHIC_IMAGE_GETCOLORSPACE_CALLBACK_0100");
            let imageSource = GenPicSource(testImg);
            if (imageSource != undefined) {
                let pixelMap = await imageSource.createPixelMap();
                pixelMap.getColorSpace((err, csm) => {
                    if (err != undefined) {
                        logger.log("getColorSpace failed " + err);
                        expect(false).assertTrue();
                        return;
                    }
                    logger.log("getColorSpace csm " + csm);
                    let csmn = csm.getColorSpaceName();
                    logger.log("getColorSpaceName " + csmn);
                    expect(csmn == COLORSPACENAME).assertTrue();
                    done();
                });
            }
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_SETCOLORSPACE_PROMISE_0100
         * @tc.name      : SUB_GRAPHIC_IMAGE_SETCOLORSPACE_PROMISE_0100
         * @tc.desc      : 1.create imagesource
         *                 2.createPixelMap
         *                 3.setColorSpace
         *                 4.getColorSpace and getColorSpaceName
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_SETCOLORSPACE_PROMISE_0100", 0, async function (done) {
            let imageSource = image.createImageSource(testP3.buffer);
            setColorPromise(
                done,
                "SUB_GRAPHIC_IMAGE_SETCOLORSPACE_PROMISE_0100",
                imageSource,
                colorSpaceManager.ColorSpace.SRGB
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_SETCOLORSPACE_PROMISE_0200
         * @tc.name      : SUB_GRAPHIC_IMAGE_SETCOLORSPACE_PROMISE_0200
         * @tc.desc      : 1.create imagesource
         *                 2.createPixelMap
         *                 3.setColorSpace
         *                 4.getColorSpace and getColorSpaceName
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_SETCOLORSPACE_PROMISE_0200", 1, async function (done) {
            let imageSource = image.createImageSource(testImg.buffer);
            setColorPromise(
                done,
                "SUB_GRAPHIC_IMAGE_SETCOLORSPACE_PROMISE_0200",
                imageSource,
                colorSpaceManager.ColorSpace.DISPLAY_P3
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_SETCOLORSPACE_PROMISE_0300
         * @tc.name      : SUB_GRAPHIC_IMAGE_SETCOLORSPACE_PROMISE_0300
         * @tc.desc      : 1.create imagesource
         *                 2.createPixelMap
         *                 3.setColorSpace
         *                 4.getColorSpace and getColorSpaceName
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_SETCOLORSPACE_PROMISE_0300", 1, async function (done) {
            await getFd("colorspace.jpg");
            let imageSource = image.createImageSource(fdNumber);
            setColorPromise(
                done,
                "SUB_GRAPHIC_IMAGE_SETCOLORSPACE_PROMISE_0300",
                imageSource,
                colorSpaceManager.ColorSpace.DISPLAY_P3
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_SETCOLORSPACE_PROMISE_0400
         * @tc.name      : SUB_GRAPHIC_IMAGE_SETCOLORSPACE_PROMISE_0400
         * @tc.desc      : 1.create imagesource
         *                 2.createPixelMap
         *                 3.setColorSpace
         *                 4.getColorSpace and getColorSpaceName
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_SETCOLORSPACE_PROMISE_0400", 1, async function (done) {
            await getFd("DisplayP3.png");
            let imageSource = image.createImageSource(fdNumber);
            setColorPromise(
                done,
                "SUB_GRAPHIC_IMAGE_SETCOLORSPACE_PROMISE_0400",
                imageSource,
                colorSpaceManager.ColorSpace.SRGB
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_SETCOLORSPACE_CALLBACK_0100
         * @tc.name      : SUB_GRAPHIC_IMAGE_SETCOLORSPACE_CALLBACK_0100
         * @tc.desc      : 1.create imagesource
         *                 2.createPixelMap
         *                 3.setColorSpace
         *                 4.getColorSpace and getColorSpaceName
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_SETCOLORSPACE_CALLBACK_0100", 0, async function (done) {
            let imageSource = image.createImageSource(testImg.buffer);
            setColorCallBack(
                done,
                "SUB_GRAPHIC_IMAGE_SETCOLORSPACE_CALLBACK_0100",
                imageSource,
                colorSpaceManager.ColorSpace.DISPLAY_P3
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_SETCOLORSPACE_CALLBACK_0200
         * @tc.name      : SUB_GRAPHIC_IMAGE_SETCOLORSPACE_CALLBACK_0200
         * @tc.desc      : 1.create imagesource
         *                 2.createPixelMap
         *                 3.setColorSpace
         *                 4.getColorSpace and getColorSpaceName
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_SETCOLORSPACE_CALLBACK_0200", 1, async function (done) {
            let imageSource = image.createImageSource(testP3.buffer);
            setColorCallBack(
                done,
                "SUB_GRAPHIC_IMAGE_SETCOLORSPACE_CALLBACK_0200",
                imageSource,
                colorSpaceManager.ColorSpace.SRGB
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_SETCOLORSPACE_CALLBACK_0300
         * @tc.name      : SUB_GRAPHIC_IMAGE_SETCOLORSPACE_CALLBACK_0300
         * @tc.desc      : 1.create imagesource
         *                 2.createPixelMap
         *                 3.setColorSpace
         *                 4.getColorSpace and getColorSpaceName
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_SETCOLORSPACE_CALLBACK_0300", 1, async function (done) {
            await getFd("DisplayP3.png");
            let imageSource = image.createImageSource(fdNumber);
            setColorCallBack(
                done,
                "SUB_GRAPHIC_IMAGE_SETCOLORSPACE_CALLBACK_0300",
                imageSource,
                colorSpaceManager.ColorSpace.SRGB
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_SETCOLORSPACE_CALLBACK_0400
         * @tc.name      : SUB_GRAPHIC_IMAGE_SETCOLORSPACE_CALLBACK_0400
         * @tc.desc      : 1.create imagesource
         *                 2.createPixelMap
         *                 3.setColorSpace
         *                 4.getColorSpace and getColorSpaceName
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_SETCOLORSPACE_CALLBACK_0400", 1, async function (done) {
            await getFd("colorspace.jpg");
            let imageSource = image.createImageSource(fdNumber);
            setColorCallBack(
                done,
                "SUB_GRAPHIC_IMAGE_SETCOLORSPACE_CALLBACK_0400",
                imageSource,
                colorSpaceManager.ColorSpace.DISPLAY_P3
            );
        });
    });
}
