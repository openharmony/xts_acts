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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { testPng, testJpg } from './testImg';
import { testGif, testBmp } from './testImg2';
import { getPropertyBuf } from "./getPropertyBuf";
import { modifyBuf } from "./modifyBuffer";
import { prepareImageFile, prepareImageFileFd } from './Common';
import fileIO from '@ohos.file.fs';

export default function ImageSource() {
    describe("ImageSource", function () {
        let context;
        let filePath;
        let fileFd = null;
        let globalpixelmap;
        const EXPECTFRAMECOUNT = 1;
        const { UNKNOWN, RGB_565, RGBA_8888 } = image.PixelMapFormat;
        const { DATE_TIME_ORIGINAL, EXPOSURE_TIME, SCENE_TYPE, ISO_SPEED_RATINGS, F_NUMBER, BITS_PER_SAMPLE, IMAGE_WIDTH, IMAGE_LENGTH } = image.PropertyKey;
        const { ORIENTATION, GPS_LATITUDE, GPS_LONGITUDE, GPS_LATITUDE_REF, GPS_LONGITUDE_REF } = image.PropertyKey;
        let props = {
            DateTimeOriginal: "2022:06:02 15:51:35",
            ExposureTime: "1/33 sec.",
            SceneType: "Directly photographed",
            ISOSpeedRatings: "400",
            FNumber: "f/1.8",
        };

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
            console.info("beforeAll case");
            context = globalThis.abilityContext;
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

        async function packingPromise(done, testNum, pixelmap) {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
                console.info(`${testNum} packingPromise create image packer failed`);
                expect(false).assertTrue();
                done();
            } else {
                let packOpts = { format: "image/webp", quality: 100 };
                console.info(
                    `${testNum} packingPromise packOpts={${JSON.stringify(packOpts)}}`
                );
                try {
                    let data = await imagePackerApi.packing(pixelmap, packOpts);
                    console.info(`${testNum} packing finished`);
                    if (data == undefined) {
                        console.info(`${testNum} packing failed`);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info(`${testNum} packing success`);
                    var dataArr = new Uint8Array(data);
                    console.info(`${testNum} packing show begin length: ${dataArr.length} `);
                    var line = 0;
                    for (var i = 0; i < dataArr.length; i++) {
                        var str = `dataArr[ ${i} ]=`;
                        for (var j = 0; j < 20 && i < dataArr.length; j++, i++) {
                            str = str + dataArr[i] + ",";
                        }
                        console.info(`${testNum} packing str: ${str}`);
                        i--;
                        line++;
                    }
                    console.info(`${testNum} packing show end line: ${line}`);
                    expect(true).assertTrue();
                    done();
                } catch (error) {
                    console.info(`${testNum} packingPromise error: ${error}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        }

        async function createPixelMapListPromise(done, testNum, decodeOpts) {
            await getFileFd("test.gif", testGif);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} createPixelMapListPromise create imagesource failed`);
                expect(false).assertTrue();
                done();
            } else {
                try {
                    console.info(`${testNum} createPixelMapListPromise create imagesource success`);
                    let pixelMapList = await imageSourceApi.createPixelMapList(decodeOpts);
                    if (pixelMapList != undefined) {
                        console.info(`${testNum} pixelMapList show begin(length: ${pixelMapList.length})`);
                        packingPromise(done, testNum, pixelMapList[0]);
                    } else {
                        console.info(`${testNum} createPixelMapListPromise createPixelMapList failed`);
                        expect(false).assertTrue();
                        done();
                    }
                } catch (error) {
                    console.info(`${testNum} createPixelMapListPromise error: ${error}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        }

        async function createPixelMapListCallBack(done, testNum, decodeOpts) {
            try {
                await getFileFd("test.gif", testGif);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info(`${testNum} createPixelMapListCallBack create imagesource failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info(`${testNum} createPixelMapListCallBack create imagesource success`);
                    imageSourceApi.createPixelMapList(decodeOpts, (err, pixelMapList) => {
                        try {
                            if (err != undefined) {
                                console.info(`${testNum} createPixelMapListCallBack failed err: ${err}`);
                                expect(false).assertTrue();
                                done();
                            }
                            expect(pixelMapList != undefined).assertTrue();
                            console.info(`${testNum} pixelMapList show begin length: ${pixelMapList.length}`);
                            packingPromise(done, testNum, pixelMapList[0]);
                        } catch (err) {
                            console.info(`${testNum} createPixelMapListCallBack createPixelMapList callback error` + err);
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info(`${testNum} createPixelMapListCallBack create imagesource error` + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function createPixelMapListErrPromise(done, testNum, decodeOpts) {
            await getFileFd("test.gif", testGif);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} createPixelMapListPromise create imagesource failed`);
                expect(false).assertTrue();
                done();
            } else {
                try {
                    await imageSourceApi.createPixelMapList(decodeOpts);
                    console.info(`${testNum} failed `);
                    expect(false).assertTrue();
                    done();
                } catch (error) {
                    console.info(`${testNum} createPixelMapListPromise error: ${error}`);
                    expect(true).assertTrue();
                    done();
                }
            }
        }

        async function createPixelMapListErrCallBack(done, testNum, decodeOpts) {
            await getFileFd("test.gif", testGif);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} createPixelMapListCallBack create imagesource failed`);
                expect(false).assertTrue();
                done();
            } else {
                console.info(`${testNum} createPixelMapListCallBack create imagesource success`);
                imageSourceApi.createPixelMapList(decodeOpts, (err, pixelMapList) => {
                    if (err != undefined || pixelMapList == undefined) {
                        expect(true).assertTrue();
                        console.info(`${testNum} createPixelMapList err:${err}`);
                        done();
                    } else {
                        console.info(`${testNum} failed`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        }

        async function getDelayTimePromise(done, testNum, picName) {
            await getFileFd(picName, testGif);
            let imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} getDelayTimePromise create imagesource failed`);
                expect(false).assertTrue();
                done();
            } else {
                try {
                    console.info(`${testNum} getDelayTimePromise create imagesource success`);
                    let delayTimes = await imageSourceApi.getDelayTime();
                    if (delayTimes != undefined) {
                        console.info(`${testNum} getDelayTimePromise getDelayTime success`);
                        expect(true).assertTrue();
                        console.info(`${testNum} delayTimes show begin length: ${delayTimes.length} `);
                        for (var i = 0; i < delayTimes.length; i++) {
                            console.info(`${testNum} delayTimes[ ${i} ]= ${delayTimes[i]}`);
                        }
                        console.info(`${testNum} delayTimes show end`);
                    } else {
                        console.info(`${testNum} getDelayTimePromise getDelayTime failed`);
                        expect(false).assertTrue();
                    }
                    done();
                } catch (error) {
                    console.log(`${testNum} getDelayTimePromise err: ${error}`);
                    expect(false).assertTrue();
                    done();
                };
            }
        }

        async function getDelayTimeCallBack(done, testNum, picName) {
            await getFileFd(picName, testGif);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} getDelayTimeCallBack create imagesource failed`);
                expect(false).assertTrue();
                done();
            } else {
                console.info(`${testNum} getDelayTimeCallBack create imagesource success`);
                imageSourceApi.getDelayTime((err, delayTimes) => {
                    if (err != undefined) {
                        console.info(`${testNum} getDelayTimeCallBack getDelayTime failed err: ${err}`);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    expect(delayTimes != undefined).assertTrue();
                    console.info(`${testNum} getDelayTimeCallBack getDelayTime success`);
                    console.info(`${testNum} delayTimes show begin(length:` + delayTimes.length + `)`);
                    for (var i = 0; i < delayTimes.length; i++) {
                        console.info(`${testNum} delayTimes[` + i + `]=` + delayTimes[i]);
                    }
                    console.info(`${testNum} delayTimes show end`);
                    done();
                });
            }
        }

        async function getFrameCountPromise(done, testNum, picName) {
            try {
                await getFileFd(picName, testGif);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info(`${testNum} getFrameCountPromise create imagesource failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info(`${testNum} getFrameCountPromise create imagesource success`);
                    let frameCount = await imageSourceApi.getFrameCount();
                    if (frameCount != undefined) {
                        console.info(`${testNum} getFrameCountPromise getFrameCount success`);
                        expect(frameCount).assertEqual(EXPECTFRAMECOUNT);
                        console.info(`${testNum} getFrameCountPromise frameCount= ${frameCount}`);
                    } else {
                        console.info(`${testNum} getFrameCountPromise getFrameCount failed`);
                        expect(false).assertTrue();
                    }
                    done();
                }
            } catch (error) {
                console.info(`${testNum} getFrameCountPromise error: ` + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function getFrameCountCallBack(done, testNum, picName) {
            await getFileFd(picName, testGif);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} getFrameCountCallBack create imagesource failed`);
                expect(false).assertTrue();
                done();
            } else {
                console.info(`${testNum} getFrameCountCallBack create imagesource success`);
                imageSourceApi.getFrameCount((err, frameCount) => {
                    if (err != undefined) {
                        console.info(`${testNum} getFrameCountCallBack getFrameCount failed err: ${err}`);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    expect(frameCount).assertEqual(EXPECTFRAMECOUNT);
                    console.info(`${testNum} getFrameCountCallBack getFrameCount success`);
                    console.info(`${testNum} getFrameCountCallBack frameCount= ${frameCount}`);
                    done();
                });
            }
        }

        async function createIncrementalSourcePromise(done, testNum, type, opts?) {
            let testimagebuffer = testPng;
            let incSouce;
            console.info(`${testNum} 0001 ` + testimagebuffer.length);
            let bufferSize = 5000;
            let offset = 0;
            if (type == "sourceOpts") {
                console.info(`${testNum} have sourceopts`);
                incSouce = image.CreateIncrementalSource(new ArrayBuffer(1), opts);
            } else {
                console.info(`${testNum} no sourceopts`);
                incSouce = image.CreateIncrementalSource(new ArrayBuffer(1));
            }
            let ret;
            let isFinished = false;
            while (offset < testimagebuffer.length) {
                var oneStep = testimagebuffer.slice(offset, offset + bufferSize);
                console.info(`${testNum} 0002 ` + oneStep.length);
                if (oneStep.length < bufferSize) {
                    isFinished = true;
                }
                ret = await incSouce.updateData(oneStep, isFinished, 0, oneStep.length);
                if (!ret) {
                    console.info(`${testNum} updateData failed`);
                    expect(ret).assertTrue();
                    break;
                }
                offset = offset + oneStep.length;
                console.info(`${testNum} 0003 ` + offset);
            }
            if (ret) {
                console.info(`${testNum} updateData success `);
                let decodingOptions = {
                    sampleSize: 1,
                };
                incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(`${testNum} createPixelMap err: ` + err);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info(`${testNum} 0004` + pixelmap);
                    expect(pixelmap != undefined).assertTrue();
                    done();
                });
            } else {
                expect(false).assertTrue();
                done();
            }
        }

        async function createIncrementalSourceCb(done, testNum, type, opts?) {
            let testimagebuffer = testPng;
            let incSouce;
            console.info(`${testNum} 0001 ` + testimagebuffer.length);
            let bufferSize = 5000;
            let offset = 0;
            if (type == "sourceOpts") {
                incSouce = image.CreateIncrementalSource(new ArrayBuffer(1), opts);
            } else {
                incSouce = image.CreateIncrementalSource(new ArrayBuffer(1));
            }
            let ret;
            let isFinished = false;
            while (offset < testimagebuffer.length) {
                var oneStep = testimagebuffer.slice(offset, offset + bufferSize);
                console.info(`${testNum} 0002 ` + oneStep.length);
                if (oneStep.length < bufferSize) {
                    isFinished = true;
                }
                ret = await new Promise((res) => {
                    incSouce.updateData(oneStep, isFinished, 0, oneStep.length, (err, ret) => {
                        res(ret);
                    });
                });

                if (!ret) {
                    console.info(`${testNum} updateData failed`);
                    expect(ret).assertTrue();
                    break;
                }
                offset = offset + oneStep.length;
                console.info(`${testNum} 0003 ` + offset);
            }
            if (ret) {
                console.info(`${testNum} updateData success `);
                let decodingOptions = {
                    sampleSize: 1,
                };
                incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(`${testNum} createPixelMap err: ` + err);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info(`${testNum} 0004` + pixelmap);
                    expect(pixelmap != undefined).assertTrue();
                    done();
                });
            } else {
                expect(false).assertTrue();
                done();
            }
        }

        async function getPromise(done, testNum, type, args) {
            let imageSourceApi;
            if (type == "buf") {
                const data = getPropertyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFileFd("test.jpg", getPropertyBuf);
                imageSourceApi = image.createImageSource(fileFd);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi
                    .getImageProperty(args)
                    .then((data) => {
                        console.info(`${testNum} ${args} ` + data);
                        expect(data == props[args]).assertTrue();
                        done();
                    })
                    .catch((error) => {
                        console.log(`${testNum} error: ` + error);
                        expect(false).assertTrue();
                        done();
                    });
            }
        }

        async function getCb(done, testNum, type, args) {
            let imageSourceApi;
            if (type == "buf") {
                const data = getPropertyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFileFd("test.jpg", getPropertyBuf);
                imageSourceApi = image.createImageSource(fileFd);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageProperty(args, (err, data) => {
                    if (err) {
                        expect(false).assertTrue();
                        console.info(`${testNum} ${args} err: ` + err);
                    } else {
                        console.info(`${testNum} ${args} ` + data);
                        expect(data == props[args]).assertTrue();
                        done();
                    }
                });
            }
        }

        async function getCb2(done, testNum, type, args) {
            let imageSourceApi;
            if (type == "buf") {
                const data = getPropertyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFileFd("test.jpg", getPropertyBuf);
                imageSourceApi = image.createImageSource(fileFd);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                let property = { index: 0, defaultValue: "9999" };
                imageSourceApi.getImageProperty(args, property, (err, data) => {
                    if (err) {
                        expect(false).assertTrue();
                        console.info(`${testNum} ${args} err: ` + err);
                    } else {
                        console.info(`${testNum} ${args} ` + data);
                        expect(data != "9999" && data == props[args]).assertTrue();
                        done();
                    }
                });
            }
        }

        async function getPromiseErr(done, testNum, type, args, isTypeErr) {
            let imageSourceApi;
            if (type == "buf") {
                const data = getPropertyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFileFd("test.jpg", testJpg);
                imageSourceApi = image.createImageSource(fileFd);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                if (isTypeErr) {
                    try {
                        await imageSourceApi.getImageProperty(args);
                        expect(false).assertTrue();
                    } catch (error) {
                        expect(error.code == 1).assertTrue();
                        console.log(`${testNum} error msg: ` + error);
                        done();
                    }
                } else {
                    try {
                        await imageSourceApi.getImageProperty(args);
                        expect(false).assertTrue();
                    } catch (error) {
                        expect(error.code != 0).assertTrue();
                        console.log(`${testNum} error msg: ` + error);
                        done();
                    }
                }
            }
        }

        async function getCbErr(done, testNum, type, args, isTypeErr) {
            let imageSourceApi;
            if (type == "buf") {
                const data = getPropertyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFileFd("test.jpg", testJpg);
                imageSourceApi = image.createImageSource(fileFd);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                if (isTypeErr) {
                    try {
                        imageSourceApi.getImageProperty(args, (error, data) => {
                            expect(false).assertTrue();
                            done();
                        });
                    } catch (error) {
                        console.log(`${testNum} error1 msg: ` + error);
                        expect(error.code == 1).assertTrue();
                        done();
                    }
                } else {
                    imageSourceApi.getImageProperty(args, (error, data) => {
                        expect(error.code != 0).assertTrue();
                        console.log(`${testNum} error3 msg: ` + error);
                        done();
                    });
                }
            }
        }

        async function getCb2Err(done, testNum, type, args, isTypeErr) {
            let imageSourceApi;
            if (type == "buf") {
                const data = getPropertyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFileFd("test.jpg", testJpg);
                imageSourceApi = image.createImageSource(fileFd);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                let property = { index: 0, defaultValue: "9999" };
                if (isTypeErr) {
                    try {
                        imageSourceApi.getImageProperty(args, property, (error, data) => {
                            expect(false).assertTrue();
                        });
                    } catch (error) {
                        expect(error.code == 1).assertTrue();
                        console.log(`${testNum} error msg: ` + error);
                        done();
                    }
                } else {
                    imageSourceApi.getImageProperty(args, property, (error, data) => {
                        expect(error.code != 0).assertTrue();
                        console.log(`${testNum} error msg: ` + error);
                        done();
                    });
                }
            }
        }

        async function modifyPromise(done, testNum, type, key, value, checkProps) {
            let imageSourceApi;
            if (type == "buffer") {
                const data = modifyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFilePath("test.jpg", testJpg);
                imageSourceApi = image.createImageSource(filePath);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi
                    .modifyImageProperty(key, value)
                    .then(() => {
                        imageSourceApi
                            .getImageProperty(key)
                            .then((data) => {
                                console.info(`${testNum} ${key} ` + data);
                                checkProps(data);
                                done();
                            })
                            .catch((err) => {
                                console.info(`${testNum} getImageProperty failed, err:${err}`);
                                expect(false).assertTrue();
                                done();
                            });
                    })
                    .catch((err) => {
                        console.info(`${testNum} modifyImageProperty failed, err:${err}`);
                        expect(false).assertTrue();
                        done();
                    });
            }
        }

        async function modifyImageErrPromise(done, testNum, type, key, value) {
            let imageSourceApi;
            try {
                if (type == "buffer") {
                    const data = modifyBuf.buffer;
                    imageSourceApi = image.createImageSource(data);
                } else {
                    await getFilePath("test.jpg", testJpg);
                    imageSourceApi = image.createImageSource(filePath);
                }
            } catch (error) {
                expect(false).assertTrue();
                done();
            }

            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi
                    .modifyImageProperty(key, value)
                    .then(() => {
                        expect(false).assertTrue();
                        done();
                    })
                    .catch((error) => {
                        expect(error.code != 0).assertTrue();
                        console.info(`${testNum} message: ` + error);
                        done();
                    });
            }
        }

        async function modifyCb(done, testNum, type, key, value, checkProps) {
            let imageSourceApi;
            if (type == "buffer") {
                const data = modifyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFilePath("test.jpg", testJpg);
                imageSourceApi = image.createImageSource(filePath);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.modifyImageProperty(key, value, (error) => {
                    if (error) {
                        expect(false).assertTrue();
                        console.info(`${testNum} modify err: ` + error);
                    } else {
                        imageSourceApi.getImageProperty(key, (error, data) => {
                            if (error) {
                                expect(false).assertTrue();
                                console.info(`${testNum} get err: ` + error);
                            } else {
                                console.info(`${testNum} ${key}: ` + data);
                                checkProps(data);
                                done();
                            }
                        });
                    }
                });
            }
        }

        async function modifyErrCb(done, testNum, type, key, value) {
            let imageSourceApi;
            if (type == "buffer") {
                const data = modifyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFilePath("test.jpg", testJpg);
                imageSourceApi = image.createImageSource(filePath);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.modifyImageProperty(key, value, (error) => {
                    expect(error.code != 0).assertTrue();
                    console.info(`${testNum} errormsg: ` + error);
                    done();
                });
            }
        }

        /**
         * @tc.number    : TEST_GETIMAGEINFO_CB_001
         * @tc.name      : testGetImageInfoCb001
         * @tc.desc      : 1.create imageSource
         *                 2.imageSourcecall getImageInfo(ImageInfo)
         *                 3.callback return imageInfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImageInfoCb001', 0, async function (done) {
            try {
                await getFileFd('test.jpg', testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testGetImageInfoCb001 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo((err, imageInfo) => {
                        if (err) {
                            expect(false).assertTrue();
                            console.info('testGetImageInfoCb001 err:' + err);
                            done();
                            return
                        }
                        if (imageInfo != undefined) {
                            console.info('testGetImageInfoCb001 imageInfo.size.height:' + imageInfo.size.height);
                            console.info('testGetImageInfoCb001 imageInfo.size.width:' + imageInfo.size.width);
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info('testGetImageInfoCb001 failed');
                            expect(false).assertTrue();
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('testGetImageInfoCb001 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_GETIMAGEINFO_CB_002
         * @tc.name      : testGetImageInfoCb002
         * @tc.desc      : 1.create imageSource
         *                 2.imageSourcecall getImageInfo(ImageInfo)
         *                 3.callback return imageInfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImageInfoCb002', 0, async function (done) {
            try {
                await getFileFd('test.bmp', testBmp);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testGetImageInfoCb002 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo((err, imageInfo) => {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('testGetImageInfoCb002 imageInfo.size.height:' + imageInfo.size.height);
                        console.info('testGetImageInfoCb002 imageInfo.size.width:' + imageInfo.size.width);
                        done();
                    })
                }
            } catch (error) {
                console.info('testGetImageInfoCb002 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_GETIMAGEINFO_CB_003
         * @tc.name      : testGetImageInfoCb003
         * @tc.desc      : 1.create imageSource
         *                 2.imageSourcecall getImageInfo(ImageInfo)
         *                 3.callback return imageInfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImageInfoCb003', 0, async function (done) {
            try {
                await getFileFd('test.png', testPng);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testGetImageInfoCb003 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo((err, imageInfo) => {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('testGetImageInfoCb003 imageInfo.size.height:' + imageInfo.size.height);
                        console.info('testGetImageInfoCb003 imageInfo.size.width:' + imageInfo.size.width);
                        done();
                    })
                }
            } catch (error) {
                console.info('testGetImageInfoCb003 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_GETIMAGEINFO_CB_004
         * @tc.name      : testGetImageInfoCb004
         * @tc.desc      : 1.create ImageInfo
         *                 2.call getImageInfo(index, ImageInfo)
         *                 3.callback return imageInfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImageInfoCb004', 0, async function (done) {
            try {
                await getFileFd('test.gif', testGif);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testGetImageInfoCb004 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo((err, imageInfo) => {
                        if (err) {
                            expect(false).assertTrue();
                            console.info('testGetImageInfoCb004 error' + err);
                            done();
                            return
                        }
                        if (imageInfo != undefined && imageInfo != null) {
                            expect(true).assertTrue();
                            console.info('testGetImageInfoCb004 imageInfo.size.height:' + imageInfo.size.height);
                            console.info('testGetImageInfoCb004 imageInfo.size.width:' + imageInfo.size.width);
                            console.info('testGetImageInfoCb004 success')
                            done();
                        } else {
                            expect(false).assertTrue();
                            console.info('testGetImageInfoCb004 failed')
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('testGetImageInfoCb004 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_GETIMAGEINFO_INDEX_CB_001
         * @tc.name      : testGetImageInfoIndexCb001
         * @tc.desc      : 1.create ImageInfo
         *                 2.call getImageInfo(index, ImageInfo)
         *                 3.callback return imageInfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImageInfoIndexCb001', 0, async function (done) {
            try {
                await getFileFd('test.jpg', testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testGetImageInfoIndexCb001 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(0, (err, imageInfo) => {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('testGetImageInfoIndexCb001 imageInfo.size.height:' + imageInfo.size.height);
                        console.info('testGetImageInfoIndexCb001 imageInfo.size.width:' + imageInfo.size.width);
                        done();
                    })
                }
            } catch (error) {
                console.info('testGetImageInfoIndexCb001 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_GETIMAGEINFO_INDEX_CB_002
         * @tc.name      : testGetImageInfoIndexCb002
         * @tc.desc      : 1.create ImageInfo
         *                 2.call getImageInfo(index, ImageInfo)
         *                 3.callback return imageInfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImageInfoIndexCb002', 0, async function (done) {
            try {
                await getFileFd('test.bmp', testBmp);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testGetImageInfoIndexCb002 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(0, (err, imageInfo) => {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('testGetImageInfoIndexCb002 imageInfo.size.height:' + imageInfo.size.height);
                        console.info('testGetImageInfoIndexCb002 imageInfo.size.width:' + imageInfo.size.width);
                        done();
                    })
                }
            } catch (error) {
                console.info('testGetImageInfoIndexCb002 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_GETIMAGEINFO_INDEX_CB_003
         * @tc.name      : testGetImageInfoIndexCb003
         * @tc.desc      : 1.create ImageInfo
         *                 2.call getImageInfo(index, ImageInfo)
         *                 3.callback return imageInfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImageInfoIndexCb003', 0, async function (done) {
            try {
                await getFileFd('test.png', testPng);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testGetImageInfoIndexCb003 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(0, (err, imageInfo) => {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('testGetImageInfoIndexCb003 imageInfo.size.height:' + imageInfo.size.height);
                        console.info('testGetImageInfoIndexCb003 imageInfo.size.width:' + imageInfo.size.width);
                        done();
                    })
                }
            } catch (error) {
                console.info('testGetImageInfoIndexCb003 error: ' + error);
                expect(false).assertTrue();
                done();
            }

        })

        /**
         * @tc.number    : TEST_GETIMAGEINFO_INDEX_CB_004
         * @tc.name      : testGetImageInfoIndexCb004
         * @tc.desc      : 1.create ImageInfo
         *                 2.call getImageInfo(index, ImageInfo)
         *                 3.callback return imageInfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImageInfoIndexCb004', 0, async function (done) {
            try {
                await getFileFd('test.gif', testGif);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testGetImageInfoIndexCb004 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(0, (err, imageInfo) => {
                        if (err) {
                            expect(false).assertTrue();
                            console.info('testGetImageInfoIndexCb004 error' + err);
                            done();
                            return
                        }
                        if (imageInfo != undefined && imageInfo != null) {
                            expect(true).assertTrue();
                            console.info('testGetImageInfoIndexCb004 imageInfo.size.height:' + imageInfo.size.height);
                            console.info('testGetImageInfoIndexCb004 imageInfo.size.width:' + imageInfo.size.width);
                            console.info('testGetImageInfoIndexCb004 success')
                            done();
                        } else {
                            expect(false).assertTrue();
                            console.info('testGetImageInfoIndexCb004 failed')
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('testGetImageInfoIndexCb004 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_GETIMAGEINFO_INDEX_CB_005
         * @tc.name      : testGetImageInfoIndexCb005
         * @tc.desc      : 1.create ImageInfo
         *                 2.call getImageInfo(index, ImageInfo)
         *                 3.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImageInfoIndexCb005', 0, async function (done) {
            try {
                await getFileFd('test.gif', testGif);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testGetImageInfoIndexCb005 create image source failed');
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
                console.info('testGetImageInfoIndexCb005 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_GETIMAGEINFO_INDEX_CB_006
         * @tc.name      : testGetImageInfoIndexCb006
         * @tc.desc      : 1.create ImageInfo
         *                 2.call getImageInfo(index, ImageInfo)
         *                 3.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImageInfoIndexCb006', 0, async function (done) {
            try {
                await getFileFd('test.gif', testGif);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testGetImageInfoIndexCb006 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(-1, (err, imageInfo) => {
                        expect(imageInfo == undefined).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('testGetImageInfoIndexCb006 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_GETIMAGEINFO_INDEX_PROMISE_001
         * @tc.name      : testGetImageInfoIndexPromise001
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageInfo(index)
         *                 3.callbackcall ,return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImageInfoIndexPromise001', 0, async function (done) {
            try {
                await getFileFd('test.jpg', testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testGetImageInfoIndexPromise001 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(0)
                        .then(imageInfo => {
                            expect(imageInfo != undefined).assertTrue();
                            console.info('testGetImageInfoIndexPromise001 imageInfo');
                            console.info('imageInfo.size.height:' + imageInfo.size.height);
                            console.info('imageInfo.size.width:' + imageInfo.size.width);
                            done();
                        }).catch(error => {
                        console.log('testGetImageInfoIndexPromise001 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('testGetImageInfoIndexPromise001 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_GETIMAGEINFO_INDEX_PROMISE_002
         * @tc.name      : testGetImageInfoIndexPromise002
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageInfo(index)
         *                 3.callbackcall ,return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImageInfoIndexPromise002', 0, async function (done) {
            try {
                await getFileFd('test.bmp', testBmp);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testGetImageInfoIndexPromise002 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(0)
                        .then(imageInfo => {
                            expect(imageInfo != undefined).assertTrue();
                            console.info('testGetImageInfoIndexPromise002 imageInfo');
                            console.info('imageInfo.size.height:' + imageInfo.size.height);
                            console.info('imageInfo.size.width:' + imageInfo.size.width);
                            done();
                        }).catch(error => {
                        console.log('testGetImageInfoIndexPromise002 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('testGetImageInfoIndexPromise002 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_GETIMAGEINFO_INDEX_PROMISE_003
         * @tc.name      : testGetImageInfoIndexPromise003
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageInfo(index)
         *                 3.callbackcall ,return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImageInfoIndexPromise003', 0, async function (done) {
            try {
                await getFileFd('test.png', testPng);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testGetImageInfoIndexPromise003 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(0)
                        .then(imageInfo => {
                            expect(imageInfo != undefined).assertTrue();
                            console.info('testGetImageInfoIndexPromise003 imageInfo');
                            console.info('imageInfo.size.height:' + imageInfo.size.height);
                            console.info('imageInfo.size.width:' + imageInfo.size.width);
                            done();
                        }).catch(error => {
                        console.log('testGetImageInfoIndexPromise003 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('testGetImageInfoIndexPromise003 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_GETIMAGEINFO_INDEX_PROMISE_004
         * @tc.name      : testGetImageInfoIndexPromise004
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageInfo(index)
         *                 3.callbackcall ,return imageinfo
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImageInfoIndexPromise004', 0, async function (done) {
            try {
                await getFileFd('test.gif', testGif);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testGetImageInfoIndexPromise004 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(0)
                        .then(imageInfo => {
                            if (imageInfo != undefined && imageInfo != null) {
                                expect(true).assertTrue();
                                console.info('testGetImageInfoIndexPromise004 imageInfo.size.height:' + imageInfo.size.height);
                                console.info('testGetImageInfoIndexPromise004 imageInfo.size.width:' + imageInfo.size.width);
                                done();
                            } else {
                                expect(false).assertTrue();
                                console.info('testGetImageInfoIndexPromise004 failed');
                                done();
                            }
                        }).catch(error => {
                        console.log('testGetImageInfoIndexPromise004 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('testGetImageInfoIndexPromise004 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_GETIMAGEINFO_INDEX_PROMISE_005
         * @tc.name      : testGetImageInfoIndexPromise005
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageInfo(index=1)
         *                 3.callback return imageinfo undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImageInfoIndexPromise005', 0, async function (done) {
            try {
                await getFileFd('test.gif', testGif);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testGetImageInfoIndexPromise005 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(1)
                        .then(() => {
                            console.log('testGetImageInfoIndexPromise005 failed');
                            expect().assertFail();
                            done();
                        }).catch(error => {
                        console.log('testGetImageInfoIndexPromise005 success');
                        expect(true).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('testGetImageInfoIndexPromise005 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_GETIMAGEINFO_INDEX_PROMISE_006
         * @tc.name      : testGetImageInfoIndexPromise006
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageInfo(index=-1)
         *                 3.callback return imageinfo undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImageInfoIndexPromise006', 0, async function (done) {
            try {
                await getFileFd('test.gif', testGif);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testGetImageInfoIndexPromise006 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.getImageInfo(-1)
                        .then(() => {
                            console.log('testGetImageInfoIndexPromise006 failed');
                            expect().assertFail();
                            done();
                        }).catch(error => {
                        console.log('testGetImageInfoIndexPromise006 success');
                        expect(true).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('testGetImageInfoIndexPromise006 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_PROMISE_001
         * @tc.name      : testCreatePixelMapPromise001
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreatePixelMapPromise001', 0, async function (done) {
            try {
                await getFileFd('test.jpg', testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testCreatePixelMapPromise001 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap().then(pixelmap => {
                        globalpixelmap = pixelmap;
                        console.info('testCreatePixelMapPromise001 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }).catch(error => {
                        console.log('testCreatePixelMapPromise001 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('testCreatePixelMapPromise001 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_PROMISE_002
         * @tc.name      : testCreatePixelMapPromise002
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreatePixelMapPromise002', 0, async function (done) {
            try {
                await getFileFd('test.gif', testGif);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testCreatePixelMapPromise002 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap().then(pixelmap => {
                        globalpixelmap = pixelmap;
                        console.info('testCreatePixelMapPromise002 success ');
                        expect(pixelmap !== undefined).assertTrue();
                        done();
                    }).catch(error => {
                        console.log('testCreatePixelMapPromise002 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('testCreatePixelMapPromise002 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_PROMISE_003
         * @tc.name      : testCreatePixelMapPromise003
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreatePixelMapPromise003', 0, async function (done) {
            try {
                await getFileFd('test.bmp', testBmp);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testCreatePixelMapPromise003 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap().then(pixelmap => {
                        globalpixelmap = pixelmap;
                        console.info('testCreatePixelMapPromise003 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }).catch(error => {
                        console.log('testCreatePixelMapPromise003 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('testCreatePixelMapPromise003 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_PROMISE_004
         * @tc.name      : testCreatePixelMapPromise004
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreatePixelMapPromise004', 0, async function (done) {
            try {
                await getFileFd('test.png', testPng);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testCreatePixelMapPromise004 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap().then(pixelmap => {
                        globalpixelmap = pixelmap;
                        console.info('testCreatePixelMapPromise004 success');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }).catch(error => {
                        console.log('testCreatePixelMapPromise004 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('testCreatePixelMapPromise004 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_CB_001
         * @tc.name      : testCreatePixelMapCb001
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreatePixelMapCb001', 0, async function (done) {
            try {
                await getFileFd('test.jpg', testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testCreatePixelMapCb001 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap((err, pixelmap) => {
                        if (err) {
                            console.info('testCreatePixelMapCb001 err: ' + err);
                            expect(false).assertTrue();
                            done();
                            return
                        }
                        globalpixelmap = pixelmap;
                        console.info('testCreatePixelMapCb001 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('testCreatePixelMapCb001 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_CB_002
         * @tc.name      : testCreatePixelMapCb002
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreatePixelMapCb002', 0, async function (done) {
            try {
                await getFileFd('test.gif', testGif);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testCreatePixelMapCb002 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap((err, pixelmap) => {
                        globalpixelmap = pixelmap;
                        console.info('testCreatePixelMapCb002 success ');
                        expect(pixelmap !== undefined).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('testCreatePixelMapCb002 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_CB_003
         * @tc.name      : testCreatePixelMapCb003
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreatePixelMapCb003', 0, async function (done) {
            try {
                await getFileFd('test.bmp', testBmp);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testCreatePixelMapCb003 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap((err, pixelmap) => {
                        globalpixelmap = pixelmap;
                        console.info('testCreatePixelMapCb003 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('testCreatePixelMapCb003 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_CB_004
         * @tc.name      : testCreatePixelMapCb004
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testCreatePixelMapCb004', 0, async function (done) {
            try {
                await getFileFd('test.png', testPng);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testCreatePixelMapCb004 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap((err, pixelmap) => {
                        globalpixelmap = pixelmap;
                        console.info('testCreatePixelMapCb004 success');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('testCreatePixelMapCb004 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_001
         * @tc.name      : testCreatePixelMapOptionsCb001
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions-+
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb001", 0, async function (done) {
            try {
                await getFileFd("test.jpg", testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info(
                        "testCreatePixelMapOptionsCb001 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: RGBA_8888,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                "testCreatePixelMapOptionsCb001 createPixelMap error  " +
                                JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            console.info(
                                "testCreatePixelMapOptionsCb001 success "
                            );
                            expect(pixelmap != undefined).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("testCreatePixelMapOptionsCb001 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_002
         * @tc.name      : testCreatePixelMapOptionsCb002
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb002", 0, async function (done) {
            try {
                await getFileFd("test.jpg", testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info(
                        "testCreatePixelMapOptionsCb002 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: RGB_565,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                "testCreatePixelMapOptionsCb002 createPixelMap error  " +
                                JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            console.info(
                                "testCreatePixelMapOptionsCb002 success "
                            );
                            expect(pixelmap != undefined).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("testCreatePixelMapOptionsCb002 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_003
         * @tc.name      : testCreatePixelMapOptionsCb003
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb003", 0, async function (done) {
            try {
                await getFileFd("test.jpg", testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info(
                        "testCreatePixelMapOptionsCb003 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: UNKNOWN,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                "testCreatePixelMapOptionsCb003 createPixelMap error  " +
                                JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            console.info(
                                "testCreatePixelMapOptionsCb003 success "
                            );
                            expect(pixelmap != undefined).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("testCreatePixelMapOptionsCb003 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_004
         * @tc.name      : testCreatePixelMapOptionsCb004
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb004", 0, async function (done) {
            try {
                await getFileFd("test.jpg", testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info(
                        "testCreatePixelMapOptionsCb004 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: UNKNOWN,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 1,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info("testCreatePixelMapOptionsCb004 success ");
                            console.info(
                                "testCreatePixelMapOptionsCb004 createPixelMap error " +
                                JSON.stringify(err)
                            );
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info("testCreatePixelMapOptionsCb004 fail  " + pixelmap);
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("testCreatePixelMapOptionsCb004 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_005
         * @tc.name      : testCreatePixelMapOptionsCb005
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb005", 0, async function (done) {
            try {
                await getFileFd("test.jpg", testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info(
                        "testCreatePixelMapOptionsCb005 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: UNKNOWN,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: -1,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info("testCreatePixelMapOptionsCb005 success ");
                            console.info(
                                "testCreatePixelMapOptionsCb005 createPixelMap error " +
                                JSON.stringify(err)
                            );
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info("testCreatePixelMapOptionsCb005 fail  " + pixelmap);
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("testCreatePixelMapOptionsCb005 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_006
         * @tc.name      : testCreatePixelMapOptionsCb006
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb006", 0, async function (done) {
            try {
                await getFileFd("test.jpg", testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info(
                        "testCreatePixelMapOptionsCb006 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: -1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: UNKNOWN,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info("testCreatePixelMapOptionsCb006 success ");
                            console.info(
                                "testCreatePixelMapOptionsCb006 createPixelMap error " +
                                JSON.stringify(err)
                            );
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info(
                                "testCreatePixelMapOptionsCb006 fail  " + pixelmap
                            );
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("testCreatePixelMapOptionsCb006 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_007
         * @tc.name      : testCreatePixelMapOptionsCb007
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb007", 0, async function (done) {
            try {
                await getFileFd("test.jpg", testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info(
                        "testCreatePixelMapOptionsCb007 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: -10,
                        desiredPixelFormat: UNKNOWN,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info("testCreatePixelMapOptionsCb007 success ");
                            console.info(
                                "testCreatePixelMapOptionsCb007 createPixelMap error " +
                                JSON.stringify(err)
                            );
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info(
                                "testCreatePixelMapOptionsCb007 fail  " + pixelmap
                            );
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("testCreatePixelMapOptionsCb007 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_008
         * @tc.name      : testCreatePixelMapOptionsCb008
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb008", 0, async function (done) {
            try {
                await getFileFd("test.jpg", testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info(
                        "testCreatePixelMapOptionsCb008 create image source failed"
                    );
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
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                "testCreatePixelMapOptionsCb008 success "
                            );
                            console.info(
                                "testCreatePixelMapOptionsCb008 createPixelMap error " +
                                JSON.stringify(err)
                            );
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info(
                                "testCreatePixelMapOptionsCb008 fail  " +
                                pixelmap
                            );
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info(
                    "testCreatePixelMapOptionsCb008 error: " + error
                );
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_009
         * @tc.name      : testCreatePixelMapOptionsCb009
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb009", 0, async function (done) {
            try {
                await getFileFd("test.jpg", testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info(
                        "testCreatePixelMapOptionsCb009 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: false,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: RGB_565,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                "testCreatePixelMapOptionsCb009 createPixelMap error " +
                                JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            console.info("testCreatePixelMapOptionsCb009 success ");
                            expect(pixelmap != undefined).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("testCreatePixelMapOptionsCb009 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_010
         * @tc.name      : testCreatePixelMapOptionsCb010
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb010", 0, async function (done) {
            try {
                await getFileFd("test.jpg", testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info(
                        "testCreatePixelMapOptionsCb010 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1000, height: 1000 },
                        rotate: 10,
                        desiredPixelFormat: RGB_565,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                "testCreatePixelMapOptionsCb010 createPixelMap error " +
                                JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            console.info("testCreatePixelMapOptionsCb010 success ");
                            expect(pixelmap != undefined).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("testCreatePixelMapOptionsCb010 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_011
         * @tc.name      : testCreatePixelMapOptionsCb011
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb011", 0, async function (done) {
            try {
                await getFileFd("test.jpg", testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info(
                        "testCreatePixelMapOptionsCb011 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: RGB_565,
                        desiredRegion: { size: { height: 1000, width: 1000 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                "testCreatePixelMapOptionsCb011 createPixelMap err " +
                                JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            pixelmap
                                .getImageInfo()
                                .then((imageInfo) => {
                                    expect(imageInfo.size.height == 2).assertTrue();
                                    expect(imageInfo.size.width == 1).assertTrue();
                                    console.info(
                                        "testCreatePixelMapOptionsCb011 success "
                                    );
                                    console.info("imageInfo height :" + imageInfo.size.height);
                                    console.info("imageInfo width : " + imageInfo.size.width);
                                    done();
                                })
                                .catch((err) => {
                                    console.info(
                                        "testCreatePixelMapOptionsCb011 getimageInfo err " +
                                        JSON.stringify(err)
                                    );
                                });
                        }
                    });
                }
            } catch (error) {
                console.info("testCreatePixelMapOptionsCb011 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_012
         * @tc.name      : testCreatePixelMapOptionsCb012
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb012", 0, async function (done) {
            try {
                await getFileFd("test.jpg", testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info("testCreatePixelMapOptionsCb012 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: RGB_565,
                        desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info("testCreatePixelMapOptionsCb012 success ");
                            console.info(
                                "testCreatePixelMapOptionsCb012 createPixelMap error " +
                                JSON.stringify(err)
                            );
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info("testCreatePixelMapOptionsCb012 fail  " + pixelmap);
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("testCreatePixelMapOptionsCb012 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_013
         * @tc.name      : testCreatePixelMapOptionsCb013
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb013", 0, async function (done) {
            try {
                await getFileFd("test.jpg", testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info("testCreatePixelMapOptionsCb013 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: RGB_565,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 10000, y: 10000 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info("testCreatePixelMapOptionsCb013 success ");
                            console.info(
                                "testCreatePixelMapOptionsCb013 createPixelMap error " +
                                JSON.stringify(err)
                            );
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info("testCreatePixelMapOptionsCb013 fail  " + pixelmap);
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("testCreatePixelMapOptionsCb013 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_014
         * @tc.name      : testCreatePixelMapOptionsCb014
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb014", 0, async function (done) {
            try {
                await getFileFd("test.jpg", testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info(
                        "testCreatePixelMapOptionsCb014 create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 500,
                        desiredPixelFormat: RGB_565,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 1, y: 2 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info("testCreatePixelMapOptionsCb014 success ");
                            console.info(
                                "testCreatePixelMapOptionsCb014 createPixelMap error " +
                                JSON.stringify(err)
                            );
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info(
                                "testCreatePixelMapOptionsCb014 fail  " + pixelmap
                            );
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("testCreatePixelMapOptionsCb014 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_015
         * @tc.name      : testCreatePixelMapOptionsCb015
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb015", 0, async function (done) {
            await getFileFd("test.gif", testGif);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(
                    "testCreatePixelMapOptionsCb015 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: RGBA_8888,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb015 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("testCreatePixelMapOptionsCb015 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_016
         * @tc.name      : testCreatePixelMapOptionsCb016
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb016", 0, async function (done) {
            await getFileFd("test.gif", testGif);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(
                    "testCreatePixelMapOptionsCb016 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb016 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("testCreatePixelMapOptionsCb016 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_017
         * @tc.name      : testCreatePixelMapOptionsCb017
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb017", 0, async function (done) {
            await getFileFd("test.gif", testGif);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(
                    "testCreatePixelMapOptionsCb017 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: UNKNOWN,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb017 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("testCreatePixelMapOptionsCb017 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_018
         * @tc.name      : testCreatePixelMapOptionsCb018
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb018", 0, async function (done) {
            await getFileFd("test.gif", testGif);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb018 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: UNKNOWN,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 1,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb018 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("testCreatePixelMapOptionsCb018 success ");
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_019
         * @tc.name      : testCreatePixelMapOptionsCb019
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb019", 0, async function (done) {
            await getFileFd("test.gif", testGif);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb019 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: UNKNOWN,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: -1,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb019 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb019 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("testCreatePixelMapOptionsCb019 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_020
         * @tc.name      : testCreatePixelMapOptionsCb020
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb020", 0, async function (done) {
            await getFileFd("test.gif", testGif);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(
                    "testCreatePixelMapOptionsCb020 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: -1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: UNKNOWN,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb020 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb020 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info(
                            "testCreatePixelMapOptionsCb020 fail  " + pixelmap
                        );
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_021
         * @tc.name      : testCreatePixelMapOptionsCb021
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb021", 0, async function (done) {
            await getFileFd("test.gif", testGif);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb021 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: -10,
                    desiredPixelFormat: UNKNOWN,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb021 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb021 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("testCreatePixelMapOptionsCb021 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_022
         * @tc.name      : testCreatePixelMapOptionsCb022
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb022", 0, async function (done) {
            await getFileFd("test.gif", testGif);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(
                    "testCreatePixelMapOptionsCb022 create image source failed"
                );
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
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb022 success "
                        );
                        console.info(
                            "testCreatePixelMapOptionsCb022 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info(
                            "testCreatePixelMapOptionsCb022 fail  " +
                            pixelmap
                        );
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_023
         * @tc.name      : testCreatePixelMapOptionsCb023
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb023", 0, async function (done) {
            await getFileFd("test.gif", testGif);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(
                    "testCreatePixelMapOptionsCb023 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: false,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb023 createPixelMap error  " +
                            JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("testCreatePixelMapOptionsCb023 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_024
         * @tc.name      : testCreatePixelMapOptionsCb024
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb024", 0, async function (done) {
            await getFileFd("test.gif", testGif);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb024 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1000, height: 1000 },
                    rotate: 10,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb024 createPixelMap error  " +
                            JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("testCreatePixelMapOptionsCb024 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_025
         * @tc.name      : testCreatePixelMapOptionsCb025
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb025", 0, async function (done) {
            await getFileFd("test.gif", testGif);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(" testCreatePixelMapOptionsCb025 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 10000, width: 10000 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb025 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        pixelmap
                            .getImageInfo()
                            .then((imageInfo) => {
                                expect(imageInfo.size.height == 2).assertTrue();
                                expect(imageInfo.size.width == 1).assertTrue();
                                console.info("testCreatePixelMapOptionsCb025 success ");
                                console.info("imageInfo height :" + imageInfo.size.height);
                                console.info("imageInfo width : " + imageInfo.size.width);
                                done();
                            })
                            .catch((err) => {
                                console.info(
                                    "testCreatePixelMapOptionsCb025 getimageInfo err " +
                                    JSON.stringify(err)
                                );
                            });
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_026
         * @tc.name      : testCreatePixelMapOptionsCb026
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb026", 0, async function (done) {
            await getFileFd("test.gif", testGif);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb026 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb026 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb026createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("testCreatePixelMapOptionsCb026 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_027
         * @tc.name      : testCreatePixelMapOptionsCb027
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb027", 0, async function (done) {
            await getFileFd("test.gif", testGif);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb027 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 10000, y: 10000 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb027 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb027 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("testCreatePixelMapOptionsCb027 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_028
         * @tc.name      : testCreatePixelMapOptionsCb028
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb028", 0, async function (done) {
            await getFileFd("test.gif", testGif);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb028 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 500,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 1, y: 2 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb028 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb028 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("testCreatePixelMapOptionsCb028 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_029
         * @tc.name      : testCreatePixelMapOptionsCb029
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb029", 0, async function (done) {
            await getFileFd("test.bmp", testBmp);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(
                    "testCreatePixelMapOptionsCb029 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: RGBA_8888,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb029 createPixelMap error  " +
                            JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("testCreatePixelMapOptionsCb029 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_030
         * @tc.name      : testCreatePixelMapOptionsCb030
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb030", 0, async function (done) {
            await getFileFd("test.bmp", testBmp);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(
                    "testCreatePixelMapOptionsCb030 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb030 createPixelMap error  " +
                            JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("testCreatePixelMapOptionsCb030 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_031
         * @tc.name      : testCreatePixelMapOptionsCb031
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb031", 0, async function (done) {
            await getFileFd("test.bmp", testBmp);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(
                    "testCreatePixelMapOptionsCb031 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: UNKNOWN,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb031 createPixelMap error  " +
                            JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("testCreatePixelMapOptionsCb031 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_032
         * @tc.name      : testCreatePixelMapOptionsCb032
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb032", 0, async function (done) {
            await getFileFd("test.bmp", testBmp);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb032 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: UNKNOWN,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 1,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb032 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb032 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("testCreatePixelMapOptionsCb032 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_033
         * @tc.name      : testCreatePixelMapOptionsCb033
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb033", 0, async function (done) {
            await getFileFd("test.bmp", testBmp);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb033 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: UNKNOWN,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: -1,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb033 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb033 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("testCreatePixelMapOptionsCb033 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_034
         * @tc.name      : testCreatePixelMapOptionsCb034
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb034", 0, async function (done) {
            await getFileFd("test.bmp", testBmp);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(
                    "testCreatePixelMapOptionsCb034 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: -1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: UNKNOWN,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb034 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb034 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info(
                            "testCreatePixelMapOptionsCb034 fail  " + pixelmap
                        );
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_035
         * @tc.name      : testCreatePixelMapOptionsCb035
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb035", 0, async function (done) {
            await getFileFd("test.bmp", testBmp);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb035 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: -10,
                    desiredPixelFormat: UNKNOWN,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb035 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb035 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("testCreatePixelMapOptionsCb035 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_036
         * @tc.name      : testCreatePixelMapOptionsCb036
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb036", 0, async function (done) {
            await getFileFd("test.bmp", testBmp);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(
                    "testCreatePixelMapOptionsCb036 create image source failed"
                );
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
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb036 success "
                        );
                        console.info(
                            "testCreatePixelMapOptionsCb036 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info(
                            "testCreatePixelMapOptionsCb036 fail  " +
                            pixelmap
                        );
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_037
         * @tc.name      : testCreatePixelMapOptionsCb037
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb037", 0, async function (done) {
            await getFileFd("test.bmp", testBmp);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(
                    "testCreatePixelMapOptionsCb037 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: false,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb037 createPixelMap error  " +
                            JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("testCreatePixelMapOptionsCb037 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_038
         * @tc.name      : testCreatePixelMapOptionsCb038
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb038", 0, async function (done) {
            await getFileFd("test.bmp", testBmp);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb038 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1500, height: 1500 },
                    rotate: 10,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb038 createPixelMap error  " +
                            JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("testCreatePixelMapOptionsCb038 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_039
         * @tc.name      : testCreatePixelMapOptionsCb039
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb039", 0, async function (done) {
            await getFileFd("test.bmp", testBmp);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(" testCreatePixelMapOptionsCb039 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 10000, width: 10000 }, x: 0, y: 0 },
                    index: 0,
                };

                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb039 createPixelMap error  " +
                            JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        pixelmap
                            .getImageInfo()
                            .then((imageInfo) => {
                                expect(imageInfo.size.height == 2).assertTrue();
                                expect(imageInfo.size.width == 1).assertTrue();
                                console.info("testCreatePixelMapOptionsCb039 success ");
                                console.info("imageInfo height :" + imageInfo.size.height);
                                console.info("imageInfo width : " + imageInfo.size.width);
                                done();
                            })
                            .catch((err) => {
                                console.info(
                                    "testCreatePixelMapOptionsCb039 getimageInfo err " +
                                    JSON.stringify(err)
                                );
                            });
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_040
         * @tc.name      : testCreatePixelMapOptionsCb040
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb040", 0, async function (done) {
            await getFileFd("test.bmp", testBmp);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb040 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb040 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb040 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("testCreatePixelMapOptionsCb040 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_041
         * @tc.name      : testCreatePixelMapOptionsCb041
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb041", 0, async function (done) {
            await getFileFd("test.bmp", testBmp);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb041 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 10000, y: 10000 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb041 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb041 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("testCreatePixelMapOptionsCb041 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_042
         * @tc.name      : testCreatePixelMapOptionsCb042
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb042", 0, async function (done) {
            await getFileFd("test.bmp", testBmp);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb042 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 500,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 1, y: 2 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb042 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb042 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("testCreatePixelMapOptionsCb042 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_043
         * @tc.name      : testCreatePixelMapOptionsCb043
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb043", 0, async function (done) {
            await getFileFd("test.png", testPng);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(
                    "testCreatePixelMapOptionsCb043 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: RGBA_8888,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb043 createPixelMap error  " +
                            JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("testCreatePixelMapOptionsCb043 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_044
         * @tc.name      : testCreatePixelMapOptionsCb044
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb044", 0, async function (done) {
            await getFileFd("test.png", testPng);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(
                    "testCreatePixelMapOptionsCb044 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb044 createPixelMap error  " +
                            JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("testCreatePixelMapOptionsCb044 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_045
         * @tc.name      : testCreatePixelMapOptionsCb045
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb045", 0, async function (done) {
            await getFileFd("test.png", testPng);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(
                    "testCreatePixelMapOptionsCb045 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: UNKNOWN,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb045 createPixelMap error  " +
                            JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("testCreatePixelMapOptionsCb045 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_046
         * @tc.name      : testCreatePixelMapOptionsCb046
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb046", 0, async function (done) {
            await getFileFd("test.png", testPng);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb046 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: UNKNOWN,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 1,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb046 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb046 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("testCreatePixelMapOptionsCb046 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_047
         * @tc.name      : testCreatePixelMapOptionsCb047
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb047", 0, async function (done) {
            await getFileFd("test.png", testPng);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb047 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: UNKNOWN,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: -1,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb047 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb047 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("testCreatePixelMapOptionsCb047 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_048
         * @tc.name      : testCreatePixelMapOptionsCb048
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb048", 0, async function (done) {
            await getFileFd("test.png", testPng);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(
                    "testCreatePixelMapOptionsCb048 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: -1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: UNKNOWN,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb048 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb048 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info(
                            "testCreatePixelMapOptionsCb048 fail  " + pixelmap
                        );
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_049
         * @tc.name      : testCreatePixelMapOptionsCb049
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb049", 0, async function (done) {
            await getFileFd("test.png", testPng);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb049 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: -10,
                    desiredPixelFormat: UNKNOWN,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb049 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb049 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("testCreatePixelMapOptionsCb049 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_050
         * @tc.name      : testCreatePixelMapOptionsCb050
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb050", 0, async function (done) {
            await getFileFd("test.png", testPng);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(
                    "testCreatePixelMapOptionsCb050 create image source failed"
                );
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
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb050 success "
                        );
                        console.info(
                            "testCreatePixelMapOptionsCb050 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info(
                            "testCreatePixelMapOptionsCb050 fail  " +
                            pixelmap
                        );
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_051
         * @tc.name      : testCreatePixelMapOptionsCb051
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb051", 0, async function (done) {
            await getFileFd("test.png", testPng);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(
                    "testCreatePixelMapOptionsCb051 create image source failed"
                );
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: false,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb051 createPixelMap error  " +
                            JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("testCreatePixelMapOptionsCb051 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_052
         * @tc.name      : testCreatePixelMapOptionsCb052
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb052", 0, async function (done) {
            await getFileFd("test.png", testPng);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb052 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1500, height: 1500 },
                    rotate: 10,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb052 createPixelMap error  " +
                            JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info("testCreatePixelMapOptionsCb052 success ");
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_053
         * @tc.name      : testCreatePixelMapOptionsCb053
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb053", 0, async function (done) {
            await getFileFd("test.png", testPng);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info(" testCreatePixelMapOptionsCb053 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 10000, width: 10000 }, x: 0, y: 0 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(
                            "testCreatePixelMapOptionsCb053 createPixelMap error  " +
                            JSON.stringify(err)
                        );
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        pixelmap
                            .getImageInfo()
                            .then((imageInfo) => {
                                expect(imageInfo.size.height == 2).assertTrue();
                                expect(imageInfo.size.width == 1).assertTrue();
                                console.info("testCreatePixelMapOptionsCb053 success ");
                                console.info("imageInfo height :" + imageInfo.size.height);
                                console.info("imageInfo width : " + imageInfo.size.width);
                                done();
                            })
                            .catch((err) => {
                                console.info(
                                    "testCreatePixelMapOptionsCb053 getimageInfo err " +
                                    JSON.stringify(err)
                                );
                            });
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_054
         * @tc.name      : testCreatePixelMapOptionsCb054
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb054", 0, async function (done) {
            await getFileFd("test.png", testPng);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb054 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb054 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb054 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("testCreatePixelMapOptionsCb054 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_055
         * @tc.name      : testCreatePixelMapOptionsCb055
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb055", 0, async function (done) {
            await getFileFd("test.png", testPng);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb055 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 10000, y: 10000 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb055 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb055 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("testCreatePixelMapOptionsCb055 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAP_OPTIONS_CB_056
         * @tc.name      : testCreatePixelMapOptionsCb056
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapOptionsCb056", 0, async function (done) {
            await getFileFd("test.png", testPng);
            const imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info("testCreatePixelMapOptionsCb056 create image source failed");
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 500,
                    desiredPixelFormat: RGB_565,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 1, y: 2 },
                    index: 0,
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info("testCreatePixelMapOptionsCb056 success ");
                        console.info(
                            "testCreatePixelMapOptionsCb056 createPixelMap error " +
                            JSON.stringify(err)
                        );
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("testCreatePixelMapOptionsCb056 fail  " + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAPLIST_PROMISE_001
         * @tc.name      : testCreatePixelMapListPromise001
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.createPixelMapList
         *                 4.packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapListPromise001", 0, async function (done) {
            let decodeOpts = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 198, height: 202 },
                rotate: 0,
                desiredPixelFormat: RGBA_8888,
                index: 0,
            };
            createPixelMapListPromise(done, "testCreatePixelMapListPromise001", decodeOpts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAPLIST_PROMISE_002
         * @tc.name      : testCreatePixelMapListPromise002
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.createPixelMapList
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapListPromise002", 0, async function (done) {
            let decodeOpts = {
                sampleSize: -1,
                editable: true,
                desiredSize: { width: 198, height: 202 },
                rotate: 0,
                desiredPixelFormat: RGBA_8888,
                index: 0,
            };
            createPixelMapListErrPromise(done, "testCreatePixelMapListPromise002", decodeOpts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAPLIST_PROMISE_003
         * @tc.name      : testCreatePixelMapListPromise003
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.createPixelMapList
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapListPromise003", 0, async function (done) {
            let decodeOpts = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 198, height: 202 },
                rotate: 0,
                desiredPixelFormat: RGBA_8888,
                index: -8,
            };
            createPixelMapListErrPromise(done, "testCreatePixelMapListPromise003", decodeOpts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAPLIST_PROMISE_004
         * @tc.name      : testCreatePixelMapListPromise004
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.createPixelMapList
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapListPromise004", 0, async function (done) {
            let decodeOpts = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 198, height: 202 },
                rotate: 500,
                desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
                index: 0,
            };
            createPixelMapListErrPromise(done, "testCreatePixelMapListPromise004", decodeOpts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAPLIST_PROMISE_005
         * @tc.name      : testCreatePixelMapListPromise005
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.createPixelMapList
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapListPromise005", 0, async function (done) {
            let decodeOpts = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 198, height: 202 },
                rotate: 0,
                desiredPixelFormat: 33,
                index: 0,
            };
            createPixelMapListErrPromise(done, "testCreatePixelMapListPromise005", decodeOpts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAPLIST_CB_001
         * @tc.name      : testCreatePixelMapListCb001
         * @tc.desc      : 1.create imagesource
         *                 2.createPixelMapList
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapListCb001", 0, async function (done) {
            try {
                await getFileFd("test.gif", testGif);
                const imageSourceApi = image.createImageSource(fileFd);
                imageSourceApi.createPixelMap((err, pixelMapList) => {
                    expect(pixelMapList != undefined).assertTrue();
                    console.info('testCreatePixelMapListCb001 success');
                    done();
                })
            } catch (err) {
                console.info('testCreatePixelMapListCb001 fail' + err);
                done();
            }
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAPLIST_OPTIONS_CB_001
         * @tc.name      : testCreatePixelMapListOptionsCb001
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.createPixelMapList
         *                 4.packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapListOptionsCb001", 0, async function (done) {
            let decodeOpts = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 198, height: 202 },
                rotate: 0,
                desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
                index: 0,
            };
            createPixelMapListCallBack(done, "testCreatePixelMapListOptionsCb001", decodeOpts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAPLIST_OPTIONS_CB_002
         * @tc.name      : testCreatePixelMapListOptionsCb002
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.createPixelMapList
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapListOptionsCb002", 0, async function (done) {
            let decodeOpts = {
                sampleSize: -1,
                editable: true,
                desiredSize: { width: 198, height: 202 },
                rotate: 0,
                desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
                index: 0,
            };
            createPixelMapListErrCallBack(done, "testCreatePixelMapListOptionsCb002", decodeOpts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAPLIST_OPTIONS_CB_003
         * @tc.name      : testCreatePixelMapListOptionsCb003
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.createPixelMapList
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapListOptionsCb003", 0, async function (done) {
            let decodeOpts = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 198, height: 202 },
                rotate: 0,
                desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
                index: -8,
            };
            createPixelMapListErrCallBack(done, "testCreatePixelMapListOptionsCb003", decodeOpts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAPLIST_OPTIONS_CB_004
         * @tc.name      : testCreatePixelMapListOptionsCb004
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.createPixelMapList
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapListOptionsCb004", 0, async function (done) {
            let decodeOpts = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 198, height: 202 },
                rotate: 500,
                desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
                index: 0,
            };
            createPixelMapListErrCallBack(done, "testCreatePixelMapListOptionsCb004", decodeOpts);
        });

        /**
         * @tc.number    : TEST_CREATEPIXELMAPLIST_OPTIONS_CB_005
         * @tc.name      : testCreatePixelMapListOptionsCb005
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.createPixelMapList
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testCreatePixelMapListOptionsCb005", 0, async function (done) {
            let decodeOpts = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 198, height: 202 },
                rotate: 0,
                desiredPixelFormat: 33,
                index: 0,
            };
            createPixelMapListErrCallBack(done, "testCreatePixelMapListOptionsCb005", decodeOpts);
        });

        /**
         * @tc.number    : TEST_GETDELAYTIME_PROMISE_001
         * @tc.name      : testGetDelayTimePromise001
         * @tc.desc      : 1.create imagesource
         *                 2.getDelayTime
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetDelayTimePromise001", 0, async function (done) {
            getDelayTimePromise(done, "testGetDelayTimePromise001", "test.gif");
        });

        /**
         * @tc.number    : TEST_GETDELAYTIME_CB_001
         * @tc.name      : testGetDelayTimeCb001
         * @tc.desc      : 1.create imagesource
         *                 2.getDelayTime
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetDelayTimeCb001", 0, async function (done) {
            getDelayTimeCallBack(done, "testGetDelayTimeCb001", "test.gif");
        });

        /**
         * @tc.number    : TEST_GETFRAMECOUNT_PROMISE_001
         * @tc.name      : testGetFrameCountPromise001
         * @tc.desc      : 1.create imagesource
         *                 2.getFrameCount
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetFrameCountPromise001", 0, async function (done) {
            getFrameCountPromise(done, "testGetFrameCountPromise001", "test.gif");
        });

        /**
         * @tc.number    : TEST_GETFRAMECOUNT_CB_001
         * @tc.name      : testGetFrameCountCb001
         * @tc.desc      : 1.create imagesource
         *                 2.getFrameCount
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetFrameCountCb001", 0, async function (done) {
            getFrameCountCallBack(done, "testGetFrameCountCb001", "test.gif");
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_001
         * @tc.name      : testGetImagePropertyPromise001
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(DateTimeOriginal)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyPromise001", 0, async function (done) {
            let key = DATE_TIME_ORIGINAL;
            getPromise(done, "testGetImagePropertyPromise001", "picture", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_002
         * @tc.name      : testGetImagePropertyPromise002
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ExposureTime)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyPromise002", 0, async function (done) {
            let key = EXPOSURE_TIME;
            getPromise(done, "testGetImagePropertyPromise002", "picture", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_003
         * @tc.name      : testGetImagePropertyPromise003
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FNumber)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyPromise003", 0, async function (done) {
            let key = F_NUMBER;
            getPromise(done, "testGetImagePropertyPromise003", "picture", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_004
         * @tc.name      : testGetImagePropertyPromise004
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ISOSpeedRatings)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyPromise004", 0, async function (done) {
            let key = ISO_SPEED_RATINGS;
            getPromise(done, "testGetImagePropertyPromise004", "picture", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_005
         * @tc.name      : testGetImagePropertyPromise005
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SceneType)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyPromise005", 0, async function (done) {
            let key = SCENE_TYPE;
            getPromise(done, "testGetImagePropertyPromise005", "picture", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_006
         * @tc.name      : testGetImagePropertyPromise006
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(DateTimeOriginal)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyPromise006", 0, async function (done) {
            let key = DATE_TIME_ORIGINAL;
            getPromise(done, "testGetImagePropertyPromise006", "buf", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_007
         * @tc.name      : testGetImagePropertyPromise007
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ExposureTime)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyPromise007", 0, async function (done) {
            let key = EXPOSURE_TIME;
            getPromise(done, "testGetImagePropertyPromise007", "buf", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_008
         * @tc.name      : testGetImagePropertyPromise008
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FNumber)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyPromise008", 0, async function (done) {
            let key = F_NUMBER;
            getPromise(done, "testGetImagePropertyPromise008", "buf", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_009
         * @tc.name      : testGetImagePropertyPromise009
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ISOSpeedRatings)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyPromise009", 0, async function (done) {
            let key = ISO_SPEED_RATINGS;
            getPromise(done, "testGetImagePropertyPromise009", "buf", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_010
         * @tc.name      : testGetImagePropertyPromise010
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SceneType)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyPromise010", 0, async function (done) {
            let key = SCENE_TYPE;
            getPromise(done, "testGetImagePropertyPromise010", "buf", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_011
         * @tc.name      : testGetImagePropertyPromise011
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyPromise011", 0, async function (done) {
            let key = "Date";
            getPromiseErr(done, "testGetImagePropertyPromise011", "picture", key, false);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_012
         * @tc.name      : testGetImagePropertyPromise012
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyPromise012", 0, async function (done) {
            let key = null;
            getPromiseErr(done, "testGetImagePropertyPromise012", "picture", key, true);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_013
         * @tc.name      : testGetImagePropertyPromise013
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyPromise013", 0, async function (done) {
            let key = 12;
            getPromiseErr(done, "testGetImagePropertyPromise013", "picture", key, true);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_014
         * @tc.name      : testGetImagePropertyPromise014
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyPromise014", 0, async function (done) {
            let key = { w: 12 };
            getPromiseErr(done, "testGetImagePropertyPromise014", "picture", key, true);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_015
         * @tc.name      : testGetImagePropertyPromise015
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyPromise015", 0, async function (done) {
            let key = "Date";
            getPromiseErr(done, "testGetImagePropertyPromise015", "buf", key, false);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_016
         * @tc.name      : testGetImagePropertyPromise016
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyPromise016", 0, async function (done) {
            let key = null;
            getPromiseErr(done, "testGetImagePropertyPromise016", "buf", key, true);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_017
         * @tc.name      : testGetImagePropertyPromise017
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyPromise017", 0, async function (done) {
            let key = 12;
            getPromiseErr(done, "testGetImagePropertyPromise017", "buf", key, true);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_018
         * @tc.name      : testGetImagePropertyPromise018
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyPromise018", 0, async function (done) {
            let key = { w: 12 };
            getPromiseErr(done, "testGetImagePropertyPromise018", "buf", key, true);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_019
         * @tc.name      : testGetImagePropertyPromise019
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(BitsPerSample)
         *                 4.The return value is not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImagePropertyPromise019', 0, async function (done) {
            await getFileFd("test.jpg", getPropertyBuf);
            let imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info('testGetImagePropertyPromise019 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageProperty(BITS_PER_SAMPLE)
                    .then(data => {
                        console.info('testGetImagePropertyPromise019 BitsPerSample ' + data);
                        expect(data != undefined && data != '').assertTrue();
                        done();
                    })
                    .catch(error => {
                        console.log('testGetImagePropertyPromise019 error: ' + error);
                        expect(false).assertFail();
                        done();
                    })
            }
        })

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_020
         * @tc.name      : testGetImagePropertyPromise020
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ImageLength)
         *                 4.The return value is not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImagePropertyPromise020', 0, async function (done) {
            await getFileFd("test.jpg", getPropertyBuf);
            let imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info('testGetImagePropertyPromise020 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageProperty(IMAGE_LENGTH)
                    .then(data => {
                        console.info('testGetImagePropertyPromise020 ImageLength ' + data);
                        expect(data != undefined && data != '').assertTrue();
                        done();
                    })
                    .catch(error => {
                        console.log('testGetImagePropertyPromise020 error: ' + error);
                        expect(false).assertFail();
                        done();
                    })
            }
        })

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_PROMISE_021
         * @tc.name      : testGetImagePropertyPromise021
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ImageWidth)
         *                 4.The return value is not empty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testGetImagePropertyPromise021', 0, async function (done) {
            await getFileFd("test.jpg", getPropertyBuf);
            let imageSourceApi = image.createImageSource(fileFd);
            if (imageSourceApi == undefined) {
                console.info('testGetImagePropertyPromise021 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageProperty(IMAGE_WIDTH)
                    .then(data => {
                        console.info('testGetImagePropertyPromise021 ImageWidth ' + data);
                        expect(data != undefined && data != '').assertTrue();
                        done();
                    })
                    .catch(error => {
                        console.log('testGetImagePropertyPromise021 error: ' + error);
                        expect(false).assertFail();
                        done();
                    })
            }
        })

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_CB_001
         * @tc.name      : testGetImagePropertyCb001
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(DateTimeOriginal)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyCb001", 0, async function (done) {
            let key = DATE_TIME_ORIGINAL;
            getCb(done, "testGetImagePropertyCb001", "picture", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_CB_002
         * @tc.name      : testGetImagePropertyCb002
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(ExposureTime)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyCb002", 0, async function (done) {
            let key = EXPOSURE_TIME;
            getCb(done, "testGetImagePropertyCb002", "picture", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_CB_003
         * @tc.name      : testGetImagePropertyCb003
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(FNumber)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyCb003", 0, async function (done) {
            let key = F_NUMBER;
            getCb(done, "testGetImagePropertyCb003", "picture", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_CB_004
         * @tc.name      : testGetImagePropertyCb004
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(ISOSpeedRatings)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyCb004", 0, async function (done) {
            let key = ISO_SPEED_RATINGS;
            getCb(done, "testGetImagePropertyCb004", "picture", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_CB_005
         * @tc.name      : testGetImagePropertyCb005
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(SceneType)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyCb005", 0, async function (done) {
            let key = SCENE_TYPE;
            getCb(done, "testGetImagePropertyCb005", "picture", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_CB_006
         * @tc.name      : testGetImagePropertyCb006
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(DateTimeOriginal)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyCb006", 0, async function (done) {
            let key = DATE_TIME_ORIGINAL;
            getCb(done, "testGetImagePropertyCb006", "buf", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_CB_007
         * @tc.name      : testGetImagePropertyCb007
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(ExposureTime)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyCb007", 0, async function (done) {
            let key = EXPOSURE_TIME;
            getCb(done, "testGetImagePropertyCb007", "buf", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_CB_008
         * @tc.name      : testGetImagePropertyCb008
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(FNumber)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyCb008", 0, async function (done) {
            let key = F_NUMBER;
            getCb(done, "testGetImagePropertyCb008", "buf", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_CB_009
         * @tc.name      : testGetImagePropertyCb009
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(ISOSpeedRatings)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyCb009", 0, async function (done) {
            let key = ISO_SPEED_RATINGS;
            getCb(done, "testGetImagePropertyCb009", "buf", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_CB_010
         * @tc.name      : testGetImagePropertyCb010
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(SceneType)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyCb010", 0, async function (done) {
            let key = SCENE_TYPE;
            getCb(done, "testGetImagePropertyCb010", "buf", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_CB_011
         * @tc.name      : testGetImagePropertyCb011
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyCb011", 0, async function (done) {
            let key = "Date";
            await getCbErr(done, "testGetImagePropertyCb011", "picture", key, false);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_CB_012
         * @tc.name      : testGetImagePropertyCb012
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyCb012", 0, async function (done) {
            let key = null;
            await getCbErr(done, "testGetImagePropertyCb012", "picture", key, true);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_CB_013
         * @tc.name      : testGetImagePropertyCb013
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyCb013", 0, async function (done) {
            let key = 12;
            await getCbErr(done, "testGetImagePropertyCb013", "picture", key, true);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_CB_014
         * @tc.name      : testGetImagePropertyCb014
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyCb014", 0, async function (done) {
            let key = { w: 12 };
            await getCbErr(done, "testGetImagePropertyCb014", "picture", key, true);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_CB_015
         * @tc.name      : testGetImagePropertyCb015
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyCb015", 0, async function (done) {
            let key = "Date";
            await getCbErr(done, "testGetImagePropertyCb015", "buf", key, false);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_CB_016
         * @tc.name      : testGetImagePropertyCb016
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyCb016", 0, async function (done) {
            let key = null;
            await getCbErr(done, "testGetImagePropertyCb016", "buf", key, true);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_CB_017
         * @tc.name      : testGetImagePropertyCb017
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyCb017", 0, async function (done) {
            let key = 12;
            await getCbErr(done, "testGetImagePropertyCb017", "buf", key, true);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_CB_018
         * @tc.name      : testGetImagePropertyCb018
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyCb018", 0, async function (done) {
            let key = { w: 12 };
            await getCbErr(done, "testGetImagePropertyCb018", "buf", key, true);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_OPTIONS_CB_001
         * @tc.name      : testGetImagePropertyOptionsCb001
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(DateTimeOriginal,property)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyOptionsCb001", 0, async function (done) {
            let key = DATE_TIME_ORIGINAL;
            getCb2(done, "testGetImagePropertyOptionsCb001", "picture", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_OPTIONS_CB_002
         * @tc.name      : testGetImagePropertyOptionsCb002
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ExposureTime,property)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyOptionsCb002", 0, async function (done) {
            let key = EXPOSURE_TIME;
            getCb2(done, "testGetImagePropertyOptionsCb002", "picture", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_OPTIONS_CB_003
         * @tc.name      : testGetImagePropertyOptionsCb003
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FNumber,property)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyOptionsCb003", 0, async function (done) {
            let key = F_NUMBER;
            getCb2(done, "testGetImagePropertyOptionsCb003", "picture", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_OPTIONS_CB_004
         * @tc.name      : testGetImagePropertyOptionsCb004
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ISOSpeedRatings,property)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyOptionsCb004", 0, async function (done) {
            let key = ISO_SPEED_RATINGS;
            getCb2(done, "testGetImagePropertyOptionsCb004", "picture", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_OPTIONS_CB_005
         * @tc.name      : testGetImagePropertyOptionsCb005
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SceneType,property)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyOptionsCb005", 0, async function (done) {
            let key = SCENE_TYPE;
            getCb2(done, "testGetImagePropertyOptionsCb005", "picture", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_OPTIONS_CB_006
         * @tc.name      : testGetImagePropertyOptionsCb006
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(DateTimeOriginal,property)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyOptionsCb006", 0, async function (done) {
            let key = DATE_TIME_ORIGINAL;
            getCb2(done, "testGetImagePropertyOptionsCb006", "buf", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_OPTIONS_CB_007
         * @tc.name      : testGetImagePropertyOptionsCb007
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ExposureTime,property)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyOptionsCb007", 0, async function (done) {
            let key = EXPOSURE_TIME;
            getCb2(done, "testGetImagePropertyOptionsCb007", "buf", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_OPTIONS_CB_008
         * @tc.name      : testGetImagePropertyOptionsCb008
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FNumber,property)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyOptionsCb008", 0, async function (done) {
            let key = F_NUMBER;
            getCb2(done, "testGetImagePropertyOptionsCb008", "buf", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_OPTIONS_CB_009
         * @tc.name      : testGetImagePropertyOptionsCb009
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ISOSpeedRatings,property)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyOptionsCb009", 0, async function (done) {
            let key = ISO_SPEED_RATINGS;
            getCb2(done, "testGetImagePropertyOptionsCb009", "buf", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_OPTIONS_CB_010
         * @tc.name      : testGetImagePropertyOptionsCb010
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SceneType,property)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyOptionsCb010", 0, async function (done) {
            let key = SCENE_TYPE;
            getCb2(done, "testGetImagePropertyOptionsCb010", "buf", key);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_OPTIONS_CB_011
         * @tc.name      : testGetImagePropertyOptionsCb011
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyOptionsCb011", 0, async function (done) {
            let key = "Date";
            getCb2Err(done, "testGetImagePropertyOptionsCb011", "picture", key, false);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_OPTIONS_CB_012
         * @tc.name      : testGetImagePropertyOptionsCb012
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyOptionsCb012", 0, async function (done) {
            let key = null;
            getCb2Err(done, "testGetImagePropertyOptionsCb012", "picture", key, true);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_OPTIONS_CB_013
         * @tc.name      : testGetImagePropertyOptionsCb013
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyOptionsCb013", 0, async function (done) {
            let key = 12;
            getCb2Err(done, "testGetImagePropertyOptionsCb013", "picture", key, true);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_OPTIONS_CB_014
         * @tc.name      : testGetImagePropertyOptionsCb014
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyOptionsCb014", 0, async function (done) {
            let key = { a: 12 };
            getCb2Err(done, "testGetImagePropertyOptionsCb014", "picture", key, true);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_OPTIONS_CB_015
         * @tc.name      : testGetImagePropertyOptionsCb015
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyOptionsCb015", 0, async function (done) {
            let key = "Date";
            getCb2Err(done, "testGetImagePropertyOptionsCb015", "buf", key, false);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_OPTIONS_CB_016
         * @tc.name      : testGetImagePropertyOptionsCb016
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyOptionsCb016", 0, async function (done) {
            let key = null;
            getCb2Err(done, "testGetImagePropertyOptionsCb016", "buf", key, true);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_OPTIONS_CB_017
         * @tc.name      : testGetImagePropertyOptionsCb017
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyOptionsCb017", 0, async function (done) {
            let key = 12;
            getCb2Err(done, "testGetImagePropertyOptionsCb017", "buf", key, true);
        });

        /**
         * @tc.number    : TEST_GETIMAGEPROPERTY_OPTIONS_CB_018
         * @tc.name      : testGetImagePropertyOptionsCb018
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testGetImagePropertyOptionsCb018", 0, async function (done) {
            let key = { a: 12 };
            getCb2Err(done, "testGetImagePropertyOptionsCb018", "buf", key, true);
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_001
         * @tc.name      : testModifyImagePropertyPromise001
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise001", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Top-right").assertTrue();
            }
            modifyPromise(
                done,
                "testModifyImagePropertyPromise001",
                "buffer",
                ORIENTATION,
                "2",
                checkProps
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_002
         * @tc.name      : testModifyImagePropertyPromise002
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise002", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("38") != -1).assertTrue();
            }
            modifyPromise(
                done,
                "testModifyImagePropertyPromise002",
                "buffer",
                GPS_LATITUDE,
                "114,3",
                checkProps
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_003
         * @tc.name      : testModifyImagePropertyPromise003
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise003", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("9") != -1).assertTrue();
            }
            modifyPromise(
                done,
                "testModifyImagePropertyPromise003",
                "buffer",
                GPS_LONGITUDE,
                "18,2",
                checkProps
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_004
         * @tc.name      : testModifyImagePropertyPromise004
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise004", 0, async function (done) {
            function checkProps(result) {
                expect(result == "N").assertTrue();
            }
            modifyPromise(
                done,
                "testModifyImagePropertyPromise004",
                "buffer",
                GPS_LATITUDE_REF,
                "N",
                checkProps
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_005
         * @tc.name      : testModifyImagePropertyPromise005
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise005", 0, async function (done) {
            function checkProps(result) {
                expect(result == "W").assertTrue();
            }
            modifyPromise(
                done,
                "testModifyImagePropertyPromise005",
                "buffer",
                GPS_LONGITUDE_REF,
                "W",
                checkProps
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_006
         * @tc.name      : testModifyImagePropertyPromise006
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise006", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Top-right").assertTrue();
            }
            modifyPromise(done, "testModifyImagePropertyPromise006", "fd", ORIENTATION, "2", checkProps);
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_007
         * @tc.name      : testModifyImagePropertyPromise007
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise007", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("38") != -1).assertTrue();
            }
            modifyPromise(
                done,
                "testModifyImagePropertyPromise007",
                "fd",
                GPS_LATITUDE,
                "114,3",
                checkProps
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_008
         * @tc.name      : testModifyImagePropertyPromise008
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise008", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("9") != -1).assertTrue();
            }
            modifyPromise(
                done,
                "testModifyImagePropertyPromise008",
                "fd",
                GPS_LONGITUDE,
                "18,2",
                checkProps
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_009
         * @tc.name      : testModifyImagePropertyPromise009
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise009", 0, async function (done) {
            function checkProps(result) {
                expect(result == "N").assertTrue();
            }
            modifyPromise(
                done,
                "testModifyImagePropertyPromise009",
                "fd",
                GPS_LATITUDE_REF,
                "N",
                checkProps
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_010
         * @tc.name      : testModifyImagePropertyPromise010
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise010", 0, async function (done) {
            function checkProps(result) {
                expect(result == "W").assertTrue();
            }
            modifyPromise(
                done,
                "testModifyImagePropertyPromise010",
                "fd",
                GPS_LONGITUDE_REF,
                "W",
                checkProps
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_011
         * @tc.name      : testModifyImagePropertyPromise011
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise011", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "testModifyImagePropertyPromise011",
                "fd",
                ORIENTATION,
                "abcdef"
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_012
         * @tc.name      : testModifyImagePropertyPromise012
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise012", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "testModifyImagePropertyPromise012",
                "fd",
                GPS_LATITUDE,
                "abc,3"
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_013
         * @tc.name      : testModifyImagePropertyPromise013
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise013", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "testModifyImagePropertyPromise013",
                "fd",
                GPS_LONGITUDE,
                "abc,2"
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_014
         * @tc.name      : testModifyImagePropertyPromise014
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise014", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "testModifyImagePropertyPromise014",
                "fd",
                GPS_LATITUDE_REF,
                "456"
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_015
         * @tc.name      : testModifyImagePropertyPromise015
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise015", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "testModifyImagePropertyPromise015",
                "fd",
                GPS_LONGITUDE_REF,
                "1234"
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_016
         * @tc.name      : testModifyImagePropertyPromise016
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise016", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "testModifyImagePropertyPromise016",
                "buffer",
                ORIENTATION,
                "abcdef"
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_017
         * @tc.name      : testModifyImagePropertyPromise017
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise017", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "testModifyImagePropertyPromise017",
                "buffer",
                GPS_LATITUDE,
                "abc,3"
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_018
         * @tc.name      : testModifyImagePropertyPromise018
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise018", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "testModifyImagePropertyPromise018",
                "buffer",
                GPS_LONGITUDE,
                "abc,2"
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_019
         * @tc.name      : testModifyImagePropertyPromise019
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise019", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "testModifyImagePropertyPromise019",
                "buffer",
                GPS_LATITUDE_REF,
                "456"
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_PROMISE_020
         * @tc.name      : testModifyImagePropertyPromise020
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyPromise020", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "testModifyImagePropertyPromise020",
                "buffer",
                GPS_LONGITUDE_REF,
                "1234"
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_001
         * @tc.name      : testModifyImagePropertyCb001
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb001", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Top-right").assertTrue();
            }
            modifyCb(done, "testModifyImagePropertyCb001", "buffer", ORIENTATION, "2", checkProps);
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_002
         * @tc.name      : testModifyImagePropertyCb002
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb002", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("38") != -1).assertTrue();
            }
            modifyCb(
                done,
                "testModifyImagePropertyCb002",
                "buffer",
                GPS_LATITUDE,
                "114,3",
                checkProps
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_003
         * @tc.name      : testModifyImagePropertyCb003
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb003", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("9") != -1).assertTrue();
            }
            modifyCb(
                done,
                "testModifyImagePropertyCb003",
                "buffer",
                GPS_LONGITUDE,
                "18,2",
                checkProps
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_004
         * @tc.name      : testModifyImagePropertyCb004
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb004", 0, async function (done) {
            function checkProps(result) {
                expect(result == "N").assertTrue();
            }
            modifyCb(
                done,
                "testModifyImagePropertyCb004",
                "buffer",
                GPS_LATITUDE_REF,
                "N",
                checkProps
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_005
         * @tc.name      : testModifyImagePropertyCb005
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb005", 0, async function (done) {
            function checkProps(result) {
                expect(result == "W").assertTrue();
            }
            modifyCb(
                done,
                "testModifyImagePropertyCb005",
                "buffer",
                GPS_LONGITUDE_REF,
                "W",
                checkProps
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_006
         * @tc.name      : testModifyImagePropertyCb006
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb006", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Top-right").assertTrue();
            }
            modifyCb(done, "testModifyImagePropertyCb006", "fd", ORIENTATION, "2", checkProps);
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_007
         * @tc.name      : testModifyImagePropertyCb007
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb007", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("38") != -1).assertTrue();
            }
            modifyCb(done, "testModifyImagePropertyCb007", "fd", GPS_LATITUDE, "114,3", checkProps);
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_008
         * @tc.name      : testModifyImagePropertyCb008
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb008", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("9") != -1).assertTrue();
            }
            modifyCb(done, "testModifyImagePropertyCb008", "fd", GPS_LONGITUDE, "18,2", checkProps);
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_009
         * @tc.name      : testModifyImagePropertyCb009
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb009", 0, async function (done) {
            function checkProps(result) {
                expect(result == "N").assertTrue();
            }
            modifyCb(done, "testModifyImagePropertyCb009", "fd", GPS_LATITUDE_REF, "N", checkProps);
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_010
         * @tc.name      : testModifyImagePropertyCb010
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb010", 0, async function (done) {
            function checkProps(result) {
                expect(result == "W").assertTrue();
            }
            modifyCb(done, "testModifyImagePropertyCb010", "fd", GPS_LONGITUDE_REF, "W", checkProps);
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_011
         * @tc.name      : testModifyImagePropertyCb011
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb011", 0, async function (done) {
            modifyErrCb(done, "testModifyImagePropertyCb011", "fd", ORIENTATION, "abcdef");
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_012
         * @tc.name      : testModifyImagePropertyCb012
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb012", 0, async function (done) {
            modifyErrCb(done, "testModifyImagePropertyCb012", "fd", GPS_LATITUDE, "abc,3");
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_013
         * @tc.name      : testModifyImagePropertyCb013
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb013", 0, async function (done) {
            modifyErrCb(done, "testModifyImagePropertyCb013", "fd", GPS_LONGITUDE, "abc,2");
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_014
         * @tc.name      : testModifyImagePropertyCb014
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb014", 0, async function (done) {
            modifyErrCb(done, "testModifyImagePropertyCb014", "fd", GPS_LATITUDE_REF, "456");
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_015
         * @tc.name      : testModifyImagePropertyCb015
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb015", 0, async function (done) {
            modifyErrCb(done, "testModifyImagePropertyCb015", "fd", GPS_LONGITUDE_REF, "1234");
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_016
         * @tc.name      : testModifyImagePropertyCb016
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb016", 0, async function (done) {
            modifyErrCb(
                done,
                "testModifyImagePropertyCb016",
                "buffer",
                ORIENTATION,
                "abcdef"
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_017
         * @tc.name      : testModifyImagePropertyCb017
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb017", 0, async function (done) {
            modifyErrCb(done, "testModifyImagePropertyCb017", "buffer", GPS_LATITUDE, "abc,3");
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_018
         * @tc.name      : testModifyImagePropertyCb018
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb018", 0, async function (done) {
            modifyErrCb(
                done,
                "testModifyImagePropertyCb018",
                "buffer",
                GPS_LONGITUDE,
                "abc,2"
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_019
         * @tc.name      : testModifyImagePropertyCb019
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb019", 0, async function (done) {
            modifyErrCb(
                done,
                "testModifyImagePropertyCb019",
                "buffer",
                GPS_LATITUDE_REF,
                "456"
            );
        });

        /**
         * @tc.number    : TEST_MODIFYIMAGEPROPERTY_CB_020
         * @tc.name      : testModifyImagePropertyCb020
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testModifyImagePropertyCb020", 0, async function (done) {
            modifyErrCb(
                done,
                "testModifyImagePropertyCb020",
                "buffer",
                GPS_LONGITUDE_REF,
                "1234"
            );
        });

        /**
         * @tc.number    : TEST_UPDATEDATA_PROMISE_001
         * @tc.name      : testUpdateDataPromise001
         * @tc.desc      : 1.create imagesource
         *                 2.update data
         *                 3.create pixelmap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testUpdateDataPromise001", 0, async function (done) {
            createIncrementalSourcePromise(
                done,
                "testUpdateDataPromise001",
                "noSourceOpts"
            );
        });

        /**
         * @tc.number    : TEST_UPDATEDATA_PROMISE_002
         * @tc.name      : testUpdateDataPromise002
         * @tc.desc      : 1.create imagesource
         *                 2.update data
         *                 3.create pixelmap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testUpdateDataPromise002", 0, async function (done) {
            let opts = { sourceDensity: 240, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
            createIncrementalSourcePromise(
                done,
                "testUpdateDataPromise002",
                "sourceOpts",
                opts
            );
        });

        /**
         * @tc.number    : TEST_UPDATEDATA_CB_001
         * @tc.name      : testUpdateDataCb001
         * @tc.desc      : 1.create imagesource
         *                 2.update data
         *                 3.create pixelmap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testUpdateDataCb001", 0, async function (done) {
            createIncrementalSourceCb(
                done,
                "testUpdateDataCb001",
                "noSourceOpts"
            );
        });

        /**
         * @tc.number    : TEST_UPDATEDATA_CB_002
         * @tc.name      : testUpdateDataCb002
         * @tc.desc      : 1.create imagesource
         *                 2.update data
         *                 3.create pixelmap
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testUpdateDataCb002", 0, async function (done) {
            let opts = { sourceDensity: 240, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
            createIncrementalSourceCb(
                done,
                "testUpdateDataCb002",
                "sourceOpts",
                opts
            );
        });

        /**
         * @tc.number    : TEST_RELEASE_PROMISE_001
         * @tc.name      : testReleasePromise001
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testReleasePromise001', 0, async function (done) {
            try {
                await getFileFd('test.jpg', testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testReleasePromise001 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.release().then(() => {
                        console.info('testReleasePromise001 success');
                        expect(true).assertTrue();
                        done();
                    }).catch(error => {
                        console.info('testReleasePromise001 error');
                        expect(false).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('testReleasePromise001 err:' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_RELEASE_PROMISE_002
         * @tc.name      : testReleasePromise002
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testReleasePromise002', 0, async function (done) {
            try {
                await getFileFd('test.png', testPng);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testReleasePromise002 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.release().then(() => {
                        console.info('testReleasePromise002 success');
                        expect(true).assertTrue();
                        done();
                    }).catch(error => {
                        console.log('testReleasePromise002 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('testReleasePromise002 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_RELEASE_PROMISE_003
         * @tc.name      : testReleasePromise003
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testReleasePromise003', 0, async function (done) {
            try {
                await getFileFd('test.bmp', testBmp);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testReleasePromise003 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.release().then(() => {
                        console.info('testReleasePromise003 success');
                        expect(true).assertTrue();
                        done();
                    }).catch(error => {
                        console.log('testReleasePromise003 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('testReleasePromise003 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_RELEASE_PROMISE_004
         * @tc.name      : testReleasePromise004
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testReleasePromise004', 0, async function (done) {
            try {
                await getFileFd('test.gif', testGif);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testReleasePromise004 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.release().then(() => {
                        console.info('testReleasePromise004 success');
                        expect(true).assertTrue();
                        done();
                    }).catch(error => {
                        console.log('testReleasePromise004 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('testReleasePromise004 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_RELEASE_CB_001
         * @tc.name      : testReleaseCb001
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.callback return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testReleaseCb001', 0, async function (done) {
            try {
                await getFileFd('test.jpg', testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testReleaseCb001 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.release(() => {
                        console.info('testReleaseCb001 Success');
                        expect(true).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('testReleaseCb001 err:' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_RELEASE_CB_002
         * @tc.name      : testReleaseCb002
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testReleaseCb002', 0, async function (done) {
            try {
                await getFileFd('test.png', testPng);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testReleaseCb002 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.release(async (err) => {
                        if (err) {
                            console.info('testReleaseCb002 err:' + err);
                            expect(false).assertTrue();
                            done();
                            return
                        }
                        console.info('testReleaseCb002 Success');
                        expect(true).assertTrue();
                        expect(true).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('testReleaseCb002 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_RELEASE_CB_003
         * @tc.name      : testReleaseCb003
         * @tc.desc      : 1.create ImageSource
         *                 2.create SourceStream
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testReleaseCb003', 0, async function (done) {
            try {
                await getFileFd('test.bmp', testBmp);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testReleaseCb003 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.release(async () => {
                        console.info('testReleaseCb003 Success');
                        expect(true).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('testReleaseCb003 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_RELEASE_CB_004
         * @tc.name      : testReleaseCb004
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testReleaseCb004', 0, async function (done) {
            try {
                await getFileFd('test.gif', testGif);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testReleaseCb004 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.release(() => {
                        console.info('testReleaseCb004 Success');
                        expect(true).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('testReleaseCb004 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TEST_SUPPORTEDFORMATS_001
         * @tc.name      : testSupportedFormats001
         * @tc.desc      : 1.create imagesource
         *                 2.call supportedFormats
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('testSupportedFormats001', 0, async function (done) {
            try {
                await getFileFd('test.jpg', testJpg);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info('testSupportedFormats001 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    expect(imageSourceApi.supportedFormats != undefined).assertTrue();
                    console.info('testSupportedFormats001 success ');
                    done();
                }
            } catch (error) {
                console.info('testSupportedFormats001 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })
    });
}
