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
import sensor from '@ohos.sensor'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_20() {
describe("SensorJsTest_sensor_20", function () {
    function callback(data) {
        console.info("old callback" + JSON.stringify(data));
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
        expect(typeof (data.w)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        console.info("old callback2" + JSON.stringify(data));
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
    let errMessages = ['string is not defined','The parameter invalid'];
    let errMessage;

    /*
     * @tc.number:SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0010
     * @tc.name: RotatingVectorSensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("RotatingVectorSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------RotatingVectorSensorJsTest001---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVectorSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback);
                setTimeout(() => {
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR);
                    done();
                }, 500);
                }
                })
        } catch (error) {
            console.info('RotatingVectorSensorJsTest001 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0020
     * @tc.name: RotatingVectorSensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("RotatingVectorSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVectorSensorJsTest002---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVectorSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': 100000000 });
                setTimeout(() => {
                    console.info('----------------------RotatingVectorSensorJsTest002 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR);
                    console.info('----------------------RotatingVectorSensorJsTest002 off end---------------------------');
                    done();
                }, 500);
                }
            })
        } catch (error) {
            console.info('RotatingVectorSensorJsTest002 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0030
     * @tc.name: RotatingVectorSensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("RotatingVectorSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVectorSensorJsTest003---------------------------');
        function onSensorCallback(data) {
            console.info('RotatingVectorSensorJsTest003  on error');
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVectorSensorJsTest018 error');
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, onSensorCallback, { 'interval': 100000000 }, 5);
                }
            })
        } catch (error) {
            console.info('RotatingVectorSensorJsTest003 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0040
     * @tc.name: RotatingVectorSensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("RotatingVectorSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVectorSensorJsTest004---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVectorSensorJsTest018 error');
                    done();
                } else {
                sensor.once(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback);
                setTimeout(() => {
                    expect(true).assertTrue();
                    done();
                }, 500);
                }
                })
        } catch (error) {
            console.info('RotatingVectorSensorJsTest004 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0050
     * @tc.name: RotatingVectorSensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("RotatingVectorSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVectorSensorJsTest005---------------------------');
        function onceSensorCallback(data) {
            console.info('RotatingVectorSensorJsTest005  on error');
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVectorSensorJsTest018 error');
                    done();
                } else {
                try {
                    sensor.once(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, onceSensorCallback, 5);
                } catch (error) {
                    console.info("RotatingVectorSensorJsTest005 error:" + error);
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                    done();
                }
                }
            })
        } catch (error) {
            console.info('RotatingVectorSensorJsTest005 Device does not support! ');
            done();
        }
    })

   /*
     * @tc.number: SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0060
     * @tc.name: RotatingVectorSensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("RotatingVectorSensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVectorSensorJsTest006---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVectorSensorJsTest018 error');
                    done();
                } else {
                   try {
                        sensor.off(string, "");
                    } catch (error) {
                        console.info("RotatingVectorSensorJsTest006 error:" + error);
                        errMessage = error.toString().slice(16, 40);
                        expect(errMessage).assertEqual(errMessages[0]);
                        done();
                    }
                    }
                })
        } catch (error) {
            console.info('RotatingVectorSensorJsTest006 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0070
     * @tc.name: RotatingVectorSensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("RotatingVectorSensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVectorSensorJsTest007---------------------------');
        function onSensorCallback(data) {
            console.info('RotatingVectorSensorJsTest007  on error');
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVectorSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, onSensorCallback);
                setTimeout(() => {
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, onSensorCallback);
                    done();
                }, 500);
                }
            })
        } catch (error) {
            console.info('RotatingVectorSensorJsTest007 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0080
     * @tc.name: RotatingVectorSensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("RotatingVectorSensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVectorSensorJsTest008---------------------------');
        function onSensorCallback(data) {
            console.info('RotatingVectorSensorJsTest008  on error');
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVectorSensorJsTest018 error');
                    done();
                } else {
                try {
                    sensor.off(1000000, onSensorCallback);
                } catch (error) {
                    console.info("RotatingVectorSensorJsTest008 error:" + error);
                    errMessage = error.toString().slice(7, 28);
                    expect(errMessage).assertEqual(errMessages[1]);
                    done();
                }
                }
            })
        } catch (error) {
            console.info('RotatingVectorSensorJsTest008 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0090
     * @tc.name: RotatingVectorSensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("RotatingVectorSensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVectorSensorJsTest009---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVectorSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback);
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback2);
                setTimeout(() => {
                    console.info('----------------------RotatingVectorSensorJsTest009 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR);
                    console.info('----------------------RotatingVectorSensorJsTest009 off end---------------------------');
                    done();
                }, 1000);
                }
            })
        } catch (error) {
            console.info('RotatingVectorSensorJsTest009 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0100
     * @tc.name: RotatingVectorSensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("RotatingVectorSensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVectorSensorJsTest010---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVectorSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback);
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback2);
                setTimeout(() => {
                    console.info('----------------------RotatingVectorSensorJsTest010 off in---------------------------');
                    try {
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback);
                    } catch (error) {
                    console.info("RotatingVectorSensorJsTest010 error:" + error);
                    }
                    console.info('----------------------RotatingVectorSensorJsTest010 off end---------------------------');
                }, 500);
                setTimeout(() => {
                    console.info('----------------------RotatingVectorSensorJsTest010 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback2);
                    console.info('----------------------RotatingVectorSensorJsTest010 off end---------------------------');
                    done();
                }, 1000);
                }
            })
        } catch (error) {
            console.info('RotatingVectorSensorJsTest010 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0110
     * @tc.name: RotatingVectorSensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("RotatingVectorSensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVectorSensorJsTest011---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVectorSensorJsTest018 error');
                    done();
                } else {
               sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': 100000000 });
                sensor.once(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback2);
                setTimeout(() => {
                    console.info('----------------------RotatingVectorSensorJsTest011 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR);
                    console.info('----------------------RotatingVectorSensorJsTest011 off end---------------------------');
                    done();
                }, 1000);
                }
            })
        } catch (error) {
            console.info('RotatingVectorSensorJsTest011 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0120
     * @tc.name:RotatingVectorSensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("RotatingVectorSensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVectorSensorJsTest012---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVectorSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------RotatingVectorSensorJsTest012 off in---------------------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback);
                        } catch (error) {
                        console.info("RotatingVectorSensorJsTest012 error:" + error);
                        }
                        console.info('----------------------RotatingVectorSensorJsTest012 off end---------------------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------RotatingVectorSensorJsTest012 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback2);
                        console.info('----------------------RotatingVectorSensorJsTest012 off end---------------------------');
                        done();
                    }, 1000);
                }
                })
        } catch (error) {
            console.info('RotatingVectorSensorJsTest012 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0130
     * @tc.name:RotatingVectorSensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("RotatingVectorSensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVectorSensorJsTest013---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVectorSensorJsTest018 error');
                    done();
                } else {
               sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': 100000000 });
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback2, { 'interval': 100000000 });
                setTimeout(() => {
                    console.info('----------------------RotatingVectorSensorJsTest013 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR);
                    console.info('----------------------RotatingVectorSensorJsTest013 off end---------------------------');
                    done();
                }, 1000);
                }
            })
        } catch (error) {
            console.info('RotatingVectorSensorJsTest013 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0140
     * @tc.name: RotatingVectorSensorJsTest014
     * @tc.desc: Functional Use Cases
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("RotatingVectorSensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------RotatingVectorSensorJsTest014--------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVectorSensorJsTest014 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': undefined });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback2, { 'interval': undefined });
                    setTimeout(() => {
                        console.info('----------------------RotatingVectorSensorJsTest014 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback);
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback2);
                        } catch (error) {
                        console.info("RotatingVectorSensorJsTest014 error:" + error);
                        expect(false).assertTrue();
                        }
                        console.info('----------------------RotatingVectorSensorJsTest014 off end--------------');
                        done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('RotatingVectorSensorJsTest014 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0150
     * @tc.name: RotatingVectorSensorJsTest015
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("RotatingVectorSensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVectorSensorJsTest015 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, undefined);
                    try{
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': undefined });
                    } catch(error){
                        console.info('RotatingVectorSensorJsTest015 Repeat subscription'+error);
                    }
                    setTimeout(() => {
                        console.info('----------------------RotatingVectorSensorJsTest015 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR);
                        } catch (error) {
                        console.info("RotatingVectorSensorJsTest015 error:" + error);
                        expect(false).assertTrue();
                        }
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('RotatingVectorSensorJsTest015 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0160
     * @tc.name: RotatingVectorSensorJsTest016
     * @tc.desc: For normal scenarios
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("RotatingVectorSensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------RotatingVectorSensorJsTest016--------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVectorSensorJsTest016 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, null);
                    try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': null });
                        } catch(error){
                            console.info('RotatingVectorSensorJsTest016 Repeat subscription'+error);
                        }
                    setTimeout(() => {
                        console.info('----------------------RotatingVectorSensorJsTest016 off in--------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR);
                            } catch (error) {
                        console.info("RotatingVectorSensorJsTest016 error:" + error);
                            expect(false).assertTrue();
                            }
                            done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('RotatingVectorSensorJsTest016 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0170
     * @tc.name: RotatingVectorSensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("RotatingVectorSensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------RotatingVectorSensorJsTest017--------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVectorSensorJsTest017 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': null });
                    setTimeout(() => {
                        console.info('----------------------RotatingVectorSensorJsTest017 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR);
                        } catch (error) {
                        console.info("RotatingVectorSensorJsTest017 error:" + error);
                        expect(false).assertTrue();
                        }
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info("RotatingVectorSensorJsTest017 Device does not support! ");
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0180
     * @tc.name: RotatingVectorSensorJsTest018
     * @tc.desc: Once Normal Subscription Scenario Use Case
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("RotatingVectorSensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVectorSensorJsTest018 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': 100000000 });
                    try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': 100000000 });
                        } catch(error){
                            console.info("RotatingVectorSensorJsTest018 catch error:" + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------RotatingVectorSensorJsTest018 off in--------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR);
                            } catch (error) {
                        console.info("RotatingVectorSensorJsTest018 error:" + error);
                            expect(false).assertTrue();
                            }
                        console.info('----------------------RotatingVectorSensorJsTest018 off end--------------');
                            done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info("RotatingVectorSensorJsTest018 Device does not support! ");
            done();
        }
    })
})}