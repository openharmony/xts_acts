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
import account from '@ohos.account.osAccount'
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

const LAUNCHER_BUNDLE_NAME = 'com.example.myapplication1';
const LAUNCHER_MAIN_ABILITY = 'com.example.myapplication1.MainAbility';
const DEFAULT_FLAG = bundle.BundleFlag.GET_BUNDLE_DEFAULT;
const INVALID_CODE = 1;
let userId = 0;

export default function ActsBmsJsUnPermissionTest() {
describe('ActsBmsJsUnPermissionTest', function () {

    beforeAll(async function (done) {
        await account.getAccountManager().getOsAccountLocalIdFromProcess().then(account => {
            console.info("getOsAccountLocalIdFromProcess userid  ==========" + account);
            userId = account;
            done();
          }).catch(err=>{
            console.info("getOsAccountLocalIdFromProcess err ==========" + JSON.stringify(err));
            done();
          })
    });

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_0560
     * @tc.name: getApplicationInfoUnPermissionUserId
     * @tc.desc: test getApplicationInfo
     */
    it('getApplicationInfoUnPermissionUserId', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
        await bundle.getApplicationInfo(LAUNCHER_BUNDLE_NAME, DEFAULT_FLAG, userId).then(data => {
            expect().assertFail();
        }).catch(err => {
            expect(err.code).assertEqual(INVALID_CODE);
        });
        bundle.getApplicationInfo(LAUNCHER_BUNDLE_NAME, DEFAULT_FLAG, userId, (err, data) => {
            expect(err.code).assertEqual(INVALID_CODE);
            expect(data).assertEqual(undefined);
            done();
        });
    });

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_1120
     * @tc.name: getApplicationInfosUnPermissionUserId
     * @tc.desc: test getAllApplicationInfo
     */
    it('getApplicationInfosUnPermissionUserId', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
        await bundle.getAllApplicationInfo(DEFAULT_FLAG, userId).then(data => {
            expect().assertFail();
        }).catch(err => {
            expect(err.code).assertEqual(INVALID_CODE);
        });
        bundle.getAllApplicationInfo(DEFAULT_FLAG, userId, (err, data) => {
            expect(err.code).assertEqual(INVALID_CODE);
            expect(data).assertEqual(undefined);
            done();
        });
    });

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_2400
     * @tc.name: getBundleInfoUnPermissionUserId
     * @tc.desc: test getBundleInfo
     */
    it('getBundleInfoUnPermissionUserId', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
        await bundle.getBundleInfo(LAUNCHER_BUNDLE_NAME, userId).then(data => {
            expect().assertFail();
        }).catch(err => {
            expect(err).assertEqual(INVALID_CODE);
        });
        bundle.getBundleInfo(LAUNCHER_BUNDLE_NAME, userId, (err, data) => {
            expect(err).assertEqual(INVALID_CODE);
            expect(data).assertEqual(undefined);
            done();
        });
    });

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_2640
     * @tc.name: getAllBundleInfoUnPermission
     * @tc.desc: test getAllBundleInfo
     */
    it('getAllBundleInfoUnPermission', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
        await bundle.getAllBundleInfo(DEFAULT_FLAG).then(data => {
            expect().assertFail();
        }).catch(err => {
            expect(err).assertEqual(INVALID_CODE);
        });
        bundle.getAllBundleInfo(DEFAULT_FLAG, (err, data) => {
            expect(err).assertEqual(INVALID_CODE);
            expect(data).assertEqual(undefined);
            done();
        });
    });

    /*
     * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_2780
     * @tc.name: queryAbilityByWantUnPermission
     * @tc.desc: test queryAbilityByWant
     */
    it('queryAbilityByWantUnPermission', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
        await bundle.queryAbilityByWant({
            bundleName: LAUNCHER_BUNDLE_NAME,
            abilityName: LAUNCHER_MAIN_ABILITY
        }, DEFAULT_FLAG, userId).then(data => {
            expect().assertFail();
        }).catch(err => {
            expect(err).assertEqual(INVALID_CODE);
        });
        bundle.queryAbilityByWant({
            bundleName: LAUNCHER_BUNDLE_NAME,
            abilityName: LAUNCHER_MAIN_ABILITY
        }, DEFAULT_FLAG, userId, (err, data) => {
            console.info("data ===================:" + data);
            expect(err).assertEqual(INVALID_CODE);
            expect(data).assertEqual("QueryAbilityInfos failed");
            done();
        });
    });

    /*
     * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_2680
     * @tc.name: getLaunchWantForBundleUnPermission
     * @tc.desc: test getLaunchWantForBundle
     */
    it('getLaunchWantForBundleUnPermission', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
        await bundle.getLaunchWantForBundle(LAUNCHER_BUNDLE_NAME).then(data => {
            expect().assertFail();
        }).catch(err => {
            expect(err.code).assertEqual(INVALID_CODE);
        });
        bundle.getLaunchWantForBundle(LAUNCHER_BUNDLE_NAME, (err, data) => {
            expect(err.code).assertEqual(INVALID_CODE);
            expect(data).assertEqual(undefined);
            done();
        });
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_Label_4400
    * @tc.name: getAbilityLabelUnPermission
    * @tc.desc: Check the return value of the interface
    * @tc.level   0
    */
    it('getAbilityLabelUnPermission', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
        await bundle.getAbilityLabel(LAUNCHER_BUNDLE_NAME, LAUNCHER_MAIN_ABILITY)
            .then((data) => {
                expect().assertFail();
            })
            .catch((error) => {
                expect(error).assertEqual(INVALID_CODE);
            });
        bundle.getAbilityLabel(LAUNCHER_BUNDLE_NAME, LAUNCHER_MAIN_ABILITY, (err, data) => {
            expect(err).assertEqual(INVALID_CODE);
            expect(data).assertEqual(undefined);
            done();
        });
    });

    /*
     * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_2540
     * @tc.name: getAbilityInfoUnPermission
     * @tc.desc: test getAbilityInfo
     */
    it('getAbilityInfo_100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
        await bundle.getAbilityInfo(LAUNCHER_BUNDLE_NAME, LAUNCHER_MAIN_ABILITY).then(data => {
            expect().assertFail();
        }).catch(err => {
            expect(err).assertEqual(INVALID_CODE);
        });
        bundle.getAbilityInfo(LAUNCHER_BUNDLE_NAME, LAUNCHER_MAIN_ABILITY, (err, data) => {
            expect(err).assertEqual(INVALID_CODE);
            expect(data).assertEqual(undefined);
            done();
        });
    });
})
}
