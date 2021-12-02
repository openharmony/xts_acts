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
import abilityManager from '@ohos.app.abilityManager'
import featureAbility from '@ohos.ability.featureability'
import commonEvent from '@ohos.commonevent'
import image from '@ohos.multimedia.image'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

describe('ActsMissionSnapshotTest', function () {
    beforeAll(async (done) => {
        console.debug('= ACTS_beforeAll ====<begin');
        try {
        } catch (err) {
            console.error('=ACTS_beforeAll catch(err)====>:' + err);
        }
        console.debug('= ACTS_beforeAll ====<end');
        done();
    })
    afterAll(async (done) => {
        console.debug('= ACTS_afterAll ====<begin');
        try {
        } catch (err) {
            console.error('=ACTS_afterAll catch(err)====>:' + err);
        }
        console.debug('= ACTS_afterAll ====<end');
        done();
    })

    /*
    * @tc.number: ACTS_MissionSnapshot_0100
    * @tc.name: getAbilityMissionSnapshot
    * @tc.desc: Recent task stack provides current screenshot.(AsyncCallback)
    */
    it('ACTS_MissionSnapshot_0100', 0, async function (done) {
        console.debug('ACTS_MissionSnapshot_0100====<begin');
        try {
            await abilityManager.getAbilityMissionSnapshot(-1, (err, data) => {
                expect(err.code).assertEqual(0);
                console.debug("=ACTS_MissionSnapshot_0100 err,data=======>"
                    + ("json data【") + JSON.stringify(data) + (" 】") + " , " + data);
                expect(data.topAbility.bundleName).assertEqual("");
                expect(data.topAbility.abilityName).assertEqual("");
                console.debug('ACTS_MissionSnapshot_0100====<end')
                done();
            });
        } catch (err) {
            expect(err).assertEqual("0");
            console.debug('ACTS_MissionSnapshot_0100====<end err');
            done();
        }
    })

    /*
     * @tc.number: ACTS_MissionSnapshot_0200
     * @tc.name: getAbilityMissionSnapshot
     * @tc.desc: Recent task stack provides current screenshot.(AsyncCallback)
     */
    it('ACTS_MissionSnapshot_0200', 0, async function (done) {
        console.debug('ACTS_MissionSnapshot_0200====<begin');
        var m_missionId = -1;
        var m_topAbility_bundleName = "";
        var m_topAbility_abilityName = "";
        try {
            var upperLimit = 10;
            await abilityManager.getActiveAbilityMissionInfos(upperLimit, async (err, data) => {
                console.debug("=ACTS_MissionSnapshot_0200 err,data=======>"
                    + ("json err【") + JSON.stringify(err) + (" 】")
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,err=" + err + " ,data=" + data);
                console.debug('ACTS_MissionSnapshot_0200 AbilityMissionInfo data.length ====>: ' + data.length);
                if (!data.length) {
                    m_missionId = -99;
                    m_topAbility_bundleName = "";
                    m_topAbility_abilityName = "";
                    expect("if (!data.length) ").assertEqual("0");
                    console.debug('ACTS_MissionSnapshot_0200====<end 0')
                    done();
                } else {
                    m_missionId = data[0].missionId;
                    m_topAbility_bundleName = data[0].topAbility.bundleName;
                    m_topAbility_abilityName = data[0].topAbility.abilityName;
                }
                console.debug("=ACTS_MissionSnapshot_0200 m_missionId====>" + m_missionId);
                await abilityManager.getAbilityMissionSnapshot(m_missionId, (err, data) => {
                    expect(err.code).assertEqual(0);
                    console.debug("=ACTS_MissionSnapshot_0200 err,data=======>"
                        + ("json data【") + JSON.stringify(data) + (" 】") + " , " + data);
                    expect(data.topAbility.bundleName).assertEqual(m_topAbility_bundleName);
                    expect(data.topAbility.abilityName).assertEqual(m_topAbility_abilityName);
                    console.debug("=ACTS_MissionSnapshot_0200 ====> JSON.stringify(data.snapshot)="
                        + JSON.stringify(data.snapshot) + " , " + data.snapshot);
                    try {
                        data.snapshot.getPixelBytesNumber().then(function (data){
                            console.debug("=ACTS_MissionSnapshot_0200 ====>"
                            +"(data.snapshot.getPixelBytesNumber()=)" + data)
                            expect(data != 0).assertEqual(true);
                            console.debug('ACTS_MissionSnapshot_0200====<end')
                            done();
                        })

                    } catch (err) {
                        console.debug('ACTS_MissionSnapshot_0200====<end  catch (err) get = ');
                        expect("0").assertEqual(err);
                        done();
                    }
                });
            });
        } catch (err) {
            expect(err).assertEqual("0");
            console.debug('ACTS_MissionSnapshot_0200====<end err')
            done();
        }
    })

 /*
    * @tc.number: ACTS_MissionSnapshot_0300
    * @tc.name: getAbilityMissionSnapshot 
    * @tc.desc: Recent task stack provides current screenshot.(AsyncCallback)
    */
 it('ACTS_MissionSnapshot_0300', 0, async function (done) {
    console.debug('ACTS_MissionSnapshot_0300====<begin');
    var subscriber;
    var setTimeout = 5000;
    var currentAlertTimeout;
    var CommonEventSubscribeInfo = {
        events: ["ACTS_MissionSnapshot_OnActive",
            "ACTS_MissionSnapshot_onShow"
        ],
    };
    try {
        commonEvent.createSubscriber(CommonEventSubscribeInfo).then(async (data) => {
            console.debug("=ACTS_MissionSnapshot_0300 createSubscriber .then(data)=======>"
                + ("json data【") + JSON.stringify(data) + (" 】")
                + " ,data=" + data);
            subscriber = data;
            await commonEvent.subscribe(subscriber, async (err, data) => {
                clearTimeout(currentAlertTimeout);
                console.debug("=ACTS_MissionSnapshot_0300 subscribe (err,data)=======>"
                    + ("json err【") + JSON.stringify(err) + (" 】")
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,err=" + err + " ,data=" + data);
                unsubscribe("subscribe", subscriber);

                var m_missionId = -1;
                var m_topAbility_bundleName = "";
                var m_topAbility_abilityName = "";
                var upperLimit = 10;
                await abilityManager.getActiveAbilityMissionInfos(upperLimit, async (err, data) => {
                    console.debug("=ACTS_MissionSnapshot_0300 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】")
                        + ("json data【") + JSON.stringify(data) + (" 】")
                        + " ,err=" + err + " ,data=" + data);
                    console.debug('ACTS_MissionSnapshot_0300 AbilityMissionInfo data.length ====>'
                        + data.length);
                    if (!data.length) {
                        m_missionId = -99;
                        m_topAbility_bundleName = "";
                        m_topAbility_abilityName = "";
                        expect("if (!data.length) ").assertEqual(0);
                        unsubscribe("if (!data.length) ", subscriber);
                        console.debug('ACTS_MissionSnapshot_0300====<end 0')
                        done();
                    } else {
                        m_missionId = data[0].missionId;
                        m_topAbility_bundleName = data[0].topAbility.bundleName;
                        m_topAbility_abilityName = data[0].topAbility.abilityName;
                    }
                    console.debug("=ACTS_MissionSnapshot_0300 m_missionId====>" + m_missionId);
                    await abilityManager.getAbilityMissionSnapshot(m_missionId, (err, data) => {
                        expect(err.code).assertEqual(0);
                        console.debug("=ACTS_MissionSnapshot_0300 then data====>"
                            + ("json data 【") + JSON.stringify(data) + (" 】") + " , " + data);
                        try {
                            expect(data.topAbility.bundleName).assertEqual(m_topAbility_bundleName);
                            expect(data.topAbility.abilityName).assertEqual(m_topAbility_abilityName);
                            data.snapshot.getPixelBytesNumber().then(function (data){
                                console.debug("=ACTS_MissionSnapshot_0300 ====> "
                                +("data.snapshot.getPixelBytesNumber()=" + data))
                                expect(data != 0).assertEqual(true);
                                unsubscribe(".then() ", subscriber);
                                console.debug('ACTS_MissionSnapshot_0300====<end')
                                done();
                                })
                        } catch (err) {
                            expect(err).assertEqual("0");
                            unsubscribe("catch (err) get ", subscriber);
                            console.debug('ACTS_MissionSnapshot_0300====<end catch (err) get')
                            done();
                        }                      
                    })
                });
            });
        });

        await featureAbility.startAbility(
            {
                want:
                {
                    bundleName: "com.amsst.amsMissionSnapshotTestSingleton",
                    abilityName: "com.amsst.amsMissionSnapshotTestSingleton.MainAbility",
                },
            },
        );
    } catch (err) {
        expect(err).assertEqual("0");
        console.debug('ACTS_MissionSnapshot_0300====<end catch(err)')
        done();
    }
    console.debug('ACTS_MissionSnapshot_0300====< ')
    currentAlertTimeout = setTimeout(() => {
        console.debug('ACTS_MissionSnapshot_0300====<end setTimeout');
        unsubscribe("setTimeout ", subscriber);
        expect("Event False").assertEqual("Event timeout");
        done();
    }, setTimeout);
})

    /*
    * @tc.number: ACTS_MissionSnapshot_0400
    * @tc.name: getAbilityMissionSnapshot 
    * @tc.desc: Recent task stack provides current screenshot.(Promise)
    */
    it('ACTS_MissionSnapshot_0400', 0, async function (done) {
        console.debug('ACTS_MissionSnapshot_0400====<begin');
        try {
            abilityManager.getAbilityMissionSnapshot(-1)
                .then(function (data) {
                    console.debug("=ACTS_MissionSnapshot_0400 then data====>"
                        + ("json data 【") + JSON.stringify(data) + (" 】") + " , " + data);
                    expect(data.topAbility.bundleName).assertEqual("");
                    expect(data.topAbility.abilityName).assertEqual("");
                    console.debug('ACTS_MissionSnapshot_0400====<end');
                    done();
                }).catch(function (err) {
                    console.debug("=ACTS_MissionSnapshot_0400 catch err ====>"
                        + ("json err 【") + JSON.stringify(err) + (" 】 "));
                    expect(err).assertEqual("false");
                    console.debug('ACTS_MissionSnapshot_0400====<end .catch(err)');
                    done();
                });
        } catch (err) {
            expect(err).assertEqual("0");
            console.debug('ACTS_MissionSnapshot_0400====<end catch(err)');
            done();
        }
    })

    /*
    * @tc.number: ACTS_MissionSnapshot_0500
    * @tc.name: getAbilityMissionSnapshot 
    * @tc.desc: Recent task stack provides current screenshot.(Promise)
    */
    it('ACTS_MissionSnapshot_0500', 0, async function (done) {
        console.debug('ACTS_MissionSnapshot_0500====<begin');
        var m_missionId = -1;
        var m_topAbility_bundleName = "";
        var m_topAbility_abilityName = "";
        try {
            var upperLimit = 10;
            await abilityManager.getActiveAbilityMissionInfos(upperLimit, async (err, data) => {
                console.debug("=ACTS_MissionSnapshot_0500 err,data=======>"
                    + ("json err【") + JSON.stringify(err) + (" 】")
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,err=" + err + " ,data=" + data);
                console.debug('ACTS_MissionSnapshot_0500 AbilityMissionInfo data.length ====>: ' + data.length);
                if (!data.length) {
                    m_missionId = -99;
                    m_topAbility_bundleName = "";
                    m_topAbility_abilityName = "";
                    expect("if (!data.length) ").assertEqual(0);
                    console.debug('ACTS_MissionSnapshot_0500====<end 0')
                    done();
                } else {
                    m_missionId = data[0].missionId;
                    m_topAbility_bundleName = data[0].topAbility.bundleName;
                    m_topAbility_abilityName = data[0].topAbility.abilityName;
                }
                console.debug("=ACTS_MissionSnapshot_0500 m_missionId====>" + m_missionId);
                abilityManager.getAbilityMissionSnapshot(m_missionId)
                    .then(function (data) {
                        console.debug("=ACTS_MissionSnapshot_0500 then data====>"
                            + ("json data 【") + JSON.stringify(data) + (" 】") + " , " + data);
                        expect(data.topAbility.bundleName).assertEqual(m_topAbility_bundleName);
                        expect(data.topAbility.abilityName).assertEqual(m_topAbility_abilityName);
                        console.debug("=ACTS_MissionSnapshot_0500 err,data=======> JSON.stringify(data.snapshot)="
                            + JSON.stringify(data.snapshot) + " , " + data.snapshot);
                        try {
                            data.snapshot.getPixelBytesNumber().then(function (data){
                                console.debug("=ACTS_MissionSnapshot_0500 ====> "
                                +("data.snapshot.getPixelBytesNumber()=" + data))
                                expect(data != 0).assertEqual(true);
                                console.debug('ACTS_MissionSnapshot_0500====<end')
                                done();
                                })
                        } catch (err) {
                            expect(err).assertEqual("0");
                            console.debug('ACTS_MissionSnapshot_0500====<end catch (err) get')
                            done();
                        }
                        // console.debug('ACTS_MissionSnapshot_0500====<end')
                        // done();
                    }).catch(function (err) {
                        console.debug("=ACTS_MissionSnapshot_0500 catch err ====>"
                            + ("json err 【") + JSON.stringify(err) + (" 】 "));
                        expect(err).assertEqual("false");
                        console.debug('ACTS_MissionSnapshot_0500====<end .catch(err)')
                        done();
                    });
            });
        } catch (err) {
            expect(err).assertEqual("0");
            console.debug('ACTS_MissionSnapshot_0500====<end catch(err)');
            done();
        }
    })

    function unsubscribe(caller, subscriber) {
        commonEvent.unsubscribe(subscriber, (err, data) => {
            console.debug("=ACTS_MissionSnapshot_unsubscribe (err,data)=======>"
                + (caller)
                + (" , json err【") + JSON.stringify(err) + (" 】")
                + ("json data【") + JSON.stringify(data) + (" 】")
                + " ,err=" + err + " ,data=" + data);
        });
    }
    /*
    * @tc.number: ACTS_MissionSnapshot_0600
    * @tc.name: getAbilityMissionSnapshot 
    * @tc.desc: Recent task stack provides current screenshot.(Promise)
    */
    it('ACTS_MissionSnapshot_0600', 0, async function (done) {
        console.debug('ACTS_MissionSnapshot_0600====<begin');
        var subscriber;
        var setTimeout = 5000;
        var currentAlertTimeout;
        var CommonEventSubscribeInfo = {
            events: ["ACTS_MissionSnapshot_OnActive",
                "ACTS_MissionSnapshot_onShow"
            ],
        };
        try {
            commonEvent.createSubscriber(CommonEventSubscribeInfo).then(async (data) => {
                console.debug("=ACTS_MissionSnapshot_0600 createSubscriber .then(data)=======>"
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,data=" + data);
                subscriber = data;
                await commonEvent.subscribe(subscriber, async (err, data) => {
                    clearTimeout(currentAlertTimeout);
                    console.debug("=ACTS_MissionSnapshot_0600 subscribe (err,data)=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】")
                        + ("json data【") + JSON.stringify(data) + (" 】")
                        + " ,err=" + err + " ,data=" + data);
                    unsubscribe("subscribe", subscriber);

                    var m_missionId = -1;
                    var m_topAbility_bundleName = "";
                    var m_topAbility_abilityName = "";
                    var upperLimit = 10;
                    await abilityManager.getActiveAbilityMissionInfos(upperLimit, (err, data) => {
                        console.debug("=ACTS_MissionSnapshot_0600 err,data=======>"
                            + ("json err【") + JSON.stringify(err) + (" 】")
                            + ("json data【") + JSON.stringify(data) + (" 】")
                            + " ,err=" + err + " ,data=" + data);
                        console.debug('ACTS_MissionSnapshot_0600 AbilityMissionInfo data.length ====>'
                            + data.length);
                        if (!data.length) {
                            m_missionId = -99;
                            m_topAbility_bundleName = "";
                            m_topAbility_abilityName = "";
                            expect("if (!data.length) ").assertEqual(0);
                            unsubscribe("if (!data.length) ", subscriber);
                            console.debug('ACTS_MissionSnapshot_0600====<end 0')
                            done();
                        } else {
                            m_missionId = data[0].missionId;
                            m_topAbility_bundleName = data[0].topAbility.bundleName;
                            m_topAbility_abilityName = data[0].topAbility.abilityName;
                        }
                        console.debug("=ACTS_MissionSnapshot_0600 m_missionId====>" + m_missionId);
                        abilityManager.getAbilityMissionSnapshot(m_missionId).then(function (data) {
                            console.debug("=ACTS_MissionSnapshot_0600 then data====>"
                                + ("json data 【") + JSON.stringify(data) + (" 】") + " , " + data);
                            try {
                                expect(data.topAbility.bundleName).assertEqual(m_topAbility_bundleName);
                                expect(data.topAbility.abilityName).assertEqual(m_topAbility_abilityName);
                                console.debug("=ACTS_MissionSnapshot_0600=====> JSON.stringify(data.snapshot)="
                                         + JSON.stringify(data.snapshot) + " , " + data.snapshot);
                                data.snapshot.getPixelBytesNumber().then(function (data){
                                    console.debug("=ACTS_MissionSnapshot_0600 ====> "
                                        +("data.snapshot.getPixelBytesNumber()=" + data))
                                    expect(data != 0).assertEqual(true);
                                    unsubscribe(".then() ", subscriber);
                                    console.debug('ACTS_MissionSnapshot_0600====<end')
                                    done();
                                    })
                            } catch (err) {
                                expect(err).assertEqual("0");
                                unsubscribe("catch (err) get ", subscriber);
                                console.debug('ACTS_MissionSnapshot_0600====<end catch (err) get')
                                done();
                            }
                        }).catch(function (err) {
                            console.debug("=ACTS_MissionSnapshot_0600 catch err ====>"
                                + ("json err 【") + JSON.stringify(err) + (" 】 "));
                            expect(err).assertEqual("false");
                            console.debug('ACTS_MissionSnapshot_0600====<end .catch(err)')
                            unsubscribe(" .catch(err)", subscriber);
                            done();
                        });
                    });
                });
            });
            await featureAbility.startAbility(
                {
                    want:
                    {
                        bundleName: "com.amsst.amsMissionSnapshotTestSingletonS",
                        abilityName: "com.amsst.amsMissionSnapshotTestSingletonS.MainAbility",
                    },
                },
            );

        } catch (err) {
            expect("0").assertEqual(err);
            console.debug('ACTS_MissionSnapshot_0600====<end catch(err)')
            done();
        }
        console.debug('ACTS_MissionSnapshot_0600====< 333')
        currentAlertTimeout = setTimeout(() => {
            console.debug('ACTS_MissionSnapshot_0600====<end setTimeout');
            unsubscribe("setTimeout ", subscriber);
            expect("Event False").assertEqual("Event timeout");
            done();
        }, setTimeout);
    })
})