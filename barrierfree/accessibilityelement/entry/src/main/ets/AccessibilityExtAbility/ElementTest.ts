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
import commonEvent from '@ohos.commonEvent';
import accessibility from '@ohos.accessibility';

const invalidString = 'xxx';
const invalidValue = 1;

export class ElementTest {
    private context = undefined;
    private subScriber = undefined;
    private events: Array<any> = [];

    constructor(context) {
        this.context = context;
    }

    async init() {
        this.subScriber = await commonEvent.createSubscriber({events: ['caseExecute']});
        commonEvent.subscribe(this.subScriber, (err, data) => {
            console.info('ElementTest subscribe callback data:' + JSON.stringify(data));
            this.processCase(data);
        });
    }

    clear() {
        commonEvent.unsubscribe(this.subScriber);
        this.subScriber = undefined;
        this.context = undefined;
        this.events.length = 0;
    }

    pushEvent(event) {
        this.events.push(event);
    }

    private publishCaseResult(caseName: string, result: boolean) {
        let commonEventPublishData = {
            data: (result ? 'pass' : 'fail'),
            parameters: {
                case: caseName
            }
        }
        commonEvent.publish('caseResult', commonEventPublishData, (err) => {
            console.info("ElementTest publishCaseResult finish: " + JSON.stringify(commonEventPublishData));
        });
    }

