/*
 * Copyright (C) 2023-2024 Huawei Device Co., Ltd.
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
import sensor from '@ohos.sensor'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_43() {
describe("SensorJsTest_sensor_43", function () {
    function callback(data) {
        console.info("callback" + JSON.stringify(data));
        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
            sensor.SensorAccuracy.ACCURACY_HIGH) {
            console.info('callback accuracy verified' + JSON.stringify(data));
            expect(true).assertTrue();
        } else {
            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
            expect(false).assertTrue();
        }
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        console.info("callback2" + JSON.stringify(data));
        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
            sensor.SensorAccuracy.ACCURACY_HIGH) {
            console.info('callback accuracy verified' + JSON.stringify(data));
            expect(true).assertTrue();
        } else {
            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
            expect(false).assertTrue();
        }
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

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

    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const SENSOR_NO_SUPPORT_CODE = 14500102
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = "Service exception.Possible causes:" +
        "1. Sensor hdf service exception;2. Sensor service ipc exception;3. Sensor data channel exception."
    let invalid  = -1;
    let TAG  = '';

    /*
    * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0010
    * @tc.name: newGyroScope_SensorJsTest001
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGyroScope_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGyroScope_SensorJsTest001--------------');
        TAG = 'newGyroScope_SensorJsTest001';
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GYROSCOPE, callback);
                        setTimeout(()=>{
                            sensor.off(sensor.SensorId.GYROSCOPE);
                            done();
                        }, 500);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0020
     * @tc.name: newGyroScope_SensorJsTest002
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGyroScope_SensorJsTest002--------------');
        TAG = 'newGyroScope_SensorJsTest002';
        function onSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    try {
                        sensor.on(invalid, onSensorCallback);
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0030
     * @tc.name: newGyroScope_SensorJsTest003
     * @tc.desc: For normal scenarios
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGyroScope_SensorJsTest003--------------');
        TAG = 'newGyroScope_SensorJsTest003';
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GYROSCOPE, callback, {'interval': 100000000});
                    setTimeout(()=>{
                        console.info('---------newGyroScope_SensorJsTest003 off in--------------');
                        sensor.off(sensor.SensorId.GYROSCOPE);
                        console.info('---------newGyroScope_SensorJsTest003 off end--------------');
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0040
     * @tc.name: newGyroScope_SensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGyroScope_SensorJsTest004--------------');
        TAG = 'newGyroScope_SensorJsTest004';
        function onSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                sensor.SensorAccuracy.ACCURACY_HIGH) {
                console.info('callback accuracy verified' + JSON.stringify(data));
                expect(true).assertTrue();
            } else {
                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                expect(false).assertTrue();
            }
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GYROSCOPE, onSensorCallback, {'interval': 100000000}, 5);
                    setTimeout(()=>{
                        console.info('---------newGyroScope_SensorJsTest004 off in--------------');
                        sensor.off(sensor.SensorId.GYROSCOPE);
                        console.info('---------newGyroScope_SensorJsTest004 off end--------------');
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0050
     * @tc.name: newGyroScope_SensorJsTest005
     * @tc.desc: Once Normal Subscription Scenario Use Case
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newGyroScope_SensorJsTest005';
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.once(sensor.SensorId.GYROSCOPE, callback);
                    setTimeout(()=>{
                        expect(true).assertTrue();
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0060
     * @tc.name: newGyroScope_SensorJsTest006
     * @tc.desc: Use case of illegal parameter passed into once interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newGyroScope_SensorJsTest006';
        function onceSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    try {
                        sensor.once(invalid, onceSensorCallback);
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0070
     * @tc.name: newGyroScope_SensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newGyroScope_SensorJsTest007';
        function onceSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                sensor.SensorAccuracy.ACCURACY_HIGH) {
                console.info('callback accuracy verified' + JSON.stringify(data));
                expect(true).assertTrue();
            } else {
                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                expect(false).assertTrue();
            }
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.once(sensor.SensorId.GYROSCOPE, onceSensorCallback, 5);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0080
     * @tc.name: newGyroScope_SensorJsTest008
     * @tc.desc: Use case of illegal parameter passed into off interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newGyroScope_SensorJsTest008';
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    try {
                        sensor.off(invalid, callback);
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0090
     * @tc.name: newGyroScope_SensorJsTest009
     * @tc.desc: Unsubscribe directly without waiting after starting subscription
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newGyroScope_SensorJsTest009';
        function onSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                sensor.SensorAccuracy.ACCURACY_HIGH) {
                console.info('callback accuracy verified' + JSON.stringify(data));
                expect(true).assertTrue();
            } else {
                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                expect(false).assertTrue();
            }
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GYROSCOPE, onSensorCallback);
                    setTimeout(()=>{
                        sensor.off(sensor.SensorId.GYROSCOPE, onSensorCallback);
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0100
     * @tc.name: newGyroScope_SensorJsTest010
     * @tc.desc:SensorId1000000 of incoming exception
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newGyroScope_SensorJsTest010';
        function onSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    try {
                        sensor.off(1000000, onSensorCallback);
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0110
     * @tc.name: newGyroScope_SensorJsTest011
     * @tc.desc:Call interface multiple times
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newGyroScope_SensorJsTest011';
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GYROSCOPE, (data)=>{
                        console.info(TAG + ' Callback in!' + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.x)).assertEqual("number");
                        expect(typeof (data.y)).assertEqual("number");
                        expect(typeof (data.z)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    sensor.on(sensor.SensorId.GYROSCOPE, (data)=>{
                        console.info(TAG + ' Callback2 in!' + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.x)).assertEqual("number");
                        expect(typeof (data.y)).assertEqual("number");
                        expect(typeof (data.z)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    setTimeout(()=>{
                        console.info('---------newGyroScope_SensorJsTest011 off in--------------');
                        sensor.off(sensor.SensorId.GYROSCOPE);
                        console.info('---------newGyroScope_SensorJsTest011 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0120
     * @tc.name: newGyroScope_SensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        TAG = 'newGyroScope_SensorJsTest012';
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    try {
                        sensor.off(sensor.SensorId.GYROSCOPE, 5);
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0130
     * @tc.name: newGyroScope_SensorJsTest013
     * @tc.desc:Call on interface and once interface respectively, and use an off interface to close
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGyroScope_SensorJsTest013--------------');
        TAG = 'newGyroScope_SensorJsTest013';
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GYROSCOPE, (data)=>{
                        console.info(TAG + ' Callback in!' + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.x)).assertEqual("number");
                        expect(typeof (data.y)).assertEqual("number");
                        expect(typeof (data.z)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    sensor.once(sensor.SensorId.GYROSCOPE, (data)=>{
                        console.info(TAG + ' Callback2 in!' + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.x)).assertEqual("number");
                        expect(typeof (data.y)).assertEqual("number");
                        expect(typeof (data.z)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    setTimeout(()=>{
                        console.info('---------newGravity_SensorJsTest013 off in--------------');
                        sensor.off(sensor.SensorId.GYROSCOPE);
                        console.info('---------newGravity_SensorJsTest013 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0140
     * @tc.name: newGyroScope_SensorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGyroScope_SensorJsTest014--------------');
        TAG = 'newGyroScope_SensorJsTest014';
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GYROSCOPE, (data)=>{
                        console.info(TAG + ' Callback in!' + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.x)).assertEqual("number");
                        expect(typeof (data.y)).assertEqual("number");
                        expect(typeof (data.z)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    sensor.on(sensor.SensorId.GYROSCOPE, (data)=>{
                        console.info(TAG + ' Callback2 in!' + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.x)).assertEqual("number");
                        expect(typeof (data.y)).assertEqual("number");
                        expect(typeof (data.z)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    setTimeout(()=>{
                        console.info('---------newGravity_SensorJsTest014 off in--------------');
                        sensor.off(sensor.SensorId.GYROSCOPE);
                        console.info('---------newGravity_SensorJsTest014 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0150
     * @tc.name: newGyroScope_SensorJsTest015
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGyroScope_SensorJsTest015--------------');
        TAG = 'newGyroScope_SensorJsTest015';
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    try {
                            sensor.on();
                        } catch (error) {
                            console.info(TAG + ' on error:' + error);
                            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                            done();
                        }
                        try {
                            sensor.once();
                        } catch (error) {
                            console.info(TAG + ' once error:' + error);
                            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                            done();
                        }
                        try {
                            sensor.off();
                        } catch (error) {
                            console.info(TAG + ' off error:' + error);
                            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                            done();
                        }
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

     /*
     * @tc.number: SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0160
     * @tc.name: newGyroScope_SensorJsTest016
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newGyroScope_SensorJsTest016--------------');
        TAG = 'newGyroScope_SensorJsTest016';
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GYROSCOPE, callback);
                    sensor.on(sensor.SensorId.GYROSCOPE, callback2);
                    setTimeout(() => {
                        console.info('----------------------newGyroScope_SensorJsTest016 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.GYROSCOPE, callback);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                        }
                        console.info('----------------------newGyroScope_SensorJsTest016 off end--------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------newGyroScope_SensorJsTest016 off in--------------');
                        sensor.off(sensor.SensorId.GYROSCOPE, callback2);
                        console.info('----------------------newGyroScope_SensorJsTest016 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

     /*
     * @tc.number: SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0170
     * @tc.name: newGyroScope_SensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newGyroScope_SensorJsTest017';
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GYROSCOPE, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorId.GYROSCOPE, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        try {
                            sensor.off(sensor.SensorId.GYROSCOPE, callback);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                        }
                    }, 500);
                    setTimeout(() => {
                        sensor.off(sensor.SensorId.GYROSCOPE, callback2);
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

     /*
     * @tc.number: SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0180
     * @tc.name: newGyroScope_SensorJsTest018
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newGyroScope_SensorJsTest018';
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    try{
                        sensor.off(-1, callback);
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

     /*
     * @tc.number: SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0190
     * @tc.name: newGyroScope_SensorJsTest019
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newGyroScope_SensorJsTest019';
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                        sensor.on(sensor.SensorId.GYROSCOPE, callback, {'interval': -100000000});
                        sensor.off(sensor.SensorId.GYROSCOPE);
                        done();
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0200
     * @tc.name: newGyroScope_SensorJsTest020
     * @tc.desc: Functional Use Cases
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newGyroScope_SensorJsTest020';
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GYROSCOPE, callback, { 'interval': undefined });
                    sensor.on(sensor.SensorId.GYROSCOPE, callback2, { 'interval': undefined });
                    setTimeout(() => {
                        try {
                            sensor.off(sensor.SensorId.GYROSCOPE, callback);
                            sensor.off(sensor.SensorId.GYROSCOPE, callback2);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                            expect(false).assertTrue();
                        }
                        done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0210
     * @tc.name: newGyroScope_SensorJsTest021
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newGyroScope_SensorJsTest021';
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GYROSCOPE, callback, undefined);
                    try{
                        sensor.on(sensor.SensorId.GYROSCOPE, callback, { 'interval': undefined });
                    } catch(error){
                        console.info(TAG + ' catch error:' + error);
                    }
                    setTimeout(() => {
                        console.info('----------------------newGyroScope_SensorJsTest021 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.GYROSCOPE);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                            expect(false).assertTrue();
                        }
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0220
     * @tc.name: newGyroScope_SensorJsTest022
     * @tc.desc: For normal scenarios
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGyroScope_SensorJsTest022--------------');
        TAG = 'newGyroScope_SensorJsTest022';
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GYROSCOPE, callback, null);
                    try{
                            sensor.on(sensor.SensorId.GYROSCOPE, callback, { 'interval': null });
                        } catch(error){
                            console.info(TAG + ' catch error:' + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------newGyroScope_SensorJsTest022 off in--------------');
                        try {
                                sensor.off(sensor.SensorId.GYROSCOPE);
                            } catch (error) {
                                console.info(TAG + ' catch error:' + error);
                                expect(false).assertTrue();
                            }
                            done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0230
     * @tc.name: newGyroScope_SensorJsTest023
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGyroScope_SensorJsTest023--------------');
        TAG = 'newGyroScope_SensorJsTest023';
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GYROSCOPE, callback, { 'interval': null });
                    setTimeout(() => {
                        console.info('----------------------newGyroScope_SensorJsTest023 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.GYROSCOPE);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                            expect(false).assertTrue();
                        }
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWGYROSCOPE_JSTest_0240
     * @tc.name: newGyroScope_SensorJsTest024
     * @tc.desc: Once Normal Subscription Scenario Use Case
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newGyroScope_SensorJsTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newGyroScope_SensorJsTest024';
        try{
           sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GYROSCOPE, callback, { 'interval': 100000000 });
                    try{
                        sensor.on(sensor.SensorId.GYROSCOPE, callback, { 'interval': 100000000 });
                        } catch(error){
                            console.info(TAG + ' catch error:' + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------newGyroScope_SensorJsTest024 off in--------------');
                        try {
                                sensor.off(sensor.SensorId.GYROSCOPE);
                            } catch (error) {
                                console.info(TAG + ' catch error:' + error);
                                expect(false).assertTrue();
                            }
                        console.info('----------------------newGyroScope_SensorJsTest024 off end--------------');
                            done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })
})}
