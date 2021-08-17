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
import featureAbility from '@ohos.ability.featureability'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('ActsWantBTest', function () {
    const ary_entities = ["entity1"];
    const ary_int = [1, 2, 3];
    const ary_bool = [false, true, false];
    const ary_string = ["qqqqq", "wwwwww", "aaaaaaaaaaaaaaaaa"];

    function CompareArray(ary1, ary2) {
        expect(ary1.length).assertEqual(ary2.length);
        if (ary1.length == ary2.length) {
            for (let i=0;i<ary1.length; i++) {
                expect(ary1[i]).assertEqual(ary2[i]);
            }
        }
    }

    //  @tc.number: ACTS_GetWant_0400
    //  @tc.name: getWant : get want in current ability
    //  @tc.desc: get want in current ability  (by Promise)
    it('ACTS_GetWant_0400', 0, async function (done) {
        var want = featureAbility.getWant().then(
            data=> {
                expect(typeof(data)).assertEqual("object");
                expect(data.deviceId).assertEqual("deviceId");
                expect(data.bundleName).assertEqual("com.want.test");
                expect(data.abilityName).assertEqual("com.example.getwant0200.MainAbility");
                expect(data.action).assertEqual("action1");

                CompareArray(data.parameters.mykey1, ary_int);
                expect(data.parameters.mykey2).assertEqual("[1, 2, 3]");
                expect(data.parameters.mykey3).assertEqual("ssssssssssssssssssssssssss");
                CompareArray(data.parameters.mykey4, ary_bool);
                CompareArray(data.parameters.mykey5, ary_string);
                expect(data.parameters.mykey6).assertEqual(true);

                done();
            }
        ).catch(error =>
            console.log("featureAbility getWant::catch : " + error)
        );
    })

    //  @tc.number: ACTS_GetWant_0500
    //  @tc.name: getWant : get want in current ability
    //  @tc.desc: get want in current ability  (by callback)
    it('ACTS_GetWant_0500', 0, async function (done) {
        var want = featureAbility.getWant(
            (err, data) => {
                expect(typeof(data)).assertEqual("object");
                expect(data.deviceId).assertEqual("deviceId");
                expect(data.bundleName).assertEqual("com.want.test");
                expect(data.abilityName).assertEqual("com.example.getwant0200.MainAbility");
                expect(data.action).assertEqual("action1");

                CompareArray(data.parameters.mykey1, ary_int);
                expect(data.parameters.mykey2).assertEqual("[1, 2, 3]");
                expect(data.parameters.mykey3).assertEqual("ssssssssssssssssssssssssss");
                CompareArray(data.parameters.mykey4, ary_bool);
                CompareArray(data.parameters.mykey5, ary_string);
                expect(data.parameters.mykey6).assertEqual(true);

                done();
            });
    })

    console.log("AceApplication : ActsWantBTest end");
})