    private async processCase(data) {
        let caseName = data.data;
        console.info('ElementTest processCase: ' + caseName);
        this.events.length = 0;
        let result = false;
        switch (caseName) {
            case 'AccessibilityElementTest_attributeNames_asyncPromise_0100':
                result = await this.executeAttributeNamesPromise(caseName);
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_0200':
                result = await this.executeAttributeValuePromise(caseName, 'componentId', 'number');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_0300':
                result = await this.executeAttributeValuePromise(caseName, 'pageId', 'number');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_0500':
                result = await this.executeAttributeValuePromise(caseName, 'inspectorKey', 'string');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_0600':
                result = await this.executeAttributeValuePromise(caseName, 'bundleName', 'string');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_0700':
                result = await this.executeAttributeValuePromise(caseName, 'componentType', 'string');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_0800':
                result = await this.executeAttributeValuePromise(caseName, 'inputType', 'number');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_0900':
                result = await this.executeAttributeValuePromise(caseName, 'text', 'string');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_1000':
                result = await this.executeAttributeValuePromise(caseName, 'hintText', 'string');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_1100':
                result = await this.executeAttributeValuePromise(caseName, 'description', 'string');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_1200':
                result = await this.executeAttributeValuePromise(caseName, 'resourceName', 'string');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_1400':
                result = await this.executeAttributeValuePromise(caseName, 'textLengthLimit', 'number');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_1500':
                result = await this.executeAttributeValuePromiseRect(caseName, 'rect');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_1600':
                result = await this.executeAttributeValuePromise(caseName, 'checkable', 'boolean');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_1700':
                result = await this.executeAttributeValuePromise(caseName, 'checked', 'boolean');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_1800':
                result = await this.executeAttributeValuePromise(caseName, 'focusable', 'boolean');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_1900':
                result = await this.executeAttributeValuePromise(caseName, 'isVisible', 'boolean');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_2000':
                result = await this.executeAttributeValuePromise(caseName, 'accessibilityFocused', 'boolean');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_2100':
                result = await this.executeAttributeValuePromise(caseName, 'selected', 'boolean');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_2200':
                result = await this.executeAttributeValuePromise(caseName, 'clickable', 'boolean');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_2300':
                result = await this.executeAttributeValuePromise(caseName, 'longClickable', 'boolean');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_2400':
                result = await this.executeAttributeValuePromise(caseName, 'isEnable', 'boolean');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_2500':
                result = await this.executeAttributeValuePromise(caseName, 'isPassword', 'boolean');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_2600':
                result = await this.executeAttributeValuePromise(caseName, 'scrollable', 'boolean');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_2700':
                result = await this.executeAttributeValuePromise(caseName, 'editable', 'boolean');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_2900':
                result = await this.executeAttributeValuePromise(caseName, 'pluralLineSupported', 'boolean');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_3100':
                result = await this.executeAttributeValuePromise(caseName, 'isHint', 'boolean');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_3300':
                result = await this.executeAttributeValuePromise(caseName, 'itemCount', 'number');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_3400':
                result = await this.executeAttributeValuePromise(caseName, 'currentIndex', 'number');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_3500':
                result = await this.executeAttributeValuePromise(caseName, 'startIndex', 'number');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_3600':
                result = await this.executeAttributeValuePromise(caseName, 'endIndex', 'number');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_3700':
                result = await this.executeAttributeValuePromise(caseName, 'valueMax', 'number');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_3800':
                result = await this.executeAttributeValuePromise(caseName, 'valueMin', 'number');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_3900':
                result = await this.executeAttributeValuePromise(caseName, 'valueNow', 'number');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_4200':
                result = await this.executeAttributeValuePromise(caseName, 'error', 'string');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_4300':
                await this.executeAttributeValuePromiseTriggerAction(caseName);
                return;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_4400':
                result = await this.executeAttributeValuePromise(caseName, 'textMoveUnit', 'string');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_4500':
                result = await this.executeAttributeValuePromiseArray(caseName, 'contents', 'string');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_4600':
                result = await this.executeAttributeValuePromise(caseName, 'lastContent', 'string');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_4700':
                result = await this.executeAttributeValuePromise(caseName, 'parent', 'object');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_4800':
                result = await this.executeAttributeValuePromiseArray(caseName, 'children', 'object');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_5200':
                result = await this.executeAttributeValuePromise(caseName, 'isActive', 'boolean', true);
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_5300':
                result = await this.executeAttributeValuePromiseRect(caseName, 'screenRect', true);
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_5400':
                result = await this.executeAttributeValuePromise(caseName, 'layer', 'number', true);
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_5500':
                result = await this.executeAttributeValuePromise(caseName, 'type', 'string', true);
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_5600':
                result = await this.executeAttributeValuePromiseRootElement(caseName);
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_5700':
                result = await this.executeAttributeValuePromise(caseName, 'windowId', 'number');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_5800':
                result = await this.executeAttributeValuePromise(caseName, 'isFocused', 'boolean');
                break;
            case 'AccessibilityElementTest_findElement_asyncPromise_5900':
                result = await this.executeFindElementPromise5900(caseName);
                break;
            case 'AccessibilityElementTest_actionNames_asyncPromise_6000':
                result = await this.executeActionNamesPromise(caseName);
                break;
            case 'AccessibilityElementTest_performAction_asyncPromise_6100':
                result = await this.executePerformActionPromise(caseName, 'accessibilityFocus');
                break;
            case 'AccessibilityElementTest_performAction_asyncPromise_6200':
                result = await this.executePerformActionPromise(caseName, 'clearAccessibilityFocus');
                break;
            case 'AccessibilityElementTest_performAction_asyncPromise_6300':
                result = await this.executePerformActionPromise(caseName, 'focus');
                break;
            case 'AccessibilityElementTest_performAction_asyncPromise_6400':
                result = await this.executePerformActionPromise(caseName, 'clearFocus');
                break;
            case 'AccessibilityElementTest_performAction_asyncPromise_6500':
                result = await this.executePerformActionPromise(caseName, 'clearSelection');
                break;
            case 'AccessibilityElementTest_performAction_asyncPromise_6600':
                result = await this.executePerformActionPromise(caseName, 'click');
                break;
            case 'AccessibilityElementTest_performAction_asyncPromise_6700':
                result = await this.executePerformActionPromise(caseName, 'longClick');
                break;
            case 'AccessibilityElementTest_performAction_asyncPromise_6800':
                result = await this.executePerformActionPromise(caseName, 'cut');
                break;
            case 'AccessibilityElementTest_performAction_asyncPromise_6900':
                result = await this.executePerformActionPromise(caseName, 'copy');
                break;
            case 'AccessibilityElementTest_performAction_asyncPromise_7000':
                result = await this.executePerformActionPromise(caseName, 'paste');
                break;
            case 'AccessibilityElementTest_performAction_asyncPromise_7100':
                result = await this.executePerformActionPromise(caseName, 'select');
                break;
            case 'AccessibilityElementTest_performAction_asyncPromise_7200':
                result = await this.executePerformActionPromise(caseName, 'setText');
                break;
            case 'AccessibilityElementTest_performAction_asyncPromise_7300':
                result = await this.executePerformActionPromise(caseName, 'delete');
                break;
            case 'AccessibilityElementTest_performAction_asyncPromise_7400':
                result = await this.executePerformActionPromise(caseName, 'scrollForward');
                break;
            case 'AccessibilityElementTest_performAction_asyncPromise_7500':
                result = await this.executePerformActionPromise(caseName, 'scrollBackward');
                break;
            case 'AccessibilityElementTest_performAction_asyncPromise_7600':
                result = await this.executePerformActionPromise(caseName, 'setSelection');
                break;
            case 'AccessibilityElementTest_findElement_asyncPromise_7700':
                result = await this.executeFindElementPromiseByContent(caseName, 'xxx');
                break;
            case 'AccessibilityElementTest_findElement_asyncPromise_7800':
                result = await this.executeFindElementPromiseByContent(caseName, 'button1');
                break;
            case 'AccessibilityElementTest_findElement_asyncPromise_7900':
                result = await this.executeFindElementPromiseByFocusType(caseName, 'accessibility');
                break;
            case 'AccessibilityElementTest_findElement_asyncPromise_8000':
                result = await this.executeFindElementPromiseByFocusType(caseName, 'normal');
                break;
            case 'AccessibilityElementTest_findElement_asyncPromise_8100':
                result = await this.executeFindElementPromiseByFocusDirection(caseName, 'up');
                break;
            case 'AccessibilityElementTest_findElement_asyncPromise_8200':
                result = await this.executeFindElementPromiseByFocusDirection(caseName, 'down');
                break;
            case 'AccessibilityElementTest_findElement_asyncPromise_8300':
                result = await this.executeFindElementPromiseByFocusDirection(caseName, 'left');
                break;
            case 'AccessibilityElementTest_findElement_asyncPromise_8400':
                result = await this.executeFindElementPromiseByFocusDirection(caseName, 'right');
                break;
            case 'AccessibilityElementTest_findElement_asyncPromise_8500':
                result = await this.executeFindElementPromiseByFocusDirection(caseName, 'forward');
                break;
            case 'AccessibilityElementTest_findElement_asyncPromise_8600':
                result = await this.executeFindElementPromiseByFocusDirection(caseName, 'backward');
                break;
            case 'AccessibilityElementTest_findElement_asyncPromise_8700':
                result = await this.executeFindElementPromiseByFocusType(caseName, 'xxx');
                break;
            case 'AccessibilityElementTest_findElement_asyncPromise_8800':
                result = await this.executeFindElementPromiseByFocusDirection(caseName, 'xxx');
                break;
            case 'AccessibilityElementTest_performAction_asyncPromise_8900':
                result = await this.executePerformActionPromise(caseName, 'xxx');
                break;
            case 'AccessibilityElementTest_attributeValue_asyncPromise_9000':
                result = await this.executeAttributeValuePromise(caseName, 'xxx', '');
                break;
            case 'AccessibilityElementTest_attributeNames_asyncCallback_0100':
                await this.executeAttributeNamesCallback(caseName);
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_0200':
                await this.executeAttributeValueCallback(caseName, 'componentId', 'number');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_0300':
                await this.executeAttributeValueCallback(caseName, 'pageId', 'number');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_0500':
                await this.executeAttributeValueCallback(caseName, 'inspectorKey', 'string');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_0600':
                await this.executeAttributeValueCallback(caseName, 'bundleName', 'string');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_0700':
                await this.executeAttributeValueCallback(caseName, 'componentType', 'string');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_0800':
                await this.executeAttributeValueCallback(caseName, 'inputType', 'number');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_0900':
                await this.executeAttributeValueCallback(caseName, 'text', 'string');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_1000':
                await this.executeAttributeValueCallback(caseName, 'hintText', 'string');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_1100':
                await this.executeAttributeValueCallback(caseName, 'description', 'string');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_1200':
                await this.executeAttributeValueCallback(caseName, 'resourceName', 'string');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_1400':
                await this.executeAttributeValueCallback(caseName, 'textLengthLimit', 'number');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_1500':
                await this.executeAttributeValueCallbackRect(caseName, 'rect');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_1600':
                await this.executeAttributeValueCallback(caseName, 'checkable', 'boolean');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_1700':
                await this.executeAttributeValueCallback(caseName, 'checked', 'boolean');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_1800':
                await this.executeAttributeValueCallback(caseName, 'focusable', 'boolean');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_1900':
                await this.executeAttributeValueCallback(caseName, 'isVisible', 'boolean');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_2000':
                await this.executeAttributeValueCallback(caseName, 'accessibilityFocused', 'boolean');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_2100':
                await this.executeAttributeValueCallback(caseName, 'selected', 'boolean');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_2200':
                await this.executeAttributeValueCallback(caseName, 'clickable', 'boolean');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_2300':
                await this.executeAttributeValueCallback(caseName, 'longClickable', 'boolean');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_2400':
                await this.executeAttributeValueCallback(caseName, 'isEnable', 'boolean');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_2500':
                await this.executeAttributeValueCallback(caseName, 'isPassword', 'boolean');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_2600':
                await this.executeAttributeValueCallback(caseName, 'scrollable', 'boolean');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_2700':
                await this.executeAttributeValueCallback(caseName, 'editable', 'boolean');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_2900':
                await this.executeAttributeValueCallback(caseName, 'pluralLineSupported', 'boolean');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_3100':
                await this.executeAttributeValueCallback(caseName, 'isHint', 'boolean');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_3300':
                await this.executeAttributeValueCallback(caseName, 'itemCount', 'number');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_3400':
                await this.executeAttributeValueCallback(caseName, 'currentIndex', 'number');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_3500':
                await this.executeAttributeValueCallback(caseName, 'startIndex', 'number');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_3600':
                await this.executeAttributeValueCallback(caseName, 'endIndex', 'number');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_3700':
                await this.executeAttributeValueCallback(caseName, 'valueMax', 'number');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_3800':
                await this.executeAttributeValueCallback(caseName, 'valueMin', 'number');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_3900':
                await this.executeAttributeValueCallback(caseName, 'valueNow', 'number');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_4200':
                await this.executeAttributeValueCallback(caseName, 'error', 'string');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_4300':
                await this.executeAttributeValueCallbackTriggerAction(caseName);
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_4400':
                await this.executeAttributeValueCallback(caseName, 'textMoveUnit', 'string');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_4500':
                await this.executeAttributeValueCallbackArray(caseName, 'contents', 'string');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_4600':
                await this.executeAttributeValueCallback(caseName, 'lastContent', 'string');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_4700':
                await this.executeAttributeValueCallback(caseName, 'parent', 'object');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_4800':
                await this.executeAttributeValueCallbackArray(caseName, 'children', 'object');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_5200':
                await this.executeAttributeValueCallback(caseName, 'isActive', 'boolean', true);
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_5300':
                await this.executeAttributeValueCallbackRect(caseName, 'screenRect', true);
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_5400':
                await this.executeAttributeValueCallback(caseName, 'layer', 'number', true);
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_5500':
                await this.executeAttributeValueCallback(caseName, 'type', 'string', true);
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_5600':
                await this.executeAttributeValueCallbackRootElement(caseName);
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_5700':
                await this.executeAttributeValueCallback(caseName, 'windowId', 'number');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_5800':
                await this.executeAttributeValueCallback(caseName, 'isFocused', 'boolean');
                return;
            case 'AccessibilityElementTest_findElement_asyncCallback_5900':
                await this.executeFindElementCallback5900(caseName);
                return;
            case 'AccessibilityElementTest_actionNames_asyncCallback_6000':
                await this.executeActionNamesCallback(caseName);
                return;
            case 'AccessibilityElementTest_performAction_asyncCallback_6100':
                await this.executePerformActionCallback(caseName, 'accessibilityFocus');
                return;
            case 'AccessibilityElementTest_performAction_asyncCallback_6200':
                await this.executePerformActionCallback(caseName, 'clearAccessibilityFocus');
                return;
            case 'AccessibilityElementTest_performAction_asyncCallback_6300':
                await this.executePerformActionCallback(caseName, 'focus');
                return;
            case 'AccessibilityElementTest_performAction_asyncCallback_6400':
                await this.executePerformActionCallback(caseName, 'clearFocus');
                return;
            case 'AccessibilityElementTest_performAction_asyncCallback_6500':
                await this.executePerformActionCallback(caseName, 'clearSelection');
                return;
            case 'AccessibilityElementTest_performAction_asyncCallback_6600':
                await this.executePerformActionCallback(caseName, 'click');
                return;
            case 'AccessibilityElementTest_performAction_asyncCallback_6700':
                await this.executePerformActionCallback(caseName, 'longClick');
                return;
            case 'AccessibilityElementTest_performAction_asyncCallback_6800':
                await this.executePerformActionCallback(caseName, 'cut');
                return;
            case 'AccessibilityElementTest_performAction_asyncCallback_6900':
                await this.executePerformActionCallback(caseName, 'copy');
                return;
            case 'AccessibilityElementTest_performAction_asyncCallback_7000':
                await this.executePerformActionCallback(caseName, 'paste');
                return;
            case 'AccessibilityElementTest_performAction_asyncCallback_7100':
                await this.executePerformActionCallback(caseName, 'select');
                return;
            case 'AccessibilityElementTest_performAction_asyncCallback_7200':
                await this.executePerformActionCallback(caseName, 'setText');
                return;
            case 'AccessibilityElementTest_performAction_asyncCallback_7300':
                await this.executePerformActionCallback(caseName, 'delete');
                return;
            case 'AccessibilityElementTest_performAction_asyncCallback_7400':
                await this.executePerformActionCallback(caseName, 'scrollForward');
                return;
            case 'AccessibilityElementTest_performAction_asyncCallback_7500':
                await this.executePerformActionCallback(caseName, 'scrollBackward');
                return;
            case 'AccessibilityElementTest_performAction_asyncCallback_7600':
                await this.executePerformActionCallback(caseName, 'setSelection');
                return;
            case 'AccessibilityElementTest_findElement_asyncCallback_7700':
                await this.executeFindElementCallbackByContent(caseName, 'xxx');
                return;
            case 'AccessibilityElementTest_findElement_asyncCallback_7800':
                await this.executeFindElementCallbackByContent(caseName, 'button1');
                return;
            case 'AccessibilityElementTest_findElement_asyncCallback_7900':
                await this.executeFindElementCallbackByFocusType(caseName, 'accessibility');
                return;
            case 'AccessibilityElementTest_findElement_asyncCallback_8000':
                await this.executeFindElementCallbackByFocusType(caseName, 'normal');
                return;
            case 'AccessibilityElementTest_findElement_asyncCallback_8100':
                await this.executeFindElementCallbackByFocusDirection(caseName, 'up');
                return;
            case 'AccessibilityElementTest_findElement_asyncCallback_8200':
                await this.executeFindElementCallbackByFocusDirection(caseName, 'down');
                return;
            case 'AccessibilityElementTest_findElement_asyncCallback_8300':
                await this.executeFindElementCallbackByFocusDirection(caseName, 'left');
                return;
            case 'AccessibilityElementTest_findElement_asyncCallback_8400':
                await this.executeFindElementCallbackByFocusDirection(caseName, 'right');
                return;
            case 'AccessibilityElementTest_findElement_asyncCallback_8500':
                await this.executeFindElementCallbackByFocusDirection(caseName, 'forward');
                return;
            case 'AccessibilityElementTest_findElement_asyncCallback_8600':
                await this.executeFindElementCallbackByFocusDirection(caseName, 'backward');
                return;
            case 'AccessibilityElementTest_findElement_asyncCallback_8700':
                await this.executeFindElementCallbackByFocusType(caseName, 'xxx');
                return;
            case 'AccessibilityElementTest_findElement_asyncCallback_8800':
                await this.executeFindElementCallbackByFocusDirection(caseName, 'xxx');
                return;
            case 'AccessibilityElementTest_performAction_asyncCallback_8900':
                await this.executePerformActionCallback(caseName, 'xxx');
                return;
            case 'AccessibilityElementTest_attributeValue_asyncCallback_9000':
                await this.executeAttributeValueCallback(caseName, 'xxx', '');
                return;
            default:
                console.warn('ElementTest processCase unknown!!!!!!!!!!');
                break;
        }
        this.publishCaseResult(caseName, result);
    }

