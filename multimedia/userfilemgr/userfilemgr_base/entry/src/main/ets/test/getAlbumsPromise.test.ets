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
    allFetchOp,
    albumFetchOps,
    checkPresetsAssets,
    checkAlbumsCount,
} from '../../../../../../common';

export default function getAlbumsPromise(abilityContext) {
    describe('getAlbumsPromise', function () {
        const userfile_mgr = userfile_manager.getUserFileMgr(abilityContext);
        beforeAll(async function () {
            console.info('beforeAll case');
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

        function printAlbumMessage(testNum, album) {
            console.info(`${testNum}
                album.albumName: ${album.albumName}
                album.albumUri: ${album.albumUri}
                album.dateModified: ${album.dateModified}
                album.count: ${album.count}
                album.relativePath: ${album.relativePath}
                album.coverUri: ${album.coverUri}`);
        }

        const props = {
            albumName: 'Static',
            albumUri: 'datashare:///userfile_mgr/album/',
            count: 1
        }
        const checkProps = async function (done, testNum, album, relativePaths) {
            printAlbumMessage(testNum, album);
            if (album.coverUri == undefined) {
                console.info(`${testNum}, album.coverUri is undefined`);
                expect(false).assertTrue();
                done();
                return;
            }
            expect(album.albumName).assertEqual(props.albumName);
            expect(album.count).assertEqual(props.count);
            if (Array.isArray(relativePaths)) {
                let i = relativePaths.indexOf(album.relativePath);
                if (i > -1) {
                    relativePaths.splice(i, 1)
                } else {
                    expect(false).assertTrue();
                    done();
                }
            } else {
                expect(album.relativePath).assertEqual(relativePaths);
            }
        }
        const checkAlbumInfo = async function (done, testNum, media_type, fetchOp, relativePaths, expectAlbumCount = 1) {
            try {
                const albumList = await userfile_mgr.getAlbums(media_type, fetchOp);
                const albumCountPass = await checkAlbumsCount(done, testNum, albumList, expectAlbumCount);
                if (!albumCountPass) return;
                const album = albumList[0];
                checkProps(done, testNum, album, relativePaths);
                done();
            } catch (error) {
                console.info(`${testNum}, failed: ${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETALBUMS_PROMISE_01
         * @tc.name      : getAlbums
         * @tc.desc      : Image type getAlbums by relativePath && albumName, print all album info
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETALBUMS_PROMISE_01', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETALBUMS_PROMISE_01';
            let media_type = [IMAGE_TYPE];
            let currentFetchOp = albumFetchOps(testNum, 'Pictures/', 'Static');
            let relativePaths = 'Pictures/';
            await checkAlbumInfo(done, testNum, media_type, currentFetchOp, relativePaths);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETALBUMS_PROMISE_02
         * @tc.name      : getAlbums
         * @tc.desc      : Image type getAlbums by relativePath && albumName, print all album info
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETALBUMS_PROMISE_02', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETALBUMS_PROMISE_02';
            let media_type = [AUDIO_TYPE];
            let currentFetchOp = albumFetchOps(testNum, 'Audios/', 'Static');
            let relativePaths = 'Audios/';
            await checkAlbumInfo(done, testNum, media_type, currentFetchOp, relativePaths);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETALBUMS_PROMISE_03
         * @tc.name      : getAlbums
         * @tc.desc      : Image type getAlbums by relativePath && albumName, print all album info
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETALBUMS_PROMISE_03', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETALBUMS_PROMISE_03';
            let media_type = [VIDEO_TYPE];
            let currentFetchOp = albumFetchOps(testNum, 'Videos/', 'Static');
            let relativePaths = 'Videos/';
            await checkAlbumInfo(done, testNum, media_type, currentFetchOp, relativePaths);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETALBUMS_PROMISE_04
         * @tc.name      : getAlbums
         * @tc.desc      : getAlbums by abnormal
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETALBUMS_PROMISE_04', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETALBUMS_PROMISE_04';
            try {
                let media_type = [-1];
                let currentFetchOp = allFetchOp();
                try {
                    await userfile_mgr.getAlbums(media_type, currentFetchOp);
                    expect(false).assertTrue();
                    done();
                } catch (error) {
                    console.info(`${testNum}, error1: ${error}`);
                    expect(true).assertTrue();
                    done();
                }
            } catch (error) {
                console.info(`${testNum}, error2: ${error}`);
                expect(false).assertTrue();
                done();
            }
        });
    });
}


