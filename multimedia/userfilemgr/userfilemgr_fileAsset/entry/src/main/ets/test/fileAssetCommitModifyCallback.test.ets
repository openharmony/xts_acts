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
    IMAGE_TYPE,
    VIDEO_TYPE,
    AUDIO_TYPE,
    audioNameFetchOps,
    imageVideoNameFetchOps,
    checkPresetsAssets,
    checkAssetsCount,
    getPermission,
} from '../../../../../../common';

export default function fileAssetCommitModifyCallbackTest(abilityContext) {
    describe('fileAssetCommitModifyCallbackTest', function () {
        const userfilemgr = userFileManager.getUserFileMgr(abilityContext);
        beforeAll(async function () {
            console.info('beforeAll case');
            await getPermission();
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

        const checkCommitModify = async function (done, testNum, fetchOp, prop, val, isAudio) {
            try {
                let fetchAssetResult;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(fetchOp);
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOp);
                }
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, 1);
                if (!checkAssetCountPass) return;
                const asset = await fetchAssetResult.getFirstObject();
                const oldVal = asset.get(prop);
                asset.set(prop, val);
                await asset.commitModify(async (err) => {
                    if (err) {
                        console.info(`${testNum} err : ${err}`)
                        expect.assertFail();
                        done();
                        return;
                    }
                    asset.set(prop, oldVal.toString());
                    await asset.commitModify();
                    fetchAssetResult.close();
                    done();
                });
            } catch (error) {
                console.info(`${testNum} error : ${error}`)
                expect(false).assertTrue();
                done();
            }
        }
        
        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_COMMITMODIFY_CALLBACK_01
         * @tc.name      : commitModify
         * @tc.desc      : image asset modify displayName
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_COMMITMODIFY_CALLBACK_01', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_COMMITMODIFY_CALLBACK_01';
            let fetchOp = imageVideoNameFetchOps(testNum, 'Pictures/ModifyCb/', '01.jpg');
            let prop = 'display_name';
            let val = IMAGE_TYPE.toString() + '.jpg';
            let isAudio = false;
            await checkCommitModify(done, testNum, fetchOp, prop, val, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_COMMITMODIFY_CALLBACK_02
         * @tc.name      : commitModify
         * @tc.desc      : audio asset modify displayName
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_COMMITMODIFY_CALLBACK_02', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_COMMITMODIFY_CALLBACK_02';
            let fetchOp = audioNameFetchOps(testNum, 'Audios/ModifyCb/', '01.mp3');
            let prop = 'display_name';
            let val = AUDIO_TYPE.toString() + '.mp3';
            let isAudio = true;
            await checkCommitModify(done, testNum, fetchOp, prop, val, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_COMMITMODIFY_CALLBACK_03
         * @tc.name      : commitModify
         * @tc.desc      : video asset modify displayName
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_FILEASSET_COMMITMODIFY_CALLBACK_03', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_COMMITMODIFY_CALLBACK_03';
            let fetchOp = imageVideoNameFetchOps(testNum, 'Videos/ModifyCb/', '01.mp4');
            let prop = 'display_name';
            let val = VIDEO_TYPE.toString() + '.mp4';
            let isAudio = false;
            await checkCommitModify(done, testNum, fetchOp, prop, val, isAudio);
        });
    });
}

