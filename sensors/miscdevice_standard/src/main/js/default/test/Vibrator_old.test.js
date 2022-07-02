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
import vibrator from '@system.vibrator';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

describe("VibratorJsTest_misc_1", function () {
     beforeAll(function () {

        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll caled')
    })

    afterAll(function () {

        /*
         * @tc.teardown: teardown invoked after all testcases
         */
        console.info('afterAll caled')
    })

    beforeEach(function () {

        /*
         * @tc.setup: setup invoked before each testcases
         */
        console.info('beforeEach caled')
    })

    afterEach(function () {

        /*
         * @tc.teardown: teardown invoked after each testcases
         */
        console.info('afterEach caled')
    })

    let errMessages = ['Param number is invalid', 'Wrong argument type. function expected',
    'Wrong argument type', 'Wrong argument number']

     let errMessage;
	
    /*
     * @tc.name:SubVibratorJsTest0001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0190
     */
    it("SubVibratorJsTest0001", FUNCTION|MEDIUMTEST|LEVEL0, async function (done) {
        console.info('----------------------SubVibratorJsTest0001---------------------------');
        vibrator.vibrate({
            mode: 'long',
            success: function () {
                console.info("SubVibratorJsTest0001 success");
                done();
            },
            fail: function (data, code) {
                console.log("SubVibratorJsTest0001 is failed, data: " + data + ", code: " + code);
                expect(false).assertTrue();
            },
            complete: function () {
                console.log('SubVibratorJsTest0001 is completed');
            }
        });
    })

    /*
     * @tc.name:SubVibratorJsTest0002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0200
     */
    it("SubVibratorJsTest0002", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------SubVibratorJsTest0002---------------------------');
        vibrator.vibrate({
            mode: 'short',
            success: function () {
                console.info("SubVibratorJsTest0002 success");
                done();
            },
            fail: function (data, code) {
                console.log("SubVibratorJsTest0002 is failed, data: " + data + ", code: " + code);
                expect(false).assertTrue();
            },
            complete: function () {
                console.log('SubVibratorJsTest0002 is completed');
            }
        });
    })

    /*
    * @tc.name:SubVibratorJsTest0003
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0210
    */
    it("SubVibratorJsTest0003", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------SubVibratorJsTest0003---------------------------');
        vibrator.vibrate({
            mode: 'short',
            success: function () {
                console.info("SubVibratorJsTest0003 success");
                done();
            },
            fail: function (data, code) {
                console.error('SubVibratorJsTest0003 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
    })

    /*
    * @tc.name:SubVibratorJsTest0004
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0220
    */
    it("SubVibratorJsTest0004", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------SubVibratorJsTest0004---------------------------');
        vibrator.vibrate({
            mode: 'short',
            success: function () {
                console.info("SubVibratorJsTest0004 success");
                done();
            },
        });
    })

    /*
     * @tc.name:SubVibratorJsTest0005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0230
     */
    it("SubVibratorJsTest0005", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------SubVibratorJsTest0005---------------------------');
        vibrator.vibrate({
            success: function () {
                console.info("SubVibratorJsTest0005 success");
                done();
            },
            fail: function (data, code) {
                console.error('SubVibratorJsTest0005 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
    })

    /*
     * @tc.name:SubVibratorJsTest0006
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0240
     */
    it("SubVibratorJsTest0006", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------SubVibratorJsTest0006---------------------------');
        vibrator.vibrate({
            mode: 'long',
            inInvalid: 2,
            success: function () {
                console.info("SubVibratorJsTest0006 success");
                done();
            },
            fail: function (data, code) {
                console.error('SubVibratorJsTest0006 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
    })

    /*
     * @tc.name:SubVibratorJsTest0007
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0250
     */
    it("SubVibratorJsTest0007", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------SubVibratorJsTest0007---------------------------');
        try {
            vibrator.vibrate({
                mode: 'short',
                success: function () {
                    console.info("SubVibratorJsTest0007 success");
                    expect(false).assertTrue();
                    done();
                },
            }, 25);
        } catch (error) {
            errMessage = error.toString().slice(39);
            console.info('SubVibratorJsTest0007 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
     * @tc.name:SubVibratorJsTest0008
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0260
     */
    it("SubVibratorJsTest0008", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------SubVibratorJsTest0008---------------------------');
        vibrator.vibrate({
            mode: 'short',
            success: function () {
                console.info("SubVibratorJsTest0008 success");
            },
            fail: function (data, code) {
                console.error('SubVibratorJsTest0008 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
        vibrator.vibrate({
            mode: 'short',
            success: function () {
                console.info("SubVibratorJsTest0008_1 success");
            },
            fail: function (data, code) {
                console.error('SubVibratorJsTest0008_1 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
        setTimeout(() => {
            done();
        }, 500);
    })

    /*
     * @tc.name:SubVibratorJsTest0009
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0270
     */
    it("SubVibratorJsTest0009", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------SubVibratorJsTest0009---------------------------');
        try {
            vibrator.vibrate();
        } catch (error) {
            errMessage = error.toString().slice(7);
            console.info('SubVibratorJsTest0009 error:' + error);
            expect(errMessage).assertEqual(errMessages[2]);
            done();
        }
    })

    /*
     * @tc.name:SubVibratorJsTest0010
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0280
     */
    it("SubVibratorJsTest0010", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------SubVibratorJsTest0010---------------------------');
        try {
            vibrator.vibrate({
                mode: 'short',
                success: function () {
                    console.info("SubVibratorJsTest0010 success");
                    expect(false).assertTrue();
                    done();
                },
            }, function () {
            }, 25);
        } catch (error) {
            errMessage = error.toString().slice(39);
            console.info('SubVibratorJsTest0010 error:' + error);
            expect(errMessage).assertEqual(errMessages[3]);
            done();
        }
    })
})
	
	