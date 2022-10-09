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
import rpc from "@ohos.rpc";
import Want from '@ohos.application.Want';
// import commonEvent from '@ohos.commonEvent'

export default class ServiceAbility extends ServiceExtensionAbility {
    onCreate(want) {
        console.log('AppSelector ServiceAbility onCreate, want: ' + want.abilityName);
    }

    onConnect(want: Want) {
        console.log('AppSelector ServiceAbility onConnect, want:' + want.abilityName);
        this.context.startAbility(
            {
                "bundleName": "imagekrelyhap",
                "abilityName": "MainAbility",
                parameters: {
                    startByService: true
                }
            }, (error, data) => {
            console.info("ACTS_AppSelector_3600 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
            console.info("ACTS_AppSelector_3600 startAbility end");
        })
        // console.log("[Demo] MainAbility onForeground want: " + JSON.stringify(want))
        // let commonEventData = {
        //     code: 0,
        //     data: 'imagekrelyhap',
        //     parameters: {
        //         abilityName: want.abilityName,
        //         bundleName: want.bundleName,
        //         type: want.type,
        //         uri: want.parameters.uri,
        //         startByService:want.parameters.startByService
        //     }
        // }
        // commonEvent.publish('AppSelector', commonEventData, (err) => {
        //     console.log('======>imagekrelyhap MainAbility published<======')
        // })
        
        return new rpc.RemoteObject('connect');
    }

    onDisconnect(want) {
        console.log('AppSelector ServiceAbility onDisconnect, want:' + want.abilityName);
    }

    onDestroy() {
        console.log('ServiceAbility onDestroy');
    }
};