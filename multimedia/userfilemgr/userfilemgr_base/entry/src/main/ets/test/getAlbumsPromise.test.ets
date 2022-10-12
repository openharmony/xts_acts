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
    albumFetchOps,
    checkPresetsAssets,
    checkAssetsCount,
} from '../../../../../../common';

export default function getAlbumsPromiseTest(abilityContext) {
    describe('getAlbumsPromiseTest', function () {
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
            albumName: 'myAlbum',
            albumUri: 'datashare:///userfilemgr/album/',
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
        const checkAlbumInfo = async function (done, testNum, fetchOp, relativePaths, expectAlbumCount = 1) {
            try {
                const fetchAlbumResult = await userfilemgr.getPhotoAlbums(fetchOp);
                const albumCountPass = await checkAssetsCount(done, testNum, fetchAlbumResult, expectAlbumCount);
                if (!albumCountPass) return;
                const album = await fetchAlbumResult.getFirstObject();
                checkProps(done, testNum, album, relativePaths);
                fetchAlbumResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}, failed: ${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        const getPhotoAlbumsErrCodeTest = async function (done, testNum) {
            try {
                let invalidOps : userFileManager.FetchOptions;
                let fetchAlbumResult = await userfilemgr.getPhotoAlbums(invalidOps);
                expect(false).assertTrue();
                fetchAlbumResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}, errCode :${JSON.stringify(error)}`);
                expect(error.code).assertEqual(THROW_ERROR_CODE.toString());
                done();
            }
        }

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOALBUMS_PROMISE_01
         * @tc.name      : getPhotoAlbums
         * @tc.desc      : getPhotoAlbums by relativePath && albumName, print all album info
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOALBUMS_PROMISE_01', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOALBUMS_PROMISE_01';
            let currentFetchOp = albumFetchOps(testNum, 'Pictures/', 'myAlbum');
            let relativePaths = 'Pictures/';
            await checkAlbumInfo(done, testNum, currentFetchOp, relativePaths);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOALBUMS_ERRCODE_PROMISE_01
         * @tc.name      : getPhotoAlbums
         * @tc.desc      : getPhotoAlbums by invalid
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
         it('SUB_USERFILE_MGR_GETPHOTOALBUMS_ERRCODE_PROMISE_01', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOALBUMS_ERRCODE_PROMISE_01';
            await getPhotoAlbumsErrCodeTest(done, testNum);
        });
    });
}


