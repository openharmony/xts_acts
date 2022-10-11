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
export default function fileAssetGetThumbnailCallbackTest(abilityContext) {
    describe('fileAssetGetThumbnailCallbackTest', function () {
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

        async function testGetThumbnail(done, testNum, fetchOp, size, isAudio) {
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
                if (size == 'default') {
                    size = { width: 256, height: 256 };
                    asset.getThumbnail(async (err, pixelmap) => {
                        if (err != undefined) {
                            console.info(`${testNum}:: err1 :${err}`);
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        await pixelmap.getImageInfo((err, info) => {
                            if (err != undefined) {
                                console.info(`${testNum}:: err2 :${err}`);
                                expect(false).assertTrue();
                                done();
                                return;
                            }
                            console.info(`${testNum}:: width :${info.size.width} height :${info.size.height}`);
                            expect(info.size.width).assertEqual(size.width);
                            expect(info.size.height).assertEqual(size.height);
                            done();
                        });
                    })
                } else {
                    asset.getThumbnail(size, async (err, pixelmap) => {
                        if (err != undefined) {
                            console.info(`${testNum}:: err1 :${err}`);
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        await pixelmap.getImageInfo((err, info) => {
                            if (err != undefined) {
                                console.info(`${testNum}:: err2 :${err}`);
                                expect(false).assertTrue();
                                done();
                                return;
                            }
                            console.info(`${testNum}:: width :${info.size.width} height :${info.size.height}`);
                            expect(info.size.width).assertEqual(size.width);
                            expect(info.size.height).assertEqual(size.height);
                            done();
                        });
                    })
                }
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_CALLBACK_01_001
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by no arg
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_CALLBACK_01_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_CALLBACK_01_001';
            let dOp = imageVideoNameFetchOps(testNum, 'Pictures/Thumbnail/', '01.jpg');
            let size = 'default';
            let isAudio = false;
            await testGetThumbnail(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_CALLBACK_01_002
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(image) by { width: 128, height: 128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_CALLBACK_01_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_CALLBACK_01_002';
            let dOp = imageVideoNameFetchOps(testNum, 'Pictures/Thumbnail/', '02.jpg');
            let size = { width: 128, height: 128 };
            let isAudio = false;
            await testGetThumbnail(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_CALLBACK_02_001
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by no arg
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_CALLBACK_02_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_CALLBACK_02_001';
            let dOp = audioNameFetchOps(testNum, 'Audios/Thumbnail/', '01.mp3');
            let size = 'default';
            let isAudio = true;
            await testGetThumbnail(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_CALLBACK_02_002
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(audio) by { width: 128, height: 128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_CALLBACK_02_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_CALLBACK_02_002';
            let dOp = audioNameFetchOps(testNum, 'Audios/Thumbnail/', '02.mp3');
            let size = { width: 128, height: 128 };
            let isAudio = true;
            await testGetThumbnail(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_CALLBACK_03_001
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by no arg
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_CALLBACK_03_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_CALLBACK_03_001';
            let dOp = imageVideoNameFetchOps(testNum, 'Videos/Thumbnail/', '01.mp4');
            let size = 'default';
            let isAudio = false;
            await testGetThumbnail(done, testNum, dOp, size, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_CALLBACK_03_002
         * @tc.name      : getThumbnail
         * @tc.desc      : getThumbnail(video) by { width: 128, height: 128 }
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_CALLBACK_03_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_GETTHUMBNAIL_CALLBACK_03_002';
            let dOp = imageVideoNameFetchOps(testNum, 'Videos/Thumbnail/', '02.mp4');
            let size = { width: 128, height: 128 };
            let isAudio = false;
            await testGetThumbnail(done, testNum, dOp, size, isAudio);
        });
    });
}

