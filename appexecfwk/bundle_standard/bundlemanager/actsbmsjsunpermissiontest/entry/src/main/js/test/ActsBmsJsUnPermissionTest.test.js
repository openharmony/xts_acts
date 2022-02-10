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

import bundle from '@ohos.bundle'
import { describe, it, expect } from 'deccjsunit/index'

const STATUS_INSTALL_PERMISSION_DENIED = 0X44;
const STATUS_UNINSTALL_PERMISSION_DENIED = 0X45;
describe('ActsBmsJsUnPermissionTest', function () {

    /*
     * @tc.number: bms_JsInstallPermissionTest_0100
     * @tc.name: test js install
     * @tc.desc: test js install
     */
    it('bms_JsInstallPermissionTest_0100', 0, async function (done) {
        console.info('bms_JsInstallPermissionTest start');
        var bundlePath = ['/data/test/bmsJstest1.hap'];
        let installer = await bundle.getBundleInstaller();
        installer.install(bundlePath, {
            userId: 100,
            installFlag: 1,
            isKeepData: false
        }, OnReceiveInstallEvent);
        async function OnReceiveInstallEvent(err, data) {
            expect(err.code).assertEqual(-1);
            expect(data.status).assertEqual(STATUS_INSTALL_PERMISSION_DENIED);
            expect(data.statusMessage).assertEqual("STATUS_INSTALL_PERMISSION_DENIED");
            done();
        };
    });

    /*
     * @tc.number: bms_JsUnInstallPermissionTest_0100
     * @tc.name: test js uninstall
     * @tc.desc: test js uninstall
     */
    it('bms_JsUnInstallPermissionTest_0100', 0, async function (done) {
        console.info('bms_JsUnInstallPermissionTest start');
        var bundleName = 'com.example.myapplication1';
        let installer = await bundle.getBundleInstaller();
        installer.uninstall(bundleName, {
            userId: 100,
            installFlag: 1,
            isKeepData: false
        }, OnReceiveUnInstallEvent);
        async function OnReceiveUnInstallEvent(err, data) {
            expect(err.code).assertEqual(-1);
            expect(data.status).assertEqual(STATUS_UNINSTALL_PERMISSION_DENIED);
            expect(data.statusMessage).assertEqual("STATUS_UNINSTALL_PERMISSION_DENIED");
            done();
        };
    });
})
