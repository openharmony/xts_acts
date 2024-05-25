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

export default function SensorJsTest_sensor_5() {
describe("SensorJsTest_sensor_5", function () {
    function callback(data) {
        console.info("old callback" + JSON.stringify(data));
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        console.info("old callback2" + JSON.stringify(data));
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
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_CODE = 14500101
    const SERVICE_EXCEPTION_MSG = 'Service exception.'
    let errMessages = ['string is not defined','The parameter invalid'];
    let errMessage;

     /*
     * @tc.number:SUB_SensorsSystem_GYROSCOPE_JSTest_0010
     * @tc.name: GyroscopeSensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("GyroscopeSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------GyroscopeSensorJsTest001---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    console.info('GyroscopeSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback);
                setTimeout(() => {
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE);
                    done();
                }, 500);
                }
            })
        } catch (error) {
            console.info('GyroscopeSensorJsTest001 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_GYROSCOPE_JSTest_0020
     * @tc.name: GyroscopeSensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("GyroscopeSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------GyroscopeSensorJsTest002---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    console.info('GyroscopeSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback, { 'interval': 100000000 });
                setTimeout(() => {
                    console.info('----------------------GyroscopeSensorJsTest002 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE);
                    console.info('----------------------GyroscopeSensorJsTest002 off end---------------------------');
                    done();
                }, 500);
                }
            })
        } catch (error) {
            console.info('GyroscopeSensorJsTest002 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_GYROSCOPE_JSTest_0030
     * @tc.name: GyroscopeSensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("GyroscopeSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------GyroscopeSensorJsTest003---------------------------');
        function onSensorCallback(data) {
            console.info('GyroscopeSensorJsTest003  on error');
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    console.info('GyroscopeSensorJsTest018 error');
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, onSensorCallback, { 'interval': 100000000 }, 5);
                }
            })
        } catch (error) {
            console.info('GyroscopeSensorJsTest003 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_GYROSCOPE_JSTest_0040
     * @tc.name: GyroscopeSensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("GyroscopeSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------GyroscopeSensorJsTest004---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    console.info('GyroscopeSensorJsTest018 error');
                    done();
                } else {
                sensor.once(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback);
                setTimeout(() => {
                    expect(true).assertTrue();
                    done();
                }, 500);
                }
          })
        } catch (error) {
            console.info('GyroscopeSensorJsTest004 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_GYROSCOPE_JSTest_0050
     * @tc.name: GyroscopeSensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("GyroscopeSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------GyroscopeSensorJsTest005---------------------------');
        function onceSensorCallback(data) {
            console.info('GyroscopeSensorJsTest005  on error');
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    console.info('GyroscopeSensorJsTest018 error');
                    done();
                } else {
                try {
                    sensor.once(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, onceSensorCallback, 5);
                } catch (error) {
                    console.info("GyroscopeSensorJsTest005 error:" + error);
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                }
                }
            })
        } catch (error) {
            console.info('GyroscopeSensorJsTest005 Device does not support! ');
            done();
        }
    })

   /*
     * @tc.number: SUB_SensorsSystem_GYROSCOPE_JSTest_0060
     * @tc.name: GyroscopeSensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("GyroscopeSensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------GyroscopeSensorJsTest006---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    console.info('GyroscopeSensorJsTest018 error');
                    done();
                } else {
                try {
                    sensor.off(string, "");
                } catch (error) {
                    console.info("GyroscopeSensorJsTest006 error:" + error);
                    errMessage = error.toString().slice(16, 40);
                    expect(errMessage).assertEqual(errMessages[0]);
                    done();
                }
                }
            })
        } catch (error) {
            console.info('GyroscopeSensorJsTest006 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_GYROSCOPE_JSTest_0070
     * @tc.name: GyroscopeSensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("GyroscopeSensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------GyroscopeSensorJsTest007---------------------------');
        function onSensorCallback(data) {
            console.info('GyroscopeSensorJsTest007  on error');
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    console.info('GyroscopeSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, onSensorCallback);
                setTimeout(() => {
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, onSensorCallback);
                    done();
                }, 500);
                }
            })
        } catch (error) {
            console.info('GyroscopeSensorJsTest007 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_GYROSCOPE_JSTest_0080
     * @tc.name: GyroscopeSensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("GyroscopeSensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------GyroscopeSensorJsTest008---------------------------');
        function onSensorCallback(data) {
            console.info('GyroscopeSensorJsTest008  on error');
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    console.info('GyroscopeSensorJsTest018 error');
                    done();
                } else {
                try {
                    sensor.off(1000000, onSensorCallback);
                } catch (error) {
                    console.info("GyroscopeSensorJsTest008 error:" + error);
                    errMessage = error.toString().slice(7, 28);
                    expect(errMessage).assertEqual(errMessages[1]);
                    done();
                }
                }
            })
        } catch (error) {
            console.info('GyroscopeSensorJsTest008 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_GYROSCOPE_JSTest_0090
     * @tc.name: GyroscopeSensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("GyroscopeSensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------GyroscopeSensorJsTest009---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    console.info('GyroscopeSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback);
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback2);
                setTimeout(() => {
                    console.info('----------------------GyroscopeSensorJsTest009 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE);
                    console.info('----------------------GyroscopeSensorJsTest009 off end---------------------------');
                    done();
                }, 1000);
                }
            })
        } catch (error) {
            console.info('GyroscopeSensorJsTest009 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_GYROSCOPE_JSTest_0100
     * @tc.name: GyroscopeSensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("GyroscopeSensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------GyroscopeSensorJsTest010---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    console.info('GyroscopeSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback);
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback2);
                setTimeout(() => {
                    console.info('----------------------GyroscopeSensorJsTest010 off in---------------------------');
                    try {
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback);
                    } catch (error) {
                    console.info("GyroscopeSensorJsTest010 error:" + error);
                    }
                    console.info('----------------------GyroscopeSensorJsTest010 off end---------------------------');
                }, 500);
                setTimeout(() => {
                    console.info('----------------------GyroscopeSensorJsTest010 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback2);
                    console.info('----------------------GyroscopeSensorJsTest010 off end---------------------------');
                    done();
                }, 1000);
                }
            })
        } catch (error) {
            console.info('GyroscopeSensorJsTest010 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_GYROSCOPE_JSTest_0110
     * @tc.name: GyroscopeSensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("GyroscopeSensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------GyroscopeSensorJsTest011---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    console.info('GyroscopeSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback, { 'interval': 100000000 });
                sensor.once(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback2);
                setTimeout(() => {
                    console.info('----------------------GyroscopeSensorJsTest011 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE);
                    console.info('----------------------GyroscopeSensorJsTest011 off end---------------------------');
                    done();
                }, 1000);
                }
            })
        } catch (error) {
            console.info('GyroscopeSensorJsTest011 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_GYROSCOPE_JSTest_0120
     * @tc.name:GyroscopeSensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("GyroscopeSensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------GyroscopeSensorJsTest012---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    console.info('GyroscopeSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------GyroscopeSensorJsTest012 off in---------------------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback);
                        } catch (error) {
                        console.info("GyroscopeSensorJsTest012 error:" + error);
                        }
                        console.info('----------------------GyroscopeSensorJsTest012 off end---------------------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------GyroscopeSensorJsTest012 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback2);
                        console.info('----------------------GyroscopeSensorJsTest012 off end---------------------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('GyroscopeSensorJsTest012 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_GYROSCOPE_JSTest_0130
     * @tc.name:GyroscopeSensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("GyroscopeSensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------GyroscopeSensorJsTest013---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    console.info('GyroscopeSensorJsTest018 error');
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------GyroscopeSensorJsTest013 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE);
                        console.info('----------------------GyroscopeSensorJsTest013 off end---------------------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('GyroscopeSensorJsTest013 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_GYROSCOPE_JSTest_0140
     * @tc.name: GyroscopeSensorJsTest014
     * @tc.desc: Functional Use Cases
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("GyroscopeSensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------GyroscopeSensorJsTest014--------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    console.info('GyroscopeSensorJsTest014 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback, { 'interval': undefined });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback2, { 'interval': undefined });
                    setTimeout(() => {
                        console.info('----------------------GyroscopeSensorJsTest014 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback);
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback2);
                        } catch (error) {
                        console.info("GyroscopeSensorJsTest014 error:" + error);
                        expect(false).assertTrue();
                        }
                        console.info('----------------------GyroscopeSensorJsTest014 off end--------------');
                        done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('GyroscopeSensorJsTest014 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_GYROSCOPE_JSTest_0150
     * @tc.name: GyroscopeSensorJsTest015
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("GyroscopeSensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    console.info('GyroscopeSensorJsTest015 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback, undefined);
                    try{
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback, { 'interval': undefined });
                    } catch(error){
                        console.info('GyroscopeSensorJsTest015 Repeat subscription'+error);
                    }
                    setTimeout(() => {
                        console.info('----------------------GyroscopeSensorJsTest015 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE);
                        } catch (error) {
                        console.info("GyroscopeSensorJsTest015 error:" + error);
                        expect(false).assertTrue();
                        }
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('GyroscopeSensorJsTest015 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_GYROSCOPE_JSTest_0160
     * @tc.name: GyroscopeSensorJsTest016
     * @tc.desc: For normal scenarios
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("GyroscopeSensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------GyroscopeSensorJsTest016--------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    console.info('GyroscopeSensorJsTest016 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback, null);
                    try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback, { 'interval': null });
                        } catch(error){
                            console.info('GyroscopeSensorJsTest016 Repeat subscription'+error);
                        }
                    setTimeout(() => {
                        console.info('----------------------GyroscopeSensorJsTest016 off in--------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE);
                            } catch (error) {
                        console.info("GyroscopeSensorJsTest016 error:" + error);
                            expect(false).assertTrue();
                            }
                            done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('GyroscopeSensorJsTest016 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_GYROSCOPE_JSTest_0170
     * @tc.name: GyroscopeSensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("GyroscopeSensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------GyroscopeSensorJsTest017--------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    console.info('GyroscopeSensorJsTest017 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback, { 'interval': null });
                    setTimeout(() => {
                        console.info('----------------------GyroscopeSensorJsTest017 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE);
                        } catch (error) {
                        console.info("GyroscopeSensorJsTest017 error:" + error);
                        expect(false).assertTrue();
                        }
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info("GyroscopeSensorJsTest017 Device does not support! ");
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_GYROSCOPE_JSTest_0180
     * @tc.name: GyroscopeSensorJsTest018
     * @tc.desc: Once Normal Subscription Scenario Use Case
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("GyroscopeSensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    console.info('GyroscopeSensorJsTest018 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback, { 'interval': 100000000 });
                    try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE, callback, { 'interval': 100000000 });
                        } catch(error){
                            console.info("GyroscopeSensorJsTest018 catch error:" + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------GyroscopeSensorJsTest018 off in--------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE);
                            } catch (error) {
                        console.info("GyroscopeSensorJsTest018 error:" + error);
                            expect(false).assertTrue();
                            }
                        console.info('----------------------GyroscopeSensorJsTest018 off end--------------');
                            done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info("GyroscopeSensorJsTest018 Device does not support! ");
            done();
        }
    })
})}
