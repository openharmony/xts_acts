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
import {
    sleep,
    checkPresetsAssets,
    audioNameFetchOps,
    imageVideoNameFetchOps,
    checkAssetsCount,
} from '../../../../../../common';

export default function fileAssetFavoritePromiseTest(abilityContext) {
    describe('fileAssetFavoritePromiseTest', function () {
        var userfilemgr = userFileManager.getUserFileMgr(abilityContext);
        beforeAll(async function () {
            console.info('beforeAll case');
            await checkPresetsAssets(userfilemgr, 'ActsUserFileMgrFavorite');
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

        const favoriteDefaultState = async function (done, testNum, fetchOp, isAudio) {
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
                let isFavorite = await asset.isFavorite();
                expect(isFavorite).assertEqual(false);
                fetchAssetResult.close();
                done()
            } catch (error) {
                console.info(`${testNum} failed error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        }
        const favoriteByTrue = async function (done, testNum, fetchOp, isAudio) {
            try {
                let fetchAssetResult;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(fetchOp);
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOp);
                }
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, 1);
                if (!checkAssetCountPass) return;
                const asset = await fetchAssetResult.getFirstObject();
                await asset.favorite(true);
                let isFavorite = await asset.isFavorite();
                expect(isFavorite).assertEqual(true);
                fetchAssetResult.close();
                done();
            } catch (error) {
                console.info(`${testNum} failed error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        }
        const favoriteByFalse = async function (done, testNum, fetchOp, isAudio) {
            try {
                let fetchAssetResult;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(fetchOp);
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOp);
                }
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, 1);
                if (!checkAssetCountPass) return;
                const asset = await fetchAssetResult.getFirstObject();
                await asset.favorite(true);
                await asset.favorite(false);
                let isFavorite = await asset.isFavorite();
                expect(isFavorite).assertEqual(false);
                fetchAssetResult.close();
                done();
            } catch (error) {
                console.info(`${testNum} failed error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_01_001
         * @tc.name      : isFavorite
         * @tc.desc      : isFavorite(image) result false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_01_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_01_001';
            let currentFetchOp = imageVideoNameFetchOps(testNum, 'Pictures/FavPro/', '01.jpg');
            let isAudio = false;
            await favoriteDefaultState(done, testNum, currentFetchOp, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_01_002
         * @tc.name      : favorite
         * @tc.desc      : favorite(image) by true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_01_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_01_002';
            let currentFetchOp = imageVideoNameFetchOps(testNum, 'Pictures/FavPro/', '02.jpg');
            let isAudio = false;
            await favoriteByTrue(done, testNum, currentFetchOp, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_01_003
         * @tc.name      : favorite
         * @tc.desc      : favorite(image) by false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_01_003', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_01_003';
            let currentFetchOp = imageVideoNameFetchOps(testNum, 'Pictures/FavPro/', '03.jpg');
            let isAudio = false;
            await favoriteByFalse(done, testNum, currentFetchOp, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_02_001
         * @tc.name      : isFavorite
         * @tc.desc      : isFavorite(audio) result false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_02_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_02_001';
            let currentFetchOp = audioNameFetchOps(testNum, 'Audios/FavPro/', '01.mp3');
            let isAudio = true;
            await favoriteDefaultState(done, testNum, currentFetchOp, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_02_002
         * @tc.name      : favorite
         * @tc.desc      : favorite(audio) by true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_02_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_02_002';
            let currentFetchOp = audioNameFetchOps(testNum, 'Audios/FavPro/', '02.mp3');
            let isAudio = true;
            await favoriteByTrue(done, testNum, currentFetchOp, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_03_003
         * @tc.name      : favorite
         * @tc.desc      : favorite(audio) by false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_03_003', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_03_003';
            let currentFetchOp = audioNameFetchOps(testNum, 'Audios/FavPro/', '03.mp3');
            let isAudio = true;
            await favoriteByFalse(done, testNum, currentFetchOp, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_03_001
         * @tc.name      : isFavorite
         * @tc.desc      : isFavorite(video) result false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_03_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_03_001';
            let currentFetchOp = imageVideoNameFetchOps(testNum, 'Videos/FavPro/', '01.mp4');
            let isAudio = false;
            await favoriteDefaultState(done, testNum, currentFetchOp, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_03_002
         * @tc.name      : favorite
         * @tc.desc      : favorite(video) by true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_03_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_03_002';
            let currentFetchOp = imageVideoNameFetchOps(testNum, 'Videos/FavPro/', '02.mp4');
            let isAudio = false;
            await favoriteByTrue(done, testNum, currentFetchOp, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_03_003
         * @tc.name      : favorite
         * @tc.desc      : favorite(video) by false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_03_003', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_FAVORITE_PROMISE_03_003';
            let currentFetchOp = imageVideoNameFetchOps(testNum, 'Videos/FavPro/', '03.mp4');
            let isAudio = false;
            await favoriteByFalse(done, testNum, currentFetchOp, isAudio);
        });
    });
}
