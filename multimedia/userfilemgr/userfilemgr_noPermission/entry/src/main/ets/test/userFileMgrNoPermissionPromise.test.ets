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
    allFetchOp,
} from '../../../../../../common';


export default function userFileMgrNoPermissionPromise(abilityContext) {
    describe('userFileMgrNoPermissionPromise', function () {
        const userfile_mgr = userfile_manager.getUserFileMgr(abilityContext);
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

        const getFileAssetsTest = async function (done, testNum, media_type) {
            try {
                await userfile_mgr.getFileAssets(media_type, allFetchOp());
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum}, failed error: ${error}`)
                expect(true).assertTrue();
                done();
            }
        }

        const createAssetTest = async function (done, testNum, type, name, path) {
            try {
                await userfile_mgr.createAsset(type, name, path);
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum}, failed error: ${error}`)
                expect(true).assertTrue();
                done();
            }
        }

        const getAlbumsTest = async function (done, testNum, media_type) {
            try {
                await userfile_mgr.getAlbums(media_type, allFetchOp());
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum}, failed error: ${error}`)
                expect(true).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_NOPERMISSION_PROMISE_01
         * @tc.name      : getFileAssets
         * @tc.desc      : getFileAssets(image) with no permission
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_NOPERMISSION_PROMISE_01', 0, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_NOPERMISSION_PROMISE_01';
            let media_type = [IMAGE_TYPE];
            await getFileAssetsTest(done, testNum, media_type);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_NOPERMISSION_PROMISE_02
         * @tc.name      : getFileAssets
         * @tc.desc      : getFileAssets(audio) with no permission
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_NOPERMISSION_PROMISE_02', 0, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_NOPERMISSION_PROMISE_02';
            let media_type = [AUDIO_TYPE];
            await getFileAssetsTest(done, testNum, media_type);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_NOPERMISSION_PROMISE_03
         * @tc.name      : getFileAssets
         * @tc.desc      : getFileAssets(video) with no permission
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_NOPERMISSION_PROMISE_03', 0, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_NOPERMISSION_PROMISE_03';
            let media_type = [VIDEO_TYPE];
            await getFileAssetsTest(done, testNum, media_type);
        });

        //---------------------------------------------------------------------------------------

        /**
         * @tc.number    : SUB_USERFILE_MGR_CREATEASSET_NOPERMISSION_PROMISE_01
         * @tc.name      : createAsset
         * @tc.desc      : createAsset(image) with no permission
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_CREATEASSET_NOPERMISSION_PROMISE_01', 0, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_CREATEASSET_NOPERMISSION_PROMISE_01';
            let type = IMAGE_TYPE;
            let name = new Date().getTime() + '.jpg';
            let path = 'Pictures/Create/';
            await createAssetTest(done, testNum, type, name, path);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_CREATEASSET_NOPERMISSION_PROMISE_02
         * @tc.name      : createAsset
         * @tc.desc      : createAsset(audio) with no permission
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_CREATEASSET_NOPERMISSION_PROMISE_02', 0, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_CREATEASSET_NOPERMISSION_PROMISE_02';
            let type = AUDIO_TYPE;
            let name = new Date().getTime() + '.mp3';
            let path = 'Audios/Create/';
            await createAssetTest(done, testNum, type, name, path);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_CREATEASSET_NOPERMISSION_PROMISE_03
         * @tc.name      : createAsset
         * @tc.desc      : createAsset(video) with no permission
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_CREATEASSET_NOPERMISSION_PROMISE_03', 0, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_CREATEASSET_NOPERMISSION_PROMISE_03';
            let type = VIDEO_TYPE;
            let name = new Date().getTime() + '.mp4';
            let path = 'Videos/Create/';
            await createAssetTest(done, testNum, type, name, path);
        });

        //--------------------------------------------------------------------------------------

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETALBUMS_NOPERMISSION_PROMISE_01
         * @tc.name      : getAlbums
         * @tc.desc      : getAlbums(image) with no permission
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETALBUMS_NOPERMISSION_PROMISE_01', 0, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_GETALBUMS_NOPERMISSION_PROMISE_01';
            let media_type = [IMAGE_TYPE];
            await getAlbumsTest(done, testNum, media_type);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETALBUMS_NOPERMISSION_PROMISE_02
         * @tc.name      : getAlbums
         * @tc.desc      : getAlbums(audio) with no permission
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETALBUMS_NOPERMISSION_PROMISE_02', 0, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_GETALBUMS_NOPERMISSION_PROMISE_02';
            let media_type = [AUDIO_TYPE];
            await getAlbumsTest(done, testNum, media_type);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETALBUMS_NOPERMISSION_PROMISE_03
         * @tc.name      : getAlbums
         * @tc.desc      : getAlbums(video) with no permission
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETALBUMS_NOPERMISSION_PROMISE_03', 0, async function (done) {
            const testNum = 'SUB_USERFILE_MGR_GETALBUMS_NOPERMISSION_PROMISE_03';
            let media_type = [VIDEO_TYPE];
            await getAlbumsTest(done, testNum, media_type);
        });
    });
}


