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
// import commonEvent from '@ohos.commonevent'

export default class ServiceAbility extends ServiceExtension {
    onCreate(want, startId) {
        globalThis.abilityWant = want;
        console.log('ACTS_NewWant ServiceAbility onCreate, want: ' + want.abilityName);
    }

    onRequest(want, startId) {
        console.log('ACTS_NewWant ServiceAbility onRequest, want: ' + want.abilityName + ', startId: ' + startId);
    }

    onConnect(want) {
        var connId;
        console.log('ACTS_NewWant ServiceAbility onConnect, want:' + want.abilityName);
        globalThis.extensionContext = this.context
        if (globalThis.abilityWant.action == 'connectServiceAbility0700') {
            console.log('ACTS_NewWant ServiceAbility onConnect, action:' + globalThis.abilityWant.action);
            this.context.startAbility(
                {
                    bundleName: "com.example.newwanthap",
                    abilityName: "com.example.newwanthapa.SecondAbility",
                    action: "restartSecondAbility0700"
                },
            )
        }
    }

    onDisconnect(want) {
        console.log('ACTS_NewWant ServiceAbility onDisconnect, want:' + want.abilityName);
    }

    onDestroy() {
        console.log('ACTS_NewWant ServiceAbility onDestroy');
    }
};
