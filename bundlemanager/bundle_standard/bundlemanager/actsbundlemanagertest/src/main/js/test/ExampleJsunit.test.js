/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import app from '@system.app'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import demo from '@ohos.bundle'
import account from '@ohos.account.osAccount'


export default function ActsBundleManagerTest() {
describe('ActsBundleManagerTest', function () {

    /**
    * @tc.number installErrCodeTest_0100
    * @tc.name InstallErrorCode::STATUS_FAILED_NO_SPACE_LEFT
    * @tc.desc Test install errcode STATUS_FAILED_NO_SPACE_LEFT.
    */
    it('installErrCodeTest_0100', 0, async function (done) {
        expect(demo.InstallErrorCode.SUCCESS).assertEqual(0);
        expect(demo.InstallErrorCode.STATUS_INSTALL_FAILURE).assertEqual(1);
        expect(demo.InstallErrorCode.STATUS_INSTALL_FAILURE_ABORTED).assertEqual(2);
        expect(demo.InstallErrorCode.STATUS_INSTALL_FAILURE_INVALID).assertEqual(3);
        expect(demo.InstallErrorCode.STATUS_INSTALL_FAILURE_CONFLICT).assertEqual(4);
        expect(demo.InstallErrorCode.STATUS_INSTALL_FAILURE_STORAGE).assertEqual(5);
        expect(demo.InstallErrorCode.STATUS_INSTALL_FAILURE_INCOMPATIBLE).assertEqual(6);
        expect(demo.InstallErrorCode.STATUS_UNINSTALL_FAILURE).assertEqual(7);
        expect(demo.InstallErrorCode.STATUS_UNINSTALL_FAILURE_BLOCKED).assertEqual(8);
        expect(demo.InstallErrorCode.STATUS_UNINSTALL_FAILURE_ABORTED).assertEqual(9);
        expect(demo.InstallErrorCode.STATUS_UNINSTALL_FAILURE_CONFLICT).assertEqual(10);
        expect(demo.InstallErrorCode.STATUS_INSTALL_FAILURE_DOWNLOAD_TIMEOUT).assertEqual(11);
        expect(demo.InstallErrorCode.STATUS_INSTALL_FAILURE_DOWNLOAD_FAILED).assertEqual(12);
        expect(demo.InstallErrorCode.STATUS_RECOVER_FAILURE_INVALID).assertEqual(13);
        expect(demo.InstallErrorCode.STATUS_ABILITY_NOT_FOUND).assertEqual(64);
        expect(demo.InstallErrorCode.STATUS_BMS_SERVICE_ERROR).assertEqual(65);
        expect(demo.InstallErrorCode.STATUS_FAILED_NO_SPACE_LEFT).assertEqual(66);
        expect(demo.InstallErrorCode.STATUS_GRANT_REQUEST_PERMISSIONS_FAILED).assertEqual(67);
        expect(demo.InstallErrorCode.STATUS_INSTALL_PERMISSION_DENIED).assertEqual(68);
        expect(demo.InstallErrorCode.STATUS_UNINSTALL_PERMISSION_DENIED).assertEqual(69);
        done();
    })

    /**
    * @tc.number AbilityTypeTest_0100
    * @tc.name InstallErrorCode::STATUS_FAILED_NO_SPACE_LEFT
    * @tc.desc Test install errcode STATUS_FAILED_NO_SPACE_LEFT.
    */
    it('AbilityTypeTest_0100', 0, async function (done) {
        expect(demo.AbilitySubType.CA).assertEqual(1);
        expect(demo.AbilityType.UNKNOWN).assertEqual(0);
        expect(demo.ColorMode.AUTO_MODE).assertEqual(-1);
        expect(demo.ColorMode.DARK_MODE).assertEqual(0);
        expect(demo.ColorMode.LIGHT_MODE).assertEqual(1);
        done();
    })
})

}