    private async getBaseElement() {
        let element = undefined;
        if (this.context) {
            let root = await this.context.getWindowRootElement();
            let elements = await root.findElement('content', 'button1');
            element = elements[0];
        }
        return element;
    }

    private async getWindowElement() {
        let element = undefined;
        if (this.context) {
            let elements = await this.context.getWindows();
            element = elements[0];
        }
        return element;
    }

    private async executeAttributeNamesPromise(caseName: string): Promise<boolean> {
        let result = false;
        let element = await this.getBaseElement();
        if (element) {
            let names = await element.attributeNames();
            console.info('ElementTest executeAttributeNamesPromise ' + caseName + ' names: ' + JSON.stringify(names));
            if (Array.isArray(names)) {
                result = true;
            }
        }
        return result;
    }

    private async executeAttributeValuePromise(caseName: string, input: string, outputType: string,
                                               isWindow: boolean = false): Promise<boolean> {
        let element = undefined;
        if (isWindow) {
            element = await this.getWindowElement();
        } else {
            element = await this.getBaseElement();
        }

        let result = false;
        if (element) {
            try {
                console.info('ElementTest executeAttributeValuePromise ' + caseName + ' input: ' + input + ', outputType: ' + outputType);
                let value = await element.attributeValue(input);
                console.info('ElementTest executeAttributeValuePromise ' + caseName + ' value: ' + JSON.stringify(value));
                if (typeof(value) == outputType) {
                    result = true;
                } else {
                    console.warn('ElementTest executeAttributeValuePromise ' + caseName + ' valueType: ' + typeof(value));
                }
            } catch (e) {
                console.info('ElementTest executeAttributeValuePromise ' + caseName + ' catch(e): ' + JSON.stringify(e));
                if (input == invalidString && e && e.code != 0) {
                    result = true;
                }
            }
        }
        return result;
    }

