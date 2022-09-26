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
    checkPresetsAssets,
    checkAssetsCount,
    allFetchOp,
    fetchOps,
} from '../../../../../../common';


export default function getFileAssetsCallback(abilityContext) {
    describe('getFileAssetsCallback', function () {
        const userfile_mgr = userfile_manager.getUserFileMgr(abilityContext);
        beforeAll(async function () {
            console.info('beforeAll case');
            await checkPresetsAssets(userfile_mgr, 'ActsUserFileMgrBase');
        });
        beforeEach(function () {
            console.info('beforeEach case');
        });
        afterEach(async function () {
            console.info('afterEach case');
            await sleep(500)
        });
        afterAll(function () {
            console.info('afterAll case');
        });

        const props = {
            image: {
                displayName: '01.jpg',
                mediaType: IMAGE_TYPE.toString(),
            },
            video: {
                displayName: '01.mp4',
                relativePath: 'Videos/Static/',
                mediaType: VIDEO_TYPE.toString(),
            },
            audio: {
                displayName: '01.mp3',
                mediaType: AUDIO_TYPE.toString(),
            },
        }

        async function checkFileAssetAttr(done, testNum, media_type, fetchOps, type, count) {
            try {
                const fetchFileResult = await userfile_mgr.getFileAssets(media_type, fetchOps);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, count);
                if (!checkAssetCountPass) return;
                fetchFileResult.getFirstObject(async (err, asset) => {
                    if (err) {
                        console.info(`${testNum} err : ${err}`)
                        expect.assertFail();
                        done();
                        return;
                    }
                    expect(asset.displayName).assertEqual(props[type].displayName);
                    expect(asset.mediaType.toString()).assertEqual(props[type].mediaType);
                    done();
                });
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_CALLBACK_01
         * @tc.name      : getFileAssets
         * @tc.desc      : query image assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_CALLBACK_01', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_CALLBACK_01';
            let media_type = [IMAGE_TYPE];
            let currentFetchOps = fetchOps(testNum, 'Pictures/Static/');
            let type = 'image';
            let count = 1;
            await checkFileAssetAttr(done, testNum, media_type, currentFetchOps, type, count)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_CALLBACK_02
         * @tc.name      : getFileAssets
         * @tc.desc      : query audio assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_CALLBACK_02', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_CALLBACK_02';
            let media_type = [AUDIO_TYPE];
            let currentFetchOps = fetchOps(testNum, 'Audios/Static/');
            let type = 'audio';
            let count = 1;
            await checkFileAssetAttr(done, testNum, media_type, currentFetchOps, type, count)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_CALLBACK_03
         * @tc.name      : getFileAssets
         * @tc.desc      : query video assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_CALLBACK_03', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_CALLBACK_03';
            let media_type = [VIDEO_TYPE];
            let currentFetchOps = fetchOps(testNum, 'Videos/Static/');
            let type = 'video';
            let count = 1;
            await checkFileAssetAttr(done, testNum, media_type, currentFetchOps, type, count)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_CALLBACK_04
         * @tc.name      : getFileAssets
         * @tc.desc      : query assets by abnormal
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_CALLBACK_04', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_CALLBACK_04';
            try {
                let media_type = [-1];
                let currentFetchOps = allFetchOp();
                userfile_mgr.getFileAssets(media_type, fetchOps, async (err, fetchFileResult) => {
                    console.info(`${testNum}, err: ${err}`);
                    if (err != undefined) {
                        expect(true).assertTrue();
                        done();
                        return;
                    }
                    expect(false).assertTrue();
                    done();
                });
                
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(true).assertTrue();
                done();
            }
        });
    });
}

