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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import featureAbility from "@ohos.ability.featureAbility";
import { BusinessError } from '@ohos.base';


let filePath: ESObject;
let fdNumber: number;
let globalpixelmap: PixelMap;

async function getFd(fileName:string) {
  let context: ESObject = await AppStorage.get('thisContext');
  filePath = context.filesDir + "/" + fileName;
  console.info("image case filePath is " + filePath);
  await fileio
    .open(filePath)
    .then(
      (data) => {
        fdNumber = data;
        console.info("image case open fd success " + fdNumber);
      },
      (err: BusinessError) => {
        console.info("image cese open fd fail" + err);
      }
    )
    .catch((err: BusinessError) => {
      console.info("image case open fd err " + err);
    });
}

export default function imagePixelLocation() {
    describe("imagePixelLocation", () => {


        beforeAll(async () => {
            console.info("beforeAll case");
        });

        beforeEach(() => {
            console.info("beforeEach case");
        });

        afterEach(async () => {
            if (globalpixelmap != undefined) {
                console.info("globalpixelmap release start");
                try {
                    await globalpixelmap.release();
                } catch (error) {
                    console.info("globalpixelmap release fail");
                }
            }
            console.info("afterEach case");
        });

        afterAll(async () => {
            console.info("afterAll case");
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0100
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode the entire picture
         *                 2、Check four color
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0100", Level.LEVEL0, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0100' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        tag + " create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 256, height: 256 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 256, width: 256 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                tag + " createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            let imageInfo: image.ImageInfo = pixelmap.getImageInfoSync();
                            let imageWidth: number = imageInfo.size.width;
                            console.info(tag + 'imageWidth is ' + imageWidth);
                            expect(imageWidth == 256).assertTrue();
                            let imageHeight: number = imageInfo.size.height;
                            console.info(tag + 'imageHeight is ' + imageHeight);
                            expect(imageHeight == 256).assertTrue();

                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);

                            let x = 60;
                            let y = 60;
                            let index = (y * 256 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 255 && bufferArr[index + 1] == 0 && bufferArr[index + 2] == 0 && bufferArr[index + 3] == 255) {
                                console.info(tag + ' The top left corner is red');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The top left corner is not red');
                                expect().assertFail();
                                done();
                            }
                            x = 200;
                            y = 60;
                            index = (y * 256 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 0 && bufferArr[index + 1] == 255 && bufferArr[index + 2] == 0 && bufferArr[index + 3] == 255) {
                                console.info(tag + ' The top left corner is green');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The top left corner is not green');
                                expect().assertFail();
                                done();
                            }
                            x = 60;
                            y = 200;
                            index = (y * 256 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 0 && bufferArr[index + 1] == 0 && bufferArr[index + 2] == 255 && bufferArr[index + 3] == 255) {
                                console.info(tag + ' The top left corner is blue');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The top left corner is not blue');
                                expect().assertFail();
                                done();
                            }
                            x = 200;
                            y = 200;
                            index = (y * 256 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 120 && bufferArr[index + 1] == 120 && bufferArr[index + 2] == 120 && bufferArr[index + 3] == 255) {
                                console.info(tag + ' The top left corner is grey');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The top left corner is not grey');
                                expect().assertFail();
                                done();
                            }
                        done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0200
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode red part, Zoom out
         *                 2、check red pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0200", Level.LEVEL0, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0200' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        tag + " create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 128, height: 128 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                tag + " createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            let imageInfo: image.ImageInfo = pixelmap.getImageInfoSync();
                            let imageWidth: number = imageInfo.size.width;
                            console.info(tag + 'imageWidth is ' + imageWidth);
                            expect(imageWidth == 128).assertTrue();
                            let imageHeight: number = imageInfo.size.height;
                            console.info(tag + 'imageHeight is ' + imageHeight);
                            expect(imageHeight == 128).assertTrue();

                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);

                            let x = 125;
                            let y = 125;
                            let index = (y * 128 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 255 && bufferArr[index + 1] == 0 && bufferArr[index + 2] == 0 && bufferArr[index + 3] == 255) {
                                console.info(tag + ' The top left corner is red');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The top left corner is not red');
                                expect().assertFail();
                                done();
                            }
                            x = 200;
                            y = 200;
                            index = (y * 256 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == undefined && bufferArr[index + 1] == undefined && bufferArr[index + 2] == undefined && bufferArr[index + 3] == undefined) {
                                console.info(tag + ' The other corners have been cut.');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The other corners have not been cut.');
                                expect().assertFail();
                                done();
                            }
                        done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0300
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode green part, Zoom out
         *                 2、check green pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0300", Level.LEVEL0, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0300' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        tag + " create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 128, height: 128 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 128, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                tag + " createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            let imageInfo: image.ImageInfo = pixelmap.getImageInfoSync();
                            let imageWidth: number = imageInfo.size.width;
                            console.info(tag + 'imageWidth is ' + imageWidth);
                            expect(imageWidth == 128).assertTrue();
                            let imageHeight: number = imageInfo.size.height;
                            console.info(tag + 'imageHeight is ' + imageHeight);
                            expect(imageHeight == 128).assertTrue();

                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);

                            let x = 125;
                            let y = 125;
                            let index = (y * 128 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 0 && bufferArr[index + 1] == 255 && bufferArr[index + 2] == 0 && bufferArr[index + 3] == 255) {
                                console.info(tag + ' The top left corner is green');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The top left corner is not green');
                                expect().assertFail();
                                done();
                            }
                            x = 200;
                            y = 200;
                            index = (y * 256 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == undefined && bufferArr[index + 1] == undefined && bufferArr[index + 2] == undefined && bufferArr[index + 3] == undefined) {
                                console.info(tag + ' The other corners have been cut.');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The other corners have not been cut.');
                                expect().assertFail();
                                done();
                            }
                        done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0400
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode blue part, Zoom out
         *                 2、check blue pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0400", Level.LEVEL0, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0400' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        tag + " create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 128, height: 128 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 0, y: 128 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                tag + " createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            let imageInfo: image.ImageInfo = pixelmap.getImageInfoSync();
                            let imageWidth: number = imageInfo.size.width;
                            console.info(tag + 'imageWidth is ' + imageWidth);
                            expect(imageWidth == 128).assertTrue();
                            let imageHeight: number = imageInfo.size.height;
                            console.info(tag + 'imageHeight is ' + imageHeight);
                            expect(imageHeight == 128).assertTrue();

                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);

                            let x = 125;
                            let y = 125;
                            let index = (y * 128 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 0 && bufferArr[index + 1] == 0 && bufferArr[index + 2] == 255 && bufferArr[index + 3] == 255) {
                                console.info(tag + ' The top left corner is blue');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The top left corner is not blue');
                                expect().assertFail();
                                done();
                            }
                            x = 200;
                            y = 200;
                            index = (y * 256 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == undefined && bufferArr[index + 1] == undefined && bufferArr[index + 2] == undefined && bufferArr[index + 3] == undefined) {
                                console.info(tag + ' The other corners have been cut.');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The other corners have not been cut.');
                                expect().assertFail();
                                done();
                            }
                        done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0500
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode grey part, Zoom out
         *                 2、check grey pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0500", Level.LEVEL0, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0500' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        tag + " create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 128, height: 128 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 128, y: 128 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                tag + " createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            let imageInfo: image.ImageInfo = pixelmap.getImageInfoSync();
                            let imageWidth: number = imageInfo.size.width;
                            console.info(tag + 'imageWidth is ' + imageWidth);
                            expect(imageWidth == 128).assertTrue();
                            let imageHeight: number = imageInfo.size.height;
                            console.info(tag + 'imageHeight is ' + imageHeight);
                            expect(imageHeight == 128).assertTrue();

                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);

                            let x = 125;
                            let y = 125;
                            let index = (y * 128 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 120 && bufferArr[index + 1] == 120 && bufferArr[index + 2] == 120 && bufferArr[index + 3] == 255) {
                                console.info(tag + ' The top left corner is grey');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The top left corner is not grey');
                                expect().assertFail();
                                done();
                            }
                            x = 200;
                            y = 200;
                            index = (y * 256 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == undefined && bufferArr[index + 1] == undefined && bufferArr[index + 2] == undefined && bufferArr[index + 3] == undefined) {
                                console.info(tag + ' The other corners have been cut.');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The other corners have not been cut.');
                                expect().assertFail();
                                done();
                            }
                        done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0600
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode red part, Zoom in
         *                 2、check red pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0600", Level.LEVEL0, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0600' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        tag + " create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 512, height: 512 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                tag + " createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            let imageInfo: image.ImageInfo = pixelmap.getImageInfoSync();
                            let imageWidth: number = imageInfo.size.width;
                            console.info(tag + 'imageWidth is ' + imageWidth);
                            expect(imageWidth == 512).assertTrue();
                            let imageHeight: number = imageInfo.size.height;
                            console.info(tag + 'imageHeight is ' + imageHeight);
                            expect(imageHeight == 512).assertTrue();

                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);

                            let x = 500;
                            let y = 500;
                            let index = (y * 512 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 255 && bufferArr[index + 1] == 0 && bufferArr[index + 2] == 0 && bufferArr[index + 3] == 255) {
                                console.info(tag + ' The red area is zoomed in proportionally successfully.');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The red area fails to be zoomed in proportionally.');
                                expect().assertFail();
                                done();
                            }
                            x = 550;
                            y = 550;
                            index = (y * 1024 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == undefined && bufferArr[index + 1] == undefined && bufferArr[index + 2] == undefined && bufferArr[index + 3] == undefined) {
                                console.info(tag + ' The other corners have been cut.');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The other corners have not been cut.');
                                expect().assertFail();
                                done();
                            }
                        done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0700
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode green part, Zoom in
         *                 2、check green pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0700", Level.LEVEL0, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0700' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        tag + " create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 512, height: 512 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 128, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                tag + " createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            let imageInfo: image.ImageInfo = pixelmap.getImageInfoSync();
                            let imageWidth: number = imageInfo.size.width;
                            console.info(tag + 'imageWidth is ' + imageWidth);
                            expect(imageWidth == 512).assertTrue();
                            let imageHeight: number = imageInfo.size.height;
                            console.info(tag + 'imageHeight is ' + imageHeight);
                            expect(imageHeight == 512).assertTrue();

                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);

                            let x = 500;
                            let y = 500;
                            let index = (y * 512 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 0 && bufferArr[index + 1] == 255 && bufferArr[index + 2] == 0 && bufferArr[index + 3] == 255) {
                                console.info(tag + ' The green area is zoomed in proportionally successfully.');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The green area fails to be zoomed in proportionally.');
                                expect().assertFail();
                                done();
                            }
                            x = 550;
                            y = 550;
                            index = (y * 1024 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == undefined && bufferArr[index + 1] == undefined && bufferArr[index + 2] == undefined && bufferArr[index + 3] == undefined) {
                                console.info(tag + ' The other corners have been cut.');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The other corners have not been cut.');
                                expect().assertFail();
                                done();
                            }
                        done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0800
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode blue part, Zoom in
         *                 2、check blue pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0800", Level.LEVEL0, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0800' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        tag + " create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 512, height: 512 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 0, y: 128 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                tag + " createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            let imageInfo: image.ImageInfo = pixelmap.getImageInfoSync();
                            let imageWidth: number = imageInfo.size.width;
                            console.info(tag + 'imageWidth is ' + imageWidth);
                            expect(imageWidth == 512).assertTrue();
                            let imageHeight: number = imageInfo.size.height;
                            console.info(tag + 'imageHeight is ' + imageHeight);
                            expect(imageHeight == 512).assertTrue();

                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);

                            let x = 500;
                            let y = 500;
                            let index = (y * 512 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 0 && bufferArr[index + 1] == 0 && bufferArr[index + 2] == 255 && bufferArr[index + 3] == 255) {
                                console.info(tag + ' The blue area is zoomed in proportionally successfully.');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The blue area fails to be zoomed in proportionally.');
                                expect().assertFail();
                                done();
                            }
                            x = 550;
                            y = 550;
                            index = (y * 1024 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == undefined && bufferArr[index + 1] == undefined && bufferArr[index + 2] == undefined && bufferArr[index + 3] == undefined) {
                                console.info(tag + ' The other corners have been cut.');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The other corners have not been cut.');
                                expect().assertFail();
                                done();
                            }
                        done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });
		
		/**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0900
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode grey part, Zoom in
         *                 2、check grey pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0900", Level.LEVEL0, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_0900' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        tag + " create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 512, height: 512 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 128, y: 128 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                tag + " createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            let imageInfo: image.ImageInfo = pixelmap.getImageInfoSync();
                            let imageWidth: number = imageInfo.size.width;
                            console.info(tag + 'imageWidth is ' + imageWidth);
                            expect(imageWidth == 512).assertTrue();
                            let imageHeight: number = imageInfo.size.height;
                            console.info(tag + 'imageHeight is ' + imageHeight);
                            expect(imageHeight == 512).assertTrue();

                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);

                            let x = 500;
                            let y = 500;
                            let index = (y * 512 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 120 && bufferArr[index + 1] == 120 && bufferArr[index + 2] == 120 && bufferArr[index + 3] == 255) {
                                console.info(tag + ' The grey area is zoomed in proportionally successfully.');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The grey area fails to be zoomed in proportionally.');
                                expect().assertFail();
                                done();
                            }
                            x = 550;
                            y = 550;
                            index = (y * 1024 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == undefined && bufferArr[index + 1] == undefined && bufferArr[index + 2] == undefined && bufferArr[index + 3] == undefined) {
                                console.info(tag + ' The other corners have been cut.');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The other corners have not been cut.');
                                expect().assertFail();
                                done();
                            }
                        done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1000
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode red part, Original image scale
         *                 2、check red pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1000", Level.LEVEL0, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1000' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        tag + " create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 256, height: 256 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                tag + " createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            let imageInfo: image.ImageInfo = pixelmap.getImageInfoSync();
                            let imageWidth: number = imageInfo.size.width;
                            console.info(tag + 'imageWidth is ' + imageWidth);
                            expect(imageWidth == 256).assertTrue();
                            let imageHeight: number = imageInfo.size.height;
                            console.info(tag + 'imageHeight is ' + imageHeight);
                            expect(imageHeight == 256).assertTrue();

                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);

                            let x = 200;
                            let y = 200;
                            let index = (y * 256 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 255 && bufferArr[index + 1] == 0 && bufferArr[index + 2] == 0 && bufferArr[index + 3] == 255) {
                                console.info(tag + ' The red part is the original image scale.');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The red part is not the original image scale.');
                                expect().assertFail();
                                done();
                            }
                            x = 300;
                            y = 300;
                            index = (y * 512 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == undefined && bufferArr[index + 1] == undefined && bufferArr[index + 2] == undefined && bufferArr[index + 3] == undefined) {
                                console.info(tag + ' The other corners have been cut.');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The other corners have not been cut.');
                                expect().assertFail();
                                done();
                            }
                        done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1100
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode green part, Original image scale
         *                 2、check green pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1100", Level.LEVEL0, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1100' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        tag + " create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 256, height: 256 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 128, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                tag + " createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            let imageInfo: image.ImageInfo = pixelmap.getImageInfoSync();
                            let imageWidth: number = imageInfo.size.width;
                            console.info(tag + 'imageWidth is ' + imageWidth);
                            expect(imageWidth == 256).assertTrue();
                            let imageHeight: number = imageInfo.size.height;
                            console.info(tag + 'imageHeight is ' + imageHeight);
                            expect(imageHeight == 256).assertTrue();

                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);

                            let x = 200;
                            let y = 200;
                            let index = (y * 256 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 0 && bufferArr[index + 1] == 255 && bufferArr[index + 2] == 0 && bufferArr[index + 3] == 255) {
                                console.info(tag + ' The top left corner is green');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The top left corner is not green');
                                expect().assertFail();
                                done();
                            }
                            x = 300;
                            y = 300;
                            index = (y * 512 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == undefined && bufferArr[index + 1] == undefined && bufferArr[index + 2] == undefined && bufferArr[index + 3] == undefined) {
                                console.info(tag + ' The other corners have been cut.');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The other corners have not been cut.');
                                expect().assertFail();
                                done();
                            }
                        done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1200
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode blue part, Original image scale
         *                 2、check blue pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1200", Level.LEVEL0, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1200' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        tag + " create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 256, height: 256 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 0, y: 128 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                tag + " createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            let imageInfo: image.ImageInfo = pixelmap.getImageInfoSync();
                            let imageWidth: number = imageInfo.size.width;
                            console.info(tag + 'imageWidth is ' + imageWidth);
                            expect(imageWidth == 256).assertTrue();
                            let imageHeight: number = imageInfo.size.height;
                            console.info(tag + 'imageHeight is ' + imageHeight);
                            expect(imageHeight == 256).assertTrue();

                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);

                            let x = 200;
                            let y = 200;
                            let index = (y * 256 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 0 && bufferArr[index + 1] == 0 && bufferArr[index + 2] == 255 && bufferArr[index + 3] == 255) {
                                console.info(tag + ' The top left corner is blue');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The top left corner is not blue');
                                expect().assertFail();
                                done();
                            }
                            x = 300;
                            y = 300;
                            index = (y * 512 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == undefined && bufferArr[index + 1] == undefined && bufferArr[index + 2] == undefined && bufferArr[index + 3] == undefined) {
                                console.info(tag + ' The other corners have been cut.');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The other corners have not been cut.');
                                expect().assertFail();
                                done();
                            }
                        done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1300
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode grey part, Original image scale
         *                 2、check grey pixel location
         *                 3、check other corners have been cut
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1300", Level.LEVEL0, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1300' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        tag + " create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 256, height: 256 },
                        rotate: 0,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 128, y: 128 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                tag + " createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            let imageInfo: image.ImageInfo = pixelmap.getImageInfoSync();
                            let imageWidth: number = imageInfo.size.width;
                            console.info(tag + 'imageWidth is ' + imageWidth);
                            expect(imageWidth == 256).assertTrue();
                            let imageHeight: number = imageInfo.size.height;
                            console.info(tag + 'imageHeight is ' + imageHeight);
                            expect(imageHeight == 256).assertTrue();

                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);

                            let x = 200;
                            let y = 200;
                            let index = (y * 256 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 120 && bufferArr[index + 1] == 120 && bufferArr[index + 2] == 120 && bufferArr[index + 3] == 255) {
                                console.info(tag + ' The top left corner is grey');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The top left corner is not grey');
                                expect().assertFail();
                                done();
                            }
                            x = 300;
                            y = 300;
                            index = (y * 512 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == undefined && bufferArr[index + 1] == undefined && bufferArr[index + 2] == undefined && bufferArr[index + 3] == undefined) {
                                console.info(tag + ' The other corners have been cut.');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' The other corners have not been cut.');
                                expect().assertFail();
                                done();
                            }
                        done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1400
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode red part, rotate 45
         *                 2、check red pixel location
         *                 3、check Rotated blank pixels are transparent
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1400", Level.LEVEL0, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1400' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        tag + " create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 362, height: 362 },
                        rotate: 45,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 0, y: 0 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                tag + " createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            let imageInfo: image.ImageInfo = pixelmap.getImageInfoSync();
                            let imageWidth: number = imageInfo.size.width;
                            console.info(tag + 'imageWidth is ' + imageWidth);
                            expect(imageWidth == 362).assertTrue();
                            let imageHeight: number = imageInfo.size.height;
                            console.info(tag + 'imageHeight is ' + imageHeight);
                            expect(imageHeight == 362).assertTrue();

                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);

                            let x = 200;
                            let y = 200;
                            let index = (y * 362 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 255 && bufferArr[index + 1] == 0 && bufferArr[index + 2] == 0 && bufferArr[index + 3] == 255) {
                                console.info(tag + ' Rotated pixels are red');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' Rotated pixels are not red');
                                expect().assertFail();
                                done();
                            }
                            x = 1;
                            y = 1;
                            index = (y * 362 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 0 && bufferArr[index + 1] == 0 && bufferArr[index + 2] == 0 && bufferArr[index + 3] == 0) {
                                console.info(tag + ' Rotated blank pixels are transparent.');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' Rotated blank pixels are not transparent.');
                                expect().assertFail();
                                done();
                            }
                        done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1500
         * @tc.name      : check pixel locations
         * @tc.desc      : 1、Decode grey part, rotate 135
         *                 2、check grey pixel location
         *                 3、check Rotated blank pixels are transparent
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1500", Level.LEVEL0, async (done: Function) => {
            let tag = 'SUB_MULTIMEDIA_IMAGE_CHECK_PIXEL_LOCATIONS_1500' 
            try {
                await getFd("color4.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(
                        tag + " create image source failed"
                    );
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 362, height: 362 },
                        rotate: 135,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 128, width: 128 }, x: 128, y: 128 },
                        index: 0,
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info(
                                tag + " createPixelMap error  " +
                                    JSON.stringify(err)
                            );
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            let imageInfo: image.ImageInfo = pixelmap.getImageInfoSync();
                            let imageWidth: number = imageInfo.size.width;
                            console.info(tag + 'imageWidth is ' + imageWidth);
                            expect(imageWidth == 362).assertTrue();
                            let imageHeight: number = imageInfo.size.height;
                            console.info(tag + 'imageHeight is ' + imageHeight);
                            expect(imageHeight == 362).assertTrue();

                            let pixelBytesNumber: number = pixelmap.getPixelBytesNumber();
                            console.info(tag + ' input pixel Bytes Number is' + pixelBytesNumber);
                            let colorsBuffer: ArrayBuffer = new ArrayBuffer(pixelBytesNumber);
                            pixelmap.readPixelsToBufferSync(colorsBuffer);
                            let bufferArr: Uint8Array = new Uint8Array(colorsBuffer);

                            let x = 200;
                            let y = 200;
                            let index = (y * 362 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 120 && bufferArr[index + 1] == 120 && bufferArr[index + 2] == 120 && bufferArr[index + 3] == 255) {
                                console.info(tag + ' Rotated pixels are grey');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' Rotated pixels are not grey');
                                expect().assertFail();
                                done();
                            }
                            x = 1;
                            y = 1;
                            index = (y * 362 + x) * 4;
                            console.info('index is ' + bufferArr[index]);
                            console.info('index + 1 is ' + bufferArr[index + 1]);
                            console.info('index + 2 is ' + bufferArr[index + 2]);
                            console.info('index + 3 is ' + bufferArr[index + 3]);
                            if (bufferArr[index] == 0 && bufferArr[index + 1] == 0 && bufferArr[index + 2] == 0 && bufferArr[index + 3] == 0) {
                                console.info(tag + ' Rotated blank pixels are transparent.');
                                expect(true).assertTrue();
                                done();
                            } else {
                                console.info(tag + ' Rotated blank pixels are not transparent.');
                                expect().assertFail();
                                done();
                            }
                        done();
                        }
                    });
                }
            } catch (error) {
                console.info(tag + " error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

    });
}
