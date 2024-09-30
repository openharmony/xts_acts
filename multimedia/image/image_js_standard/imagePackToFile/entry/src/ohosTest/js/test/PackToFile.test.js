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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import featureAbility from "@ohos.ability.featureAbility";
import fileio from "@ohos.fileio";
import resourceManager from '@ohos.resourceManager';

export default function imagePackToFile() {
    describe("imagePackToFile", function () {
        let globalpixelmap;
        let globalPacker;
        let globalImagesource;
        let picSize = {
            pngWidth: 472,
            pngHeight: 75,
            pixelWidth: 6,
            pixelHeight: 4
        }
        const ERROR_CODE = 62980115;
        let pixelMapList;
        let packingOptions;
        let testFile;
        let isSupportGifEncode;

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

        async function getPixelMapData() {
            let opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } };
            const Color = new ArrayBuffer(96);
            globalpixelmap = await image.createPixelMap(Color, opts);
        }

        async function getWriteFd(fileName) {
            let writeFd = undefined;
            let fPath = undefined;
            try {
                let context = await featureAbility.getContext();
                await context.getCacheDir().then((data) => {
                    fPath = data + "/" + fileName;
                });
                console.info("image getWriteFd fPath is " + fPath);
                writeFd = fileio.openSync(fPath, 0o102, 0o666);
                console.log(`getWriteFd fd: ${JSON.stringify(writeFd)}`);
                if (writeFd !== null) {
                    console.info("getWriteFd file fd created");
                } else {
                    console.info("getWriteFd file fd created error");
                }
                writeFd = fileio.openSync(fPath, 0o2002, 0o666);
                console.log(`getWriteFd fd-re: ${JSON.stringify(writeFd)}`);
                if (writeFd !== null) {
                    console.info("getWriteFd file fd opened : Append Mode");
                } else {
                    console.info("getWriteFd file fd opened : Append Mode failed");
                }
            } catch (error) {
                console.info("image getWriteFd " + error);
            }
            return [fPath, writeFd];
        }

        function packToFilePromise(done, testNum, source, fd, fPath, ops, checkSize) {
            try {
                globalPacker = image.createImagePacker();
                expect(globalPacker != undefined).assertTrue();
                if (globalPacker == undefined) {
                    done();
                    return;
                }
                globalPacker.packToFile(source, fd, ops).then(async () => {
                    try {
                        fileio.closeSync(fd)
                        console.info(`${testNum} file size ${fileio.statSync(fPath).size}`);
                        let imgSource = image.createImageSource(fPath);
                        let info = await imgSource.getImageInfo();
                        console.log(`${testNum} file size ${info.size.width}`);
                        console.log(`${testNum} file size ${info.size.height}`);
                        checkSize(info.size.width, info.size.height)
                        done();
                    } catch (e1) {
                        console.log("packToFilePromise e1: " + e1);
                        expect().assertFail();
                        done();
                    }
                }).catch((error) => {
                    console.log(`${testNum} error: ` + error);
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.log("packToFilePromise error: " + error);
                expect().assertFail();
                done();
            }
        }

        function packToFileCallback(done, testNum, source, fd, fPath, ops, checkSize) {
            try {
                globalPacker = image.createImagePacker();
                expect(globalPacker != undefined).assertTrue();
                if (globalPacker == undefined) {
                    done();
                }
                globalPacker.packToFile(source, fd, ops, async (err) => {
                    try {
                        fileio.closeSync(fd)
                        console.info(`${testNum} file size ${fileio.statSync(fPath).size}`);
                        if (err != undefined) {
                            console.info(`${testNum} pack failerr: ${err}`);
                            expect(false).assertTrue();
                            done();
                        } else {
                            let imgSource = image.createImageSource(fPath);
                            let info = await imgSource.getImageInfo();
                            console.log(`${testNum} file size ${info.size.width}`);
                            console.log(`${testNum} file size ${info.size.height}`);
                            checkSize(info.size.width, info.size.height)
                            done();
                        }
                    } catch (e1) {
                        console.log("packToFileCallback e1: " + e1);
                        expect().assertFail();
                        done();
                    }
                })
            } catch (error) {
                console.log("packToFileCallback error: " + error);
                expect().assertFail();
                done();
            }
        }

        function packToFileCbErr(done, testNum, source, fd, ops, fPath) {
            try {
                globalPacker = image.createImagePacker();
                expect(globalPacker != undefined).assertTrue();
                if (globalPacker == undefined) {
                    expect(false).assertTrue();
                    done();
                    return;
                }
                globalPacker.packToFile(source, fd, ops, (err) => {
                    fileio.closeSync(fd);
                    if (err != undefined) {
                        console.info(`${testNum} pack failerr: ${JSON.stringify(err)}`);
                        console.info(`${testNum} file size ${fileio.statSync(fPath).size}`);
                        expect(err.code == ERROR_CODE).assertTrue();
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                })
            } catch (error) {
                console.log("packToFileCallback error: " + error);
                expect().assertFail();
                done();
            }
        }

        async function packToFilePromiseErr(done, testNum, source, fd, ops, fPath) {
            try {
                globalPacker = image.createImagePacker();
                expect(globalPacker != undefined).assertTrue();
                if (globalPacker == undefined) {
                    done();
                    return;
                }
                try {
                    await globalPacker.packToFile(source, fd, ops);
                    fileio.closeSync(fd);
                    expect(false).assertTrue();
                    console.info(`${testNum} packToFile test`);
                    done();
                } catch (error) {
                    fileio.closeSync(fd);
                    console.log(`${testNum} packToFile error: ` + JSON.stringify(error));
                    console.info(`${testNum} file size ${fileio.statSync(fPath).size}`);
                    expect(error.code == ERROR_CODE).assertTrue();
                    done();
                }
            } catch (error) {
                console.log("packToFilePromise error: " + error);
                expect().assertFail();
                done();
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

        async function checkPackMultiFramesResult(imageSource) {
            let delayTimes = await imageSource.getDelayTimeList();
            let disposalTypes = await imageSource.getDisposalTypeList();
            let loopCount = await imageSource.getImageProperties(image.PropertyKey.GIF_LOOP_COUNT);
            let imageInfo = imageSource.getImageInfoSync();
            console.log(`packToFileMultiFrames delayTimes ${delayTimes}`);
            console.log(`packToFileMultiFrames disposalTypes ${disposalTypes}`);
            console.log(`packToFileMultiFrames loopCount ${loopCount}`);
            console.log(`packToFileMultiFrames width ${imageInfo.size.width}`);
            console.log(`packToFileMultiFrames height ${imageInfo.size.height}`);
            expect(imageInfo.size.width == testFile.size.width).assertTrue();
            expect(imageInfo.size.height == testFile.size.height).assertTrue();
            expect(imageInfo.mimeType == "image/gif").assertTrue();
            if (packingOptions.loopCount) {
                expect(loopCount == packingOptions.loopCount).assertTrue();
            } else {
                expect(loopCount == 0).assertTrue();
            }
            for (let i = 0; i < delayTimes.length; i++) {
                if (packingOptions.delayTimeList[i]) {
                   // delayTimeList 的值编码和解码的单位差10倍
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

        async function packToFileMultiFramesPromise(done, testNum, fd, fPath) {
            globalPacker = image.createImagePacker();
            if (globalPacker == undefined) {
                console.log(`${testNum} createImagePacker failed`);
                expect(false).assertTrue();
                done();
            }
            await globalPacker.packToFile(pixelMapList, fd, packingOptions).then(async () => {
                try {
                    fileio.closeSync(fd)
                    console.log(`${testNum} packToFileMultiFrames success`);
                    let imgSource = image.createImageSource(fPath);
                    if (imgSource == undefined) {
                        console.log(`${testNum} create pack file imageSource failed.`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        await checkPackMultiFramesResult(imgSource);
                        await imgSource.release();
                        done();
                    }
                } catch (e1) {
                    console.log("packToFilePromise e1: " + e1);
                    expect().assertFail();
                    done();
                }
            }).catch((error) => {
                console.log(`${testNum} error: ` + JSON.stringify(error));
                expect().assertFail();
                done();
            });
        }

        async function testPackGifMultiFramesToFile(done, testNum) {
            await createPixelMapList(done, testFile.fileName);
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd(testFile.packTarget)
            console.log(`fpath = ` + fpath);
            console.log(`writeFd = ` + writeFd);
            await packToFileMultiFramesPromise(done, testNum, writeFd, fpath)
        }

        async function checkPackToFileResult(filepath) {
            let imageSource = image.createImageSource(filepath);
            if (imageSource == undefined) {
                console.log(`create pack file imageSource failed.`);
                return false;
            } else {
                let delayTimes = await imageSource.getDelayTimeList();
                let disposalTypes = await imageSource.getDisposalTypeList();
                let loopCount = await imageSource.getImageProperties(image.PropertyKey.GIF_LOOP_COUNT);
                let imageInfo = imageSource.getImageInfoSync();
                console.log(`packGifToFile delayTimes ${delayTimes}`);
                console.log(`packGifToFile disposalTypes ${disposalTypes}`);
                console.log(`packGifToFile loopCount ${loopCount}`);
                console.log(`packGifToFile width ${imageInfo.size.width}`);
                console.log(`packGifToFile height ${imageInfo.size.height}`);
                let result = delayTimes == 1000 && disposalTypes == 1 && loopCount == 0 &&
                    imageInfo.size.width == testFile.size.width && imageInfo.size.height == testFile.size.height &&
                    imageInfo.mimeType == "image/gif"
                await imageSource.release();
                return result;
            }
        }

        async function packGifToFile(done, testNum, source, fd, fPath, type) {
            globalPacker = image.createImagePacker();
            if (globalPacker == undefined) {
                console.log(`${testNum} createImagePacker failed`);
                expect(false).assertTrue();
                done();
            }
            if (type == "callback") {
                globalPacker.packToFile(source, fd, packingOptions, async (err) => {
                    try {
                        fileio.closeSync(fd);
                        if (err != undefined) {
                            console.info(`${testNum} pack fail: ${JSON.stringify(err)}`);
                            expect(false).assertTrue();
                            done();
                        } else {
                            let result = await checkPackToFileResult(fPath);
                            expect(result).assertTrue();
                            done();
                        }
                    } catch(error) {
                        console.log(`${testNum} packToFile failed. ${error}`);
                    }
                })
            } else {
                try {
                    await globalPacker.packToFile(source, fd, packingOptions);
                    fileio.closeSync(fd);
                    console.info(`${testNum} packToFile test success`);
                    let result = await checkPackToFileResult(fPath);
                    expect(result).assertTrue();
                    done();
                } catch (error) {
                    fileio.closeSync(fd);
                    console.log(`${testNum} packToFile error: ` + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            }
        }
        
        async function testPackGifToFile(done, testNum, type) {
            await getImageSourceData(testFile.fileName);
            let source = globalImagesource;
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd(testFile.packTarget);
            if (testFile.packSource == "PixelMap") {
                globalpixelmap = await globalImagesource.createPixelMap();
                source = globalpixelmap;
            }
            await packGifToFile(done, testNum, source, writeFd, fpath, type);
        }

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_0100
         * @tc.name      : sub_multimedia_image_packToFile_promise_imagesource_001
         * @tc.desc      : 1.create imagesource
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with imagesource-jpg
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_0100", 0, async function (done) {
            await getImageSourceData("test.png")
            expect(globalImagesource != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("promise_image_source.jpg")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/jpeg", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pngWidth).assertTrue();
                expect(height == picSize.pngHeight).assertTrue();
            }
            packToFilePromise(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_0100",
                globalImagesource, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_0200
         * @tc.name      : sub_multimedia_image_packToFile_promise_imagesource_002
         * @tc.desc      : 1.create imagesource-png
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with imagesource-webp
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_0200", 0, async function (done) {
            await getImageSourceData("test.png")
            expect(globalImagesource != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("webp_image_source.webp")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/webp", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pngWidth).assertTrue();
                expect(height == picSize.pngHeight).assertTrue();
            }
            packToFilePromise(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_0200",
                globalImagesource, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_0300
         * @tc.name      : sub_multimedia_image_packToFile_promise_imagesource_003
         * @tc.desc      : 1.create imagesource
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with imagesource-png
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_0300", 0, async function (done) {
            await getImageSourceData("test.png")
            expect(globalImagesource != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("png_image_source.png")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/png", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pngWidth).assertTrue();
                expect(height == picSize.pngHeight).assertTrue();
            }
            packToFilePromise(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_0300",
                globalImagesource, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_0100
         * @tc.name      : sub_multimedia_image_packToFile_callback_imagesource_001
         * @tc.desc      : 1.create imagesource
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with imagesource-jpg
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_0100", 0, async function (done) {
            await getImageSourceData("test.png")
            expect(globalImagesource != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("callback_image_source.jpg")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/jpeg", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pngWidth).assertTrue();
                expect(height == picSize.pngHeight).assertTrue();
            }
            packToFileCallback(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_0100",
                globalImagesource, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_0200
         * @tc.name      : sub_multimedia_image_packToFile_callback_imagesource_002
         * @tc.desc      : 1.create imagesource
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with imagesource-webp
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_0200", 0, async function (done) {
            await getImageSourceData("test.png")
            expect(globalImagesource != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("callback_image_source.webp")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/webp", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pngWidth).assertTrue();
                expect(height == picSize.pngHeight).assertTrue();
            }
            packToFileCallback(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_0200",
                globalImagesource, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_0300
         * @tc.name      : sub_multimedia_image_packToFile_callback_imagesource_003
         * @tc.desc      : 1.create imagesource
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with imagesource-png
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_0300", 0, async function (done) {
            await getImageSourceData("test.png")
            expect(globalImagesource != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("callback_image_source.png")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/png", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pngWidth).assertTrue();
                expect(height == picSize.pngHeight).assertTrue();
            }
            packToFileCallback(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_0300",
                globalImagesource, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_0100
         * @tc.name      : sub_multimedia_image_packToFile_promise_pixelmap_001
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with pixelmap-jpg
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_0100", 0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("promise_pixel_map.jpg")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/jpeg", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pixelWidth).assertTrue();
                expect(height == picSize.pixelHeight).assertTrue();
            }
            packToFilePromise(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_0100",
                globalpixelmap, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_0200
         * @tc.name      : sub_multimedia_image_packToFile_promise_pixelmap_002
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with pixelmap-webp
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_0200", 0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("promise_pixel_map.webp")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/webp", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pixelWidth).assertTrue();
                expect(height == picSize.pixelHeight).assertTrue();
            }
            packToFilePromise(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_0200",
                globalpixelmap, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_0300
         * @tc.name      : sub_multimedia_image_packToFile_promise_pixelmap_003
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with pixelmap-png
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_0300", 0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("promise_pixel_map.png")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/png", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pixelWidth).assertTrue();
                expect(height == picSize.pixelHeight).assertTrue();
            }
            packToFilePromise(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_0300",
                globalpixelmap, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_0100
         * @tc.name      : sub_multimedia_image_packToFile_callback_pixelmap_001
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with pixelmap-jpg
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_0100", 0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("callback_pixel_map.jpg")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/jpeg", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pixelWidth).assertTrue();
                expect(height == picSize.pixelHeight).assertTrue();
            }
            packToFileCallback(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_0100",
                globalpixelmap, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_0200
         * @tc.name      : sub_multimedia_image_packToFile_callback_pixelmap_002
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with pixelmap-webp
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_0200", 0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("callback_pixel_map.webp")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/webp", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pixelWidth).assertTrue();
                expect(height == picSize.pixelHeight).assertTrue();
            }
            packToFileCallback(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_0200",
                globalpixelmap, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_0300
         * @tc.name      : sub_multimedia_image_packToFile_callback_pixelmap_003
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile with pixelmap-png
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_0300", 0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("callback_pixel_map.png")
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/png", quality: 100 };

            function checkSize(width, height) {
                expect(width == picSize.pixelWidth).assertTrue();
                expect(height == picSize.pixelHeight).assertTrue();
            }
            packToFileCallback(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_0300",
                globalpixelmap, writeFd, fpath, ops, checkSize)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0100
         * @tc.name      : sub_multimedia_image_packToFile_callback_pixelmap_err_001
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile no quality
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0100", 0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("callback_pixel_map_erra.jpg");
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/jpeg" };
            packToFileCbErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0100",
                globalpixelmap, writeFd, ops, fpath)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0200
         * @tc.name      : sub_multimedia_image_packToFile_callback_pixelmap_err_002
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile { format: "image/jpeg", quality: 101 }
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0200", 0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("callback_pixel_map_errb.jpg");
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/jpeg", quality: 101 };
            packToFileCbErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0200",
                globalpixelmap, writeFd, ops, fpath)

        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0300
         * @tc.name      : sub_multimedia_image_packToFile_callback_pixelmap_err_003
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile { format: "image/txt", quality: 100 };
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0300", 0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("callback_pixel_map_errc.jpg");
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/txt", quality: 100 };
            packToFileCbErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_0300",
                globalpixelmap, writeFd, ops, fpath)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0100
         * @tc.name      : sub_multimedia_image_packToFile_promise_pixelmap_err_001
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile no quality
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0100", 0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("promise_pixel_map_erra.jpg");
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/jpeg" };
            await packToFilePromiseErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0100",
                globalpixelmap, writeFd, ops, fpath)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0200
         * @tc.name      : sub_multimedia_image_packToFile_promise_pixelmap_err_002
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile { format: "image/jpeg", quality: 101 };
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0200", 0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("promise_pixel_map_errb.jpg");
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/jpeg", quality: 101 };
            await packToFilePromiseErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0200",
                globalpixelmap, writeFd, ops, fpath)

        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0300
         * @tc.name      : sub_multimedia_image_packToFile_promise_pixelmap_err_003
         * @tc.desc      : 1.create pixelmap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFile { format: "image/txt", quality: 100 };
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0300", 0, async function (done) {
            await getPixelMapData()
            expect(globalpixelmap != undefined).assertTrue();
            let writeFd = undefined;
            let fpath = undefined;
            [fpath, writeFd] = await getWriteFd("promise_pixel_map_errc.jpg");
            expect(writeFd != undefined).assertTrue();
            expect(fpath != undefined).assertTrue();
            let ops = { format: "image/txt", quality: 100 };
            await packToFilePromiseErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_0300",
                globalpixelmap, writeFd, ops, fpath)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILEMULTIFRAMES_0100
         * @tc.name      : test the packToFileMultiFrames interface uses many PixelMaps
         * @tc.desc      : 1.create PixelMap List
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFileMultiFrames
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEMULTIFRAMES_0100", 0, async function (done) {
            if (!isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKTOFILEMULTIFRAMES_0100: This device does not support GIF encoding.")
                expect(true).assertTrue();
                done();
            } else {
                testFile = { fileName: "moving_test.gif", packTarget: "pack_multiFrames.gif", size: { width: 198, height: 202 } };
                packingOptions = { frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3,1,0], loopCount: 5};
                await testPackGifMultiFramesToFile(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEMULTIFRAMES_0100");
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILEMULTIFRAMES_0200
         * @tc.name      : test the packToFileMultiFrames interface uses PixelMap
         * @tc.desc      : 1.create PixelMap List
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFileMultiFrames
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
         it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEMULTIFRAMES_0200", 0, async function (done) {
            if (!isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKTOFILEMULTIFRAMES_0200: This device does not support GIF encoding.")
                expect(true).assertTrue();
                done();
            } else {
                testFile = { fileName: "test.png", packTarget: "pack_oneFrame.gif", size: { width: 472, height: 75 } };
                packingOptions = { frameCount: 1, delayTimeList: [100], disposalTypes: [3], loopCount: 5};
                await testPackGifMultiFramesToFile(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEMULTIFRAMES_0200");
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILEMULTIFRAMES_0300
         * @tc.name      : test the packToFileMultiFrames interface configuration delaytimes
         * @tc.desc      : 1.create PixelMap List
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFileMultiFrames
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEMULTIFRAMES_0300", 0, async function (done) {
            if (!isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKTOFILEMULTIFRAMES_0300: This device does not support GIF encoding.")
                expect(true).assertTrue();
                done();
            } else {
                testFile = { fileName: "moving_test.gif", packTarget: "pack_no_loop.gif", size: { width: 198, height: 202 } };
                packingOptions = { frameCount: 1, delayTimeList: [200], disposalTypes: [3, 1, 0]};
                await testPackGifMultiFramesToFile(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEMULTIFRAMES_0300");
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILEMULTIFRAMES_0400
         * @tc.name      : test the packToFileMultiFrames interface configuration loop
         * @tc.desc      : 1.create PixelMap List
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.packToFileMultiFrames
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEMULTIFRAMES_0400", 0, async function (done) {
            if (!isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKTOFILEMULTIFRAMES_0400: This device does not support GIF encoding.")
                expect(true).assertTrue();
                done();
            } else {
                testFile = { fileName: "test.png", packTarget: "pack_no_disposalTypes.gif", size: { width: 472, height: 75 } }
                packingOptions = { frameCount: 1, delayTimeList: [100], loopCount: 4};
                await testPackGifMultiFramesToFile(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEMULTIFRAMES_0400");
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0100
         * @tc.name      : test pack gif imagesource to file --callback
         * @tc.desc      : 1.create imagesource
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.call packToFile
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0100", 0, async function (done) {
            if (!isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0100: This device does not support GIF encoding.")
                expect(true).assertTrue();
                done();
            } else {
                testFile = { 
                    fileName: "moving_test.gif", packTarget: "pack_imagesource_to_file_callback.gif", 
                    size: { width: 198, height: 202 }, packSource: "ImageSource"
                };
                packingOptions = { format: "image/gif", quality: 100};
                await testPackGifToFile(done, "SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0100", "callback");
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0200
         * @tc.name      : test pack gif PixelMap to file --callback
         * @tc.desc      : 1.create PixelMap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.call packToFile
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0200", 0, async function (done) {
            if (!isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0200: This device does not support GIF encoding.")
                expect(true).assertTrue();
                done();
            } else {
                testFile = { 
                    fileName: "moving_test.gif", packTarget: "pack_pixelmap_to_file_callback.gif", 
                    size: { width: 198, height: 202 }, packSource: "PixelMap"
                };
                packingOptions = { format: "image/gif", quality: 100};
                await testPackGifToFile(done, "SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0200", "callback");
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0300
         * @tc.name      : test pack gif imagesource to file --promise
         * @tc.desc      : 1.create imagesource
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.call packToFile
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0300", 0, async function (done) {
            if (!isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0300: This device does not support GIF encoding.")
                expect(true).assertTrue();
                done();
            } else {
                testFile = { 
                    fileName: "moving_test.gif", packTarget: "pack_imagesource_to_file_promise.gif", 
                    size: { width: 198, height: 202 }, packSource: "ImageSource"
                };
                packingOptions = { format: "image/gif", quality: 100};
                await testPackGifToFile(done, "SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0300", "promise");
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0400
         * @tc.name      : test pack gif PixelMap to file --promise
         * @tc.desc      : 1.create PixelMap
         *               : 2.get writefd
         *               : 3.create ImagePacker
         *               : 4.call packToFile
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0400", 0, async function (done) {
            if (!isSupportGifEncode) {
                console.info("SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0400: This device does not support GIF encoding.")
                expect(true).assertTrue();
                done();
            } else {
                testFile = { 
                    fileName: "moving_test.gif", packTarget: "pack_pixelmap_to_file_promise.gif", 
                    size: { width: 198, height: 202 }, packSource: "PixelMap"
                };
                packingOptions = { format: "image/gif", quality: 100};
                await testPackGifToFile(done, "SUB_MULTIMEDIA_IMAGE_GIF_PACKTOFILE_0400", "promise");
            }
        });
    });
}