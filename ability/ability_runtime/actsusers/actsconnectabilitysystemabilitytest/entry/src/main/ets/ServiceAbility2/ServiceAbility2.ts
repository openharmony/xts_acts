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

import ServiceExtension from '@ohos.application.ServiceExtensionAbility'
import commonEvent from "@ohos.commonEvent"
import rpc from '@ohos.rpc';
export default class ServiceAbility2 extends ServiceExtension {
    onCreate(want) {
        console.log('ServiceAbility2 onCreate');
        globalThis.abilityWant = want;
    }

    onDestory(){
        console.log('ServiceAbility2 onDestory');
    }

    onRequest(want,startId) {
        console.log('ServiceAbility2 onRequest');
    }

    onConnect(want) {
        console.log('ServiceAbility2 onConnect');
        commonEvent.publish("AMS_ConnectAbility_0700_commonEvent", () => {
            console.log("publish Publish AMS_ConnectAbility_0700_commonEvent callback");
        })
        commonEvent.publish("AMS_ConnectAbility_0900_commonEvent", () => {
            console.log("publish Publish AMS_ConnectAbility_0900_commonEvent callback");
        })
        commonEvent.publish("AMS_ConnectAbility_1000_commonEvent", () => {
            console.log("publish Publish AMS_ConnectAbility_1000_commonEvent callback");
        })
        commonEvent.publish("AMS_ConnectAbility_1100_commonEvent", () => {
            console.log("publish Publish AMS_ConnectAbility_1100_commonEvent callback");
        })
        commonEvent.publish("AMS_ConnectAbility_1200_commonEvent", () => {
            console.log("publish Publish AMS_ConnectAbility_1200_commonEvent callback");
        })
        return new rpc.RemoteObject('connect');
    }


    onDisconnect(want) {
        console.log('ServiceAbility2 onDisconnect, want:' + want.abilityName);
    }

    onDestroy() {
        console.log('ServiceAbility2 onDestroy');
    }
}