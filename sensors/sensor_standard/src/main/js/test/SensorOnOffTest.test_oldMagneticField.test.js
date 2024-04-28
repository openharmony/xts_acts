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

export default function SensorJsTest_sensor_15() {
describe("SensorJsTest_sensor_15", function () {
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
    const SERVICE_EXCEPTION_CODE = 14500101
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = 'Service exception.'
    let errMessages = ['string is not defined','The parameter invalid'];
    let errMessage;

     /*
     * @tc.number:SUB_SensorSystem_MAGNETIC_FIELD_JsTest_0010
     * @tc.name: MagneticFieldSensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("MagneticFieldSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------MagneticFieldSensorJsTest001---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('MagneticFieldSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback);
                setTimeout(() => {
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD);
                    done();
                }, 500);
                }
           })
        } catch (error) {
            console.info('MagneticFieldSensorJsTest001 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_MAGNETIC_FIELD_JSTest_0020
     * @tc.name: MagneticFieldSensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("MagneticFieldSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------MagneticFieldSensorJsTest002---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('MagneticFieldSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback, { 'interval': 100000000 });
                setTimeout(() => {
                    console.info('----------------------MagneticFieldSensorJsTest002 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD);
                    console.info('----------------------MagneticFieldSensorJsTest002 off end---------------------------');
                    done();
                }, 500);
                }
            })
        } catch (error) {
            console.info('MagneticFieldSensorJsTest002 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_MAGNETIC_FIELD_JSTest_0030
     * @tc.name: MagneticFieldSensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("MagneticFieldSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------MagneticFieldSensorJsTest003---------------------------');
        function onSensorCallback(data) {
            console.info('MagneticFieldSensorJsTest003  on error');
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('MagneticFieldSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, onSensorCallback, { 'interval': 100000000 }, 5);
                }
            })
        } catch (error) {
            console.info('MagneticFieldSensorJsTest003 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_MAGNETIC_FIELD_JSTest_0040
     * @tc.name: MagneticFieldSensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("MagneticFieldSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------MagneticFieldSensorJsTest004---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('MagneticFieldSensorJsTest018 error');
                    done();
                } else {
                sensor.once(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback);
                setTimeout(() => {
                    expect(true).assertTrue();
                    done();
                }, 500);
                }
                })
        } catch (error) {
            console.info('MagneticFieldSensorJsTest004 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_MAGNETIC_FIELD_JSTest_0050
     * @tc.name: MagneticFieldSensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("MagneticFieldSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------MagneticFieldSensorJsTest005---------------------------');
        function onceSensorCallback(data) {
            console.info('MagneticFieldSensorJsTest005  on error');
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('MagneticFieldSensorJsTest018 error');
                    done();
                } else {
                try {
                    sensor.once(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, onceSensorCallback, 5);
                } catch (error) {
                    console.info("MagneticFieldSensorJsTest005 error:" + error);
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                }
                }
            })
        } catch (error) {
            console.info('MagneticFieldSensorJsTest005 Device does not support! ');
            done();
        }
    })

   /*
     * @tc.number: SUB_SensorsSystem_MAGNETIC_FIELD_JSTest_0060
     * @tc.name: MagneticFieldSensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("MagneticFieldSensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------MagneticFieldSensorJsTest006---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('MagneticFieldSensorJsTest018 error');
                    done();
                } else {
                try {
                    sensor.off(string, "");
                } catch (error) {
                    console.info("MagneticFieldSensorJsTest006 error:" + error);
                    errMessage = error.toString().slice(16, 40);
                    expect(errMessage).assertEqual(errMessages[0]);
                    done();
                }
                }
            })
        } catch (error) {
            console.info('MagneticFieldSensorJsTest006 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_MAGNETIC_FIELD_JSTest_0070
     * @tc.name: MagneticFieldSensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("MagneticFieldSensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------MagneticFieldSensorJsTest007---------------------------');
        function onSensorCallback(data) {
            console.info('MagneticFieldSensorJsTest007  on error');
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('MagneticFieldSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, onSensorCallback);
                setTimeout(() => {
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, onSensorCallback);
                    done();
                }, 500);
                }
            })
        } catch (error) {
            console.info('MagneticFieldSensorJsTest007 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_MAGNETIC_FIELD_JSTest_0080
     * @tc.name: MagneticFieldSensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("MagneticFieldSensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------MagneticFieldSensorJsTest008---------------------------');
        function onSensorCallback(data) {
            console.info('MagneticFieldSensorJsTest008  on error');
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('MagneticFieldSensorJsTest018 error');
                    done();
                } else {
                try {
                    sensor.off(1000000, onSensorCallback);
                } catch (error) {
                    console.info("MagneticFieldSensorJsTest008 error:" + error);
                    errMessage = error.toString().slice(7, 28);
                    expect(errMessage).assertEqual(errMessages[1]);
                    done();
                }
                }
            })
        } catch (error) {
            console.info('MagneticFieldSensorJsTest008 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_MAGNETIC_FIELD_JSTest_0090
     * @tc.name: MagneticFieldSensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("MagneticFieldSensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------MagneticFieldSensorJsTest009---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('MagneticFieldSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback);
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback2);
                setTimeout(() => {
                    console.info('----------------------MagneticFieldSensorJsTest009 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD);
                    console.info('----------------------MagneticFieldSensorJsTest009 off end---------------------------');
                    done();
                }, 1000);
                }
            })
        } catch (error) {
            console.info('MagneticFieldSensorJsTest009 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_MAGNETIC_FIELD_JSTest_0100
     * @tc.name: MagneticFieldSensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("MagneticFieldSensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------MagneticFieldSensorJsTest010---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('MagneticFieldSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback);
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback2);
                setTimeout(() => {
                    console.info('----------------------MagneticFieldSensorJsTest010 off in---------------------------');
                    try {
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback);
                    } catch (error) {
                    console.info("MagneticFieldSensorJsTest010 error:" + error);
                    }
                    console.info('----------------------MagneticFieldSensorJsTest010 off end---------------------------');
                }, 500);
                setTimeout(() => {
                    console.info('----------------------MagneticFieldSensorJsTest010 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback2);
                    console.info('----------------------MagneticFieldSensorJsTest010 off end---------------------------');
                    done();
                }, 1000);
                }
            })
        } catch (error) {
            console.info('MagneticFieldSensorJsTest010 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_MAGNETIC_FIELD_JSTest_0110
     * @tc.name: MagneticFieldSensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("MagneticFieldSensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------MagneticFieldSensorJsTest011---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('MagneticFieldSensorJsTest018 error');
                    done();
                } else {
               sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback, { 'interval': 100000000 });
                sensor.once(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback2);
                setTimeout(() => {
                    console.info('----------------------MagneticFieldSensorJsTest011 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD);
                    console.info('----------------------MagneticFieldSensorJsTest011 off end---------------------------');
                    done();
                }, 1000);
                }
            })
        } catch (error) {
            console.info('MagneticFieldSensorJsTest011 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_MAGNETIC_FIELD_JSTest_0120
     * @tc.name:MagneticFieldSensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("MagneticFieldSensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------MagneticFieldSensorJsTest012---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('MagneticFieldSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------MagneticFieldSensorJsTest012 off in---------------------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback);
                        } catch (error) {
                        console.info("MagneticFieldSensorJsTest012 error:" + error);
                        }
                        console.info('----------------------MagneticFieldSensorJsTest012 off end---------------------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------MagneticFieldSensorJsTest012 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback2);
                        console.info('----------------------MagneticFieldSensorJsTest012 off end---------------------------');
                        done();
                    }, 1000);
                }
           })
        } catch (error) {
            console.info('MagneticFieldSensorJsTest012 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_MAGNETIC_FIELD_JSTest_0130
     * @tc.name:MagneticFieldSensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("MagneticFieldSensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------MagneticFieldSensorJsTest013---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('MagneticFieldSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback, { 'interval': 100000000 });
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback2, { 'interval': 100000000 });
                setTimeout(() => {
                    console.info('----------------------MagneticFieldSensorJsTest013 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD);
                    console.info('----------------------MagneticFieldSensorJsTest013 off end---------------------------');
                    done();
                }, 1000);
                }
            })
        } catch (error) {
            console.info('MagneticFieldSensorJsTest013 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_MAGNETIC_FIELD_JSTest_0140
     * @tc.name: MagneticFieldSensorJsTest014
     * @tc.desc: Functional Use Cases
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("MagneticFieldSensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------MagneticFieldSensorJsTest014--------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('MagneticFieldSensorJsTest014 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback, { 'interval': undefined });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback2, { 'interval': undefined });
                    setTimeout(() => {
                        console.info('----------------------MagneticFieldSensorJsTest014 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback);
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback2);
                        } catch (error) {
                        console.info("MagneticFieldSensorJsTest014 error:" + error);
                        expect(false).assertTrue();
                        }
                        console.info('----------------------MagneticFieldSensorJsTest014 off end--------------');
                        done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('MagneticFieldSensorJsTest014 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_MAGNETIC_FIELD_JSTest_0150
     * @tc.name: MagneticFieldSensorJsTest015
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("MagneticFieldSensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('MagneticFieldSensorJsTest015 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback, undefined);
                    try{
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback, { 'interval': undefined });
                    } catch(error){
                        console.info('MagneticFieldSensorJsTest015 Repeat subscription'+error);
                    }
                    setTimeout(() => {
                        console.info('----------------------MagneticFieldSensorJsTest015 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD);
                        } catch (error) {
                        console.info("MagneticFieldSensorJsTest015 error:" + error);
                        expect(false).assertTrue();
                        }
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('MagneticFieldSensorJsTest015 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_MAGNETIC_FIELD_JSTest_0160
     * @tc.name: MagneticFieldSensorJsTest016
     * @tc.desc: For normal scenarios
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("MagneticFieldSensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------MagneticFieldSensorJsTest016--------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('MagneticFieldSensorJsTest016 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback, null);
                    try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback, { 'interval': null });
                        } catch(error){
                            console.info('MagneticFieldSensorJsTest016 Repeat subscription'+error);
                        }
                    setTimeout(() => {
                        console.info('----------------------MagneticFieldSensorJsTest016 off in--------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD);
                            } catch (error) {
                        console.info("MagneticFieldSensorJsTest016 error:" + error);
                            expect(false).assertTrue();
                            }
                            done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('MagneticFieldSensorJsTest016 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_MAGNETIC_FIELD_JSTest_0170
     * @tc.name: MagneticFieldSensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("MagneticFieldSensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------MagneticFieldSensorJsTest017--------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('MagneticFieldSensorJsTest017 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback, { 'interval': null });
                    setTimeout(() => {
                        console.info('----------------------MagneticFieldSensorJsTest017 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD);
                        } catch (error) {
                        console.info("MagneticFieldSensorJsTest017 error:" + error);
                        expect(false).assertTrue();
                        }
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info("MagneticFieldSensorJsTest017 Device does not support! ");
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_MAGNETIC_FIELD_JSTest_0180
     * @tc.name: MagneticFieldSensorJsTest018
     * @tc.desc: Once Normal Subscription Scenario Use Case
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("MagneticFieldSensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    console.info('MagneticFieldSensorJsTest018 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback, { 'interval': 100000000 });
                    try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD, callback, { 'interval': 100000000 });
                        } catch(error){
                            console.info("MagneticFieldSensorJsTest018 catch error:" + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------MagneticFieldSensorJsTest018 off in--------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD);
                            } catch (error) {
                        console.info("MagneticFieldSensorJsTest018 error:" + error);
                            expect(false).assertTrue();
                            }
                        console.info('----------------------MagneticFieldSensorJsTest018 off end--------------');
                            done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info("MagneticFieldSensorJsTest018 Device does not support! ");
            done();
        }
    })
})}
