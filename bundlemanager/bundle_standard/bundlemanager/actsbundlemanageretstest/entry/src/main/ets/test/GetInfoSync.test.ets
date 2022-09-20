/**
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
import { describe,beforeAll, it, expect } from 'hypium/index';
import Utils from './Utils';
import Bundle from '@ohos.bundle';
import account from '@ohos.account.osAccount';

const BUNDLE_NAME = 'com.open.harmony.packagemag';
const PATH = "/data/app/el1/bundle/public";
let userId = 0;

export default function GetInfoSync() {

    describe('GetInfoSync', function () {

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

        /**
         * @tc.number: getApplicationInfoSync_0100
         * @tc.name: getApplicationSyncWithRightNameAndUserId
         * @tc.desc: Test indicates the right bundleName, bundleFlags and userId
         *           returns the ApplicationInfo object
         */
         it('getApplicationSyncWithRightNameAndUserId', 0, async function (done) {
            var applicationInfo = Bundle.getApplicationInfoSync(BUNDLE_NAME,
                Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, userId)
            expect(typeof (applicationInfo)).assertEqual("object");
            getApplicationInfoSuccess("getApplicationSyncWithRightNameAndUserId", applicationInfo);
            done();
         })

        /**
         * @tc.number: getApplicationInfoSync_0200
         * @tc.name: getApplicationSyncWithWrongNameAndUserId
         * @tc.desc: Test indicates the wrong bundleName, bundleFlags and userId
         *           returns the ApplicationInfo undefined
         */
         it('getApplicationSyncWithWrongNameAndUserId', 0, async function (done) {
            let bundleName = "wrong";
            var applicationInfo = Bundle.getApplicationInfoSync(bundleName,
                Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, userId);
            expect(JSON.stringify(applicationInfo)).assertEqual(undefined);
            done();
         })

        /**
         * @tc.number: getApplicationInfoSync_0300
         * @tc.name: getApplicationSyncWithRightName
         * @tc.desc: Test indicates the right bundleName, bundleFlags
         *           returns the ApplicationInfo object
         */
         it('getApplicationSyncWithRightName', 0, async function (done) {
            let applicationInfo = Bundle.getApplicationInfoSync(BUNDLE_NAME,
                Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION)
            expect(typeof (applicationInfo)).assertEqual("object");
            getApplicationInfoSuccess("getApplicationSyncWithRightName", applicationInfo);
            done();
         })

        /**
         * @tc.number: getApplicationInfoSync_0400
         * @tc.name: getApplicationSyncWithWrongName
         * @tc.desc: Test indicates the wrong bundleName, bundleFlags
         *           returns the ApplicationInfo undefined
         */
         it('getApplicationSyncWithWrongName', 0, async function (done) {
            let bundleName = "wrong";
            let applicationInfo = Bundle.getApplicationInfoSync(bundleName,
                Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION);
            expect(JSON.stringify(applicationInfo)).assertEqual(undefined);
            done();
         })

        /**
         * @tc.number: getBundleInfoSync_0100
         * @tc.name: getBundleInfoSyncWithRightNameAndUserId
         * @tc.desc: Test indicates the right bundleName, bundleFlags, options
         *           returns the BundleInfo object
         */
         it('getBundleInfoSyncWithRightNameAndUserId', 0, async function (done) {
            let options = {userId : userId};
            let bundleInfo = Bundle.getBundleInfoSync(BUNDLE_NAME,
                Bundle.BundleFlag.GET_BUNDLE_DEFAULT, options);
            expect(typeof (bundleInfo)).assertEqual("object");
            getBundleInfoSuccess("getBundleInfoSyncWithRightNameAndUserId", bundleInfo);
            done();
         })

        /**
         * @tc.number: getBundleInfoSync_0200
         * @tc.name: getBundleInfoSyncWithWrongNameAndUserId
         * @tc.desc: Test indicates the right bundleName, bundleFlags, options
         *           returns the BundleInfo undefined
         */
         it('getBundleInfoSyncWithWrongNameAndUserId', 0, async function (done) {
            let options = {userId : userId};
            let bundleName = "wrong";
            let bundleInfo = Bundle.getBundleInfoSync(bundleName,
                Bundle.BundleFlag.GET_BUNDLE_DEFAULT, options);
            expect(JSON.stringify(bundleInfo)).assertEqual(undefined);
            done();
         })

        /**
         * @tc.number: getBundleInfoSync_0300
         * @tc.name: getBundleInfoSyncWithRightName
         * @tc.desc: Test indicates the right bundleName, bundleFlags
         *           returns the BundleInfo object
         */
         it('getBundleInfoSyncWithRightName', 0, async function (done) {
            let info = Bundle.getBundleInfoSync(BUNDLE_NAME, Bundle.BundleFlag.GET_BUNDLE_DEFAULT);
            expect(typeof (info)).assertEqual("object");
            getBundleInfoSuccess("getBundleInfoSyncWithRightName", info);
            done();
         })

        /**
         * @tc.number: getBundleInfoSync_0400
         * @tc.name: getBundleInfoSyncWithWrongName
         * @tc.desc: Test indicates the right bundleName, bundleFlags
         *           returns the BundleInfo undefined
         */
         it('getBundleInfoSyncWithWrongName', 0, async function (done) {
            let bundleName = "wrong";
            let info = Bundle.getBundleInfoSync(bundleName, Bundle.BundleFlag.GET_BUNDLE_DEFAULT);
            expect(JSON.stringify(info)).assertEqual(undefined);
            done();
         })

        function getBundleInfoSuccess(msg, data) {
            expect(data.name).assertEqual(BUNDLE_NAME);
            expect(data.type).assertEqual("");
            expect(data.appId).assertContain(BUNDLE_NAME);
            expect(data.uid).assertLarger(0);
            expect(data.installTime).assertLarger(0);
            expect(data.updateTime).assertLarger(0);
            expect(data.abilityInfos.length).assertEqual(0);
            expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
            expect(data.appInfo.codePath).assertEqual(PATH + '/' + BUNDLE_NAME);
            expect(data.appInfo.accessTokenId > 0).assertEqual(true);
            expect(data.appInfo.description).assertEqual('$string:entry_description');
            expect(data.appInfo.descriptionId > 0).assertEqual(true);
            expect(data.appInfo.icon).assertEqual('$media:icon');
            expect(data.appInfo.iconId > 0).assertEqual(true);
            expect(data.appInfo.iconIndex > 0).assertEqual(true);
            expect(data.appInfo.iconIndex).assertEqual(data.appInfo.iconId);
            expect(data.appInfo.uid > 0).assertEqual(true);
            expect(data.appInfo.label).assertEqual('$string:entry_MainAbility');
            expect(data.appInfo.labelId > 0).assertEqual(true);
            expect(data.appInfo.labelIndex > 0).assertEqual(true);
            expect(data.appInfo.labelIndex).assertEqual(data.appInfo.labelId);
            expect(data.appInfo.systemApp).assertEqual(false);
            expect(data.appInfo.supportedModes).assertEqual(0);
            expect(data.appInfo.process).assertEqual(BUNDLE_NAME);
            expect(data.appInfo.entryDir).assertEqual(PATH + '/' + BUNDLE_NAME + '/' + BUNDLE_NAME);
            expect(data.appInfo.enabled).assertEqual(true);
            expect(data.appInfo.entityType).assertEqual('unspecified');
            expect(data.appInfo.removable).assertEqual(true);
            expect(data.appInfo.moduleInfos[0].moduleName).assertEqual('entry');
            expect(data.appInfo.moduleInfos[0].moduleSourceDir).assertEqual(PATH + '/' + BUNDLE_NAME + '/' + BUNDLE_NAME);
            expect(data.appInfo.moduleSourceDirs[0]).assertEqual(PATH + '/' + BUNDLE_NAME + '/' + BUNDLE_NAME);
            expect(data.appInfo.permissions.length).assertEqual(0);
            expect(data.reqPermissions.length).assertEqual(0);
            expect(data.reqPermissionDetails.length).assertEqual(0);
            expect(data.vendor).assertEqual("ohos");
            expect(data.versionCode).assertEqual(1000000);
            expect(data.versionName).assertEqual("1.0.0");
            expect(data.compatibleVersion).assertEqual(7);
            expect(data.targetVersion).assertEqual(7);
            expect(data.isCompressNativeLibs).assertEqual(true);
            expect(data.entryModuleName).assertEqual("entry");
            expect(data.cpuAbi).assertEqual("");
            expect(data.isSilentInstallation.length).assertEqual(0);
            expect(data.hapModuleInfos.length > 0).assertEqual(true);
            expect(data.minCompatibleVersionCode).assertEqual(1000000);
            expect(data.entryInstallationFree).assertEqual(false);
            expect(data.reqPermissionStates.length).assertEqual(0);
            expect(data.extensionAbilityInfo.length).assertEqual(0);
        }

        function getApplicationInfoSuccess(msg, data) {
            expect(data.name).assertEqual(BUNDLE_NAME);
            expect(data.codePath).assertEqual(PATH + '/' + BUNDLE_NAME);
            expect(data.accessTokenId > 0).assertEqual(true);
            expect(data.description).assertEqual('$string:entry_description');
            expect(data.descriptionId > 0).assertEqual(true);
            expect(data.icon).assertEqual('$media:icon');
            expect(data.iconId > 0).assertEqual(true);
            expect(data.iconIndex > 0).assertEqual(true);
            expect(data.iconIndex).assertEqual(data.iconId);
            expect(data.uid > 0).assertEqual(true);
            expect(data.label).assertEqual('$string:entry_MainAbility');
            expect(data.labelId > 0).assertEqual(true);
            expect(data.labelIndex > 0).assertEqual(true);
            expect(data.labelIndex).assertEqual(data.labelId);
            expect(data.systemApp).assertEqual(false);
            expect(data.supportedModes).assertEqual(0);
            expect(data.process).assertEqual(BUNDLE_NAME);
            expect(data.entryDir).assertEqual(PATH + '/' + BUNDLE_NAME + '/' + BUNDLE_NAME);
            expect(data.enabled).assertEqual(true);
            expect(data.entityType).assertEqual('unspecified');
            expect(data.removable).assertEqual(true);
            expect(data.moduleInfos[0].moduleName).assertEqual('entry');
            expect(data.moduleInfos[0].moduleSourceDir).assertEqual(PATH + '/' + BUNDLE_NAME + '/' + BUNDLE_NAME);
            expect(data.moduleSourceDirs[0]).assertEqual(PATH + '/' + BUNDLE_NAME + '/' + BUNDLE_NAME);
            expect(data.permissions[0]).assertEqual("ohos.permission.GET_BUNDLE_INFO");
            expect(data.permissions[1]).assertEqual("ohos.permission.GET_BUNDLE_INFO_PRIVILEGED");
            expect(data.permissions[2]).assertEqual("ohos.permission.USE_BLUETOOTH");
            console.log(msg + ' end  ' + JSON.stringify(data));
        }
    });

}