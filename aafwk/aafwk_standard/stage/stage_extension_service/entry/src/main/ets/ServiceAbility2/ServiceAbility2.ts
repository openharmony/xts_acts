/**
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
import ServiceExtension from "@ohos.application.ServiceExtension"

export default class MyServiceAbility extends ServiceExtension {

    onCreate(want){
        console.log('ServiceAbility2 onCreate' + JSON.stringify(want));
        globalThis.extensionContext2 = this.context;
        globalThis.lifeCycleList.push('ServiceAbility2_onCreate');
        console.log('ServiceAbility2 lifeCycleList is' + JSON.stringify(globalThis.lifeCycleList));
    }

    onDestroy(){
        console.log('ServiceAbility2 onDestroy');
        globalThis.lifeCycleList.push('ServiceAbility2_onDestroy');
        console.log('ServiceAbility2 lifeCycleList is' + JSON.stringify(globalThis.lifeCycleList));
    }

    onRequest(want,startId){
        console.log('ServiceAbility2 onRequest' + JSON.stringify(want) + JSON.stringify(startId));
        globalThis.lifeCycleList.push('ServiceAbility2_onRequest');
        globalThis.startId2 = startId;
        globalThis.serviceWant2 = want;
        console.log("ServiceAbility2 serviceWant2 is " + JSON.stringify(globalThis.serviceWant2));
        console.log('ServiceAbility2 lifeCycleList is' + JSON.stringify(globalThis.lifeCycleList));
        setTimeout(()=>{
            this.context.terminateSelf().then((data) => {
                console.log("ServiceAbility2 terminateSelf data: " + JSON.stringify(data))
            }).catch((error) => {
                console.log("ServiceAbility2 terminateSelf error: " + JSON.stringify(error))
            });
        }, 1000);
    }

    onConnect(want){
        console.log('ServiceAbility2 onConnect' + JSON.stringify(want));
        globalThis.lifeCycleList.push('ServiceAbility2_onConnect');
        console.log('ServiceAbility2 lifeCycleList is' + JSON.stringify(globalThis.lifeCycleList));
    }

    onDisconnect(want){
        console.log('ServiceAbility2 onDisconnect' + JSON.stringify(want));
        globalThis.lifeCycleList.push('ServiceAbility2_onDisconnect');
        console.log('ServiceAbility2 lifeCycleList is' + JSON.stringify(globalThis.lifeCycleList));
    }

    onReconnect(want){
        console.log('ServiceAbility2 onReconnect' + JSON.stringify(want));
        globalThis.lifeCycleList.push('ServiceAbility2_onReconnect');
        console.log('ServiceAbility2 lifeCycleList is' + JSON.stringify(globalThis.lifeCycleList));
    }
}
