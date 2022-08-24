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

import ServiceExtension from '@ohos.application.ServiceExtensionAbility';
import Want from '@ohos.application.Want';
import rpc from '@ohos.rpc';

export default class ServiceAbility extends ServiceExtension {
    onCreate(want:Want) {
        globalThis.abilityWant = want;
        console.log('ServiceAbility onCreate, want: ' + want.abilityName);
    }

    onRequest(want, startId) {
        console.log('ServiceAbility onRequest, want: ' + want.abilityName + ', startId: ' + startId);
        console.log('ServiceAbility registerApplicationStateObserver begin');
    }

    onConnect(want) {
        console.log('ServiceAbility onConnect, want:' + want.abilityName);
        globalThis.extensionContext = this.context
        if (want.action == 'getExtensionInfotwo') {
            this.context.startAbility(
                {
                    bundleName: 'com.example.startabilityforresult',
                    abilityName: 'com.example.startabilityforresult.MainAbility2'
                },
                {
                    windowMode: 0,
                    displayId: 10,
                }).then(() => {
                console.log("====>end startAbility====>success!")
            })
            console.log('stub SerivceAbilityServer OnConnect start 2');
        }
        return new rpc.RemoteObject('connect');
    }

    onDisconnect(want) {
        console.log('ServiceAbility onDisconnect, want:' + want.abilityName);
    }

    onDestroy() {
        console.log('ServiceAbility onDestroy');
    }
}