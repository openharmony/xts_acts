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
    albumFetchOps,
    checkPresetsAssets,
    checkAssetsCount,
    checkAlbumsCount,
} from '../../../../../../common';

export default function fileKeyTest(abilityContext) {
    describe('fileKeyTest', function () {
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

        const FileKey = userfile_manager.FileKey;
        const AudioKey = userfile_manager.AudioKey;
        const ImageVideoKey = userfile_manager.ImageVideoKey;
        const AlbumKey = userfile_manager.AlbumKey;

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_01_001
         * @tc.name      : FileKey
         * @tc.desc      : FileKey.URI
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_01_001', 0, async function (done) {
            let key = FileKey.URI;
            expect(key.toString()).assertEqual('uri');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_01_002
         * @tc.name      : FileKey
         * @tc.desc      : FileKey.RELATIVE_PATH
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_01_002', 0, async function (done) {
            let key = FileKey.RELATIVE_PATH;
            expect(key.toString()).assertEqual('relative_path');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_01_003
         * @tc.name      : FileKey
         * @tc.desc      : FileKey.DISPLAY_NAME
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_01_003', 0, async function (done) {
            let key = FileKey.DISPLAY_NAME;
            expect(key.toString()).assertEqual('display_name');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_01_004
         * @tc.name      : FileKey
         * @tc.desc      : FileKey.DATE_ADDED
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_01_004', 0, async function (done) {
            let key = FileKey.DATE_ADDED;
            expect(key.toString()).assertEqual('date_added');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_01_005
         * @tc.name      : FileKey
         * @tc.desc      : FileKey.DATE_MODIFIED
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_01_005', 0, async function (done) {
            let key = FileKey.DATE_MODIFIED;
            expect(key.toString()).assertEqual('date_modified');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_01_006
         * @tc.name      : FileKey
         * @tc.desc      : FileKey.TITLE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_01_006', 0, async function (done) {
            let key = FileKey.TITLE;
            expect(key.toString()).assertEqual('title');
            done();
        });

        //-----------------------------------------------------------------------------

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_02_001
         * @tc.name      : AudioKey
         * @tc.desc      : AudioKey.URI
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_02_001', 0, async function (done) {
            let key = AudioKey.URI;
            expect(key.toString()).assertEqual('uri');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_02_002
         * @tc.name      : AudioKey
         * @tc.desc      : AudioKey.RELATIVE_PATH
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_02_002', 0, async function (done) {
            let key = AudioKey.RELATIVE_PATH;
            expect(key.toString()).assertEqual('relative_path');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_02_003
         * @tc.name      : AudioKey
         * @tc.desc      : AudioKey.DISPLAY_NAME
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_02_003', 0, async function (done) {
            let key = AudioKey.DISPLAY_NAME;
            expect(key.toString()).assertEqual('display_name');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_02_004
         * @tc.name      : AudioKey
         * @tc.desc      : AudioKey.DATE_ADDED
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_02_004', 0, async function (done) {
            let key = AudioKey.DATE_ADDED;
            expect(key.toString()).assertEqual('date_added');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_02_005
         * @tc.name      : AudioKey
         * @tc.desc      : AudioKey.DATE_MODIFIED
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_02_005', 0, async function (done) {
            let key = AudioKey.DATE_MODIFIED;
            expect(key.toString()).assertEqual('date_modified');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_02_006
         * @tc.name      : AudioKey
         * @tc.desc      : AudioKey.TITLE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_02_006', 0, async function (done) {
            let key = AudioKey.TITLE;
            expect(key.toString()).assertEqual('title');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_02_007
         * @tc.name      : AudioKey
         * @tc.desc      : AudioKey.ARTIST
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_02_007', 0, async function (done) {
            let key = AudioKey.ARTIST;
            expect(key.toString()).assertEqual('artist');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_02_008
         * @tc.name      : AudioKey
         * @tc.desc      : AudioKey.AUDIOALBUM
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_02_008', 0, async function (done) {
            let key = AudioKey.AUDIOALBUM;
            expect(key.toString()).assertEqual('audio_album');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_02_009
         * @tc.name      : AudioKey
         * @tc.desc      : AudioKey.DURATION
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_02_009', 0, async function (done) {
            let key = AudioKey.DURATION;
            expect(key.toString()).assertEqual('duration');
            done();
        });

        //-----------------------------------------------------------------------------

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_001
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.URI
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_001', 0, async function (done) {
            let key = ImageVideoKey.URI;
            expect(key.toString()).assertEqual('uri');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_002
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.RELATIVE_PATH
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_002', 0, async function (done) {
            let key = ImageVideoKey.RELATIVE_PATH;
            expect(key.toString()).assertEqual('relative_path');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_003
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.DISPLAY_NAME
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_003', 0, async function (done) {
            let key = ImageVideoKey.DISPLAY_NAME;
            expect(key.toString()).assertEqual('display_name');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_004
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.DATE_ADDED
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_004', 0, async function (done) {
            let key = ImageVideoKey.DATE_ADDED;
            expect(key.toString()).assertEqual('date_added');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_005
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.DATE_MODIFIED
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_005', 0, async function (done) {
            let key = ImageVideoKey.DATE_MODIFIED;
            expect(key.toString()).assertEqual('date_modified');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_006
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.TITLE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_006', 0, async function (done) {
            let key = ImageVideoKey.TITLE;
            expect(key.toString()).assertEqual('title');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_007
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.DURATION
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_007', 0, async function (done) {
            let key = ImageVideoKey.DURATION;
            expect(key.toString()).assertEqual('duration');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_008
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.WIDTH
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_008', 0, async function (done) {
            let key = ImageVideoKey.WIDTH;
            expect(key.toString()).assertEqual('width');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_009
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.HEIGHT
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_009', 0, async function (done) {
            let key = ImageVideoKey.HEIGHT;
            expect(key.toString()).assertEqual('height');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_010
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.DATE_TAKEN
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETBYKEY_CALLBACK_03_010', 0, async function (done) {
            let key = ImageVideoKey.DATE_TAKEN;
            expect(key.toString()).assertEqual('date_taken');
            done();
        });

        //-----------------------------------------------------------------------------

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETALBUMSBYKEY_CALLBACK_01
         * @tc.name      : AlbumKey
         * @tc.desc      : AlbumKey.URI
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETALBUMSBYKEY_CALLBACK_01', 0, async function (done) {
            let key = AlbumKey.URI;
            expect(key.toString()).assertEqual('uri');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETALBUMSBYKEY_CALLBACK_02
         * @tc.name      : AlbumKey
         * @tc.desc      : AlbumKey.RELATIVE_PATH
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETALBUMSBYKEY_CALLBACK_02', 0, async function (done) {
            let key = AlbumKey.RELATIVE_PATH;
            expect(key.toString()).assertEqual('relative_path');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETALBUMSBYKEY_CALLBACK_03
         * @tc.name      : AlbumKey
         * @tc.desc      : AlbumKey.DISPLAY_NAME
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETALBUMSBYKEY_CALLBACK_03', 0, async function (done) {
            let key = AlbumKey.DISPLAY_NAME;
            expect(key.toString()).assertEqual('display_name');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETALBUMSBYKEY_CALLBACK_04
         * @tc.name      : AlbumKey
         * @tc.desc      : AlbumKey.DATE_ADDED
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETALBUMSBYKEY_CALLBACK_04', 0, async function (done) {
            let key = AlbumKey.DATE_ADDED;
            expect(key.toString()).assertEqual('date_added');
            done();
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETALBUMSBYKEY_CALLBACK_05
         * @tc.name      : AlbumKey
         * @tc.desc      : AlbumKey.DATE_MODIFIED
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETALBUMSBYKEY_CALLBACK_05', 0, async function (done) {
            let key = AlbumKey.DATE_MODIFIED;
            expect(key.toString()).assertEqual('date_modified');
            done();
        });
    });
}