    private async executeAttributeValuePromiseRect(caseName: string, input: string, isWindow: boolean = false): Promise<boolean> {
        let element = undefined;
        if (isWindow) {
            element = await this.getWindowElement();
        } else {
            element = await this.getBaseElement();
        }

        let result = false;
        if (element) {
            try {
                console.info('ElementTest executeAttributeValuePromiseRect ' + caseName);
                let value = await element.attributeValue(input);
                console.info('ElementTest executeAttributeValuePromiseRect ' + caseName + ' value: ' + JSON.stringify(value));
                if (typeof(value) == 'object' && typeof(value.left) == 'number' && typeof(value.top) == 'number'
                && typeof(value.width) == 'number' && typeof(value.height) == 'number') {
                    result = true;
                } else {
                    console.warn('ElementTest executeAttributeValuePromiseRect ' + caseName + ' valueType: ' + typeof(value));
                }
            } catch (e) {
                console.info('ElementTest executeAttributeValuePromiseRect ' + caseName + ' catch(e): ' + JSON.stringify(e));
            }
        }
        return result;
    }

    private async executeAttributeValuePromiseTriggerAction(caseName: string) {
        console.info('ElementTest executeAttributeValuePromiseTriggerAction ' + caseName + ' start');
        let event = new accessibility.EventInfo({});
        event.type = 'click';
        event.bundleName = 'com.example.accessibilityxts';
        event.triggerAction = 'click';
        await accessibility.sendEvent(event);
        console.info('ElementTest executeAttributeValuePromiseTriggerAction ' + caseName + ' sendEvent finish');

        setTimeout(async () => {
            let result = false;
            console.info('ElementTest executeAttributeValuePromiseTriggerAction ' + caseName + ' events.length: ' + this.events.length);
            for (let e of this.events) {
                let target = e.target;
                let value = await target.attributeValue('triggerAction');
                console.info('ElementTest executeAttributeValuePromiseTriggerAction ' + caseName + ' valueType: ' + typeof(value));
                if (e.eventType == 'click' && typeof(value) == 'string') {
                    result = true;
                    break;
                }
            }
            this.publishCaseResult(caseName, result);
        }, 1000);
    }

