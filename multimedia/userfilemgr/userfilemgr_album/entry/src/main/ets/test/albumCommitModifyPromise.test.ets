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
    albumFetchOps,
    checkPresetsAssets,
    checkAssetsCount,
    getPermission,
} from '../../../../../../common';


export default function albumCommitModifyPromise(abilityContext) {
    describe('albumCommitModifyPromise', function () {
        const userfile_mgr = userfile_manager.getUserFileMgr(abilityContext);
        beforeAll(async function () {
            console.info('beforeAll case');
            await getPermission();
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

        const albumCommitModify = async function (done, testNum, media_type, fetchOp, expectAlbumCount) {
            try {
                const fetchAlbumResult = await userfile_mgr.getAlbums(media_type, fetchOp);
                const albumCountPass = await checkAssetsCount(done, testNum, fetchAlbumResult, expectAlbumCount);
                if (!albumCountPass) return;
                const album = await fetchAlbumResult.getFirstObject();
                const newName = 'albumName' + media_type.toString();
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
         * @tc.desc      : image album modify albumname
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_PROMISE_01', 0, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_PROMISE_01';
            let media_type = [IMAGE_TYPE];
            let currentFetchOp = albumFetchOps(testNum, 'Pictures/', 'DynamicPro');
            let expectAlbumCount = 1;
            await albumCommitModify(done, testNum, media_type, currentFetchOp, expectAlbumCount);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_PROMISE_02
         * @tc.name      : commitModify
         * @tc.desc      : audio album modify albumname
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_PROMISE_02', 0, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_PROMISE_02';
            let media_type = [AUDIO_TYPE];
            let currentFetchOp = albumFetchOps(testNum, 'Audios/', 'DynamicPro');
            let expectAlbumCount = 1;
            await albumCommitModify(done, testNum, media_type, currentFetchOp, expectAlbumCount);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_PROMISE_03
         * @tc.name      : commitModify
         * @tc.desc      : video album modify albumname
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_PROMISE_03', 0, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_PROMISE_03';
            let media_type = [VIDEO_TYPE];
            let currentFetchOp = albumFetchOps(testNum, 'Videos/', 'DynamicPro');
            let expectAlbumCount = 1;
            await albumCommitModify(done, testNum, media_type, currentFetchOp, expectAlbumCount);
        });
    });
}


