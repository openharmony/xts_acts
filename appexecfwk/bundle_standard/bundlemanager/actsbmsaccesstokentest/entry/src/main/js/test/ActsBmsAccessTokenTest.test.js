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

const BUNDLE_NAME1 = 'com.example.bmsaccesstoken1';
const BUNDLE_NAME2 = 'com.example.bmsaccesstoken2';
const BUNDLE_NAME3 = 'com.example.bmsaccesstoken3';
const USERID = 100;

describe('ActsBmsAccessTokenTest', function () {

    /*
     * @tc.number: bms_AccessTokenId_0100
     * @tc.name: test accessTokenId
     * @tc.desc: get the accessTokenId
     */
    it('bms_AccessTokenId_0100', 0, async function (done) {
        await bundle.getApplicationInfo(BUNDLE_NAME1, bundle.BundleFlag.GET_BUNDLE_DEFAULT, USERID)
            .then(applicationInfo => {
                console.info('accessTokenId: ' + applicationInfo.accessTokenId);
                expect(applicationInfo.name).assertEqual(BUNDLE_NAME1);
                expect(applicationInfo.accessTokenId).assertLarger(0);
                done();
            }).catch((err) => {
                expect(err).assertFail();
                done();
            });
    });

    /*
     * @tc.number: bms_AccessTokenId_0200
     * @tc.name: test reqPermissionStates
     * @tc.desc: get the reqPermissions and reqPermissionStates
     */
    it('bms_AccessTokenId_0200', 0, async function (done) {
        await bundle.getBundleInfo(BUNDLE_NAME3, bundle.BundleFlag.GET_BUNDLE_WITH_REQUESTED_PERMISSION)
            .then(bundleInfo => {
                expect(bundleInfo.name).assertEqual(BUNDLE_NAME3);
                expect(bundleInfo.reqPermissions.length).assertEqual(3);
                expect(bundleInfo.reqPermissions[0]).assertEqual("ohos.permission.ALPHA");
                expect(bundleInfo.reqPermissions[1]).assertEqual("ohos.permission.BETA");
                expect(bundleInfo.reqPermissions[2]).assertEqual("ohos.permission.KEEP_BACKGROUND_RUNNING");
                expect(bundleInfo.reqPermissionStates.length).assertEqual(3);
                expect(bundleInfo.reqPermissionStates[0]).assertEqual(-1);
                expect(bundleInfo.reqPermissionStates[1]).assertEqual(-1);
                expect(bundleInfo.reqPermissionStates[2]).assertEqual(0);
                done();
            }).catch((err) => {
                expect(err).assertFail();
                done();
            });
    });

    /*
     * @tc.number: bms_AccessTokenId_0300
     * @tc.name: test reqPermissionStates
     * @tc.desc: get the reqPermissions and reqPermissionStates
     */
    it('bms_AccessTokenId_0300', 0, async function (done) {
        await bundle.getBundleInfo(BUNDLE_NAME2, bundle.BundleFlag.GET_BUNDLE_WITH_REQUESTED_PERMISSION)
            .then(bundleInfo => {
                expect(bundleInfo.name).assertEqual(BUNDLE_NAME2);
                expect(bundleInfo.reqPermissions.length).assertEqual(5);
                expect(bundleInfo.reqPermissions[0]).assertEqual("ohos.permission.ALPHA");
                expect(bundleInfo.reqPermissions[1]).assertEqual("ohos.permission.KEEP_BACKGROUND_RUNNING");
                expect(bundleInfo.reqPermissions[2]).assertEqual("ohos.permission.LOCATION_IN_BACKGROUND");
                expect(bundleInfo.reqPermissions[3]).assertEqual("ohos.permission.SYSTEM_FLOAT_WINDOW");
                expect(bundleInfo.reqPermissions[4]).assertEqual("ohos.permission.USE_BLUETOOTH");
                expect(bundleInfo.reqPermissionStates.length).assertEqual(5);
                expect(bundleInfo.reqPermissionStates[0]).assertEqual(-1);
                expect(bundleInfo.reqPermissionStates[1]).assertEqual(0);
                expect(bundleInfo.reqPermissionStates[2]).assertEqual(-1);
                expect(bundleInfo.reqPermissionStates[3]).assertEqual(0);
                expect(bundleInfo.reqPermissionStates[4]).assertEqual(0);
                done();
            }).catch((err) => {
                expect(err).assertFail();
                done();
            });
    });

    /*
     * @tc.number: bms_AccessTokenId_0400
     * @tc.name: test reqPermissionStates
     * @tc.desc: get the reqPermissions and reqPermissionStates
     */
    it('bms_AccessTokenId_0400', 0, async function (done) {
        await bundle.getBundleInfo(BUNDLE_NAME1, bundle.BundleFlag.GET_BUNDLE_WITH_REQUESTED_PERMISSION)
            .then(bundleInfo => {
                expect(bundleInfo.name).assertEqual(BUNDLE_NAME1);
                expect(bundleInfo.reqPermissions.length).assertEqual(6);
                expect(bundleInfo.reqPermissions[0]).assertEqual("ohos.permission.ALPHA");
                expect(bundleInfo.reqPermissions[1]).assertEqual("ohos.permission.BETA");
                expect(bundleInfo.reqPermissions[2]).assertEqual("ohos.permission.KEEP_BACKGROUND_RUNNING");
                expect(bundleInfo.reqPermissions[3]).assertEqual("ohos.permission.LOCATION_IN_BACKGROUND");
                expect(bundleInfo.reqPermissions[4]).assertEqual("ohos.permission.SYSTEM_FLOAT_WINDOW");
                expect(bundleInfo.reqPermissions[5]).assertEqual("ohos.permission.USE_BLUETOOTH");
                expect(bundleInfo.reqPermissionStates.length).assertEqual(6);
                expect(bundleInfo.reqPermissionStates[0]).assertEqual(-1);
                expect(bundleInfo.reqPermissionStates[1]).assertEqual(-1);
                expect(bundleInfo.reqPermissionStates[2]).assertEqual(0);
                expect(bundleInfo.reqPermissionStates[3]).assertEqual(-1);
                expect(bundleInfo.reqPermissionStates[4]).assertEqual(0);
                expect(bundleInfo.reqPermissionStates[5]).assertEqual(0);
                done();
            }).catch((err) => {
                expect(err).assertFail();
                done();
            });
    });

    /**
     * @tc.number bms_AccessTokenId_0500
     * @tc.name BUNDLE::getBundleInfos
     * @tc.desc Test getBundleInfos interfaces with with a flag
     */
    it("bms_AccessTokenId_0500", 0, async function (done) {
        await bundle.getApplicationInfo(BUNDLE_NAME1, bundle.BundleFlag.GET_BUNDLE_DEFAULT)
            .then((applicationInfo) => {
                console.info("bms_AccessTokenId_0500 accessTokenId: " + applicationInfo.accessTokenId);
                expect(applicationInfo.name).assertEqual(BUNDLE_NAME1);
                expect(applicationInfo.accessTokenId).assertLarger(0);
                done();
            }).catch((err) => {
                expect(err).assertFail();
                done();
            });
    });

    /**
     * @tc.number bms_AccessTokenId_0600
     * @tc.name BUNDLE::getBundleInfos
     * @tc.desc Test getBundleInfos interfaces with a flag
     */
    it("bms_AccessTokenId_0600", 0, async function (done) {
        await bundle.getApplicationInfo(BUNDLE_NAME1, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES)
            .then((applicationInfo) => {
                console.info("bms_AccessTokenId_0600 accessTokenId: " + applicationInfo.accessTokenId);
                expect(applicationInfo.name).assertEqual(BUNDLE_NAME1);
                expect(applicationInfo.accessTokenId).assertLarger(0);
                done();
            }).catch((err) => {
                expect(err).assertFail();
                done();
            });
    });

    /**
     * @tc.number bms_AccessTokenId_0700
     * @tc.name BUNDLE::getBundleInfos
     * @tc.desc Test getBundleInfos interfaces with a flag
     */
    it("bms_AccessTokenId_0700", 0, async function (done) {
        await bundle.getApplicationInfo(BUNDLE_NAME1, bundle.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION)
            .then((applicationInfo) => {
                console.info("bms_AccessTokenId_0700 accessTokenId: " + applicationInfo.accessTokenId);
                expect(applicationInfo.name).assertEqual(BUNDLE_NAME1);
                expect(applicationInfo.accessTokenId).assertLarger(0);
                done();
            }).catch((err) => {
                expect(err).assertFail();
                done();
            });
    });

    /**
     * @tc.number bms_AccessTokenId_0800
     * @tc.name BUNDLE::getBundleInfos
     * @tc.desc Test getBundleInfos interfaces with a flag
     */
    it("bms_AccessTokenId_0800", 0, async function (done) {
        await bundle.getApplicationInfo(BUNDLE_NAME2, bundle.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION)
            .then((applicationInfo) => {
                console.info("bms_AccessTokenId_0800 accessTokenId: " + applicationInfo.accessTokenId);
                expect(applicationInfo.name).assertEqual(BUNDLE_NAME2);
                expect(applicationInfo.accessTokenId).assertLarger(0);
                done();
            }).catch((err) => {
                expect(err).assertFail();
                done();
            });
    });

});
