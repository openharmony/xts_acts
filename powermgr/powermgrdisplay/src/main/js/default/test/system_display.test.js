/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import brightness from '@system.brightness'
import { describe } from 'deccjsunit/index'

const INPUT_ERROR_CODE_CODE = 202
const SET_VALUE_MSG = "setValue: value is not an available number"
const SET_MODE_MSG = "setMode: value is not an available number"

function isNotSupported(data) {
    return data == "setMode: Auto adjusting brightness is not supported"
}

function sleep(time){
    return new Promise((resolve) => setTimeout(resolve, time));
}

describe('appInfoTest', function () {
  console.log("*************System SystemDisplay Unit Test Begin*************");

    /**
     * @tc.number system_display_js_0100
     * @tc.name get_value_success
     * @tc.desc Get brightness success
     */
    it('get_value_success', 0, function () {
        let execSucc = false
        let execComplete = false
        let currValue = 100;
        let setValue = 120
        brightness.getValue({
            success: (data) => {
                currValue = data.value
                let value = (data.value > 0) && (data.value <= 255)
                expect(value).assertTrue();
            }
        })
        brightness.setValue({
            value: setValue
        })
        brightness.getValue({
            success: (data) => {
                execSucc = true
                expect(setValue == data.value).assertTrue();
            },
            fail: (data, code) => {
                console.log("get_value_success, data: " + data + ", code: " + code)
                expect().assertFail()
            },
            complete: () => {
                execComplete = true
                console.log("The device information is obtained successfully. Procedure")
            }
        })
        expect(execSucc).assertTrue()
        expect(execComplete).assertTrue()

        brightness.setValue({
            value: currValue
        })
    })

    /**
     * @tc.number system_display_js_0101
     * @tc.name get_value_success_not_must_test
     * @tc.desc Get brightness
     */
     it('get_status_test_success_not_must', 0, function () {
        let execComplete = false
        brightness.getValue({
            fail: (data, code) => {
                console.log("get_status_test_success_not_must, data: " + data + ", code: " + code)
                expect().assertFail()
            },
            complete: () => {
                execComplete = true
                console.log("The device information is obtained successfully. Procedure")
            }
        })
        expect(execComplete).assertTrue()
    })

    /**
     * @tc.number system_display_js_0102
     * @tc.name get_value_fail_not_must_test
     * @tc.desc Get brightness
     */
    it('get_value_fail_not_must_test', 0, function () {
        let execComplete = false
        brightness.getValue({
            complete: () => {
                execComplete = true
                console.log("The device information is obtained successfully. Procedure")
            }
        })
        expect(execComplete).assertTrue()
    })

    /**
     * @tc.number system_display_js_0103
     * @tc.name get_value_null_test
     * @tc.desc Get brightness
     */
    it('get_status_test_fail_not_must', 0, function () {
        brightness.getValue()
        expect(true).assertTrue()
    })

    /**
     * @tc.number system_display_js_0200
     * @tc.name set_value_success_all
     * @tc.desc Set brightness success
     */
    it('set_value_success_all', 0, function () {
        let execSucc = false
        let execComplete = false
        let setValue = 200
        let currValue = 100
        brightness.getValue({
            success: (data) => {
                currValue = data.value
            }
        })

        brightness.setValue({
            value: setValue,
            success: () => {
                execSucc = true
                brightness.getValue({
                    success: (data) => {
                        expect(data.value == setValue).assertTrue()
                    }
                })
            },
            fail: (data, code) => {
                console.log("set_value_success_all, data: " + data + ", code: " + code)
                expect().assertFail()
            },
            complete: () => {
                execComplete = true
                console.log("The device information is obtained successfully. Procedure")
            }
        })
        expect(execSucc).assertTrue()
        expect(execComplete).assertTrue()

        brightness.setValue({
            value: currValue
        })
    })

    /**
     * @tc.number system_display_js_0201
     * @tc.name set_value_success_value
     * @tc.desc Set brightness success
     */
    it('set_value_success_value', 0, function () {
        let setValue = 50
        let currValue = 100
        brightness.getValue({
            success: (data) => {
                currValue = data.value
            }
        })
        brightness.setValue({ value: setValue })
        brightness.getValue({
            success: (data) => {
                console.log("set_value_success_value, brightness: " + data.value)
                expect(data.value == setValue).assertTrue()
            }
        })
        brightness.setValue({ value: currValue })
    })

    /**
     * @tc.number system_display_js_0202
     * @tc.name set_value_fail
     * @tc.desc Set brightness fail
     */
     it('set_value_fail', 0, function () {
        let setValue = "50"
        brightness.setValue({
            value: setValue,
            success: () => {
                console.log("set_value_fail success")
                expect().assertFail()
            },
            fail: (data, code) => {
                console.log("set_value_fail, data: " + data + ", code: " + code)
                expect(code == NPUT_ERROR_CODE).assertTrue()
                expect(data == SET_VALUE_MSG).assertTrue()
            }
        })
    })

    /**
     * @tc.number system_display_js_0300
     * @tc.name get_mode_success
     * @tc.desc Get mode success
     */
    it('get_mode_success', 0, function () {
        let execSucc = false
        let execComplete = false
        let modeVal = 0
        let exec = true
        brightness.getMode({
            success: (data) => {
                console.log("get_mode_success: get mode: " + data.mode)
                modeVal = data.mode
            }
        })
        brightness.setMode({
            mode: modeVal ? 0 : 1,
            fail: (data, code) => {
                console.log("get_mode_success, data: " + data + ", code: " + code)
                exec = isNotSupported(data) ? false : true
            }
        })
        if (!exec) {
            return
        }
        brightness.getMode({
            success: (data) => {
                execSucc = true
                expect(data.mode == !modeVal).assertTrue()        
            },
            fail: (data, code) => {
                console.log("get_mode_success, data: " + data + ", code: " + code)
                expect().assertFail()
            },
            complete: () => {
                execComplete = true
                console.log("The device information is obtained successfully. Procedure")
            }
        })
        expect(execSucc).assertTrue()
        expect(execComplete).assertTrue()

        brightness.setMode({ mode: modeVal })
    })

    /**
     * @tc.number system_display_js_0301
     * @tc.name get_mode_success_null
     * @tc.desc Get mode success is null
     */
    it('get_mode_success_null', 0, function () {
        let execComplete = false
        brightness.getMode({
            fail: (data, code) => {
                console.log("get_mode_success_null, data: " + data + ", code: " + code)
                expect().assertFail()
            },
            complete: () => {
                execComplete = true
                console.log("The device information is obtained successfully. Procedure")
            }
        })
        expect(execComplete).assertTrue()
    })

    /**
     * @tc.number system_display_js_0400
     * @tc.name set_mode_success
     * @tc.desc set mode success
     */
    it('set_mode_success', 0, function () {
        let execSucc = false
        let execComplete = false
        let modeVal = 0
        brightness.getMode({
            success: (data) => {
                modeVal = data.mode
            }
        })

        brightness.setMode({
            mode: modeVal ? 0 : 1,
            success: () => {
                execSucc = true
                console.log("set_mode_success success")
                brightness.getMode({
                    success: (data) => {
                        console.log("set_mode_success, data: " + data.mode)
                        expect(data.mode == !modeVal).assertTrue()
                    }
                })        
            },
            fail: (data, code) => {
                if (!isNotSupported(data)) {
                    console.log("set_mode_success, data: " + data + ", code: " + code)
                    expect().assertFail()
                } else {
                    console.log("set_mode_success not supported")
                    execSucc = true
                    expect(isNotSupported(data)).assertTrue()
                }
            },
            complete: () => {
                execComplete = true
                console.log("The device information is obtained successfully. Procedure")
            }
        })
        expect(execSucc).assertTrue()
        expect(execComplete).assertTrue()

        brightness.setMode({ mode: modeVal })
    })

    /**
     * @tc.number system_display_js_0401
     * @tc.name set_mode_fail
     * @tc.desc set mode fail
     */
    it('set_mode_fail', 0, function () {
        let execComplete = false
        brightness.setMode({
            mode: "0",
            success: () => {
                expect().assertFail()
            },
            fail: (data, code) => {
                console.log("set_mode_fail, data: " + data + ", code: " + code)
                expect(code == INPUT_ERROR_CODE_CODE).assertTrue()
                expect(data == SET_MODE_MSG).assertTrue()
            },
            complete: () => {
                execComplete = true
                console.log("The device information is obtained successfully. Procedure")
            }
        })
        expect(execComplete).assertTrue()
    })

    /**
     * @tc.number system_display_js_0500
     * @tc.name set_keep_screen_on_true
     * @tc.desc set keep screen on true
     */
    it('set_keep_screen_on_true', 0, async function () {
        let execSucc = false
        let execComplete = false
        let sleepTime = 35 * 1000
        brightness.setKeepScreenOn({
            keepScreenOn: true,
            success: () => {
                execSucc = true
            },
            fail: (data, code) => {
                console.log("set_keep_screen_on, data: " + data + ", code: " + code)
                expect().assertFail()
            },
            complete: () => {
                execComplete = true
                console.log("The device information is obtained successfully. Procedure")
            }
        })
        expect(execSucc).assertTrue()
        expect(execComplete).assertTrue()

        await sleep(sleepTime)
        power.isScreenOn().then(screenOn => {
            console.info('The current screenOn is ' + screenOn);
            expect(screenOn).assertTrue();
        }).catch(error => {
            console.log('isScreenOn error: ' + error);
        })
    })

    /**
     * @tc.number system_display_js_0501
     * @tc.name set_keep_screen_on_false
     * @tc.desc set keep screen on false
     */
    it('set_keep_screen_on_false', 0, async function () {
        let execSucc = false
        let execComplete = false
        let sleepTime = 35 * 1000
        brightness.setKeepScreenOn({
            keepScreenOn: false,
            success: () => {
                execSucc = true
            },
            fail: (data, code) => {
                console.log("set_keep_screen_on_false, data: " + data + ", code: " + code)
                expect().assertFail()
            },
            complete: () => {
                execComplete = true
                console.log("The device information is obtained successfully. Procedure")
            }
        })
        expect(execSucc).assertTrue()
        expect(execComplete).assertTrue()

        await sleep(sleepTime)
        power.isScreenOn().then(screenOn => {
            console.info('set_keep_screen_on_false The current screenOn is ' + screenOn);
            expect(screenOn).assertFalse();
        }).catch(error => {
            console.log('set_keep_screen_on_false isScreenOn error: ' + error);
        })
    })
})