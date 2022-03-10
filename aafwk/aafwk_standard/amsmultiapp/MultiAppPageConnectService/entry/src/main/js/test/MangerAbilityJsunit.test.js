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
import bundle from "@ohos.bundle"
import featureAbility from '@ohos.ability.featureAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import commonEvent from '@ohos.commonEvent'


describe('ActsAmsMultiPageAppConnectService', function () {
    console.info('----ActsAmsMultiPageAppConnectService----');
    beforeAll(async function (done) {
        console.info('----ActsAmsMultiPageAppConnectService----');
        var connId = await featureAbility.connectAbility(
            {
                bundleName: "com.example.actsamsmultiapppageconnectservice",
                abilityName: "com.example.actsamsmultiapppageconnectservice.MainAbility",
            },
            {
                onConnect: onConnectCallback,
                onDisconnect: onDisconnectCallback,
                onFailed: onFailedCallback,
            },
        );
        console.log('ActsAmsMultiPageAppConnectService ConnectAbility connId : ' + connId);
        done();
    function onConnectCallback(element, remote) {
        console.log('ActsAmsMultiPageAppConnectService ConnectAbility onConnect element.deviceId : '
        + element.deviceId)
        console.log('ActsAmsMultiPageAppConnectService ConnectAbility onConnect element.bundleName : '
        + element.bundleName)
        console.log('ActsAmsMultiPageAppConnectService ConnectAbility onConnect element.abilityName : '
        + element.abilityName)
        console.log('ActsAmsMultiPageAppConnectService ConnectAbility onConnect remote : ' + remote);
        console.log('ActsAmsMultiPageAppConnectService ConnectAbility onConnect remote 是否为proxy:'
        + (remote instanceof rpc.RemoteProxy));
    }

    function onDisconnectCallback(element) {
        commonEvent.publish("DISCONNECT", ()=>{console.log('disconnect finish')});
        console.log('ActsAmsMultiPageAppConnectService ConnectAbility onDisconnect element.deviceId : '
        + element.deviceId)
        console.log('ActsAmsMultiPageAppConnectService ConnectAbility onDisconnect element.bundleName : '
        + element.bundleName)
        console.log('ActsAmsMultiPageAppConnectService ConnectAbility onDisconnect element.abilityName : '
        + element.abilityName)
    }

    function onFailedCallback(code) {
        console.log('ActsAmsMultiPageAppConnectService ConnectAbility onFailed errCode : ' + code)
    }
    });


    /*
     * @tc.number    : AMS_MultiApp_0300
     * @tc.name      : connectAbility : connect pageAbility
     * @tc.desc      : pageAbility->serviceAbility
     */
    it('AMS_MultiApp_0300', 0, async function (done) {
        var subscriber;
        var CommonEventSubscribeInfo = {
            events: ["ACTS_MultiAppPageConnectService_onConnect1",
            "ACTS_MultiAppPageConnectService_onConnect2"],
        };
        function unsubscribe(caller, subscriber) {
            commonEvent.unsubscribe(subscriber, (err, data) => {
                console.debug("=ACTS_MissionSnapshot_unsubscribe (err,data)=======>"
                    + (caller)
                    + (" , json err【") + JSON.stringify(err) + (" 】")
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,err=" + err + " ,data=" + data);
                    done();
            });
        }
        commonEvent.createSubscriber(CommonEventSubscribeInfo).then(async (data) => {
            console.debug("=AMS_MultiApp_0300 createSubscriber .then(data)=======>"
                + ("json data【") + JSON.stringify(data) + (" 】")
                + " ,data=" + data);
            subscriber = data;
            await commonEvent.subscribe(subscriber, async (err, data) => {
                console.debug("=AMS_MultiApp_0300 subscribe (err,data)=======>"
                    + ("json err【") + JSON.stringify(err) + (" 】")
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,err=" + err + " ,data=" + data);
                    if (data.event == "ACTS_MultiAppPageConnectService_onConnect2")
                    {
                        console.debug("=======AMS_MultiApp_0300 Ontology=======");
                        expect(data.event).assertEqual("ACTS_MultiAppPageConnectService_onConnect2");
                    }
                    else if (data.event == "ACTS_MultiAppPageConnectService_onConnect1")
                    {
                        console.debug("=======AMS_MultiApp_0300 Clone=======");
                        expect(data.event).assertEqual("ACTS_MultiAppPageConnectService_onConnect1");
                    }   
                unsubscribe("subscribe", subscriber);            
            });
        });
    })
})
