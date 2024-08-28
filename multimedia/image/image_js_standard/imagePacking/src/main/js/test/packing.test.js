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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import featureAbility from "@ohos.ability.featureAbility";
import fileio from "@ohos.fileio";
import resourceManager from '@ohos.resourceManager';

export default function imagePacking() {
    describe("imagePacking", function () {
        let globalpixelmap;
        let globalPacker;
        let globalImagesource;
        let filePath;
        let fdNumber;
        let pixelMapList;
        let packingOptions;
        let isSupportGifEncode;
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
            if (pixelMapList != undefined) {
                try {
                    pixelMapList.forEach(async (item) => {
                        await item.release();
                    })
                } catch(error) {
                    console.info("pixelMapList release fail");
                }
            }
            console.info("afterEach case");
        });

        afterAll(function () {
            console.info("afterAll case");
        });

        function packingPromise(done, testNum, pixFormat, arg) {
            let opts;
            const Color = new ArrayBuffer(96);
            if (pixFormat == 2) {
                opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } };
            } else {
                opts = { editable: true, pixelFormat: 5, size: { height: 4, width: 6 } };
            }
            image
                .createPixelMap(Color, opts)
                .then((pixelmap) => {
                    if (pixelmap == undefined) {
                        expect(false).assertTrue();
                        console.info(`${testNum} create pixelmap fail`);
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        const imagePackerApi = image.createImagePacker();
                        if (imagePackerApi == undefined) {
                            expect(false).assertTrue();
                            console.info(`${testNum} create imagepacker fail`);
                            done();
                        } else {
                            globalPacker = imagePackerApi;
                            imagePackerApi
                                .packing(pixelmap, arg)
                                .then((data) => {
                                    var dataArr = new Uint8Array(data);
                                    console.info(`${testNum} dataArr.length=` + dataArr.length);
                                    for (var i = 0; i < dataArr.length; i++) {
                                        console.info(`dataArr[` + i + `]=` + dataArr[i]);
                                    }
                                    expect(data != undefined).assertTrue();
                                    console.info(`${testNum} success`);
                                    done();
                                })
                                .catch((error) => {
                                    console.log(`${testNum} error:` + error);
                                    expect().assertFail();
                                    done();
                                });
                        }
                    }
                })
                .catch((error) => {
                    console.log("createpixelmap error: " + error);
                    expect().assertFail();
                    done();
                });
        }

        function packingCb(done, testNum, pixFormat, arg) {
            let opts;
            const Color = new ArrayBuffer(96);
            if (pixFormat == 2) {
                opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } };
            } else {
                opts = { editable: true, pixelFormat: 5, size: { height: 4, width: 6 } };
            }
            image
                .createPixelMap(Color, opts)
                .then((pixelmap) => {
                    if (pixelmap == undefined) {
                        expect(false).assertTrue();
                        console.info(`${testNum} create pixelmap fail`);
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        const imagePackerApi = image.createImagePacker();
                        if (imagePackerApi == undefined) {
                            expect(false).assertTrue();
                            console.info(`${testNum} create imagepacker fail`);
                            done();
                        } else {
                            globalPacker = imagePackerApi;
                            imagePackerApi.packing(pixelmap, arg, (err, data) => {
                                if (err != undefined) {
                                    console.info(`${testNum} packing failerr: ${err}`);
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
                            });
                        }
                    }
                })
                .catch((error) => {
                    console.log(`${testNum} createpixelmap error: ` + error);
                    expect().assertFail();
                    done();
                });
        }

        function packingCbFail(done, testNum, pixFormat, arg) {
            const Color = new ArrayBuffer(96);
            if (pixFormat == 2) {
                var opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } };
            } else {
                var opts = { editable: true, pixelFormat: 5, size: { height: 4, width: 6 } };
            }

            image
                .createPixelMap(Color, opts)
                .then((pixelmap) => {
                    if (pixelmap == undefined) {
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        const imagePackerApi = image.createImagePacker();
                        if (imagePackerApi == undefined) {
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalPacker = imagePackerApi;
                            imagePackerApi.packing(pixelmap, arg, (err, data) => {
                                expect(err != undefined).assertTrue();
                                done();
                            });
                        }
                    }
                })
                .catch((error) => {
                    console.log(`${testNum} createpixelmap error:` + error);
                    expect().assertFail();
                    done();
                });
        }

        function packingPromiseFail(done, testNum, pixFormat, arg) {
            const Color = new ArrayBuffer(96);
            if (pixFormat == 2) {
                var opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } };
            } else {
                var opts = { editable: true, pixelFormat: 5, size: { height: 4, width: 6 } };
            }
            image
                .createPixelMap(Color, opts)
                .then((pixelmap) => {
                    if (pixelmap == undefined) {
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        const imagePackerApi = image.createImagePacker();
                        if (imagePackerApi == undefined) {
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalPacker = imagePackerApi;
                            imagePackerApi
                                .packing(pixelmap, arg)
                                .then((data) => {
                                    expect(false).assertTrue();
                                    done();
                                })
                                .catch((error) => {
                                    console.log(`${testNum} error:` + error);
                                    expect(true).assertTrue();
                                    done();
                                });
                        }
                    }
                })
                .catch((error) => {
                    console.log("createpixelmap error: " + error);
                    expect().assertFail();
                    done();
                });
        }

        async function getImageSourceData(fileName) {
            try {
                let resMgr = await resourceManager.getResourceManager();
                let value = await resMgr.getRawFileContent(fileName)
                globalImagesource = image.createImageSource(value.buffer);
                console.log('image source ' + (globalImagesource != undefined))
            } catch (error) {
                console.info("getRawFileContent case"+error);
            }
        }

        async function createPixelMapList(done, picName) {
            console.info("createPixelMapList start");
            await getImageSourceData(picName);
            let imageSourceApi = globalImagesource;
            if (imageSourceApi == undefined) {
                console.info("createImageSource failed");
                expect(false).assertTrue();
                done();
            } else {
                try {
                    pixelMapList = await imageSourceApi.createPixelMapList();
                    if (pixelMapList != undefined) {
                        console.info("createPixelMapList success");
                    } else {
                        console.info("createPixelMapList failed");
                        expect(false).assertTrue();
                        done();
                    }
                } catch (error) {
                    console.info("createPixelMapList error = " + error);
                    expect(false).assertTrue();
                    done();
                }
            }
        }

        async function checkPackingMultiFramesResult(buffer, pictureSize) {
            let imgSource = image.createImageSource(buffer);
            if (imgSource == undefined) {
                console.log(`imgSource create failed.`);
                expect(false).assertTrue();
            } else {
                let delayTimes = await imgSource.getDelayTimeList();
                let disposalTypes = await imgSource.getDisposalTypeList();
                let loopcount = await imgSource.getImageProperties(image.PropertyKey.GIF_LOOP_COUNT);
                let imageInfo = imgSource.getImageInfoSync();
                console.log(`packingMultiFramesPromise delayTimes ${delayTimes}`);
                console.log(`packingMultiFramesPromise disposalTypes ${disposalTypes}`);
                console.log(`packingMultiFramesPromise loopcount ${loopcount}`);
                console.log(`packingMultiFramesPromise height ${imageInfo.size.height}`);
                console.log(`packingMultiFramesPromise width ${imageInfo.size.width}`);
                expect(imageInfo.size.width == pictureSize.width).assertTrue();
                expect(imageInfo.size.height == pictureSize.height).assertTrue();
                expect(imageInfo.mimeType == "image/gif").assertTrue();
                if (packingOptions.loopCount) {
                    expect(loopcount == packingOptions.loopCount).assertTrue();
                } else {
                    expect(loopcount == 0).assertTrue();
                }
                for (let i = 0; i < delayTimes.length; i++) {
                    if (packingOptions.delayTimeList[i]) {
                        // delayTimes 的值编码和解码的单位差10倍
                        expect(delayTimes[i] == packingOptions.delayTimeList[i] * 10).assertTrue();
                    } else {
                        // delayTimes 的默认值1000
                        expect(delayTimes[i] == 1000).assertTrue();
                    }
                }
                // disposalTypes的有效值是0～3，大于3变成0，解码的时候0会变成1
                if (packingOptions.disposalTypes != undefined) {
                    for (let i = 0; i < packingOptions.disposalTypes.length; i++) {
                        if (packingOptions.disposalTypes[i] > 3 || packingOptions.disposalTypes[i] == 0) {
                            expect(disposalTypes[i] == 1).assertTrue();
                        } else {
                            expect(disposalTypes[i] == packingOptions.disposalTypes[i]).assertTrue();
                        }
                    }
                }
            }
        }

        function packingMultiFramesPromise(done, testNum, pictureSize) {
            globalPacker = image.createImagePacker();
            if (globalPacker == undefined) {
                console.log(`${testNum} createImagePacker failed`);
                expect(false).assertTrue();
                done();
                return;
            }
            globalPacker.packing(pixelMapList, packingOptions).then(async (data) => {
                try {
                    console.log(`${testNum} packToFileMultiFrames success`);
                    await checkPackingMultiFramesResult(data, pictureSize);
                    done();
                } catch (e1) {
                    console.log("packingMultiFrames e1: " + e1);
                    expect().assertFail();
                    done();
                }
            }).catch((error) => {
                console.log(`${testNum} error: ` + error.toString());
                expect().assertFail();
                done();
            });
        }

        async function checkPackToDataResult(buffer, picSize) {
            let imageSource = image.createImageSource(buffer);
            if (imageSource == undefined) {
                console.log(`create pack file imageSource failed.`);
                return false;
            } else {
                let delayTimes = await imageSource.getDelayTimeList();
                let disposalTypes = await imageSource.getDisposalTypeList();
                let loopCount = await imageSource.getImageProperties(image.PropertyKey.GIF_LOOP_COUNT);
                let imageInfo = imageSource.getImageInfoSync();
                console.log(`packGifToData delayTimes ${delayTimes}`);
                console.log(`packGifToData disposalTypes ${disposalTypes}`);
                console.log(`packGifToData loopCount ${loopCount}`);
                console.log(`packGifToData width ${imageInfo.size.width}`);
                console.log(`packGifToData height ${imageInfo.size.height}`);
                let result = delayTimes == 1000 && disposalTypes == 1 && loopCount == 0 &&
                    imageInfo.size.width == picSize.width && imageInfo.size.height == picSize.height &&
                    imageInfo.mimeType == "image/gif"
                await imageSource.release();
                return result;
            }
            
        }

        async function packGifToData(done, testNum, source, picSize, type) {
            globalPacker = image.createImagePacker();
            if (globalPacker == undefined) {
                console.log(`${testNum} createImagePacker failed`);
                expect(false).assertTrue();
                done();
            }
            packingOptions = { format: "image/gif", quality: 100};
            if (type == "callback") {
                globalPacker.packing(source, packingOptions, async (err, data) => {
                    if (err != undefined) {
                        console.info(`${testNum} pack fail: ${JSON.stringify(err)}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        let result = await checkPackToDataResult(data, picSize);
                        expect(result).assertTrue();
                        done();
                    }
                })
            } else {
                try {
                    let data = await globalPacker.packing(source, packingOptions);
                    console.info(`${testNum} packTodata test success`);
                    let result = await checkPackToDataResult(data, picSize);
                    expect(result).assertTrue();
                    done();
                } catch (error) {
                    console.log(`${testNum} packTodata error: ` + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            }
        }
        
        async function testPackGifToData(done, testNum, fileName, packSource, picSize, type) {
            await getImageSourceData(fileName);
            let source = globalImagesource;
            if (packSource == "PixelMap") {
                globalpixelmap = await globalImagesource.createPixelMap();
                source = globalpixelmap;
            }
            await packGifToData(done, testNum, source, picSize, type);
        }

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0100
         * @tc.name      : SUB_IMAGE_packing_P_001
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0100", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99 };
            packingPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0100", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0200
         * @tc.name      : SUB_IMAGE_packing_P_002 - Promise - RGB565 quality 123
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0200", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 123 };
            packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0200", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0300
         * @tc.name      : SUB_IMAGE_packing_P_003 - Promise - RGB565 quality null
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0300", 0, async function (done) {
            let packOpts = { format: "image/jpeg" };
            packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0300", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0400
         * @tc.name      : SUB_IMAGE_packing_P_004 - Promise - RGB565 format null
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0400", 0, async function (done) {
            let packOpts = { quality: 99 };
            packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0400", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0500
         * @tc.name      : SUB_IMAGE_packing_P_005 - Promise - RGB565 wrong format
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0500", 0, async function (done) {
            let packOpts = { format: "image/txt", quality: 99 };
            packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0500", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0600
         * @tc.name      : SUB_IMAGE_packing_P_006
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0600", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 50 };
            packingPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0600", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0700
         * @tc.name      : SUB_IMAGE_packing_P_007 - Promise - RGB888 quality 123
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0700", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 123 };
            packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0700", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0800
         * @tc.name      : SUB_IMAGE_packing_P_008 - Promise - RGB888 quality null
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0800", 0, async function (done) {
            let packOpts = { format: "image/jpeg" };
            packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0800", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0900
         * @tc.name      : SUB_IMAGE_packing_P_009 - Promise - RGB888 format null
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0900", 0, async function (done) {
            let packOpts = { quality: 99 };
            packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0900", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_1000
         * @tc.name      : SUB_IMAGE_packing_P_010 - Promise - RGB888 wrong format
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_1000", 0, async function (done) {
            let packOpts = { format: "image/txt", quality: 99 };
            packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_1000", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0100
         * @tc.name      : SUB_IMAGE_packingCb_001
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0100", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99 };
            packingCb(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0100", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0200
         * @tc.name      : SUB_IMAGE_packingCb_002 - callback - RGB565 quality 123
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0200", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 123 };
            packingCbFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0200", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0300
         * @tc.name      : SUB_IMAGE_packingCb_003 - callback - RGB565 quality null
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0300", 0, async function (done) {
            let packOpts = { format: "image/jpeg" };
            packingCbFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0300", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0400
         * @tc.name      : SUB_IMAGE_packingCb_004 - callback - RGB565 format null
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0400", 0, async function (done) {
            let packOpts = { quality: 99 };
            packingCbFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0400", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0500
         * @tc.name      : SUB_IMAGE_packingCb_005 - callback - RGB565 wrong format
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0500", 0, async function (done) {
            let packOpts = { format: "image/txt", quality: 99 };
            packingCbFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0500", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0600
         * @tc.name      : SUB_IMAGE_packingCb_006
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0600", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 50 };
            packingCb(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0600", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0700
         * @tc.name      : SUB_IMAGE_packingCb_007 - callback - RGB888 quality 123
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0700", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 123 };
            packingCbFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0700", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0800
         * @tc.name      : SUB_IMAGE_packingCb_008 - callback - RGB888 quality null
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0800", 0, async function (done) {
            let packOpts = { format: "image/jpeg" };
            packingCbFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0800", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0900
         * @tc.name      : SUB_IMAGE_packingCb_009 - callback - RGB888 format null
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0900", 0, async function (done) {
            let packOpts = { quality: 99 };
            packingCbFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0900", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_1000
         * @tc.name      : SUB_IMAGE_packingCb_010 - callback - RGB888 wrong format
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_1000", 0, async function (done) {
            let packOpts = { format: "image/txt", quality: 99 };
            packingCbFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_1000", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100
         * @tc.name      : packing ImageSource - promise
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100", 0, async function (done) {
            try {
                await getFd("test.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSourceApi;
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalPacker = imagePackerApi;
                        let packOpts = { format: "image/jpeg", quality: 99 };
                        imagePackerApi
                            .packing(imageSourceApi, packOpts)
                            .then((data) => {
                                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100 success");
                                expect(data != undefined).assertTrue();
                                done();
                            })
                            .catch((error) => {
                                console.log("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100 error: " + error);
                                expect(false).assertFail();
                                done();
                            });
                    }
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0100
         * @tc.name      : packing ImageSource - callback
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0100", 0, async function (done) {
            try {
                await getFd("test.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0100 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSourceApi;
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0100 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalPacker = imagePackerApi;
                        let packOpts = { format: "image/jpeg", quality: 1 };
                        imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
                            console.info(
                                "SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0100 success" + JSON.stringify(data)
                            );
                            expect(data != undefined).assertTrue();
                            done();
                        });
                    }
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0100 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0200
         * @tc.name      : packing ImageSource - callback - wrong quality
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.call return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0200", 0, async function (done) {
            try {
                await getFd("test.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0200 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSourceApi;
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0200 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalPacker = imagePackerApi;
                        let packOpts = { format: "image/jpeg", quality: 101 };
                        imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
                            console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0200 success");
                            expect(data == undefined).assertTrue();
                            console.info(data);
                            done();
                        });
                    }
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0200 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CREATEIMAGEPACKER_0100
         * @tc.name      : createImagePacker
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_CREATEIMAGEPACKER_0100", 0, async function (done) {
            try {
                await getFd("test.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info("SUB_MULTIMEDIA_IMAGE_PACKING_CREATEIMAGEPACKER_0100 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSourceApi;
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_CREATEIMAGEPACKER_0100 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalPacker = imagePackerApi;
                        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_CREATEIMAGEPACKER_0100 create image packer success");
                        expect(true).assertTrue();
                        done();
                    }
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_CREATEIMAGEPACKER_0100 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0200
         * @tc.name      : packing ImageSource - promise - no quality
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.call return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */

        it("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0200", 0, async function (done) {
            try {
                await getFd("test.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0200 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSourceApi;
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0200 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalPacker = imagePackerApi;
                        let packOpts = { format: "image/jpeg" };
                        imagePackerApi
                            .packing(imageSourceApi, packOpts)
                            .then((data) => {
                                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0200 failed");
                                expect(data == undefined).assertTrue();
                                done();
                            })
                            .catch((error) => {
                                console.log("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0200 error: " + error);
                                console.log("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0200 success");
                                expect(true).assertTrue();
                                done();
                            });
                    }
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0200 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0300
         * @tc.name      : packing ImageSource - promise - no format
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.call return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0300", 0, async function (done) {
            try {
                await getFd("test.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0300 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSourceApi;
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0300 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalPacker = imagePackerApi;
                        let packOpts = { quality: 50 };
                        imagePackerApi
                            .packing(imageSourceApi, packOpts)
                            .then((data) => {
                                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0300 failed");
                                expect(data == undefined).assertTrue();
                                done();
                            })
                            .catch((error) => {
                                console.log("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0300 error: " + error);
                                console.log("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0300 success");
                                expect(true).assertTrue();
                                done();
                            });
                    }
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0300 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0400
         * @tc.name      : packing ImageSource - callback - quality 100
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */

        it("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0400", 0, async function (done) {
            try {
                await getFd("test.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0400 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSourceApi;
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0400 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalPacker = imagePackerApi;
                        let packOpts = { format: "image/jpeg", quality: 100 };
                        imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
                            if (err) {
                                expect(false).assertTrue();
                                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0400 error: " + err);
                                done();
                                return;
                            }
                            if (data != undefined) {
                                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0400 success");
                                expect(true).assertTrue();
                                done();
                            } else {
                                except(false).assertTrue();
                                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0400 failed");
                                done();
                            }
                        });
                    }
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0400 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0500
         * @tc.name      : packing ImageSource - callback - quality 0
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0500", 0, async function (done) {
            try {
                await getFd("test.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0500 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSourceApi;
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0500 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalPacker = imagePackerApi;
                        let packOpts = { format: "image/jpeg", quality: 0 };
                        imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
                            console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0500 success");
                            expect(data != undefined).assertTrue();
                            done();
                        });
                    }
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0500 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0600
         * @tc.name      : packing ImageSource - callback - quality -1
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0600", 0, async function (done) {
            try {
                await getFd("test.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0600 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSourceApi;
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0600 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalPacker = imagePackerApi;
                        let packOpts = { format: "image/jpeg", quality: -1 };
                        imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
                            console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0600 success");
                            expect(data == undefined).assertTrue();
                            done();
                        });
                    }
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0600 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_PROMISE_0100
         * @tc.name      : release ImagePacker - promise
         * @tc.desc      : 1.create ImagePacker
         *                 2.call release
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_PROMISE_0100", 0, async function (done) {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_PROMISE_0100 create image packer failed");
                expect(false).assertTrue();
                done();
            } else {
                globalPacker = imagePackerApi;
                imagePackerApi
                    .release()
                    .then(() => {
                        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_PROMISE_0100 success");
                        expect(true).assertTrue();
                        done();
                    })
                    .catch(() => {
                        console.log("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_PROMISE_0100 error: " + error);
                        expect(false).assertTrue();
                        done();
                    });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_CALLBACK_0100
         * @tc.name      : release ImagePacker - callback
         * @tc.desc      : 1.create ImagePacker
         *                 2.call release
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_CALLBACK_0100", 0, async function (done) {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_CALLBACK_0100 create image packer failed");
                expect(false).assertTrue();
                done();
            } else {
                globalPacker = imagePackerApi;
                imagePackerApi.release(() => {
                    console.info("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_CALLBACK_0100 success");
                    expect(true).assertTrue();
                    done();
                });
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0100
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0100", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99, bufferSize: 10485760 };
            packingPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0100", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0200
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0200
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0200", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99, bufferSize: 20480 };
            console.info(`SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0200 buffersize: ${packOpts.bufferSize}`);
            packingPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0200", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0300
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0300-over maxbufferSize
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0300", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99, bufferSize: 20000000 };
            packingPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0300", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0100
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0100", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99, bufferSize: 10485760 };
            packingCb(done, "SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0100", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0200
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0200
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0200", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99, bufferSize: 20480 };
            packingCb(done, "SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0200", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0300
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0300
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0300", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99, bufferSize: 20000000 };
            packingCb(done, "SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0300", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGMULTIFRAMES_0100
         * @tc.name      : test the packingMultiFrames interface uses many PixelMaps
         * @tc.desc      : 1.create PixelMap List
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packingMultiFrames
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKINGMULTIFRAMES_0100", 0, async function (done) {
            if (!isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKINGMULTIFRAMES_0100: This device does not support GIF encoding.")
                expect(true).assertTrue();
                done();
            } else {
                await createPixelMapList(done, "moving_test.gif");
                packingOptions = { frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [4,1,0], loopCount: 5};
                packingMultiFramesPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGMULTIFRAMES_0100", { width: 198, height: 202 })
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGMULTIFRAMES_0200
         * @tc.name      : test the packingMultiFrames interface uses PixelMap
         * @tc.desc      : 1.create PixelMap List
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packingMultiFrames
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKINGMULTIFRAMES_0200", 0, async function (done) {
            if (!isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKINGMULTIFRAMES_0200: This device does not support GIF encoding.")
                expect(true).assertTrue();
                done();
            } else {
                await createPixelMapList(done, "test.png");
                packingOptions = { frameCount: 1, delayTimeList: [10], disposalTypes: [3], loopCount: 5};
                packingMultiFramesPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGMULTIFRAMES_0200", { width: 472, height: 75 })
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGMULTIFRAMES_0300
         * @tc.name      : test the packingMultiFrames interface configuration delaytimes
         * @tc.desc      : 1.create PixelMap List
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packingMultiFrames
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKINGMULTIFRAMES_0300", 0, async function (done) {
            if (!isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKINGMULTIFRAMES_0300: This device does not support GIF encoding.")
                expect(true).assertTrue();
                done();
            } else {
                await createPixelMapList(done, "moving_test.gif");
                packingOptions = { frameCount: 1, delayTimeList: [10], disposalTypes: [3,2,3]};
                packingMultiFramesPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGMULTIFRAMES_0300", { width: 198, height: 202 })
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGMULTIFRAMES_0400
         * @tc.name      : test the packingMultiFrames interface configuration loop
         * @tc.desc      : 1.create PixelMap List
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packingMultiFrames
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKINGMULTIFRAMES_0400", 0, async function (done) {
            if (!isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKINGMULTIFRAMES_0400: This device does not support GIF encoding.")
                expect(true).assertTrue();
                done();
            } else {
                await createPixelMapList(done, "test.png");
                packingOptions = { frameCount: 1, delayTimeList: [10], loopCount: 2};
                packingMultiFramesPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGMULTIFRAMES_0400", { width: 472, height: 75 })
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0100
         * @tc.name      : test pack gif PixelMap to buffer --callback
         * @tc.desc      : 1.create imagesource
         *               : 2.create PixelMap
         *               : 3.create ImagePacker
         *               : 4.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0100", 0, async function (done) {
            if (!isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0100: This device does not support GIF encoding.")
                expect(true).assertTrue();
                done();
            } else {
                await testPackGifToData(
                    done, 
                    "SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0100", 
                    "moving_test.gif", 
                    "PixelMap", 
                    { width: 198, height: 202 }, 
                    "callback"
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0200
         * @tc.name      : test pack gif ImageSource to buffer --callback
         * @tc.desc      : 1.create imagesource
         *               : 2.create ImagePacker
         *               : 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0200", 0, async function (done) {
            if (!isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0200: This device does not support GIF encoding.")
                expect(true).assertTrue();
                done();
            } else {
                await testPackGifToData(
                    done, 
                    "SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0200", 
                    "moving_test.gif", 
                    "ImageSource", 
                    { width: 198, height: 202 }, 
                    "callback"
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0300
         * @tc.name      : test pack gif PixelMap to buffer --promise
         * @tc.desc      : 1.create imagesource
         *               : 2.create PixelMap
         *               : 3.create ImagePacker
         *               : 4.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0300", 0, async function (done) {
            if (!isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0300: This device does not support GIF encoding.")
                expect(true).assertTrue();
                done();
            } else {
                await testPackGifToData(
                    done, 
                    "SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0300", 
                    "moving_test.gif", 
                    "PixelMap", 
                    { width: 198, height: 202 }, 
                    "promise"
                );
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0400
         * @tc.name      : test pack gif ImageSource to buffer --promise
         * @tc.desc      : 1.create imagesource
         *               : 2.create ImagePacker
         *               : 3.call packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0400", 0, async function (done) {
            if (!isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0400: This device does not support GIF encoding.")
                expect(true).assertTrue();
                done();
            } else {
                await testPackGifToData(
                    done, 
                    "SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0400", 
                    "moving_test.gif", 
                    "ImageSource", 
                    { width: 198, height: 202 }, 
                    "promise"
                );
            }
        });
    });
}
