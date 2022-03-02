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
import featureAbility from '@ohos.ability.featureAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import commonEvent from '@ohos.commonEvent'

const START_ABILITY_TIMEOUT = 4000;
var subscriberInfoMultiApp0700 = {
    events: ["subscriberInfoMultiAppServiceByServiceStart", "DISCONNECT"]
};
var subscriberInfoMultiApp0800 = {
    events: ["subscriberInfoMultiAppServiceByServiceConnect", "DISCONNECT"]
};
var subscriberInfoMultiApp0600 = {
    events: ["subscriberInfoMultiAppPageByServiceStart", "DISCONNECT"]
};
describe('MultiAppTester', function () {
    console.info('----MultiAppTester----');
    let bundleName = "com.example.amsmultiappservicestarter";
    let abilityName = "com.example.amsmultiappservicestarter.MainAbility";
    var mRemote;
    function onConnectCallback(element, remote) {
        console.log('StartMultiAppTester ConnectAbility onConnect element.deviceId : ' + element.deviceId)
        console.log('StartMultiAppTester ConnectAbility onConnect element.bundleName : ' + element.bundleName)
        console.log('StartMultiAppTester ConnectAbility onConnect element.abilityName : ' + element.abilityName)
        console.log('StartMultiAppTester ConnectAbility onConnect element.uri : ' + element.uri)
        console.log('StartMultiAppTester ConnectAbility onConnect element.shortName : ' + element.shortName)
        console.log('StartMultiAppTester ConnectAbility onConnect remote : ' + remote);
        mRemote = remote;
        console.log('StartMultiAppTester ConnectAbility onConnect remote 是否为proxy:' 
            + (remote instanceof rpc.RemoteProxy));
    }
    function onDisconnectCallback(element) {
        commonEvent.publish("DISCONNECT", ()=>{console.log('disconnect finish1')});
        console.log('StartMultiAppTester ConnectAbility onDisconnect element.deviceId : ' + element.deviceId)
        console.log('StartMultiAppTester ConnectAbility onDisconnect element.bundleName : ' + element.bundleName)
        console.log('StartMultiAppTester ConnectAbility onDisconnect element.abilityName : ' + element.abilityName)
        console.log('StartMultiAppTester ConnectAbility onDisconnect element.uri : ' + element.uri)
        console.log('StartMultiAppTester ConnectAbility onDisconnect element.shortName : ' + element.shortName)
    }
    function onFailedCallback(code) {
        console.log('StartMultiAppTester ConnectAbility onFailed errCode : ' + code)
    }

    /*
    * @tc.number: AMS_MultiApp_0700
    * @tc.name: Connects a service ability, which is used to start another cloned service ability.
    * @tc.desc: Check the event data of executor service ability publishes
    */
    it('AMS_MultiApp_0700', 0, async function (done) {
        console.log('AMS_MultiApp_0700====<begin');
        var subscriber;
        let id;
        let connId;
        let events = new Map();

        function subscribeCallBack(err, data) {
            console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
            events.set(data.event, 0);
            if(events.size == 1) {
                if(data.event == "DISCONNECT") {
                    expect(data.event).assertEqual("DISCONNECT");
                    commonEvent.unsubscribe(subscriber, unSubscribeCallback)
                    done();
                } else {
                    clearTimeout(id);
                    expect(data.event).assertEqual("subscriberInfoMultiAppServiceByServiceStart");
                    expect(data.data).assertEqual("notCloned");
                    expect(data.code).assertEqual(1);
                    featureAbility.disconnectAbility(
                        connId,
                        (error, data) => {
                            console.log('MultiAppService DisconnectAbility result errCode : '
                                + error.code + " data: " + data)
                        },
                    );
                }
            } else {
                expect(data.event).assertEqual("DISCONNECT");
                commonEvent.unsubscribe(subscriber, unSubscribeCallback)
                done();
            }
            
        }

        commonEvent.createSubscriber(subscriberInfoMultiApp0700).then(async (data) => {
            console.debug("====>Create Subscriber====>");
            subscriber = data;
            await commonEvent.subscribe(subscriber, subscribeCallBack);
        })

        function unSubscribeCallback() {
            console.debug("====>UnSubscribe CallBack====>");
        }

        function timeout() {
            expect().assertFail();
            console.debug('StartMultiAppTester timeout');
            featureAbility.disconnectAbility(
                connId,
                (error, data) => {
                    console.log('StartMultiAppTester DisconnectAbility result errCode : '
                        + error.code + " data: " + data)
                },
            );
        }
        id = setTimeout(timeout, START_ABILITY_TIMEOUT);
        console.log('StartMultiAppTester ConnectAbility id : ' + id);
        connId = await featureAbility.connectAbility(
            {
                bundleName: bundleName,
                abilityName: abilityName,
                action: "StartSerciveExecutor"
            },
            {
                onConnect: onConnectCallback,
                onDisconnect: onDisconnectCallback,
                onFailed: onFailedCallback,
            },
        );
        console.log('StartMultiAppTester ConnectAbility connId : ' + connId);
    })

    /*
    * @tc.number: AMS_MultiApp_0800
    * @tc.name: Connects a service ability, which is used to connect another cloned service ability.
    * @tc.desc: Check the event data of executor service ability publishes
    */
     it('AMS_MultiApp_0800', 0, async function (done) {
        console.log('AMS_MultiApp_0800====<begin');
        var subscriber;
        let id;
        let connId;
        let events = new Map();

        function subscribeCallBack(err, data) {
            console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
            events.set(data.event, 0);
            if(events.size == 1) {
                if(data.event == "DISCONNECT") {
                    expect(data.event).assertEqual("DISCONNECT");
                    commonEvent.unsubscribe(subscriber, unSubscribeCallback)
                    done();
                } else {
                    clearTimeout(id);
                    expect(data.event).assertEqual("subscriberInfoMultiAppServiceByServiceConnect");
                    expect(data.data).assertEqual("notCloned");
                    expect(data.code).assertEqual(1);
                    featureAbility.disconnectAbility(
                        connId,
                        (error, data) => {
                            console.log('MultiAppService DisconnectAbility result errCode : '
                                + error.code + " data: " + data)
                        },
                    );
                }
            } else {
                expect(data.event).assertEqual("DISCONNECT");
                commonEvent.unsubscribe(subscriber, unSubscribeCallback)
                done();
            }
            
        }

        commonEvent.createSubscriber(subscriberInfoMultiApp0800).then(async (data) => {
            console.debug("====>Create Subscriber====>");
            subscriber = data;
            await commonEvent.subscribe(subscriber, subscribeCallBack);
        })

        function unSubscribeCallback() {
            console.debug("====>UnSubscribe CallBack====>");
        }

        function timeout() {
            expect().assertFail();
            console.debug('StartMultiAppTester timeout');
            featureAbility.disconnectAbility(
                connId,
                (error, data) => {
                    console.log('StartMultiAppTester DisconnectAbility result errCode : '
                        + error.code + " data: " + data)
                },
            );
        }
        id = setTimeout(timeout, START_ABILITY_TIMEOUT);
        console.log('StartMultiAppTester ConnectAbility id : ' + id);
        connId = await featureAbility.connectAbility(
            {
                bundleName: bundleName,
                abilityName: abilityName,
                action: "ConnectSerciveExecutor"
            },
            {
                onConnect: onConnectCallback,
                onDisconnect: onDisconnectCallback,
                onFailed: onFailedCallback,
            },
        );
        console.log('StartMultiAppTester ConnectAbility connId : ' + connId);
    })

    /*
    * @tc.number: AMS_MultiApp_0600
    * @tc.name: Connects a service ability, which is used to start a cloned page ability.
    * @tc.desc: Check the event data of executor page ability publishes
    */
    it('AMS_MultiApp_0600', 0, async function (done) {
        console.log('AMS_MultiApp_0600====<begin');
        console.log('========StartConnect called');
        var subscriber;
        let id;
        let connId;
        let events = new Map();

        function subscribeCallBack(err, data) {
            console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
            events.set(data.event, 0);

            if(events.size == 1) {
                if(data.event == "DISCONNECT") {
                    expect(data.event).assertEqual("DISCONNECT");
                    commonEvent.unsubscribe(subscriber, unSubscribeCallback)
                    done();
                } else {
                    clearTimeout(id);
                    expect(data.event).assertEqual("subscriberInfoMultiAppPageByServiceStart");
                    expect(data.data).assertEqual("notCloned");
                    expect(data.code).assertEqual(1);
                    featureAbility.disconnectAbility(
                        connId,
                        (error, data) => {
                            console.log('MultiAppService DisconnectAbility result errCode : ' 
                                + error.code + " data: " + data);
                        },
                    );
                }
            } else {
                expect(data.event).assertEqual("DISCONNECT");
                commonEvent.unsubscribe(subscriber, unSubscribeCallback)
                done();
            }
            
        }
        commonEvent.createSubscriber(subscriberInfoMultiApp0600).then(async (data) => {
            console.debug("====>Create Subscriber====>");
            subscriber = data;
            await commonEvent.subscribe(subscriber, subscribeCallBack);
        })

        function unSubscribeCallback() {
            console.debug("====>UnSubscribe CallBack====>");
        }

        function timeout() {
            expect().assertFail();
            console.debug('StartMultiAppTester timeout');
            featureAbility.disconnectAbility(
                connId,
                (error, data) => {
                    console.log('StartMultiAppTester DisconnectAbility result errCode : '
                         + error.code + " data: " + data);
                },
            );
        }
        id = setTimeout(timeout, START_ABILITY_TIMEOUT);
        console.log('StartMultiAppTester AMS_MultiApp_0600 ConnectAbility id : ' + id);
        connId = await featureAbility.connectAbility(
            {
                bundleName: bundleName,
                abilityName: abilityName,
                action: "StartPageExecutor"
            },
            {
                onConnect: onConnectCallback,
                onDisconnect: onDisconnectCallback,
                onFailed: onFailedCallback,
            },
        );
        console.log('StartMultiAppTester AMS_MultiApp_0600 ConnectAbility connId : ' + connId);
    })
})
