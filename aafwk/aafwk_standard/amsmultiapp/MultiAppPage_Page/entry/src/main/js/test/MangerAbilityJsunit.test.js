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
import featureAbility from '@ohos.ability.featureability'
import bundle from "@ohos.bundle"
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

const MIN_CLONEUID = 20000000;

describe('ActsAmsMultiAppPage', function () {
    console.info('----ActsAmsMultiAppPage----');

    /*
     * @tc.number    : AMS_MultiApp_0100
     * @tc.name      : startAbility : start pageAbility
     * @tc.desc      : pageAbility->pageAbility
     */
    it('AMS_MultiApp_0100', 0, async function (done) {
        var data = await featureAbility.getWant();
        expect(data.bundleName).assertEqual("com.example.actsamsmultiapppage");
        expect(data.abilityName).assertEqual("com.example.actsamsmultiapppage.MainAbility");
        console.info('AMS_MultiApp_0100 data.bundleName ' 
                + JSON.stringify(data.bundleName));
        console.info('AMS_MultiApp_0100 data.abilityName ' 
                + JSON.stringify(data.abilityName));

        var info = await featureAbility.getAbilityInfo();
        bundle.getBundleInfo("com.example.actsamsmultiapppage", 1, (err, data) => {
            console.debug("=AMS_MultiApp_0100 err,data=======>"
                    + ("json err【") + JSON.stringify(err) + (" 】")
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,err=" + err + " ,data=" + data);
            console.info('AMS_MultiApp Clone info.applicationInfo ' 
                    + JSON.stringify(info.applicationInfo));
            if (data.uid >= MIN_CLONEUID) {
                console.info('AMS_MultiApp_0100 Clone info.applicationInfo.isCloned ' 
                + JSON.stringify(info.applicationInfo.isCloned));
                console.debug("=======AMS_MultiApp_0100 Clone=======");
                expect(info.applicationInfo.isCloned).assertEqual(true);
                done(); 
            } else {
                console.info('AMS_MultiApp_0100 Clone info.applicationInfo.isCloned ' 
                + JSON.stringify(info.applicationInfo.isCloned));
                console.debug("=======AMS_MultiApp_0100 Ontology=======");
                expect(info.applicationInfo.isCloned).assertEqual(false);
                done(); 
            }
        }) 
    })
})
