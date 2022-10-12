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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index";
import {
    sleep,
    allFetchOp,
    audioNameFetchOps,
    imageVideoNameFetchOps,
    albumFetchOps,
    checkAssetsCount,
} from "../../../../../../common";

export default function fileAssetTrashPromiseTest(abilityContext) {
    describe("fileAssetTrashPromiseTest", function () {
        const userfilemgr = userFileManager.getUserFileMgr(abilityContext);
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

        const isTrashTest = async function (done, testNum, fetchOp, isAudio) {
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
                let isTrash = await asset.isTrash();
                expect(isTrash).assertEqual(false);
                fetchAssetResult.close();
                done();
            } catch (error) {
                console.info(`${testNum} failed error: ${error}`)
                expect(false).assertTrue();
                done();
            }
        }

        async function setTrash(done, testNum, databasefFetchOps, ablumFetchOps, noAlbum, isAudio) {
            let expectAssetNum = 3
            try {
                // database info
                let databaseFetchFileResult;
                if (isAudio) {
                    databaseFetchFileResult = await userfilemgr.getAudioAssets(databasefFetchOps);
                } else {
                    databaseFetchFileResult = await userfilemgr.getPhotoAssets(databasefFetchOps);
                }
                let count = databaseFetchFileResult.getCount();
                //album info
                if (!noAlbum) {
                    let fetchAlbumResult = await userfilemgr.getPhotoAlbums(ablumFetchOps);
                    let album = await fetchAlbumResult.getFirstObject();
                    let op: userFileManager.FetchOptions = allFetchOp();
                    let albumFetchFileResult = await album.getPhotoAssets(op);
                    let albumFilesCount = albumFetchFileResult.getCount();
                    expect(albumFilesCount).assertEqual(expectAssetNum);
                    fetchAlbumResult.close();
                }
                // file info
                let asset = await databaseFetchFileResult.getFirstObject();
                // trash operation
                await asset.trash(true);
                let istrash = await asset.isTrash();
                console.info(`${testNum} istrash: ${istrash}`);
                databaseFetchFileResult = await userfilemgr.getPhotoAssets(databasefFetchOps);
                if (isAudio) {
                    databaseFetchFileResult = await userfilemgr.getAudioAssets(databasefFetchOps);
                } else {
                    databaseFetchFileResult = await userfilemgr.getPhotoAssets(databasefFetchOps);
                }
                let databaseCount = databaseFetchFileResult.getCount();
                databaseFetchFileResult.close()
                expect(databaseCount).assertEqual(count - 1);
                //album info
                if (!noAlbum) {
                    var fetchAlbumResult = await userfilemgr.getPhotoAlbums(ablumFetchOps);
                    var album = await fetchAlbumResult.getFirstObject();
                    let op: userFileManager.FetchOptions = allFetchOp();
                    var albumFetchFileResult = await album.getPhotoAssets(op);
                    var albumFilesCount = albumFetchFileResult.getCount();
                    expect(albumFilesCount).assertEqual(expectAssetNum - 1);
                    fetchAlbumResult.close();
                }
                await asset.trash(false);
                done();
            } catch (error) {
                console.info(`${testNum} error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function recovery(done, testNum, databasefFetchOps, ablumFetchOps, noAlbum, isAudio) {
            let expectAssetNum = 3;
            try {
                let databaseFetchFileResult;
                if (isAudio) {
                    databaseFetchFileResult = await userfilemgr.getAudioAssets(databasefFetchOps);
                } else {
                    databaseFetchFileResult = await userfilemgr.getPhotoAssets(databasefFetchOps);
                }
                let count = databaseFetchFileResult.getCount();
                let asset = await databaseFetchFileResult.getFirstObject();
                await asset.trash(true);
                await asset.trash(false);
                if (isAudio) {
                    databaseFetchFileResult = await userfilemgr.getAudioAssets(databasefFetchOps);
                } else {
                    databaseFetchFileResult = await userfilemgr.getPhotoAssets(databasefFetchOps);
                }
                let databaseCount = databaseFetchFileResult.getCount();
                databaseFetchFileResult.close();
                expect(databaseCount).assertEqual(count);
                //album info
                if (!noAlbum) {
                    let fetchAlbumResult = await userfilemgr.getPhotoAlbums(ablumFetchOps);
                    let album = await fetchAlbumResult.getFirstObject();
                    let op: userFileManager.FetchOptions = allFetchOp();
                    let albumFetchFileResult = await album.getPhotoAssets(op);
                    let albumFilesCount = albumFetchFileResult.getCount();
                    expect(albumFilesCount).assertEqual(expectAssetNum);
                    fetchAlbumResult.close();
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
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_01_001';
            let currentFetchOp = imageVideoNameFetchOps(testNum, 'Pictures/trashPro/', '01.jpg');
            let isAudio = false;
            await isTrashTest(done, testNum, currentFetchOp, isAudio);
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
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_TRASH_PROMISE_01_002';
            let rOps = imageVideoNameFetchOps(testNum, "Pictures/trashPro/", '02.jpg');
            let aOps = albumFetchOps(testNum, "Pictures/", "trashPro");
            let noAlbum = false;
            let isAudio = false;
            await setTrash(done, testNum, rOps, aOps, noAlbum, isAudio);
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
            let rOps = imageVideoNameFetchOps(testNum, "Pictures/trashPro/", '03.jpg');
            let aOps = albumFetchOps(testNum, "Pictures/", "trashPro");
            let noAlbum = false;
            let isAudio = false;
            await recovery(done, testNum, rOps, aOps, noAlbum, isAudio);
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
            let currentFetchOp = audioNameFetchOps(testNum, 'Audios/trashPro/', '01.mp3');
            let isAudio = true;
            await isTrashTest(done, testNum, currentFetchOp, isAudio)
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
            let rOps = audioNameFetchOps(testNum, "Audios/trashPro/", '02.mp3');
            let aOps = albumFetchOps(testNum, "Audios/", "trashPro");
            let noAlbum = true;
            let isAudio = true;
            await setTrash(done, testNum, rOps, aOps, noAlbum, isAudio);
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
            let rOps = audioNameFetchOps(testNum, "Audios/trashPro/", '03.mp3');
            let aOps = albumFetchOps(testNum, "Audios/", "trashPro");
            let noAlbum = true;
            let isAudio = true;
            await recovery(done, testNum, rOps, aOps, noAlbum, isAudio);
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
            let currentFetchOp = imageVideoNameFetchOps(testNum, 'Videos/trashPro/', '01.mp4');
            let isAudio = false;
            await isTrashTest(done, testNum, currentFetchOp, isAudio);
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
            let rOps = imageVideoNameFetchOps(testNum, "Videos/trashPro/", '02.mp4');
            let aOps = albumFetchOps(testNum, "Videos/", "trashPro");
            let noAlbum = false;
            let isAudio = false;
            await setTrash(done, testNum, rOps, aOps, noAlbum, isAudio);
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
            let rOps = imageVideoNameFetchOps(testNum, "Videos/trashPro/", '03.mp4');
            let aOps = albumFetchOps(testNum, "Videos/", "trashPro");
            let noAlbum = false;
            let isAudio = false;
            await recovery(done, testNum, rOps, aOps, noAlbum, isAudio);
        });
    });
}