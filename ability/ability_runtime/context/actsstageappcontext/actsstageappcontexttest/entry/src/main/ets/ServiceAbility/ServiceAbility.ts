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

export default class ServiceAbility extends ServiceExtension {
    onCreate(want) {
        console.log('ActsStageAppContextTest ServiceAbility onCreate, want: ' + want.abilityName);
        globalThis.serviceExtenxionAbilityContext = this.context
    }

    onRequest(want, startId) {
        console.log('ServiceAbility onRequest, want: ' + want.abilityName + ', startId: ' + startId);
    }

    onConnect(want) {
        console.log('ActsStageAppContextTest ServiceAbility onConnect, want:' + want.abilityName);
        if (want.action == 'StartAbilityPromise') {
            console.log('stub SerivceAbilityServer OnConnect start 1');
            console.log('=======startAbilityPromise=======');
            return new rpc.RemoteObject('ServiceAbility');
        }
    }

    onDisconnect(want) {
        console.log('ActsStageAppContextTest ServiceAbility onDisconnect, want:' + want.abilityName);
    }

    onDestroy() {
        console.log('ActsStageAppContextTest ServiceAbility onDestroy');
    }
}