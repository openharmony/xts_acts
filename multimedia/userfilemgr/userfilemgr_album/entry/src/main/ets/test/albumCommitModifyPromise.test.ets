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
    albumFetchOps,
    checkPresetsAssets,
    checkAssetsCount,
    getPermission,
} from '../../../../../../common';


export default function albumCommitModifyPromise(abilityContext) {
    describe('albumCommitModifyPromise', function () {
        const userfilemgr = userFileManager.getUserFileMgr(abilityContext);
        beforeAll(async function () {
            console.info('beforeAll case');
            await getPermission();
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

        const albumCommitModify = async function (done, testNum, fetchOp, expectAlbumCount = 1) {
            try {
                const fetchAlbumResult = await userfilemgr.getPhotoAlbums(fetchOp);
                const albumCountPass = await checkAssetsCount(done, testNum, fetchAlbumResult, expectAlbumCount);
                if (!albumCountPass) return;
                const album = await fetchAlbumResult.getFirstObject();
                const newName = 'newAlbumNamePromise';
                fetchAlbumResult.close();
                album.albumName = newName;
                await album.commitModify();
                expect(true).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum}, failed error: ${error}`)
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_PROMISE_01
         * @tc.name      : commitModify
         * @tc.desc      : album modify albumname
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_PROMISE_01', 2, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_PROMISE_01';
            let currentFetchOp = albumFetchOps(testNum, 'Pictures/', 'DynamicPro');
            await albumCommitModify(done, testNum, currentFetchOp);
        });
    });
}


