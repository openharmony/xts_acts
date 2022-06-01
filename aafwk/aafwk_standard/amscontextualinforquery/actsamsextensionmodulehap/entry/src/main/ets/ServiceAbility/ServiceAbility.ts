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
import Extension from '@ohos.application.ServiceExtensionAbility'
import commonEvent from '@ohos.commonevent'


export default class ServiceExtAbility extends Extension {
    onCreate(want) {
        console.info('mxh ServiceAbility onCreate**');

    }

    onRequest(want, startId) {
        console.info('mxh ServiceAbility onRequest**');
    }

    onConnect(want) {
        console.info('mxh ServiceAbility onConnect**');
        commonEvent.publish("ACTS_ConnectAbility_0100_CommonEvent", {
            parameters: {
                extensionAbilityInfo : JSON.stringify(this.context.extensionAbilityInfo),
            }
        } ,(err) => {
            console.log("Demo Publish CallBack MainAbility_Start_CommonEvent")
        });
        console.log('Demo SerivceAbilityServer OnConnect start 1');
    }

    onDisconnect(want) {
        console.info('mxh ServiceAbility onDisConnect**');
    }

    onDestroy() {
        console.info('mxh ServiceAbility onDestroy**');
    }
};