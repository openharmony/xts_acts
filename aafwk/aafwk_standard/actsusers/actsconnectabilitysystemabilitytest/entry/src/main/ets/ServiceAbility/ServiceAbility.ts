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
import commonEvent from '@ohos.commonEvent'
import ServiceExtensionAbility from '@ohos.application.ServiceExtensionAbility'

var conn = -1;
function publishCallBackOne () {
    console.log("========Publish CallBack AMS_ConnectAbility_0100_commonEvent========");
}
function publishCallBackTwo () {
    console.log("========Publish CallBack AMS_ConnectAbility_0200_commonEvent========");
}
function publishCallBackThree () {
    console.log("========Publish CallBack AMS_ConnectAbility_0300_commonEvent========");
}
function publishCallBackFour () {
    console.log("========Publish CallBack AMS_ConnectAbility_0400_commonEvent========");
}
function publishCallBackFive () {
    console.log("========Publish CallBack AMS_ConnectAbility_0500_commonEvent========");
}
function publishCallBackSix () {
    console.log("========Publish CallBack AMS_ConnectAbility_0600_commonEvent========");
}
function publishCallBackzero () {
    console.log("========Publish CallBack AMSc_disonnectAbility_0100_commonEvent========");
}
function publishCallBackttwo () {
    console.log("========Publish CallBack AMSc_disonnectAbility_0200_commonEvent========");
}

export default class ServiceAbility extends ServiceExtensionAbility {
    onCreate(want) {
        console.log('ServiceAbility onCreate, want: ' + want.abilityName);
    }

    onRequest(want, startId) {
        console.log('ServiceAbility onRequest, want: ' + want.abilityName + ', startId: ' + startId);

        console.log('ServiceAbility registerApplicationStateObserver begin');
        console.log('ServiceAbility registerApplicationStateObserver end, conn: ' + conn);
    }

    onConnect(want) {
        console.log('ServiceAbility onConnect, want:' + want.abilityName);
        let extensionContext = this.context
        if (want.action == "one") {
            commonEvent.publish("AMS_ConnectAbility_0100_commonEvent", publishCallBackOne);
        }
        ;
        if (want.action == "two") {
            commonEvent.publish("AMS_ConnectAbility_0200_commonEvent", publishCallBackTwo);
        }
        ;
        if (want.action == "Three") {
            commonEvent.publish("AMS_ConnectAbility_0300_commonEvent", publishCallBackThree);
        }
        ;
        if (want.action == "Four") {
            commonEvent.publish("AMS_ConnectAbility_0400_commonEvent", publishCallBackFour);
        }
        ;
        if (want.action == "Five") {
            commonEvent.publish("AMS_ConnectAbility_0500_commonEvent", publishCallBackFive);
        }
        ;
        if (want.action == "Six") {
            commonEvent.publish("AMS_ConnectAbility_0600_commonEvent", publishCallBackSix);
        }
        ;
        if (want.action == "Seven") {
            extensionContext.connectAbility(
                {
                    bundleName: "com.example.actsconnectabilitysystemabilitytest",
                    abilityName: "com.example.actsconnectabilitysystemabilitytest.ServiceAbility2",
                }
            );
        };
        if (want.action == "Eight") {
            extensionContext.connectAbility(
                {
                    bundleName: "com.example.actsconnectabilitysystemabilitytest",
                    abilityName: "com.example.actsconnectabilitysystemabilitytest.ServiceAbility3",
                }
            );
        };
        if (want.action == "Nine") {
            console.log('connectAbility 111');
            let num = extensionContext.connectAbility(
                {
                    bundleName: 'com.example.actsconnectabilitysystemabilitytest',
                    abilityName: 'com.example.actsconnectabilitysystemabilitytest.ServiceAbility2'
                })
            setTimeout(()=>{
                extensionContext.disconnectAbility(num).then(()=>{
                    console.log('in disconnectAbility');
                })
            },1000)

        };
        if (want.action == "Ten") {
            console.log('connectAbility 222');
            let num = extensionContext.connectAbility(
                {
                    bundleName: 'com.example.actsconnectabilitysystemabilitytest',
                    abilityName: 'com.example.actsconnectabilitysystemabilitytest.ServiceAbility2'
                })
            setTimeout(()=>{
                extensionContext.disconnectAbility(num).then(()=>{
                    console.log('in disconnectAbility2');
                })
            },1000)

        };
        if (want.action == "Ten one") {
            console.log('connectAbility 333');
            let num = extensionContext.connectAbility(
                {
                    bundleName: 'com.example.actsconnectabilitysystemabilitytest',
                    abilityName: 'com.example.actsconnectabilitysystemabilitytest.ServiceAbility2'
                })
            setTimeout(()=>{
                extensionContext.disconnectAbility(2222).then(()=>{
                    console.log('in disconnectAbility3');
                })
            },1000)

        };
        if (want.action == "Ten two") {
            console.log('connectAbility 444');
            let num = extensionContext.connectAbility(
                {
                    bundleName: 'com.example.actsconnectabilitysystemabilitytest',
                    abilityName: 'com.example.actsconnectabilitysystemabilitytest.ServiceAbility2'
                })
            setTimeout(()=>{
                extensionContext.disconnectAbility(2222).then(()=>{
                    console.log('in disconnectAbility4');
                })
            },1000)

        };
    }

    onDisconnect(want) {
        console.log('ServiceAbility onDisconnect, want:' + want.abilityName);
        commonEvent.publish("AMSc_disonnectAbility_0100_commonEvent",publishCallBackzero);
        commonEvent.publish("AMSc_disonnectAbility_0200_commonEvent",publishCallBackttwo);
    }

    onDestroy() {
        console.log('ServiceAbility onDestroy');
    }
}

