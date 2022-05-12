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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

const ABILITY_NAME = 'com.example.bmsmodulename.MainAbility';
const BUNDLE_NAME = 'com.example.bmsmodulename';
const MODULE_NAME1 = '';
const MODULE_NAME2 = 'noModule';
const MODULE_NAME3 = 'entry';
const DEFAULT_FLAG = bundle.BundleFlag.GET_BUNDLE_DEFAULT;
const DEFAULT_USER_ID = 100;
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

export default function actsBmsJsModuleNameTest() {
    describe('actsBmsJsModuleNameTest', function () {

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
                        image = data;
                        expect(image.getBytesNumberPerRow()).assertLarger(0);
                    }).catch((err) => {
                        console.error('[GetAbilityIcon_0300]Operation failed. Err: ' + JSON.stringify(err));
                        expect(err).assertFail();
                    });
                bundle.getAbilityIcon(BUNDLE_NAME, MODULE_NAME3, ABILITY_NAME, (err, data) => {
                    expect(err).assertEqual(SUCCESS_CODE);
                    expect(image.getBytesNumberPerRow()).assertLarger(0);
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
                    expect(err).assertEqual(SUCCESS_CODE);
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
            await bundle.isAbilityEnabled(ABILITY_INFO_ONE)
                .then(data => {
                    expect(data).assertFail();
                }).catch((err) => {
                    console.error('[IsAbilityEnabled_0100]Operation failed. Err: ' + JSON.stringify(err));
                    expect(err).assertEqual(INVALID_PARAM);
                });
            bundle.isAbilityEnabled(ABILITY_INFO_ONE, (err, data) => {
                expect(data).assertEqual(undefined);
                if (err) {
                    console.error('[IsAbilityEnabled_0100]Operation failed. Err: ' + JSON.stringify(err));
                }
                expect(err).assertEqual(INVALID_PARAM);
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
                await bundle.isAbilityEnabled(ABILITY_INFO_TWO)
                    .then(data => {
                        expect(data).assertEqual(false);
                    }).catch((err) => {
                        console.error('[IsAbilityEnabled_0200]Operation failed. Err: ' + JSON.stringify(err));
                        expect(err).assertFail();
                    });
                bundle.isAbilityEnabled(ABILITY_INFO_TWO, (err, data) => {
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
                await bundle.isAbilityEnabled(ABILITY_INFO_THREE)
                    .then(data => {
                        console.info('[IsAbilityEnabled_0300]Return data successful: ' + JSON.stringify(data));
                        expect(data).assertTrue();
                    }).catch((err) => {
                        console.error('[IsAbilityEnabled_0300]Operation failed. Err: ' + JSON.stringify(err));
                        expect(err).assertEqual(SUCCESS_CODE);
                    });
                bundle.isAbilityEnabled(ABILITY_INFO_THREE, (err, data) => {
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
        * @tc.number: QueryAbilityByWant_0100
        * @tc.name: test queryAbilityByWant
        * @tc.desc: test empty moduleName
        */
        it('QueryAbilityByWant_0100', 0, async function (done) {
            await bundle.queryAbilityByWant({
                bundleName: BUNDLE_NAME,
                abilityName: ABILITY_NAME,
                moduleName: MODULE_NAME1
            }, DEFAULT_FLAG, DEFAULT_USER_ID).then(data => {
                expect(data).assertFail();
            }).catch(err => {
                console.error('[QueryAbilityByWant_0100]Operation failed. Err: ' + JSON.stringify(err));
                expect(err).assertEqual(INVALID_CODE);
            });
            bundle.queryAbilityByWant({
                bundleName: BUNDLE_NAME,
                abilityName: ABILITY_NAME,
                moduleName: MODULE_NAME1
            }, DEFAULT_FLAG, DEFAULT_USER_ID, (err, data) => {
                console.info("'[QueryAbilityByWant_0100]Return data " + JSON.stringify(data));
                expect(data).assertEqual("type mismatch");
                console.error('[QueryAbilityByWant_0100]Operation failed. Err: ' + JSON.stringify(err));
                expect(err).assertEqual(INVALID_CODE);
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
                }, DEFAULT_FLAG, DEFAULT_USER_ID).then(data => {
                    expect(data).assertFail();
                }).catch(err => {
                    console.error('[QueryAbilityByWant_0200]Operation failed. Err: ' + JSON.stringify(err));
                    expect(err).assertEqual(INVALID_CODE);
                });
                bundle.queryAbilityByWant({
                    bundleName: BUNDLE_NAME,
                    abilityName: ABILITY_NAME,
                    moduleName: MODULE_NAME2
                }, DEFAULT_FLAG, DEFAULT_USER_ID, (err, data) => {
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
                }, DEFAULT_FLAG, DEFAULT_USER_ID).then(data => {
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
                }, DEFAULT_FLAG, DEFAULT_USER_ID, (err, data) => {
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
                expect(data.srcPath).assertEqual("");
                expect(typeof (data.srcPath)).assertEqual("string");
                expect(data.srcLanguage).assertEqual("js");
                expect(typeof (data.srcLanguage)).assertEqual("string");
                expect(data.isVisible).assertEqual(false);
                expect(data.deviceTypes[0]).assertEqual("phone");
                expect(typeof (data.process)).assertEqual("string");
                expect(data.process).assertEqual("");
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
                expect(info.description).assertEqual("$string:mainability_description");
                expect(typeof (info.descriptionId)).assertEqual("number");
                expect(info.descriptionId > 0).assertTrue();
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
                expect(info.process).assertEqual("");
                expect(Array.isArray(info.permissions)).assertEqual(true);
                console.log("---checkDataInfo End---  ");
            }
    });
}
