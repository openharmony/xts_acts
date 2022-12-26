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

import ServiceExtension from '@ohos.app.ability.ServiceExtensionAbility'
import commonEvent from "@ohos.commonEvent";
import Want from '@ohos.application.Want';
import rpc from '@ohos.rpc';
export default class ServiceAbility extends ServiceExtension {
    onCreate(want:Want) {
        globalThis.abilityWant = want;
        globalThis.serviceContext = this.context
        let direction = this.context.config.direction
        let pointerDervice = this.context.config.hasPointerDevice
        let AbilityInfo = this.context.extensionAbilityInfo.bundleName
        console.log('ServiceAbility onCreate, want: ' + want.abilityName);
        var CommonEventPublishData = {
            parameters: {
                "config": direction,
                "poniterDevices": pointerDervice,
                "AbilityInfo":AbilityInfo
            }
        }
        commonEvent.publish("ExtensionConext_StartAbility", CommonEventPublishData, (err) => {
            console.info("ExtensionConext_StartAbility onCreate");
        });
    }

    onRequest(want, startId) {
        console.log('ServiceAbility onRequest, want: ' + want.abilityName + ', startId: ' + startId);
        console.log('ServiceAbility registerApplicationStateObserver begin');
        setTimeout(()=>{
            this.context.terminateSelf().then((data) => {
                console.info("terminateSelf data = " + JSON.stringify(data));
            }).catch((err) => {
                console.info("terminateSelf err = " + JSON.stringify(err));
            });
        }, 3000)
    }

    onConnect(want) {
        console.log('ServiceAbility onConnect, want:' + want.abilityName);
        return null;
    }

    onDisconnect(want) {
        console.log('ServiceAbility onDisconnect, want:' + want.abilityName);
    }

    onDestroy() {
        console.log('ServiceAbility onDestroy');
    }
}