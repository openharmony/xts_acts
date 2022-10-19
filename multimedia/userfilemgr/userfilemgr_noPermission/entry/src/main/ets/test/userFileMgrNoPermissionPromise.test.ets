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
    allFetchOp,
} from '../../../../../../common';


export default function userFileMgrNoPermissionPromise(abilityContext) {
    describe('userFileMgrNoPermissionPromise', function () {
        const userfilemgr = userFileManager.getUserFileMgr(abilityContext);
        beforeAll(async function () {
            console.info('beforeAll case');
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
        
        const getPhotoAlbumsTest = async function (done, testNum) {
            try {
                await userfilemgr.getPhotoAlbums(allFetchOp());
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum}, failed error: ${error}`)
                expect(true).assertTrue();
                done();
            }
        }

        const getPhotoAssetsTest = async function (done, testNum) {
            try {
                await userfilemgr.getPhotoAssets(allFetchOp());
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum}, failed error: ${error}`)
                expect(true).assertTrue();
                done();
            }
        }

        const getAudioAssetsTest = async function (done, testNum) {
            try {
                await userfilemgr.getAudioAssets(allFetchOp());
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum}, failed error: ${error}`)
                expect(true).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETALBUMS_NOPERMISSION_PROMISE_01
         * @tc.name      : getPhotoAlbums
         * @tc.desc      : getPhotoAlbums with no permission
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_USERFILE_MGR_GETALBUMS_NOPERMISSION_PROMISE_01', 1, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_GETALBUMS_NOPERMISSION_PROMISE_01';
            await getPhotoAlbumsTest(done, testNum);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETS_NOPERMISSION_PROMISE_01
         * @tc.name      : getPhotoAssets
         * @tc.desc      : getPhotoAssets with no permission
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETS_NOPERMISSION_PROMISE_01', 1, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETS_NOPERMISSION_PROMISE_01';
            await getPhotoAssetsTest(done, testNum);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETAUDIOASSETS_NOPERMISSION_PROMISE_01
         * @tc.name      : getAudioAssets
         * @tc.desc      : getAudioAssets with no permission
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
         it('SUB_USERFILE_MGR_GETAUDIOASSETS_NOPERMISSION_PROMISE_01', 1, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_GETAUDIOASSETS_NOPERMISSION_PROMISE_01';
            await getAudioAssetsTest(done, testNum);
        });
    });
}


