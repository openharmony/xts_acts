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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import demo from '@ohos.bundle'

const ERROR = "error.hap"
const NAME1 = "com.example.myapplication1"
const NAME2 = "com.example.myapplication2"
const NAME3 = "com.example.myapplication4"
const NAME4 = "com.example.myapplication5"
const NAME5 = "com.example.myapplication6"
const LAUNCHER = "com.ohos.launcher"
const VERSIONCODE1 = 1
const OBJECT = "object"
const DIR1 = "/data/accounts/account_0/applications/com.example.myapplication1/com.example.myapplication1"
const DIR2 = "/data/accounts/account_0/applications/com.example.myapplication2/com.example.myapplication2"
const DESCRIPTION = "$string:mainability_description"
const USERID = 100 ;

describe('ActsBundleManagerTest', function () {

    /**
     * @tc.number getBundleInfo_0100
     * @tc.name BUNDLEMGR::getBundleInfo
     * @tc.desc Test getBundleInfo interfaces with one hap.
     */
    it('getBundleInfo_0100', 0, async function (done) {
        let datainfo = await demo.getBundleInfo(NAME1,
            demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES | demo.BundleFlag.GET_BUNDLE_WITH_REQUESTED_PERMISSION);
        console.info("getBundleInfo_0100 dataInfo ====" + datainfo);
        expect(datainfo.name).assertEqual(NAME1);
        expect(datainfo.vendor).assertEqual("example");
        expect(datainfo.versionCode).assertEqual(VERSIONCODE1);
        expect(datainfo.versionName).assertEqual("1.0");
        expect(datainfo.entryModuleName).assertEqual("entry");
        expect(datainfo.compatibleVersion).assertEqual(5);
        expect(datainfo.targetVersion).assertEqual(5);
        expect(datainfo.uid).assertLarger(0);
        expect(datainfo.appId).assertContain(NAME1);
        expect(datainfo.type).assertEqual("");
        expect(datainfo.cpuAbi).assertEqual("");
        expect(datainfo.appInfo.name).assertEqual(NAME1);
        expect(datainfo.appInfo.description).assertEqual(DESCRIPTION);
        expect(datainfo.appInfo.descriptionId >= 0).assertTrue();
        expect(datainfo.appInfo.icon).assertEqual("$media:icon");
        expect(datainfo.appInfo.iconId >= 0).assertTrue();
        expect(datainfo.appInfo.label).assertEqual("$string:app_name");
        expect(datainfo.appInfo.labelId >= 0).assertTrue();
        expect(datainfo.appInfo.systemApp).assertEqual(true);
        expect(datainfo.appInfo.supportedModes).assertEqual(0);
        expect(datainfo.installTime).assertLarger(0);
        expect(datainfo.updateTime).assertLarger(0);
        expect(datainfo.reqPermissions[0]).assertEqual("com.permission.PERMISSION_A");
        expect(datainfo.reqPermissionDetails[0].name).assertEqual("com.permission.PERMISSION_A");
        expect(datainfo.reqPermissionDetails[0].reason).assertEqual("Need PERMISSION_A");
        expect(datainfo.reqPermissionDetails[0].usedScene.abilities[0]).assertEqual(NAME1 + ".MainAbility");
        expect(datainfo.reqPermissionDetails[0].usedScene.when).assertEqual("always");
        expect(datainfo.compatibleVersion).assertEqual(5);
        expect(datainfo.targetVersion).assertEqual(5);
        expect(datainfo.isCompressNativeLibs).assertEqual(false);
        for (let s = 0; s < datainfo.hapModuleInfos; s++) {
            expect(datainfo.moduleInfos[s].name).assertEqual("com.example.myapplication1");
            expect(datainfo.moduleInfos[s].moduleName).assertEqual("entry");
        }
        expect(datainfo.entryModuleName).assertEqual("entry");
        expect(datainfo.isSilentInstallation.length).assertEqual(0);
        expect(datainfo.minCompatibleVersionCode).assertEqual(0);
        expect(datainfo.entryInstallationFree).assertEqual(false);
        for (let j = 0; j < datainfo.appInfo.moduleInfos; j++) {
            expect(datainfo.appInfo.moduleInfos[j].moduleName).assertEqual("entry");
            expect(datainfo.appInfo.moduleInfos[j].moduleSourceDir).assertEqual(DIR1);
        }
        expect(datainfo.appInfo.enabled).assertEqual(true);
        done();
    })

    /**
     * @tc.number getBundleInfo_0600
     * @tc.name BUNDLE::getBundleInfo
     * @tc.desc Test getBundleInfo interfaces with one hap.
     */
    it('getBundleInfo_0600', 0, async function (done) {
        await demo.getBundleInfo(NAME1, demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES, OnReceiveEvent);
        function OnReceiveEvent(err, datainfo) {
            console.info("getBundleInfo_0600 dataInfo ====" + datainfo);
            expect(datainfo.name).assertEqual(NAME1);
            expect(datainfo.vendor).assertEqual("example");
            expect(datainfo.versionCode).assertEqual(VERSIONCODE1);
            expect(datainfo.versionName).assertEqual("1.0");
            expect(datainfo.type).assertEqual("");
            expect(datainfo.cpuAbi).assertEqual("");
            expect(datainfo.compatibleVersion).assertEqual(5);
            expect(datainfo.targetVersion).assertEqual(5);
            expect(datainfo.installTime).assertLarger(0);
            expect(datainfo.updateTime).assertLarger(0);
            expect(datainfo.uid).assertLarger(0);
            expect(datainfo.entryModuleName).assertEqual("entry");
            expect(datainfo.minCompatibleVersionCode).assertEqual(0);
            expect(datainfo.entryInstallationFree).assertEqual(false);
            expect(datainfo.reqPermissions.length).assertEqual(0);
            expect(datainfo.reqPermissionStates.length).assertEqual(0);
            expect(datainfo.reqPermissionDetails.length).assertEqual(0);
            expect(datainfo.extensionAbilityInfo.length).assertEqual(0);
            expect(datainfo.appInfo.name).assertEqual(NAME1);
            expect(datainfo.appInfo.description).assertEqual(DESCRIPTION);
            expect(datainfo.appInfo.descriptionId >= 0).assertTrue();
            expect(datainfo.appInfo.icon).assertEqual("$media:icon");
            expect(datainfo.appInfo.iconId >= 0).assertTrue();
            expect(datainfo.appInfo.label).assertEqual("$string:app_name");
            expect(datainfo.appInfo.labelId >= 0).assertTrue();
            expect(datainfo.appInfo.systemApp).assertEqual(true);
            expect(datainfo.appInfo.supportedModes).assertEqual(0);
            for (let j = 0; j < datainfo.appInfo.moduleInfos; j++) {
                expect(datainfo.appInfo.moduleInfos[j].moduleName).assertEqual("entry");
                expect(datainfo.appInfo.moduleInfos[j].moduleSourceDir).assertEqual(DIR1);
            }
            expect(datainfo.appInfo.enabled).assertEqual(true);
            done();
        }

    })

    /**
     * @tc.number getBundleInfo_1100
     * @tc.name BUNDLE::getBundleInfo
     * @tc.desc Test getBundleInfo interfaces with one hap and different param.
     */
    it('getBundleInfo_1100', 0, async function (done) {
        let datainfo = await demo.getBundleInfo(NAME1, demo.BundleFlag.GET_BUNDLE_DEFAULT)
        console.info("getBundleInfo_1100 dataInfo ====" + datainfo);
        expect(datainfo.name).assertEqual(NAME1);
        expect(datainfo.vendor).assertEqual("example");
        expect(datainfo.versionCode).assertEqual(VERSIONCODE1);
        expect(datainfo.versionName).assertLarger(0);
        expect(datainfo.entryModuleName).assertEqual("entry");
        expect(datainfo.appInfo.name).assertEqual(NAME1);
        expect(datainfo.appInfo.description).assertEqual(DESCRIPTION);
        expect(datainfo.appInfo.descriptionId >= 0).assertTrue();
        expect(datainfo.appInfo.icon).assertEqual("$media:icon");
        expect(datainfo.appInfo.iconId >= 0).assertTrue();
        expect(datainfo.appInfo.label).assertEqual("$string:app_name");
        expect(datainfo.appInfo.labelId >= 0).assertTrue();
        expect(datainfo.appInfo.systemApp).assertEqual(true);
        expect(datainfo.appInfo.supportedModes).assertEqual(0);
        expect(datainfo.appInfo.enabled).assertEqual(true);
        done();
    })

    /**
     * @tc.number getBundleInfo_1200
     * @tc.name BUNDLE::getBundleInfo
     * @tc.desc Test getBundleInfo interfaces with one hap and different param.
     */
    it('getBundleInfo_1200', 0, async function (done) {
        await demo.getBundleInfo(NAME1, demo.BundleFlag.GET_BUNDLE_DEFAULT, OnReceiveEvent)
        function OnReceiveEvent(err, datainfo) {
            console.info("getBundleInfo_1200 dataInfo ====" + datainfo);
            expect(datainfo.name).assertEqual(NAME1);
            expect(datainfo.vendor).assertEqual("example");
            expect(datainfo.versionCode).assertEqual(VERSIONCODE1);
            expect(datainfo.versionName).assertLarger(0);
            expect(datainfo.entryModuleName).assertEqual("entry");
            expect(datainfo.appInfo.name).assertEqual(NAME1);
            expect(datainfo.appInfo.description).assertEqual(DESCRIPTION);
            expect(datainfo.appInfo.descriptionId >= 0).assertTrue();
            expect(datainfo.appInfo.icon).assertEqual("$media:icon");
            expect(datainfo.appInfo.iconId >= 0).assertTrue();
            expect(datainfo.appInfo.label).assertEqual("$string:app_name");
            expect(datainfo.appInfo.labelId >= 0).assertTrue();
            expect(datainfo.appInfo.systemApp).assertEqual(true);
            expect(datainfo.appInfo.supportedModes).assertEqual(0);
            for (let j = 0; j < datainfo.appInfo.moduleInfos; j++) {
                expect(datainfo.appInfo.moduleInfos[j].moduleName).assertEqual("entry");
                expect(datainfo.appInfo.moduleInfos[j].moduleSourceDir).assertEqual(DIR1);
            }
            expect(datainfo.appInfo.enabled).assertEqual(true);
            done();
        }
    })

    /**
     * @tc.number getApplicationInfos_0100
     * @tc.name BUNDLE::getApplicationInfos
     * @tc.desc Test getApplicationInfos interfaces with one hap.
     */
    it('getApplicationInfos_0100', 0, async function (done) {
        let datainfo = await demo.getAllApplicationInfo(8, USERID);
        checkgetApplicationInfos(datainfo);
        done();
    })
    function checkgetApplicationInfos(datainfo) {
        console.log("=============datainfo.length===============" + datainfo.length);
        expect(datainfo.length).assertLarger(0);
        for (let i = 0; i < datainfo.length; i++) {
            expect(datainfo[i].name.length).assertLarger(0);
            if (datainfo[i].name == NAME1 || datainfo[i].name == NAME2
                || datainfo[i].name == NAME3 || datainfo[i].name == NAME4 || datainfo[i].name == NAME5) {
                expect(datainfo[i].description.length).assertLarger(0);
                expect(datainfo[i].icon.length).assertLarger(0);
                expect(datainfo[i].label.length).assertLarger(0);
            }
            expect(datainfo[i].moduleSourceDirs.length).assertLarger(0);
            expect(datainfo[i].moduleInfos.length).assertLarger(0);
            expect(datainfo[i].supportedModes).assertEqual(0);
            expect(datainfo[i].flags).assertEqual(0);
            for (let j = 0; j < datainfo[i].moduleInfos; j++) {
                expect(datainfo[i].moduleInfos[j].moduleName.length).assertLarger(0);
                expect(datainfo[i].moduleInfos[j].moduleSourceDir.length).assertLarger(0);
            }
        }

    }

    /**
     * @tc.number getApplicationInfos_0600
     * @tc.name BUNDLE::getApplicationInfos
     * @tc.desc Test getApplicationInfos interfaces with one hap.
     */
    it('getApplicationInfos_0600', 0, async function (done) {
        await demo.getAllApplicationInfo(8, USERID, (error, datainfo) => {
            expect(datainfo.length).assertLarger(0);
            for (let i = 0; i < datainfo.length; i++) {
                expect(datainfo[i].name.length).assertLarger(0);
                expect(datainfo[i].moduleSourceDirs.length).assertLarger(0);
                expect(datainfo[i].moduleInfos.length).assertLarger(0);
                expect(datainfo[i].supportedModes).assertEqual(0);
                expect(datainfo[i].flags).assertEqual(0);
                for (let j = 0; j < datainfo[i].moduleInfos; j++) {
                    expect(datainfo[i].moduleInfos[j].moduleName.length).assertLarger(0);
                    expect(datainfo[i].moduleInfos[j].moduleSourceDir.length).assertLarger(0);
                }
            }
            done();
        });
    })

    /**
     * @tc.number getBundleInfos_0100
     * @tc.name BUNDLE::getBundleInfos
     * @tc.desc Test getBundleInfos interfaces with one hap.
     */
    it('getBundleInfos_0100', 0, async function (done) {
        let data = await demo.getAllBundleInfo(0);
        expect(typeof data).assertEqual(OBJECT);
        expect(data.length).assertLarger(0);
        for (let i = 0; i < data.length; i++) {
            expect(data[i].name.length).assertLarger(0);
            expect(data[i].appInfo.name.length).assertLarger(0);
            if (data[i].name == NAME1 || data[i].name == NAME2
                || data[i].name == NAME3 || data[i].name == NAME4 || data[i].name == NAME5) {
                expect(data[i].appInfo.description.length).assertLarger(0);
                expect(data[i].appInfo.icon.length).assertLarger(0);
                expect(data[i].appInfo.label.length).assertLarger(0);
            }
            expect(data[i].appInfo.supportedModes).assertEqual(0);
            expect(data[i].appInfo.moduleInfos.length).assertLarger(0);
        }
        done();
    })

    /**
     * @tc.number getApplicationInfo_0100
     * @tc.name BUNDLE::getApplicationInfo
     * @tc.desc Test getApplicationInfo interfaces with one hap.
     */
    it('getApplicationInfo_0100', 0, async function (done) {
        await demo.getApplicationInfo(NAME1,
            demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION | demo.BundleFlag.GET_APPLICATION_INFO_WITH_METADATA,
            USERID).then(datainfo => {
                expect(typeof datainfo).assertEqual(OBJECT);
                console.info("getApplicationInfo success:" + JSON.stringify(datainfo));
                expect(datainfo.moduleSourceDirs.length).assertLarger(0);
                expect(datainfo.moduleInfos.length).assertLarger(0);
                expect(datainfo.name).assertEqual(NAME1);
                expect(datainfo.description).assertEqual(DESCRIPTION);
                expect(datainfo.icon).assertEqual("$media:icon");
                expect(datainfo.label).assertEqual("$string:app_name");
                expect(datainfo.systemApp).assertEqual(true);
                expect(datainfo.descriptionId).assertLarger(0);
                expect(parseInt(datainfo.iconId)).assertLarger(0);
                expect(parseInt(datainfo.labelId)).assertLarger(0);
                expect(datainfo.supportedModes).assertEqual(0);
                expect(datainfo.process).assertEqual("");
                expect(datainfo.enabled).assertEqual(true);
                expect(datainfo.flags).assertEqual(0);
                expect(datainfo.metaData.entry[0].name).assertEqual("metaDataName");
                expect(datainfo.metaData.entry[0].value).assertEqual("metaDataValue");
                expect(datainfo.metaData.entry[0].extra).assertEqual("$string:app_name");
                expect(datainfo.moduleSourceDirs.length).assertLarger(0);
                for (let j = 0; j < datainfo.moduleInfos; j++) {
                    expect(datainfo.moduleInfos[j].moduleName).assertEqual("entry");
                    expect(datainfo.moduleInfos[j].moduleSourceDir.length).assertLarger(0);
                }
                done();
            }).catch(err => {
                console.info("getApplicationInfo fail:" + JSON.stringify(err));
                expect(err).assertFail();
                done();
            })
    })

    /**
     * @tc.number getBundleInfos_0600
     * @tc.name BUNDLE::getBundleInfos
     * @tc.desc Test getBundleInfos interfaces with one hap.
     */
    it('getBundleInfos_0600', 0, async function (done) {
        await demo.getAllBundleInfo(0, (error, data) => {
            for (let i = 0; i < data.length; i++) {
                console.info('dataInfos=============' + i);
                for (const item in data[i]) {
                    const a = data[i][item];
                    console.info(item + ":" + JSON.stringify(a));
                };
            };
            expect(typeof data).assertEqual(OBJECT);
            for (let i = 0; i < data.length; i++) {
                expect(data[i].name.length).assertLarger(0);
                expect(data[i].appInfo.name.length).assertLarger(0);
                if (data[i].name == NAME1 || data[i].name == NAME2
                    || data[i].name == NAME3 || data[i].name == NAME4 || data[i].name == NAME5) {
                    expect(data[i].appInfo.description.length).assertLarger(0);
                    expect(data[i].appInfo.icon.length).assertLarger(0);
                    expect(data[i].appInfo.label.length).assertLarger(0);
                }
                expect(data[i].appInfo.supportedModes).assertEqual(0);
                expect(data[i].appInfo.moduleInfos.length).assertLarger(0);
            }
            done();
        });
    })

    /**
     * @tc.number getApplicationInfo_0600
     * @tc.name BUNDLE::getApplicationInfo
     * @tc.desc Test getApplicationInfo interfaces with one hap.
     */
    it('getApplicationInfo_0600', 0, async function (done) {
        await demo.getApplicationInfo(NAME1, demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, USERID,
            (error, datainfo) => {
                if (error) {
                    console.info("getApplicationInfo fail:" + JSON.stringify(error));
                    expect(error).assertFail();
                }
                console.info("getApplicationInfo success:" + JSON.stringify(datainfo));
                expect(typeof datainfo).assertEqual(OBJECT);
                expect(datainfo.name).assertEqual(NAME1);
                expect(datainfo.label).assertEqual("$string:app_name");
                expect(datainfo.description).assertEqual(DESCRIPTION);
                expect(datainfo.icon).assertEqual("$media:icon");
                expect(datainfo.descriptionId >= 0).assertTrue();
                expect(parseInt(datainfo.iconId)).assertLarger(0);
                expect(parseInt(datainfo.labelId)).assertLarger(0);
                expect(datainfo.systemApp).assertEqual(true);
                expect(datainfo.supportedModes).assertEqual(0);
                expect(datainfo.enabled).assertEqual(true);
                for (let j = 0; j < datainfo.moduleInfos; j++) {
                    expect(datainfo.moduleInfos[j].moduleName).assertEqual("entry");
                    expect(datainfo.moduleInfos[j].moduleSourceDir).assertEqual(DIR1);
                }
                done();
            })
    })

    /**
     * @tc.number getApplicationInfo_1100
     * @tc.name BUNDLE::getApplicationInfo
     * @tc.desc Test getApplicationInfo interfaces with one hap and different param.
     */
    it('getApplicationInfo_1100', 0, async function (done) {
        await demo.getApplicationInfo(NAME1, demo.BundleFlag.GET_BUNDLE_DEFAULT, USERID).then(datainfo => {
            console.info("getApplicationInfo success" + JSON.stringify(datainfo));
            expect(typeof datainfo).assertEqual(OBJECT);
            expect(datainfo.name).assertEqual(NAME1);
            expect(datainfo.label).assertEqual("$string:app_name");
            expect(datainfo.description).assertEqual(DESCRIPTION);
            expect(datainfo.icon).assertEqual("$media:icon");
            expect(datainfo.descriptionId).assertLarger(0);
            expect(parseInt(datainfo.iconId)).assertLarger(0);
            expect(parseInt(datainfo.labelId)).assertLarger(0);
            expect(datainfo.systemApp).assertEqual(true);
            expect(datainfo.supportedModes).assertEqual(0);
        }).catch(err => {
            console.info("getApplicationInfo fail" + JSON.stringify(err));
            expect(err).assertFail();
        })
        done();
    })

    /**
     * @tc.number getApplicationInfo_1200
     * @tc.name BUNDLE::getApplicationInfo
     * @tc.desc Test getApplicationInfo interfaces with one hap and different param.
     */
    it('getApplicationInfo_1200', 0, async function (done) {
        await demo.getApplicationInfo(NAME1, demo.BundleFlag.GET_BUNDLE_DEFAULT, USERID, (error, datainfo) => {
            if (error) {
                console.info("getApplicationInfo fail" + JSON.stringify(error));
                expect(error).assertFail();
            }
            console.info("getApplicationInfo success" + JSON.stringify(datainfo));
            expect(typeof datainfo).assertEqual(OBJECT);
            expect(datainfo.name).assertEqual(NAME1);
            expect(datainfo.label).assertEqual("$string:app_name");
            expect(datainfo.description).assertEqual(DESCRIPTION);
            expect(datainfo.icon).assertEqual("$media:icon");
            expect(datainfo.descriptionId).assertLarger(0);
            expect(parseInt(datainfo.iconId)).assertLarger(0);
            expect(parseInt(datainfo.labelId)).assertLarger(0);
            expect(datainfo.systemApp).assertEqual(true);
            expect(datainfo.supportedModes).assertEqual(0);
            done();
        })
    })

    /**
     * @tc.number getBundleInfo_0200
     * @tc.name BUNDLE::getBundleInfo
     * @tc.desc Test getBundleInfo interfaces with two haps.
     */
    it('getBundleInfo_0200', 0, async function (done) {
        let datainfo = await demo.getBundleInfo(NAME2, demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
        expect(datainfo.name).assertEqual(NAME2);
        expect(datainfo.vendor).assertEqual("example");
        expect(datainfo.versionCode).assertEqual(1);
        expect(datainfo.versionName).assertLarger(0);
        expect(datainfo.entryModuleName).assertEqual("entry");
        expect(datainfo.appInfo.name).assertEqual(NAME2);
        expect(datainfo.appInfo.description).assertEqual(DESCRIPTION);
        expect(datainfo.appInfo.descriptionId >= 0).assertTrue();
        expect(datainfo.appInfo.icon).assertEqual("$media:icon");
        expect(datainfo.appInfo.iconId >= 0).assertTrue();
        expect(datainfo.appInfo.label).assertEqual("$string:app_name");
        expect(datainfo.appInfo.labelId >= 0).assertTrue();
        expect(datainfo.appInfo.systemApp).assertEqual(true);
        done();
    })

    /**
     * @tc.number getBundleInfo_0700
     * @tc.name BUNDLE::getBundleInfo
     * @tc.desc Test getBundleInfo interfaces with two haps.
     */
    it('getBundleInfo_0700', 0, async function (done) {
        await demo.getBundleInfo(NAME2, demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES, OnReceiveEvent);
        function OnReceiveEvent(err, datainfo) {
            expect(datainfo.name).assertEqual(NAME2);
            expect(datainfo.vendor).assertEqual("example");
            expect(datainfo.versionCode).assertEqual(1);
            expect(datainfo.versionName).assertLarger(0);
            expect(datainfo.entryModuleName).assertEqual("entry");
            expect(datainfo.appInfo.name).assertEqual(NAME2);
            expect(datainfo.appInfo.description).assertEqual(DESCRIPTION);
            expect(datainfo.appInfo.descriptionId >= 0).assertTrue();
            expect(datainfo.appInfo.icon).assertEqual("$media:icon");
            expect(datainfo.appInfo.iconId >= 0).assertTrue();
            expect(datainfo.appInfo.label).assertEqual("$string:app_name");
            expect(datainfo.appInfo.labelId >= 0).assertTrue();
            expect(datainfo.appInfo.systemApp).assertEqual(true);
            done();
        }
    })

    /**
     * @tc.number getApplicationInfos_0200
    * @tc.name BUNDLE::getApplicationInfos
     * @tc.desc Test getApplicationInfos interfaces with two haps.
     */
    it('getApplicationInfos_0200', 0, async function (done) {
        let datainfo = await demo.getAllApplicationInfo(8, USERID);
        console.info("==========ActsBmsGetInfosSecondScene is ==========" + JSON.stringify(datainfo));
        checkgetApplicationInfos(datainfo);
        done();
    })

    /**
     * @tc.number getApplicationInfos_0400
     * @tc.name BUNDLE::getApplicationInfos
     * @tc.desc Test getApplicationInfos interfaces with two haps and different param.
     */
    it('getApplicationInfos_0400', 0, async function (done) {
        let datainfo = await demo.getAllApplicationInfo(0, USERID);
        expect(datainfo.length).assertLarger(0);
        checkgetApplicationInfos(datainfo);
        done();
    })

    /**
     * @tc.number getApplicationInfos_0700
     * @tc.name BUNDLE::getApplicationInfos
     * @tc.desc Test getApplicationInfos interfaces with two haps.
     */
    it('getApplicationInfos_0700', 0, async function (done) {
        await demo.getAllApplicationInfo(8, USERID, (error, datainfo) => {
            for (let i = 0; i < datainfo.length; i++) {
                expect(datainfo[i].name.length).assertLarger(0);
                if (datainfo[i].name == NAME1 || datainfo[i].name == NAME2
                    || datainfo[i].name == NAME3 || datainfo[i].name == NAME4 || datainfo[i].name == NAME5) {
                    expect(datainfo[i].description.length).assertLarger(0);
                    expect(datainfo[i].icon.length).assertLarger(0);
                    expect(datainfo[i].label.length).assertLarger(0);
                }
                expect(datainfo[i].moduleSourceDirs.length).assertLarger(0);
                expect(datainfo[i].moduleInfos.length).assertLarger(0);
                expect(datainfo[i].supportedModes).assertEqual(0);
                expect(datainfo[i].flags).assertEqual(0);
                for (let j = 0; j < datainfo[i].moduleInfos; j++) {
                    expect(datainfo[i].moduleInfos[j].moduleName.length).assertLarger(0);
                    expect(datainfo[i].moduleInfos[j].moduleSourceDir.length).assertLarger(0);
                }
            }
            done();
        });
    })

    /**
     * @tc.number getApplicationInfos_0800
     * @tc.name BUNDLE::getApplicationInfos
     * @tc.desc Test getApplicationInfos interfaces with three haps.
    */
    it('getApplicationInfos_0800', 0, async function (done) {
        await demo.getAllApplicationInfo(0, USERID, (error, datainfo) => {
            for (let i = 0; i < datainfo.length; i++) {
                expect(datainfo[i].name.length).assertLarger(0);
                if (datainfo[i].name == NAME1 || datainfo[i].name == NAME2
                    || datainfo[i].name == NAME3 || datainfo[i].name == NAME4 || datainfo[i].name == NAME5) {
                    expect(datainfo[i].description.length).assertLarger(0);
                    expect(datainfo[i].icon.length).assertLarger(0);
                    expect(datainfo[i].label.length).assertLarger(0);
                }
                expect(datainfo[i].moduleSourceDirs.length).assertLarger(0);
                expect(datainfo[i].moduleInfos.length).assertLarger(0);
                expect(datainfo[i].supportedModes).assertEqual(0);
                expect(datainfo[i].flags).assertEqual(0);
                for (let j = 0; j < datainfo[i].moduleInfos; j++) {
                    expect(datainfo[i].moduleInfos[j].moduleName.length).assertLarger(0);
                    expect(datainfo[i].moduleInfos[j].moduleSourceDir.length).assertLarger(0);
                }
            }
            done();
        });
    })

    /**
     * @tc.number getApplicationInfos_0900
     * @tc.name BUNDLE::getApplicationInfos
     * @tc.desc Test getApplicationInfos interfaces with two haps and different param.
     */
    it('getApplicationInfos_0900', 0, async function (done) {
        await demo.getAllApplicationInfo(0, USERID, (error, datainfo) => {
            for (let i = 0; i < datainfo.length; i++) {
                expect(datainfo[i].name.length).assertLarger(0);
                if (datainfo[i].name == NAME1 || datainfo[i].name == NAME2
                    || datainfo[i].name == NAME3 || datainfo[i].name == NAME4 || datainfo[i].name == NAME5) {
                    expect(datainfo[i].description.length).assertLarger(0);
                    expect(datainfo[i].icon.length).assertLarger(0);
                    expect(datainfo[i].label.length).assertLarger(0);
                }
                expect(datainfo[i].moduleSourceDirs.length).assertLarger(0);
                expect(datainfo[i].moduleInfos.length).assertLarger(0);
                expect(datainfo[i].supportedModes).assertEqual(0);
                expect(datainfo[i].flags).assertEqual(0);
                for (let j = 0; j < datainfo[i].moduleInfos; j++) {
                    expect(datainfo[i].moduleInfos[j].moduleName.length).assertLarger(0);
                    expect(datainfo[i].moduleInfos[j].moduleSourceDir.length).assertLarger(0);
                }
            }
            done();
        });
    })

    /**
     * @tc.number getBundleInfos_0200
     * @tc.name BUNDLE::getBundleInfos
     * @tc.desc Test getBundleInfos interfaces with two haps.
     */
    it('getBundleInfos_0200', 0, async function (done) {
        let data = await demo.getAllBundleInfo(0);
        expect(typeof data).assertEqual(OBJECT);
        for (let i = 0; i < data.length; i++) {
            expect(data[i].name.length).assertLarger(0);
            expect(data[i].appInfo.name.length).assertLarger(0);
            if (data[i].name == NAME1 || data[i].name == NAME2
                || data[i].name == NAME3 || data[i].name == NAME4 || data[i].name == NAME5) {
                expect(data[i].appInfo.description.length).assertLarger(0);
                expect(data[i].appInfo.icon.length).assertLarger(0);
                expect(data[i].appInfo.label.length).assertLarger(0);
            }
            expect(data[i].appInfo.supportedModes).assertEqual(0);
            expect(data[i].appInfo.moduleInfos.length).assertLarger(0);
        }
        done();
    })

    /**
     * @tc.number getBundleInfos_0400
     * @tc.name BUNDLE::getBundleInfos
     * @tc.desc Test getBundleInfos interfaces with two haps and different param.
     */
    it('getBundleInfos_0400', 0, async function (done) {
        let data = await demo.getAllBundleInfo(1);
        expect(typeof data).assertEqual(OBJECT);
        for (let i = 0; i < data.length; i++) {
            expect(data[i].name.length).assertLarger(0);
            expect(data[i].appInfo.name.length).assertLarger(0);
            if (data[i].name == NAME1 || data[i].name == NAME2
                || data[i].name == NAME3 || data[i].name == NAME4 || data[i].name == NAME5) {
                expect(data[i].appInfo.description.length).assertLarger(0);
                expect(data[i].appInfo.icon.length).assertLarger(0);
                expect(data[i].appInfo.label.length).assertLarger(0);
            }
            expect(data[i].appInfo.supportedModes).assertEqual(0);
            expect(data[i].appInfo.moduleInfos.length).assertLarger(0);
        }
        done();
    })

    /**
     * @tc.number getApplicationInfo_0200
     * @tc.name BUNDLE::getApplicationInfo
     * @tc.desc Test getApplicationInfo interfaces with two haps.
     */
    it('getApplicationInfo_0200', 0, async function (done) {
        let datainfo = await demo.getApplicationInfo(NAME2,
            demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, USERID);
        console.info("getApplicationInfo result" + JSON.stringify(datainfo));
        expect(typeof datainfo).assertEqual(OBJECT);
        expect(datainfo.name.length).assertLarger(0);
        expect(datainfo.description.length).assertLarger(0);
        expect(datainfo.icon.length).assertLarger(0);
        expect(datainfo.label.length).assertLarger(0);
        expect(datainfo.moduleSourceDirs.length).assertLarger(0);
        expect(datainfo.moduleInfos.length).assertLarger(0);
        expect(datainfo.name).assertEqual(NAME2);
        expect(datainfo.description).assertEqual(DESCRIPTION);
        expect(datainfo.icon).assertEqual("$media:icon");
        expect(datainfo.label).assertEqual("$string:app_name");
        expect(datainfo.systemApp).assertEqual(true);
        expect(datainfo.descriptionId >= 0).assertTrue();
        expect(datainfo.iconId >= 0).assertTrue();
        expect(datainfo.labelId >= 0).assertTrue();
        expect(datainfo.supportedModes).assertEqual(0);
        expect(datainfo.process).assertEqual("");
        expect(datainfo.enabled).assertEqual(true);
        expect(datainfo.flags).assertEqual(0);
        expect(datainfo.moduleSourceDirs.length).assertLarger(0);
        for (let j = 0; j < datainfo.moduleInfos; j++) {
            expect(datainfo.moduleInfos[j].moduleName).assertEqual("entry");
            expect(datainfo.moduleInfos[j].moduleSourceDir.length).assertLarger(0);
        }
        done();
    })

    /**
     * @tc.number getBundleInfos_0700
     * @tc.name BUNDLE::getBundleInfos
     * @tc.desc Test getBundleInfos interfaces with two haps.
     */
    it('getBundleInfos_0700', 0, async function (done) {
        await demo.getAllBundleInfo(0, (error, data) => {
            expect(typeof data).assertEqual(OBJECT);
            for (let i = 0; i < data.length; i++) {
                expect(data[i].name.length).assertLarger(0);
                expect(data[i].appInfo.name.length).assertLarger(0);
                if (data[i].name == NAME1 || data[i].name == NAME2
                    || data[i].name == NAME3 || data[i].name == NAME4 || data[i].name == NAME5) {
                    expect(data[i].appInfo.description.length).assertLarger(0);
                    expect(data[i].appInfo.icon.length).assertLarger(0);
                    expect(data[i].appInfo.label.length).assertLarger(0);
                }
                expect(data[i].appInfo.supportedModes).assertEqual(0);
                expect(data[i].appInfo.moduleInfos.length).assertLarger(0);
            }
            done();
        })
    })

    /**
     * @tc.number getBundleInfos_0900
    * @tc.name BUNDLE::getBundleInfos
     * @tc.desc Test getBundleInfos interfaces with two haps and different param.
     */
    it('getBundleInfos_0900', 0, async function (done) {
        await demo.getAllBundleInfo(1, (error, data) => {
            expect(typeof data).assertEqual(OBJECT);
            for (let i = 0; i < data.length; i++) {
                expect(data[i].name.length).assertLarger(0);
                expect(data[i].appInfo.name.length).assertLarger(0);
                if (data[i].name == NAME1 || data[i].name == NAME2
                    || data[i].name == NAME3 || data[i].name == NAME4 || data[i].name == NAME5) {
                    expect(data[i].appInfo.description.length).assertLarger(0);
                    expect(data[i].appInfo.icon.length).assertLarger(0);
                    expect(data[i].appInfo.label.length).assertLarger(0);
                }
                expect(data[i].appInfo.supportedModes).assertEqual(0);
                expect(data[i].appInfo.moduleInfos.length).assertLarger(0);
            }
            done();
        })
    })


    /**
     * @tc.number getApplicationInfo_0700
     * @tc.name BUNDLE::getApplicationInfo
     * @tc.desc Test getApplicationInfo interfaces with two haps.
     */
    it('getApplicationInfo_0700', 0, async function (done) {
        await demo.getApplicationInfo(NAME2,
            demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, USERID, (error, datainfo) => {
                if (error) {
                    console.info("getApplicationInfo error" + JSON.stringify(error));
                    expect(error).assertFail();
                }
                console.info("getApplicationInfo success" + JSON.stringify(datainfo));
                expect(typeof datainfo).assertEqual(OBJECT);
                expect(datainfo.name).assertEqual(NAME2);
                expect(datainfo.label).assertEqual("$string:app_name");
                expect(datainfo.description).assertEqual(DESCRIPTION);
                expect(datainfo.icon).assertEqual("$media:icon");
                expect(datainfo.name).assertEqual(NAME2);
                expect(datainfo.description).assertEqual(DESCRIPTION);
                expect(datainfo.descriptionId >= 0).assertTrue();
                expect(datainfo.icon).assertEqual("$media:icon");
                expect(datainfo.iconId >= 0).assertTrue();
                expect(datainfo.label).assertEqual("$string:app_name");
                expect(datainfo.labelId >= 0).assertTrue();
                expect(datainfo.systemApp).assertEqual(true);
                expect(datainfo.supportedModes).assertEqual(0);
                done();
            })
    })

    /**
     * @tc.number getBundleInfos_0300
     * @tc.name BUNDLE::getBundleInfos
     * @tc.desc Test getBundleInfos interfaces with three haps.
     */
    it('getBundleInfos_0300', 0, async function (done) {
        let data = await demo.getAllBundleInfo(0);
        for (let i = 0; i < data.length; i++) {
            expect(data[i].name.length).assertLarger(0);
            expect(data[i].appInfo.name.length).assertLarger(0);
            if (data[i].name == NAME1 || data[i].name == NAME2
                || data[i].name == NAME3 || data[i].name == NAME4 || data[i].name == NAME5) {
                expect(data[i].appInfo.description.length).assertLarger(0);
                expect(data[i].appInfo.icon.length).assertLarger(0);
                expect(data[i].appInfo.label.length).assertLarger(0);
            }
            expect(data[i].appInfo.supportedModes).assertEqual(0);
            expect(data[i].appInfo.moduleInfos.length).assertLarger(0);
        }
        done();
    })

    /**
     * @tc.number getBundleInfos_0500
     * @tc.name BUNDLE::getBundleInfos
     * @tc.desc Test getBundleInfos interfaces with three haps and different param.
     */
    it('getBundleInfos_0500', 0, async function (done) {
        let data = await demo.getAllBundleInfo(1);
        for (let i = 0; i < data.length; i++) {
            expect(data[i].name.length).assertLarger(0);
            expect(data[i].appInfo.name.length).assertLarger(0);
            if (data[i].name == NAME1 || data[i].name == NAME2
                || data[i].name == NAME3 || data[i].name == NAME4 || data[i].name == NAME5) {
                expect(data[i].appInfo.description.length).assertLarger(0);
                expect(data[i].appInfo.icon.length).assertLarger(0);
                expect(data[i].appInfo.label.length).assertLarger(0);
            }
            expect(data[i].appInfo.supportedModes).assertEqual(0);
            expect(data[i].appInfo.moduleInfos.length).assertLarger(0);
        }
        done();
    })

    /**
     * @tc.number getBundleInfos_0800
     * @tc.name BUNDLE::getBundleInfos
     * @tc.desc Test getBundleInfos interfaces with three haps.
     */
    it('getBundleInfos_0800', 0, async function (done) {
        await demo.getAllBundleInfo(0, (error, data) => {
            for (let i = 0; i < data.length; i++) {
                expect(data[i].name.length).assertLarger(0);
                expect(data[i].appInfo.name.length).assertLarger(0);
                if (data[i].name == NAME1 || data[i].name == NAME2
                    || data[i].name == NAME3 || data[i].name == NAME4 || data[i].name == NAME5) {
                    expect(data[i].appInfo.description.length).assertLarger(0);
                    expect(data[i].appInfo.icon.length).assertLarger(0);
                    expect(data[i].appInfo.label.length).assertLarger(0);
                }
                expect(data[i].appInfo.supportedModes).assertEqual(0);
                expect(data[i].appInfo.moduleInfos.length).assertLarger(0);
            }
            done();
        })

    })

    /**
     * @tc.number getApplicationInfo_0300
     * @tc.name BUNDLE::getApplicationInfo
     * @tc.desc Test getApplicationInfo interfaces with three haps.
     */
    it('getApplicationInfo_0300', 0, async function (done) {
        demo.getApplicationInfo(NAME3, demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION,
            demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES).then(datainfo => {
                expect(datainfo.name).assertEqual(NAME3);
                expect(datainfo.label).assertEqual("$string:app_name");
                expect(datainfo.description).assertEqual(DESCRIPTION);
                expect(datainfo.icon).assertEqual("$media:icon");
                expect(datainfo.name).assertEqual(NAME3);
                expect(datainfo.description).assertEqual(DESCRIPTION);
                expect(datainfo.descriptionId >= 0).assertTrue();
                expect(datainfo.icon).assertEqual("$media:icon");
                expect(datainfo.iconId >= 0).assertTrue();
                expect(datainfo.label).assertEqual("$string:app_name");
                expect(datainfo.labelId >= 0).assertTrue();
                expect(datainfo.systemApp).assertEqual(true);
                expect(datainfo.supportedModes).assertEqual(0);
            });
        done();
    })

    /**
     * @tc.number getBundleInfo_0400
     * @tc.name BUNDLE::getBundleInfo
     * @tc.desc Test getBundleInfo interfaces with error hap.
     */
    it('getBundleInfo_0400', 0, async function (done) {
        await demo.getBundleInfo('error', demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES).then(datainfo => {
            console.info("getBundleInfo success:" + JSON.stringify(datainfo));
            expect(datainfo).assertFail();
            done();
        }).catch(err => {
            console.info("getBundleInfo err:" + JSON.stringify(err));
            expect(err).assertEqual(1);
            done();
        });
    })

    /**
     * @tc.number getBundleInfo_0900
     * @tc.name BUNDLE::getBundleInfo
     * @tc.desc Test getBundleInfo interfaces with error hap.
     */
    it('getBundleInfo_0900', 0, async function (done) {
        await demo.getBundleInfo('error', demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES, OnReceiveEvent);
        function OnReceiveEvent(err, datainfo) {
            if (err) {
                console.info("getBundleInfo err" + JSON.stringify(err));
                expect(err).assertEqual(1);
                done();
                return;
            }
            console.info("getBundleInfo success" + JSON.stringify(datainfo));
            expect(datainfo).assertFail();
            done();
        }
    })

    /**
     * @tc.number getApplicationInfo_0400
     * @tc.name BUNDLE::getApplicationInfo
     * @tc.desc Test getApplicationInfo interfaces with error hap.
     */
    it('getApplicationInfo_0400', 0, async function (done) {
        demo.getApplicationInfo(ERROR, demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, USERID).then(datainfo => {
            checkgetApplicationInfoe(datainfo);
        }).catch(err => {
            console.info("getApplicationInfo err" + JSON.stringify(err));
            expect(err).assertEqual(1);
            done();
        });
    })
    function checkgetApplicationInfoe(datainfo) {
        console.info("getApplicationInfo success" + JSON.stringify(datainfo));
        expect(datainfo).assertFail();
        done();
    }

    /**
     * @tc.number getApplicationInfo_0900
     * @tc.name BUNDLE::getApplicationInfo
     * @tc.desc Test getApplicationInfo interfaces with error hap.
     */
    it('getApplicationInfo_0900', 0, async function (done) {
        demo.getApplicationInfo(ERROR, demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, USERID, (error, datainfo) => {
            if (error) {
                console.info("getApplicationInfo fail" + JSON.stringify(error));
                expect(error).assertEqual(1);
                done();
                return;
            }
            console.info("getApplicationInfo success" + JSON.stringify(datainfo));
            expect(datainfo).assertFail();
            done();
        })
    })

    /**
     * @tc.number getBundleInfo_1000
     * @tc.name BUNDLE::getBundleInfo
     * @tc.desc Test getBundleInfo interfaces with none hap.
     */
    it('getBundleInfo_1000', 0, async function (done) {
        await demo.getBundleInfo(' ', demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES, OnReceiveEvent);
        function OnReceiveEvent(err, datainfo) {
            if (err) {
                console.info("getBundleInfo err" + JSON.stringify(err));
                expect(err).assertEqual(1);
                done();
                return;
            }
            console.info("getBundleInfo success" + JSON.stringify(datainfo));
            expect(datainfo).assertFail();
            done();
        }
    })

    /**
     * @tc.number getApplicationInfo_0500
     * @tc.name BUNDLE::getApplicationInfo
     * @tc.desc Test getApplicationInfo interfaces with none hap.
     */
    it('getApplicationInfo_0500', 0, async function (done) {
        demo.getApplicationInfo('', demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, USERID, (error, datainfo) => {
            if (error) {
                console.info("getApplicationInfo err" + JSON.stringify(error));
                expect(error).assertEqual(1);
                done();
                return;
            }
            console.info("getApplicationInfo success" + JSON.stringify(datainfo));
            expect(datainfo).assertFail();
            done();
        })
    })

    /**
     * @tc.number getBundleInfo_0500
     * @tc.name BUNDLE::getBundleInfo
     * @tc.desc Test getBundleInfo interfaces with none hap.
     */
    it('getBundleInfo_0500', 0, async function (done) {
        demo.getBundleInfo(' ', demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES).then(datainfo => {
            console.info("getBundleInfo success" + JSON.stringify(datainfo));
            expect(datainfo).assertFail();
            done();
        }).catch(err => {
            console.info("getBundleInfo fail" + JSON.stringify(err));
            expect(err).assertEqual(1);
            done();
        });
    })

    /**
     * @tc.number getApplicationInfo_1000
     * @tc.name BUNDLE::getApplicationInfo
     * @tc.desc Test getApplicationInfo interfaces with none hap.
     */
    it('getApplicationInfo_1000', 0, async function (done) {
        demo.getApplicationInfo('', demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, USERID, (error, datainfo) => {
            if (error) {
                console.info("getApplicationInfo fail" + JSON.stringify(error));
                expect(error).assertEqual(1);
                done();
                return;
            }
            console.info("getApplicationInfo success" + JSON.stringify(datainfo));
            expect(datainfo).assertFail();
            done();
        });
    })

    /**
     * @tc.number queryAbilityByWant_0100
     * @tc.name BUNDLE::queryAbilityByWant
     * @tc.desc Test queryAbilityByWant interfaces with none hap.
     */
    it('queryAbilityByWant_0100', 0, async function (done) {
        await demo.queryAbilityByWant(
            {
                "bundleName": "com.example.myapplication1",
                "abilityName": "com.example.myapplication1.MainAbility",
            }, demo.BundleFlag.GET_ABILITY_INFO_WITH_APPLICATION |
            demo.BundleFlag.GET_ABILITY_INFO_WITH_PERMISSION |
        demo.BundleFlag.GET_ABILITY_INFO_WITH_METADATA,
            USERID).then(data => {
                expect(data.length).assertLarger(0);
                for (let i = 0, len = data.length; i < len; i++) {
                    let datainfo = data[i];
                    expect(datainfo.name).assertEqual("com.example.myapplication1.MainAbility");
                    expect(datainfo.label).assertEqual("$string:app_name");
                    expect(datainfo.description).assertEqual(DESCRIPTION);
                    expect(datainfo.icon).assertEqual("$media:icon");
                    expect(datainfo.moduleName).assertEqual("entry");
                    expect(datainfo.bundleName).assertEqual(NAME1);
                    expect(datainfo.type).assertEqual(demo.AbilityType.PAGE);
                    expect(datainfo.subType).assertEqual(demo.AbilitySubType.UNSPECIFIED);
                    expect(datainfo.orientation).assertEqual(demo.DisplayOrientation.UNSPECIFIED);
                    expect(datainfo.launchMode).assertEqual(demo.LaunchMode.STANDARD);
                    expect(datainfo.permissions[0]).assertEqual("com.permission.BMS_PERMISSION_CAMERA");
                    expect(datainfo.applicationInfo.name).assertEqual(NAME1);
                    expect(datainfo.applicationInfo.description).assertEqual(DESCRIPTION);
                    expect(datainfo.applicationInfo.descriptionId >= 0).assertTrue();
                    expect(datainfo.applicationInfo.icon).assertEqual("$media:icon");
                    expect(datainfo.applicationInfo.iconId >= 0).assertTrue();
                    expect(datainfo.applicationInfo.label).assertEqual("$string:app_name");
                    expect(datainfo.applicationInfo.labelId >= 0).assertTrue();
                    expect(datainfo.applicationInfo.systemApp).assertEqual(true);
                    expect(datainfo.applicationInfo.supportedModes).assertEqual(0);
                    expect(datainfo.applicationInfo.enabled).assertEqual(true);
                    expect(datainfo.metaData.length).assertLarger(0);
                    for (let j = 0; j < datainfo.applicationInfo.moduleInfos; j++) {
                        expect(datainfo.applicationInfo.moduleInfos[j].moduleName).assertEqual("entry");
                        expect(datainfo.applicationInfo.moduleInfos[j].moduleSourceDir).assertEqual(DIR1);
                    }
                }
                done();
            }).catch(err => {
                expect(err).assertFail();
                done();
            })
    })

    /**
     * @tc.number queryAbilityByWant_0200
     * @tc.name BUNDLE::queryAbilityByWant
     * @tc.desc Test queryAbilityByWant interfaces with two haps.
     */
    it('queryAbilityByWant_0200', 0, async function (done) {
        let data = await demo.queryAbilityByWant(
            {
                "bundleName": "com.example.myapplication2",
                "abilityName": "com.example.myapplication1.MainAbility",
            }, demo.BundleFlag.GET_ALL_APPLICATION_INFO, USERID);
        expect(data.length).assertLarger(0);
        for (let i = 0, len = data.length; i < len; i++) {
            let datainfo = data[i];
            expect(datainfo.name.length).assertLarger(0);
            expect(datainfo.label).assertEqual("$string:app_name");
            expect(datainfo.description).assertEqual(DESCRIPTION);
            expect(datainfo.icon).assertEqual("$media:icon");
            expect(datainfo.moduleName).assertEqual("entry");
            expect(datainfo.bundleName).assertEqual(NAME2);
            expect(datainfo.orientation).assertEqual(1);
            expect(datainfo.launchMode).assertEqual(demo.LaunchMode.SINGLETON);
            expect(datainfo.applicationInfo.name).assertEqual(NAME2);
            expect(datainfo.applicationInfo.description).assertEqual(DESCRIPTION);
            expect(datainfo.applicationInfo.descriptionId >= 0).assertTrue();
            expect(datainfo.applicationInfo.icon).assertEqual("$media:icon");
            expect(datainfo.applicationInfo.iconId >= 0).assertTrue();
            expect(datainfo.applicationInfo.label).assertEqual("$string:app_name");
            expect(datainfo.applicationInfo.labelId >= 0).assertTrue();
            expect(datainfo.applicationInfo.systemApp).assertEqual(true);
            expect(datainfo.applicationInfo.supportedModes).assertEqual(0);
            expect(datainfo.applicationInfo.enabled).assertEqual(true);
            for (let j = 0; j < datainfo.applicationInfo.moduleInfos; j++) {
                expect(datainfo.applicationInfo.moduleInfos[j].moduleName).assertEqual("entry");
                expect(datainfo.applicationInfo.moduleInfos[j].moduleSourceDir).assertEqual(DIR2);
            }
        }
        done();
    })

    /**
     * @tc.number queryAbilityByWant_0300
     * @tc.name BUNDLE::queryAbilityByWant
     * @tc.desc Test queryAbilityByWant interfaces with three haps.
     */
    it('queryAbilityByWant_0300', 0, async function (done) {
        await demo.queryAbilityByWant(
            {
                entities: ['entity.system.home', 'entitiesentities']
            }, 4, USERID).then(data => {
                let queryResultCount = 0;
                for (let i = 0, len = data.length; i < len; i++) {
                    let datainfo = data[i];
                    if (datainfo.bundleName == NAME3) {
                        expect(datainfo.name).assertEqual("com.example.myapplication.MainAbility");
                        expect(datainfo.label).assertEqual("$string:app_name");
                        expect(datainfo.description).assertEqual(DESCRIPTION);
                        expect(datainfo.icon).assertEqual("$media:icon");
                        expect(datainfo.moduleName).assertEqual("entry");
                        expect(datainfo.bundleName).assertEqual(NAME3);
                        expect(datainfo.applicationInfo.name).assertEqual(NAME3);
                        expect(datainfo.applicationInfo.description).assertEqual(DESCRIPTION);
                        expect(datainfo.applicationInfo.descriptionId >= 0).assertTrue();
                        expect(datainfo.applicationInfo.icon).assertEqual("$media:icon");
                        expect(datainfo.applicationInfo.iconId >= 0).assertTrue();
                        expect(datainfo.applicationInfo.label).assertEqual("$string:app_name");
                        expect(datainfo.applicationInfo.labelId >= 0).assertTrue();
                        expect(datainfo.applicationInfo.systemApp).assertEqual(true);
                        expect(datainfo.applicationInfo.supportedModes).assertEqual(0);
                        expect(datainfo.orientation).assertEqual(2);
                        expect(datainfo.applicationInfo.enabled).assertEqual(true);
                        for (let j = 0; j < datainfo.applicationInfo.moduleInfos; j++) {
                            expect(datainfo.applicationInfo.moduleInfos[j].moduleName).assertEqual("entry");
                        }
                        queryResultCount++;
                        console.info("queryResultCount 1===================" + queryResultCount);
                    }
                    if (datainfo.bundleName == NAME4) {
                        expect(datainfo.name).assertEqual("com.example.myapplication.MainAbility");
                        expect(datainfo.bundleName).assertEqual(NAME4);
                        expect(datainfo.orientation).assertEqual(3);
                        queryResultCount++;
                        console.info("queryResultCount 2===================" + queryResultCount);
                    }
                    if (datainfo.bundleName == NAME5) {
                        expect(datainfo.name).assertEqual("com.example.myapplication.MainAbility");
                        expect(datainfo.bundleName).assertEqual(NAME5);
                        expect(datainfo.orientation).assertEqual(0);
                        queryResultCount++;
                        console.info("queryResultCount 3===================" + queryResultCount);
                    }
                }
                console.info("queryResultCount 4===================" + queryResultCount);
                expect(queryResultCount).assertEqual(3);
                done();
            }).catch(err => {
                expect(err).assertFail();
                done();
            })
    })

    /**
     * @tc.number queryAbilityByWant_0400
     * @tc.name BUNDLE::queryAbilityByWant
     * @tc.desc Test queryAbilityByWant interfaces with one hap.
     */
    it('queryAbilityByWant_0400', 0, async function (done) {
        await demo.queryAbilityByWant(
            {
                "bundleName": "wrong name",
                "abilityName": "com.example.myapplication1.MainAbility"
            }, 0, USERID).then(datainfo => {
                console.info("queryAbilityByWant_0400 dataInfo : ===========" + datainfo);
                expect(datainfo).assertFail();
            }).catch(err => {
                console.info("queryAbilityByWant_0400 err : ===========" + err);
                expect(err).assertEqual(1);
                done();
            })
    })

    /**
     * @tc.number getBundleInfo_1300
     * @tc.name BUNDLE::getBundleInfo
     * @tc.desc Test getBundleInfo interfaces with LAUNCHER hap.
     */
    it('getBundleInfo_1300', 0, async function (done) {
        demo.getBundleInfo(LAUNCHER, demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES).then(datainfo => {
            console.info("getBundleInfo success:" + JSON.stringify(datainfo));
            expect(datainfo.name).assertEqual(LAUNCHER);
            expect(datainfo.vendor).assertEqual("ohos");
            expect(datainfo.versionCode).assertEqual(1000000);
            expect(datainfo.versionName.length).assertLarger(0);
            expect(datainfo.uid).assertLarger(2099);
            expect(datainfo.appInfo.name).assertEqual(LAUNCHER);
            expect(datainfo.appInfo.systemApp).assertEqual(true);
            expect(datainfo.appInfo.supportedModes).assertEqual(0);
            expect(datainfo.appInfo.moduleInfos.length).assertLarger(0);
            expect(datainfo.appInfo.enabled).assertEqual(true);
            done();
        }).catch(err => {
            console.info("getBundleInfo fail:" + JSON.stringify(err));
            expect(err).assertFail();
            done();
        })

    })

    /**
     * @tc.number getBundleInfo_1400
     * @tc.name BUNDLEMGR::getBundleInfo
     * @tc.desc Test getBundleInfo interface with current userId(by promise).
     */
    it('getBundleInfo_1400', 0, async function (done) {
        let bundleOptions = {
            userId: USERID
        };
        let dataInfo = await demo.getBundleInfo(NAME1, demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES, bundleOptions);
        for (const item in dataInfo) {
            const a = dataInfo[item];
            console.info(item + ":" + JSON.stringify(a));
        };
        console.info("getBundleInfo_1400 start --------");
        expect(dataInfo.name).assertEqual(NAME1);
        expect(dataInfo.vendor).assertEqual("example");
        expect(dataInfo.versionCode).assertEqual(VERSIONCODE1);
        expect(dataInfo.versionName).assertLarger(0);
        expect(dataInfo.entryModuleName).assertEqual("entry");
        expect(dataInfo.appInfo.name).assertEqual(NAME1);
        expect(dataInfo.appInfo.description).assertEqual(DESCRIPTION);
        expect(dataInfo.appInfo.descriptionId >= 0).assertTrue();
        expect(dataInfo.appInfo.icon).assertEqual("$media:icon");
        expect(dataInfo.appInfo.iconId >= 0).assertTrue();
        expect(dataInfo.appInfo.label).assertEqual("$string:app_name");
        expect(dataInfo.appInfo.labelId >= 0).assertTrue();
        expect(dataInfo.appInfo.systemApp).assertEqual(true);
        expect(dataInfo.appInfo.supportedModes).assertEqual(0);
        expect(dataInfo.updateTime).assertLarger(0);
        expect(dataInfo.reqPermissions.length).assertEqual(0);
        expect(dataInfo.reqPermissionDetails.length).assertEqual(0);
        expect(dataInfo.compatibleVersion).assertEqual(5);
        expect(dataInfo.targetVersion).assertEqual(5);
        expect(dataInfo.isCompressNativeLibs).assertEqual(false);
        for (let s = 0; s < dataInfo.hapModuleInfos; s++) {
            expect(dataInfo.moduleInfos[s].name).assertEqual("com.example.myapplication1");
            expect(dataInfo.moduleInfos[s].moduleName).assertEqual("entry");
        }
        expect(dataInfo.entryModuleName).assertEqual("entry");
        expect(dataInfo.isSilentInstallation.length).assertEqual(0);
        expect(dataInfo.minCompatibleVersionCode).assertEqual(0);
        expect(dataInfo.entryInstallationFree).assertEqual(false);
        for (let j = 0; j < dataInfo.appInfo.moduleInfos; j++) {
            expect(dataInfo.appInfo.moduleInfos[j].moduleName).assertEqual("entry");
            expect(dataInfo.appInfo.moduleInfos[j].moduleSourceDir).assertEqual(DIR1);
        }
        expect(dataInfo.appInfo.enabled).assertEqual(true);
        console.info("getBundleInfo_1400 end  --------");
        done();
    })

    /**
     * @tc.number getBundleInfo_1500
     * @tc.name BUNDLE::getBundleInfo
     * @tc.desc Test getBundleInfo interface with current userId(by callback).
     */
    it('getBundleInfo_1500', 0, async function (done) {
        let bundleOptions = {
            userId: USERID
        };
        demo.getBundleInfo(NAME1, demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES, bundleOptions, (err, dataInfo) => {
            expect(dataInfo.name).assertEqual(NAME1);
            expect(dataInfo.vendor).assertEqual("example");
            expect(dataInfo.versionCode).assertEqual(VERSIONCODE1);
            expect(dataInfo.versionName).assertLarger(0);
            expect(dataInfo.entryModuleName).assertEqual("entry");
            expect(dataInfo.appInfo.name).assertEqual(NAME1);
            expect(dataInfo.appInfo.description).assertEqual(DESCRIPTION);
            expect(dataInfo.appInfo.descriptionId >= 0).assertTrue();
            expect(dataInfo.appInfo.icon).assertEqual("$media:icon");
            expect(dataInfo.appInfo.iconId >= 0).assertTrue();
            expect(dataInfo.appInfo.label).assertEqual("$string:app_name");
            expect(dataInfo.appInfo.labelId >= 0).assertTrue();
            expect(dataInfo.appInfo.systemApp).assertEqual(true);
            expect(dataInfo.appInfo.supportedModes).assertEqual(0);
            expect(dataInfo.updateTime).assertLarger(0);
            expect(dataInfo.reqPermissions.length).assertEqual(0);
            expect(dataInfo.reqPermissionDetails.length).assertEqual(0);
            expect(dataInfo.compatibleVersion).assertEqual(5);
            expect(dataInfo.targetVersion).assertEqual(5);
            expect(dataInfo.isCompressNativeLibs).assertEqual(false);
            for (let s = 0; s < dataInfo.hapModuleInfos; s++) {
                expect(dataInfo.moduleInfos[s].name).assertEqual("com.example.myapplication1");
                expect(dataInfo.moduleInfos[s].moduleName).assertEqual("entry");
            }
            expect(dataInfo.entryModuleName).assertEqual("entry");
            expect(dataInfo.isSilentInstallation.length).assertEqual(0);
            expect(dataInfo.minCompatibleVersionCode).assertEqual(0);
            expect(dataInfo.entryInstallationFree).assertEqual(false);
            for (let j = 0; j < dataInfo.appInfo.moduleInfos; j++) {
                expect(dataInfo.appInfo.moduleInfos[j].moduleName).assertEqual("entry");
                expect(dataInfo.appInfo.moduleInfos[j].moduleSourceDir).assertEqual(DIR1);
            }
            done();
        });
    })

    /**
     * @tc.number getBundleInfo_1600
     * @tc.name BUNDLEMGR::getBundleInfo
     * @tc.desc Test getBundleInfo interface with other userId(by promise).
     */
    it('getBundleInfo_1600', 0, async function (done) {
        demo.getBundleInfo(NAME1, demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES, {
            userId: 1
        }).then(data => {
            expect().assertFail();
            done();
        }).catch(err => {
            expect(err).assertEqual(1);
            done();
        });
    })

    /**
     * @tc.number getBundleInfo_1700
     * @tc.name BUNDLE::getBundleInfo
     * @tc.desc Test getBundleInfo interface with other userId(by callback).
     */
    it('getBundleInfo_1700', 0, async function (done) {
        demo.getBundleInfo(NAME1, demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES, {
            userId: 1
        }, (err, dataInfo) => {
            expect(err).assertEqual(1);
            expect(dataInfo).assertEqual(undefined);
            done();
        });
    })

    /**
     * @tc.number queryAbilityByWant_1000
     * @tc.name BUNDLE::queryAbilityByWant
     * @tc.desc Test queryAbilityByWant interfaces with system hap.
     */
    it('queryAbilityByWant_1000', 0, async function (done) {
        demo.queryAbilityByWant(
            {
                bundleName: "wrong name",
                abilityName: "wrong name",
            }, 0, USERID, OnReceiveEvent);
        function OnReceiveEvent(err, datainfo) {
            expect(err).assertEqual(1);
            expect(datainfo.length).assertLarger(0);
            done();
        }
    })

    /**
    * @tc.number installErrCodeTest_0100
    * @tc.name InstallErrorCode::STATUS_FAILED_NO_SPACE_LEFT
    * @tc.desc Test install errcode STATUS_FAILED_NO_SPACE_LEFT.
    */
    it('installErrCodeTest_0100', 0, async function (done) {
        expect(demo.InstallErrorCode.STATUS_FAILED_NO_SPACE_LEFT).assertEqual(66);
        expect(demo.AbilitySubType.CA).assertEqual(1);
        done();
    })

    /**
    * @tc.number installErrCodeTest_0200
    * @tc.name InstallErrorCode::STATUS_FAILED_NO_SPACE_LEFT
    * @tc.desc Test install errcode STATUS_FAILED_NO_SPACE_LEFT.
    */
    it('installErrCodeTest_0200', 0, async function (done) {
        expect(demo.InstallErrorCode.STATUS_GRANT_REQUEST_PERMISSIONS_FAILED).assertEqual(67);
        done();
    })
})

