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
const SYSTEM_NAME = 'com.example.system2';
const ABILITIY_NAME8 = 'com.example.system2.MainAbility';
const USERID = 100;

describe('ActsBmsQueryAbilityByWant', function () {

    /*
    * @tc.number: bms_queryAbilityByWant_0100
    * @tc.name:  queryAbilityByWant callback by other callback
    * @tc.desc: 1.queryAbilityByWant callback
    *           2.queryAbilityByWant for third app
    */
    it('bms_queryAbilityByWant_0100', 0, async function (done) {
        await bundle.queryAbilityByWant({
            action: ['action.system.home'],
            entities: ['entity.system.home'],
            bundleName: BUNDLE_NAME1
        }, bundle.BundleFlag.GET_ABILITY_INFO_WITH_APPLICATION | bundle.BundleFlag.GET_ABILITY_INFO_SYSTEMAPP_ONLY,
            USERID).then(data => {
                expect(data).assertFail();
            }).catch(err => {
                expect(err).assertEqual(1);
            });
        bundle.queryAbilityByWant({
            action: ['action.system.home'],
            entities: ['entity.system.home'],
            bundleName: BUNDLE_NAME1
        }, bundle.BundleFlag.GET_ABILITY_INFO_WITH_APPLICATION | bundle.BundleFlag.GET_ABILITY_INFO_SYSTEMAPP_ONLY,
            USERID, (err, data) => {
                expect(err).assertEqual(1);
                expect(data).assertEqual("QueryAbilityInfos failed");
                done();
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
                expect(data.length).assertLarger(0);
                for (let i = 0; i < data.length; ++i) {
                    expect(data[i].applicationInfo.systemApp).assertEqual(true);
                }
            }
            ).catch(err => {
                expect(err).assertFail();
            });
        bundle.queryAbilityByWant(
            {
                action: ['action.system.home'],
                entities: ['entity.system.home']
            },
            bundle.BundleFlag.GET_ABILITY_INFO_WITH_APPLICATION | bundle.BundleFlag.GET_ABILITY_INFO_SYSTEMAPP_ONLY,
            USERID, (err, data) => {
                if (err) {
                    expect(err).assertFail();
                }
                expect(data.length).assertLarger(0);
                for (let i = 0; i < data.length; ++i) {
                    expect(data[i].applicationInfo.systemApp).assertEqual(true);
                }
                done();
            });
    });

    /*
    * @tc.number: bms_queryAbilityByEntities_0300
    * @tc.name: Use the implicit query method in queryAbilityByWant to get abilityInfos 
    * @tc.desc: The entities in the parameter want pass in the new field, and use the implicit query to get abilitInfos
    */
    it('bms_queryAbilityByEntities_0300', 0, async function (done) {
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
        expect(dataInfos.length).assertEqual(1);
        cheackAbilityInfos(dataInfos[0]);
        bundle.queryAbilityByWant({
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
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, USERID, (err, data) => {
            expect(data.length).assertEqual(1);
            cheackAbilityInfos(data[0]);
            done();
        });
    });

    async function cheackAbilityInfos(data) {
        expect(data.name).assertEqual(ABILITIY_NAME8);
        expect(data.label).assertEqual('$string:app_name');
        expect(data.description).assertEqual('$string:mainability_description');
        expect(data.icon).assertEqual("$media:icon");
        expect(data.srcPath).assertEqual("");
        expect(data.srcLanguage).assertEqual("js");
        expect(data.isVisible).assertEqual(false);
        expect(data.permissions.length).assertEqual(0);
        expect(data.deviceCapabilities.length).assertEqual(0);
        expect(data.deviceTypes[0]).assertEqual('phone');
        expect(data.process).assertEqual('');
        expect(data.uri).assertEqual('');
        expect(data.bundleName).assertEqual(SYSTEM_NAME);
        expect(data.moduleName).assertEqual("entry");
        expect(Object.keys(data.applicationInfo).length).assertLarger(0);
        expect(data.type).assertEqual(1);
        expect(data.orientation).assertEqual(0);
        expect(data.launchMode).assertEqual(1);
        expect(data.backgroundModes).assertEqual(0);
        expect(data.descriptionId).assertLarger(0);
        expect(data.formEnabled).assertEqual(false);
        expect(data.iconId).assertLarger(0);
        expect(data.labelId).assertLarger(0);
        expect(data.subType).assertEqual(0);
        expect(data.readPermission).assertEqual("");
        expect(data.writePermission).assertEqual("");
        expect(data.targetAbility).assertEqual("");
        expect(data.theme).assertEqual("");
        expect(data.metaData.length).assertEqual(0);
        expect(data.metadata.length).assertEqual(0);
        expect(data.enabled).assertEqual(true);
    }

})