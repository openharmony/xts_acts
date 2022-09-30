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
import userfile_manager from '@ohos.filemanagement.userfile_manager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';

import {
    sleep,
    IMAGE_TYPE,
    VIDEO_TYPE,
    AUDIO_TYPE,
    FILEKEY,
    allFetchOp,
    albumFetchOps,
    checkPresetsAssets,
    checkAssetsCount,
} from '../../../../../../common';

export default function albumGetFileAssetsCallback(abilityContext) {
    describe('albumGetFileAssetsCallback', function () {
        const userfile_mgr = userfile_manager.getUserFileMgr(abilityContext);
        beforeAll(async function () {
            console.info('beforeAll case');
            await checkPresetsAssets(userfile_mgr, 'ActsUserFileMgrAlbumJsTest');
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

        const checkAlbumAssetsCount = async function (done, testNum, media_type, fetchOp, expectAssetsCount, expectAlbumCount = 1) {
            try {
                const fetchAlbumResult = await userfile_mgr.getAlbums(media_type, fetchOp);
                const albumCountPass = await checkAssetsCount(done, testNum, fetchAlbumResult, expectAlbumCount);
                if (!albumCountPass) return;
                const album = await fetchAlbumResult.getFirstObject();
                album.getFileAssets(media_type, allFetchOp(), (error, fetchFileResult) => {
                    if (error != undefined) {
                        console.info(`${testNum} getFileAssets error: ${error}`);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info(`${testNum}, getCount: ${fetchFileResult.getCount()} 
                        expectAssetsCount: ${expectAssetsCount}`);
                    expect(fetchFileResult.getCount()).assertEqual(expectAssetsCount);
                    done();
                });
            } catch (error) {
                console.info(`${testNum}, error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_USERFILE_MGR_ALBUM_GETFILEASSETS_CALLBACK_01
         * @tc.name      : getFileAssets
         * @tc.desc      : Album getFileAssets in IMAGE_TYPE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_ALBUM_GETFILEASSETS_CALLBACK_01', 0, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_ALBUM_GETFILEASSETS_CALLBACK_01';
            let media_type = [IMAGE_TYPE];
            let currentFetchOp = albumFetchOps(testNum, 'Pictures/', 'Static');
            let assetsCount = 1;
            await checkAlbumAssetsCount(done, testNum, media_type, currentFetchOp, assetsCount);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_ALBUM_GETFILEASSETS_CALLBACK_02
         * @tc.name      : getFileAssets
         * @tc.desc      : Album getFileAssets in AUDIO_TYPE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_ALBUM_GETFILEASSETS_CALLBACK_02', 0, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_ALBUM_GETFILEASSETS_CALLBACK_02';
            let media_type = [AUDIO_TYPE];
            let currentFetchOp = albumFetchOps(testNum, 'Audios/', 'Static');
            let assetsCount = 1;
            await checkAlbumAssetsCount(done, testNum, media_type, currentFetchOp, assetsCount);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_ALBUM_GETFILEASSETS_CALLBACK_03
         * @tc.name      : getFileAssets
         * @tc.desc      : Album getFileAssets in VIDEO_TYPE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_ALBUM_GETFILEASSETS_CALLBACK_03', 0, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_ALBUM_GETFILEASSETS_CALLBACK_03';
            let media_type = [VIDEO_TYPE];
            let currentFetchOp = albumFetchOps(testNum, 'Videos/', 'Static');
            let assetsCount = 1;
            await checkAlbumAssetsCount(done, testNum, media_type, currentFetchOp, assetsCount);
        });
    });
}