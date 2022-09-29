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
    FILE_TYPE,
    fileFetchOps,
    audioFetchOps,
    imageVideoFetchOps,
    checkPresetsAssets,
    checkAssetsCount,
} from '../../../../../../common';


export default function onOffReleasePromiseTest(abilityContext) {
    describe('onOffReleasePromiseTest', function () {
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

        const onTest = async (done, testNum, media_type, fetchOps, type, newName) => {
            try {
                let count = 0;
                userfile_mgr.on(type, () => { count++; });
                const fetchFileResult = await userfile_mgr.getFileAssets(media_type, fetchOps);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 1);
                if (!checkAssetCountPass) return;
                const asset = await fetchFileResult.getFirstObject();
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
        const offTest = async (done, testNum, media_type, fetchOps, type, newName) => {
            try {
                let count = 0;
                userfile_mgr.on(type, () => {
                    count++;
                });
                const fetchFileResult = await userfile_mgr.getFileAssets(media_type, fetchOps);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 1);
                if (!checkAssetCountPass) return;
                const asset = await fetchFileResult.getFirstObject();
                asset.displayName = newName;
                userfile_mgr.off(type);
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
         * @tc.number    : SUB_USERFILE_MGR_ON_PROMISE_01
         * @tc.name      : ON
         * @tc.desc      : ON image ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_ON_PROMISE_01', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_ON_PROMISE_01';
            let media_type = [IMAGE_TYPE];
            let currentFetchOps = imageVideoFetchOps(testNum, 'Pictures/On/');
            let type = 'imageChange';
            let newName = 'imageChange.jpg';
            await onTest(done, testNum, media_type, currentFetchOps, type, newName)
        });

        /** 
         * @tc.number    : SUB_USERFILE_MGR_ON_PROMISE_02
         * @tc.name      : ON
         * @tc.desc      : ON audio ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_ON_PROMISE_02', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_ON_PROMISE_02';
            let media_type = [AUDIO_TYPE];
            let currentFetchOps = audioFetchOps(testNum, 'Audios/On/');
            let type = 'audioChange';
            let newName = 'audioChange.mp3';
            await onTest(done, testNum, media_type, currentFetchOps, type, newName)
        });

        /** 
         * @tc.number    : SUB_USERFILE_MGR_ON_PROMISE_03
         * @tc.name      : ON
         * @tc.desc      : ON video ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_ON_PROMISE_03', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_ON_PROMISE_03';
            let media_type = [VIDEO_TYPE];
            let currentFetchOps = imageVideoFetchOps(testNum, 'Videos/On/');
            let type = 'videoChange';
            let newName = 'videoChange.mp4';
            await onTest(done, testNum, media_type, currentFetchOps, type, newName)
        });

        /** 
         * @tc.number    : SUB_USERFILE_MGR_ON_PROMISE_04
         * @tc.name      : ON
         * @tc.desc      : ON file ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_ON_PROMISE_04', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_ON_PROMISE_04';
            let media_type = [FILE_TYPE];
            let currentFetchOps = fileFetchOps(testNum, 'Documents/On/');
            let type = 'fileChange';
            let newName = 'fileChange.dat';
            await onTest(done, testNum, media_type, currentFetchOps, type, newName)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_OFF_PROMISE_01
         * @tc.name      : off
         * @tc.desc      : off image ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_OFF_PROMISE_01', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_OFF_PROMISE_01';
            let media_type = [IMAGE_TYPE];
            let currentFetchOps = imageVideoFetchOps(testNum, 'Pictures/Off/');
            let type = 'imageChange';
            let newName = 'imageChange.jpg';
            await offTest(done, testNum,media_type, currentFetchOps, type, newName)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_OFF_PROMISE_02
         * @tc.name      : off
         * @tc.desc      : off audio ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_OFF_PROMISE_02', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_OFF_PROMISE_02';
            let media_type = [AUDIO_TYPE];
            let currentFetchOps = audioFetchOps(testNum, 'Audios/Off/');
            let type = 'audioChange';
            let newName = 'audioChange.mp3';
            await offTest(done, testNum,media_type, currentFetchOps, type, newName)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_OFF_PROMISE_03
         * @tc.name      : off
         * @tc.desc      : off video ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_OFF_PROMISE_03', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_OFF_PROMISE_03';
            let media_type = [VIDEO_TYPE];
            let currentFetchOps = imageVideoFetchOps(testNum, 'Videos/Off/');
            let type = 'videoChange';
            let newName = 'videoChange.mp4';
            await offTest(done, testNum,media_type, currentFetchOps, type, newName)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_OFF_PROMISE_04
         * @tc.name      : off
         * @tc.desc      : off file ASSET
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_OFF_PROMISE_04', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_OFF_PROMISE_04';
            let media_type = [FILE_TYPE];
            let currentFetchOps = fileFetchOps(testNum, 'Documents/Off/');
            let type = 'fileChange';
            let newName = 'fileChange.dat';
            await offTest(done, testNum,media_type, currentFetchOps, type, newName)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_PROMISE_PROMISE_01
         * @tc.name      : release
         * @tc.desc      : Release MediaLibrary instance
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_PROMISE_PROMISE_01', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_PROMISE_PROMISE_01';
            try {
                await userfile_mgr.release();
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


