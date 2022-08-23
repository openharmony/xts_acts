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
import AccessibilityExtensionAbility from '@ohos.application.AccessibilityExtensionAbility';
import commonEvent from '@ohos.commonEvent';
import {GestureEventTest} from './GestureEventTest';

class AccessibilityExtAbility extends AccessibilityExtensionAbility {
    tester: GestureEventTest = undefined;

    onConnect() {
        console.info("[Demo] AccessibilityExtAbility onConnect");
        this.tester = new GestureEventTest(this.context);
        this.tester.init();

        let commonEventPublishData = {
            data: 'connect'
        }
        commonEvent.publish('onConnectState', commonEventPublishData, publishCallback);

        function publishCallback(err) {
            console.info("onConnect====>onConnect publish call back result:" + JSON.stringify(err));
        }
    }

    onDisconnect() {
        console.info("[Demo] AccessibilityExtAbility onDisconnect");
        let commonEventPublishData = {
            data: 'disconnect'
        }
        commonEvent.publish('onConnectState', commonEventPublishData, publishCallback);

        function publishCallback(err) {
            console.info("onDisconnect====>onConnect publish call back result:" + JSON.stringify(err));
        }

        this.tester.clear();
        this.tester = undefined;
    }

    onAccessibilityEvent(accessibilityEvent) {
        let type = accessibilityEvent.eventType;
        console.info("[Demo] AccessibilityExtAbility onAccessibilityEvent: " + type);
        if (type === 'left' || type === 'leftThenRight' || type === 'leftThenUp' || type === 'leftThenDown'
        || type === 'right' || type === 'rightThenLeft' || type === 'rightThenUp' || type === 'rightThenDown'
        || type === 'up' || type === 'upThenLeft' || type === 'upThenRight' || type === 'upThenDown'
        || type === 'down' || type === 'downThenLeft' || type === 'downThenRight' || type === 'downThenUp') {
            let commonEventPublishData = {
                data: 'accessibilityEvent',
                parameters: {
                    eventType: type 
                }
            }
            commonEvent.publish('accessibilityEvent', commonEventPublishData, publishCallback);
        }

        function publishCallback(err) {
            console.info("[Demo] onAccessibilityEvent====>accessibilityEvent publish call back result:" + JSON.stringify(err));
        }
    }
}

export default AccessibilityExtAbility;