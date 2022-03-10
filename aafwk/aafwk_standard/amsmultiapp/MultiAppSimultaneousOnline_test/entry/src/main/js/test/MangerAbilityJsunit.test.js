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
import featureAbility from '@ohos.ability.featureAbility'
import commonEvent from '@ohos.commonEvent'
import bundle from "@ohos.bundle"
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

const MIN_CLONEUID = 20000000;

describe('ActsAmsMultiAppPageClone', function () {
    console.info('----ActsAmsMultiAppPageClone----');

    /*
     * @tc.number    : AMS_MultiApp_Simultaneous_Online_0100
     * @tc.name      : startAbility : start pageAbility
     * @tc.desc      : Ontology application and clone application are online at the same time 
     */
    it('AMS_MultiApp_Simultaneous_Online_0100', 0, async function (done) {
        function PublishCallBackOne(err) {
            console.debug("====>Publish CallBack ACTS_StartAbility_CommonEvent Ontology ====>"+err);
            done();
        }
        function PublishCallBackTwo(err) {
            console.debug("====>Publish CallBack ACTS_StartAbility_CommonEvent Clone ====>"+err);
            done();
        }
    
        var data = await featureAbility.getWant();
        expect(data.bundleName).assertEqual("com.example.actsamsmultiapppageclone");
        expect(data.abilityName).assertEqual("com.example.actsamsmultiapppageclone.MainAbility");
        var info = await featureAbility.getAbilityInfo();
        bundle.getBundleInfo("com.example.actsamsmultiapppageclone", 1, (err, data) => {
            console.info('AMS_MultiApp_Simultaneous_Online_0100 data.uid ' 
                + JSON.stringify(data.uid));
            if (data.uid >= MIN_CLONEUID) {
                console.info('AMS_MultiApp_Simultaneous_Online_0100 Clone info ' 
                + JSON.stringify(info.applicationInfo));
                expect(info.applicationInfo.isCloned).assertEqual(true);
                commonEvent.publish("ACTS_StartAbility_CommonEvent", PublishCallBackTwo);
            } else {
                console.info('AMS_MultiApp_Simultaneous_Online_0100 Ontology info ' 
                + JSON.stringify(info.applicationInfo));
                expect(info.applicationInfo.isCloned).assertEqual(false);
                commonEvent.publish("ACTS_StartAbility_FinishEvent", PublishCallBackOne);
            }
        })
        
    })
})
