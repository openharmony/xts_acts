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
    audioNameFetchOps,
    imageVideoNameFetchOps,
    checkPresetsAssets,
} from '../../../../../../common';

export default function fileAssetIsDirectoryPromiseTest(abilityContext) {
    describe('fileAssetIsDirectoryPromiseTest', function () {
        const userfilemgr = userFileManager.getUserFileMgr(abilityContext);
        beforeAll(async function () {
            console.info('beforeAll case');
            await checkPresetsAssets(userfilemgr, 'ActsUserFileMgrFileAssetJsTest')
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

        const isDirectoryTest = async function (done, testNum, fetchOp, isAudio) {
            try {
                let fetchAssetResult;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(fetchOp);
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOp);
                }
                const asset = await fetchAssetResult.getFirstObject();
                fetchAssetResult.close();
                const isDir = await asset.isDirectory();
                expect(isDir).assertEqual(false);
                done();
            } catch (error) {
                console.info(`${testNum} error : ${error}`);
                expect(false).assertTrue();
                done();
            }
        }
        
        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_ISDIRECTORY_PROMISE_01
         * @tc.name      : isDirectory
         * @tc.desc      : image asset isDirectory
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_ISDIRECTORY_PROMISE_01', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_ISDIRECTORY_PROMISE_01';
            let fetchOp = imageVideoNameFetchOps(testNum, 'Pictures/Static/', '01.jpg');
            let isAudio = false;
            await isDirectoryTest(done, testNum, fetchOp, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_ISDIRECTORY_PROMISE_02
         * @tc.name      : isDirectory
         * @tc.desc      : audio asset isDirectory
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_ISDIRECTORY_PROMISE_02', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_ISDIRECTORY_PROMISE_02';
            let fetchOp = audioNameFetchOps(testNum, 'Audios/Static/', '01.mp3');
            let isAudio = true;
            await isDirectoryTest(done, testNum, fetchOp, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_ISDIRECTORY_PROMISE_03
         * @tc.name      : isDirectory
         * @tc.desc      : video asset isDirectory
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_ISDIRECTORY_PROMISE_03', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_ISDIRECTORY_PROMISE_03';
            let fetchOp = imageVideoNameFetchOps(testNum, 'Videos/Static/', '01.mp4');
            let isAudio = false;
            await isDirectoryTest(done, testNum, fetchOp, isAudio);
        });
    });
}
