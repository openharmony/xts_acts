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
    WANT1, ENTINFO1, SELFWANT, SELFHAPNAME, COMPANYNAME2, DESCRIPTION2,
    ENTINFO2, DEFAULT_USER_ID, TEST_USER_ID, ERR_USER_ID, SUBSCRIBE_EVENTS, SUBSCRIBE_INVALID_EVENTS
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
        async function OnReceiveEvent(err) {
            console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');
            expect(err == null).assertTrue();

            var isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1);
            console.log('enterpriseDeviceManager.isAdminEnabled :' + isEnabled);
            expect(isEnabled).assertTrue();

            await enterpriseDeviceManager.disableAdmin(WANT1);
            console.log('enterpriseDeviceManager.disableAdmin.');

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
        async function OnReceiveEvent(err) {
            console.log('enterpriseDeviceManager.enableAdmin.');
            expect(err == null).assertTrue();

            var isEnabled = await enterpriseDeviceManager.isSuperAdmin(SELFHAPNAME);
            console.log('enterpriseDeviceManager.isSuperAdmin :' + isEnabled);
            expect(isEnabled).assertTrue();

            await enterpriseDeviceManager.disableSuperAdmin(SELFHAPNAME);
            console.log('enterpriseDeviceManager.disableSuperAdmin.');

            isEnabled = await enterpriseDeviceManager.isSuperAdmin(SELFHAPNAME);
            console.log('enterpriseDeviceManager.isSuperAdmin : ' + isEnabled);
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
        async function OnReceiveEvent(err) {
            console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');
            expect(err == null).assertTrue();

            var isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, DEFAULT_USER_ID);
            console.log('enterpriseDeviceManager.isAdminEnabled :' + isEnabled);
            expect(isEnabled).assertTrue();

            await enterpriseDeviceManager.disableAdmin(WANT1, DEFAULT_USER_ID);
            console.log('enterpriseDeviceManager.disableAdmin.');

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
        async function OnReceiveEvent(err) {
            console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');
            expect(err == null).assertTrue();

            var isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, TEST_USER_ID);
            console.log('enterpriseDeviceManager.isAdminEnabled :' + isEnabled);
            expect(isEnabled).assertTrue();

            await enterpriseDeviceManager.disableAdmin(WANT1, TEST_USER_ID);
            console.log('enterpriseDeviceManager.disableAdmin.');

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
        async function OnReceiveEvent(err) {
            console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');
            expect(err == null).assertTrue();

            var isEnabled = await enterpriseDeviceManager.isAdminEnabled(WANT1, TEST_USER_ID);
            console.log('enterpriseDeviceManager.isAdminEnabled :' + isEnabled);
            expect(isEnabled).assertFalse();

            await enterpriseDeviceManager.disableAdmin(WANT1, DEFAULT_USER_ID);
            console.log('enterpriseDeviceManager.disableAdmin.');

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
        async function OnReceiveEvent(err) {
            console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');
            expect(err == null).assertTrue();

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

            await enterpriseDeviceManager.disableAdmin(WANT1, TEST_USER_ID);
            console.log('enterpriseDeviceManager.disableAdmin.');

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
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');
        var isEnabled = await enterpriseDeviceManager.isAdminEnabled(SELFWANT);
        expect(isEnabled).assertTrue();
        console.log('enterpriseDeviceManager.isAdminEnabled : ' + isEnabled);

        await enterpriseDeviceManager.setEnterpriseInfo(SELFWANT, ENTINFO2, OnReceiveEvent);
        async function OnReceiveEvent(err) {
            console.log('enterpriseDeviceManager.setEnterpriseInfo.');
            expect(err == null).assertTrue();

            var entInfo = await enterpriseDeviceManager.getEnterpriseInfo(SELFWANT);
            expect(entInfo.name).assertEqual(COMPANYNAME2);
            expect(entInfo.description).assertEqual(DESCRIPTION2);

            await enterpriseDeviceManager.disableAdmin(SELFWANT);
            console.log('enterpriseDeviceManager.disableAdmin.');

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
        await dsmgr.setDateTime(SELFWANT, 1526003846000, OnReceiveEvent);
        async function OnReceiveEvent() {
            await enterpriseDeviceManager.disableSuperAdmin(SELFHAPNAME);
            done();
        }
    })

    /**
     * @tc.number    subscribeManagedEvent_test_001
     * @tc.desc      Test subscribeManagedEvent method in callback mode.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('subscribeManagedEvent_test_001', 0, async function (done) {
        console.info('-----------subscribeManagedEvent_test_001 start-------------');
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');
        await new Promise((resolve, reject) => {
            enterpriseDeviceManager.subscribeManagedEvent(SELFWANT, SUBSCRIBE_EVENTS, error => {
                expect(error == null).assertTrue();
                console.log('enterpriseDeviceManager.subscribeManagedEvent. null 1');
                resolve(0);
            });
        });
        await enterpriseDeviceManager.disableAdmin(SELFWANT);
        console.log('enterpriseDeviceManager.disableAdmin.');
        done();
    })

    /**
     * @tc.number    subscribeManagedEvent_test_003
     * @tc.desc      Test subscribeManagedEvent method in callback mode and subscribe invalid managed events.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('subscribeManagedEvent_test_003', 0, async function (done) {
        console.info('-----------subscribeManagedEvent_test_003 start-------------');
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');
        await new Promise((resolve, reject) => {
            enterpriseDeviceManager.subscribeManagedEvent(SELFWANT, SUBSCRIBE_INVALID_EVENTS, error => {
                expect(error.code == 9200008).assertTrue();
                console.log('enterpriseDeviceManager.subscribeManagedEvent. 9200008');
                resolve(0);
            });
        });
        await enterpriseDeviceManager.disableAdmin(SELFWANT);
        done();
    })

    /**
     * @tc.number    subscribeManagedEvent_test_005
     * @tc.desc      Test subscribeManagedEvent method in callback mode subscribe when disable admin.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('subscribeManagedEvent_test_005', 0, async function (done) {
        console.info('-----------subscribeManagedEvent_test_005 start-------------');
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');
        await enterpriseDeviceManager.disableAdmin(SELFWANT);
        console.log('enterpriseDeviceManager.disableAdmin.');
        await new Promise((resolve, reject) => {
            enterpriseDeviceManager.subscribeManagedEvent(SELFWANT, SUBSCRIBE_EVENTS, error => {
                expect(error.code == 9200001).assertTrue();
                console.log('enterpriseDeviceManager.subscribeManagedEvent. 9200001');
                resolve(0);
            });
        });
        done();
    })

    /**
     * @tc.number    subscribeManagedEvent_test_007
     * @tc.desc      Test subscribeManagedEvent method in callback mode and subscribe when enable super admin.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('subscribeManagedEvent_test_007', 0, async function (done) {
        console.info('-----------subscribeManagedEvent_test_007 start-------------');
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_SUPER, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_SUPER.');
        await new Promise((resolve, reject) => {
            enterpriseDeviceManager.subscribeManagedEvent(SELFWANT, SUBSCRIBE_EVENTS, error => {
                expect(error == null).assertTrue();
                console.log('enterpriseDeviceManager.subscribeManagedEvent. null 2');
                resolve(0);
            });
        });
        await enterpriseDeviceManager.disableSuperAdmin(SELFHAPNAME);
        console.log('enterpriseDeviceManager.disableSuperAdmin ADMIN_TYPE_SUPER.');
        done();
    })
  
    /**
       * @tc.number    unsubscribeManagedEvent_test_001
       * @tc.desc      Test unsubscribeManagedEvent method in callback mode.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
    it('unsubscribeManagedEvent_test_001', 0, async function (done) {
        console.info('-----------unsubscribeManagedEvent_test_001 start-------------');
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');
        await new Promise((resolve, reject) => {
            enterpriseDeviceManager.unsubscribeManagedEvent(SELFWANT, SUBSCRIBE_EVENTS, error => {
                expect(error == null).assertTrue();
                console.log('enterpriseDeviceManager.unsubscribeManagedEvent. null 1');
                resolve(0);
            });
        });
        await enterpriseDeviceManager.disableAdmin(SELFWANT);
        console.log('enterpriseDeviceManager.disableAdmin.');
        done();
    })

    /**
       * @tc.number    unsubscribeManagedEvent_test_003
       * @tc.desc      Test unsubscribeManagedEvent method in callback mode and unsubscribe invalid managed events.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
    it('unsubscribeManagedEvent_test_003', 0, async function (done) {
        console.info('-----------unsubscribeManagedEvent_test_003 start-------------');
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');
        await new Promise((resolve, reject) => {
            enterpriseDeviceManager.unsubscribeManagedEvent(SELFWANT, SUBSCRIBE_INVALID_EVENTS, error => {
                expect(error.code == 9200008).assertTrue();
                console.log('enterpriseDeviceManager.unsubscribeManagedEvent. 9200008');
                resolve(0);
            });
        });
        await enterpriseDeviceManager.disableAdmin(SELFWANT);
        console.log('enterpriseDeviceManager.disableAdmin.');
        done();
    })

    /**
       * @tc.number    unsubscribeManagedEvent_test_005
       * @tc.desc      Test unsubscribeManagedEvent method in callback mode and unsubscribe when disable admin.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
    it('unsubscribeManagedEvent_test_005', 0, async function (done) {
        console.info('-----------unsubscribeManagedEvent_test_005 start-------------');
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_NORMAL, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_NORMAL.');
        await enterpriseDeviceManager.disableAdmin(SELFWANT);
        console.log('enterpriseDeviceManager.disableAdmin.');
        await new Promise((resolve, reject) => {
            enterpriseDeviceManager.unsubscribeManagedEvent(SELFWANT, SUBSCRIBE_EVENTS, error => {
                expect(error.code == 9200001).assertTrue();
                console.log('enterpriseDeviceManager.unsubscribeManagedEvent. 9200001');
                resolve(0);
            });
        });
        done();
    })

    /**
       * @tc.number    unsubscribeManagedEvent_test_007
       * @tc.desc      Test unsubscribeManagedEvent method in callback mode and unsubscribe when enable super admin.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
    it('unsubscribeManagedEvent_test_007', 0, async function (done) {
        console.info('-----------unsubscribeManagedEvent_test_007 start-------------');
        await enterpriseDeviceManager.enableAdmin(SELFWANT, ENTINFO1,
            enterpriseDeviceManager.AdminType.ADMIN_TYPE_SUPER, DEFAULT_USER_ID);
        console.log('enterpriseDeviceManager.enableAdmin ADMIN_TYPE_SUPER.');
        await new Promise((resolve, reject) => {
            enterpriseDeviceManager.unsubscribeManagedEvent(SELFWANT, SUBSCRIBE_EVENTS, error => {
                expect(error == null).assertTrue();
                console.log('enterpriseDeviceManager.unsubscribeManagedEvent. null 2');
                resolve(0);
            });
        });
        await enterpriseDeviceManager.disableSuperAdmin(SELFHAPNAME);
        console.log('enterpriseDeviceManager.disableSuperAdmin ADMIN_TYPE_SUPER.');
        done();
    })
  })
}
