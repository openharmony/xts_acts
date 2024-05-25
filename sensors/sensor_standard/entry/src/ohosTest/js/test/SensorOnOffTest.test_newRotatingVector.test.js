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

export default function SensorJsTest_sensor_49() {
describe("SensorJsTest_sensor_49", function () {
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
        expect(typeof (data.w)).assertEqual("number");
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
        expect(typeof (data.w)).assertEqual("number");
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
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = 'Service exception.'
    let invalid  = -1;
    let TAG  = '';

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0010
     * @tc.name: newRotatingVectorSensorJsTest001
     * @tc.desc: Functional Use Cases
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newRotatingVectorSensorJsTest001--------------');
        TAG = 'newRotatingVectorSensorJsTest001';
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.ROTATION_VECTOR, callback);
                        setTimeout(()=>{
                            sensor.off(sensor.SensorId.ROTATION_VECTOR);
                            done();
                        }, 500);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0020
     * @tc.name: newRotatingVectorSensorJsTest002
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newRotatingVectorSensorJsTest002--------------');
        TAG = 'newRotatingVectorSensorJsTest002';
        function onSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
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
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0030
     * @tc.name: newRotatingVectorSensorJsTest003
     * @tc.desc: For normal scenarios
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newRotatingVectorSensorJsTest003--------------');
        TAG = 'newRotatingVectorSensorJsTest003';
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.ROTATION_VECTOR, callback, {'interval': 100000000});
                    setTimeout(()=>{
                        console.info('---------newRotatingVectorSensorJsTest003 off in--------------');
                        sensor.off(sensor.SensorId.ROTATION_VECTOR);
                        console.info('---------newRotatingVectorSensorJsTest003 off end--------------');
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0040
     * @tc.name: newRotatingVectorSensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newRotatingVectorSensorJsTest004--------------');
        TAG = 'newRotatingVectorSensorJsTest004';
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
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.ROTATION_VECTOR, onSensorCallback, {'interval': 100000000}, 5);
                    setTimeout(()=>{
                        console.info('---------newRotatingVectorSensorJsTest004 off in--------------');
                        sensor.off(sensor.SensorId.ROTATION_VECTOR);
                        console.info('---------newRotatingVectorSensorJsTest004 off end--------------');
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0050
     * @tc.name: newRotatingVectorSensorJsTest005
     * @tc.desc: Once Normal Subscription Scenario Use Case
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newRotatingVectorSensorJsTest005';
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.once(sensor.SensorId.ROTATION_VECTOR, callback);
                    setTimeout(()=>{
                        expect(true).assertTrue();
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0060
     * @tc.name: newRotatingVectorSensorJsTest006
     * @tc.desc: Use case of illegal parameter passed into once interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newRotatingVectorSensorJsTest006';
        function onceSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
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
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0070
     * @tc.name: newRotatingVectorSensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newRotatingVectorSensorJsTest007';
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
            expect(typeof (data.w)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.once(sensor.SensorId.ROTATION_VECTOR, onceSensorCallback, 5);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0080
     * @tc.name: newRotatingVectorSensorJsTest008
     * @tc.desc: Use case of illegal parameter passed into off interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newRotatingVectorSensorJsTest008';
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
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
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0090
     * @tc.name: newRotatingVectorSensorJsTest009
     * @tc.desc: Unsubscribe directly without waiting after starting subscription
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newRotatingVectorSensorJsTest009';
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
            expect(typeof (data.w)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.ROTATION_VECTOR, onSensorCallback);
                    setTimeout(()=>{
                        sensor.off(sensor.SensorId.ROTATION_VECTOR, onSensorCallback);
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0100
     * @tc.name: newRotatingVectorSensorJsTest010
     * @tc.desc:SensorId1000000 of incoming exception
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newRotatingVectorSensorJsTest010';
        function onSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
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
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0110
     * @tc.name: newRotatingVectorSensorJsTest011
     * @tc.desc:Call interface multiple times
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newRotatingVectorSensorJsTest011';
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.ROTATION_VECTOR, (data)=>{
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
                        expect(typeof (data.w)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    sensor.on(sensor.SensorId.ROTATION_VECTOR, (data)=>{
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
                        expect(typeof (data.w)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    setTimeout(()=>{
                        console.info('---------newRotatingVectorSensorJsTest011 off in--------------');
                        sensor.off(sensor.SensorId.ROTATION_VECTOR);
                        console.info('---------newRotatingVectorSensorJsTest011 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0120
     * @tc.name: newRotatingVectorSensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newRotatingVectorSensorJsTest012';
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    try {
                        sensor.off(sensor.SensorId.ROTATION_VECTOR, 5);
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0130
     * @tc.name: newRotatingVectorSensorJsTest013
     * @tc.desc:Call on interface and once interface respectively, and use an off interface to close
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newRotatingVectorSensorJsTest013--------------');
        TAG = 'newRotatingVectorSensorJsTest013';
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.ROTATION_VECTOR, (data)=>{
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
                        expect(typeof (data.w)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    sensor.once(sensor.SensorId.ROTATION_VECTOR, (data)=>{
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
                        expect(typeof (data.w)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    setTimeout(()=>{
                        console.info('---------newRotatingVectorSensorJsTest013 off in--------------');
                        sensor.off(sensor.SensorId.ROTATION_VECTOR);
                        console.info('---------newRotatingVectorSensorJsTest013 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0140
     * @tc.name: newRotatingVectorSensorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newRotatingVectorSensorJsTest014--------------');
        TAG = 'newRotatingVectorSensorJsTest014';
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.ROTATION_VECTOR, (data)=>{
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
                        expect(typeof (data.w)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    sensor.on(sensor.SensorId.ROTATION_VECTOR, (data)=>{
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
                        expect(typeof (data.w)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    setTimeout(()=>{
                        console.info('---------newRotatingVectorSensorJsTest014 off in--------------');
                        sensor.off(sensor.SensorId.ROTATION_VECTOR);
                        console.info('---------newRotatingVectorSensorJsTest014 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0150
     * @tc.name: newRotatingVectorSensorJsTest015
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newRotatingVectorSensorJsTest015--------------');
        TAG = 'newRotatingVectorSensorJsTest015';
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
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
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                    try {
                        sensor.once();
                    } catch (error) {
                        console.info(TAG + ' once error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                    try {
                        sensor.off();
                    } catch (error) {
                        console.info(TAG + ' off error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

     /*
     * @tc.number: SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0160
     * @tc.name: newRotatingVectorSensorJsTest016
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newRotatingVectorSensorJsTest016--------------');
        TAG = 'newRotatingVectorSensorJsTest016';
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.ROTATION_VECTOR, callback);
                    sensor.on(sensor.SensorId.ROTATION_VECTOR, callback2);
                    setTimeout(() => {
                        console.info('----------------------newRotatingVectorSensorJsTest016 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.ROTATION_VECTOR, callback);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                        }
                        console.info('----------------------newRotatingVectorSensorJsTest016 off end--------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------newRotatingVectorSensorJsTest016 off in--------------');
                        sensor.off(sensor.SensorId.ROTATION_VECTOR, callback2);
                        console.info('----------------------newRotatingVectorSensorJsTest016 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

     /*
     * @tc.number: SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_017
     * @tc.name: newRotatingVectorSensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newRotatingVectorSensorJsTest017--------------');
        TAG = 'newRotatingVectorSensorJsTest017';
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.ROTATION_VECTOR, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorId.ROTATION_VECTOR, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------newRotatingVectorSensorJsTest017 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.ROTATION_VECTOR, callback);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                        }
                        console.info('----------------------newRotatingVectorSensorJsTest017 off end--------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------newRotatingVectorSensorJsTest017_2 off in--------------');
                        sensor.off(sensor.SensorId.ROTATION_VECTOR, callback2);
                        console.info('----------------------newRotatingVectorSensorJsTest017_2 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

     /*
     * @tc.number: SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0180
     * @tc.name: newRotatingVectorSensorJsTest018
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newRotatingVectorSensorJsTest018--------------');
        TAG = 'newRotatingVectorSensorJsTest018';
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    console.info('----------------------newRotatingVectorSensorJsTest018 off in--------------');
                    try{
                        sensor.off(-1, callback);
                        console.info('----------------------newRotatingVectorSensorJsTest018 off end--------------');
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

     /*
     * @tc.number: SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0190
     * @tc.name: newRotatingVectorSensorJsTest019
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newRotatingVectorSensorJsTest019--------------');
        TAG = 'newRotatingVectorSensorJsTest019';
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                        sensor.on(sensor.SensorId.ROTATION_VECTOR, callback, {'interval': -100000000});
                        console.info('----------------------newRotatingVectorSensorJsTest019 off in---------------------------');
                        sensor.off(sensor.SensorId.ROTATION_VECTOR);
                        console.info('----------------------newRotatingVectorSensorJsTest019 off end---------------------------');
                        done();
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                        expect(error.message).assertEqual(SERVICE_EXCEPTION_MSG);
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0200
     * @tc.name: newRotatingVectorSensorJsTest020
     * @tc.desc: Functional Use Cases
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newRotatingVectorSensorJsTest020--------------');
        TAG = 'newRotatingVectorSensorJsTest020';
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.ROTATION_VECTOR, callback, { 'interval': undefined });
                    sensor.on(sensor.SensorId.ROTATION_VECTOR, callback2, { 'interval': undefined });
                    setTimeout(() => {
                        console.info('----------------------newRotatingVectorSensorJsTest020 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.ROTATION_VECTOR, callback);
                            sensor.off(sensor.SensorId.ROTATION_VECTOR, callback2);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                            expect(false).assertTrue();
                        }
                        console.info('----------------------newRotatingVectorSensorJsTest020 off end--------------');
                        done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0210
     * @tc.name: newRotatingVectorSensorJsTest021
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newRotatingVectorSensorJsTest021';
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.ROTATION_VECTOR, callback, undefined);
                    try{
                        sensor.on(sensor.SensorId.ROTATION_VECTOR, callback, { 'interval': undefined });
                    } catch(error){
                        console.info(TAG + ' catch error:' + error);
                    }
                    setTimeout(() => {
                        console.info('----------------------newRotatingVectorSensorJsTest021 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.ROTATION_VECTOR);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                            expect(false).assertTrue();
                        }
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0220
     * @tc.name: newRotatingVectorSensorJsTest022
     * @tc.desc: For normal scenarios
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newRotatingVectorSensorJsTest022--------------');
        TAG = 'newRotatingVectorSensorJsTest022';
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.ROTATION_VECTOR, callback, null);
                    try{
                        sensor.on(sensor.SensorId.ROTATION_VECTOR, callback, { 'interval': null });
                        } catch(error){
                            console.info(TAG + ' catch error:' + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------newRotatingVectorSensorJsTest022 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.ROTATION_VECTOR);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                            expect(false).assertTrue();
                        }
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0230
     * @tc.name: newRotatingVectorSensorJsTest023
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newRotatingVectorSensorJsTest023--------------');
        TAG = 'newRotatingVectorSensorJsTest023';
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.ROTATION_VECTOR, callback, { 'interval': null });
                    setTimeout(() => {
                        console.info('----------------------newRotatingVectorSensorJsTest023 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.ROTATION_VECTOR);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                            expect(false).assertTrue();
                        }
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWROTATION_VECTOR_JSTest_0240
     * @tc.name: newRotatingVectorSensorJsTest024
     * @tc.desc: Once Normal Subscription Scenario Use Case
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newRotatingVectorSensorJsTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newRotatingVectorSensorJsTest024';
        try{
           sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.ROTATION_VECTOR, callback, { 'interval': 100000000 });
                    try{
                        sensor.on(sensor.SensorId.ROTATION_VECTOR, callback, { 'interval': 100000000 });
                    } catch(error){
                        console.info(TAG + ' catch error:' + error);
                    }
                    setTimeout(() => {
                        console.info('----------------------newRotatingVectorSensorJsTest024 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.ROTATION_VECTOR);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                            expect(false).assertTrue();
                        }
                        console.info('----------------------newRotatingVectorSensorJsTest024 off end--------------');
                        done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })
})}
