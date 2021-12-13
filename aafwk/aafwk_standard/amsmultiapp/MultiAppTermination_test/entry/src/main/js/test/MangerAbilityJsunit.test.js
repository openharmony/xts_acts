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
import commonEvent from '@ohos.commonevent'
import bundle from "@ohos.bundle"
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

const MIN_CLONEUID = 20000000;

describe('ActsAmsMultiAppPageCloneTermination', function () {
    console.info('----ActsAmsMultiAppPageCloneTermination----');

    /*
     * @tc.number    : AMS_MultiApp_PageClone_Termination_0100
     * @tc.name      : startAbility : start pageAbility
     * @tc.desc      : The Ontology application and the clone application are online at the same time,
     *                 and the Ontology application is terminated 
     */
    it('AMS_MultiApp_PageClone_Termination_0100', 0, async function (done) {
        function PublishCallBackOne(err) {
            console.debug("====>Publish CallBack ACTS_StartAbility_CommonEvent Ontology ====>"+err);
            done();
        }
        function PublishCallBackTwo(err) {
            console.debug("====>Publish CallBack ACTS_StartAbility_CommonEvent Clone ====>"+err);
            done();
        }
        
        var data = await featureAbility.getWant();
        console.info('AMS_MultiApp_PageClone_Termination_0100 data ' 
        + JSON.stringify(data));
        expect(data.bundleName).assertEqual("com.example.actsamsmultiapppageclonetermination");
        expect(data.abilityName).assertEqual("com.example.actsamsmultiapppageclonetermination.MainAbility");
        var info = await featureAbility.getAbilityInfo();
        console.info('AMS_MultiApp_PageClone_Termination_0100 Clone info ' 
        + JSON.stringify(info.applicationInfo));
        bundle.getBundleInfo("com.example.actsamsmultiapppageclonetermination", 1, async (err, data) => {
            console.info('AMS_MultiApp_PageClone_Termination_0100 data.uid ' 
            + JSON.stringify(data.uid));
            if (data.uid >= MIN_CLONEUID) {
                expect(info.applicationInfo.isCloned).assertEqual(true);
                commonEvent.publish("ACTS_StartAbility_CommonEvent",PublishCallBackTwo);
            } else {
                expect(info.applicationInfo.isCloned).assertEqual(false);
                console.info('AMS_MultiApp_PageClone_Termination_0100 terminateSelf1 ');
                featureAbility.terminateSelf(async () => {
                    commonEvent.publish("ACTS_StartAbility_Terminate",PublishCallBackOne);
                    console.info('AMS_MultiApp_PageClone_Termination_0100 terminateSelf async callback publish ');
                });
            }
        })
    })
})
