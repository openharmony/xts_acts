/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import inputMethod from '@ohos.inputMethod';
import InputMethodSubtype from '@ohos.InputMethodSubtype'
import { PanelInfo, PanelFlag, PanelType } from '@ohos.inputMethod.Panel';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
export default function inputMethodOnOffTest() {
    describe('inputMethodOnOffTest', () => {
        /**
         * @tc.number SUB_Misc_inputMethod_ImeChange__static_0100
         * @tc.name SUB_Misc_inputMethod_ImeChange__static_0100
         * @tc.desc Function test
         */
        it('SUB_Misc_inputMethod_ImeChange__static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_ImeChange__static_0100';
            let callback1 = (inputMethodProperty: inputMethod.InputMethodProperty, inputMethodSubtype: InputMethodSubtype) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback1`);
            }
            let callback2 = (inputMethodProperty: inputMethod.InputMethodProperty, inputMethodSubtype: InputMethodSubtype) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback2`);
            }
            try {
                let inputMethodSetting = inputMethod.getSetting();
                inputMethodSetting.on("imeChange", callback1);
                inputMethodSetting.on("imeChange", callback2);
                inputMethodSetting.on("imeChange", callback1);
                inputMethodSetting.off("imeChange", callback1);
                inputMethodSetting.off("imeChange");
                expect(true).assertTrue();
                done();
            } catch (error: BusinessError) {
                hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_Misc_inputMethod_selectByMovement__static_0100
         * @tc.name SUB_Misc_inputMethod_selectByMovement__static_0100
         * @tc.desc Function test
         */
        it('SUB_Misc_inputMethod_selectByMovement__static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_selectByMovement__static_0100';
            let callback1 = (movement: inputMethod.Movement) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback1`);
            }
            let callback2 = (movement: inputMethod.Movement) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback2`);
            }
            try {
                let inputMethodSetting = inputMethod.getController();
                inputMethodSetting.on("selectByMovement", callback1);
                inputMethodSetting.on("selectByMovement", callback2);
                inputMethodSetting.on("selectByMovement", callback1);
                inputMethodSetting.off("selectByMovement", callback1);
                inputMethodSetting.off("selectByMovement");
                expect(true).assertTrue();
                done();
            } catch (error: BusinessError) {
                hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_Misc_inputMethod_selectByRange__static_0100
         * @tc.name SUB_Misc_inputMethod_selectByRange__static_0100
         * @tc.desc Function test
         */
        it('SUB_Misc_inputMethod_selectByRange__static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_selectByRange__static_0100';
            let callback1 = (range: inputMethod.Range) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback1`);
            }
            let callback2 = (range: inputMethod.Range) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback2`);
            }
            try {
                let inputMethodSetting = inputMethod.getController();
                inputMethodSetting.on("selectByRange", callback1);
                inputMethodSetting.on("selectByRange", callback2);
                inputMethodSetting.on("selectByRange", callback1);
                inputMethodSetting.off("selectByRange", callback1);
                inputMethodSetting.off("selectByRange");
                expect(true).assertTrue();
                done();
            } catch (error: BusinessError) {
                hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_Misc_inputMethod_sendKeyboardStatus__static_0100
         * @tc.name SUB_Misc_inputMethod_sendKeyboardStatus__static_0100
         * @tc.desc Function test
         */
        it('SUB_Misc_inputMethod_sendKeyboardStatus__static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_sendKeyboardStatus__static_0100';
            let callback1 = (keyboardStatus: inputMethod.KeyboardStatus) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback1`);
            }
            let callback2 = (keyboardStatus: inputMethod.KeyboardStatus) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback2`);
            }
            try {
                let inputMethodSetting = inputMethod.getController();
                inputMethodSetting.on("sendKeyboardStatus", callback1);
                inputMethodSetting.on("sendKeyboardStatus", callback2);
                inputMethodSetting.on("sendKeyboardStatus", callback1);
                inputMethodSetting.off("sendKeyboardStatus", callback1);
                inputMethodSetting.off("sendKeyboardStatus");
                expect(true).assertTrue();
                done();
            } catch (error: BusinessError) {
                hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_Misc_inputMethod_sendFunctionKey__static_0100
         * @tc.name SUB_Misc_inputMethod_sendFunctionKey__static_0100
         * @tc.desc Function test
         */
        it('SUB_Misc_inputMethod_sendFunctionKey__static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_sendFunctionKey__static_0100';
            let callback1 = (functionKey: inputMethod.FunctionKey) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback1`);
            }
            let callback2 = (functionKey: inputMethod.FunctionKey) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback2`);
            }
            try {
                let inputMethodSetting = inputMethod.getController();
                inputMethodSetting.on("sendFunctionKey", callback1);
                inputMethodSetting.on("sendFunctionKey", callback2);
                inputMethodSetting.on("sendFunctionKey", callback1);
                inputMethodSetting.off("sendFunctionKey", callback1);
                inputMethodSetting.off("sendFunctionKey");
                expect(true).assertTrue();
                done();
            } catch (error: BusinessError) {
                hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_Misc_inputMethod_moveCursor__static_0100
         * @tc.name SUB_Misc_inputMethod_moveCursor__static_0100
         * @tc.desc Function test
         */
        it('SUB_Misc_inputMethod_moveCursor__static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_moveCursor__static_0100';
            let callback1 = (direction: inputMethod.Direction) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback1`);
            }
            let callback2 = (direction: inputMethod.Direction) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback2`);
            }
            try {
                let inputMethodSetting = inputMethod.getController();
                inputMethodSetting.on("moveCursor", callback1);
                inputMethodSetting.on("moveCursor", callback2);
                inputMethodSetting.on("moveCursor", callback1);
                inputMethodSetting.off("moveCursor", callback1);
                inputMethodSetting.off("moveCursor");
                expect(true).assertTrue();
                done();
            } catch (error: BusinessError) {
                hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_Misc_inputMethod_deleteRight__static_0100
         * @tc.name SUB_Misc_inputMethod_deleteRight__static_0100
         * @tc.desc Function test
         */
        it('SUB_Misc_inputMethod_deleteRight__static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_deleteRight__static_0100';
            let callback1 = (length: int) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback1`);
            }
            let callback2 = (length: int) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback2`);
            }
            try {
                let inputMethodSetting = inputMethod.getController();
                inputMethodSetting.on("deleteRight", callback1);
                inputMethodSetting.on("deleteRight", callback2);
                inputMethodSetting.on("deleteRight", callback1);
                inputMethodSetting.off("deleteRight", callback1);
                inputMethodSetting.off("deleteRight");
                expect(true).assertTrue();
                done();
            } catch (error: BusinessError) {
                hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_Misc_inputMethod_deleteLeft__static_0100
         * @tc.name SUB_Misc_inputMethod_deleteLeft__static_0100
         * @tc.desc Function test
         */
        it('SUB_Misc_inputMethod_deleteLeft__static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_deleteLeft__static_0100';
            let callback1 = (length: int) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback1`);
            }
            let callback2 = (length: int) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback2`);
            }
            try {
                let inputMethodSetting = inputMethod.getController();
                inputMethodSetting.on("deleteLeft", callback1);
                inputMethodSetting.on("deleteLeft", callback2);
                inputMethodSetting.on("deleteLeft", callback1);
                inputMethodSetting.off("deleteLeft", callback1);
                inputMethodSetting.off("deleteLeft");
                expect(true).assertTrue();
                done();
            } catch (error: BusinessError) {
                hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_Misc_inputMethod_handleExtendAction__static_0100
         * @tc.name SUB_Misc_inputMethod_handleExtendAction__static_0100
         * @tc.desc Function test
         */
        it('SUB_Misc_inputMethod_handleExtendAction__static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_handleExtendAction__static_0100';
            let callback1 = (action: inputMethod.ExtendAction) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback1`);
            }
            let callback2 = (action: inputMethod.ExtendAction) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback2`);
            }
            try {
                let inputMethodSetting = inputMethod.getController();
                inputMethodSetting.on("handleExtendAction", callback1);
                inputMethodSetting.on("handleExtendAction", callback2);
                inputMethodSetting.on("handleExtendAction", callback1);
                inputMethodSetting.off("handleExtendAction", callback1);
                inputMethodSetting.off("handleExtendAction");
                expect(true).assertTrue();
                done();
            } catch (error: BusinessError) {
                hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_Misc_inputMethod_insertText__static_0100
         * @tc.name SUB_Misc_inputMethod_insertText__static_0100
         * @tc.desc Function test
         */
        it('SUB_Misc_inputMethod_insertText__static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_insertText__static_0100';
            let callback1 = (text: string) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback1`);
            }
            let callback2 = (text: string) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback2`);
            }
            try {
                let inputMethodSetting = inputMethod.getController();
                inputMethodSetting.on("insertText", callback1);
                inputMethodSetting.on("insertText", callback2);
                inputMethodSetting.on("insertText", callback1);
                inputMethodSetting.off("insertText", callback1);
                inputMethodSetting.off("insertText");
                expect(true).assertTrue();
                done();
            } catch (error: BusinessError) {
                hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_Misc_inputMethod_getRightTextOfCursor__static_0100
         * @tc.name SUB_Misc_inputMethod_getRightTextOfCursor__static_0100
         * @tc.desc Function test
         */
        it('SUB_Misc_inputMethod_getRightTextOfCursor__static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_getRightTextOfCursor__static_0100';
            let callback1 = (length: int) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback1`);
                return "test";
            }
            let callback2 = (length: int) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback2`);
                return "test";
            }
            try {
                let inputMethodSetting = inputMethod.getController();
                inputMethodSetting.on("getRightTextOfCursor", callback1);
                inputMethodSetting.on("getRightTextOfCursor", callback2);
                inputMethodSetting.on("getRightTextOfCursor", callback1);
                inputMethodSetting.off("getRightTextOfCursor", callback1);
                inputMethodSetting.off("getRightTextOfCursor");
                expect(true).assertTrue();
                done();
            } catch (error: BusinessError) {
                hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_Misc_inputMethod_getLeftTextOfCursor__static_0100
         * @tc.name SUB_Misc_inputMethod_getLeftTextOfCursor__static_0100
         * @tc.desc Function test
         */
        it('SUB_Misc_inputMethod_getLeftTextOfCursor__static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_getLeftTextOfCursor__static_0100';
            let callback1 = (length: int) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback1`);
                return "test";
            }
            let callback2 = (length: int) => {
                hilog.info(domain, tag, `${CASE_NAME} success callback2`);
                return "test";
            }
            try {
                let inputMethodSetting = inputMethod.getController();
                inputMethodSetting.on("getLeftTextOfCursor", callback1);
                inputMethodSetting.on("getLeftTextOfCursor", callback2);
                inputMethodSetting.on("getLeftTextOfCursor", callback1);
                inputMethodSetting.off("getLeftTextOfCursor", callback1);
                inputMethodSetting.off("getLeftTextOfCursor");
                expect(true).assertTrue();
                done();
            } catch (error: BusinessError) {
                hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_Misc_inputMethod_getTextIndexAtCursor__static_0100
         * @tc.name SUB_Misc_inputMethod_getTextIndexAtCursor__static_0100
         * @tc.desc Function test
         */
        it('SUB_Misc_inputMethod_getTextIndexAtCursor__static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_getTextIndexAtCursor__static_0100';
            let callback1 = () =>  {
                hilog.info(domain, tag, `${CASE_NAME} success callback1`);
                return 1;
            }
            let callback2 = () =>  {
                hilog.info(domain, tag, `${CASE_NAME} success callback2`);
                return 1;
            }
            try {
                let inputMethodSetting = inputMethod.getController();
                inputMethodSetting.on("getTextIndexAtCursor", callback1);
                inputMethodSetting.on("getTextIndexAtCursor", callback2);
                inputMethodSetting.on("getTextIndexAtCursor", callback1);
                inputMethodSetting.off("getTextIndexAtCursor", callback1);
                inputMethodSetting.off("getTextIndexAtCursor");
                expect(true).assertTrue();
                done();
            } catch (error: BusinessError) {
                hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });
    })
}