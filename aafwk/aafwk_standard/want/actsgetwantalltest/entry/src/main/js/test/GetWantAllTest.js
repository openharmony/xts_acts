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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('ActsGetWantAllTest', function () {
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

    //  @tc.number: ACTS_GetWant_0100
    //  @tc.name: getWant : get want in current ability
    //  @tc.desc: get want in current ability  (by Promise)
    it('ACTS_GetWant_0100', 0, async function (done) {
        console.log("==========getWant===========");
        var want = featureAbility.getWant().then(
            data=> {
                console.log("==========getWant===========ok");
                console.log("data.deviceId=" + data.deviceId);
                console.log("data.bundleName=" + data.bundleName);
                console.log("data.abilityName=" + data.abilityName);
                console.log("data.action=" + data.action);
                console.log("data.entities=" + data.entities);
                console.log("data.type=" + data.type);
                console.log("data.uri=" + data.uri);

                console.log("data.parameters.mykey0=" + data.parameters.mykey0);
                console.log("data.parameters.mykey1=" + data.parameters.mykey1);
                console.log("data.parameters.mykey2=" + data.parameters.mykey2);
                console.log("data.parameters.mykey3=" + data.parameters.mykey3);
                console.log("data.parameters.mykey4=" + data.parameters.mykey4);
                console.log("data.parameters.mykey5=" + data.parameters.mykey5);
                console.log("data.parameters.mykey6=" + data.parameters.mykey6);

                console.log("data.options.authReadUriPermission=" + data.options.authReadUriPermission);
                console.log("data.options.authWriteUriPermission=" + data.options.authWriteUriPermission);
                console.log("data.options.abilitySliceMultiDevice=" + data.options.abilitySliceMultiDevice);
                console.log("data.options.installWithBackgroundMode=" + data.options.installWithBackgroundMode);

                expect(typeof(data)).assertEqual("object");
                expect(data.deviceId).assertEqual("deviceId");
                expect(data.action).assertEqual("action1");
                CompareArray(data.entities, ary_entities);
                expect(data.type).assertEqual("MIMETYPE");
                expect(data.uri).assertEqual("key={true,true,false}");
                expect(data.options.authReadUriPermission).assertEqual(true);
                expect(data.options.authWriteUriPermission).assertEqual(true);
                expect(data.options.abilityForwardResult).assertEqual(false);
                expect(data.options.abilityContinuation).assertEqual(false);
                expect(data.options.notOhosComponent).assertEqual(true);
                expect(data.options.abilityFormEnabled).assertEqual(true);
                expect(data.options.authPersistableUriPermission).assertEqual(true);
                expect(data.options.authPrefixUriPermission).assertEqual(false);
                expect(data.options.abilitySliceMultiDevice).assertEqual(false);
                expect(data.options.startForegroundAbility).assertEqual(true);
                expect(data.options.installOnDemand).assertEqual(false);
                expect(data.options.abilitySliceForwardResult).assertEqual(true);
                expect(data.options.installWithBackgroundMode).assertEqual(true);
                expect(data.parameters.mykey0).assertEqual(2222);
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

    //  @tc.number: ACTS_GetWant_0200
    //  @tc.name: getWant : get want in current ability
    //  @tc.desc: get want in current ability  (by callback)
    it('ACTS_GetWant_0200', 0, async function (done) {
        var want = featureAbility.getWant(
            (err, data) => {
                expect(typeof(data)).assertEqual("object");
                expect(data.deviceId).assertEqual("deviceId");
                expect(data.action).assertEqual("action1");
                CompareArray(data.entities, ary_entities);
                expect(data.type).assertEqual("MIMETYPE");
                expect(data.uri).assertEqual("key={true,true,false}");
                expect(data.options.authReadUriPermission).assertEqual(true);
                expect(data.options.authWriteUriPermission).assertEqual(true);
                expect(data.options.abilityForwardResult).assertEqual(false);
                expect(data.options.abilityContinuation).assertEqual(false);
                expect(data.options.notOhosComponent).assertEqual(true);
                expect(data.options.abilityFormEnabled).assertEqual(true);
                expect(data.options.authPersistableUriPermission).assertEqual(true);
                expect(data.options.authPrefixUriPermission).assertEqual(false);
                expect(data.options.abilitySliceMultiDevice).assertEqual(false);
                expect(data.options.startForegroundAbility).assertEqual(true);
                expect(data.options.installOnDemand).assertEqual(false);
                expect(data.options.abilitySliceForwardResult).assertEqual(true);
                expect(data.options.installWithBackgroundMode).assertEqual(true);
                expect(data.parameters.mykey0).assertEqual(2222);
                CompareArray(data.parameters.mykey1, ary_int);
                expect(data.parameters.mykey2).assertEqual("[1, 2, 3]");
                expect(data.parameters.mykey3).assertEqual("ssssssssssssssssssssssssss");
                CompareArray(data.parameters.mykey4, ary_bool);
                CompareArray(data.parameters.mykey5, ary_string);
                expect(data.parameters.mykey6).assertEqual(true);

                done();
            });
    })

    //  @tc.number: ACTS_GetWant_0300
    //  @tc.name: getWant : get want in current ability
    //  @tc.desc: get want in current ability，private error param  (by callback)
    it('ACTS_GetWant_0300', 0, async function (done) {
        var want = featureAbility.getWant("error_param",
            (err, data) => {
                expect(typeof(data)).assertEqual("object");
                expect(data.deviceId).assertEqual("deviceId");
                expect(data.action).assertEqual("action1");
                CompareArray(data.entities, ary_entities);
                expect(data.type).assertEqual("MIMETYPE");
                expect(data.uri).assertEqual("key={true,true,false}");
                expect(data.options.authReadUriPermission).assertEqual(true);
                expect(data.options.authWriteUriPermission).assertEqual(true);
                expect(data.options.abilityForwardResult).assertEqual(false);
                expect(data.options.abilityContinuation).assertEqual(false);
                expect(data.options.notOhosComponent).assertEqual(true);
                expect(data.options.abilityFormEnabled).assertEqual(true);
                expect(data.options.authPersistableUriPermission).assertEqual(true);
                expect(data.options.authPrefixUriPermission).assertEqual(false);
                expect(data.options.abilitySliceMultiDevice).assertEqual(false);
                expect(data.options.startForegroundAbility).assertEqual(true);
                expect(data.options.installOnDemand).assertEqual(false);
                expect(data.options.abilitySliceForwardResult).assertEqual(true);
                expect(data.options.installWithBackgroundMode).assertEqual(true);
                expect(data.parameters.mykey0).assertEqual(2222);
                CompareArray(data.parameters.mykey1, ary_int);
                expect(data.parameters.mykey2).assertEqual("[1, 2, 3]");
                expect(data.parameters.mykey3).assertEqual("ssssssssssssssssssssssssss");
                CompareArray(data.parameters.mykey4, ary_bool);
                CompareArray(data.parameters.mykey5, ary_string);
                expect(data.parameters.mykey6).assertEqual(true);

                done();
            });
        expect(want).assertEqual(null);
        done();
    })

    console.log("AceApplication : ActsGetWantAllTest end");
})
