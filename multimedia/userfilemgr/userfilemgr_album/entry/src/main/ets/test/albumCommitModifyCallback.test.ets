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
    checkAlbumsCount,
    getPermission,
} from '../../../../../../common';


export default function albumCommitModifyCallback(abilityContext) {
    describe('albumCommitModifyCallback', function () {
        const userfile_mgr = userfile_manager.getUserFileMgr(abilityContext);
        beforeAll(async function () {
            console.info('beforeAll case');
            await getPermission();
            await checkPresetsAssets(userfile_mgr, 'ActsUserFileMgrAlbum');
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
                const albumList = await userfile_mgr.getAlbums(media_type, fetchOp);
                const albumCountPass = await checkAlbumsCount(done, testNum, albumList, expectAlbumCount);
                if (!albumCountPass) return;
                const album = albumList[0];
                const newName = 'albumName' + media_type.toString();
                album.albumName = newName;
                album.commitModify(async () => {
                    expect(true).assertTrue();
                    done();
                });

            } catch (error) {
                console.info(`${testNum}, failed error: ${error}`)
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_CALLBACK_01
         * @tc.name      : commitModify
         * @tc.desc      : image album modify albumname
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_CALLBACK_01', 0, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_CALLBACK_01';
            let media_type = [IMAGE_TYPE];
            let currentFetchOp = albumFetchOps(testNum, 'Pictures/', 'DynamicCb');
            let expectAlbumCount = 1;
            await albumCommitModify(done, testNum, media_type, currentFetchOp, expectAlbumCount);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_CALLBACK_02
         * @tc.name      : commitModify
         * @tc.desc      : image album modify albumname
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_CALLBACK_02', 0, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_CALLBACK_02';
            let media_type = [AUDIO_TYPE];
            let currentFetchOp = albumFetchOps(testNum, 'Audios/', 'DynamicCb');
            let expectAlbumCount = 1;
            await albumCommitModify(done, testNum, media_type, currentFetchOp, expectAlbumCount);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_CALLBACK_03
         * @tc.name      : commitModify
         * @tc.desc      : image album modify albumname
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_CALLBACK_03', 0, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_ALBUM_COMMITMODIFY_CALLBACK_03';
            let media_type = [VIDEO_TYPE];
            let currentFetchOp = albumFetchOps(testNum, 'Videos/', 'DynamicCb');
            let expectAlbumCount = 1;
            await albumCommitModify(done, testNum, media_type, currentFetchOp, expectAlbumCount);
        });
    });
}


