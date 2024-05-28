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

export default function SensorJsTest_sensor_37() {
describe("SensorJsTest_sensor_37", function () {
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
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = 'Service exception.'
    let invalid  = -1;
    let TAG  = '';

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0010
     * @tc.name: newMagneticFieldSensorJsTest001
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newMagneticFieldSensorJsTest001--------------');
        TAG = 'newMagneticFieldSensorJsTest001';
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback);
                    setTimeout(()=>{
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD);
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
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0020
     * @tc.name: newMagneticFieldSensorJsTest002
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newMagneticFieldSensorJsTest002--------------');
        TAG = 'newMagneticFieldSensorJsTest002';
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback);
                        setTimeout(()=>{
                            sensor.off(sensor.SensorId.MAGNETIC_FIELD);
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
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0030
     * @tc.name: newMagneticFieldSensorJsTest003
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newMagneticFieldSensorJsTest003--------------');
        TAG = 'newMagneticFieldSensorJsTest003';
        function onSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
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
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0040
     * @tc.name: newMagneticFieldSensorJsTest004
     * @tc.desc: For normal scenarios
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newMagneticFieldSensorJsTest004--------------');
        TAG = 'newMagneticFieldSensorJsTest004';
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, {'interval': 100000000});
                    setTimeout(()=>{
                        console.info('---------newMagneticFieldSensorJsTest004 off in--------------');
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD);
                        console.info('---------newMagneticFieldSensorJsTest004 off end--------------');
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
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0050
     * @tc.name: newMagneticFieldSensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newMagneticFieldSensorJsTest005--------------');
        TAG = 'newMagneticFieldSensorJsTest005';
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
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, onSensorCallback, {'interval': 100000000}, 5);
                    setTimeout(()=>{
                        console.info('---------newMagneticFieldSensorJsTest005 off in--------------');
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD);
                        console.info('---------newMagneticFieldSensorJsTest005 off end--------------');
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
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0060
     * @tc.name: newMagneticFieldSensorJsTest006
     * @tc.desc: Once Normal Subscription Scenario Use Case
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newMagneticFieldSensorJsTest006';
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.once(sensor.SensorId.MAGNETIC_FIELD, callback);
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
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0070
     * @tc.name: newMagneticFieldSensorJsTest007
     * @tc.desc: Use case of illegal parameter passed into once interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newMagneticFieldSensorJsTest007';
        function onceSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
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
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0080
     * @tc.name: newMagneticFieldSensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newMagneticFieldSensorJsTest008';
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
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.once(sensor.SensorId.MAGNETIC_FIELD, onceSensorCallback, 5);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0090
     * @tc.name: newMagneticFieldSensorJsTest009
     * @tc.desc: Use case of illegal parameter passed into off interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newMagneticFieldSensorJsTest009';
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    try {
                        sensor.off(invalid, callback);
                    } catch (error) {
                        console.info('newMagneticFieldSensorJsTest009 Device does not support! ');
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
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0100
     * @tc.name: newMagneticFieldSensorJsTest010
     * @tc.desc: Unsubscribe directly without waiting after starting subscription
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newMagneticFieldSensorJsTest010';
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
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, onSensorCallback);
                    setTimeout(()=>{
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD, onSensorCallback);
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
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0110
     * @tc.name: newMagneticFieldSensorJsTest011
     * @tc.desc:SensorId1000000 of incoming exception
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newMagneticFieldSensorJsTest011';
        function onSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
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
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0120
     * @tc.name: newMagneticFieldSensorJsTest012
     * @tc.desc:Call interface multiple times
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newMagneticFieldSensorJsTest012';
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, (data)=>{
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
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, (data)=>{
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
                        console.info('---------newMagneticFieldSensorJsTest012 off in--------------');
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD);
                        console.info('---------newMagneticFieldSensorJsTest012 off end--------------');
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
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0130
     * @tc.name: newMagneticFieldSensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        TAG = 'newMagneticFieldSensorJsTest013';
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    try {
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD, 5);
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
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0140
     * @tc.name: newMagneticFieldSensorJsTest014
     * @tc.desc:Call on interface and once interface respectively, and use an off interface to close
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newMagneticFieldSensorJsTest014--------------');
        TAG = 'newMagneticFieldSensorJsTest014';
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, (data)=>{
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
                    sensor.once(sensor.SensorId.MAGNETIC_FIELD, (data)=>{
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
                        console.info('---------newMagneticFieldSensorJsTest014 off in--------------');
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD);
                        console.info('---------newMagneticFieldSensorJsTest014 off end--------------');
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
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0150
     * @tc.name: newMagneticFieldSensorJsTest015
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newMagneticFieldSensorJsTest015--------------');
        TAG = 'newMagneticFieldSensorJsTest015';
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, (data)=>{
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
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, (data)=>{
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
                        console.info('---------newMagneticFieldSensorJsTest015 off in--------------');
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD);
                        console.info('---------newMagneticFieldSensorJsTest015 off end--------------');
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
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0160
     * @tc.name: newMagneticFieldSensorJsTest016
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newMagneticFieldSensorJsTest016--------------');
        TAG = 'newMagneticFieldSensorJsTest016';
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
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
     * @tc.number: SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0170
     * @tc.name: newMagneticFieldSensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newMagneticFieldSensorJsTest017--------------');
        TAG = 'newMagneticFieldSensorJsTest017';
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback);
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback2);
                    setTimeout(() => {
                        console.info('----------------------newMagneticFieldSensorJsTest017 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.MAGNETIC_FIELD, callback);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                        }
                        console.info('----------------------newMagneticFieldSensorJsTest017 off end--------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------newMagneticFieldSensorJsTest017 off in--------------');
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD, callback2);
                        console.info('----------------------newMagneticFieldSensorJsTest017 off end--------------');
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
     * @tc.number: SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0180
     * @tc.name: newMagneticFieldSensorJsTest018
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newMagneticFieldSensorJsTest018--------------');
        TAG = 'newMagneticFieldSensorJsTest018';
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------newMagneticFieldSensorJsTest018 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.MAGNETIC_FIELD, callback);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                        }
                        console.info('----------------------newMagneticFieldSensorJsTest018 off end--------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------newMagneticFieldSensorJsTest018_2 off in--------------');
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD, callback2);
                        console.info('----------------------newMagneticFieldSensorJsTest018_2 off end--------------');
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
     * @tc.number: SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0190
     * @tc.name: newMagneticFieldSensorJsTest019
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newMagneticFieldSensorJsTest019--------------');
        TAG = 'newMagneticFieldSensorJsTest019';
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    console.info('----------------------newMagneticFieldSensorJsTest019 off in--------------');
                    try{
                        sensor.off(-1, callback);
                        console.info('----------------------newMagneticFieldSensorJsTest019 off end--------------');
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
     * @tc.number: SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0200
     * @tc.name: newMagneticFieldSensorJsTest020
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newMagneticFieldSensorJsTest020--------------');
        TAG = 'newMagneticFieldSensorJsTest020';
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                        sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, {'interval': -100000000});
                        console.info('----------------------newMagneticFieldSensorJsTest020 off in---------------------------');
                        sensor.off(sensor.SensorId.MAGNETIC_FIELD);
                        console.info('----------------------newMagneticFieldSensorJsTest020 off end---------------------------');
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
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0210
     * @tc.name: newMagneticFieldSensorJsTest021
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newMagneticFieldSensorJsTest021';
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, undefined);
                    try{
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, { 'interval': undefined });
                    } catch(error){
                        console.info(TAG + ' catch error:' + error);
                    }
                    setTimeout(() => {
                        console.info('----------------------newMagneticFieldSensorJsTest021 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.MAGNETIC_FIELD);
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
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0220
     * @tc.name: newMagneticFieldSensorJsTest022
     * @tc.desc: For normal scenarios
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newMagneticFieldSensorJsTest022--------------');
        TAG = 'newMagneticFieldSensorJsTest022';
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, null);
                    try{
                        sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, { 'interval': null });
                        } catch(error){
                            console.info(TAG + ' catch error:' + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------newMagneticFieldSensorJsTest022 off in--------------');
                        try {
                                sensor.off(sensor.SensorId.MAGNETIC_FIELD);
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
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0230
     * @tc.name: newMagneticFieldSensorJsTest023
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newMagneticFieldSensorJsTest023--------------');
        TAG = 'newMagneticFieldSensorJsTest023';
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, { 'interval': null });
                    setTimeout(() => {
                        console.info('----------------------newMagneticFieldSensorJsTest023 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.MAGNETIC_FIELD);
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
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0240
     * @tc.name: newMagneticFieldSensorJsTest024
     * @tc.desc: Once Normal Subscription Scenario Use Case
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newMagneticFieldSensorJsTest024';
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, { 'interval': 100000000 });
                    try{
                        sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, { 'interval': 100000000 });
                        } catch(error){
                            console.info(TAG + ' catch error:' + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------newMagneticFieldSensorJsTest024 off in--------------');
                        try {
                                sensor.off(sensor.SensorId.MAGNETIC_FIELD);
                            } catch (error) {
                                console.info(TAG + ' catch error:' + error);
                                expect(false).assertTrue();
                            }
                        console.info('----------------------newMagneticFieldSensorJsTest024 off end--------------');
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
     * @tc.number:SUB_SensorsSystem_NEWMAGNETIC_FIELD_JSTest_0250
     * @tc.name: newMagneticFieldSensorJsTest025
     * @tc.desc: Functional Use Cases
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newMagneticFieldSensorJsTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newMagneticFieldSensorJsTest025--------------');
        TAG = 'newMagneticFieldSensorJsTest025';
        try{
           sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, { 'interval': undefined });
                    sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback2, { 'interval': undefined });
                    setTimeout(() => {
                        console.info('----------------------newMagneticFieldSensorJsTest025 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.MAGNETIC_FIELD, callback);
                            sensor.off(sensor.SensorId.MAGNETIC_FIELD, callback2);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                            expect(false).assertTrue();
                        }
                        console.info('----------------------newMagneticFieldSensorJsTest025 off end--------------');
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
