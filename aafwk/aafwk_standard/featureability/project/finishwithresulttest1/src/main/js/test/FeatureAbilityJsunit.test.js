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
    // @tc.number: ACTS_FinishWithResult_0100
    // @tc.name: FinishWithResult : Called when startAbilityForResultis called to start an ability and the result is returned.
    // @tc.desc: Check the return value of the interface (by Promise)
    it('ACTS_FinishWithResult_0100', 0, async function (done) {
        var promise = await featureAbility.finishWithResult(
            {
                    resultCode: 1,
                    want:
                    {
                        action: "action.system.home",
                        entities: ["entity.system.home"],
                        type: "MIMETYPE",
                        options:{
                        // indicates the grant to perform read operations on the URI
                            authReadUriPermission: true,
                        // indicates the grant to perform write operations on the URI
                            authWriteUriPermission: true,
                        // support forward intent result to origin ability
                            abilityForwardResult: true,
                        // used for marking the ability start-up is triggered by continuation
                            abilityContinuation: true,
                        // specifies whether a component does not belong to ohos
                            notOhosComponent: true,
                        // specifies whether an ability is started
                            abilityFormEnabled: true,
                        // indicates the grant for possible persisting on the URI.
                            authPersistableUriPermission: true,
                        // indicates the grant for possible persisting on the URI.
                            authPrefixUriPermission: true,
                        // support distributed scheduling system start up multiple devices
                            abilitySliceMultiDevice: true,
                        // indicates that an ability using the service template is started regardless of whether the
                        // host application has been started.
                            startForegroundAbility: true,
                        // install the specified ability if it's not installed.
                            installOnDemand: true,
                        // return result to origin ability slice
                            abilitySliceForwardResult: true,
                        // install the specified ability with background mode if it's not installed.
                            installWithBackgroundMode: true
                        },
                        deviceId: "deviceId",
                        bundleName: "com.neu.featureabilitytest",
                        abilityName: "com.jstest.finishwithresulttest1.MainAbility",
                        uri:"",
                        parameters: {
                            mykey0: 2222,
                            mykey1: [1, 2, 3],
                            mykey2: "[1, 2, 3]",
                            mykey3: "ssssssssssssssssssssssssss",
                            mykey4: [1, 15],
                            mykey5: [false, true, false],
                            mykey6: ["qqqqq", "wwwwww", "aaaaaaaaaaaaaaaaa"],
                            mykey7: true,
                        }
                    },
            }
        );
        expect(typeof(promise)).assertEqual("object");
        done();
    })

    // @tc.number: ACTS_TerminateAbility_0100
    // @tc.name: TerminateAbility : Destroys ability
    // @tc.desc: Check the return value of the interface (by Promise)
    it('ACTS_TerminateAbility_0100', 0, async function (done) {
        var promise = featureAbility.terminateAbility();
        expect(typeof(promise)).assertEqual("object");
        done();
    })
})