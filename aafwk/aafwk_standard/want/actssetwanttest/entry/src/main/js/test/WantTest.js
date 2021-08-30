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

describe('ActsSetWantTest', function () {
    // @tc.number: ACTS_SetWant_0100
    // @tc.name: startAbility
    // @tc.desc: Check the return value of the interface (by Promise)
    it('ACTS_SetWant_0100', 0, async function (done) {
        var promise = await featureAbility.startAbility(
            {
                want:
                {
                    deviceId: "",
                    bundleName: "com.example.actsgetwantalltest",
                    abilityName: "com.example.actsgetwantalltest.MainAbility",
                    action: "action1",
                    entities: ["entity1"],
                    type: "MIMETYPE",
                    uri: "key={true,true,false}",
                    options:
                    {
                        authReadUriPermission: true,
                    // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                    // support forward intent result to origin ability
                        abilityForwardResult: false,
                    // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: false,
                    // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                    // specifies whether an ability is started
                        abilityFormEnabled: true,
                    // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                    // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: false,
                    // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: false,
                    // indicates that an ability using the service template is started regardless of whether the
                    // host application has been started.
                        startForegroundAbility: true,
                    // install the specified ability if it's not installed.
                        installOnDemand: false,
                    // return result to origin ability slice
                        abilitySliceForwardResult: true,
                    // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true,
                    },
                    parameters:
                    {
                        mykey0: 2222,
                        mykey1: [1, 2, 3],
                        mykey2: "[1, 2, 3]",
                        mykey3: "ssssssssssssssssssssssssss",
                        mykey4: [false, true, false],
                        mykey5: ["qqqqq", "wwwwww", "aaaaaaaaaaaaaaaaa"],
                        mykey6: true,
                        mykey7: {
                            wp1: 100,
                            wp2: [32.221,34,324.5,44.65],
                            wp3: "want params test",
                        },
                        mykey8: 3.2,
                    },
                },
            },
        );
        done();
    })

    // @tc.number: ACTS_SetWant_0200
    // @tc.name: startAbility
    // @tc.desc: Check the return value of the interface (by Promise)
    it('ACTS_SetWant_0200', 0, async function (done) {
        var callback = featureAbility.startAbility(
            {
                want:
                {
                    deviceId: "",
                    bundleName: "com.example.actsgetwanttest",
                    abilityName: "com.example.actsgetwanttest.MainAbility",
                    action: "action1",
                    parameters:
                    {
                        mykey0: 2222,
                        mykey1: [1, 2, 3],
                        mykey2: "[1, 2, 3]",
                        mykey3: "ssssssssssssssssssssssssss",
                        mykey4: [false, true, false],
                        mykey5: ["qqqqq", "wwwwww", "aaaaaaaaaaaaaaaaa"],
                        mykey6: true,
                    },
                },
            },
            (err, data) => {
                done();
            }
        );
    })
})