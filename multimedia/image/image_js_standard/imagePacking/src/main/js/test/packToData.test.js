/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import featureAbility from "@ohos.ability.featureAbility";
import fileio from "@ohos.fileio";

export default function imagePackToData() {
    describe("imagePackToData", function () {
        let globalpixelmap;
        let globalPacker;
        let globalImagesource;
        let filePath;
        let fdNumber;
        let isSupportGifEncode;
        const ERROR_CODE = 401;
        const ERROR_CODE1 = 62980100;
        async function getFd(fileName) {
            let context = await featureAbility.getContext();
            await context.getFilesDir().then((data) => {
                filePath = data + "/" + fileName;
                console.info("image case filePath is " + filePath);
            });
            await fileio
                .open(filePath)
                .then(
                    (data) => {
                        fdNumber = data;
                        console.info("image case open fd success " + fdNumber);
                    },
                    (err) => {
                        console.info("image cese open fd fail" + err);
                    }
                )
                .catch((err) => {
                    console.info("image case open fd err " + err);
                });
        }

        beforeAll(async function () {
            console.info("beforeAll case");
            isSupportGifEncode = image.createImagePacker().supportedFormats.includes("image/gif");
        });

        beforeEach(function () {
            console.info("beforeEach case");
        });

        afterEach(async function () {
            if (globalpixelmap != undefined) {
                console.info("globalpixelmap release start");
                try {
                    await globalpixelmap.release();
                } catch (error) {
                    console.info("globalpixelmap release fail");
                }
            }
            if (globalImagesource != undefined) {
                console.info("globalpixelmap release start");
                try {
                    await globalImagesource.release();
                } catch (error) {
                    console.info("globalImagesource release fail");
                }
            }
            if (globalPacker != undefined) {
                console.info("globalPacker release start");
                try {
                    await globalPacker.release();
                } catch (error) {
                    console.info("globalPacker release fail");
                }
            }
            console.info("afterEach case");
        });

        afterAll(function () {
            console.info("afterAll case");
        });

        function packToDataPromiseErr(done, testNum, pixFormat, arg) {
            const Color = new ArrayBuffer(96);
            if (pixFormat == 2) {
                var opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } };
            } else {
                var opts = { editable: true, pixelFormat: 5, size: { height: 4, width: 6 } };
            }
            image.createPixelMap(Color, opts).then((pixelmap) => {
                if (pixelmap == undefined) {
                    console.log(`${testNum} create pixelMap failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    globalpixelmap = pixelmap;
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.log(`${testNum} create image packer failed`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalPacker = imagePackerApi;
                        imagePackerApi.packToData(pixelmap, arg).then((data) => {
                            expect(false).assertTrue();
                            done();
                        }).catch((error) => {
                            console.log(`${testNum} error: ` + error.code);
                            expect(error.code == ERROR_CODE || error.code == ERROR_CODE1).assertTrue();
                            done();
                        });
                    }
                }
            })
            .catch((error) => {
                console.log("packToDataPromiseErr error: " + error);
                expect().assertFail();
                done();
            });
        }

        async function packToDataPromiseErr2(done, testNum, arg) {
            await getFd("test.png");
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.log(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                globalImagesource = imageSourceApi;
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                    console.log(`${testNum} create image packer failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    globalPacker = imagePackerApi;
                    imagePackerApi.packToData(imageSourceApi, arg, (error, data) => {
                        console.log(`${testNum} error: ` + error.code);
                        expect(error.code == ERROR_CODE || error.code == ERROR_CODE1).assertTrue();
                        console.info(data);
                        done();
                    });
                }
            }
        }

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0100
         * @tc.name      : SUB_IMAGE_packToData_P_002 - Promise - RGB565 quality 123
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0100", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 123 };
            packToDataPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0100", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0200
         * @tc.name      : SUB_IMAGE_packToData_P_003 - Promise - RGB565 quality null
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0200", 0, async function (done) {
            let packOpts = { format: "image/jpeg" };
            packToDataPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0200", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0300
         * @tc.name      : SUB_IMAGE_packToData_P_004 - Promise - RGB565 format null
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0300", 0, async function (done) {
            let packOpts = { quality: 99 };
            packToDataPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0300", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0400
         * @tc.name      : SUB_IMAGE_packToData_P_005 - Promise - RGB565 wrong format
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0400", 0, async function (done) {
            let packOpts = { format: "image/txt", quality: 99 };
            packToDataPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0400", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0500
         * @tc.name      : SUB_IMAGE_packToData_P_007 - Promise - RGB888 quality 123
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0500", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 123 };
            packToDataPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0500", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0600
         * @tc.name      : SUB_IMAGE_packToData_P_008 - Promise - RGB888 quality null
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0600", 0, async function (done) {
            let packOpts = { format: "image/jpeg" };
            packToDataPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0600", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0700
         * @tc.name      : SUB_IMAGE_packToData_P_009 - Promise - RGB888 format null
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0700", 0, async function (done) {
            let packOpts = { quality: 99 };
            packToDataPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0700", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0800
         * @tc.name      : SUB_IMAGE_packToData_P_010 - Promise - RGB888 wrong format
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0800", 0, async function (done) {
            let packOpts = { format: "image/txt", quality: 99 };
            packToDataPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_ERROE_0800", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_ERROE_0100
         * @tc.name      : packToData ImageSource - promise - wrong quality
         * @tc.desc      : 1.create ImageSource
         *                 2.call packToData
         *                 3.call return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_ERROE_0100", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 123 };
            packToDataPromiseErr2(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_ERROE_0100", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_ERROE_0200   error
         * @tc.name      : packToData ImageSource - promise - no quality
         * @tc.desc      : 1.create ImageSource
         *                 2.call packToData
         *                 3.call return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */

        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_ERROE_0200", 0, async function (done) {
            let packOpts = { format: "image/jpeg" };
            packToDataPromiseErr2(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_ERROE_0200", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_ERROE_0300
         * @tc.name      : packToData ImageSource - promise - no format
         * @tc.desc      : 1.create ImageSource
         *                 2.call packToData
         *                 3.call return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_ERROE_0300", 0, async function (done) {
            let packOpts = { quality: 50 };
            packToDataPromiseErr2(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_ERROE_0300", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_ERROE_0400
         * @tc.name      : packToData ImageSource - callback - quality -1
         * @tc.desc      : 1.create ImageSource
         *                 2.call packToData
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_ERROE_0400", 0, async function (done) {
            let packOpts = { format: "image/txt", quality: 99 };
            packToDataPromiseErr2(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_ERROE_0400", packOpts);
        });
    });
}
