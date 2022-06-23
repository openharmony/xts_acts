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
import ServiceExtensionAbility from '@ohos.application.ServiceExtensionAbility'
import commonEvent from '@ohos.commonEvent'
import Want from '@ohos.application.Want';
import rpc from '@ohos.rpc';
function publishCallBackOne () {
    console.log("========Publish CallBack AMS_ConnectAbility_0400_commonEvent========");
}
var conn = -1;
function onConnectCallback(element) {
    console.log('connectAbilityWithAccount onConnect element.bundleName : ' + element.bundleName)
    console.log('connectAbilityWithAccount onConnect element.abilityName : ' + element.abilityName)
}
function onDisconnectCallback(element) {
    console.log('connectAbilityWithAccount onDisconnect element.bundleName : ' + element.bundleName)
    console.log('connectAbilityWithAccount onDisconnect element.abilityName : ' + element.abilityName)
}
function onFailedCallback(code) {
    console.log('connectAbilityWithAccount onFailed errCode : ' + code)
}
export default class ServiceAbility2 extends ServiceExtensionAbility {
    onCreate(want) {
        console.log('ServiceAbility onCreate, want: ' + want.abilityName);
    }

    onRequest(want, startId) {
        console.log('ServiceAbility onRequest, want: ' + want.abilityName + ', startId: ' + startId);

        console.log('ServiceAbility registerApplicationStateObserver begin');
        console.log('ServiceAbility registerApplicationStateObserver end, conn: ' + conn);
    }

    onConnect(want: Want) {
        console.log('ServiceAbility onConnect, want:' + want.abilityName);
        let extensionContext = this.context

            console.log('connectAbility 222');
            let num = extensionContext.connectAbility(
                {
                    bundleName: 'com.example.actsserviceabilityrelytest',
                    abilityName: 'com.example.actsserviceabilityrelytest.ServiceAbility'
                }, {
                    onConnect: onConnectCallback,
                    onDisconnect: onDisconnectCallback,
                    onFailed: onFailedCallback,
                },)
            setTimeout(()=>{
                extensionContext.disconnectAbility(num).then(()=>{
                    console.log('in disconnectAbility2');
                })
            },1000)
            commonEvent.publish("AMS_ConnectAbility_0400_commonEvent", publishCallBackOne);
			return new rpc.RemoteObject('connect');
        };

    onDisconnect(want) {
        console.log('ServiceAbility onDisconnect, want:' + want.abilityName);
    }

    onDestroy() {
        console.log('ServiceAbility onDestroy');
    }
}

