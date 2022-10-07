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
} from '../../../../../../common';


export default function getPublicDirectoryCallbackTest(abilityContext) {
    describe('getPublicDirectoryCallbackTest', function () {
        const userfilemgr = userfile_manager.getUserFileMgr(abilityContext);
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

        const getetPublicDirectoryTest = async (done, testNum, dir, val) => {
            try {
                userfilemgr.getPublicDirectory(dir, async (err, res) => {
                    if (err) {
                        console.info(`${testNum} err : ${err}`)
                        expect.assertFail();
                        done();
                        return;
                    }
                    expect(res).assertEqual(val);
                    done();
                });
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }

         /**
         * @tc.number    : SUB_USERFILE_MGR_GETPUBLICDIRECTORY_CALLBACK_01
         * @tc.name      : getPublicDirectory
         * @tc.desc      : getPublicDirectory DIR_CAMERA
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPUBLICDIRECTORY_CALLBACK_01', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPUBLICDIRECTORY_CALLBACK_01';
            let dir = userfile_manager.DirectoryType.DIR_CAMERA;
            let val = 'Camera/';
            await getetPublicDirectoryTest(done, testNum, dir, val)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPUBLICDIRECTORY_CALLBACK_02
         * @tc.name      : getPublicDirectory
         * @tc.desc      : getPublicDirectory DIR_VIDEO
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPUBLICDIRECTORY_CALLBACK_02', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPUBLICDIRECTORY_CALLBACK_02';
            let dir = userfile_manager.DirectoryType.DIR_VIDEO;
            let val = 'Videos/';
            await getetPublicDirectoryTest(done, testNum, dir, val)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPUBLICDIRECTORY_CALLBACK_03
         * @tc.name      : getPublicDirectory
         * @tc.desc      : getPublicDirectory DIR_IMAGE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPUBLICDIRECTORY_CALLBACK_03', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPUBLICDIRECTORY_CALLBACK_03';
            let dir = userfile_manager.DirectoryType.DIR_IMAGE;
            let val = 'Pictures/';
            await getetPublicDirectoryTest(done, testNum, dir, val)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPUBLICDIRECTORY_CALLBACK_04
         * @tc.name      : getPublicDirectory
         * @tc.desc      : getPublicDirectory DIR_AUDIO
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPUBLICDIRECTORY_CALLBACK_04', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPUBLICDIRECTORY_CALLBACK_04';
            let dir = userfile_manager.DirectoryType.DIR_AUDIO;
            let val = 'Audios/';
            await getetPublicDirectoryTest(done, testNum, dir, val)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPUBLICDIRECTORY_CALLBACK_05
         * @tc.name      : getPublicDirectory
         * @tc.desc      : getPublicDirectory DIR_IMAGE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPUBLICDIRECTORY_CALLBACK_05', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPUBLICDIRECTORY_CALLBACK_05';
            let dir = userfile_manager.DirectoryType.DIR_DOCUMENTS;
            let val = 'Documents/';
            await getetPublicDirectoryTest(done, testNum, dir, val)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPUBLICDIRECTORY_CALLBACK_06
         * @tc.name      : getPublicDirectory
         * @tc.desc      : getPublicDirectory DIR_DOWNLOAD
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPUBLICDIRECTORY_CALLBACK_06', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPUBLICDIRECTORY_CALLBACK_06';
            let dir = userfile_manager.DirectoryType.DIR_DOWNLOAD;
            let val = 'Download/';
            await getetPublicDirectoryTest(done, testNum, dir, val)
        });
    });
}


