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

export default function SensorJsTest_sensor_42() {
describe("SensorJsTest_sensor_42", function () {
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
            console.info('callback2 accuracy verified' + JSON.stringify(data));
            expect(true).assertTrue();
        } else {
            console.info('callback2 invalid accuracy encountered' + JSON.stringify(data));
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0010
    * @tc.name: newGravitySensorJsTest001
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 0
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newGravitySensorJsTest001--------------');
        TAG  = 'newGravitySensorJsTest001'
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorId.GRAVITY, callback);
                    setTimeout(()=>{
                        sensor.off(sensor.SensorId.GRAVITY);
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0020
    * @tc.name: newGravitySensorJsTest002
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGravitySensorJsTest002--------------');
        TAG  = 'newGravitySensorJsTest002'
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GRAVITY, callback);
                        setTimeout(()=>{
                            sensor.off(sensor.SensorId.GRAVITY);
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0030
    * @tc.name: newGravitySensorJsTest003
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGravitySensorJsTest003--------------');
        TAG  = 'newGravitySensorJsTest003'
        function onSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0040
    * @tc.name: newGravitySensorJsTest004
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGravitySensorJsTest004--------------');
        TAG  = 'newGravitySensorJsTest004'
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GRAVITY, callback, {'interval': 100000000});
                    setTimeout(()=>{
                        console.info('---------newGravitySensorJsTest004 off in--------------');
                        sensor.off(sensor.SensorId.GRAVITY);
                        console.info('---------newGravitySensorJsTest004 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0050
    * @tc.name: newGravitySensorJsTest005
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGravitySensorJsTest005--------------');
        TAG  = 'newGravitySensorJsTest005'
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
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GRAVITY, onSensorCallback, {'interval': 100000000}, 5);
                    setTimeout(()=>{
                        console.info('---------newGravitySensorJsTest005 off in--------------');
                        sensor.off(sensor.SensorId.GRAVITY);
                        console.info('---------newGravitySensorJsTest005 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0060
    * @tc.name: newGravitySensorJsTest006
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG  = 'newGravitySensorJsTest006'
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.once(sensor.SensorId.GRAVITY, callback);
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0070
    * @tc.name: newGravitySensorJsTest007
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG  = 'newGravitySensorJsTest007'
        function onceSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0080
    * @tc.name: newGravitySensorJsTest008
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG  = 'newGravitySensorJsTest008'
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
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.once(sensor.SensorId.GRAVITY, onceSensorCallback, 5);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0090
    * @tc.name: newGravitySensorJsTest009
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG  = 'newGravitySensorJsTest009'
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0100
    * @tc.name: newGravitySensorJsTest010
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG  = 'newGravitySensorJsTest010'
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
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GRAVITY, onSensorCallback);
                    setTimeout(()=>{
                        sensor.off(sensor.SensorId.GRAVITY, onSensorCallback);
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0110
    * @tc.name: newGravitySensorJsTest011
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG  = 'newGravitySensorJsTest011'
        function onSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0120
    * @tc.name: newGravitySensorJsTest012
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG  = 'newGravitySensorJsTest012'
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GRAVITY, (data)=>{
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
                    sensor.on(sensor.SensorId.GRAVITY, (data)=>{
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
                        console.info('---------newGravitySensorJsTest012 off in--------------');
                        sensor.off(sensor.SensorId.GRAVITY);
                        console.info('---------newGravitySensorJsTest012 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_GRAVITY_JSTest_0130
    * @tc.name: newGravitySensorJsTest013
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
     */
    it("newGravitySensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        TAG  = 'newGravitySensorJsTest013'
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    try {
                        sensor.off(sensor.SensorId.GRAVITY, 5);
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0140
    * @tc.name: newGravitySensorJsTest014
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG  = 'newGravitySensorJsTest014'
        console.info('---------newGravitySensorJsTest014--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GRAVITY, (data)=>{
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
                    sensor.once(sensor.SensorId.GRAVITY, (data)=>{
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
                        console.info('---------newGravitySensorJsTest014 off in--------------');
                        sensor.off(sensor.SensorId.GRAVITY);
                        console.info('---------newGravitySensorJsTest014 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0150
    * @tc.name: newGravitySensorJsTest015
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGravitySensorJsTest015--------------');
        TAG  = 'newGravitySensorJsTest015'
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GRAVITY, (data)=>{
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
                    sensor.on(sensor.SensorId.GRAVITY, (data)=>{
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
                        console.info('---------newGravitySensorJsTest015 off in--------------');
                        sensor.off(sensor.SensorId.GRAVITY);
                        console.info('---------newGravitySensorJsTest015 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0160
    * @tc.name: newGravitySensorJsTest016
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGravitySensorJsTest016--------------');
        TAG  = 'newGravitySensorJsTest016'
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0170
    * @tc.name: newGravitySensorJsTest017
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newGravitySensorJsTest017--------------');
        TAG  = 'newGravitySensorJsTest017'
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GRAVITY, callback);
                    sensor.on(sensor.SensorId.GRAVITY, callback2);
                    setTimeout(() => {
                        console.info('----------------------newGravitySensorJsTest017 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.GRAVITY, callback);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                        }
                        console.info('----------------------newGravitySensorJsTest017 off end--------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------newGravitySensorJsTest017 off in--------------');
                        sensor.off(sensor.SensorId.GRAVITY, callback2);
                        console.info('----------------------newGravitySensorJsTest017 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0180
    * @tc.name: newGravitySensorJsTest018
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newGravitySensorJsTest018--------------');
        TAG  = 'newGravitySensorJsTest018'
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GRAVITY, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorId.GRAVITY, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------newGravitySensorJsTest018 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.GRAVITY, callback);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                        }
                        console.info('----------------------newGravitySensorJsTest018 off end--------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------newGravitySensorJsTest018_2 off in--------------');
                        sensor.off(sensor.SensorId.GRAVITY, callback2);
                        console.info('----------------------newGravitySensorJsTest018_2 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0190
    * @tc.name: newGravitySensorJsTest019
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newGravitySensorJsTest019--------------');
        TAG  = 'newGravitySensorJsTest019'
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    console.info('----------------------newGravitySensorJsTest019 off in--------------');
                    try{
                        sensor.off(-1, callback);
                        console.info('----------------------newGravitySensorJsTest019 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0200
    * @tc.name: newGravitySensorJsTest020
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newGravitySensorJsTest020--------------');
        TAG  = 'newGravitySensorJsTest020'
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                        sensor.on(sensor.SensorId.GRAVITY, callback, {'interval': -100000000});
                        console.info('----------------------newGravitySensorJsTest020 off in---------------------------');
                        sensor.off(sensor.SensorId.GRAVITY);
                        console.info('----------------------newGravitySensorJsTest020 off end---------------------------');
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0210
    * @tc.name: newGravitySensorJsTest021
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newGravitySensorJsTest021--------------');
        TAG  = 'newGravitySensorJsTest021'
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorId.GRAVITY, callback);
                    setTimeout(()=>{
                        sensor.off(sensor.SensorId.GRAVITY);
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0220
    * @tc.name: newGravitySensorJsTest022
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG  = 'newGravitySensorJsTest022'
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GRAVITY, callback, undefined);
                    try{
                    sensor.on(sensor.SensorId.GRAVITY, callback, { 'interval': undefined });
                    } catch(error){
                        console.info(TAG + ' catch error:' + error);
                    }
                    setTimeout(() => {
                        console.info('----------------------newGravitySensorJsTest022 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.GRAVITY);
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
        done();
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0230
    * @tc.name: newGravitySensorJsTest023
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGravitySensorJsTest023--------------');
        TAG  = 'newGravitySensorJsTest023'
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GRAVITY, callback, null);
                    try{
                        sensor.on(sensor.SensorId.GRAVITY, callback, { 'interval': null });
                        } catch(error){
                            console.info(TAG + ' catch error:' + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------newGravitySensorJsTest023 off in--------------');
                        try {
                                sensor.off(sensor.SensorId.GRAVITY);
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0240
    * @tc.name: newGravitySensorJsTest024
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGravitySensorJsTest024--------------');
        TAG  = 'newGravitySensorJsTest024'
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GRAVITY, callback, { 'interval': null });
                    setTimeout(() => {
                        console.info('----------------------newGravitySensorJsTest024 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.GRAVITY);
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0250
    * @tc.name: newGravitySensorJsTest025
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG  = 'newGravitySensorJsTest025'
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GRAVITY, callback, { 'interval': 100000000 });
                    try{
                        sensor.on(sensor.SensorId.GRAVITY, callback, { 'interval': 100000000 });
                        } catch(error){
                            console.info(TAG + ' catch error:' + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------newGravitySensorJsTest025 off in--------------');
                        try {
                                sensor.off(sensor.SensorId.GRAVITY);
                            } catch (error) {
                                console.info(TAG + ' catch error:' + error);
                                expect(false).assertTrue();
                            }
                        console.info('----------------------newGravitySensorJsTest025 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_NEWGRAVITY_JsTest_0260
    * @tc.name: newGravitySensorJsTest026
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newGravitySensorJsTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newGravitySensorJsTest026--------------');
        TAG  = 'newGravitySensorJsTest026'
        try{
           sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.GRAVITY, callback, { 'interval': undefined });
                    sensor.on(sensor.SensorId.GRAVITY, callback2, { 'interval': undefined });
                    setTimeout(() => {
                        console.info('----------------------newGravitySensorJsTest026 off in--------------');
                        try {
                        sensor.off(sensor.SensorId.GRAVITY, callback);
                        sensor.off(sensor.SensorId.GRAVITY, callback2);
                        } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(false).assertTrue();
                        }
                        console.info('----------------------newGravitySensorJsTest026 off end--------------');
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
