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

import userFileManager from '@ohos.filemanagement.userFileManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';
import image from '@ohos.multimedia.image';
import {
    sleep,
    checkPresetsAssets,
    checkAssetsCount,
    audioNameFetchOps,
    imageVideoNameFetchOps,
} from '../../../../../../common';

export default function fileAssetGetThumbnailPromiseTest(abilityContext) {
    describe('fileAssetGetThumbnailPromiseTest', function () {
        image.createPixelMap(new ArrayBuffer(4096), { size: { height: 1, width: 2 } }).then((pixelmap) => { });
        const userfilemgr = userFileManager.getUserFileMgr(abilityContext);
        beforeAll(async function () {
            console.info('beforeAll case');
            await checkPresetsAssets(userfilemgr, 'ActsUserFileMgrGetThumbnailTest');
        });
        beforeEach(function () {
            console.info('beforeEach case');
        });
        afterEach(async function () {
            console.info('afterEach case');
            await sleep()
        });
        afterAll(function () {
            console.info('afterAll case');
        });

        async function getThumbnailTest(done, testNum, fetchOp, size, isAudio) {
            try {
                let fetchAssetResult;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(fetchOp);
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOp);
                }
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, 1);
                if (!checkAssetCountPass) return;
                let asset = await fetchAssetResult.getFirstObject();
                fetchAssetResult.close();
                console.info(`${testNum}:displayName ${asset.displayName}`)
                let pixelmap;
                if (size == 'default') {
                    size = { width: 256, height: 256 };
                    pixelmap = await asset.getThumbnail()
                } else {
                    pixelmap = await asset.getThumbnail(size)
                }
                let info = await pixelmap.getImageInfo();
                console.info(`${testNum}:: width :${info.size.width} height :${info.size.height}`);
                size.width = (size.width == undefined) ? 256 : Math.floor(size.width);
                size.height = (size.height == undefined) ? 256 : Math.floor(size.height);
                expect(info.size.width).assertEqual(size.width);
                expect(info.size.height).assertEqual(size.height);
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function getThumbnailErrorSizeTest(done, testNum, fetchOp, size, isAudio) {
            try {
                let fetchAssetResult;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(fetchOp);
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOp);
                }
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, 1);
                if (!checkAssetCountPass) return;
                let asset = await fetchAssetResult.getFirstObject();
                fetchAssetResult.close();
                try {
                    let pixelmap;
                    if (size == 'default') {
                        size = { width: 256, height: 256 };
                        pixelmap = await asset.getThumbnail()
                    } else {
                        pixelmap = await asset.getThumbnail(size)
                    }
                    expect(false).assertTrue();
                    done();
                } catch (err) {
                    console.info(`${testNum}:: error :${err}`);
                    expect(true).assertTrue();
                    done();
                }
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_001
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by no arg
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_001', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_001';
            let dOp = imageVideoNameFetchOps(testNum, 'Pictures/Thumbnail/', '01.jpg');
            let size = 'default';
            let isAudio = false;
            await getThumbnailTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_002
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by { width: 128, height: 128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_002', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_002';
            let dOp = imageVideoNameFetchOps(testNum, 'Pictures/Thumbnail/', '02.jpg');
            let size = { width: 128, height: 128 };
            let isAudio = false;
            await getThumbnailTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_003
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by { width: 128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_003', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_003';
            let dOp = imageVideoNameFetchOps(testNum, 'Pictures/Thumbnail/', '02.jpg');
            let size = { width: 128 };
            let isAudio = false;
            await getThumbnailTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_004
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by { height: 128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_004', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_004';
            let dOp = imageVideoNameFetchOps(testNum, 'Pictures/Thumbnail/', '02.jpg');
            let size = { height: 128 };
            let isAudio = false;
            await getThumbnailTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_005
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by { width: 1, height: 1 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_005', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_005';
            let dOp = imageVideoNameFetchOps(testNum, 'Pictures/Thumbnail/', '02.jpg');
            let size = { width: 1, height: 1 };
            let isAudio = false;
            await getThumbnailTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_006
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by { width: 1.1, height: 1.1 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_006', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_006';
            let dOp = imageVideoNameFetchOps(testNum, 'Pictures/Thumbnail/', '02.jpg');
            let size = { width: 1.1, height: 1.1 };
            let isAudio = false;
            await getThumbnailTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_007
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by { width: 0, height: 0 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_007', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_007';
            let dOp = imageVideoNameFetchOps(testNum, 'Pictures/Thumbnail/', '02.jpg');
            let size = { width: 0, height: 0 };
            let isAudio = false;
            await getThumbnailErrorSizeTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_008
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by { width: -128, height: -128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_008', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_01_008';
            let dOp = imageVideoNameFetchOps(testNum, 'Pictures/Thumbnail/', '02.jpg');
            let size = { width: -128, height: -128 };
            let isAudio = false;
            await getThumbnailErrorSizeTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_001
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by no arg
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_001', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_001';
            let dOp = imageVideoNameFetchOps(testNum, 'Videos/Thumbnail/', '01.mp4');
            let size = 'default';
            let isAudio = false;
            await getThumbnailTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_002
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { width: 128, height: 128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_002', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_002';
            let dOp = imageVideoNameFetchOps(testNum, 'Videos/Thumbnail/', '02.mp4');
            let size = { width: 128, height: 128 };
            let isAudio = false;
            await getThumbnailTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_003
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { width: 128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_003', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_003';
            let dOp = imageVideoNameFetchOps(testNum, 'Videos/Thumbnail/', '02.mp4');
            let size = { width: 128 };
            let isAudio = false;
            await getThumbnailTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_004
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { height: 128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_004', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_004';
            let dOp = imageVideoNameFetchOps(testNum, 'Videos/Thumbnail/', '02.mp4');
            let size = { height: 128 };
            let isAudio = false;
            await getThumbnailTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_005
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { width: 1, height: 1 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_005', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_005';
            let dOp = imageVideoNameFetchOps(testNum, 'Videos/Thumbnail/', '02.mp4');
            let size = { width: 1, height: 1 };
            let isAudio = false;
            await getThumbnailTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_006
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { width: 1.1, height: 1.1 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_006', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_006';
            let dOp = imageVideoNameFetchOps(testNum, 'Videos/Thumbnail/', '02.mp4');
            let size = { width: 1.1, height: 1.1 };
            let isAudio = false;
            await getThumbnailTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_007
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { width: 0, height: 0 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_007', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_007';
            let dOp = imageVideoNameFetchOps(testNum, 'Videos/Thumbnail/', '02.mp4');
            let size = { width: 0, height: 0 };
            let isAudio = false;
            await getThumbnailErrorSizeTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_008
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { width: -128, height: -128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_008', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_02_008';
            let dOp = imageVideoNameFetchOps(testNum, 'Videos/Thumbnail/', '02.mp4');
            let size = { width: -128, height: -128 };
            let isAudio = false;
            await getThumbnailErrorSizeTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_001
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by no arg
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_001', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_001';
            let dOp = audioNameFetchOps(testNum, 'Audios/Thumbnail/', '01.mp3');
            let size = 'default';
            let isAudio = true;
            await getThumbnailTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_002
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: 128, height: 128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_002', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_002';
            let dOp = audioNameFetchOps(testNum, 'Audios/Thumbnail/', '02.mp3');
            let size = { width: 128, height: 128 };
            let isAudio = true;
            await getThumbnailTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_003
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: 128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_003', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_003';
            let dOp = audioNameFetchOps(testNum, 'Audios/Thumbnail/', '02.mp3');
            let size = { width: 128 };
            let isAudio = true;
            await getThumbnailTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_004
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { height: 128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_004', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_004';
            let dOp = audioNameFetchOps(testNum, 'Audios/Thumbnail/', '02.mp3');
            let size = { height: 128 };
            let isAudio = true;
            await getThumbnailTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_005
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: 1, height: 1 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_005', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_005';
            let dOp = audioNameFetchOps(testNum, 'Audios/Thumbnail/', '02.mp3');
            let size = { width: 1, height: 1 };
            let isAudio = true;
            await getThumbnailTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_006
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: 1.1, height: 1.1 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_006', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_006';
            let dOp = audioNameFetchOps(testNum, 'Audios/Thumbnail/', '02.mp3');
            let size = { width: 1.1, height: 1.1 };
            let isAudio = true;
            await getThumbnailTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_007
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: 0, height: 0 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_007', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_007';
            let dOp = audioNameFetchOps(testNum, 'Audios/Thumbnail/', '02.mp3');
            let size = { width: 0, height: 0 };
            let isAudio = true;
            await getThumbnailErrorSizeTest(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_008
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: -128, height: -128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_008', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_PROMISE_03_008';
            let dOp = audioNameFetchOps(testNum, 'Audios/Thumbnail/', '02.mp3');
            let size = { width: -128, height: -128 };
            let isAudio = true;
            await getThumbnailErrorSizeTest(done, testNum, dOp, size, isAudio);
        });
    });
}

