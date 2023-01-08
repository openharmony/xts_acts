/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import mediaLibrary from "@ohos.multimedia.mediaLibrary";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index";
import image from "@ohos.multimedia.image";
import {
    sleep,
    IMAGE_TYPE,
    VIDEO_TYPE,
    AUDIO_TYPE,
    checkAssetsCount,
    fetchOps,
    getPermission,
} from "../../../../../../common";

export default function getThumbnailPromise(abilityContext) {
    describe("getThumbnailPromise", function () {
        image.createPixelMap(new ArrayBuffer(4096), { size: { height: 1, width: 2 } }).then((pixelmap) => {});
        const media = mediaLibrary.getMediaLibrary(abilityContext);
        beforeAll(async function () {
            console.info("beforeAll case");
        });
        beforeEach(function () {
            console.info("beforeEach case");
        });
        afterEach(async function () {
            console.info("afterEach case");
            await sleep();
        });
        afterAll(function () {
            console.info("afterAll case");
        });

        async function testGetThumbnail(done, testNum, dOp, size) {
            try {
                let fetchFileResult = await media.getFileAssets(dOp);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 1);
                if (!checkAssetCountPass) return;
                let asset = await fetchFileResult.getFirstObject();
                console.info(`${testNum}:displayName ${asset.displayName}`);
                let pixelmap;
                if (size == "default") {
                    size = { width: 256, height: 256 };
                    pixelmap = await asset.getThumbnail();
                } else {
                    pixelmap = await asset.getThumbnail(size);
                }
                let info = await pixelmap.getImageInfo();
                expect(info.size.width).assertEqual(size.width);
                expect(info.size.height).assertEqual(size.height);
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function testGetThumbnailError(done, testNum, dOp, size) {
            try {
                let fetchFileResult = await media.getFileAssets(dOp);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 1);
                if (!checkAssetCountPass) return;
                let asset = await fetchFileResult.getFirstObject();

                try {
                    let s: mediaLibrary.Size = size;
                    let pixelmap = await asset.getThumbnail(s);
                    let info = await pixelmap.getImageInfo();
                    console.info(`${testNum}:: pixel width ${info.size.width},pixel height: ${info.size.height}`);
                    expect(false).assertTrue();
                    fetchFileResult.close();
                    done();
                } catch (error) {
                    console.info(`${testNum}:: error :${error}`);
                    expect(true).assertTrue();
                    fetchFileResult.close();
                    done();
                }
                
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        // ------------------------------ image type start -----------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_01
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by { width: 128, height: 128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_01";
            let dOp = fetchOps(testNum, "Pictures/Thumbnail/", IMAGE_TYPE);
            let size = { width: 128, height: 128 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_02
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by { width: 128, height: 256 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_02";
            let dOp = fetchOps(testNum, "Pictures/Thumbnail/", IMAGE_TYPE);
            let size = { width: 128, height: 256 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_03
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by no arg
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_03";
            let dOp = fetchOps(testNum, "Pictures/Thumbnail/", IMAGE_TYPE);
            let size = "default";
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_04
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by { width: 1, height: 1 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_04", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_04";
            let dOp = fetchOps(testNum, "Pictures/Thumbnail/", IMAGE_TYPE);
            let size = { width: 1, height: 1 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_05
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by { width: 1024, height: 1024 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_05", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_05";
            let dOp = fetchOps(testNum, "Pictures/Thumbnail/", IMAGE_TYPE);
            let size = { width: 0, height: 0 };
            await testGetThumbnailError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_06
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by { width: -128, height: -128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_06", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_06";
            let dOp = fetchOps(testNum, "Pictures/Thumbnail/", IMAGE_TYPE);
            let size = { width: -128, height: -128 };
            await testGetThumbnailError(done, testNum, dOp, size);
        });
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_07
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: 1024, height: 1024 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_07", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_001_07";
            let dOp = fetchOps(testNum, "Pictures/Thumbnail/", IMAGE_TYPE);
            let size = { width: 1024, height: 1024 };
            await testGetThumbnail(done, testNum, dOp, size);
        });
        // ------------------------------image type end--------------------------

        // ------------------------------video type start -----------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_01
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { width: 128, height: 128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_01";
            let dOp = fetchOps(testNum, "Videos/Thumbnail/", VIDEO_TYPE);
            let size = { width: 128, height: 128 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_02
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { width: 128, height: 256 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_02";
            let dOp = fetchOps(testNum, "Videos/Thumbnail/", VIDEO_TYPE);
            let size = { width: 128, height: 256 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_03
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by no arg
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_03";
            let dOp = fetchOps(testNum, "Videos/Thumbnail/", VIDEO_TYPE);
            let size = "default";
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_04
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { width: 1, height: 1 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_04", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_04";
            let dOp = fetchOps(testNum, "Videos/Thumbnail/", VIDEO_TYPE);
            let size = { width: 1, height: 1 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_05
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { width: 0, height: 0 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_05", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_05";
            let dOp = fetchOps(testNum, "Videos/Thumbnail/", VIDEO_TYPE);
            let size = { width: 0, height: 0 };
            await testGetThumbnailError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_06
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { width: -128, height: -128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_06", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_06";
            let dOp = fetchOps(testNum, "Videos/Thumbnail/", VIDEO_TYPE);
            let size = { width: -128, height: -128 };
            await testGetThumbnailError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_07
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { width: 1024, height: 1024 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_07", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_002_07";
            let dOp = fetchOps(testNum, "Videos/Thumbnail/", VIDEO_TYPE);
            let size = { width: 1024, height: 1024 };
            await testGetThumbnail(done, testNum, dOp, size);
        });
        // ------------------------------video type end--------------------------

        // ------------------------------audio type start -----------------------
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_01
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: 128, height: 128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_01", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_01";
            let dOp = fetchOps(testNum, "Audios/Thumbnail/", AUDIO_TYPE);
            let size = { width: 128, height: 128 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_02
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: 128, height: 256 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_02", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_02";
            let dOp = fetchOps(testNum, "Audios/Thumbnail/", AUDIO_TYPE);
            let size = { width: 128, height: 256 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_03
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by no arg
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_03", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_03";
            let dOp = fetchOps(testNum, "Audios/Thumbnail/", AUDIO_TYPE);
            let size = "default";
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_04
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: 1, height: 1 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_04", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_04";
            let dOp = fetchOps(testNum, "Audios/Thumbnail/", AUDIO_TYPE);
            let size = { width: 1, height: 1 };
            await testGetThumbnail(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_05
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: 0, height: 0 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_05", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_05";
            let dOp = fetchOps(testNum, "Audios/Thumbnail/", AUDIO_TYPE);
            let size = { width: 0, height: 0 };
            await testGetThumbnailError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_06
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: -128, height: -128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_06", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_06";
            let dOp = fetchOps(testNum, "Audios/Thumbnail/", AUDIO_TYPE);
            let size = { width: -128, height: -128 };
            await testGetThumbnailError(done, testNum, dOp, size);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_07
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: 1024, height: 1024 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_07", 0, async function (done) {
            let testNum = "SUB_MEDIA_MEDIALIBRARY_GETTHUMBNAIL_PROMISE_003_07";
            let dOp = fetchOps(testNum, "Audios/Thumbnail/", AUDIO_TYPE);
            let size = { width: 1024, height: 1024 };
            await testGetThumbnail(done, testNum, dOp, size);
        });
        // ------------------------------audio type end--------------------------
    });
}