    private async executeAttributeValuePromiseRootElement(caseName: string): Promise<boolean> {
        let element = undefined;
        if (this.context) {
            let base = await this.getBaseElement();
            if (base) {
                let baseWindowId = await base.attributeValue('windowId');
                let windows = await this.context.getWindows();
                for (let window of windows) {
                    let windowId = await window.attributeValue('windowId');
                    if (baseWindowId == windowId) {
                        element = window;
                        console.info('ElementTest executeAttributeValuePromiseRootElement ' + caseName + ' found window');
                        break;
                    }
                }
            }
        }

        let result = false;
        if (element) {
            console.info('ElementTest executeAttributeValuePromiseRootElement ' + caseName + ' input: rootElement, outputType: object');
            let value = await element.attributeValue('rootElement');
            console.info('ElementTest executeAttributeValuePromise ' + caseName + ' value: ' + JSON.stringify(value));
            if (typeof(value) == 'object') {
                result = true;
            } else {
                console.warn('ElementTest executeAttributeValuePromise ' + caseName + ' valueType: ' + typeof(value));
            }
        }
        return result;
    }

    private async executeAttributeValuePromiseArray(caseName: string, input: string, outputType: string): Promise<boolean> {
        let result = false;
        let element = await this.getBaseElement();
        if (element) {
            console.info('ElementTest executeAttributeValuePromiseArray ' + caseName + ' input: ' + input + ', outputType: ' + outputType);
            let value = await element.attributeValue(input);
            console.info('ElementTest executeAttributeValuePromiseArray ' + caseName + ' value: ' + JSON.stringify(value));
            if (Array.isArray(value)) {
                if ((value.length == 0)||
                    (value.length > 0 && typeof(value[0]) == outputType)) {
                    result = true;
                }
            }
        }
        return result;
    }

