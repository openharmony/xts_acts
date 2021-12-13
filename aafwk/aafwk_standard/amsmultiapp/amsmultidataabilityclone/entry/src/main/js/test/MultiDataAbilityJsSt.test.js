/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import abilitymanager from '@ohos.app.abilitymanager'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

const MIN_CLONEUID = 20000000;

describe('ActsDataAbilityHelperTest', function () {
    var dataAbilityProcessName = ("com.ix.verify.act");
    var dataAbilityUri = ("dataability:///com.ix.VerifyActDataAbility");
    var DAHelper;

    beforeAll(async (done) => {
        console.debug('= ACTS_beforeAll ====<begin');
        try {
            DAHelper = featureAbility.acquireDataAbilityHelper(dataAbilityUri);
            console.debug('ACTS_beforeAll DAHelper ====>: ' + DAHelper + " ,JSON. " + JSON.stringify(DAHelper));
        } catch (err) {
            console.error('=ACTS_beforeAll acquireDataAbilityHelper catch(err)====>:' + err);
        }
        console.debug('= ACTS_beforeAll ====<end');
        done();
    })
    afterAll((done) => {
        console.debug('= ACTS_afterAll ====<begin');
        console.debug('= ACTS_afterAll ====<end');
        done();
    })

    /*
    * @tc.number: AMS_MultiApp_0500
    * @tc.name: Page ability start cloned data ability
    * @tc.desc: Check if cloned data ability process exists
    */
    it('AMS_MultiApp_0500', 0, async function (done) {
        console.log('AMS_MultiApp_0500====<begin');
        console.debug("=AMS_MultiApp_0500 dataAbilityUri====>" + dataAbilityUri)
        var cloneFlag = 0;
        var selfFlag = 0;
        var processInfos = await abilitymanager.getActiveProcessInfos();
        console.info('ActsAmsMultiAppTermination  processInfos length' + processInfos.length);
        for (var i = 0; i < processInfos.length; i++) {
            console.info('ActsAmsMultiAppTermination  process name ' + processInfos[i].processName);
            if (processInfos[i].processName == dataAbilityProcessName) {
                console.info('process uid =  ' + processInfos[i].uid);
                if (processInfos[i].uid >= MIN_CLONEUID) {
                    cloneFlag = 1;
                } else {
                    selfFlag = 1;
                }
            }
        }
        
        console.log('AMS_MultiApp_0500====cloneFlag' + cloneFlag);
        console.log('AMS_MultiApp_0500====selfFlag' + selfFlag);
        expect(cloneFlag).assertEqual(1);
        expect(selfFlag).assertEqual(0);
        done();
    })
})