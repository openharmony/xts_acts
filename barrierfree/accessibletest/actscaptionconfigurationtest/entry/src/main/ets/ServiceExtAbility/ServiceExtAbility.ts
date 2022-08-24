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
import commonEvent from '@ohos.commonEvent'
import AccessibilityExtensionAbility from '@ohos.application.AccessibilityExtensionAbility'
const logTag = "[xtsLog]"
class ServiceExtAbility extends AccessibilityExtensionAbility {
    onConnect() {
        const context = this.context;
        console.info(logTag + "AccessibilityAll onAbilityConnected");
        var commonEventSubscribeInfo = {
            events: ["on_assist_change", "execute_accessibility_event"]
        }

        function subscriberCallback(err, data) {
            console.info(logTag + "AccessibilityALLD subscriberCallback start");
            console.info(logTag + "AccessibilityALLD receive event err:" + JSON.stringify(err));
            console.info(logTag + "AccessibilityALLD receive event data:" + JSON.stringify(data));
            console.info(logTag + "AccessibilityALLD subscriberCallback end");
        }

        var subscriber
        commonEvent.createSubscriber(commonEventSubscribeInfo).then(function (data) {
            console.info(logTag + " AccessibilityALLD createSubscriber Start====")
            subscriber = data;
            commonEvent.subscribe(subscriber, subscriberCallback);
            console.info(logTag + " AccessibilityALLD createSubscriber End====")
        })
        console.info(logTag + " AccessibilityALLD onShow End====")
    }

    onAccessibilityEvent(accessibilityEvent) {
        printAccessibilityEvent(accessibilityEvent);
        return true;
    }

    onKeyEvent(keyEvent) {
        console.info(" onKeyEvent");
        console.info(logTag + "onKeyEvent KeyInterception AccessibilityAllD: " + JSON.stringify(keyEvent));
        return true;
    }
}

const printAccessibilityEvent = (accessibilityEvent) => {
    console.info(logTag + "AccessibilityAllD onAccessibilityEvent Start");
    console.info(logTag + "AccessibilityAllD onAccessibilityEvent accessibilityEvent=" + JSON.stringify(accessibilityEvent));
    console.info(logTag + "AccessibilityAllD onAccessibilityEvent End");
}

export default ServiceExtAbility
