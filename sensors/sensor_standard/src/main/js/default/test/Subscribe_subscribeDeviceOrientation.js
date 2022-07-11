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

describe("SensorJsTest_sensor_27", function () {
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

    let errMessages = ['The number of parameters is not valid', 'Wrong argument type, should be object',
    'UnsubscribeSensor failed'];

    let errMessage;

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0010
     * @tc.name: subscribeDeviceOrientation_SensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest001", FUNCTION|MEDIUMTEST|LEVEL0, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest001---------------------------');
        sensor.subscribeDeviceOrientation({
            interval: 'game',
            success: function (data) {
                console.info("subscribeDeviceOrientation_SensorJsTest001 success" + JSON.stringify(data));
                expect(typeof (data.alpha)).assertEqual("number");
                expect(typeof (data.beta)).assertEqual("number");
                expect(typeof (data.gamma)).assertEqual("number");
            },
            fail: function (data, code) {
                console.log("subscribeDeviceOrientation_SensorJsTest001 failed, data: " + data + ", code: " + code);
                expect(false).assertTrue();
            },
        });

        setTimeout(() => {
            try {
                sensor.unsubscribeDeviceOrientation();
            } catch (error) {
                console.info('subscribeDeviceOrientation_SensorJsTest001_unsubscribeDeviceOrientation error' + error);
                expect(false).assertTrue();
            }
            setTimeout(() => {
                expect(true).assertTrue();
                done();
            }, 500);
        }, 1000);
    })

   /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0020
     * @tc.name: subscribeDeviceOrientation_SensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest002", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest002---------------------------');
        sensor.subscribeDeviceOrientation({
            interval: 'ui',
            success: function (data) {
                console.info("subscribeDeviceOrientation_SensorJsTest002 success" + JSON.stringify(data));
                expect(typeof (data.alpha)).assertEqual("number");
                expect(typeof (data.beta)).assertEqual("number");
                expect(typeof (data.gamma)).assertEqual("number");
            },
            fail: function (data, code) {
                console.log("subscribeDeviceOrientation_SensorJsTest002 failed, data: " + data + ", code: " + code);
                expect(false).assertTrue();
            },
        });

        setTimeout(() => {
            try {
                sensor.unsubscribeDeviceOrientation();
            } catch (error) {
                console.info('subscribeDeviceOrientation_SensorJsTest002_unsubscribeDeviceOrientation error' + error);
                expect(false).assertTrue();
            }
            setTimeout(() => {
                expect(true).assertTrue();
                done();
            }, 500);
        }, 1000);
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0030
     * @tc.name: subscribeDeviceOrientation_SensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest003", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest003---------------------------');
        sensor.subscribeDeviceOrientation({
            interval: 'normal',
            success: function (data) {
                console.info("subscribeDeviceOrientation_SensorJsTest003 success" + JSON.stringify(data));
                expect(typeof (data.alpha)).assertEqual("number");
                expect(typeof (data.beta)).assertEqual("number");
                expect(typeof (data.gamma)).assertEqual("number");
            },
            fail: function (data, code) {
                console.log("subscribeDeviceOrientation_SensorJsTest003 failed, data: " + data + ", code: " + code);
                expect(false).assertTrue();
            },
        });

        setTimeout(() => {
            try {
                sensor.unsubscribeDeviceOrientation();
            } catch (error) {
                console.info('subscribeDeviceOrientation_SensorJsTest003_ unsubscribeDeviceOrientation error' + error);
                expect(false).assertTrue();
            }
            setTimeout(() => {
                expect(true).assertTrue();
                done();
            }, 500);
        }, 1000);
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0040
     * @tc.name: subscribeDeviceOrientation_SensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest004", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest004---------------------------');
        try {
            sensor.subscribeDeviceOrientation({
                interval: 'normal',
                success: function (data) {
                    console.info("subscribeDeviceOrientation_SensorJsTest004 success" + JSON.stringify(data));
                    expect(typeof (data.alpha)).assertEqual("number");
                    expect(typeof (data.beta)).assertEqual("number");
                    expect(typeof (data.gamma)).assertEqual("number");
                },
                fail: function (data, code) {
                    console.log("subscribeDeviceOrientation_SensorJsTest004 failed, data：" + data + ", code: " + code);
                    expect(false).assertTrue();
                },
            }, 25);
        } catch (error) {
            errMessage = error.toString().slice(19, 56);
            console.info('subscribeDeviceOrientation_SensorJsTest004 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0050
     * @tc.name: subscribeDeviceOrientation_SensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest005", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest005---------------------------');
        try {
            sensor.subscribeDeviceOrientation({
                interval: 'normal',
                success: function (data) {
                    console.info("subscribeDeviceOrientation_SensorJsTest005 success" + JSON.stringify(data));
                    expect(typeof (data.alpha)).assertEqual("number");
                    expect(typeof (data.beta)).assertEqual("number");
                    expect(typeof (data.gamma)).assertEqual("number");
                },
                fail: function (data, code) {
                    console.log("subscribeDeviceOrientation_SensorJsTest005 failed, data: " + data + ", code: " + code);
                    expect(false).assertTrue();
                },
            }, function () {
            }, 25);
        } catch (error) {
            errMessage = error.toString().slice(19, 56);
            console.info('subscribeDeviceOrientation_SensorJsTest005 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0060
     * @tc.name: subscribeDeviceOrientation_SensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest006", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest006---------------------------');
        sensor.subscribeDeviceOrientation({
            interval: 'normal',
            success: function (data) {
                console.info("subscribeDeviceOrientation_SensorJsTest006 success" + JSON.stringify(data));
                expect(typeof (data.alpha)).assertEqual("number");
                expect(typeof (data.beta)).assertEqual("number");
                expect(typeof (data.gamma)).assertEqual("number");
            },
            fail: function (data, code) {
                console.log("subscribeDeviceOrientation_SensorJsTest006 failed, data: " + data + ", code: " + code);
                expect(false).assertTrue();
            },
        });

        sensor.subscribeDeviceOrientation({
            interval: 'normal',
            success: function (data) {
                console.info("subscribeDeviceOrientation_SensorJsTest006_1 success" + JSON.stringify(data));
                expect(typeof (data.alpha)).assertEqual("number");
                expect(typeof (data.beta)).assertEqual("number");
                expect(typeof (data.gamma)).assertEqual("number");
            },
            fail: function (data, code) {
                console.log("subscribeDeviceOrientation_SensorJsTest006_1 failed, data: " + data + ", code: " + code);
                expect(false).assertTrue();
            },
        });

        setTimeout(() => {
            try {
                sensor.unsubscribeDeviceOrientation();
            } catch (error) {
                console.info('subscribeDeviceOrientation_SensorJsTest006_unsubscribeDeviceOrientation error' + error);
                expect(false).assertTrue();
            }
            setTimeout(() => {
                expect(true).assertTrue();
                done();
            }, 500);
        }, 1000);
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0070
     * @tc.name: subscribeDeviceOrientation_SensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest007", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest007---------------------------');
        try {
            sensor.subscribeDeviceOrientation();
        } catch (error) {
            errMessage = error.toString().slice(19, 56);
            console.info('subscribeDeviceOrientation_SensorJsTest007 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0080
     * @tc.name: subscribeDeviceOrientation_SensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest008", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest008---------------------------');
        try {
            sensor.subscribeDeviceOrientation('xxx');
        } catch (error) {
            errMessage = error.toString().slice(19, 56);
            console.info('subscribeDeviceOrientation_SensorJsTest008 error:' + error);
            expect(errMessage).assertEqual(errMessages[1]);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0090
     * @tc.name: subscribeDeviceOrientation_SensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest009", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest009---------------------------');
        try {
            sensor.unsubscribeDeviceOrientation('xxx');
        } catch (error) {
            errMessage = error.toString().slice(21, 58);
            console.info('subscribeDeviceOrientation_SensorJsTest009 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

   /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0100
     * @tc.name: subscribeDeviceOrientation_SensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest010", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest010---------------------------');
        sensor.subscribeDeviceOrientation({
            interval: 'xxx',
            success: function (data) {
                console.info("subscribeDeviceOrientation_SensorJsTest010 success" + JSON.stringify(data));
                expect(typeof (data.alpha)).assertEqual("number");
                expect(typeof (data.beta)).assertEqual("number");
                expect(typeof (data.gamma)).assertEqual("number");
            },
            fail: function (data, code) {
                console.log("subscribeDeviceOrientation_SensorJsTest010 failed, data: " + data + ", code: " + code);
                expect(code).assertEqual(202);
                done();
            },
        });
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0110
     * @tc.name: subscribeDeviceOrientation_SensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest011", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest011---------------------------');
        try {
            sensor.unsubscribeDeviceOrientation();
        } catch (error) {
            errMessage = error.toString().slice(21, 45);
            console.info('subscribeDeviceOrientation_SensorJsTest011 error:' + error);
            expect(errMessage).assertEqual(errMessages[2]);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0120
     * @tc.name: subscribeDeviceOrientation_SensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest012", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest012---------------------------');
        sensor.subscribeDeviceOrientation({
            interval: 'normal',
            success: function (data) {
                console.info("subscribeDeviceOrientation_SensorJsTest012 success" + JSON.stringify(data));
                expect(typeof (data.alpha)).assertEqual("number");
                expect(typeof (data.beta)).assertEqual("number");
                expect(typeof (data.gamma)).assertEqual("number");
                done();
            },
        });
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0130
     * @tc.name: subscribeDeviceOrientation_SensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest013", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest013---------------------------');
        sensor.subscribeDeviceOrientation({
            interval: 'normal',
            success: function (data) {
                console.info("subscribeDeviceOrientation_SensorJsTest013 success" + JSON.stringify(data));
                expect(typeof (data.alpha)).assertEqual("number");
                expect(typeof (data.beta)).assertEqual("number");
                expect(typeof (data.gamma)).assertEqual("number");
                done();
            },
            fail: function (data, code) {
                console.log("subscribeDeviceOrientation_SensorJsTest013 failed, data: " + data + ", code: " + code);
                expect(false).assertTrue();
            },
        });
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_010
     * @tc.name: subscribeDeviceOrientation_SensorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest014", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest014---------------------------');
        sensor.subscribeDeviceOrientation({
            interval: 'normal',
            success: function (data) {
                console.info("subscribeDeviceOrientation_SensorJsTest014 success" + JSON.stringify(data));
                expect(typeof (data.alpha)).assertEqual("number");
                expect(typeof (data.beta)).assertEqual("number");
                expect(typeof (data.gamma)).assertEqual("number");
            },
            fail: function (data, code) {
                console.log("subscribeDeviceOrientation_SensorJsTest014 failed, data: " + data + ", code: " + code);
                expect(false).assertTrue();
            },
        });

        try {
            sensor.unsubscribeDeviceOrientation();
        } catch (error) {
            console.info('subscribeDeviceOrientation_SensorJsTest014_unsubscribeDeviceOrientation error' + error);
        }
        setTimeout(() => {
            expect(true).assertTrue();
            done();
        }, 500);
    })
})