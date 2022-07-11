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
import sensor from '@system.sensor'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

describe("SensorJsTest_sensor_26", function () {
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

    let errMessages = ['The number of parameters is not valid', 'UnsubscribeSensor failed',
    'Wrong argument type, should be object'];

    let errMessage;

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeBarometer_JSTest_0010
     * @tc.name:subscribeBarometer_SensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeBarometer_SensorJsTest001", FUNCTION|MEDIUMTEST|LEVEL0, async function (done) {
        console.info('----------------------subscribeBarometer_SensorJsTest001---------------------------');
        sensor.subscribeBarometer({
            success: function (data) {
                console.info("subscribeBarometer_SensorJsTest001 success" + JSON.stringify(data));
                expect(typeof (data.pressure)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeBarometer_SensorJsTest001 failed. Code: ' + code + '; Data: ' + data);
                expect(code).assertEqual(1001);
            },
        });
        setTimeout(() => {
            try {
                sensor.unsubscribeBarometer();
            } catch (error) {
                console.info('subscribeBarometer_SensorJsTest001_unsubscribeBarometer error ' + error);
            }
            setTimeout(() => {
                expect(true).assertTrue();
                done();
            }, 500);
        }, 1000);
    })

     /*
     * @tc.number:SUB_SensorsSystem_SubscribeBarometer_JSTest_0020
     * @tc.name: subscribeBarometer_SensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeBarometer_SensorJsTest002", FUNCTION|MEDIUMTEST|LEVEL3, function (done) {
        console.info('----------------------subscribeBarometer_SensorJsTest002---------------------------');
        try {
            sensor.subscribeBarometer({
                success: function (data) {
                    console.info("subscribeBarometer_SensorJsTest002 success:" + JSON.stringify(data));
                    expect(typeof (data.pressure)).assertEqual("number");
                },
                fail: function (data, code) {
                    console.error('subscribeBarometer_SensorJsTest002 failed. Code: ' + code + '; Data: ' + data);
                    expect(code).assertEqual(1001);
                },
            }, 25);
        } catch (error) {
            errMessage = error.toString().slice(19, 56);
            console.info('subscribeBarometer_SensorJsTest002 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

     /*
     * @tc.number:SUB_SensorsSystem_SubscribeBarometer_JSTest_0030
     * @tc.name: subscribeBarometer_SensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeBarometer_SensorJsTest003", FUNCTION|MEDIUMTEST|LEVEL3, function (done) {
        console.info('----------------------subscribeBarometer_SensorJsTest003---------------------------');
        try {
            sensor.subscribeBarometer({
                success: function (data) {
                    console.info("subscribeBarometer_SensorJsTest003 success:" + JSON.stringify(data));
                    expect(typeof (data.pressure)).assertEqual("number");
                },
                fail: function (data, code) {
                    console.error('subscribeBarometer_SensorJsTest003 failed. Code: ' + code + '; Data: ' + data);
                    expect(code).assertEqual(1001);
                },
            }, function () {
            }, 25);
        } catch (error) {
            errMessage = error.toString().slice(19, 56);
            console.info('subscribeBarometer_SensorJsTest003 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

     /*
     * @tc.number:SUB_SensorsSystem_SubscribeBarometer_JSTest_0040
     * @tc.name: subscribeBarometer_SensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeBarometer_SensorJsTest004", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------subscribeBarometer_SensorJsTest004---------------------------');
        try {
            sensor.unsubscribeBarometer('xxx');
        } catch (error) {
            errMessage = error.toString().slice(21, 58);
            console.info('subscribeBarometer_SensorJsTest004 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

     /*
     * @tc.number:SUB_SensorsSystem_SubscribeBarometer_JSTest_0050
     * @tc.name: subscribeBarometer_SensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeBarometer_SensorJsTest005", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------subscribeBarometer_SensorJsTest005---------------------------');
        try {
            sensor.subscribeBarometer();
        } catch (error) {
            errMessage = error.toString().slice(19, 56);
            console.info('subscribeBarometer_SensorJsTest005 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

     /*
     * @tc.number:SUB_SensorsSystem_SubscribeBarometer_JSTest_0060
     * @tc.name: subscribeBarometer_SensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeBarometer_SensorJsTest006", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------subscribeBarometer_SensorJsTest006---------------------------');
        try {
            sensor.subscribeBarometer('xxx');
        } catch (error) {
            errMessage = error.toString().slice(19, 56);
            console.info('subscribeBarometer_SensorJsTest006 error:' + error);
            expect(errMessage).assertEqual(errMessages[2]);
            done();
        }
    })

     /*
     * @tc.number:SUB_SensorsSystem_SubscribeBarometer_JSTest_0070
     * @tc.name: subscribeBarometer_SensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeBarometer_SensorJsTest007", FUNCTION|MEDIUMTEST|LEVEL3, function (done) {
        console.info('----------------------subscribeBarometer_SensorJsTest007---------------------------');
        sensor.subscribeBarometer({
            success: function (data) {
                console.info("subscribeBarometer_SensorJsTest007 success:" + JSON.stringify(data));
                expect(typeof (data.pressure)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeBarometer_SensorJsTest007 failed. Code: ' + code + '; Data: ' + data);
                expect(code).assertEqual(1001);
            },
        });
        sensor.subscribeBarometer({
            success: function (data) {
                console.info("subscribeBarometer_SensorJsTest007_1 success:" + JSON.stringify(data));
                expect(typeof (data.pressure)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeBarometer_SensorJsTest007_1 failed. Code: ' + code + '; Data: ' + data);
                expect(code).assertEqual(1001);
            },
        });
        setTimeout(() => {
            try {
                sensor.unsubscribeBarometer();
            } catch (error) {
                console.info('subscribeBarometer_SensorJsTest007_unsubscribeBarometer error' + error);
            }
            setTimeout(() => {
                expect(true).assertTrue();
                done();
            }, 500);
        }, 1000);
    })

     /*
     * @tc.number:SUB_SensorsSystem_SubscribeBarometer_JSTest_0080
     * @tc.name: subscribeBarometer_SensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeBarometer_SensorJsTest008", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------subscribeBarometer_SensorJsTest008---------------------------');
        try {
            sensor.unsubscribeBarometer();
        } catch (error) {
            errMessage = error.toString().slice(21, 45);
            console.info('subscribeBarometer_SensorJsTest008 error:' + error);
            expect(errMessage).assertEqual(errMessages[1]);
            done();
        }
    })

     /*
     * @tc.number:SUB_SensorsSystem_SubscribeBarometer_JSTest_0090
     * @tc.name: subscribeBarometer_SensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeBarometer_SensorJsTest009", FUNCTION|MEDIUMTEST|LEVEL3, function (done) {
        console.info('----------------------subscribeBarometer_SensorJsTest009---------------------------');
        sensor.subscribeBarometer({
            success: function (data) {
                console.info("subscribeBarometer_SensorJsTest009 success:" + JSON.stringify(data));
                expect(typeof (data.pressure)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeBarometer_SensorJsTest009 failed. Code: ' + code + '; Data: ' + data);
                expect(code).assertEqual(1001);
            },
        });
        try {
            sensor.unsubscribeBarometer();
        } catch (error) {
            console.info('subscribeBarometer_SensorJsTest009_unsubscribeBarometer error' + error);
        }
        setTimeout(() => {
            expect(true).assertTrue();
            done();
        }, 500);
    })
})

    