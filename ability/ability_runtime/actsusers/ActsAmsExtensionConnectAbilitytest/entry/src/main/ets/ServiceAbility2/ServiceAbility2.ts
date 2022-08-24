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
import ServiceExtension from '@ohos.application.ServiceExtensionAbility'
import rpc from '@ohos.rpc';
var conn = -1;
function onConnectCallback(element, remote) {
    console.debug('onConnectCallback ====> element='
        + JSON.stringify(element) + " , " + element);
    console.debug('onConnectCallback ====> remote='
        + JSON.stringify(remote) + " , " + remote);
  }
  function onDisconnectCallback(element) {
      console.debug('onDisconnectCallback ====> element='
          + JSON.stringify(element) + " , " + element);
  }
  function onFailedCallback(code) {
      console.debug('onFailedCallback ====> code='
          + JSON.stringify(code) + " , " + code)
  }

export default class ServiceAbility2 extends ServiceExtension {
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
            console.log('connectAbility 222');
            let num = this.context.connectAbility(
                {
                    bundleName: 'com.example.userservicesystemapi7',
                    abilityName: 'com.example.userservicesystemapi7.ServiceAbility'
                }, 
                 {
                    onConnect: onConnectCallback,
                    onDisconnect: onDisconnectCallback,
                    onFailed: onFailedCallback,
                  }
                )
            setTimeout(()=>{
                this.context.disconnectAbility(num).then(()=>{
                    console.log('in disconnectAbility2');
                })
            },2000)
            return new rpc.RemoteObject('connect');
        };

    onDisconnect(want) {
        console.log('ServiceAbility onDisconnect, want:' + want.abilityName);
    }

    onDestroy() {
        console.log('ServiceAbility onDestroy');
    }
}

