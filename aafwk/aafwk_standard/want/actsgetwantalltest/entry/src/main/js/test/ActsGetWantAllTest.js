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

const installPath1 = "/data/ActsGetWantAllTestHap.hap"
const installPath2 = "/data/ActsGetWantAllTestHaptwo.hap"

describe('ActsgetWantTest', async function () {
        var retFlag = false;
    beforeAll(async (done) => {
        console.debug('=======before all install========');
        bundle.getBundleInstaller().then(data => {
            data.install([
                    installPath1,installPath2], {
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
            setTimeout(function(){
                console.info('========onReceiveinstallEvent finish========' + JSON.stringify(err));
            },1000)
        }
    })
    afterAll((done) => {
        console.debug('=======after all uninstall========');
        bundle.getBundleInstaller().then(data => {
            data.uninstall(["com.example.actsgetwant","com.example.actsgetwanttwo"], {
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
            setTimeout(function(){
                console.info('========onReceiveinstallEvent finish========' + JSON.stringify(err));
            },1000)
            done();
        }
    })

    function sleep(delay, flag) {
        var start = (new Date()).getTime();
        while((new Date()).getTime() - start < delay && flag == false) {
            continue;
        }
    }

    function sleep2(delay) {
        var start = (new Date()).getTime();
        while((new Date()).getTime() - start < delay) {
            continue;
        }
    }


    //  @tc.number: ACTS_GetWant_0100
    //  @tc.name: getWant : get want in current ability
    //  @tc.desc: use event subscriptionsget to get want in current ability  (by Promise)
    it('ACTS_GetWant_0100', 0, async function (done) {
        var ret = false
        var Subscriber;
        var CommonEventSubscriberInfo = {
            events: ["ACTS_GetWant_0100_CommonEvent"],
        };

        function SubscribeCallBack(err, data) {
            console.debug("====>Subscriber CallBack01====>");
            console.debug("====>Subscriber CallBack data:01====>" + JSON.stringify(data));
            expect(data.data).assertEqual("succeed");
            Subscriber.unsubscribe(Subscriber, unsubscribeCallback)
            retFlag = true
        }

        function unsubscribeCallback() {
            console.debug("====>UnSubscriber CallBack01====>");
        }

        commenEvent.createSubscriber(CommonEventSubscriberInfo).then(async (data) => {
            console.debug("====>Creat Subscriber01====>");
            Subscriber = data;
            console.debug("====>subscribe start01====>");
            await commenEvent.subscribe(Subscriber, SubscribeCallBack);
            console.debug("====>subscribe finish01====>");
        })
        console.debug("====>startAbility start01====>");
        var promise = await featureAbility.startAbility(
            {
                want:
                {
                    deviceId: "",
                    bundleName: "com.example.actsgetwant",
                    abilityName: "com.example.actsgetwant.MainAbility",
                    action: "action1",
                    parameters:
                    {
                        mykey0: 1,
                        mykey1: [1, 2, 3],
                        mykey2: "[1, 2, 3]",
                        mykey3: "str",
                        mykey4: [false, true, false],
                        mykey5: ["str", "STR", "helloopenharmony"],
                    },
                },
            },
        );
        console.debug("====>startAbility finish01====>");
        done();
        console.debug("==============start waiting 5s....");

        sleep(5000, retFlag);
        retFlag = false;

        console.debug("==============end waiting 5s.");
        console.debug("====the first case finished and wait 5s.");
    })

    sleep2(2000);
    console.debug("====the first end.");

    console.debug("=====================================continue then Exit.");

    //  @tc.number: ACTS_GetWant_0200
    //  @tc.name: getWant : get want in current ability
    //  @tc.desc: use event subscriptionsget to get want in current ability  (by callback)

    it('ACTS_GetWant_0200', 0, async function (done) {
        retFlag = false;
        var Subscriber;
        var CommonEventSubscriberInfo = {
            events: ["ACTS_GetWant_0200_CommonEvent"],
        };

        function SubscribeCallBack2(err, data) {
            console.debug("====>Subscriber CallBack02====>");
            console.debug("====>Subscriber CallBack data:02====>" + JSON.stringify(data));
            expect(data.data).assertEqual("succeed");
            Subscriber.unsubscribe(Subscriber, unsubscribeCallback2)
            retFlag = true;
        }

        function unsubscribeCallback2() {
            console.debug("====>UnSubscriber CallBack02====>");
        }

        await commenEvent.createSubscriber(CommonEventSubscriberInfo).then(async (data) => {
            console.debug("====>Creat Subscriber02====>");
            Subscriber = data;
            console.debug("====>subscribe start02====>");
            await commenEvent.subscribe(Subscriber, SubscribeCallBack2);
            console.debug("====>subscribe finish02====>");
        })
        console.debug("====>startAbility start02====>");
        var promise = await featureAbility.startAbility(
            {
                want:
                {
                    bundleName: "com.example.actsgetwanttwo",
                    abilityName: "com.example.actsgetwanttwo.MainAbility",
                },
            },
        );
        done();
        setTimeout(function(){
            console.debug("====>wangdalaowangwwwwwwwwwwwwwwwwwww====>");
        },5000);

        console.debug("====>startAbility finish02====>");
        sleep(5000, retFlag);
        console.debug("====>startAbility finish02===========1=>");
        retFlag = false;

        console.debug("====>startAbility finish02===========2=>");
    })

})
