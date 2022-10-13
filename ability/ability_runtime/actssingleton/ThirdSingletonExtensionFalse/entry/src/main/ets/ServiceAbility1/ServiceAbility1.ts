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
import rpc from '@ohos.rpc';
import ServiceExtension from '@ohos.application.ServiceExtensionAbility'

export default class ServiceAbility1 extends ServiceExtension {
    onCreate(want) {
        console.log('ServiceAbility1 onCreate, want: ' + want.abilityName);
    }

    onRequest(want, startId) {
        console.log('ServiceAbility1 onRequest, want: ' + want.abilityName + ', startId: ' + startId);
    }

    onConnect(want) {
        console.log('ServiceAbility1 onConnect, want:' + want.abilityName);
        if (want.action == 'StartAbilityPromise') {
            return new rpc.RemoteObject('ServiceAbility1');
        }
    }

    onDisconnect(want) {
        console.log('ServiceAbility1 onDisconnect, want:' + want.abilityName);
    }

    onDestroy() {
        console.log('ServiceAbility1 onDestroy');
    }
}