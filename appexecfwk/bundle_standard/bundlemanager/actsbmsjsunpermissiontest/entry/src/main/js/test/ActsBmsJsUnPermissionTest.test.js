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
import innerBundleManager from '@ohos.bundle.innerBundleManager'
import { describe, it, expect } from 'deccjsunit/index'

const STATUS_INSTALL_PERMISSION_DENIED = 0X44;
const STATUS_UNINSTALL_PERMISSION_DENIED = 0X45;
const LAUNCHER_BUNDLE_NAME = 'com.ohos.launcher';
const LAUNCHER_MAIN_ABILITY = 'com.ohos.launcher.MainAbility';
const DEFAULT_FLAG = 0;
const DEFAULT_USER_ID = 100;
const INVALID_CODE = 1;
const BUNDLE_PATH = ['/data/test/bmsJstest1.hap'];
const BUNDLE_NAME1 = 'com.example.myapplication1';
let installParam = {
    userId: 100,
    installFlag: 1,
    isKeepData: false
};

describe('ActsBmsJsUnPermissionTest', function () {

    /*
     * @tc.number: bms_JsInstallPermissionTest_0100
     * @tc.name: test js install
     * @tc.desc: test js install
     */
    it('bms_JsInstallPermissionTest_0100', 0, async function (done) {
        let installer = await bundle.getBundleInstaller();
        installer.install(BUNDLE_PATH, installParam, OnReceiveInstallEvent);
        async function OnReceiveInstallEvent(err, data) {
            expect(err.code).assertEqual(-1);
            expect(data.status).assertEqual(STATUS_INSTALL_PERMISSION_DENIED);
            expect(data.statusMessage).assertEqual("STATUS_INSTALL_PERMISSION_DENIED");
            done();
        }
    });

    /*
     * @tc.number: bms_JsUnInstallPermissionTest_0100
     * @tc.name: test js uninstall
     * @tc.desc: test js uninstall
     */
    it('bms_JsUnInstallPermissionTest_0100', 0, async function (done) {
        let installer = await bundle.getBundleInstaller();
        installer.uninstall(BUNDLE_NAME1, installParam, OnReceiveUnInstallEvent);
        async function OnReceiveUnInstallEvent(err, data) {
            expect(err.code).assertEqual(-1);
            expect(data.status).assertEqual(STATUS_UNINSTALL_PERMISSION_DENIED);
            expect(data.statusMessage).assertEqual("STATUS_UNINSTALL_PERMISSION_DENIED");
            done();
        }
    });

    /*
     * @tc.number: getApplicationInfoTest_100
     * @tc.name: test getApplicationInfo
     * @tc.desc: test getApplicationInfo
     */
    it('getApplicationInfoTest_100', 0, async function (done) {
        await bundle.getApplicationInfo(LAUNCHER_BUNDLE_NAME, DEFAULT_FLAG, DEFAULT_USER_ID).then(data => {
            expect().assertFail();
            done();
        }).catch(err => {
            expect(err).assertEqual(INVALID_CODE);
            done();
        });
    });

    /*
     * @tc.number: getAllApplicationInfoTest_100
     * @tc.name: test getAllApplicationInfo
     * @tc.desc: test getAllApplicationInfo
     */
    it('getAllApplicationInfoTest_100', 0, async function (done) {
        await bundle.getAllApplicationInfo(DEFAULT_FLAG, DEFAULT_USER_ID).then(data => {
            expect().assertFail();
            done();
        }).catch(err => {
            expect(err).assertEqual(INVALID_CODE);
            done();
        });
    });

    /*
     * @tc.number: getBundleInfoTest_100
     * @tc.name: test getBundleInfo
     * @tc.desc: test getBundleInfo
     */
    it('getBundleInfoTest_100', 0, async function (done) {
        await bundle.getBundleInfo(LAUNCHER_BUNDLE_NAME, DEFAULT_USER_ID).then(data => {
            expect().assertFail();
            done();
        }).catch(err => {
            expect(err).assertEqual(INVALID_CODE);
            done();
        });
    });

    /*
     * @tc.number: getAllBundleInfoTest_100
     * @tc.name: test getAllBundleInfo
     * @tc.desc: test getAllBundleInfo
     */
    it('getAllBundleInfoTest_100', 0, async function (done) {
        await bundle.getAllBundleInfo(DEFAULT_FLAG).then(data => {
            expect().assertFail();
            done();
        }).catch(err => {
            expect(err).assertEqual(INVALID_CODE);
            done();
        });
    });

    /*
     * @tc.number: queryAbilityByWantTest_100
     * @tc.name: test queryAbilityByWant
     * @tc.desc: test queryAbilityByWant
     */
    it('queryAbilityByWantTest_100', 0, async function (done) {
        await bundle.queryAbilityByWant({
            bundleName: LAUNCHER_BUNDLE_NAME,
            abilityName: LAUNCHER_MAIN_ABILITY
        }, DEFAULT_FLAG, DEFAULT_USER_ID).then(data => {
            expect().assertFail();
            done();
        }).catch(err => {
            expect(err).assertEqual(INVALID_CODE);
            done();
        });
    });

    /*
     * @tc.number: getLaunchWantForBundleTest_100
     * @tc.name: test getLaunchWantForBundle
     * @tc.desc: test getLaunchWantForBundle
     */
    it('getLaunchWantForBundleTest_100', 0, async function (done) {
        await bundle.getLaunchWantForBundle(LAUNCHER_BUNDLE_NAME).then(data => {
            expect().assertFail();
            done();
        }).catch(err => {
            expect(err).assertEqual(INVALID_CODE);
            done();
        });
    });

    /*
     * @tc.number: setApplicationEnabledTest_100
     * @tc.name: test setApplicationEnabled
     * @tc.desc: test setApplicationEnabled
     */
    it('setApplicationEnabledTest_100', 0, async function (done) {
        await bundle.setApplicationEnabled(LAUNCHER_BUNDLE_NAME, false).then(data => {
            expect().assertFail();
            done();
        }).catch(err => {
            expect(err).assertEqual(INVALID_CODE);
            done();
        });
    });

    /*
     * @tc.number: setAbilityEnabledTest_100
     * @tc.name: test setAbilityEnabled
     * @tc.desc: test setAbilityEnabled
     */
    it('setAbilityEnabledTest_100', 0, async function (done) {
        let abilityInfo = {
            bundleName: LAUNCHER_BUNDLE_NAME,
            name: LAUNCHER_MAIN_ABILITY
        };
        await bundle.setAbilityEnabled(abilityInfo, false).then(data => {
            expect().assertFail();
            done();
        }).catch(err => {
            expect(err).assertEqual(INVALID_CODE);
            done();
        });
    });

    /*
     * @tc.number: getLauncherAbilityInfosTest_100
     * @tc.name: test getLauncherAbilityInfos
     * @tc.desc: test getLauncherAbilityInfos
     */
    it('getLauncherAbilityInfosTest_100', 0, async function (done) {
        await innerBundleManager.getLauncherAbilityInfos(LAUNCHER_BUNDLE_NAME, DEFAULT_USER_ID).then(data => {
            expect().assertFail();
            done();
        }).catch(err => {
            expect(err).assertEqual(INVALID_CODE);
            done();
        });
    });

    /*
     * @tc.number: getAllLauncherAbilityInfosTest_100
     * @tc.name: test getAllLauncherAbilityInfos
     * @tc.desc: test getAllLauncherAbilityInfos
     */
    it('getAllLauncherAbilityInfosTest_100', 0, async function (done) {
        await innerBundleManager.getAllLauncherAbilityInfos(DEFAULT_USER_ID).then(data => {
            expect().assertFail();
            done();
        }).catch(err => {
            expect(err).assertEqual(INVALID_CODE);
            done();
        });
    });

    /*
     * @tc.number: getShortcutInfosTest_100
     * @tc.name: test getShortcutInfos
     * @tc.desc: test getShortcutInfos
     */
    it('getShortcutInfosTest_100', 0, async function (done) {
        await innerBundleManager.getShortcutInfos(LAUNCHER_BUNDLE_NAME).then(data => {
            expect().assertFail();
            done();
        }).catch(err => {
            expect(err).assertEqual(INVALID_CODE);
            done();
        });
    });

    /*
     * @tc.number: getAbilityLabelTest_100
     * @tc.name: getAbilityLabel : Gets the specified ability label
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level   0
     */
    it('getAbilityLabelTest_100', 0, async function (done) {
        await bundle.getAbilityLabel(LAUNCHER_BUNDLE_NAME, LAUNCHER_MAIN_ABILITY)
            .then((data) => {
                expect().assertFail();
                done();
            })
            .catch((error) => {
                expect(error).assertEqual(INVALID_CODE);
                done();
            });
    });

    /*
     * @tc.number: getAbilityInfo_100
     * @tc.name: test getAbilityInfo
     * @tc.desc: test getAbilityInfo
     */
    it('getAbilityInfo_100', 0, async function (done) {
        await bundle.getAbilityInfo(LAUNCHER_BUNDLE_NAME, LAUNCHER_MAIN_ABILITY).then(data => {
            expect().assertFail();
            done();
        }).catch(err => {
            expect(err).assertEqual(INVALID_CODE);
            done();
        });
    });
})
