/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "hypium/index"
import {
    WANT1, ENTINFO1, SELFWANT, SELFHAPNAME, COMPANYNAME2, DESCRIPTION2,
    ENTINFO2, DEFAULT_USER_ID, TEST_USER_ID, ERR_USER_ID
} from "./commom.ets";
import enterpriseDeviceManager from '@ohos.enterpriseDeviceManager'

export default function edmCallbackTest() {

  describe('edmCallback_test', function () {
    /**
    * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0001
    * @tc.name test enableAdmin method in callback mode without user id
    * @tc.desc enable admin in callback mode
    */
    it('enableAdmin_test_002', 0, async function (done) {
        await enterpriseDeviceManager.enableAdmin(WANT1, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, OnReceiveEvent);
        async function OnReceiveEvent(err, datainfo) {
            console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL :' + datainfo);
            expect(datainfo).assertTrue();

            var isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1);
            console.log('enterpriseDeviceManager.isAdminEnabled :' + isEnabled);
            expect(isEnabled).assertTrue();

            var retValue = await enterpriseDeviceManager.disableAdmin(WANT1);
            console.log('enterpriseDeviceManager.disableAdmin : ' + retValue);
            expect(retValue).assertTrue();

            isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1);
            console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);
            expect(isEnabled).assertFalse();
            done();
        }
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0004
     * @tc.name test enableAdmin method in callback mode with ADMIN_TYPE_SUPER param without user id
     * @tc.desc enable super admin in callback mode
     */
    it('enableAdmin_test_004', 0, async function (done) {
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_SUPER, OnReceiveEvent);
        async function OnReceiveEvent(err, datainfo) {
            console.log('enterpriseDeviceManager.enableAdmin : ' + retValue);
            expect(datainfo).assertTrue();

            var isEnabled = await enterpriseDeviceManager.isSuperAdmin(SELFHAPNAME);
            console.log('enterpriseDeviceManager.isSuperAdmin :' + isEnabled);
            expect(isEnabled).assertTrue();

            var retValue = await enterpriseDeviceManager.disableSuperAdmin(SELFHAPNAME);
            console.log('enterpriseDeviceManager.disableSuperAdmin : ' + retValue);
            expect(retValue).assertTrue();

            isEnabled = await enterpriseDeviceManager.isSuperAdmin(SELFHAPNAME);
            console.log('enterpriseDeviceManager.isSuperAdmin : ' + isEnabled);
            expect(isEnabled).assertFalse();
            done();
        }
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0006
     * @tc.name test enableAdmin method in callback mode without user id
     * @tc.desc enable admin in callback mode
     */
    it('enableAdmin_test_006', 0, async function (done) {
        console.log(' enableAdmin()');
        await enterpriseDeviceManager.enableAdmin(WANT1, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, OnReceiveEvent);
        async function OnReceiveEvent(err, datainfo) {
            console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL :' + datainfo);
            expect(datainfo).assertTrue();

            var isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1);
            console.log('enterpriseDeviceManager.isAdminEnabled :' + isEnabled);
            expect(isEnabled).assertTrue();

            var retValue = await enterpriseDeviceManager.disableAdmin(WANT1);
            console.log('enterpriseDeviceManager.disableAdmin : ' + retValue);
            expect(retValue).assertTrue();

            isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1);
            console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);
            expect(isEnabled).assertFalse();
            done();
        }
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0008
     * @tc.name test enableAdmin method with user id in callback mode with default user id
     * @tc.desc enable admin in multi-user
     */
    it('enableAdmin_test_008', 0, async function (done) {
        await enterpriseDeviceManager.enableAdmin(WANT1, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, DEFAULT_USER_ID, OnReceiveEvent);
        async function OnReceiveEvent(err, datainfo) {
            console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL :' + datainfo);
            expect(datainfo).assertTrue();

            var isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, DEFAULT_USER_ID);
            console.log('enterpriseDeviceManager.isAdminEnabled :' + isEnabled);
            expect(isEnabled).assertTrue();

            var retValue = await enterpriseDeviceManager.disableAdmin(WANT1, DEFAULT_USER_ID);
            console.log('enterpriseDeviceManager.disableAdmin : ' + retValue);
            expect(retValue).assertTrue();

            isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, DEFAULT_USER_ID);
            console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);
            expect(isEnabled).assertFalse();
            done();
        }
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0012
     * @tc.name test enableAdmin method in callback mode with test user id
     * @tc.desc enable admin in multi-user
     */
    it('enableAdmin_test_012', 0, async function (done) {
        await enterpriseDeviceManager.enableAdmin(WANT1, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, TEST_USER_ID, OnReceiveEvent);
        async function OnReceiveEvent(err, datainfo) {
            console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL :' + datainfo);
            expect(datainfo).assertTrue();

            var isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, TEST_USER_ID);
            console.log('enterpriseDeviceManager.isAdminEnabled :' + isEnabled);
            expect(isEnabled).assertTrue();

            var retValue = await enterpriseDeviceManager.disableAdmin(WANT1, TEST_USER_ID);
            console.log('enterpriseDeviceManager.disableAdmin : ' + retValue);
            expect(retValue).assertTrue();

            isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, TEST_USER_ID);
            console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);
            expect(isEnabled).assertFalse();
            done();
        }
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0013
     * @tc.name test enableAdmin method in promise mode and query with error user id
     * @tc.desc enable admin in multi-user
     */
    it('enableAdmin_test_013', 0, async function (done) {
        await enterpriseDeviceManager.enableAdmin(WANT1, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, DEFAULT_USER_ID, OnReceiveEvent);
        async function OnReceiveEvent(err, datainfo) {
            console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL :' + datainfo);
            expect(datainfo).assertTrue();

            var isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, TEST_USER_ID);
            console.log('enterpriseDeviceManager.isAdminEnabled :' + isEnabled);
            expect(isEnabled).assertFalse();

            var retValue = await enterpriseDeviceManager.disableAdmin(WANT1, DEFAULT_USER_ID);
            console.log('enterpriseDeviceManager.disableAdmin : ' + retValue);
            expect(retValue).assertTrue();

            isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, DEFAULT_USER_ID);
            console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);
            expect(isEnabled).assertFalse();
            done();
        }
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0014
     * @tc.name test enableAdmin method in callback mode and disable with error user id
     * @tc.desc enable and disable admin in multi-user
     */
    it('enableAdmin_test_014', 0, async function (done) {
        await enterpriseDeviceManager.enableAdmin(WANT1, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, TEST_USER_ID, OnReceiveEvent);
        async function OnReceiveEvent(err, datainfo) {
            console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL :' + datainfo);
            expect(datainfo).assertTrue();

            var isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, TEST_USER_ID);
            console.log('enterpriseDeviceManager.isAdminEnabled :' + isEnabled);
            expect(isEnabled).assertTrue();

            try {
                var retValue = await enterpriseDeviceManager.disableAdmin(WANT1, DEFAULT_USER_ID);
                console.log('enterpriseDeviceManager.disableAdmin over');
            } catch (error) {
                expect(error != null).assertTrue();
                console.log("enableAdmin_test_014 throw error code : " + error.code + "message :" + error.message);
            }

            isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, TEST_USER_ID);
            console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);
            expect(isEnabled).assertTrue();

            retValue = await enterpriseDeviceManager.disableAdmin(WANT1, TEST_USER_ID);
            console.log('enterpriseDeviceManager.disableAdmin : ' + retValue);
            expect(retValue).assertTrue();

            isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, TEST_USER_ID);
            console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);
            expect(isEnabled).assertFalse();
            done();
        }
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0017
     * @tc.name test setEnterpriseInfo method in callback mode
     * @tc.desc set enterprise info in callback mode
     */
    it('setEnterpriseInfo_test_002', 0, async function (done) {
        var retValue = await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL : ' + retValue);
        expect(retValue).assertTrue();
        var isEnabled = await enterpriseDeviceManager.isAdminEnabled(SELFWANT);
        expect(isEnabled).assertTrue();
        console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);

        await enterpriseDeviceManager.setEnterpriseInfo(SELFWANT, ENTINFO2, OnReceiveEvent);
        async function OnReceiveEvent(err, datainfo) {
            console.log('enterpriseDeviceManager.setEnterpriseInfo : ' + datainfo);
            expect(datainfo).assertTrue();

            var entInfo = await enterpriseDeviceManager.getEnterpriseInfo(SELFWANT);
            expect(entInfo.name).assertEqual(COMPANYNAME2);
            expect(entInfo.description).assertEqual(DESCRIPTION2);

            retValue = await enterpriseDeviceManager.disableAdmin(SELFWANT);
            console.log('enterpriseDeviceManager.disableAdmin : ' + retValue);
            expect(retValue).assertTrue();

            isEnabled = await enterpriseDeviceManager.isAdminEnabled(SELFWANT);
            console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);
            expect(isEnabled).assertFalse();
            done();
        }
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0018
     * @tc.name test getDeviceSettingsManager method in callback mode
     * @tc.desc get the device settings manager in callback mode
     */
    it('getDeviceSettingsManager_test_001', 0, async function (done) {
        enterpriseDeviceManager.getDeviceSettingsManager((error, mgr) => {
            expect(mgr !== null).assertTrue();
        })
        console.log('getDeviceSettingsManager_test_001 done');
        done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0021
     * @tc.name test setDateTime method in callback mode
     * @tc.desc set system date time in callback mode
     */
    it('setDateTime_test_002', 0, async function (done) {
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_SUPER);
        let dsmgr = await enterpriseDeviceManager.getDeviceSettingsManager();
        expect(dsmgr !== null).assertTrue();
        console.log('before setDateTime');
        await dsmgr.setDateTime(SELFWANT, 1526003846000, (error, data) => {
            console.log("setDateTime ===data: " + data);
            console.log("setDateTime ===error: " + error);
        });
        await enterpriseDeviceManager.disableSuperAdmin(SELFHAPNAME);
        done();
    })
  })
}
