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

import { describe, beforeAll, it, expect } from '@ohos/hypium'
import demo from '@ohos.bundle'
import account from '@ohos.account.osAccount'
import featureAbility from '@ohos.ability.featureAbility'

let userId = 0;

export default function ActsBundleManagerTest() {
describe('GetSecondModuleTest', function () {

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

    /**
     * @tc.number GetSecondModuleTest_0100
     * @tc.name GetSecondModuleTest
     * @tc.desc Test whether the secondary module (BundleInfo / ReqPermissionDetail / UsedScene / HapModuleInfo 
     *          ApplicationInfo / ModuleInfo) can be exported by the primary module
     */
    it('GetSecondModuleTest', 0, async function (done) {
        let bundleInfo = await demo.getBundleInfo("com.example.myapplication1",
            demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES | demo.BundleFlag.GET_BUNDLE_WITH_REQUESTED_PERMISSION);
        let bundleInfoTest : demo.BundleInfo = bundleInfo;
        expect(typeof(bundleInfoTest.name)).assertEqual('string');
        let reqPermissionDetailTest : demo.ReqPermissionDetail = bundleInfo.reqPermissionDetails[0];
        expect(typeof(reqPermissionDetailTest.name)).assertEqual('string');
        let usedSceneTest : demo.UsedScene = bundleInfo.reqPermissionDetails[0].usedScene;
        expect(typeof(usedSceneTest.when)).assertEqual('string');
        let hapModuleInfoTest : demo.HapModuleInfo = bundleInfo.hapModuleInfos[0];
        expect(typeof(hapModuleInfoTest.name)).assertEqual('string');
        let applicationInfoTest : demo.ApplicationInfo = bundleInfo.appInfo;
        expect(typeof (applicationInfoTest.name)).assertEqual('string');
        let moduleInfoTest : demo.ModuleInfo = bundleInfo.appInfo.moduleInfos[0];
        expect(typeof (moduleInfoTest.moduleName)).assertEqual('string');

        let abilityInfo = await demo.queryAbilityByWant({
            "bundleName": "com.example.myapplication1",
            "abilityName": "com.example.myapplication1.MainAbility"
        }, demo.BundleFlag.GET_ABILITY_INFO_WITH_APPLICATION | demo.BundleFlag.GET_ABILITY_INFO_WITH_PERMISSION |
        demo.BundleFlag.GET_ABILITY_INFO_WITH_METADATA, userId);
        let abilityInfoTest : demo.AbilityInfo = abilityInfo[0];
        expect(typeof(abilityInfoTest.name)).assertEqual('string');
        let customizeDataTest : demo.CustomizeData = abilityInfo[0].metaData[0];
        expect(typeof(customizeDataTest.name)).assertEqual('string');

        let extensionAbilityInfos = await demo.queryExtensionAbilityInfos({
            "bundleName": "ohos.acts.bundle.stage",
            "abilityName": "ExtensionAbility1"
        }, demo.ExtensionAbilityType.FORM, demo.ExtensionFlag.GET_EXTENSION_INFO_WITH_METADATA);
        let extensionAbilityInfoTest : demo.ExtensionAbilityInfo = extensionAbilityInfos[0];
        expect(typeof(extensionAbilityInfoTest.bundleName)).assertEqual('string');
        let metadataTest : demo.Metadata = extensionAbilityInfos[0].metadata[0];
        expect(typeof(metadataTest.name)).assertEqual('string');

        let context = featureAbility.getContext();
        let elementNameInfo = await context.getElementName();
        let elementNameTest : demo.ElementName = elementNameInfo;
        expect(typeof (elementNameTest.bundleName)).assertEqual("string");

        done();
    })
})

}
