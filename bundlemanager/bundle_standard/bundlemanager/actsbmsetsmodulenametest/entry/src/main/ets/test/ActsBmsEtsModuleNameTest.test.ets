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

import bundle from '@ohos.bundle'
import image from '@ohos.multimedia.image'
import account from '@ohos.account.osAccount'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index'

const ABILITY_NAME = 'com.example.bmsmodulename.MainAbility';
const BUNDLE_NAME = 'com.example.bmsmodulename';
const MODULE_NAME1 = '';
const MODULE_NAME2 = 'noModule';
const MODULE_NAME3 = 'entry';
const MODULE_NAME4 = undefined;
const DEFAULT_FLAG = bundle.BundleFlag.GET_BUNDLE_DEFAULT;
const SUCCESS_CODE = 0;
const INVALID_CODE = 1;
const INVALID_PARAM = 2;
const ABILITY_INFO_ONE = {
    bundleName: BUNDLE_NAME,
    moduleName: MODULE_NAME1,
    name: ABILITY_NAME
};
const ABILITY_INFO_TWO = {
    bundleName: BUNDLE_NAME,
    moduleName: MODULE_NAME2,
    name: ABILITY_NAME
};
const ABILITY_INFO_THREE = {
    bundleName: BUNDLE_NAME,
    moduleName: MODULE_NAME3,
    name: ABILITY_NAME
};
const ABILITY_INFO_FOUR = {
    bundleName: BUNDLE_NAME,
    moduleName: MODULE_NAME4,
    name: ABILITY_NAME
};
let userId = 0;

