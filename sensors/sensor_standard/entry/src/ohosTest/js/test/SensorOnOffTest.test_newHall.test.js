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

export default function SensorJsTest_sensor_45() {
describe("SensorJsTest_sensor_45", function () {
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
        expect(typeof (data.status)).assertEqual("number");
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
        expect(typeof (data.status)).assertEqual("number");
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
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0010
     * @tc.name: newHallSensorJsTest001
     * @tc.desc: Functional Use Cases
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newHallSensorJsTest001--------------');
        TAG = 'newHallSensorJsTest001';
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.HALL, callback);
                        setTimeout(()=>{
                            sensor.off(sensor.SensorId.HALL);
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
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0020
     * @tc.name: newHallSensorJsTest002
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newHallSensorJsTest002--------------');
        TAG = 'newHallSensorJsTest002';
        function onSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
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
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0030
     * @tc.name: newHallSensorJsTest003
     * @tc.desc: For normal scenarios
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newHallSensorJsTest003--------------');
        TAG = 'newHallSensorJsTest003';
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.HALL, callback, {'interval': 100000000});
                    setTimeout(()=>{
                        console.info('---------newHallSensorJsTest003 off in--------------');
                        sensor.off(sensor.SensorId.HALL);
                        console.info('---------newHallSensorJsTest003 off end--------------');
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
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0040
     * @tc.name: newHallSensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newHallSensorJsTest004--------------');
        TAG = 'newHallSensorJsTest004';
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
            expect(typeof (data.status)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.HALL, onSensorCallback, {'interval': 100000000}, 5);
                    setTimeout(()=>{
                        console.info('---------newHallSensorJsTest004 off in--------------');
                        sensor.off(sensor.SensorId.HALL);
                        console.info('---------newHallSensorJsTest004 off end--------------');
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
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0050
     * @tc.name: newHallSensorJsTest005
     * @tc.desc: Once Normal Subscription Scenario Use Case
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newHallSensorJsTest005';
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.once(sensor.SensorId.HALL, callback);
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
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0060
     * @tc.name: newHallSensorJsTest006
     * @tc.desc: Use case of illegal parameter passed into once interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newHallSensorJsTest006';
        function onceSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
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
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0070
     * @tc.name: newHallSensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newHallSensorJsTest007';
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
            expect(typeof (data.status)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.once(sensor.SensorId.HALL, onceSensorCallback, 5);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0080
     * @tc.name: newHallSensorJsTest008
     * @tc.desc: Use case of illegal parameter passed into off interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newHallSensorJsTest008';
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
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
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0090
     * @tc.name: newHallSensorJsTest009
     * @tc.desc: Unsubscribe directly without waiting after starting subscription
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newHallSensorJsTest009';
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
            expect(typeof (data.status)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.HALL, onSensorCallback);
                    setTimeout(()=>{
                        sensor.off(sensor.SensorId.HALL, onSensorCallback);
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
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0100
     * @tc.name: newHallSensorJsTest010
     * @tc.desc:SensorId1000000 of incoming exception
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newHallSensorJsTest010';
        function onSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done()
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
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
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0110
     * @tc.name: newHallSensorJsTest011
     * @tc.desc:Call interface multiple times
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newHallSensorJsTest011';
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.HALL, (data)=>{
                        console.info(TAG + ' Callback in!' + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.status)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    sensor.on(sensor.SensorId.HALL, (data)=>{
                        console.info(TAG + ' Callback2 in!' + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.status)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    setTimeout(()=>{
                        console.info('---------newHallSensorJsTest011 off in--------------');
                        sensor.off(sensor.SensorId.HALL);
                        console.info('---------newHallSensorJsTest011 off end--------------');
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
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0120
     * @tc.name: newHallSensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        TAG = 'newHallSensorJsTest012';
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    try {
                        sensor.off(sensor.SensorId.HALL, 5);
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
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0130
     * @tc.name: newHallSensorJsTest013
     * @tc.desc:Call on interface and once interface respectively, and use an off interface to close
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newHallSensorJsTest013--------------');
        TAG = 'newHallSensorJsTest013';
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.HALL, (data)=>{
                        console.info(TAG + ' Callback in!' + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.status)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    sensor.once(sensor.SensorId.HALL, (data)=>{
                        console.info(TAG + ' Callback2 in!' + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.status)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    setTimeout(()=>{
                        console.info('---------newHallSensorJsTest013 off in--------------');
                        sensor.off(sensor.SensorId.HALL);
                        console.info('---------newHallSensorJsTest013 off end--------------');
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
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0140
     * @tc.name: newHallSensorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newHallSensorJsTest014--------------');
        TAG = 'newHallSensorJsTest014';
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.HALL, (data)=>{
                        console.info(TAG + ' Callback in!' + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.status)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    sensor.on(sensor.SensorId.HALL, (data)=>{
                        console.info(TAG + ' Callback2 in!' + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.status)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    setTimeout(()=>{
                        console.info('---------newHallSensorJsTest014 off in--------------');
                        sensor.off(sensor.SensorId.HALL);
                        console.info('---------newHallSensorJsTest014 off end--------------');
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
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0150
     * @tc.name: newHallSensorJsTest015
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newHallSensorJsTest015--------------');
        TAG = 'newHallSensorJsTest015';
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
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
     * @tc.number: SUB_SensorsSystem_NEWHALL_JSTest_0160
     * @tc.name: newHallSensorJsTest016
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newHallSensorJsTest016--------------');
        TAG = 'newHallSensorJsTest016';
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.HALL, callback);
                    sensor.on(sensor.SensorId.HALL, callback2);
                    setTimeout(() => {
                        console.info('----------------------newHallSensorJsTest016 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.HALL, callback);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                        }
                        console.info('----------------------newHallSensorJsTest016 off end--------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------newHallSensorJsTest016 off in--------------');
                        sensor.off(sensor.SensorId.HALL, callback2);
                        console.info('----------------------newHallSensorJsTest016 off end--------------');
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
     * @tc.number: SUB_SensorsSystem_NEWHALL_JSTest_0170
     * @tc.name: newHallSensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newHallSensorJsTest017--------------');
        TAG = 'newHallSensorJsTest017';
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.HALL, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorId.HALL, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------newHallSensorJsTest017 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.HALL, callback);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                        }
                        console.info('----------------------newHallSensorJsTest017 off end--------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------newHallSensorJsTest017_2 off in--------------');
                        sensor.off(sensor.SensorId.HALL, callback2);
                        console.info('----------------------newHallSensorJsTest017_2 off end--------------');
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
     * @tc.number: SUB_SensorsSystem_NEWHALL_JSTest_0180
     * @tc.name: newHallSensorJsTest018
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newHallSensorJsTest018--------------');
        TAG = 'newHallSensorJsTest018';
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    console.info('----------------------newHallSensorJsTest018 off in--------------');
                    try{
                        sensor.off(-1, callback);
                        console.info('----------------------newHallSensorJsTest018 off end--------------');
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
     * @tc.number: SUB_SensorsSystem_NEWHALL_JSTest_0190
     * @tc.name: newHallSensorJsTest019
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newHallSensorJsTest019--------------');
        TAG = 'newHallSensorJsTest019';
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                        sensor.on(sensor.SensorId.HALL, callback, {'interval': -100000000});
                        console.info('----------------------newHallSensorJsTest019 off in---------------------------');
                        sensor.off(sensor.SensorId.HALL);
                        console.info('----------------------newHallSensorJsTest019 off end---------------------------');
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
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0200
     * @tc.name: newHallSensorJsTest020
     * @tc.desc: Functional Use Cases
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newHallSensorJsTest020--------------');
        TAG = 'newHallSensorJsTest020';
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.HALL, callback, { 'interval': undefined });
                    sensor.on(sensor.SensorId.HALL, callback2, { 'interval': undefined });
                    setTimeout(() => {
                        console.info('----------------------newHallSensorJsTest020 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.HALL, callback);
                            sensor.off(sensor.SensorId.HALL, callback2);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                            expect(false).assertTrue();
                        }
                        console.info('----------------------newHallSensorJsTest020 off end--------------');
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
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0210
     * @tc.name: newHallSensorJsTest021
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newHallSensorJsTest021';
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.HALL, callback, undefined);
                    try{
                    sensor.on(sensor.SensorId.HALL, callback, { 'interval': undefined });
                    } catch(error){
                        console.info(TAG + ' catch error:' + error);
                    }
                    setTimeout(() => {
                        console.info('----------------------newHallSensorJsTest021 off in--------------');
                        try {
                        sensor.off(sensor.SensorId.HALL);
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
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0220
     * @tc.name: newHallSensorJsTest022
     * @tc.desc: For normal scenarios
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newHallSensorJsTest022--------------');
        TAG = 'newHallSensorJsTest022';
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.HALL, callback, null);
                    try{
                            ensor.on(sensor.SensorId.HALL, callback, { 'interval': null });
                        } catch(error){
                            console.info(TAG + ' catch error:' + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------newHallSensorJsTest022 off in--------------');
                        try {
                                sensor.off(sensor.SensorId.HALL);
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
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0230
     * @tc.name: newHallSensorJsTest023
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newHallSensorJsTest023--------------');
        TAG = 'newHallSensorJsTest023';
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.HALL, callback, { 'interval': null });
                    setTimeout(() => {
                        console.info('----------------------newHallSensorJsTest023 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.HALL);
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
     * @tc.number:SUB_SensorsSystem_NEWHALL_JSTest_0240
     * @tc.name: newHallSensorJsTest024
     * @tc.desc: Once Normal Subscription Scenario Use Case
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHallSensorJsTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newHallSensorJsTest024';
        try{
           sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.HALL, callback, { 'interval': 100000000 });
                    try{
                        sensor.on(sensor.SensorId.HALL, callback, { 'interval': 100000000 });
                        } catch(error){
                            console.info("newHallSensorJsTest024 catch error:" + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------newHallSensorJsTest024 off in--------------');
                        try {
                                sensor.off(sensor.SensorId.HALL);
                            } catch (error) {
                                console.info(TAG + ' catch error:' + error);
                                expect(false).assertTrue();
                            }
                        console.info('----------------------newHallSensorJsTest024 off end--------------');
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
