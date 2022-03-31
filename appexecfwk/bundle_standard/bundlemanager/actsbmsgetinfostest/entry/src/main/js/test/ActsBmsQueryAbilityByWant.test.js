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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit'

const BUNDLE_NAME1 = 'com.example.third1';
const BUNDLE_PATH1 = ['/data/test/bmsThirdBundleTest1.hap'];
const SYSTEM_PATH = '/data/test/bmsSystemBundleTest2.hap';
const SYSTEM_NAME = 'com.example.system2';
const ABILITIY_NAME8 = 'com.example.system2.MainAbility';
const USERID = 100;
let installParam = {
    userId: 100,
    installFlag: 1,
    isKeepData: false
};

describe('ActsBmsQueryAbilityByWant', function () {

    /*
    * @tc.number: bms_queryAbilityByWant_0100
    * @tc.name:  queryAbilityByWant callback by other callback
    * @tc.desc: 1.queryAbilityByWant callback
    *           2.queryAbilityByWant for third app
    */
    it('bms_queryAbilityByWant_0100', 0, async function (done) {
        await bundle.getBundleInstaller().then(installer => {
            installer.install(BUNDLE_PATH1, installParam, onReceiveinstallEvent);
            function onReceiveinstallEvent(err, data) {
                checkInstallOrUninstall(err, data);
                bundle.queryAbilityByWant({
                    action: ['action.system.home'],
                    entities: ['entity.system.home'],
                    bundleName: BUNDLE_NAME1
                }, bundle.BundleFlag.GET_ABILITY_INFO_WITH_APPLICATION | bundle.BundleFlag.GET_ABILITY_INFO_SYSTEMAPP_ONLY,
                    USERID, (err, data) => {
                        if (err) {
                            expect(err).assertEqual(1);
                        }
                        installer.uninstall(BUNDLE_NAME1, installParam, (err, data) => {
                            checkInstallOrUninstall(err, data);
                            done();
                        });
                    });
            }
        });
    });

    /*
    * @tc.number: bms_queryAbilityByWant_0200
    * @tc.name:  queryAbilityByWant callback by other callback
    * @tc.desc: 1.queryAbilityByWant callback
    *           2.queryAbilityByWant for systemapp
    */
    it('bms_queryAbilityByWant_0200', 0, async function (done) {
        await bundle.queryAbilityByWant(
            {
                action: ['action.system.home'],
                entities: ['entity.system.home']
            },
            bundle.BundleFlag.GET_ABILITY_INFO_WITH_APPLICATION | bundle.BundleFlag.GET_ABILITY_INFO_SYSTEMAPP_ONLY,
            USERID).then(data => {
                for (let i = 0; i < data.length; ++i) {
                    expect(data[i].applicationInfo.systemApp).assertEqual(true);
                }
                done();
            }
            ).catch(err => {
                expect(err).assertFail();
                done();
            });
    });

    /*
    * @tc.number: bms_queryAbilityByEntities_0300
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos 
    * @tc.desc: The entities in the parameter want pass in the new field, and use the implicit query to get abilitInfos
    */
    it('bms_queryAbilityByEntities_0300', 0, async function (done) {
        let installer = await bundle.getBundleInstaller();
        installer.install([SYSTEM_PATH], installParam, async (err, data) => {
            checkInstallOrUninstall(err, data);
            let dataInfos = await bundle.queryAbilityByWant({
                action: 'action.system.home',
                entities: ["entity.app.music",
                    "entity.app.email",
                    "entity.app.contacts",
                    "entity.app.maps",
                    "entity.app.browser",
                    "entity.app.calendar",
                    "entity.app.messaging",
                    "entity.app.files",
                    "entity.app.gallery"],
                elementName: {
                    deviceId: '0',
                    bundleName: '',
                    abilityName: '',
                },
            }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, USERID);
            for(let i = 0; i < dataInfos.length ; i ++){
                console.info ('dataInfos============='+ i);
                for (const item in dataInfos[0]) {
                    const a = dataInfos[0][item];
                    console.info(item+":"+ JSON.stringify(a));
                };
            };
            expect(dataInfos.length).assertEqual(1);
            expect(dataInfos[0].name).assertEqual(ABILITIY_NAME8);
            expect(dataInfos[0].label).assertEqual('$string:app_name');
            expect(dataInfos[0].description).assertEqual('$string:mainability_description');
            expect(dataInfos[0].icon).assertEqual("$media:icon");
            expect(dataInfos[0].srcPath).assertEqual("");
            expect(dataInfos[0].srcLanguage).assertEqual("js");
            expect(dataInfos[0].isVisible).assertEqual(false);
            expect(dataInfos[0].permissions.length).assertEqual(0);
            expect(dataInfos[0].deviceCapabilities.length).assertEqual(0);
            expect(dataInfos[0].deviceTypes[0]).assertEqual('phone');
            expect(dataInfos[0].process).assertEqual('');
            expect(dataInfos[0].uri).assertEqual('');
            expect(dataInfos[0].bundleName).assertEqual(SYSTEM_NAME);
            expect(dataInfos[0].moduleName).assertEqual("entry");
            expect(Object.keys(dataInfos[0].applicationInfo).length).assertLarger(0);
            expect(dataInfos[0].type).assertEqual(1);
            expect(dataInfos[0].orientation).assertEqual(0);
            expect(dataInfos[0].launchMode).assertEqual(1);
            expect(dataInfos[0].backgroundModes).assertEqual(0);
            expect(dataInfos[0].descriptionId).assertLarger(0);
            expect(dataInfos[0].formEnabled).assertEqual(false);
            expect(dataInfos[0].iconId).assertLarger(0);
            expect(dataInfos[0].labelId).assertLarger(0);
            expect(dataInfos[0].subType).assertEqual(0);
            expect(dataInfos[0].readPermission).assertEqual("");
            expect(dataInfos[0].writePermission).assertEqual("");
            expect(dataInfos[0].targetAbility).assertEqual("");
            expect(dataInfos[0].theme).assertEqual("");
            expect(dataInfos[0].metaData.length).assertEqual(0);
            expect(dataInfos[0].metadata.length).assertEqual(0);
            expect(dataInfos[0].enabled).assertEqual(true);
            installer.uninstall(SYSTEM_NAME, installParam, (err, data) => {
                checkInstallOrUninstall(err, data);
                done();
            });
        });
    });

    function checkInstallOrUninstall(err, data) {
        expect(err.code).assertEqual(0);
        expect(data.status).assertEqual(0);
        expect(data.statusMessage).assertEqual('SUCCESS');
    }
})