/*
 * Copyright (C) 2021-2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_27() {
describe("SensorJsTest_sensor_27", function () {
    beforeAll(function () {

        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll called')
    })

    afterAll(function () {

        /*
         * @tc.teardown: teardown invoked after all testcases
         */
        console.info('afterAll called')
    })

    beforeEach(function () {

        /*
         * @tc.setup: setup invoked before each testcases
         */
        console.info('beforeEach called')
    })

    afterEach(function () {

        /*
         * @tc.teardown: teardown invoked after each testcases
         */
        console.info('afterEach called')
    })

    let DeviceOrientationId = 256

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0010
     * @tc.name: subscribeDeviceOrientationSensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeDeviceOrientationSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------subscribeDeviceOrientationSensorJsTest001---------------------------');
        try{
           sensor.getSingleSensor(DeviceOrientationId ,(error, data) => {
                if (error) {
                    console.info('subscribeDeviceOrientationSensorJsTest006 error');
                    done();
                } else {
                    sensor.subscribeDeviceOrientation({
                        interval: 'game',
                        success: function (data) {
                            console.info("subscribeDeviceOrientationSensorJsTest001 success" + JSON.stringify(data));
                            expect(typeof (data.alpha)).assertEqual("number");
                            expect(typeof (data.beta)).assertEqual("number");
                            expect(typeof (data.gamma)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeDeviceOrientationSensorJsTest001 is failed, data: " + data + ", code: " + code);
                            expect(data).assertEqual('subscribe fail');
                            expect(code).assertEqual(1001);
                            done()
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeDeviceOrientation();
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info('subscribeDeviceOrientationSensorJsTest001 Device does not support! ');
            done();
        }
    })

   /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0020
     * @tc.name: subscribeDeviceOrientationSensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeDeviceOrientationSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientationSensorJsTest002---------------------------');
        try{
           sensor.getSingleSensor(DeviceOrientationId ,(error, data) => {
                if (error) {
                    console.info('subscribeDeviceOrientationSensorJsTest006 error');
                    done();
                } else {
                        sensor.subscribeDeviceOrientation({
                            interval: 'ui',
                            success: function (data) {
                                console.info("subscribeDeviceOrientationSensorJsTest002 success" + JSON.stringify(data));
                                expect(typeof (data.alpha)).assertEqual("number");
                                expect(typeof (data.beta)).assertEqual("number");
                                expect(typeof (data.gamma)).assertEqual("number");
                                done()
                            },
                            fail: function (data, code) {
                                console.log("subscribeDeviceOrientationSensorJsTest002 is failed, data: " + data + ", code: " + code);
                                expect(data).assertEqual('subscribe fail');
                                expect(code).assertEqual(1001);
                                done()
                            },
                        });
                        setTimeout(() => {
                            sensor.unsubscribeDeviceOrientation();
                            done();
                        }, 500);
                }
            })
        } catch (error) {
            console.info('subscribeDeviceOrientationSensorJsTest002 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0030
     * @tc.name: subscribeDeviceOrientationSensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeDeviceOrientationSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientationSensorJsTest003---------------------------');
        try{
           sensor.getSingleSensor(DeviceOrientationId ,(error, data) => {
                if (error) {
                    console.info('subscribeDeviceOrientationSensorJsTest006 error');
                    done();
                } else {
                        sensor.subscribeDeviceOrientation({
                            interval: 'normal',
                            success: function (data) {
                                console.info("subscribeDeviceOrientationSensorJsTest003 success" + JSON.stringify(data));
                                expect(typeof (data.alpha)).assertEqual("number");
                                expect(typeof (data.beta)).assertEqual("number");
                                expect(typeof (data.gamma)).assertEqual("number");
                            },
                            fail: function (data, code) {
                                console.log("subscribeDeviceOrientationSensorJsTest003 is failed, data: " + data + ", code: " + code);
                                expect(data).assertEqual('subscribe fail');
                                expect(code).assertEqual(1001);
                                done()
                            },
                        });
                        setTimeout(() => {
                            sensor.unsubscribeDeviceOrientation();
                            done();
                        }, 500);
                }
            })
        } catch (error) {
            console.info('subscribeDeviceOrientationSensorJsTest003 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0040
     * @tc.name: subscribeDeviceOrientationSensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeDeviceOrientationSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientationSensorJsTest004---------------------------');
        try{
           sensor.getSingleSensor(DeviceOrientationId ,(error, data) => {
                if (error) {
                    console.info('subscribeDeviceOrientationSensorJsTest006 error');
                    done();
                } else {
                            sensor.subscribeDeviceOrientation({
                                interval: 'normal',
                                success: function (data) {
                                    console.info("subscribeDeviceOrientationSensorJsTest004 success" + JSON.stringify(data));
                                    expect(typeof (data.alpha)).assertEqual("number");
                                    expect(typeof (data.beta)).assertEqual("number");
                                    expect(typeof (data.gamma)).assertEqual("number");
                                },
                                fail: function (data, code) {
                                    console.log("subscribeDeviceOrientationSensorJsTest004 is failed, data: " + data + ", code: " + code);
                                    expect(data).assertEqual('subscribe fail');
                                    expect(code).assertEqual(1001);
                                },
                            });

                            sensor.subscribeDeviceOrientation({
                                interval: 'normal',
                                success: function (data) {
                                    console.info("subscribeDeviceOrientationSensorJsTest004_1 success" + JSON.stringify(data));
                                    expect(typeof (data.alpha)).assertEqual("number");
                                    expect(typeof (data.beta)).assertEqual("number");
                                    expect(typeof (data.gamma)).assertEqual("number");
                                },
                                fail: function (data, code) {
                                    console.log("subscribeDeviceOrientationSensorJsTest004_1 is failed, data: " + data + ", code: " + code);
                                    expect(data).assertEqual('subscribe fail');
                                    expect(code).assertEqual(1001);
                                },
                            });
                            setTimeout(() => {
                                sensor.unsubscribeDeviceOrientation();
                                done();
                            }, 500);
                }
            })
        } catch (error) {
            console.info('subscribeDeviceOrientationSensorJsTest004 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0050
     * @tc.name: subscribeDeviceOrientationSensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeDeviceOrientationSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientationSensorJsTest005---------------------------');
        try{
           sensor.getSingleSensor(DeviceOrientationId ,(error, data) => {
                if (error) {
                    console.info('subscribeDeviceOrientationSensorJsTest006 error');
                    done();
                } else {
                    sensor.subscribeDeviceOrientation({
                        interval: 'xxx',
                        success: function (data) {
                            console.info("subscribeDeviceOrientationSensorJsTest005 success" + JSON.stringify(data));
                            expect(typeof (data.alpha)).assertEqual("number");
                            expect(typeof (data.beta)).assertEqual("number");
                            expect(typeof (data.gamma)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeDeviceOrientationSensorJsTest005 is failed, data: " + data + ", code: " + code);
                            expect(data).assertEqual('input error');
                            expect(code).assertEqual(202);
                            done()
                        },
                    });
                }
            })
        } catch (error) {
            console.info('subscribeDeviceOrientationSensorJsTest005 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0060
     * @tc.name: subscribeDeviceOrientationSensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeDeviceOrientationSensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientationSensorJsTest006---------------------------');
        try{
           sensor.getSingleSensor(DeviceOrientationId ,(error, data) => {
                if (error) {
                    console.info('subscribeDeviceOrientationSensorJsTest006 error');
                    done();
                } else {
                    sensor.subscribeDeviceOrientation({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeDeviceOrientationSensorJsTest006 success" + JSON.stringify(data));
                            expect(typeof (data.alpha)).assertEqual("number");
                            expect(typeof (data.beta)).assertEqual("number");
                            expect(typeof (data.gamma)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeDeviceOrientationSensorJsTest006 is failed, data: " + data + ", code: " + code);
                            expect(data).assertEqual('subscribe fail');
                            expect(code).assertEqual(1001);
                            done()
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeDeviceOrientation();
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info('subscribeDeviceOrientationSensorJsTest006 Device does not support! ');
            done();
        }
    })
})}
