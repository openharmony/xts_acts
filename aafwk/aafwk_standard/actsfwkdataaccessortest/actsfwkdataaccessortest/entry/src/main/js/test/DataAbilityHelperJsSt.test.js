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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

describe('ActsDataAbilityHelperTest', function () {
    let dataAbilityUri = ("dataability:///com.example.myapplication.DataAbility");
    let DAHelper;

    beforeAll(async (done) => {
        console.debug('= ACTS_beforeAll ====<begin');
        try {
            DAHelper = featureAbility.acquireDataAbilityHelper(dataAbilityUri);
            console.debug('ACTS_beforeAll DAHelper ====>: ' + DAHelper + " ,JSON. " + JSON.stringify(DAHelper));
            if(DAHelper == null){
                console.debug('ACTS_beforeAll DAHelper ====>: DAHelper == null');
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
    * @tc.number: ACTS_AcquireDataAbilityHelper_0100
    * @tc.name: GetDataAbilityHelper : Connects an ability to a Service ability
    * @tc.desc: Check the return value of the interface ()
    */
    it('ACTS_AcquireDataAbilityHelper_0100', 0, async function (done) {
        console.log('ACTS_AcquireDataAbilityHelper_0100====<begin');
        console.debug("=ACTS_AcquireDataAbilityHelper_0100 dataAbilityUri====>" + dataAbilityUri)
        try {
            var abilityHelper = featureAbility.acquireDataAbilityHelper(dataAbilityUri)
            console.log('ACTS_AcquireDataAbilityHelper_0100 abilityHelper ====>: '
                + abilityHelper + " ,JSON. " + JSON.stringify(abilityHelper))
            if(DAHelper == null){
                DAHelper = abilityHelper;
            }
            expect(typeof (abilityHelper)).assertEqual("object");
        } catch (err) {
            console.error('=ACTS_GetDataAbilityHelper_0100 acquireDataAbilityHelper catch(err)====>:' + err);
            expect(false).assertTrue();
        }
        done();
        console.log('ACTS_AcquireDataAbilityHelper_0100====<end')
    })

    /*
    * @tc.number: ACTS_AcquireDataAbilityHelper_0200
    * @tc.name: GetDataAbilityHelper : Connects an ability to a Service ability
    * @tc.desc: Check the return value of the interface ()
    */
    it('ACTS_AcquireDataAbilityHelper_0200', 0, async function (done) {
        console.log('ACTS_AcquireDataAbilityHelper_0200====<begin');
        try {
            var abilityHelper = featureAbility.acquireDataAbilityHelper("")
            console.log('ACTS_AcquireDataAbilityHelper_0200 abilityHelper ====>: '
                + abilityHelper + " ,JSON. " + JSON.stringify(abilityHelper))
            expect(abilityHelper).assertEqual(null);
        } catch (err) {
            console.error('=ACTS_GetDataAbilityHelper_0200 acquireDataAbilityHelper catch(err)====>:' + err);
            expect(false).assertTrue();
        }
        done();
        console.log('ACTS_AcquireDataAbilityHelper_0200====<end')
    })

    /*
    * @tc.number: ACTS_AcquireDataAbilityHelper_0300
    * @tc.name: GetDataAbilityHelper : Connects an ability to a Service ability
    * @tc.desc: Check the return value of the interface ()
    */
    it('ACTS_AcquireDataAbilityHelper_0300', 0, async function (done) {
        console.log('ACTS_AcquireDataAbilityHelper_0300====<begin');
        try {
            var abilityHelper = featureAbility.acquireDataAbilityHelper("error")
            console.log('ACTS_AcquireDataAbilityHelper_0300 abilityHelper ====>: '
                + abilityHelper + " ,JSON. " + JSON.stringify(abilityHelper))
            expect(abilityHelper).assertEqual(null);
        } catch (err) {
            console.error('=ACTS_GetDataAbilityHelper_0300 acquireDataAbilityHelper catch(err)====>:' + err);
            expect(false).assertTrue();
        }
        done();
        console.log('ACTS_AcquireDataAbilityHelper_0300====<end')
    })

    /*
    * @tc.number: ACTS_AcquireDataAbilityHelper_0400
    * @tc.name: GetDataAbilityHelper : Connects an ability to a Service ability
    * @tc.desc: Check the return value of the interface ()
    */
    it('ACTS_AcquireDataAbilityHelper_0400', 0, async function (done) {
        console.log('ACTS_AcquireDataAbilityHelper_0400====<begin');
        try {
            var abilityHelper = featureAbility.acquireDataAbilityHelper(undefined)
            console.log('ACTS_AcquireDataAbilityHelper_040 abilityHelper ====>: '
                + abilityHelper + " ,JSON. " + JSON.stringify(abilityHelper))
            expect(JSON.stringify(abilityHelper)).assertEqual("null");
        } catch (err) {
            console.error('=ACTS_GetDataAbilityHelper_0400 acquireDataAbilityHelper catch(err)====>:' + err);
            expect(false).assertTrue();
        }
        done();
        console.log('ACTS_AcquireDataAbilityHelper_0400====<end')
    })

    /*
    * @tc.number: ACTS_AcquireDataAbilityHelper_0500
    * @tc.name: GetDataAbilityHelper : Connects an ability to a Service ability
    * @tc.desc: Check the return value of the interface ()
    */
    it('ACTS_AcquireDataAbilityHelper_0500', 0, async function (done) {
        console.log('ACTS_AcquireDataAbilityHelper_0500====<begin');
        try {
            var abilityHelper = featureAbility.acquireDataAbilityHelper(123456)
            console.log('ACTS_AcquireDataAbilityHelper_0500 abilityHelper ====>: '
                + abilityHelper + " ,JSON. " + JSON.stringify(abilityHelper))
            expect(JSON.stringify(abilityHelper)).assertEqual("null");
        } catch (err) {
            console.error('=ACTS_GetDataAbilityHelper_0500 acquireDataAbilityHelper catch(err)====>:' + err);
            expect(false).assertTrue();
        }
        done();
        console.log('ACTS_AcquireDataAbilityHelper_0500====<end')
    })
})