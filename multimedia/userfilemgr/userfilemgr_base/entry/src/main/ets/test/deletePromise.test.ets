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
} from '../../../../../../common';


export default function deletePromiseTest(abilityContext) {
    describe('deletePromiseTest', function () {
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

        const deleteTest = async function (done, testNum, fetchOp, isAudio) {
            try {
                let fetchAssetResult;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(fetchOp);
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOp);
                }
                let expectCount = 2;
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, expectCount);
                if (!checkAssetCountPass) return;
                let asset = await fetchAssetResult.getFirstObject();
                fetchAssetResult.close();
                await userfilemgr.delete(asset.uri);
                let newFetchResult;
                if (isAudio) {
                    newFetchResult = await userfilemgr.getAudioAssets(fetchOp);
                } else {
                    newFetchResult = await userfilemgr.getPhotoAssets(fetchOp);
                }
                expect(newFetchResult.getCount()).assertEqual(1);
                newFetchResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}, failed: ${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_USERFILE_MGR_DELETE_PROMISE_01
         * @tc.name      : delete
         * @tc.desc      : delete image
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_DELETE_PROMISE_01', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_DELETE_PROMISE_01';
            let currentFetchOp = imageVideoFetchOps(testNum, 'Pictures/deletePro/');
            let isAudio = false;
            await deleteTest(done, testNum, currentFetchOp, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_DELETE_PROMISE_02
         * @tc.name      : delete
         * @tc.desc      : delete video
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_DELETE_PROMISE_02', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_DELETE_PROMISE_02';
            let currentFetchOp = imageVideoFetchOps(testNum, 'Videos/deletePro/');
            let isAudio = false;
            await deleteTest(done, testNum, currentFetchOp, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_DELETE_PROMISE_03
         * @tc.name      : delete
         * @tc.desc      : delete audio
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_DELETE_PROMISE_03', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_DELETE_PROMISE_03';
            let currentFetchOp = audioFetchOps(testNum, 'Audios/deletePro/');
            let isAudio = true;
            await deleteTest(done, testNum, currentFetchOp, isAudio);
        });
    });
}


