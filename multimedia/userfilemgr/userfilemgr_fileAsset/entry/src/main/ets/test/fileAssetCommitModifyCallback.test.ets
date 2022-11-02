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
import dataSharePredicates from '@ohos.data.dataSharePredicates';

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
                let fileKey;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(fetchOp);
                    fileKey = userFileManager.AudioKey;
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOp);
                    fileKey = userFileManager.ImageVideoKey;
                }
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, 1);
                if (!checkAssetCountPass) return;
                const asset = await fetchAssetResult.getFirstObject();
                fetchAssetResult.close();
                asset.set(prop, val);
                await asset.commitModify(async (err) => {
                    if (err) {
                        console.info(`${testNum} err : ${err}`)
                        expect.assertFail();
                        done();
                        return;
                    }
                    let predicates = new dataSharePredicates.DataSharePredicates();
                    predicates.equalTo(fileKey.URI, asset.get(fileKey.URI));
                    let ops = {
                        fetchColumns: [],
                        predicates: predicates
                    };
                    let newResult;
                    if (isAudio) {
                        newResult = await userfilemgr.getAudioAssets(ops);
                    } else {
                        newResult = await userfilemgr.getPhotoAssets(ops);
                    }
                    let checkAssetCountPass = await checkAssetsCount(done, testNum, newResult, 1);
                    if (!checkAssetCountPass) return;
                    const newAsset = await newResult.getFirstObject();
                    newResult.close();
                    expect(newAsset.get(fileKey.TITLE)).assertEqual(val);
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
         * @tc.desc      : image asset modify title
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_FILEASSET_COMMITMODIFY_CALLBACK_01', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_COMMITMODIFY_CALLBACK_01';
            let fetchOp = imageVideoNameFetchOps(testNum, 'Pictures/ModifyCb/', '01.jpg');
            let prop = 'title';
            let val = IMAGE_TYPE.toString();
            let isAudio = false;
            await checkCommitModify(done, testNum, fetchOp, prop, val, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_COMMITMODIFY_CALLBACK_02
         * @tc.name      : commitModify
         * @tc.desc      : video asset modify title
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_FILEASSET_COMMITMODIFY_CALLBACK_02', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_COMMITMODIFY_CALLBACK_02';
            let fetchOp = imageVideoNameFetchOps(testNum, 'Videos/ModifyCb/', '01.mp4');
            let prop = 'title';
            let val = VIDEO_TYPE.toString();
            let isAudio = false;
            await checkCommitModify(done, testNum, fetchOp, prop, val, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_COMMITMODIFY_CALLBACK_03
         * @tc.name      : commitModify
         * @tc.desc      : audio asset modify title
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_COMMITMODIFY_CALLBACK_03', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_COMMITMODIFY_CALLBACK_03';
            let fetchOp = audioNameFetchOps(testNum, 'Audios/ModifyCb/', '01.mp3');
            let prop = 'title';
            let val = AUDIO_TYPE.toString();
            let isAudio = true;
            await checkCommitModify(done, testNum, fetchOp, prop, val, isAudio);
        });
    });
}

