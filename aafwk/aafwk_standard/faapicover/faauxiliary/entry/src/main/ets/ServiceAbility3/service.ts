/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import rpc from "@ohos.rpc";
import commonEvent from '@ohos.commonEvent';
import ability_particleAbility from '@ohos.ability.particleAbility';

class StubTest3 extends rpc.RemoteObject {
    constructor(des) {
        if (typeof des === 'string') {
            super(des);
        }
        else {
            return null;
        }
    }
    queryLocalInterface(descriptor) {
        return null;
    }
    getInterfaceDescriptor() {
        return "";
    }
    sendRequest(code, data, reply, options) {
        return null;
    }
    getCallingPid() {
        return 0;
    }
    getCallingUid() {
        return 0;
    }
    attachLocalInterface(localInterface, descriptor) { }
    onRemoteRequest(code, data, reply, options) {
        console.info(printLogS1 + "onRemoteRequest");
        if (code == 1) {
            console.info(printLogS1 + "onRemoteRequest code 1");
            let op1 = data.readInt();
            let op2 = data.readInt();
            console.info(printLogS1 + "onRemoteRequest op1 = " + op1 + ", op2 = " + op2);
            reply.writeInt(op1 + op2);
        }
        else {
            console.info(printLogS1 + "onRemoteRequest code = " + code);
        }
        return true;
    }
}

var printLogS1 = "Fa:Auxiliary:ServiceAbility3:";
var listPushS1 = "Fa_Auxiliary_ServiceAbility3_";
export default {
    onStart() {
        console.info(printLogS1 + 'onStart');
    },
    onStop() {
        console.info(printLogS1 + 'onStop');
    },
    onCommand(want, startId) {
        console.info(printLogS1 + 'onCommand');
    },
    onConnect(want) {
        console.info(printLogS1 + 'onConnect');

        try {
            let flag1 = false
            let flag2 = false
            let flag3 = false
            let subscriber = null
            let subscribeInfo = {
                events: ["Fa_Auxiliary_ServiceAbility2_onConnect", "Fa_Auxiliary_ServiceAbility2_onDisconnect"]
            }
            function SubscribeInfoCallback(err, data) {
                console.info(printLogS1 + "===SubscribeInfoCallback===" + JSON.stringify(data))
                if (data.event == "Fa_Auxiliary_ServiceAbility2_onConnect") {
                    ability_particleAbility.disconnectAbility(num).then((data) => {
                        console.info(printLogS1 + "disconnectAbility data = " + JSON.stringify(data));
                    }).catch((err) => {
                        console.info(printLogS1 + "disconnectAbility err = " + JSON.stringify(err));

                        var status = {
                            parameters: {
                                status: false
                            }
                        }
                        commonEvent.publish(listPushS1 + "onConnect", status, (err) => {
                            console.info(printLogS1 + listPushS1 + "onConnect");
                        });
                    });
                }
                if (data.event == "Fa_Auxiliary_ServiceAbility2_onDisconnect") {
                    commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback);
                }
            }
            function UnSubscribeInfoCallback(err, data) {
                console.info(printLogS1 + "===UnSubscribeInfoCallback===")
                setTimeout(()=>{
                    var status = {
                        parameters: {
                            status: false
                        }
                    }
                    if (flag1 && flag2 && !flag3) {
                        status = {
                            parameters: {
                                status: true
                            }
                        }
                    }
                    commonEvent.publish(listPushS1 + "onConnect", status, (err) => {
                        console.info(printLogS1 + listPushS1 + "onConnect");
                    });
                }, 1000)
            }
            commonEvent.createSubscriber(subscribeInfo, (err, data) => {
                console.info(printLogS1 + "===CreateSubscriberCallback===")
                subscriber = data
                commonEvent.subscribe(subscriber, SubscribeInfoCallback)
            })

            let options = {
                onConnect: function (elementName, proxy) {
                    flag1 = true
                    console.info(printLogS1 + 'Ext onConnect SUCCESS, elementName = ' + JSON.stringify(elementName));
                    if (proxy == null) {
                        console.info(printLogS1 + 'Ext proxy == null');
                        return;
                    }
                    let option = new rpc.MessageOption();
                    let data = new rpc.MessageParcel();
                    let reply = new rpc.MessageParcel();
                    data.writeInt(1);
                    data.writeInt(99);
                    proxy.sendRequest(1, data, reply, option, (result) => {
                        let msg = result.reply.readInt();
                        console.info(printLogS1 + 'Ext connect, msg = ' + msg);
                    });
                },
                onDisconnect: function (elementName) {
                    flag2 = true
                    console.info(printLogS1 + 'Ext onDisconnect, elementName = ' + JSON.stringify(elementName));
                },
                onFailed: function (number) {
                    flag3 = true
                    console.info(printLogS1 + 'Ext onFailed, number = ' + number);
                }
            };
            let wantNum = {
                bundleName: 'ohos.acts.aafwk.test.faauxiliary',
                abilityName: 'ohos.acts.aafwk.test.faauxiliary.ServiceAbility2'
            }
            let num = ability_particleAbility.connectAbility(wantNum, options)
        } catch (err) {
            console.info(printLogS1 + "catch err = " + JSON.stringify(err));

            var status = {
                parameters: {
                    status: false
                }
            }
            commonEvent.publish(listPushS1 + "onConnect", status, (err) => {
                console.info(printLogS1 + listPushS1 + "onConnect");
            });;
        }

        return new StubTest3("Test1");
    },
    onDisconnect(want) {
        console.info(printLogS1 + 'onDisconnect');
    },
    onReconnect(want) {
        console.info(printLogS1 + 'onReconnect');
    }
};