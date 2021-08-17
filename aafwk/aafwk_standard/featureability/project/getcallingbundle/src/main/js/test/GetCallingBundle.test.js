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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'


describe('ActsFeatureAbilityTest', function () {
    // @tc.number: ACTS_GetCallingBundle_0100
    // @tc.name: GetCallingBundle : Obtains the bundle name of the ability that called the current ability.
    // @tc.desc: Check the return type of the interface (by Promise)
    it('ACTS_GetCallingBundle_0100', 0, async function (done) {
        var promise = featureAbility.getCallingBundle();
        expect(typeof(promise)).assertEqual("object");
        var info = await featureAbility.getCallingBundle();
        expect(typeof(info)).assertEqual("string");
        expect(info).assertEqual("com.jstest.featureabilitytest");
        done();
    })

    // @tc.number: ACTS_GetCallingBundle_0200
    // @tc.name: GetCallingBundle : Obtains the bundle name of the ability that called the current ability.
    // @tc.desc: Check the return value of the interface (by AsyncCallback)
    it('ACTS_GetCallingBundle_0200', 0, async function (done) {
        var result = featureAbility.getCallingBundle(
            (err, data) => {
                console.log("getCallingBundle : " + data)
                expect(typeof(data)).assertEqual("string");
                expect(data).assertEqual("com.jstest.featureabilitytest");
                done()
            }
        );
    })
})
