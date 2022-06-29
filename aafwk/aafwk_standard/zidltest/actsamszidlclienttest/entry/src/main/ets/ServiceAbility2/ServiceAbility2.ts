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
import ZidlTestServiceStubOneway from './zidlToolOneWay/interface_attribute_declaratoin_oneway_stub';
import {voidVoidFirstCallback} from './zidlToolOneWay/i_interface_attribute_declaratoin_oneway'
import {voidVoidSecondCallback} from './zidlToolOneWay/i_interface_attribute_declaratoin_oneway'
import {voidVoidThirdCallback} from './zidlToolOneWay/i_interface_attribute_declaratoin_oneway'

const SUCCESS = 0;
const FAIL = 1;

class ZidlTestImpOneway extends ZidlTestServiceStubOneway {
    voidVoidFirst(callback: voidVoidFirstCallback) {
        console.log("ZidlTest Server ACTS_Zidl_Js2JsSingle_0100_1 called");
        callback(SUCCESS);
    }

    voidVoidSecond(callback: voidVoidSecondCallback) {
        console.log("ZidlTest Server ACTS_Zidl_Js2JsSingle_0100_2 called");
        callback(SUCCESS);
    }

    voidVoidThird(callback: voidVoidThirdCallback) {
        console.log("ZidlTest Server ACTS_Zidl_Js2JsSingle_0100_3 called");
        callback(SUCCESS);
    }
}

export default class ServiceAbility2 extends ServiceExtension {
    onCreate(want,startId) {
        globalThis.abilityWant = want;
        console.log('ZidlClientTest ServiceAbility2 onCreate, want: ' + want.abilityName);
    }

    onRequest(want, startId) {
        console.log('ZidlClientTest ServiceAbility2 onRequest, want: ' + want.abilityName
        + ', startId: ' + startId);
    }

    onConnect(want) {
        console.log('ZidlClientTest ServiceAbility2 onConnect, want:' + want.abilityName);
        return new ZidlTestImpOneway('connect');
    }

    onDisconnect(want) {
        console.log('ZidlClientTest ServiceAbility2 onDisconnect, want:' + want.abilityName);
    }

    onDestroy() {
        console.log('ZidlClientTest ServiceAbility2 onDestroy');
    }
};
