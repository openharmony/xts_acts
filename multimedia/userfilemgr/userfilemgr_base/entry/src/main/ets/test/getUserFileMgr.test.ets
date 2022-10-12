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
import { sleep } from '../../../../../../common';

export default function getUserFileMgrTest(abilityContext) {
    describe('getUserFileMgrTest', function () {
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

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETUSERFILEMGR_00
         * @tc.name      : getUserFileMgr
         * @tc.desc      : Obtains a userFileMgr instance 
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETUSERFILEMGR_00', 0, async function (done) {
            try {
                expect(userfilemgr != undefined).assertTrue();
                done();
            } catch (error) {
                console.info(`SUB_USERFILE_MGR_GETUSERFILEMGR_00 failed, error: ${error}`);
                expect(false).assertTrue();
                done();
            }
        });
    });
}


