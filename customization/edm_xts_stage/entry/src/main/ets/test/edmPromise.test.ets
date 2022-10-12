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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import {
    WANT1, ENTINFO1, SELFWANT, SELFHAPNAME, COMPANYNAME2, DESCRIPTION2, ENTINFO2,
    DEFAULT_USER_ID, TEST_USER_ID, ERR_USER_ID, SUBSCRIBE_EVENTS, SUBSCRIBE_INVALID_EVENTS
} from "./commom.ets";
import enterpriseDeviceManager from '@ohos.enterpriseDeviceManager'

export default function edmPromiseTest() {
  describe('edmPromise_test', function () {
    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0001
     * @tc.name test enableAdmin method in promise mode without user id
     * @tc.desc enable admin in promise mode
     */
    it('enableAdmin_test_001', 0, async function (done) {
        await enterpriseDeviceManager.enableAdmin(WANT1, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');

        var isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1);
        console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);
        expect(isEnabled).assertTrue();

        await enterpriseDeviceManager.disableAdmin(WANT1);
        console.log('enterpriseDeviceManager.disableAdmin.');

        isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1);
        console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);
        expect(isEnabled).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0003
     * @tc.name test enableAdmin method in promise mode with ADMIN_TYPE_SUPER param without user id
     * @tc.desc enable super admin in promise mode
     */
    it('enableAdmin_test_003', 0, async function (done) {
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_SUPER');
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_SUPER);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_SUPER.');

        var isEnabled = await enterpriseDeviceManager.isSuperAdmin(SELFHAPNAME);
        console.log('enterpriseDeviceManager.isSuperAdmin :' + isEnabled);
        expect(isEnabled).assertTrue();

        await enterpriseDeviceManager.disableSuperAdmin(SELFHAPNAME);
        console.log('enterpriseDeviceManager.disableSuperAdmin.');

        isEnabled = await enterpriseDeviceManager.isSuperAdmin(SELFHAPNAME);
        console.log('enterpriseDeviceManager.isSuperAdmin : ' + isEnabled);
        expect(isEnabled).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0007
     * @tc.name test enableAdmin method in promise mode with default user id
     * @tc.desc enable admin in multi-user
     */
    it('enableAdmin_test_007', 0, async function (done) {
        await enterpriseDeviceManager.enableAdmin(WANT1, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');

        var isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);
        expect(isEnabled).assertTrue();


        await enterpriseDeviceManager.disableAdmin(WANT1, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.disableAdmin.');

        isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);
        expect(isEnabled).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0009
     * @tc.name test enableAdmin method with user id in callback mode with error user id
     * @tc.desc enable admin in multi-user
     */
    it('enableAdmin_test_009', 0, async function (done) {
        await enterpriseDeviceManager.enableAdmin(WANT1, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_SUPER, TEST_USER_ID, OnReceiveEvent);
        async function OnReceiveEvent(err) {
            expect(err != null).assertTrue();
            if (err) {
                // user exsit but super admin can only be enabled in user 100
                console.log("enableAdmin_test_009 throw error code : " + err.code + "message :" + err.message);
            }
            done();
        }
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0010
     * @tc.name test enableAdmin method with user id in callback mode with error user id
     * @tc.desc enable admin in multi-user
     */
    it('enableAdmin_test_010', 0, async function (done) {
        await enterpriseDeviceManager.enableAdmin(WANT1, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_SUPER, ERR_USER_ID, OnReceiveEvent);
        async function OnReceiveEvent(err) {
            expect(err != null).assertTrue();
            if (err) {
                // user does not exsit
                console.log("enableAdmin_test_010 throw error code : " + err.code + "message :" + err.message);
            }
            done();
        }
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0011
     * @tc.name test enableAdmin method in promise mode with test user id
     * @tc.desc enable admin in multi-user
     */
    it('enableAdmin_test_011', 0, async function (done) {
        await enterpriseDeviceManager.enableAdmin(WANT1, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, TEST_USER_ID);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');

        var isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, TEST_USER_ID);
        console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);
        expect(isEnabled).assertTrue();


        await enterpriseDeviceManager.disableAdmin(WANT1, TEST_USER_ID);
        console.log('enterpriseDeviceManager.disableAdmin.');

        isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, TEST_USER_ID);
        console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);
        expect(isEnabled).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0015
     * @tc.name test enableAdmin method in promise mode and disable with test user id
     * @tc.desc enable admin in multi-user
     */
    it('enableAdmin_test_015', 0, async function (done) {
        await enterpriseDeviceManager.enableAdmin(WANT1, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, DEFAULT_USER_ID);
        await enterpriseDeviceManager.enableAdmin(WANT1, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, TEST_USER_ID, OnReceiveEvent);
        async function OnReceiveEvent(err) {
            console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');
            expect(err == null).assertTrue();

            var isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, DEFAULT_USER_ID);
            console.log('enterpriseDeviceManager.isAdminEnabled :' + isEnabled);
            expect(isEnabled).assertTrue();

            isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, TEST_USER_ID);
            console.log('enterpriseDeviceManager.isAdminEnabled :' + isEnabled);
            expect(isEnabled).assertTrue();

            await enterpriseDeviceManager.disableAdmin(WANT1, DEFAULT_USER_ID);
            console.log('enterpriseDeviceManager.disableAdmin.');

            isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, DEFAULT_USER_ID);
            console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);
            expect(isEnabled).assertFalse();

            isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, TEST_USER_ID);
            console.log('enterpriseDeviceManager.isAdminEnabled :' + isEnabled);
            expect(isEnabled).assertTrue();

            await enterpriseDeviceManager.disableAdmin(WANT1, TEST_USER_ID);
            console.log('enterpriseDeviceManager.disableAdmin.');

            isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, TEST_USER_ID);
            console.log('enterpriseDeviceManager.isAdminEnabled :' + isEnabled);
            expect(isEnabled).assertFalse();
            done();
        }
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0022
     * @tc.name test enable super admin method in promise mode and enable twice with test user id
     * @tc.desc enable and disable admin in multi-user
     */
    it('enableAdmin_test_0016', 0, async function (done) {
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_SUPER);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_SUPER.');

        var isEnabled = await enterpriseDeviceManager.isSuperAdmin(SELFHAPNAME);
        console.log('enterpriseDeviceManager.isSuperAdmin :' + isEnabled);
        expect(isEnabled).assertTrue();

        try {
            await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
                enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, TEST_USER_ID);
        } catch (error) {
            expect(error != null).assertTrue();
            console.log("enableAdmin_test_016 throw error code : " + error.code + "message :" + error.message);
        }

        isEnabled = await enterpriseDeviceManager.isAdminEnabled(SELFWANT, TEST_USER_ID);
        console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);
        expect(isEnabled).assertFalse();

        await enterpriseDeviceManager.disableSuperAdmin(SELFHAPNAME);
        console.log('enterpriseDeviceManager.disableSuperAdmin.');

        isEnabled = await enterpriseDeviceManager.isSuperAdmin(SELFHAPNAME);
        console.log('enterpriseDeviceManager.isSuperAdmin : ' + isEnabled);
        expect(isEnabled).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0016
     * @tc.name test setEnterpriseInfo method in promise mode
     * @tc.desc set enterprise info in promise mode
     */
    it('setEnterpriseInfo_test_001', 0, async function (done) {
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');

        var isEnabled = await enterpriseDeviceManager.isAdminEnabled(SELFWANT);
        expect(isEnabled).assertTrue();
        console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);

        await enterpriseDeviceManager.setEnterpriseInfo(SELFWANT, ENTINFO2);
        console.log('enterpriseDeviceManager.setEnterpriseInfo.');

        var entInfo = await enterpriseDeviceManager.getEnterpriseInfo(SELFWANT);
        expect(entInfo.name).assertEqual(COMPANYNAME2);
        expect(entInfo.description).assertEqual(DESCRIPTION2);

        await enterpriseDeviceManager.disableAdmin(SELFWANT);
        console.log('enterpriseDeviceManager.disableAdmin.');

        isEnabled = await enterpriseDeviceManager.isAdminEnabled(SELFWANT);
        console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);
        expect(isEnabled).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0019
     * @tc.name test getDeviceSettingsManager method in promise mode
     * @tc.desc get the device settings manager in promise mode
     */
    it('getDeviceSettingsManager_test_002', 0, async function (done) {
        enterpriseDeviceManager.getDeviceSettingsManager().then(mgr => {
            expect(mgr !== null).assertTrue();
        })
        console.log('getDeviceSettingsManager_test_002 done');
        done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_JS_0020
     * @tc.name test setDateTime method in promise mode
     * @tc.desc set system date time in promise mode
     */
    it('setDateTime_test_001', 0, async function (done) {
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_SUPER);
        let dsmgr = await enterpriseDeviceManager.getDeviceSettingsManager();
        expect(dsmgr !== null).assertTrue();
        console.log('before setDateTime');
        await dsmgr.setDateTime(SELFWANT, 1526003846000);
        await enterpriseDeviceManager.disableSuperAdmin(SELFHAPNAME);
        done();
    })

    /**
     * @tc.number    subscribeManagedEvent_test_002
     * @tc.desc      Test subscribeManagedEvent method in promise mode.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('subscribeManagedEvent_test_002', 0, async function (done) {
        console.info('-----------subscribeManagedEvent_test_002 start-------------');
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');
        await enterpriseDeviceManager.subscribeManagedEvent(SELFWANT, SUBSCRIBE_EVENTS).then(() => {
        }).catch((error) => {
            expect(error == null).assertTrue();
        });
        await enterpriseDeviceManager.disableAdmin(SELFWANT);
        console.log('enterpriseDeviceManager.disableAdmin.');
        done();
    })

    /**
     * @tc.number    subscribeManagedEvent_test_004
     * @tc.desc      Test subscribeManagedEvent method in promise mode and subscribe invalid managed events.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('subscribeManagedEvent_test_004', 0, async function (done) {
        console.info('-----------subscribeManagedEvent_test_004 start-------------');
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');
        await enterpriseDeviceManager.subscribeManagedEvent(SELFWANT, SUBSCRIBE_INVALID_EVENTS).then(() => {
        }).catch((error) => {
            expect(error.code == 9200008).assertTrue();
        });
        await enterpriseDeviceManager.disableAdmin(SELFWANT);
        console.log('enterpriseDeviceManager.disableAdmin.');
        done();
    })

    /**
     * @tc.number    subscribeManagedEvent_test_006
     * @tc.desc      Test subscribeManagedEvent method in promise mode and subscribe when disable admin.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('subscribeManagedEvent_test_006', 0, async function (done) {
        console.info('-----------subscribeManagedEvent_test_006 start-------------');
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');
        await enterpriseDeviceManager.disableAdmin(SELFWANT);
        console.log('enterpriseDeviceManager.disableAdmin.');
        await enterpriseDeviceManager.subscribeManagedEvent(SELFWANT, SUBSCRIBE_EVENTS).then(() => {
        }).catch((error) => {
            expect(error.code == 9200001).assertTrue();
        });
        done();
    })

    /**
     * @tc.number    subscribeManagedEvent_test_008
     * @tc.desc      Test subscribeManagedEvent method in promise mode and subscribe when enable super admin.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('subscribeManagedEvent_test_008', 0, async function (done) {
        console.info('-----------subscribeManagedEvent_test_008 start-------------');
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_SUPER, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_SUPER.');
        await enterpriseDeviceManager.subscribeManagedEvent(SELFWANT, SUBSCRIBE_EVENTS).then(() => {
        }).catch((error) => {
            expect(error == null).assertTrue();
        });
        await enterpriseDeviceManager.disableSuperAdmin(SELFHAPNAME);
        console.log('enterpriseDeviceManager.disableSuperAdmin ADMIN_TYPE_SUPER.');
        done();
    })
  
    /**
       * @tc.number    unsubscribeManagedEvent_test_002
       * @tc.desc      Test subscribeManagedEvent method in promise mode.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
    it('unsubscribeManagedEvent_test_002', 0, async function (done) {
        console.info('-----------unsubscribeManagedEvent_test_002 start-------------');
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');
        
        await enterpriseDeviceManager.unsubscribeManagedEvent(SELFWANT, SUBSCRIBE_EVENTS).then(() => {
        }).catch((error) => {
            expect(error == null).assertTrue();
        });
        await enterpriseDeviceManager.disableAdmin(SELFWANT);
        console.log('enterpriseDeviceManager.disableAdmin.');
        done();
    })

    /**
       * @tc.number    unsubscribeManagedEvent_test_004
       * @tc.desc      Test subscribeManagedEvent method in promise mode and unsubscribe invalid managed events.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
    it('unsubscribeManagedEvent_test_004', 0, async function (done) {
        console.info('-----------unsubscribeManagedEvent_test_004 start-------------');
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');
        await enterpriseDeviceManager.unsubscribeManagedEvent(SELFWANT, SUBSCRIBE_INVALID_EVENTS).then(() => {
        }).catch((error) => {
                expect(error.code == 9200008).assertTrue();
        });
        await enterpriseDeviceManager.disableAdmin(SELFWANT);
        console.log('enterpriseDeviceManager.disableAdmin.');
        done();
    })

    /**
       * @tc.number    unsubscribeManagedEvent_test_006
       * @tc.desc      Test subscribeManagedEvent method in promise mode and unsubscribe when disable admin.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
    it('unsubscribeManagedEvent_test_006', 0, async function (done) {
        console.info('-----------unsubscribeManagedEvent_test_006 start-------------');
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');
        await enterpriseDeviceManager.disableAdmin(SELFWANT);
        console.log('enterpriseDeviceManager.disableAdmin.');
        await enterpriseDeviceManager.unsubscribeManagedEvent(SELFWANT, SUBSCRIBE_EVENTS).then(() => {
        }).catch((error) => {
            expect(error.code == 9200001).assertTrue();
        });
        done();
    })

    /**
       * @tc.number    unsubscribeManagedEvent_test_008
       * @tc.desc      Test subscribeManagedEvent method in promise mode and unsubscribe when enable super admin.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
    it('unsubscribeManagedEvent_test_008', 0, async function (done) {
        console.info('-----------unsubscribeManagedEvent_test_008 start-------------');
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_SUPER, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_SUPER.');
        await enterpriseDeviceManager.unsubscribeManagedEvent(SELFWANT, SUBSCRIBE_EVENTS).then(() => {
        }).catch((error) => {
            expect(error == null).assertTrue();
        });
        await enterpriseDeviceManager.disableSuperAdmin(SELFHAPNAME);
        console.log('enterpriseDeviceManager.disableSuperAdmin ADMIN_TYPE_SUPER.');
        done();
    })
  })
}