    private async executeActionNamesPromise(caseName: string): Promise<boolean> {
        let result = false;
        let element = await this.getBaseElement();
        if (element) {
            let actions = await element.actionNames();
            console.info('ElementTest executeActionNamesPromise ' + caseName + ' actions: ' + JSON.stringify(actions));
            if (Array.isArray(actions)) {
                if ((actions.length == 0) ||
                    (actions.length > 0 && typeof(actions[0]) == 'string')) {
                    result = true;
                }
            }
        }
        return result;
    }

    private async executePerformActionPromise(caseName: string, action: string, args?: object): Promise<boolean> {
        let result = false;
        let element = await this.getBaseElement();
        if (element) {
            try {
                console.info('ElementTest executePerformActionPromise ' + caseName + ' action: ' + action + ', args: ' + JSON.stringify(args));
                let ret = await element.performAction(action, args);
                console.info('ElementTest executePerformActionPromise ' + caseName + ' ret: ' + JSON.stringify(ret));
                if (typeof(ret) == 'undefined') {
                    result = true;
                }
            } catch (e) {
                console.info('ElementTest executePerformActionPromise ' + caseName + ' catch(e): ' + JSON.stringify(e));
                if (action == invalidString && e && e.code != 0) {
                    if (e.code == 9300005) {
                        result = true;
                    }
                }
            }
        }
        return result;
    }

    private async executeFindElementPromiseByContent(caseName: string, condition: string): Promise<boolean> {
        let result = false;
        let element = await this.getBaseElement();
        if (element) {
            try {
                console.info('ElementTest executeFindElementPromiseByContent ' + caseName + ' condition: ' + condition);
                let found = await element.findElement('content', condition);
                console.info('ElementTest executeFindElementPromiseByContent ' + caseName + ' element: ' + JSON.stringify(found));
                if (Array.isArray(found)) {
                    if (found.length == 0 || typeof(found[0]) == 'object') {
                        result = true;
                    }
                }
            } catch (e) {
                console.info('ElementTest executeFindElementPromiseByContent ' + caseName + ' catch(e): ' + JSON.stringify(e));
                if (condition == invalidString) {
                    result = true;
                }
            }
        }
        return result;
    }

    private async executeFindElementPromiseByFocusType(caseName: string, condition: string): Promise<boolean> {
        let result = false;
        let element = await this.getBaseElement();
        if (element) {
            try {
                console.info('ElementTest executeFindElementPromiseByFocusType ' + caseName + ' condition: ' + condition);
                let action = (condition == 'accessibility') ? 'accessibilityFocus' : 'focus';
                let ret = await element.performAction(action);
                console.info('ElementTest executeFindElementPromiseByFocusType ' + caseName + ' performAction[' + action + '] ret: ' + ret);

                let found = await element.findElement('focusType', condition);
                console.info('ElementTest executeFindElementPromiseByFocusType ' + caseName + ' element: ' + JSON.stringify(found));
                if (typeof(found) == 'object') {
                    result = true;
                }

                if (ret) {
                    let clearAction = (condition == 'accessibility') ? 'clearAccessibilityFocus' : 'clearFocus';
                    await element.performAction(clearAction);
                }
            } catch (e) {
                console.info('ElementTest executeFindElementPromiseByFocusType ' + caseName + ' catch(e): ' + JSON.stringify(e));
                if (condition == invalidString && e && e.code != 0) {
                    result = true;
                }
            }
        }
        return result;
    }

    private async executeFindElementPromiseByFocusDirection(caseName: string, condition: string): Promise<boolean> {
        let result = false;
        let element = await this.getBaseElement();
        if (element) {
            try {
                console.info('ElementTest executeFindElementPromiseByFocusDirection ' + caseName + ' condition: ' + condition);
                let found = await element.findElement('focusDirection', condition);
                console.info('ElementTest executeFindElementPromiseByFocusDirection ' + caseName + ' element: ' + JSON.stringify(found));
                if (typeof(found) == 'object') {
                    result = true;
                }
            } catch (e) {
                console.info('ElementTest executeFindElementPromiseByFocusDirection ' + caseName + ' catch(e): ' + JSON.stringify(e));
                if (condition == invalidString) {
                    result = true;
                }
            }
        }
        return result;
    }

    private async executeFindElementPromise5900(caseName: string): Promise<boolean> {
        let result = false;
        let element = undefined;
        if (this.context) {
            let root = await this.context.getWindowRootElement();
            let elements = await root.findElement('content', 'button2');
            element = elements[0];
        }
        if (element) {
            console.info('ElementTest executeFindElementPromise5900 ' + caseName);
            let found = await element.findElement('focusDirection', 'down');
            console.info('ElementTest executeFindElementPromise5900 ' + caseName + ' element: ' + JSON.stringify(found));
            if (typeof(found) == 'object') {
                result = true;
            }
        }
        return result;
    }

    private async executeAttributeNamesCallback(caseName: string) {
        let result = false;
        let element = await this.getBaseElement();
        if (element) {
            element.attributeNames((err, names) => {
                console.info('ElementTest executeAttributeNamesCallback ' + caseName + ' err: ' + JSON.stringify(err));
                console.info('ElementTest executeAttributeNamesCallback ' + caseName + ' names: ' + JSON.stringify(names));
                if (err.code == 0 && Array.isArray(names)) {
                    result = true;
                }
                this.publishCaseResult(caseName, result);
            });
        }
    }

