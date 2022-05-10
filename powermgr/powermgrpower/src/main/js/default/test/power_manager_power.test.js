/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import power from '@ohos.power';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

describe('appInfoTest', function () {
    console.log("*************Power Unit Test Begin*************");

    /**
     * @tc.number power_js_001
     * @tc.name power_is_screen_on_promise_test
     * @tc.desc Checks whether the screen of a device is on or off
     */
    it('power_is_screen_on_promise_test', 0, async function (done) {
        power.wakeupDevice("power_is_screen_on_promise_test");
        power.isScreenOn()
            .then(screenOn => {
                console.info('power_is_screen_on_promise_test screenOn is ' + screenOn);
                expect(screenOn).assertTrue();
                console.info('power_is_screen_on_promise_test success');
                done();
            })
            .catch(error => {
                console.log('power_is_screen_on_promise_test error: ' + error);
                expect().assertFail();
                done();
            })
    })

    /**
     * @tc.number power_js_002
     * @tc.name power_is_screen_on_callback_test
     * @tc.desc Checks whether the screen of a device is on or off
     */
    it('power_is_screen_on_callback_test', 0, async function (done) {
        power.wakeupDevice("power_is_screen_on_callback_test");
        power.isScreenOn((error, screenOn) => {
            if (typeof error === "undefined") {
                console.info('power_is_screen_on_callback_test screenOn is ' + screenOn);
                expect(screenOn).assertTrue();
                console.info('power_is_screen_on_callback_test success');
                done();
            } else {
                console.log('power_is_screen_on_callback_test: ' + error);
                expect().assertFail();
                done();
            }
        })
    })

    /**
     * @tc.number power_js_003
     * @tc.name power_wakeupDevice_test_string
     * @tc.desc Try to wakeup the device and let screen on
     */
    it('power_wakeupDevice_test_string', 0, async function (done) {
        power.isScreenOn()
            .then(screenOn => {
                console.info('power_wakeupDevice_test_string: The current screenOn is ' + screenOn);
                if (screenOn) {
                    power.suspendDevice();
                }  
            })
            .catch(error => {
                console.log('power_wakeupDevice_test_string error: ' + error);
                expect().assertFail();
                done();
            })
        setTimeout(function(){
            power.wakeupDevice("power_wakeupDevice_test_string");
            power.isScreenOn()
            .then(screenOn => {
                console.info('power_wakeupDevice_test_string: The current screenOn is ' + screenOn);
                expect(screenOn).assertTrue();
                console.info('power_wakeupDevice_test_string success');
                done();
            })
            .catch(error => {
                console.log('power_wakeupDevice_test_string error: ' + error);
                expect().assertFail();
                done();
            })
        }, 2000); 
    })

    /**
     * @tc.number power_js_004
     * @tc.name power_suspendDevice_test
     * @tc.desc Try to suspend the device and let screen off
     */
    it('power_suspendDevice_test', 0, async function (done) {
        power.isScreenOn()
            .then(screenOn => {
                console.info('power_suspendDevice_test: The current screenOn is ' + screenOn);
                if (!screenOn) { 
                    power.wakeupDevice("power_suspendDevice_test");
                } 
            })
            .catch(error => {
                console.log('power_suspendDevice_test error: ' + error);
                expect().assertFail();
                done();
            })
        setTimeout(function(){
            power.suspendDevice();
            console.info('power_suspendDevice_test: SuspendDevice end');
            power.isScreenOn()
            .then(screenOn => {
                console.info('power_suspendDevice_test: The current screenOn is ' + screenOn);
                expect(screenOn).assertFalse();
                console.info('power_suspendDevice_test success');
                done();
            })
            .catch(error => {
                console.log('power_suspendDevice_test error: ' + error);
                expect().assertFail();
                done();
            })
        }, 2000); 
    })
})
