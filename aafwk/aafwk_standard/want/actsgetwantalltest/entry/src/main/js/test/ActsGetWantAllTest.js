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
import commenEvent from '@ohos.commonevent'
import featureAbility from '@ohos.ability.featureability'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import bundle from '@ohos.bundle'

const installPath = "/data/ActsGetWantAllTestHap.hap"

describe('ActsgetWantTest', async function () {
    beforeAll(async (done) => {
        console.debug('=======before all install========');
        bundle.getBundleInstaller().then(data => {
            data.install([
                    installPath], {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, onReceiveinstallEvent);
        })

        function onReceiveinstallEvent(err, data) {
            console.info('========install finish========' + JSON.stringify(err));
            console.info('========install finish========' + JSON.stringify(data));
            console.info('========install finish========' + data.status);
            console.info('========install finish========' + data.statusMessage);
            done()
        }
    })
    afterAll((done) => {
        console.debug('=======after all uninstall========');
        bundle.getBundleInstaller().then(data => {
            data.uninstall("com.example.actsgetwantalltesthap", {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, onReceiveinstallEvent);

        })

        function onReceiveinstallEvent(err, data) {
            console.info('========uninstall finish========' + JSON.stringify(err));
            console.info('========uninstall finish========' + JSON.stringify(data));
            console.info('========uninstall finish========' + data.status);
            console.info('========uninstall finish========' + data.statusMessage);
            done();
        }
    })
    //  @tc.number: ACTS_GetWant_0100
    //  @tc.name: getWant : get want in current ability
    //  @tc.desc: get want in current ability  (by Promise)
    it('ACTS_GetWant_0100', 0, async function (done) {
        var Subscriber;
        var CommonEventSubscriberInfo = {
            events: ["ACTS_GetWant_0100_CommonEvent"],
        };

        function SubscribeCallBack(err, data) {
            console.debug("====>Subscriber CallBack====>");
            console.debug("====>Subscriber CallBack data:====>" + JSON.stringify(data));
            expect(data.data).assertEqual("succeed");
            Subscriber.unsubscribe(Subscriber, unsubscribeCallback)
        }

        function unsubscribeCallback() {
            console.debug("====>UnSubscriber CallBack====>");
        }

        await commenEvent.createSubscriber(CommonEventSubscriberInfo).then(async (data) => {
            console.debug("====>Creat Subscriber====>");
            Subscriber = data;
            console.debug("====>subscribe start====>");
            await commenEvent.subscribe(Subscriber, SubscribeCallBack);
            console.debug("====>subscribe finish====>");
        })
        console.debug("====>startAbility start====>");
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
                        authWriteUriPermission: true,
                        abilityForwardResult: false,
                        abilityContinuation: false,
                        notOhosComponent: true,
                        abilityFormEnabled: true,
                        authPersistableUriPermission: true,
                        authPrefixUriPermission: false,
                        abilitySliceMultiDevice: false,
                        startForegroundAbility: true,
                        installOnDemand: false,
                        abilitySliceForwardResult: true,
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
                    },
                },
            },
        );
        console.debug("====>startAbility finish====>");
        done();
    })
    //  @tc.number: ACTS_GetWant_0200
    //  @tc.name: getWant : get want in current ability
    //  @tc.desc: get want in current ability  (by callback)
    it('ACTS_GetWant_0200', 0, async function (done) {
        var Subscriber;
        var CommonEventSubscriberInfo = {
            events: ["ACTS_GetWant_0200_CommonEvent"],
        };

        function SubscribeCallBack(err, data) {
            console.debug("====>Subscriber CallBack====>");
            console.debug("====>Subscriber CallBack data:====>" + JSON.stringify(data));
            expect(data.data).assertEqual("succeed");
            Subscriber.unsubscribe(Subscriber, unsubscribeCallback)
        }

        function unsubscribeCallback() {
            console.debug("====>UnSubscriber CallBack====>");
        }

        await commenEvent.createSubscriber(CommonEventSubscriberInfo).then(async (data) => {
            console.debug("====>Creat Subscriber====>");
            Subscriber = data;
            console.debug("====>subscribe start====>");
            await commenEvent.subscribe(Subscriber, SubscribeCallBack);
            console.debug("====>subscribe finish====>");
        })
        console.debug("====>startAbility start====>");
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
                        authWriteUriPermission: true,
                        abilityForwardResult: false,
                        abilityContinuation: false,
                        notOhosComponent: true,
                        abilityFormEnabled: true,
                        authPersistableUriPermission: true,
                        authPrefixUriPermission: false,
                        abilitySliceMultiDevice: false,
                        startForegroundAbility: true,
                        installOnDemand: false,
                        abilitySliceForwardResult: true,
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
                    },
                },
            },
        );
        console.debug("====>startAbility finish====>");
        done();
    })

})