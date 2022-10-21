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
    THROW_ERROR_CODE,
    allFetchOp,
    albumFetchOps,
    checkPresetsAssets,
    checkAssetsCount,
} from '../../../../../../common';

export default function albumGetFileAssetsPromise(abilityContext) {
    describe('albumGetFileAssetsPromise', function () {
        const userfilemgr = userFileManager.getUserFileMgr(abilityContext);
        beforeAll(async function () {
            console.info('beforeAll case');
            await checkPresetsAssets(userfilemgr, 'ActsUserFileMgrAlbumJsTest');
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

        const getPhotoAssetsTest = async function (done, testNum, fetchOp, expectAlbumCount = 1, expectAssetsCount = 1) {
            try {
                const fetchAlbumResult = await userfilemgr.getPhotoAlbums(fetchOp);
                const albumCountPass = await checkAssetsCount(done, testNum, fetchAlbumResult, expectAlbumCount);
                if (!albumCountPass) return;
                const album = await fetchAlbumResult.getFirstObject();
                fetchAlbumResult.close();
                let op: userFileManager.FetchOptions = allFetchOp();
                let fetchAssetResult = await album.getPhotoAssets(op);
                if (fetchAssetResult == undefined) {
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info(`${testNum}, getCount: ${fetchAssetResult.getCount()}
                    expectAssetsCount: ${expectAssetsCount}`)
                expect(fetchAssetResult.getCount()).assertEqual(expectAssetsCount);
                fetchAssetResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}, error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        const getPhotoAssetsErrCodeTest = async function (done, testNum, fetchOp, expectAlbumCount = 1, expectAssetsCount = 1) {
            try {
                const fetchAlbumResult = await userfilemgr.getPhotoAlbums(fetchOp);
                const albumCountPass = await checkAssetsCount(done, testNum, fetchAlbumResult, expectAlbumCount);
                if (!albumCountPass) return;
                const album = await fetchAlbumResult.getFirstObject();
                fetchAlbumResult.close();
                let invalidOps : userFileManager.FetchOptions;
                let fetchAssetResult = await album.getPhotoAssets(invalidOps);
                expect(false).assertTrue();
                fetchAssetResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}, errCode :${JSON.stringify(error)}`);
                expect(error.code).assertEqual(THROW_ERROR_CODE.toString());
                done();
            }
        }

        /**
         * @tc.number    : SUB_USERFILE_MGR_ALBUM_GETPHOTOASSETS_PROMISE_01
         * @tc.name      : getPhotoAssets
         * @tc.desc      : Album getPhotoAssets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_USERFILE_MGR_ALBUM_GETPHOTOASSETS_PROMISE_01', 1, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_ALBUM_GETPHOTOASSETS_PROMISE_01';
            let currentFetchOp = albumFetchOps(testNum, 'Pictures/', 'Static');
            await getPhotoAssetsTest(done, testNum, currentFetchOp);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_ALBUM_GETPHOTOASSETS_ERRCODE_PROMISE_01
         * @tc.name      : getPhotoAssets
         * @tc.desc      : invalid AlbumFetchOptions
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('SUB_USERFILE_MGR_ALBUM_GETPHOTOASSETS_ERRCODE_PROMISE_01', 3, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_ALBUM_GETPHOTOASSETS_ERRCODE_PROMISE_01';
            let currentFetchOp = albumFetchOps(testNum, 'Pictures/', 'Static');
            await getPhotoAssetsErrCodeTest(done, testNum, currentFetchOp);
        });
    });
}