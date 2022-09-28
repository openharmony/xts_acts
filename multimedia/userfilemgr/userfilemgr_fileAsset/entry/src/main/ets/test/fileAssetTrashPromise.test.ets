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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index";
import {
    sleep,
    IMAGE_TYPE,
    AUDIO_TYPE,
    VIDEO_TYPE,
    FILE_TYPE,
    allFetchOp,
    fileNameFetchOps,
    audioNameFetchOps,
    imageVideoNameFetchOps,
    albumFetchOps,
    checkAssetsCount,
} from "../../../../../../common";

export default function fileAssetTrashPromiseTest(abilityContext) {
    describe("fileAssetTrashPromiseTest", function () {
        const userfile_mgr = userfile_manager.getUserFileMgr(abilityContext);
        beforeAll(async function () {
            console.info("beforeAll case");
        });
        beforeEach(function () {
            console.info("beforeEach case");
        });
        afterEach(async function () {
            console.info("afterEach case");
            await sleep;
        });
        afterAll(async function () {
            console.info("afterAll case");
        });

        const isTrashTest = async function (done, testNum, media_type, fetchOp) {
            try {
                let fetchFileResult = await userfile_mgr.getFileAssets(media_type, fetchOp);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 1);
                if (!checkAssetCountPass) return;
                let asset = await fetchFileResult.getFirstObject();
                let isTrash = await asset.isTrash();
                expect(isTrash).assertEqual(false);
                await fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum} failed error: ${error}`)
                expect(false).assertTrue();
                done();
            }
        }

        async function setTrash(done, testNum, media_type, databasefFetchOps, ablumFetchOps, noAlbum, expectAssetNum = 3) {
            try {
                // database info
                let databaseFetchFileResult = await userfile_mgr.getFileAssets(media_type, databasefFetchOps);
                let count = databaseFetchFileResult.getCount();
                //album info
                if (!noAlbum) {
                    let albumList = await userfile_mgr.getAlbums(media_type, ablumFetchOps);
                    let album = albumList[0];
                    let op: userfile_manager.MediaFetchOptions = allFetchOp();
                    let albumFetchFileResult = await album.getFileAssets(media_type, op);
                    let albumFilesCount = albumFetchFileResult.getCount();
                    expect(albumFilesCount).assertEqual(expectAssetNum);
                }
                // file info
                let asset = await databaseFetchFileResult.getFirstObject();
                // trash operation
                await asset.trash(true);
                let istrash = await asset.isTrash();
                console.info(`${testNum} istrash: ${istrash}`);
                databaseFetchFileResult = await userfile_mgr.getFileAssets(media_type, databasefFetchOps);
                let databaseCount = databaseFetchFileResult.getCount();
                expect(databaseCount).assertEqual(count - 1);
                //album info
                if (!noAlbum) {
                    var albumList = await userfile_mgr.getAlbums(media_type, ablumFetchOps);
                    var album = albumList[0];
                    let op: userfile_manager.MediaFetchOptions = allFetchOp();
                    var albumFetchFileResult = await album.getFileAssets(media_type, op);
                    var albumFilesCount = albumFetchFileResult.getCount();
                    expect(albumFilesCount).assertEqual(expectAssetNum - 1);
                }
                await asset.trash(false);
                done();
            } catch (error) {
                console.info(`${testNum} error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function recovery(done, testNum, media_type, databasefFetchOps, ablumFetchOps, noAlbum, expectAssetNum = 3) {
            try {
                let databaseFetchFileResult = await userfile_mgr.getFileAssets(media_type, databasefFetchOps);
                let count = databaseFetchFileResult.getCount();
                let asset = await databaseFetchFileResult.getFirstObject();
                await asset.trash(true);
                await asset.trash(false);
                databaseFetchFileResult = await userfile_mgr.getFileAssets(media_type, databasefFetchOps);
                let databaseCount = databaseFetchFileResult.getCount();
                expect(databaseCount).assertEqual(count);
                //album info
                if (!noAlbum) {
                    let albumList = await userfile_mgr.getAlbums(media_type, ablumFetchOps);
                    let album = albumList[0];
                    let op: userfile_manager.MediaFetchOptions = allFetchOp();
                    let albumFetchFileResult = await album.getFileAssets(media_type, op);
                    let albumFilesCount = albumFetchFileResult.getCount();
                    expect(albumFilesCount).assertEqual(expectAssetNum);
                }
                done();
            } catch (error) {
                console.info(`${testNum} error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_01_001
         * @tc.name      : isTrash
         * @tc.desc      : isTrash(image) result false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_01_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_01_001'
            let media_type = [IMAGE_TYPE];
            let currentFetchOp = imageVideoNameFetchOps(testNum, 'Pictures/trashPro/', '01.jpg')
            await isTrashTest(done, testNum, media_type, currentFetchOp)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_01_002
         * @tc.name      : trash
         * @tc.desc      : trash(image) by true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_01_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_01_002'
            let media_type = [IMAGE_TYPE];
            let rOps = imageVideoNameFetchOps(testNum, "Pictures/trashPro/", '02.jpg');
            let aOps = albumFetchOps(testNum, "Pictures/", "trashPro");
            let noAlbum = false;
            await setTrash(done, testNum, media_type, rOps, aOps, noAlbum);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_01_003
         * @tc.name      : trash
         * @tc.desc      : trash(image) by false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_01_003', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_01_003'
            let media_type = [IMAGE_TYPE];
            let rOps = imageVideoNameFetchOps(testNum, "Pictures/trashPro/", '03.jpg');
            let aOps = albumFetchOps(testNum, "Pictures/", "trashPro");
            let noAlbum = false;
            await recovery(done, testNum, media_type, rOps, aOps, noAlbum);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_02_001
         * @tc.name      : isTrash
         * @tc.desc      : isTrash(audio) result false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_02_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_02_001'
            let media_type = [AUDIO_TYPE];
            let currentFetchOp = audioNameFetchOps(testNum, 'Audios/trashPro/', '01.mp3')
            await isTrashTest(done, testNum, media_type, currentFetchOp)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_02_002
         * @tc.name      : trash
         * @tc.desc      : trash(audio) by true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_02_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_02_002'
            let media_type = [AUDIO_TYPE];
            let rOps = audioNameFetchOps(testNum, "Audios/trashPro/", '02.mp3');
            let aOps = albumFetchOps(testNum, "Audios/", "trashPro");
            let noAlbum = false;
            await setTrash(done, testNum, media_type, rOps, aOps, noAlbum);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_02_003
         * @tc.name      : trash
         * @tc.desc      : trash(audio) by false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_02_003', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_02_003'
            let media_type = [AUDIO_TYPE];
            let rOps = audioNameFetchOps(testNum, "Audios/trashPro/", '03.mp3');
            let aOps = albumFetchOps(testNum, "Audios/", "trashPro");
            let noAlbum = false;
            await recovery(done, testNum, media_type, rOps, aOps, noAlbum);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_03_001
         * @tc.name      : isTrash
         * @tc.desc      : isTrash(video) result false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_03_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_03_001'
            let media_type = [VIDEO_TYPE];
            let currentFetchOp = imageVideoNameFetchOps(testNum, 'Videos/trashPro/', '01.mp4')
            await isTrashTest(done, testNum, media_type, currentFetchOp)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_03_002
         * @tc.name      : trash
         * @tc.desc      : trash(video) by true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_03_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_03_002'
            let media_type = [VIDEO_TYPE];
            let rOps = imageVideoNameFetchOps(testNum, "Videos/trashPro/", '02.mp4');
            let aOps = albumFetchOps(testNum, "Videos/", "trashPro");
            let noAlbum = false;
            await setTrash(done, testNum, media_type, rOps, aOps, noAlbum);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_03_003
         * @tc.name      : trash
         * @tc.desc      : trash(video) by false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_03_003', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_03_003'
            let media_type = [VIDEO_TYPE];
            let rOps = imageVideoNameFetchOps(testNum, "Videos/trashPro/", '03.mp4');
            let aOps = albumFetchOps(testNum, "Videos/", "trashPro");
            let noAlbum = false;
            await recovery(done, testNum, media_type, rOps, aOps, noAlbum);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_04_001
         * @tc.name      : isTrash
         * @tc.desc      : isTrash(file) result false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_04_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_04_001'
            let media_type = [FILE_TYPE];
            let currentFetchOp = imageVideoNameFetchOps(testNum, 'Documents/trashPro/', '01.dat')
            await isTrashTest(done, testNum, media_type, currentFetchOp)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_04_002
         * @tc.name      : trash
         * @tc.desc      : trash(file) by true
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_04_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_04_002'
            let media_type = [FILE_TYPE];
            let rOps = fileNameFetchOps(testNum, "Documents/trashPro/", '02.dat');
            let aOps = albumFetchOps(testNum, "Documents/", "trashPro");
            let noAlbum = true;
            await setTrash(done, testNum, media_type, rOps, aOps, noAlbum);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_04_003
         * @tc.name      : trash
         * @tc.desc      : trash(file) by false
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_04_003', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_04_003'
            let media_type = [FILE_TYPE];
            let rOps = fileNameFetchOps(testNum, "Documents/trashPro/", '03.dat');
            let aOps = albumFetchOps(testNum, "Documents/", "trashPro");
            let noAlbum = true;
            await recovery(done, testNum, media_type, rOps, aOps, noAlbum);
        });
    });
}