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
    fileNameFetchOps,
    audioNameFetchOps,
    imageVideoNameFetchOps,
    checkPresetsAssets,
    checkAssetsCount,
} from '../../../../../../common';

export default function fileAssetIsDirectoryPromiseTest(abilityContext) {
    describe('fileAssetIsDirectoryPromiseTest', function () {
        const userfile_mgr = userfile_manager.getUserFileMgr(abilityContext);
        beforeAll(async function () {
            console.info('beforeAll case');
            await checkPresetsAssets(userfile_mgr, 'ActsUserFileMgrFileAssetJsTest')
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

        const isDirectoryTest = async function (done, testNum, media_type, fetchOp) {
            try {
                const fetchFileResult = await userfile_mgr.getFileAssets(media_type, fetchOp);
                const asset = await fetchFileResult.getFirstObject();
                const isDir = await asset.isDirectory();
                expect(isDir).assertEqual(false);
                done();
            } catch (error) {
                console.info(`${testNum} error : ${error}`)
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
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_ISDIRECTORY_PROMISE_01'
            let media_type = [IMAGE_TYPE];
            let fetchOp = imageVideoNameFetchOps(testNum, 'Pictures/Static/', '01.jpg');
            await isDirectoryTest(done, testNum, media_type, fetchOp)
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
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_ISDIRECTORY_PROMISE_02'
            let media_type = [AUDIO_TYPE];
            let fetchOp = audioNameFetchOps(testNum, 'Audios/Static/', '01.mp3');
            await isDirectoryTest(done, testNum, media_type, fetchOp)
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
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_ISDIRECTORY_PROMISE_03'
            let media_type = [VIDEO_TYPE];
            let fetchOp = imageVideoNameFetchOps(testNum, 'Videos/Static/', '01.mp4');
            await isDirectoryTest(done, testNum, media_type, fetchOp)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_ISDIRECTORY_PROMISE_04
         * @tc.name      : isDirectory
         * @tc.desc      : file asset isDirectory
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_ISDIRECTORY_PROMISE_04', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_ISDIRECTORY_PROMISE_04'
            let media_type = [FILE_TYPE];
            let fetchOp = fileNameFetchOps(testNum, 'Documents/Static/', '01.dat');
            await isDirectoryTest(done, testNum, media_type, fetchOp)
        });
    });
}
