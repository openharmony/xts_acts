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
import { testPng } from './testImg'
import { prepareImageFileFd } from './Common'
import fileIO from '@ohos.file.fs';

export default function ImagePacker() {
    describe("ImagePacker", function () {
        let context;
        let filePath;
        let fileFd;

        async function getFileFd(fileName, imageArray) {
            filePath = context.cacheDir + '/' + fileName;
            fileFd = await prepareImageFileFd(filePath, imageArray);
            expect(fileFd != null).assertTrue();
        }

        beforeAll(async function () {
            context = globalThis.abilityContext;
            console.info("beforeAll case");
        });

        beforeEach(function () {
            console.info("beforeEach case");
        });

        afterEach(function () {
            console.info("afterEach case");
            if (fileFd != null) {
                fileIO.close(fileFd);
                fileFd = null;
            }
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
                        const imagePackerApi = image.createImagePacker();
                        if (imagePackerApi == undefined) {
                            expect(false).assertTrue();
                            console.info(`${testNum} create imagepacker fail`);
                            done();
                        } else {
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
                        const imagePackerApi = image.createImagePacker();
                        if (imagePackerApi == undefined) {
                            expect(false).assertTrue();
                            console.info(`${testNum} create imagepacker fail`);
                            done();
                        } else {
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
                        const imagePackerApi = image.createImagePacker();
                        if (imagePackerApi == undefined) {
                            expect(false).assertTrue();
                            done();
                        } else {
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
                        const imagePackerApi = image.createImagePacker();
                        if (imagePackerApi == undefined) {
                            expect(false).assertTrue();
                            done();
                        } else {
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

        /**
         * @tc.number    : TEST_PACKING_PROMISE_001
         * @tc.name      : testPackingPromise001
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingPromise001", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99 };
            packingPromise(done, "testPackingPromise001", 2, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_PROMISE_002
         * @tc.name      : testPackingPromise002
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingPromise002", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 123 };
            packingPromiseFail(done, "testPackingPromise002", 2, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_PROMISE_003
         * @tc.name      : testPackingPromise003
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingPromise003", 0, async function (done) {
            let packOpts = { format: "image/jpeg" };
            packingPromiseFail(done, "testPackingPromise003", 2, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_PROMISE_004
         * @tc.name      : testPackingPromise004
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingPromise004", 0, async function (done) {
            let packOpts = { quality: 99 };
            packingPromiseFail(done, "testPackingPromise004", 2, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_PROMISE_006
         * @tc.name      : testPackingPromise006
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingPromise006", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 50 };
            packingPromise(done, "testPackingPromise006", 5, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_PROMISE_007
         * @tc.name      : testPackingPromise007
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingPromise007", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 123 };
            packingPromiseFail(done, "testPackingPromise007", 5, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_PROMISE_008
         * @tc.name      : testPackingPromise008
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingPromise008", 0, async function (done) {
            let packOpts = { format: "image/jpeg" };
            packingPromiseFail(done, "testPackingPromise008", 5, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_PROMISE_009
         * @tc.name      : testPackingPromise009
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingPromise009", 0, async function (done) {
            let packOpts = { quality: 99 };
            packingPromiseFail(done, "testPackingPromise009", 5, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_PROMISE_011
         * @tc.name      : testPackingPromise011
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingPromise011", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99, bufferSize: 10485760 };
            packingPromise(done, "testPackingPromise011", 2, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_PROMISE_012
         * @tc.name      : testPackingPromise012
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingPromise012", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99, bufferSize: 20480 };
            console.info(`testPackingPromise012 buffersize: ${packOpts.bufferSize}`);
            packingPromise(done, "testPackingPromise012", 2, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_PROMISE_013
         * @tc.name      : testPackingPromise013
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingPromise013", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99, bufferSize: 20000000 };
            packingPromise(done, "testPackingPromise013", 2, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_CB_001
         * @tc.name      : testPackingCb001
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingCb001", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99 };
            packingCb(done, "testPackingCb001", 2, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_CB_002
         * @tc.name      : testPackingCb002
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingCb002", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 123 };
            packingCbFail(done, "testPackingCb002", 2, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_CB_003
         * @tc.name      : testPackingCb003
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingCb003", 0, async function (done) {
            let packOpts = { format: "image/jpeg" };
            packingCbFail(done, "testPackingCb003", 2, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_CB_004
         * @tc.name      : testPackingCb004
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingCb004", 0, async function (done) {
            let packOpts = { quality: 99 };
            packingCbFail(done, "testPackingCb004", 2, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_CB_006
         * @tc.name      : testPackingCb006
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingCb006", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 50 };
            packingCb(done, "testPackingCb006", 5, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_CB_007
         * @tc.name      : testPackingCb007
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingCb007", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 123 };
            packingCbFail(done, "testPackingCb007", 5, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_CB_008
         * @tc.name      : testPackingCb008
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingCb008", 0, async function (done) {
            let packOpts = { format: "image/jpeg" };
            packingCbFail(done, "testPackingCb008", 5, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_CB_009
         * @tc.name      : testPackingCb009
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingCb009", 0, async function (done) {
            let packOpts = { quality: 99 };
            packingCbFail(done, "testPackingCb009", 5, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_CB_011
         * @tc.name      : testPackingCb011
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingCb011", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99, bufferSize: 10485760 };
            packingCb(done, "testPackingCb011", 2, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_CB_012
         * @tc.name      : testPackingCb012
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingCb012", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99, bufferSize: 20480 };
            packingCb(done, "testPackingCb012", 5, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_CB_013
         * @tc.name      : testPackingCb013
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packing
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingCb013", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99, bufferSize: 20000000 };
            packingCb(done, "testPackingCb013", 5, packOpts);
        });

        /**
         * @tc.number    : TEST_PACKING_IMAGESOURCE_PROMISE_001
         * @tc.name      : testPackingImageSourcePromise001
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingImageSourcePromise001", 0, async function (done) {
            try {
                await getFileFd("test.png", testPng);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info("testPackingImageSourcePromise001 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("testPackingImageSourcePromise001 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        let packOpts = { format: "image/jpeg", quality: 99 };
                        imagePackerApi
                            .packing(imageSourceApi, packOpts)
                            .then((data) => {
                                console.info("testPackingImageSourcePromise001 success");
                                expect(data != undefined).assertTrue();
                                done();
                            })
                            .catch((error) => {
                                console.log("testPackingImageSourcePromise001 error: " + error);
                                expect(false).assertFail();
                                done();
                            });
                    }
                }
            } catch (error) {
                console.info("testPackingImageSourcePromise001 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_PACKING_IMAGESOURCE_PROMISE_002
         * @tc.name      : testPackingImageSourcePromise002
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingImageSourcePromise002", 0, async function (done) {
            try {
                await getFileFd("test.png", testPng);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info("testPackingImageSourcePromise002 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("testPackingImageSourcePromise002 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        let packOpts = { format: "image/gif", quality: 98 };
                        imagePackerApi
                            .packing(imageSourceApi, packOpts)
                            .then((data) => {
                                console.info("testPackingImageSourcePromise002 fail");
                                expect(false).assertTrue();
                                done();
                            })
                            .catch((error) => {
                                console.log("testPackingImageSourcePromise002 success");
                                expect(true).assertTrue();
                                done();
                            });
                    }
                }
            } catch (error) {
                console.info("testPackingImageSourcePromise002 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_PACKING_IMAGESOURCE_PROMISE_003
         * @tc.name      : testPackingImageSourcePromise003
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.call return array
         *                 4.callbackcall return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingImageSourcePromise003", 0, async function (done) {
            try {
                await getFileFd("test.png", testPng);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info("testPackingImageSourcePromise003 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("testPackingImageSourcePromise003 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        let packOpts = { format: "image/jpeg", quality: 101 };
                        imagePackerApi
                            .packing(imageSourceApi, packOpts)
                            .then((data) => {
                                console.info("testPackingImageSourcePromise003 fail");
                                expect(false).assertTrue();
                                done();
                            })
                            .catch((error) => {
                                console.log("testPackingImageSourcePromise003 success");
                                expect(true).assertTrue();
                                done();
                            });
                    }
                }
            } catch (error) {
                console.info("testPackingImageSourcePromise003 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_PACKING_IMAGESOURCE_PROMISE_004
         * @tc.name      : testPackingImageSourcePromise004
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingImageSourcePromise004", 0, async function (done) {
            try {
                await getFileFd("test.png", testPng);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info("testPackingImageSourcePromise004 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("testPackingImageSourcePromise004 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        let packOpts = { format: "image/jpeg", quality: 100 };
                        imagePackerApi
                            .packing(imageSourceApi, packOpts)
                            .then((data) => {
                                console.info("testPackingImageSourcePromise004 success");
                                expect(data != undefined).assertTrue();
                                done();
                            })
                            .catch((error) => {
                                console.log("testPackingImageSourcePromise004 error: " + error);
                                expect(false).assertFail();
                                done();
                            });
                    }
                }
            } catch (error) {
                console.info("testPackingImageSourcePromise004 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_PACKING_IMAGESOURCE_PROMISE_005
         * @tc.name      : testPackingImageSourcePromise005
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingImageSourcePromise005", 0, async function (done) {
            try {
                await getFileFd("test.png", testPng);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info("testPackingImageSourcePromise005 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("testPackingImageSourcePromise005 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        let packOpts = { format: "image/jpeg", quality: 0 };
                        imagePackerApi
                            .packing(imageSourceApi, packOpts)
                            .then((data) => {
                                console.info("testPackingImageSourcePromise005 success");
                                expect(data != undefined).assertTrue();
                                done();
                            })
                            .catch((error) => {
                                console.log("testPackingImageSourcePromise005 error: " + error);
                                expect(false).assertFail();
                                done();
                            });
                    }
                }
            } catch (error) {
                console.info("testPackingImageSourcePromise005 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_PACKING_IMAGESOURCE_PROMISE_006
         * @tc.name      : testPackingImageSourcePromise006
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingImageSourcePromise006", 0, async function (done) {
            try {
                await getFileFd("test.png", testPng);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info("testPackingImageSourcePromise006 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("testPackingImageSourcePromise006 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        let packOpts = { format: "image/jpeg", quality: -1 };
                        imagePackerApi
                            .packing(imageSourceApi, packOpts)
                            .then((data) => {
                                console.info("testPackingImageSourcePromise002 fail");
                                expect(false).assertTrue();
                                done();
                            })
                            .catch((error) => {
                                console.log("testPackingImageSourcePromise002 success");
                                expect(true).assertTrue();
                                done();
                            });
                    }
                }
            } catch (error) {
                console.info("testPackingImageSourcePromise006 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_PACKING_IMAGESOURCE_CB_001
         * @tc.name      : testPackingImageSourceCb001
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingImageSourceCb001", 0, async function (done) {
            try {
                await getFileFd("test.png", testPng);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info("testPackingImageSourceCb001 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("testPackingImageSourceCb001 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        let packOpts = { format: "image/jpeg", quality: 1 };
                        imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
                            console.info(
                                "testPackingImageSourceCb001 success" + JSON.stringify(data)
                            );
                            expect(data != undefined).assertTrue();
                            done();
                        });
                    }
                }
            } catch (error) {
                console.info("testPackingImageSourceCb001 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_PACKING_IMAGESOURCE_CB_002
         * @tc.name      : testPackingImageSourceCb002
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingImageSourceCb002", 0, async function (done) {
            try {
                await getFileFd("test.png", testPng);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info("testPackingImageSourceCb002 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("testPackingImageSourceCb002 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        let packOpts = { format: "image/gif", quality: 98 };
                        imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
                            console.info("testPackingImageSourceCb002 success");
                            expect(data == undefined).assertTrue();
                            done();
                        });
                    }
                }
            } catch (error) {
                console.info("testPackingImageSourceCb002 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_PACKING_IMAGESOURCE_CB_003
         * @tc.name      : testPackingImageSourceCb003
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.call return array
         *                 4.callbackcall return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingImageSourceCb003", 0, async function (done) {
            try {
                await getFileFd("test.png", testPng);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info("testPackingImageSourceCb003 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("testPackingImageSourceCb003 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        let packOpts = { format: "image/jpeg", quality: 101 };
                        imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
                            console.info("testPackingImageSourceCb002 success");
                            expect(data == undefined).assertTrue();
                            done();
                        });
                    }
                }
            } catch (error) {
                console.info("testPackingImageSourceCb003 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_PACKING_IMAGESOURCE_CB_004
         * @tc.name      : testPackingImageSourceCb004
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingImageSourceCb004", 0, async function (done) {
            try {
                await getFileFd("test.png", testPng);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info("testPackingImageSourceCb004 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("testPackingImageSourceCb004 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        let packOpts = { format: "image/jpeg", quality: 100 };
                        imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
                            if (err) {
                                expect(false).assertTrue();
                                console.info("testPackingImageSourceCb004 error: " + err);
                                done();
                                return;
                            }
                            if (data != undefined) {
                                console.info("testPackingImageSourceCb004 success");
                                expect(true).assertTrue();
                                done();
                            } else {
                                expect(false).assertTrue();
                                console.info("testPackingImageSourceCb004 failed");
                                done();
                            }
                        });
                    }
                }
            } catch (error) {
                console.info("testPackingImageSourceCb004 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_PACKING_IMAGESOURCE_CB_005
         * @tc.name      : testPackingImageSourceCb005
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingImageSourceCb005", 0, async function (done) {
            try {
                await getFileFd("test.png", testPng);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info("testPackingImageSourceCb005 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("testPackingImageSourceCb005 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        let packOpts = { format: "image/jpeg", quality: 0 };
                        imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
                            console.info("testPackingImageSourceCb005 success");
                            expect(data != undefined).assertTrue();
                            done();
                        });
                    }
                }
            } catch (error) {
                console.info("testPackingImageSourceCb005 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_PACKING_IMAGESOURCE_CB_006
         * @tc.name      : testPackingImageSourceCb006
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testPackingImageSourceCb006", 0, async function (done) {
            try {
                await getFileFd("test.png", testPng);
                const imageSourceApi = image.createImageSource(fileFd);
                if (imageSourceApi == undefined) {
                    console.info("testPackingImageSourceCb006 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info("testPackingImageSourceCb006 create image packer failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        let packOpts = { format: "image/jpeg", quality: -1 };
                        imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
                            console.info("testPackingImageSourceCb006 success");
                            expect(data == undefined).assertTrue();
                            done();
                        });
                    }
                }
            } catch (error) {
                console.info("testPackingImageSourceCb006 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : TEST_RELEASE_PROMISE_001
         * @tc.name      : testReleasePromise001
         * @tc.desc      : 1.create ImagePacker
         *                 2.call release
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testReleasePromise001", 0, async function (done) {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
                console.info("testReleasePromise001 create image packer failed");
                expect(false).assertTrue();
                done();
            } else {
                imagePackerApi
                    .release()
                    .then(() => {
                        console.info("testReleasePromise001 success");
                        expect(true).assertTrue();
                        done();
                    })
                    .catch((error) => {
                        console.log("testReleasePromise001 error: " + error);
                        expect(false).assertTrue();
                        done();
                    });
            }
        });

        /**
         * @tc.number    : TEST_RELEASE_CB_001
         * @tc.name      : testReleaseCb001
         * @tc.desc      : 1.create ImagePacker
         *                 2.call release
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it("testReleaseCb001", 0, async function (done) {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
                console.info("testReleaseCb001 create image packer failed");
                expect(false).assertTrue();
                done();
            } else {
                imagePackerApi.release(() => {
                    console.info("testReleaseCb001 success");
                    expect(true).assertTrue();
                    done();
                });
            }
        });

        /**
         * @tc.number    : TEST_SUPPORTEDFORMATS_001
         * @tc.name      : testSupportedFormats001
         * @tc.desc      : 1.create imagepacker
         *                 2.call supportedFormats
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testSupportedFormats001', 0, async function (done) {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
                console.info('testSupportedFormats001 create image packer failed');
                expect(false).assertTrue();
                done();
            } else {
                expect(imagePackerApi.supportedFormats != undefined).assertTrue();
                console.info('testSupportedFormats001 success ');
                done();
            }
        })
    });
}
