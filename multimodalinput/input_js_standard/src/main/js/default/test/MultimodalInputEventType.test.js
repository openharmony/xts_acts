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

import inputkeyCode from '@ohos.multimodalInput.keyCode'
import keyEvent from '@ohos.multimodalInput.keyEvent'
import mouseEvent from '@ohos.multimodalInput.mouseEvent'
import touchEvent from '@ohos.multimodalInput.touchEvent'
import { Key, KeyEvent } from '@ohos.multimodalInput.keyEvent'
import { AxisValue, MouseEvent } from '@ohos.multimodalInput.mouseEvent'
import { Touch, TouchEvent } from '@ohos.multimodalInput.touchEvent'

import {
    describe,
    beforeAll,
    beforeEach,
    afterEach,
    afterAll,
    it,
    expect
} from 'deccjsunit/index'

describe('MultimodalInput_test', function () {

    it('MultimodalInput_test::KeyEventTypeTest_0010', 0, function () {
        console.info(`MultimodalInput_test::KeyEventTypeTest_0010 enter`);

        expect(keyEvent.Action.CANCEL == 0).assertTrue();
        expect(keyEvent.Action.DOWN == 1).assertTrue();
        expect(keyEvent.Action.UP == 2).assertTrue();

        console.info(`MultimodalInput_test::KeyEventTypeTest_0010 exit`);
    })

    it('MultimodalInput_test::KeyEventTypeTest_0020', 0, function () {
        console.info(`MultimodalInput_test::KeyEventTypeTest_0020 enter`);

        let testKey: Key = { code: inputkeyCode.KeyCode.KEYCODE_FN, pressedTime: 10, deviceId: 1 };

        expect(testKey.code == inputkeyCode.KeyCode.KEYCODE_FN).assertTrue();
        expect(testKey.pressedTime == 10).assertTrue();
        expect(testKey.deviceId == 1).assertTrue();

        console.info(`MultimodalInput_test::KeyEventTypeTest_0020 exit`);
    })

    it('MultimodalInput_test::KeyEventTypeTest_0030', 0, function () {
        console.info(`MultimodalInput_test::KeyEventTypeTest_0030 enter`);

        let testKey: Key = { code: inputkeyCode.KeyCode.KEYCODE_FN, pressedTime: 10, deviceId: 1 };
        let testKeyEvent: KeyEvent = {
            action: keyEvent.Action.DOWN, key: testKey, unicodeChar: 1, keys: [testKey],
            ctrlKey: true, altKey: true, shiftKey: true, logoKey: true, fnKey: true, capsLock: true, numLock: true,
            scrollLock: true
        };

        expect(testKeyEvent.action == keyEvent.Action.DOWN).assertTrue();
        expect(testKeyEvent.key.code == testKey.code).assertTrue();
        expect(testKeyEvent.unicodeChar == 1).assertTrue();
        expect(testKeyEvent.keys[0].code == testKey.code).assertTrue();
        expect(testKeyEvent.ctrlKey).assertTrue();
        expect(testKeyEvent.altKey).assertTrue();
        expect(testKeyEvent.shiftKey).assertTrue();
        expect(testKeyEvent.logoKey).assertTrue();
        expect(testKeyEvent.fnKey).assertTrue();
        expect(testKeyEvent.capsLock).assertTrue();
        expect(testKeyEvent.numLock).assertTrue();
        expect(testKeyEvent.scrollLock).assertTrue();

        console.info(`MultimodalInput_test::KeyEventTypeTest_0030 exit`);
    })

    it('MultimodalInput_test::MouseEventTypeTest_0010', 0, function () {
        console.info(`MultimodalInput_test::MouseEventTypeTest_0010 enter`);

        expect(mouseEvent.Action.CANCEL == 0).assertTrue();
        expect(mouseEvent.Action.MOVE == 1).assertTrue();
        expect(mouseEvent.Action.BUTTON_DOWN == 2).assertTrue();
        expect(mouseEvent.Action.BUTTON_UP == 3).assertTrue();
        expect(mouseEvent.Action.AXIS_BEGIN == 4).assertTrue();
        expect(mouseEvent.Action.AXIS_UPDATE == 5).assertTrue();
        expect(mouseEvent.Action.AXIS_END == 6).assertTrue();

        console.info(`MultimodalInput_test::MouseEventTypeTest_0010 exit`);
    })

    it('MultimodalInput_test::MouseEventTypeTest_0020', 0, function () {
        console.info(`MultimodalInput_test::MouseEventTypeTest_0020 enter`);

        expect(mouseEvent.Button.LEFT == 0).assertTrue();
        expect(mouseEvent.Button.MIDDLE == 1).assertTrue();
        expect(mouseEvent.Button.RIGHT == 2).assertTrue();
        expect(mouseEvent.Button.SIDE == 3).assertTrue();
        expect(mouseEvent.Button.EXTRA == 4).assertTrue();
        expect(mouseEvent.Button.FORWARD == 5).assertTrue();
        expect(mouseEvent.Button.BACK == 6).assertTrue();
        expect(mouseEvent.Button.TASK == 6).assertTrue();

        console.info(`MultimodalInput_test::MouseEventTypeTest_0020 exit`);
    })

    it('MultimodalInput_test::MouseEventTypeTest_0030', 0, function () {
        console.info(`MultimodalInput_test::MouseEventTypeTest_0030 enter`);

        expect(mouseEvent.Axis.SCROLL_VERTICAL == 0).assertTrue();
        expect(mouseEvent.Axis.SCROLL_HORIZONTAL == 1).assertTrue();
        expect(mouseEvent.Axis.PINCH == 2).assertTrue();

        console.info(`MultimodalInput_test::MouseEventTypeTest_0030 exit`);
    })

    it('MultimodalInput_test::MouseEventTypeTest_0040', 0, function () {
        console.info(`MultimodalInput_test::MouseEventTypeTest_0040 enter`);

        let testAxisValue: AxisValue = { axis: mouseEvent.Axis.SCROLL_VERTICAL, value: 1 };
        expect(testAxisValue.axis == mouseEvent.Axis.SCROLL_VERTICAL).assertTrue();
        expect(testAxisValue.value == 1).assertTrue();

        console.info(`MultimodalInput_test::MouseEventTypeTest_0040 exit`);
    })

    it('MultimodalInput_test::MouseEventTypeTest_0050', 0, function () {
        console.info(`MultimodalInput_test::MouseEventTypeTest_0050 enter`);

        let testAxisValue: AxisValue = { axis: mouseEvent.Axis.SCROLL_VERTICAL, value: 1 };
        let testMouseEvent: MouseEvent = {
            action: mouseEvent.Action.CANCEL, screenX: 1, screenY: 1, windowX: 1,
            windowY: 1, rawDeltaX: 1, rawDeltaY: 1, button: mouseEvent.Button.LEFT,
            pressedButtons: [mouseEvent.Button.LEFT], axes: [testAxisValue],
            pressedKeys: [inputkeyCode.KeyCode.KEYCODE_FN], ctrlKey: true, altKey: true, shiftKey: true,
            logoKey: true, fnKey: true, capsLock: true, numLock: true, scrollLock: true
        };
        expect(testMouseEvent.action == mouseEvent.Action.CANCEL).assertTrue();
        expect(testMouseEvent.screenX == 1).assertTrue();
        expect(testMouseEvent.screenY == 1).assertTrue();
        expect(testMouseEvent.windowX == 1).assertTrue();
        expect(testMouseEvent.windowY == 1).assertTrue();
        expect(testMouseEvent.rawDeltaX == 1).assertTrue();
        expect(testMouseEvent.rawDeltaY == 1).assertTrue();
        expect(testMouseEvent.button == mouseEvent.Button.LEFT).assertTrue();
        expect(testMouseEvent.pressedButtons[0] == mouseEvent.Button.LEFT).assertTrue();
        expect(testMouseEvent.axes[0].axis == mouseEvent.Axis.SCROLL_VERTICAL).assertTrue();
        expect(testMouseEvent.pressedKeys[0] == inputkeyCode.KeyCode.KEYCODE_FN).assertTrue();
        expect(testMouseEvent.ctrlKey).assertTrue();
        expect(testMouseEvent.altKey).assertTrue();
        expect(testMouseEvent.shiftKey).assertTrue();
        expect(testMouseEvent.logoKey).assertTrue();
        expect(testMouseEvent.fnKey).assertTrue();
        expect(testMouseEvent.capsLock).assertTrue();
        expect(testMouseEvent.numLock).assertTrue();
        expect(testMouseEvent.scrollLock).assertTrue();

        console.info(`MultimodalInput_test::MouseEventTypeTest_0050 exit`);
    })

    it('MultimodalInput_test::TouchEventTypeTest_0010', 0, function () {
        console.info(`MultimodalInput_test::TouchEventTypeTest_0010 enter`);

        expect(touchEvent.Action.CANCEL == 0).assertTrue();
        expect(touchEvent.Action.DOWN == 1).assertTrue();
        expect(touchEvent.Action.MOVE == 2).assertTrue();
        expect(touchEvent.Action.UP == 3).assertTrue();

        console.info(`MultimodalInput_test::TouchEventTypeTest_0010 exit`);
    })

    it('MultimodalInput_test::TouchEventTypeTest_0020', 0, function () {
        console.info(`MultimodalInput_test::TouchEventTypeTest_0020 enter`);

        expect(touchEvent.ToolType.FINGER == 0).assertTrue();
        expect(touchEvent.ToolType.PEN == 1).assertTrue();
        expect(touchEvent.ToolType.RUBBER == 2).assertTrue();
        expect(touchEvent.ToolType.BRUSH == 3).assertTrue();
        expect(touchEvent.ToolType.PENCIL == 4).assertTrue();
        expect(touchEvent.ToolType.AIRBRUSH == 5).assertTrue();
        expect(touchEvent.ToolType.MOUSE == 6).assertTrue();
        expect(touchEvent.ToolType.LENS == 7).assertTrue();

        console.info(`MultimodalInput_test::TouchEventTypeTest_0020 exit`);
    })

    it('MultimodalInput_test::TouchEventTypeTest_0030', 0, function () {
        console.info(`MultimodalInput_test::TouchEventTypeTest_0030 enter`);

        expect(touchEvent.SourceType.TOUCH_SCREEN == 0).assertTrue();
        expect(touchEvent.SourceType.PEN == 1).assertTrue();
        expect(touchEvent.SourceType.TOUCH_PAD == 2).assertTrue();

        console.info(`MultimodalInput_test::TouchEventTypeTest_0030 exit`);
    })

    it('MultimodalInput_test::TouchEventTypeTest_0040', 0, function () {
        console.info(`MultimodalInput_test::TouchEventTypeTest_0040 enter`);

        let testTouch: Touch = {
            id: 1, pressedTime: 1, screenX: 1, screenY: 1, windowX: 1, windowY: 1, pressure: 1,
            width: 1, height: 1, tiltX: 1, tiltY: 1, toolX: 1, toolY: 1, toolWidth: 1, toolHeight: 1, rawX: 1,
            rawY: 1, toolType: touchEvent.ToolType.FINGER
        };
        expect(testTouch.id == 1).assertTrue();
        expect(touchEvent.pressedTime == 1).assertTrue();
        expect(touchEvent.screenX == 1).assertTrue();
        expect(touchEvent.screenY == 1).assertTrue();
        expect(touchEvent.windowX == 1).assertTrue();
        expect(touchEvent.windowY == 1).assertTrue();
        expect(touchEvent.pressure == 1).assertTrue();
        expect(touchEvent.width == 1).assertTrue();
        expect(touchEvent.height == 1).assertTrue();
        expect(touchEvent.tiltX == 1).assertTrue();
        expect(touchEvent.tiltY == 1).assertTrue();
        expect(touchEvent.toolX == 1).assertTrue();
        expect(touchEvent.toolY == 1).assertTrue();
        expect(touchEvent.toolWidth == 1).assertTrue();
        expect(touchEvent.toolHeight == 1).assertTrue();
        expect(touchEvent.rawX == 1).assertTrue();
        expect(touchEvent.rawY == 1).assertTrue();
        expect(touchEvent.toolType == touchEvent.ToolType.FINGER).assertTrue();

        console.info(`MultimodalInput_test::TouchEventTypeTest_0040 exit`);
    })

    it('MultimodalInput_test::TouchEventTypeTest_0050', 0, function () {
        console.info(`MultimodalInput_test::TouchEventTypeTest_0050 enter`);

        let testTouch: Touch = {
            id: 1, pressedTime: 1, screenX: 1, screenY: 1, windowX: 1, windowY: 1, pressure: 1,
            width: 1, height: 1, tiltX: 1, tiltY: 1, toolX: 1, toolY: 1, toolWidth: 1, toolHeight: 1, rawX: 1,
            rawY: 1, toolType: touchEvent.ToolType.FINGER
        };
        let testTouchEvent: TouchEvent = {
            action: touchEvent.Action.CANCEL, touch: testTouch, touches: [testTouch],
            sourceType: touchEvent.SourceType.TOUCH_SCREEN
        };
        expect(testTouchEvent.action == touchEvent.Action.CANCEL).assertTrue();
        expect(testTouchEvent.touch.id == 1).assertTrue();
        expect(testTouchEvent.touches[0].id == 1).assertTrue();
        expect(testTouchEvent.sourceType == touchEvent.SourceType.TOUCH_SCREEN).assertTrue();

        console.info(`MultimodalInput_test::TouchEventTypeTest_0050 exit`);
    })
})