export default function actsBmsJsModuleNameTest() {

    describe('actsBmsJsModuleNameTest', function () {

        beforeAll(async function (done) {
            await account.getAccountManager().getOsAccountLocalIdFromProcess().then(account => {
                console.info("getOsAccountLocalIdFromProcess userid  ==========" + account);
                userId = account;
                done();
            }).catch(err => {
                console.info("getOsAccountLocalIdFromProcess err ==========" + JSON.stringify(err));
                done();
            })
        });

        /*
        * @tc.number: GetabilityInfo_0100
        * @tc.name: test getAbilityInfo
        * @tc.desc: test empty moduleName
        */
        it('GetabilityInfo_0100', 0, async function (done) {
            await bundle.getAbilityInfo(BUNDLE_NAME, MODULE_NAME1, ABILITY_NAME)
                .then(data => {
                    expect(data).assertFail();
                }).catch((err) => {
                    console.error('[GetabilityInfo_0100]Operation failed. Err: ' + JSON.stringify(err));
                    expect(err).assertEqual(INVALID_CODE);
                });
            bundle.getAbilityInfo(BUNDLE_NAME, MODULE_NAME1, ABILITY_NAME, (err, data) => {
                expect(err).assertEqual(INVALID_CODE);
                if (err) {
                    console.error('[GetabilityInfo_0100]Operation failed. Err: ' + JSON.stringify(err));
                }
                console.info("'[GetabilityInfo_0100]Return data: " + JSON.stringify(data));
                done();
            });
        });

        /*
        * @tc.number: GetabilityInfo_0200
        * @tc.name: test getAbilityInfo
        * @tc.desc: test non-existent moduleName
        */
        it('GetabilityInfo_0200', 0, async function (done) {
            await bundle.getAbilityInfo(BUNDLE_NAME, MODULE_NAME2, ABILITY_NAME)
                .then(data => {
                    expect(data).assertFail();
                }).catch((err) => {
                    console.error('[GetabilityInfo_0200]Operation failed. Err: ' + JSON.stringify(err));
                    expect(err).assertEqual(INVALID_CODE);
                });
            bundle.getAbilityInfo(BUNDLE_NAME, MODULE_NAME2, ABILITY_NAME, (err, data) => {
                expect(err).assertEqual(INVALID_CODE);
                if (err) {
                    console.error('[GetabilityInfo_0200]Operation failed. Err: ' + JSON.stringify(err));
                }
                console.info("'[GetabilityInfo_0200]Return data : " + JSON.stringify(data));
                done();
            });
        });

        /*
        * @tc.number: GetabilityInfo_0300
        * @tc.name: test getAbilityInfo
        * @tc.desc: test existent moduleName
        */
        it('GetabilityInfo_0300', 0, async function (done) {
            await bundle.getAbilityInfo(BUNDLE_NAME, MODULE_NAME3, ABILITY_NAME)
                .then(data => {
                    console.info('[GetabilityInfo_0300]Return data successful: ' + JSON.stringify(data));
                    checkDataInfo(data);
                }).catch((err) => {
                    console.error('[GetabilityInfo_0300]Operation . Err: ' + JSON.stringify(err));
                    expect(err).assertFail();
                });
            bundle.getAbilityInfo(BUNDLE_NAME, MODULE_NAME3, ABILITY_NAME, (err, data) => {
                checkDataInfo(data);
                expect(err).assertEqual(SUCCESS_CODE);
                if (err) {
                    console.error('[GetabilityInfo_0300]Operation failed. Err: ' + JSON.stringify(err));
                }
                console.info("'[GetabilityInfo_0300]Return data: " + JSON.stringify(data));
                done();
            });
        });

        /*
        * @tc.number: GetAbilityIcon_0100
        * @tc.name: test getAbilityIcon
        * @tc.desc: test empty moduleName
        */
        it('GetAbilityIcon_0100', 0, async function (done) {
            await bundle.getAbilityIcon(BUNDLE_NAME, MODULE_NAME1, ABILITY_NAME)
                .then(data => {
                    expect(data).assertFail();
                }).catch((err) => {
                    console.error('[GetAbilityIcon_0100]Operation failed. Err: ' + JSON.stringify(err));
                    expect(err).assertEqual(INVALID_CODE);
                });
            bundle.getAbilityIcon(BUNDLE_NAME, MODULE_NAME1, ABILITY_NAME, (err, data) => {
                expect(err).assertEqual(INVALID_CODE);
                if (err) {
                    console.error('[GetAbilityIcon_0100]Operation failed. Err: ' + JSON.stringify(err));
                }
                console.info("'[GetAbilityIcon_0100]Return data: " + JSON.stringify(data));
                done();
            });
        });

        /*
        * @tc.number: GetAbilityIcon_0200
        * @tc.name: test getAbilityIcon
        * @tc.desc: test non-existent moduleName
        */
        it('GetAbilityIcon_0200', 0, async function (done) {
            await bundle.getAbilityIcon(BUNDLE_NAME, MODULE_NAME2, ABILITY_NAME)
                .then(data => {
                    expect(data).assertFail();
                }).catch((err) => {
                    console.error('[GetAbilityIcon_0200]Operation successful. Err: ' + JSON.stringify(err));
                    expect(err).assertEqual(INVALID_CODE);
                });
            bundle.getAbilityIcon(BUNDLE_NAME, MODULE_NAME2, ABILITY_NAME, (err, data) => {
                expect(err).assertEqual(INVALID_CODE);
                if (err) {
                    console.error('[GetAbilityIcon_0200]Operation failed. Err: ' + JSON.stringify(err));
                }
                console.info("'[GetAbilityIcon_0200]Return data: " + JSON.stringify(data));
                done();
            });
        });

        /*
        * @tc.number: GetAbilityIcon_0300
        * @tc.name: test getAbilityIcon
        * @tc.desc: test existent moduleName
        */
        it('GetAbilityIcon_0300', 0, async function (done) {
            await bundle.getAbilityIcon(BUNDLE_NAME, MODULE_NAME3, ABILITY_NAME)
                .then(data => {
                    console.info('[GetAbilityIcon_0300]Return data successful: ' + JSON.stringify(data));
                    expect(data.getBytesNumberPerRow()).assertLarger(0);
                }).catch((err) => {
                    console.error('[GetAbilityIcon_0300]Operation failed. Err: ' + JSON.stringify(err));
                    expect(err).assertFail();
                });
            bundle.getAbilityIcon(BUNDLE_NAME, MODULE_NAME3, ABILITY_NAME, (err, data) => {
                expect(err).assertEqual(SUCCESS_CODE);
                expect(data.getBytesNumberPerRow()).assertLarger(0);
                if (err) {
                    console.error('[GetAbilityIcon_0300]Operation failed. Err: ' + JSON.stringify(err));
                }
                console.info("'[GetAbilityIcon_0300]Return data: " + JSON.stringify(data));
                done();
            });
        });

        /*
        * @tc.number: GetAbilityLabel_0100
        * @tc.name: test getAbilityLabel
        * @tc.desc: test empty moduleName
        */
        it('GetAbilityLabel_0100', 0, async function (done) {
            await bundle.getAbilityLabel(BUNDLE_NAME, MODULE_NAME1, ABILITY_NAME)
                .then(data => {
                    expect(data).assertFail();
                }).catch((err) => {
                    console.error('[GetAbilityLabel_0100]Operation failed. Err: ' + JSON.stringify(err));
                    expect(err).assertEqual(INVALID_CODE);
                });
            bundle.getAbilityLabel(BUNDLE_NAME, MODULE_NAME1, ABILITY_NAME, (err, data) => {
                expect(err).assertEqual(INVALID_CODE);
                if (err) {
                    console.error('[GetAbilityLabel_0100]Operation failed. Err: ' + JSON.stringify(err));
                }
                console.info("'[GetAbilityLabel_0100]Return data: " + JSON.stringify(data));
                done();
            });
        });

        /*
        * @tc.number: GetAbilityLabel_0200
        * @tc.name: test getAbilityLabel
        * @tc.desc: test non-existent moduleName
        */
        it('GetAbilityLabel_0200', 0, async function (done) {
            await bundle.getAbilityLabel(BUNDLE_NAME, MODULE_NAME2, ABILITY_NAME)
                .then(data => {
                    expect(data).assertFail();
                }).catch((err) => {
                    console.error('[GetAbilityLabel_0200]Operation . Err: ' + JSON.stringify(err));
                    expect(err).assertEqual(INVALID_CODE);
                });
            bundle.getAbilityLabel(BUNDLE_NAME, MODULE_NAME2, ABILITY_NAME, (err, data) => {
                expect(err).assertEqual(INVALID_CODE);
                if (err) {
                    console.error('[GetAbilityLabel_0200]Operation failed. Err: ' + JSON.stringify(err));
                }
                console.info("'[GetAbilityLabel_0200]Return data: " + JSON.stringify(data));
                done();
            });
        });

        /*
        * @tc.number: GetAbilityLabel_0300
        * @tc.name: test getAbilityLabel
        * @tc.desc: test existent moduleName
        */
        it('GetAbilityLabel_0300', 0, async function (done) {
            await bundle.getAbilityLabel(BUNDLE_NAME, MODULE_NAME3, ABILITY_NAME)
                .then(data => {
                    console.info('[GetAbilityLabel_0300]Return data successful: ' + JSON.stringify(data));
                    expect(data).assertEqual("bmsfirstright");
                }).catch((err) => {
                    console.error('[GetAbilityLabel_0300]Operation failed. Err: ' + JSON.stringify(err));
                    expect(err).assertFail();
                });
            bundle.getAbilityLabel(BUNDLE_NAME, MODULE_NAME3, ABILITY_NAME, (err, data) => {
                expect(err).assertNull();
                if (err) {
                    console.error('[GetAbilityLabel_0300]Operation failed. Err: ' + JSON.stringify(err));
                }
                expect(data).assertEqual("bmsfirstright");
                console.info("'[GetAbilityLabel_0300]Return data: " + JSON.stringify(data));
                done();
            });
        });

        /*
        * @tc.number: IsAbilityEnabled_0100
        * @tc.name: test isAbilityEnabled
        * @tc.desc: test empty moduleName
        */
        it('IsAbilityEnabled_0100', 0, async function (done) {
            let abilityInfo = generateAbilityInfoForTest(ABILITY_INFO_ONE.bundleName, ABILITY_INFO_ONE.name, ABILITY_INFO_ONE.moduleName);
            await bundle.isAbilityEnabled(abilityInfo)
                .then(data => {
                    console.info('[IsAbilityEnabled_0100]Return data successful: ' + JSON.stringify(data));
                    expect(data).assertTrue();
                }).catch((err) => {
                    console.error('[IsAbilityEnabled_0100]Operation failed. Err: ' + JSON.stringify(err));
                    expect(err).assertFail();
                });
            bundle.isAbilityEnabled(abilityInfo, (err, data) => {
                expect(err).assertEqual(SUCCESS_CODE);
                if (err) {
                    console.error('[IsAbilityEnabled_0100]Operation failed. Err: ' + JSON.stringify(err));
                }
                expect(data).assertTrue();
                console.info("'[IsAbilityEnabled_0100]Return data: " + JSON.stringify(data));
                done();
            });
        });

        /*
        * @tc.number: IsAbilityEnabled_0200
        * @tc.name: test isAbilityEnabled
        * @tc.desc: test non-existent moduleName
        */
        it('IsAbilityEnabled_0200', 0, async function (done) {
            let abilityInfo = generateAbilityInfoForTest(ABILITY_INFO_TWO.bundleName, ABILITY_INFO_TWO.name, ABILITY_INFO_TWO.moduleName);
            await bundle.isAbilityEnabled(abilityInfo)
                .then(data => {
                    expect(data).assertEqual(false);
                }).catch((err) => {
                    console.error('[IsAbilityEnabled_0200]Operation failed. Err: ' + JSON.stringify(err));
                    expect(err).assertFail();
                });
            bundle.isAbilityEnabled(abilityInfo, (err, data) => {
                expect(data).assertEqual(false);
                if (err) {
                    console.error('[IsAbilityEnabled_0200]Operation failed. Err: ' + JSON.stringify(err));
                }
                expect(err).assertEqual(SUCCESS_CODE);
                console.info("'[IsAbilityEnabled_0200]Return data: " + JSON.stringify(data));
                done();
            });
        });

        /*
        * @tc.number: IsAbilityEnabled_0300
        * @tc.name: test isAbilityEnabled
        * @tc.desc: test existent moduleName
        */
        it('IsAbilityEnabled_0300', 0, async function (done) {
            let abilityInfo = generateAbilityInfoForTest(ABILITY_INFO_THREE.bundleName, ABILITY_INFO_THREE.name, ABILITY_INFO_THREE.moduleName);
            await bundle.isAbilityEnabled(abilityInfo)
                .then(data => {
                    console.info('[IsAbilityEnabled_0300]Return data successful: ' + JSON.stringify(data));
                    expect(data).assertTrue();
                }).catch((err) => {
                    console.error('[IsAbilityEnabled_0300]Operation failed. Err: ' + JSON.stringify(err));
                    expect(err).assertFail();
                });
            bundle.isAbilityEnabled(abilityInfo, (err, data) => {
                expect(err).assertEqual(SUCCESS_CODE);
                if (err) {
                    console.error('[IsAbilityEnabled_0300]Operation failed. Err: ' + JSON.stringify(err));
                }
                expect(data).assertTrue();
                console.info("'[IsAbilityEnabled_0300]Return data: " + JSON.stringify(data));
                done();
            });
        });

        /*
        * @tc.number: IsAbilityEnabled_0400
        * @tc.name: test isAbilityEnabled
        * @tc.desc: test empty moduleName
        */
        it('IsAbilityEnabled_0400', 0, async function (done) {
            let abilityInfo = generateAbilityInfoForTest(ABILITY_INFO_FOUR.bundleName, ABILITY_INFO_FOUR.name, ABILITY_INFO_FOUR.moduleName);
            await bundle.isAbilityEnabled(abilityInfo)
                .then(data => {
                    expect(data).assertFail();
                }).catch((err) => {
                    console.error('[IsAbilityEnabled_0400]Operation failed. Err: ' + JSON.stringify(err));
                    expect(err).assertEqual(INVALID_PARAM);
                });
            bundle.isAbilityEnabled(abilityInfo, (err, data) => {
                expect(data).assertEqual(undefined);
                if (err) {
                    console.error('[IsAbilityEnabled_0400]Operation failed. Err: ' + JSON.stringify(err));
                }
                expect(err).assertEqual(INVALID_PARAM);
                console.info("'[IsAbilityEnabled_0400]Return data: " + JSON.stringify(data));
                done();
            });
        });

        /*
        * @tc.number: QueryAbilityByWant_0100
        * @tc.name: test queryAbilityByWant
        * @tc.desc: test empty moduleName
        */
        it('QueryAbilityByWant_0100', 0, async function (done) {
            await bundle.queryAbilityByWant({
                bundleName: BUNDLE_NAME,
                abilityName: ABILITY_NAME,
                moduleName: MODULE_NAME1
            }, DEFAULT_FLAG, userId).then(data => {
                checkDataInfo(data[0]);
                console.info("'[QueryAbilityByWant_0100]Return data : " + JSON.stringify(data));
            }).catch(err => {
                console.info("[QueryAbilityByWant_0100]Operation failed. Err: " + JSON.stringify(err));
                expect(err).assertFail();
            });
            bundle.queryAbilityByWant({
                bundleName: BUNDLE_NAME,
                abilityName: ABILITY_NAME,
                moduleName: MODULE_NAME1
            }, DEFAULT_FLAG, userId, (err, data) => {
                expect(err).assertEqual(SUCCESS_CODE);
                if (err) {
                    console.error('[QueryAbilityByWant_0100]Operation failed. Err: ' + JSON.stringify(err));
                }
                checkDataInfo(data[0]);
                console.info("'[QueryAbilityByWant_0100]Return data : " + JSON.stringify(data));
                done();
            });
        });

        /*
        * @tc.number: QueryAbilityByWant_0200
        * @tc.name: test queryAbilityByWant
        * @tc.desc: test non-existent moduleName
        */
        it('QueryAbilityByWant_0200', 0, async function (done) {
            await bundle.queryAbilityByWant({
                bundleName: BUNDLE_NAME,
                abilityName: ABILITY_NAME,
                moduleName: MODULE_NAME2
            }, DEFAULT_FLAG, userId).then(data => {
                expect(data).assertFail();
            }).catch(err => {
                console.error('[QueryAbilityByWant_0200]Operation failed. Err: ' + JSON.stringify(err));
                expect(err).assertEqual(INVALID_CODE);
            });
            bundle.queryAbilityByWant({
                bundleName: BUNDLE_NAME,
                abilityName: ABILITY_NAME,
                moduleName: MODULE_NAME2
            }, DEFAULT_FLAG, userId, (err, data) => {
                console.info("'[QueryAbilityByWant_0200]Return data " + JSON.stringify(data));
                expect(data).assertEqual("QueryAbilityInfos failed");
                console.error('[QueryAbilityByWant_0200]Operation failed. Err: ' + JSON.stringify(err));
                expect(err).assertEqual(INVALID_CODE);
                done();
            });
        });

        /*
        * @tc.number: QueryAbilityByWant_0300
        * @tc.name: test queryAbilityByWant
        * @tc.desc: test existent moduleName
        */
        it('QueryAbilityByWant_0300', 0, async function (done) {
            await bundle.queryAbilityByWant({
                bundleName: BUNDLE_NAME,
                abilityName: ABILITY_NAME,
                moduleName: MODULE_NAME3
            }, DEFAULT_FLAG, userId).then(data => {
                checkDataInfo(data[0]);
                console.info("'[QueryAbilityByWant_0300]Return data : " + JSON.stringify(data));
            }).catch(err => {
                console.info("[QueryAbilityByWant_0300]Operation failed. Err: " + JSON.stringify(err));
                expect(err).assertFail();
            });
            bundle.queryAbilityByWant({
                bundleName: BUNDLE_NAME,
                abilityName: ABILITY_NAME,
                moduleName: MODULE_NAME3
            }, DEFAULT_FLAG, userId, (err, data) => {
                expect(err).assertEqual(SUCCESS_CODE);
                if (err) {
                    console.error('[QueryAbilityByWant_0300]Operation failed. Err: ' + JSON.stringify(err));
                }
                checkDataInfo(data[0]);
                console.info("'[QueryAbilityByWant_0300]Return data : " + JSON.stringify(data));
                done();
            });
        });

        function checkDataInfo(data) {
            expect(typeof (data.bundleName)).assertEqual("string");
            expect(data.bundleName).assertEqual("com.example.bmsmodulename");
            expect(typeof (data.name)).assertEqual("string");
            expect(data.name).assertEqual("com.example.bmsmodulename.MainAbility");
            expect(data.label).assertEqual("$string:app_name");
            expect(typeof (data.label)).assertEqual("string");
            expect(data.description).assertEqual("$string:mainability_description");
            expect(typeof (data.description)).assertEqual("string");
            expect(data.icon).assertEqual("$media:icon");
            expect(typeof (data.icon)).assertEqual("string");
            expect(data.isVisible).assertEqual(false);
            expect(data.deviceTypes[0]).assertEqual("phone");
            expect(typeof (data.process)).assertEqual("string");
            expect(data.process).assertEqual("com.example.bmsmodulename");
            expect(typeof (data.uri)).assertEqual("string");
            expect(data.uri).assertEqual("");
            expect(data.moduleName).assertEqual("entry");
            expect(typeof (data.moduleName)).assertEqual("string");
            expect(typeof (data.applicationInfo)).assertEqual("object");
            let info = data.applicationInfo;
            expect(typeof (info)).assertEqual("object");
            expect(typeof (info.name)).assertEqual("string");
            expect(info.name).assertEqual("com.example.bmsmodulename");
            expect(typeof (info.codePath)).assertEqual("string");
            expect(info.codePath).assertEqual("/data/app/el1/bundle/public/com.example.bmsmodulename");
            expect(typeof (info.accessTokenId)).assertEqual("number");
            expect(info.accessTokenId > 0).assertTrue();
            expect(typeof (info.description)).assertEqual("string");
            expect(info.description).assertEqual("");
            expect(typeof (info.descriptionId)).assertEqual("number");
            expect(info.descriptionId).assertEqual(0);
            expect(typeof (info.icon)).assertEqual("string");
            expect(info.icon).assertEqual("$media:icon");
            expect(typeof (info.iconId)).assertEqual("number");
            expect(info.iconId > 0).assertTrue();
            expect(typeof (info.label)).assertEqual("string");
            expect(info.label).assertEqual("$string:app_name");
            expect(typeof (info.labelId)).assertEqual("number");
            expect(info.labelId > 0).assertTrue();
            expect(info.systemApp).assertEqual(true);
            expect(typeof (info.entryDir)).assertEqual("string");
            expect(info.entryDir).assertEqual("/data/app/el1/bundle/public/com.example.bmsmodulename/com.example.bmsmodulenamedentry");
            expect(typeof (info.process)).assertEqual("string");
            expect(info.process).assertEqual("com.example.bmsmodulename");
            expect(Array.isArray(info.permissions)).assertEqual(true);
            console.log("---checkDataInfo End---  ");
        }

        function generateAbilityInfoForTest(bundleName, name, moduleName) {
            let map1 = new Map([
                ["", [{
                    "name": "", "value": "", "extra": ""
                }]]
            ]);
            let map2 = new Map([
                ["", [{
                    "name": "", "value": "", "resource": ""
                }]]
            ]);
            let resource = {
                "bundleName": "", "moduleName": "", "id": 0
            }
            let abilityInfo = {
                bundleName: bundleName,
                name: name,
                label: "",
                description: "",
                icon: "",
                labelId: 0,
                descriptionId: 0,
                iconId: 0,
                moduleName: moduleName,
                process: "",
                targetAbility: "",
                backgroundModes: 0,
                isVisible: true,
                formEnabled: true,
                type: 0,
                subType: 0,
                orientation: 0,
                launchMode: 0,
                permissions: [], deviceTypes: [], deviceCapabilities: [], readPermission: "", writePermission: "",
                applicationInfo: {
                    name: "", description: "", descriptionId: 0, systemApp: true, enabled: true, label: "",
                    labelId: "", icon: "", iconId: "", process: "", supportedModes: 0, moduleSourceDirs: [],
                    permissions: [], moduleInfos: [], entryDir: "", codePath: "", metaData: map1, metadata: map2,
                    removable: true, accessTokenId: 0, uid: 0, entityType: "", fingerprint: "",
                    iconResource: resource, labelResource: resource, descriptionResource: resource,
                    appDistributionType :"" ,appProvisionType :""
                },
                uri: "", metaData: [], metadata: [], enabled: true, supportWindowMode: [],
                maxWindowRatio: 0, minWindowRatio: 0, maxWindowWidth: 0, minWindowWidth: 0, maxWindowHeight: 0, minWindowHeight: 0
            };
            return abilityInfo;
        }

    });
}