    private async executeAttributeValueCallback(caseName: string, input: string,
                                                outputType: string, isWindow: boolean = false) {
        let element = undefined;
        if (isWindow) {
            element = await this.getWindowElement();
        } else {
            element = await this.getBaseElement();
        }

        let result = false;
        if (element) {
            console.info('ElementTest executeAttributeValueCallback ' + caseName + ' input: ' + input + ', outputType: ' + outputType);
            element.attributeValue(input, (err, value) => {
                console.info('ElementTest executeAttributeValueCallback ' + caseName + ' err: ' + JSON.stringify(err));
                console.info('ElementTest executeAttributeValueCallback ' + caseName + ' value: ' + JSON.stringify(value));
                if (input == invalidString && err && err.code != 0) {
                    result = true;
                } else if (err.code == 0 && typeof(value) == outputType) {
                    result = true;
                } else {
                    console.warn('ElementTest executeAttributeValueCallback ' + caseName + ' valueType: ' + typeof(value));
                }
                this.publishCaseResult(caseName, result);
            });
        }
    }

    private async executeAttributeValueCallbackRect(caseName: string, input: string, isWindow: boolean = false) {
        let element = undefined;
        if (isWindow) {
            element = await this.getWindowElement();
        } else {
            element = await this.getBaseElement();
        }

        let result = false;
        if (element) {
            console.info('ElementTest executeAttributeValueCallbackRect ' + caseName);
            element.attributeValue(input, (err, value) => {
                console.info('ElementTest executeAttributeValueCallback ' + caseName + ' err: ' + JSON.stringify(err));
                console.info('ElementTest executeAttributeValueCallback ' + caseName + ' value: ' + JSON.stringify(value));
                if (err.code == 0 && typeof(value) == 'object' && typeof(value.left) == 'number'
                && typeof(value.top) == 'number' && typeof(value.width) == 'number' && typeof(value.height) == 'number') {
                    result = true;
                } else {
                    console.warn('ElementTest executeAttributeValueCallbackRect ' + caseName + ' valueType: ' + typeof(value));
                }
                this.publishCaseResult(caseName, result);
            });
        }
    }

    private async executeAttributeValueCallbackTriggerAction(caseName: string) {
        console.info('ElementTest executeAttributeValueCallbackTriggerAction ' + caseName + ' start');
        let event = new accessibility.EventInfo({});
        event.type = 'click';
        event.bundleName = 'com.example.accessibilityxts';
        event.triggerAction = 'click';
        await accessibility.sendEvent(event);
        console.info('ElementTest executeAttributeValueCallbackTriggerAction ' + caseName + ' sendEvent finish');

        setTimeout(() => {
            console.info('ElementTest executeAttributeValueCallbackTriggerAction ' + caseName + ' events.length: ' + this.events.length);
            for (let i = 0; i < this.events.length; i++) {
                let target = this.events[i].target;
                let eventType = this.events[i].eventType;
                console.info('ElementTest executeAttributeValueCallbackTriggerAction ' + caseName + ' target: ' + JSON.stringify(target));
                target.attributeValue('triggerAction', (err, value) => {
                    console.info('ElementTest executeAttributeValueCallbackTriggerAction ' + caseName + ' err: ' + JSON.stringify(err));
                    console.info('ElementTest executeAttributeValueCallbackTriggerAction ' + caseName + ' valueType: ' + typeof(value));
                    if (err.code == 0 && eventType == 'click' && typeof(value) == 'string') {
                        this.publishCaseResult(caseName, true);
                    }
                });
            }
        }, 1000);
    }

    private async executeAttributeValueCallbackRootElement(caseName: string) {
        let element = undefined;
        if (this.context) {
            let base = await this.getBaseElement();
            if (base) {
                let baseWindowId = await base.attributeValue('windowId');
                let windows = await this.context.getWindows();
                for (let window of windows) {
                    let windowId = await window.attributeValue('windowId');
                    if (baseWindowId == windowId) {
                        element = window;
                        console.info('ElementTest executeAttributeValueCallbackRootElement ' + caseName + ' found window');
                        break;
                    }
                }
            }
        }

        let result = false;
        if (element) {
            console.info('ElementTest executeAttributeValueCallbackRootElement ' + caseName + ' input: rootElement, outputType: object');
            element.attributeValue('rootElement', (err, value) => {
                console.info('ElementTest executeAttributeValueCallback ' + caseName + ' err: ' + JSON.stringify(err));
                console.info('ElementTest executeAttributeValueCallback ' + caseName + ' value: ' + JSON.stringify(value));
                if (err.code == 0 && typeof(value) == 'object') {
                    result = true;
                } else {
                    console.warn('ElementTest executeAttributeValueCallback ' + caseName + ' valueType: ' + typeof(value));
                }
                this.publishCaseResult(caseName, result);
            });
        }
    }

    private async executeAttributeValueCallbackArray(caseName: string, input: string, outputType: string) {
        let result = false;
        let element = await this.getBaseElement();
        if (element) {
            console.info('ElementTest executeAttributeValueCallbackArray ' + caseName + ' input: ' + input + ', outputType: ' + outputType);
            element.attributeValue(input, (err, value) => {
                console.info('ElementTest executeAttributeValueCallbackArray ' + caseName + ' err: ' + JSON.stringify(err));
                console.info('ElementTest executeAttributeValueCallbackArray ' + caseName + ' value: ' + JSON.stringify(value));
                if (err.code == 0 && Array.isArray(value)) {
                    if ((value.length == 0)||
                        (value.length > 0 && typeof(value[0]) == outputType)) {
                        result = true;
                    }
                }
                this.publishCaseResult(caseName, result);
            });
        }
    }

