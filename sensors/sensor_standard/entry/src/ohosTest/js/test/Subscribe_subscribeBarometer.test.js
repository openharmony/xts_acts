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

export default function SensorJsTest_sensor_26() {
describe("SensorJsTest_sensor_26", function () {
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

    let BarometerId = 8

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeBarometer_JSTest_0010
     * @tc.name:subscribeBarometerSensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeBarometerSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------subscribeBarometerSensorJsTest001---------------------------');
        try{
           sensor.getSingleSensor(BarometerId ,(error, data) => {
                if (error) {
                    console.info('subscribeBarometerSensorJsTest005 error');
                    done();
                } else {
                sensor.subscribeBarometer({
                    success: function (data) {
                        console.info("subscribeBarometerSensorJsTest001 success" + JSON.stringify(data));
                        expect(typeof (data.pressure)).assertEqual("number");
                    },
                    fail: function (data, code) {
                        console.error('subscribeBarometerSensorJsTest001 failed. Code: ' + code + '; Data: ' + data);
                        expect(code).assertEqual(1001);
                    },
                });
                setTimeout(() => {
                  sensor.unsubscribeBarometer();
                  done();
                }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeBarometerSensorJsTest001 Device does not support! ');
            done();
        }
    })

     /*
     * @tc.number:SUB_SensorsSystem_SubscribeBarometer_JSTest_0020
     * @tc.name: subscribeBarometerSensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeBarometerSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeBarometerSensorJsTest002---------------------------');
        try{
           sensor.getSingleSensor(BarometerId ,(error, data) => {
                if (error) {
                    console.info('subscribeBarometerSensorJsTest005 error');
                    done();
                } else {
                sensor.subscribeBarometer({
                    success: function (data) {
                        console.info("subscribeBarometerSensorJsTest002 success:" + JSON.stringify(data));
                        expect(typeof (data.pressure)).assertEqual("number");
                    },
                    fail: function (data, code) {
                        console.error('subscribeBarometerSensorJsTest002 failed. Code: ' + code + '; Data: ' + data);
                        expect(code).assertEqual(1001);
                    },
                });
                sensor.subscribeBarometer({
                    success: function (data) {
                        console.info("subscribeBarometerSensorJsTest002_1 success:" + JSON.stringify(data));
                        expect(typeof (data.pressure)).assertEqual("number");
                    },
                    fail: function (data, code) {
                        console.error('subscribeBarometerSensorJsTest002_1 failed. Code: ' + code + '; Data: ' + data);
                        expect(code).assertEqual(1001);
                    },
                });
                setTimeout(() => {
                   sensor.unsubscribeBarometer();
                   done();
                }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeBarometerSensorJsTest002 Device does not support! ');
            done();
        }
    })

     /*
     * @tc.number:SUB_SensorsSystem_SubscribeBarometer_JSTest_0030
     * @tc.name: subscribeBarometerSensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeBarometerSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeBarometerSensorJsTest003---------------------------');
        try{
           sensor.getSingleSensor(BarometerId ,(error, data) => {
                if (error) {
                    console.info('subscribeBarometerSensorJsTest005 error');
                    done();
                } else {
               sensor.subscribeBarometer({
                    success: function (data) {
                        console.info("subscribeBarometerSensorJsTest003 success:" + JSON.stringify(data));
                        expect(typeof (data.pressure)).assertEqual("number");
                    },
                    fail: function (data, code) {
                        console.error('subscribeBarometerSensorJsTest003 failed. Code: ' + code + '; Data: ' + data);
                        expect(code).assertEqual(1001);
                    },
                });
                setTimeout(() => {
                    sensor.unsubscribeBarometer();
                    done();
                }, 500);
                }
            })
        } catch (error) {
            console.info('subscribeBarometerSensorJsTest003 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeBarometer_JSTest_0040
     * @tc.name: subscribeBarometerSensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeBarometerSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeBarometerSensorJsTest004---------------------------');
        try{
           sensor.getSingleSensor(BarometerId ,(error, data) => {
                if (error) {
                    console.info('subscribeBarometerSensorJsTest004 error');
                    done();
                } else {
                    sensor.subscribeBarometer({
                        success: function (data) {
                            console.info("subscribeBarometerSensorJsTest004 success" + JSON.stringify(data));
                            expect(typeof (data.pressure)).assertEqual("number");
                        },
                        fail: undefined,
                    });

                    sensor.subscribeBarometer({
                        success: function (data) {
                            console.info("subscribeBarometerSensorJsTest004_1 success" + JSON.stringify(data));
                            expect(typeof (data.pressure)).assertEqual("number");
                        },
                        fail: null,
                    });
                    setTimeout(() => {
                    sensor.unsubscribeBarometer();
                    done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeBarometerSensorJsTest004 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeBarometer_JSTest_0050
     * @tc.name: subscribeBarometerSensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeBarometerSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeBarometerSensorJsTest005---------------------------');
        try{
           sensor.getSingleSensor(BarometerId ,(error, data) => {
                if (error) {
                    console.info('subscribeBarometerSensorJsTest005 error');
                    done();
                } else {
                    sensor.subscribeBarometer({
                        success: function (data) {
                            console.info("subscribeBarometerSensorJsTest005 success" + JSON.stringify(data));
                            expect(typeof (data.pressure)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                    sensor.unsubscribeBarometer();
                    done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeBarometerSensorJsTest005 Device does not support! ');
            done();
        }
    })
})}
