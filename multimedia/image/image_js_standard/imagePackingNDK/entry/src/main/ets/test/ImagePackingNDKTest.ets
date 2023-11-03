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

import image from "@ohos.multimedia.image";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index';
import featureAbility from "@ohos.ability.featureAbility";
import fileio from "@ohos.fileio";
import ndkTest from 'libImagePackingNDKTest.so';

export default function ImagePackingNDKTest() {
    describe('ImagePackingNDKTest', function () {
        const CODE_SUCCESS = 0;
        beforeAll(function () {
            console.info('beforeAll case');
        })

        beforeEach(function () {
            console.info('beforeEach case');
        })

        afterEach(function () {
            console.info('afterEach case');
        })

        afterAll(function () {
            console.info('afterAll case');
        })
        function logger(caseName) {
            return {
                myName: caseName,
                log: function (msg) {
                    console.info(this.myName + ' ' + msg);
                }
            }
        }

        async function getPath(fileName: string) {
            let filePath = ""
            try {
                let context = await featureAbility.getContext();
                await context.getFilesDir().then((data) => {
                    filePath = data + "/" + fileName;
                });
                console.info("image case filePath is " + filePath);
            } catch (error) {
                console.info("image getFd " + error);
            }
            return filePath;
        }
        async function getFd(fileName) {
            let fdNumber = undefined;
            let filePath = undefined;
            try {
                filePath = await getPath(fileName);
                console.info("image case filePath is " + filePath);
                await fileio.open(filePath, 0o2, 0o777).then((data) => {
                    fdNumber = data;
                    console.info("image case open fd success " + fdNumber);
                }, (err) => {
                    console.info("image case open fd fail" + err);
                }).catch((err) => {
                    console.info("image case open fd err " + err);
                });
            } catch (error) {
                console.info("image getFd1111 " + error);
            }
            return [filePath, fdNumber];
        }

        async function getWriteFd(fileName) {
            let fdNumber = undefined;
            let filePath = undefined;
            try {
                let context = await featureAbility.getContext();
                await context.getCacheDir().then((data) => {
                    filePath = data + "/" + fileName;
                });
                console.info("image getWriteFd filePath is " + filePath);
                fdNumber = fileio.openSync(filePath, 0o102, 0o666);
                console.log(`getWriteFd fd: ${JSON.stringify(fdNumber)}`);
                if (fdNumber !== null) {
                    console.info("getWriteFd file fd created");
                } else {
                    console.info("getWriteFd file fd created error");
                }

                fdNumber = fileio.openSync(filePath, 0o2002, 0o666);
                console.log(`getWriteFd fd-re: ${JSON.stringify(fdNumber)}`);
                if (fdNumber !== null) {
                    console.info("getWriteFd file fd opened : Append Mode");
                } else {
                    console.info("getWriteFd file fd opened : Append Mode failed");
                }
            } catch (error) {
                console.info("image getWriteFd " + error);
            }
            return [filePath, fdNumber];
        }

        function checkNdkRes(res) {
            expect(res != undefined).assertTrue();
            expect(res.code == CODE_SUCCESS).assertTrue();
        }

        async function createTestImageSource(picName) {
            let path = await getPath(picName);
            return image.createImageSource(path);
        }

        async function createTestPixelMap() {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } };
            return await image.createPixelMap(Color, opts)
        }

        async function createTest(done, testNum) {
            try {
                let log = logger(testNum);
                let packer = ndkTest.create()
                checkNdkRes(packer)
                expect(packer.result != undefined).assertTrue();
                log.log("packer create finished");
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }

        async function nativeInitTest(done, testNum) {
            try {
                let log = logger(testNum);
                let packer = ndkTest.create()
                if (packer == undefined || packer.code != CODE_SUCCESS || packer.result == undefined) {
                    log.log("packer create failed");
                    expect().assertFail();
                    done();
                    return
                }
                let initRes = ndkTest.initNative(packer.result);
                checkNdkRes(initRes);
                log.log("packer init native finished");
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }

        async function packToDataTest(done, testNum, source, packOpts) {
            try {
                let log = logger(testNum);
                let packer = ndkTest.create()
                if (packer == undefined || packer.code != CODE_SUCCESS || packer.result == undefined) {
                    log.log("packer create failed");
                    expect().assertFail();
                    done();
                    return
                }
                let packingRes = ndkTest.packToData(packer.result, source, packOpts);
                checkNdkRes(packingRes);
                expect(packingRes.result != undefined).assertTrue();
                log.log("packer packingRes.result " + JSON.stringify(new Uint8Array(packingRes.result).length));
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }

        async function packToFileTest(done, testNum, source, writeFd, packOpts) {
            try {
                let log = logger(testNum);
                let packer = ndkTest.create()
                if (packer == undefined || packer.code != CODE_SUCCESS || packer.result == undefined) {
                    log.log("packer create failed");
                    expect().assertFail();
                    done();
                    return
                }
                let packingRes = ndkTest.packToFile(packer.result, source, writeFd, packOpts);
                log.log(`packingRes : ${JSON.stringify(packingRes)}`)
                checkNdkRes(packingRes);
                ndkTest.release(packer.result);
                packer.result.release();
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }

        async function releaseTest(done, testNum) {
            try {
                let log = logger(testNum);
                let packer = ndkTest.create()
                if (packer == undefined || packer.code != CODE_SUCCESS || packer.result == undefined) {
                    log.log("packer create failed");
                    expect().assertFail();
                    done();
                    return
                }

                let releaseRes = ndkTest.release(packer.result);
                checkNdkRes(releaseRes);
                log.log("release result " + releaseRes.code);
                done();
            } catch (error) {
                console.error("Test exception " + error);
                expect().assertFail();
                done();
            }
        }

        /**
         * @tc.number    : IMAGE_PACKINGNDK_CREAT
         * @tc.name      : image packingndk create
         * @tc.desc      : 1.packingtestndk create
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('IMAGE_PACKINGNDK_CREAT', 0, async function (done) {
            await createTest(done, "IMAGE_PACKINGNDK_CREAT");
            done();
        })

        /**
         * @tc.number    : IMAGE_PACKINGNDK_INIT_NATIVE
         * @tc.name      : image packingndk native init
         * @tc.desc      : 1.packingtestndk create
         *                 2.packingtestndk native init
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('IMAGE_PACKINGNDK_INIT_NATIVE', 0, async function (done) {
            await nativeInitTest(done, "IMAGE_PACKINGNDK_INIT_NATIVE");
            done();
        })

        /**
         * @tc.number    : IMAGE_PACKINGNDK_PACKING_IMAGE_SOURCE
         * @tc.name      : image packingndk pack image source to array buffer
         * @tc.desc      : 1.packingtestndk create
         *                 2.packing image source to array buffer
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('IMAGE_PACKINGNDK_PACKING_IMAGE_SOURCE', 0, async function (done) {
            let source = await createTestImageSource("test.png")
            expect(source != undefined).assertTrue();
            let packOpts = { format: "image/jpeg", quality: 100 };
            await packToDataTest(done, "IMAGE_PACKINGNDK_PACKING_IMAGE_SOURCE", source, packOpts)
            await source.release()
            done();
        })

        /**
         * @tc.number    : IMAGE_PACKINGNDK_PACKING_PIXEL_MAP
         * @tc.name      : image packingndk pack pixelmap to array buffer
         * @tc.desc      : 1.packingtestndk create
         *                 2.packing pixelmap to array buffer
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('IMAGE_PACKINGNDK_PACKING_PIXEL_MAP', 0, async function (done) {
            let source = await createTestPixelMap()
            expect(source != undefined).assertTrue();
            let packOpts = { format: "image/jpeg", quality: 100 };
            await packToDataTest(done, "IMAGE_PACKINGNDK_PACKING_PIXEL_MAP", source, packOpts)
            done();
        })

        /**
         * @tc.number    : IMAGE_PACKINGNDK_PACKING_IMAGE_SOURCE_TO_FILE
         * @tc.name      : image packingndk pack image source into a writtable file
         * @tc.desc      : 1.packingtestndk create
         *                 2.packing image source into a writtable file
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('IMAGE_PACKINGNDK_PACKING_IMAGE_SOURCE_TO_FILE', 0, async function (done) {
            let log = logger("IMAGE_PACKINGNDK_PACKING_IMAGE_SOURCE");
            let source = await createTestImageSource("test.png")
            expect(source != undefined).assertTrue();

            let path, fd;
            [path, fd] = await getWriteFd("test_write_image_source.jpg")
            expect(fd != undefined).assertTrue();
            let packOpts = { format: "image/jpeg", quality: 100 };
            await packToFileTest(done, "IMAGE_PACKINGNDK_PACKING_IMAGE_SOURCE", source, fd, packOpts)
            fileio.closeSync(fd)
            log.log(`${JSON.stringify(fileio.statSync(path).size)}`)
            done();
        })

        /**
         * @tc.number    : IMAGE_PACKINGNDK_PACKING_PIXEL_MAP_TO_FILE
         * @tc.name      : image packingndk pack pixelmap into a writtable file
         * @tc.desc      : 1.packingtestndk create
         *                 2.packing pixelmap into a writtable file
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('IMAGE_PACKINGNDK_PACKING_PIXEL_MAP_TO_FILE', 0, async function (done) {
            let log = logger("IMAGE_PACKINGNDK_PACKING_PIXEL_MAP_TO_FILE");
            let source = await createTestPixelMap()
            expect(source != undefined).assertTrue();
            let path, fd;
            [path, fd] = await getWriteFd("test_write_pixel_map.jpg")
            expect(fd != undefined).assertTrue();
            let packOpts = { format: "image/jpeg", quality: 100 };
            await packToFileTest(done, "IMAGE_PACKINGNDK_PACKING_PIXEL_MAP", source, fd, packOpts)
            fileio.closeSync(fd)
            log.log(`${JSON.stringify(fileio.statSync(path).size)}`)
            done();
        })

        /**
         * @tc.number    : IMAGE_PACKINGNDK_RELEASE
         * @tc.name      : image packingndk native release
         * @tc.desc      : 1.packingtestndk create
         *                 2.packingtestndk native release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('IMAGE_PACKINGNDK_RELEASE', 0, async function (done) {
            await releaseTest(done, "IMAGE_PACKINGNDK_RELEASE");
            done();
        })
    })
}