    private async executeActionNamesCallback(caseName: string) {
        let result = false;
        let element = await this.getBaseElement();
        if (element) {
            element.actionNames((err, actions) => {
                console.info('ElementTest executeActionNamesCallback ' + caseName + ' err: ' + JSON.stringify(err));
                console.info('ElementTest executeActionNamesCallback ' + caseName + ' actions: ' + JSON.stringify(actions));
                if (err.code == 0 && Array.isArray(actions)) {
                    if ((actions.length == 0) ||
                        (actions.length > 0 && typeof(actions[0]) == 'string')) {
                        result = true;
                    }
                }
                this.publishCaseResult(caseName, result);
            });
            
        }
    }

    private async executePerformActionCallback(caseName: string, action: string, args?: object) {
        let result = false;
        let element = await this.getBaseElement();
        if (element) {
            console.info('ElementTest executePerformActionCallback ' + caseName + ' action: ' + action + ', args: ' + JSON.stringify(args));
            element.performAction(action, args, (err, ret) => {
                console.info('ElementTest executePerformActionCallback ' + caseName + ' err: ' + JSON.stringify(err));
                console.info('ElementTest executePerformActionCallback ' + caseName + ' ret: ' + JSON.stringify(ret));
                if (action == invalidString && err && err.code != 0) {
                    if (err.code == 9300005) {
                        result = true;
                    }
                } else if (err.code == 0 && typeof(ret) == 'undefined') {
                    result = true;
                }
                this.publishCaseResult(caseName, result);
            });
        }
    }

    private async executeFindElementCallbackByContent(caseName: string, condition: string) {
        let result = false;
        let element = await this.getBaseElement();
        if (element) {
            console.info('ElementTest executeFindElementCallbackByContent ' + caseName + ' condition: ' + condition);
            element.findElement('content', condition, (err, found) => {
                console.info('ElementTest executeFindElementCallbackByContent ' + caseName + ' err: ' + JSON.stringify(err));
                console.info('ElementTest executeFindElementCallbackByContent ' + caseName + ' element: ' + JSON.stringify(found));
                if (condition == invalidString && err && err.code != 0) {
                    result = true;
                } else if (err.code == 0 && Array.isArray(found)) {
                    if (found.length == 0 || typeof(found[0]) == 'object') {
                        result = true;
                    }
                }
                this.publishCaseResult(caseName, result);
            });
        }
    }

    private async executeFindElementCallbackByFocusType(caseName: string, condition: string) {
        let result = false;
        let element = await this.getBaseElement();
        if (element) {
            console.info('ElementTest executeFindElementCallbackByFocusType ' + caseName + ' condition: ' + condition);
            let action = (condition == 'accessibility') ? 'accessibilityFocus' : 'focus';
            let ret = await element.performAction(action);
            console.info('ElementTest executeFindElementCallbackByFocusType ' + caseName + ' performAction[' + action + '] ret: ' + ret);

            element.findElement('focusType', condition, (err, found) => {
                console.info('ElementTest executeFindElementCallbackByFocusType ' + caseName + ' err: ' + JSON.stringify(err));
                console.info('ElementTest executeFindElementCallbackByFocusType ' + caseName + ' element: ' + JSON.stringify(found));
                if (condition == invalidString && err && err.code != 0) {
                    result = true;
                } else if (err.code == 0 && typeof(found) == 'object') {
                    result = true;
                }
                this.publishCaseResult(caseName, result);
            });

            setTimeout(async () => {
                if (ret && element) {
                    let clearAction = (condition == 'accessibility') ? 'clearAccessibilityFocus' : 'clearFocus';
                    await element.performAction(clearAction);
                }
            }, 1000);
        }
    }

    private async executeFindElementCallbackByFocusDirection(caseName: string, condition: string) {
        let result = false;
        let element = await this.getBaseElement();
        if (element) {
            console.info('ElementTest executeFindElementCallbackByFocusDirection ' + caseName + ' condition: ' + condition);
            element.findElement('focusDirection', condition, (err, found) => {
                console.info('ElementTest executeFindElementCallbackByFocusDirection ' + err + ' element: ' + JSON.stringify(err));
                console.info('ElementTest executeFindElementCallbackByFocusDirection ' + caseName + ' element: ' + JSON.stringify(found));
                if (condition == invalidString && err.code != 0) {
                    result = true;
                } else if (err.code == 0 && typeof(found) == 'object') {
                    result = true;
                }
                this.publishCaseResult(caseName, result);
            });
        }
    }

    private async executeFindElementCallback5900(caseName: string) {
        let result = false;
        let element = undefined;
        if (this.context) {
            let root = await this.context.getWindowRootElement();
            let elements = await root.findElement('content', 'button2');
            element = elements[0];
        }
        if (element) {
            console.info('ElementTest executeFindElementCallback5900 ' + caseName);
            element.findElement('focusDirection', 'down', (err, found) => {
                console.info('ElementTest executeFindElementCallback5900 ' + caseName + ' err: ' + JSON.stringify(err));
                console.info('ElementTest executeFindElementCallback5900 ' + caseName + ' element: ' + JSON.stringify(found));
                if (err.code == 0 && typeof(found) == 'object') {
                    result = true;
                }
                this.publishCaseResult(caseName, result);
            });
        }
    }
}