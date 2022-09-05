/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import ohosDataAbility from '@ohos.data.dataAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function ActsDataAbilityHelperTest() {
describe('ActsDataAbilityHelperTest', function () {
    let dataAbilityUri = ("dataability:///com.example.dataabilityserver_fa.DataAbility");
    let DAHelper;
    let gSetTimeout = 500;
    let index = 1;

    beforeAll(async (done) => {
        console.debug('= ACTS_beforeAll ====<begin');
        try {
            DAHelper = featureAbility.acquireDataAbilityHelper(dataAbilityUri);
            console.debug('ACTS_beforeAll DAHelper ====>: ' + DAHelper + " ,JSON. " + JSON.stringify(DAHelper));
            if(DAHelper == null){
                console.debug('ACTS_beforeAll DAHelper ====>: DAHelper == null');
                return;
            }
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
    * @tc.number: ACTS_DataAbilityAccessDataShare_Inset_0100
    * @tc.name: insert : insert data to DataShare by DataAbilityHelper
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_DataAbilityAccessDataShare_Inset_0100', 0, async function (done) {
        console.log('ACTS_DataAbilityAccessDataShare_Inset_0100====<begin');
        console.debug("=ACTS_DataAbilityAccessDataShare_Inset_0100 dataAbilityUri====>" + dataAbilityUri)
        try {
            if(DAHelper == null){
                var abilityHelper = featureAbility.acquireDataAbilityHelper(dataAbilityUri)
                console.log('ACTS_DataAbilityAccessDataShare_Inset_0100 abilityHelper ====>: '
                    + abilityHelper + " ,JSON. " + JSON.stringify(abilityHelper))
                DAHelper = abilityHelper;
            }
            expect(typeof (DAHelper)).assertEqual("object");
        } catch (err) {
            console.error('=ACTS_DataAbilityAccessDataShare_Inset_0100 acquireDataAbilityHelper catch(err)====>:' + err);
            expect(false).assertTrue();
        }

        let insertValuesBucket = {'name':'C++', 'introduction':'Primer'}
        DAHelper.insert(
        dataAbilityUri,
        insertValuesBucket,
        (error, data) => {
            console.log('ACTS_DataAbilityAccessDataShare_Inset_0100 DAHelper insert result: ' + data)
            expect(data).assertEqual(index);
            index++;
        })
        done();
        console.log('ACTS_DataAbilityAccessDataShare_Inset_0100====<end')
    })
})}