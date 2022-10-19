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
    audioFetchOps,
    imageVideoFetchOps,
    checkPresetsAssets,
    checkAssetsCount,
    albumFetchOps,
} from '../../../../../../common';


export default function onOffReleasePromiseTest(abilityContext) {
    describe('onOffReleasePromiseTest', function () {
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

        const onTest = async (done, testNum, fetchOp, type, newName, isAudio) => {
            try {
                let count = 0;
                userfilemgr.on(type, () => { count++; });
                let fetchAssetResult;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(fetchOp);
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOp);
                }
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, 1);
                if (!checkAssetCountPass) return;
                const asset = await fetchAssetResult.getFirstObject();
                fetchAssetResult.close();
                asset.displayName = newName;
                await asset.commitModify();
                await sleep(1000)
                expect(count > 0).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }
        const offTest = async (done, testNum, fetchOp, type, newName, isAudio) => {
            try {
                let count = 0;
                userfilemgr.on(type, () => { count++; });
                let fetchAssetResult;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(fetchOp);
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOp);
                }
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, 1);
                if (!checkAssetCountPass) return;
                const asset = await fetchAssetResult.getFirstObject();
                fetchAssetResult.close();
                asset.displayName = newName;
                userfilemgr.off(type);
                await asset.commitModify();
                await sleep(1000)
                expect(count).assertEqual(0);
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        /** 
         * @tc.number    : SUB_USERFILE_MGR_ON_01
         * @tc.name      : ON
         * @tc.desc      : ON imageChange
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_ON_01', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_ON_01';
            let currentFetchOps = imageVideoFetchOps(testNum, 'Pictures/On/');
            let type = 'imageChange';
            let newName = 'imageChange.jpg';
            let isAudio = false;
            await onTest(done, testNum, currentFetchOps, type, newName, isAudio)
        });

        /** 
         * @tc.number    : SUB_USERFILE_MGR_ON_02
         * @tc.name      : ON
         * @tc.desc      : ON videoChange
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_ON_02', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_ON_02';
            let currentFetchOps = imageVideoFetchOps(testNum, 'Videos/On/');
            let type = 'videoChange';
            let newName = 'videoChange.mp4';
            let isAudio = false;
            await onTest(done, testNum, currentFetchOps, type, newName, isAudio)
        });

        /** 
         * @tc.number    : SUB_USERFILE_MGR_ON_03
         * @tc.name      : ON
         * @tc.desc      : ON audioChange
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_ON_03', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_ON_03';
            let currentFetchOps = audioFetchOps(testNum, 'Audios/On/');
            let type = 'audioChange';
            let newName = 'audioChange.mp3';
            let isAudio = true;
            await onTest(done, testNum, currentFetchOps, type, newName, isAudio)
        });

        /** 
         * @tc.number    : SUB_USERFILE_MGR_ON_04
         * @tc.name      : ON
         * @tc.desc      : ON albumChange
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_ON_04', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_ON_04';
            try {
                let currentFetchOps = albumFetchOps(testNum, 'Pictures/', 'On');
                let type: userFileManager.ChangeEvent = 'albumChange';
                let count = 0;
                userfilemgr.on(type, () => { count++; });
                const fetchAlbumResult = await userfilemgr.getPhotoAlbums(currentFetchOps);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAlbumResult, 1);
                if (!checkAssetCountPass) return;
                const album = await fetchAlbumResult.getFirstObject();
                const oldName = album.albumName;
                fetchAlbumResult.close();
                album.albumName = type.toString();
                await album.commitModify();
                await sleep(1000);
                expect(count > 0).assertTrue();
                album.albumName = oldName;
                await album.commitModify(); 
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_OFF_01
         * @tc.name      : off
         * @tc.desc      : off imageChange
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_OFF_01', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_OFF_01';
            let currentFetchOps = imageVideoFetchOps(testNum, 'Pictures/Off/');
            let type = 'imageChange';
            let newName = 'imageChange.jpg';
            let isAudio = false;
            await offTest(done, testNum,currentFetchOps, type, newName, isAudio)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_OFF_02
         * @tc.name      : off
         * @tc.desc      : off videoChange
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_OFF_02', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_OFF_02';
            let currentFetchOps = imageVideoFetchOps(testNum, 'Videos/Off/');
            let type = 'videoChange';
            let newName = 'videoChange.mp4';
            let isAudio = false;
            await offTest(done, testNum,currentFetchOps, type, newName, isAudio)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_OFF_03
         * @tc.name      : off
         * @tc.desc      : off audioChange
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_OFF_03', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_OFF_03';
            let currentFetchOps = audioFetchOps(testNum, 'Audios/Off/');
            let type = 'audioChange';
            let newName = 'audioChange.mp3';
            let isAudio = true;
            await offTest(done, testNum,currentFetchOps, type, newName, isAudio)
        });

        /** 
         * @tc.number    : SUB_USERFILE_MGR_OFF_04
         * @tc.name      : off
         * @tc.desc      : off albumChange
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_OFF_04', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_OFF_04';
            try {
                let currentFetchOps = albumFetchOps(testNum, 'Pictures/', 'Off');
                let type: userFileManager.ChangeEvent = 'albumChange';
                let count = 0;
                userfilemgr.on(type, () => { count++; });
                const fetchAlbumResult = await userfilemgr.getPhotoAlbums(currentFetchOps);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAlbumResult, 1);
                if (!checkAssetCountPass) return;
                const album = await fetchAlbumResult.getFirstObject();
                fetchAlbumResult.close();
                album.albumName = type.toString();
                userfilemgr.off(type);
                await album.commitModify();
                await sleep(1000);
                expect(count).assertEqual(0);
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_RELEASE_CALLBACK_01
         * @tc.name      : release
         * @tc.desc      : Release MediaLibrary instance
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_RELEASE_CALLBACK_01', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_RELEASE_CALLBACK_01';
            try {
                userfilemgr.release(() => {
                    expect(true).assertTrue();
                    done();
                });
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_RELEASE_01
         * @tc.name      : release
         * @tc.desc      : Release MediaLibrary instance
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_RELEASE_01', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_RELEASE_PROMISE_01';
            try {
                await userfilemgr.release();
                expect(true).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        });
    });
}


