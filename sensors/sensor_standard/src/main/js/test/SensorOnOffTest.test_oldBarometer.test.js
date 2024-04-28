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

export default function SensorJsTest_sensor_8() {
describe("SensorJsTest_sensor_8", function () {
    function callback(data) {
        console.info("old callback" + JSON.stringify(data));
        expect(typeof (data.pressure)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        console.info("old callback2" + JSON.stringify(data));
        expect(typeof (data.pressure)).assertEqual("number");
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
    let invalid  = -1;
    let errMessages = ['string is not defined','The parameter invalid'];
    let errMessage;
    let TAG = '';

     /*
     * @tc.number:SUB_SensorsSystem_BAROMETER_JSTest_0010
     * @tc.name: BarometerSensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("BarometerSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------BarometerSensorJsTest001---------------------------');
        TAG = "BarometerSensorJsTest001";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback);
                    setTimeout(() => {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER);
                        done();
                    }, 500);
                    }
                })
        } catch (error) {
            console.info('BarometerSensorJsTest001 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0020
     * @tc.name: BarometerSensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("BarometerSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------BarometerSensorJsTest002---------------------------');
        TAG = "BarometerSensorJsTest002";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------BarometerSensorJsTest002 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER);
                        console.info('----------------------BarometerSensorJsTest002 off end---------------------------');
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info('BarometerSensorJsTest002 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0030
     * @tc.name: BarometerSensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("BarometerSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------BarometerSensorJsTest003---------------------------');
        TAG = "BarometerSensorJsTest003";
        function onSensorCallback(data) {
            console.info('BarometerSensorJsTest003  on error');
            expect(typeof (data.pressure)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, onSensorCallback, { 'interval': 100000000 }, 5);
                }
            })
        } catch (error) {
            console.info('BarometerSensorJsTest003 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0040
     * @tc.name: BarometerSensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("BarometerSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------BarometerSensorJsTest004---------------------------');
        TAG = "BarometerSensorJsTest004";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.once(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback);
                    setTimeout(() => {
                        expect(true).assertTrue();
                        done();
                    }, 500);
                }
          })
        } catch (error) {
            console.info('BarometerSensorJsTest004 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0050
     * @tc.name: BarometerSensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("BarometerSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------BarometerSensorJsTest005---------------------------');
        TAG = "BarometerSensorJsTest005";
        function onceSensorCallback(data) {
            console.info('BarometerSensorJsTest005  on error');
            expect(typeof (data.pressure)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, onceSensorCallback, 5);
                    } catch (error) {
                        console.info("BarometerSensorJsTest005 error:" + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                    }
                }
            })
        } catch (error) {
            console.info('BarometerSensorJsTest005 Device does not support! ');
            done();
        }
    })

   /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0060
     * @tc.name: BarometerSensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("BarometerSensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------BarometerSensorJsTest006---------------------------');
        TAG = "BarometerSensorJsTest006";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                   try {
                        sensor.off(string, "");
                    } catch (error) {
                        console.info("BarometerSensorJsTest006 error:" + error);
                        errMessage = error.toString().slice(16, 40);
                        expect(errMessage).assertEqual(errMessages[0]);
                        done();
                    }
                }
          })
        } catch (error) {
            console.info('BarometerSensorJsTest006 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0070
     * @tc.name: BarometerSensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("BarometerSensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------BarometerSensorJsTest007---------------------------');
        TAG = "BarometerSensorJsTest007";
        function onSensorCallback(data) {
            console.info('BarometerSensorJsTest007  on error');
            expect(typeof (data.pressure)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, onSensorCallback);
                    setTimeout(() => {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, onSensorCallback);
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info('BarometerSensorJsTest007 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0080
     * @tc.name: BarometerSensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("BarometerSensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------BarometerSensorJsTest008---------------------------');
        TAG = "BarometerSensorJsTest008";
        function onSensorCallback(data) {
            console.info('BarometerSensorJsTest008  on error');
            expect(false).assertTrue();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                        sensor.off(1000000, onSensorCallback);
                    } catch (error) {
                        console.info("BarometerSensorJsTest008 error:" + error);
                        errMessage = error.toString().slice(7, 28);
                        expect(errMessage).assertEqual(errMessages[1]);
                        done();
                    }
                }
            })
        } catch (error) {
            console.info('BarometerSensorJsTest008 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0090
     * @tc.name: BarometerSensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("BarometerSensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------BarometerSensorJsTest009---------------------------');
        TAG = "BarometerSensorJsTest009";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback);
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback2);
                    setTimeout(() => {
                        console.info('----------------------BarometerSensorJsTest009 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER);
                        console.info('----------------------BarometerSensorJsTest009 off end---------------------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('BarometerSensorJsTest009 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0100
     * @tc.name: BarometerSensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("BarometerSensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------BarometerSensorJsTest010---------------------------');
        TAG = "BarometerSensorJsTest010";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback);
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback2);
                    setTimeout(() => {
                        console.info('----------------------BarometerSensorJsTest010 off in---------------------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback);
                        } catch (error) {
                        console.info("BarometerSensorJsTest010 error:" + error);
                        }
                        console.info('----------------------BarometerSensorJsTest010 off end---------------------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------BarometerSensorJsTest010 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback2);
                        console.info('----------------------BarometerSensorJsTest010 off end---------------------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('BarometerSensorJsTest010 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0110
     * @tc.name: BarometerSensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("BarometerSensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------BarometerSensorJsTest011---------------------------');
        TAG = "BarometerSensorJsTest011";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': 100000000 });
                    sensor.once(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback2);
                    setTimeout(() => {
                        console.info('----------------------BarometerSensorJsTest011 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER);
                        console.info('----------------------BarometerSensorJsTest011 off end---------------------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('BarometerSensorJsTest011 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0120
     * @tc.name:BarometerSensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("BarometerSensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------BarometerSensorJsTest012---------------------------');
        TAG = "BarometerSensorJsTest012";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------BarometerSensorJsTest012 off in---------------------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback);
                        } catch (error) {
                        console.info("BarometerSensorJsTest012 error:" + error);
                        }
                        console.info('----------------------BarometerSensorJsTest012 off end---------------------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------BarometerSensorJsTest012 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback2);
                        console.info('----------------------BarometerSensorJsTest012 off end---------------------------');
                        done();
                    }, 1000);
                }
           })
        } catch (error) {
            console.info('BarometerSensorJsTest012 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0130
     * @tc.name:BarometerSensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("BarometerSensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------BarometerSensorJsTest013---------------------------');
        TAG = "BarometerSensorJsTest013";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------BarometerSensorJsTest013 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER);
                        console.info('----------------------BarometerSensorJsTest013 off end---------------------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('BarometerSensorJsTest013 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_BAROMETER_JSTest_0140
     * @tc.name: BarometerSensorJsTest014
     * @tc.desc: Functional Use Cases
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("BarometerSensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------BarometerSensorJsTest014--------------');
        TAG = "BarometerSensorJsTest014";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info('BarometerSensorJsTest014 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': undefined });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback2, { 'interval': undefined });
                    setTimeout(() => {
                        console.info('----------------------BarometerSensorJsTest014 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback);
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback2);
                        } catch (error) {
                        console.info("BarometerSensorJsTest014 error:" + error);
                        expect(false).assertTrue();
                        }
                        console.info('----------------------BarometerSensorJsTest014 off end--------------');
                        done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('BarometerSensorJsTest014 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_BAROMETER_JSTest_0150
     * @tc.name: BarometerSensorJsTest015
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("BarometerSensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "BarometerSensorJsTest015";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info('BarometerSensorJsTest015 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, undefined);
                    try{
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': undefined });
                    } catch(error){
                        console.info('BarometerSensorJsTest015 Repeat subscription'+error);
                    }
                    setTimeout(() => {
                        console.info('----------------------BarometerSensorJsTest015 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER);
                        } catch (error) {
                        console.info("BarometerSensorJsTest015 error:" + error);
                        expect(false).assertTrue();
                        }
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('BarometerSensorJsTest015 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_BAROMETER_JSTest_0160
     * @tc.name: BarometerSensorJsTest016
     * @tc.desc: For normal scenarios
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("BarometerSensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------BarometerSensorJsTest016--------------');
        TAG = "BarometerSensorJsTest016";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info('BarometerSensorJsTest016 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, null);
                    try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': null });
                        } catch(error){
                            console.info('BarometerSensorJsTest016 Repeat subscription'+error);
                        }
                    setTimeout(() => {
                        console.info('----------------------BarometerSensorJsTest016 off in--------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER);
                            } catch (error) {
                        console.info("BarometerSensorJsTest016 error:" + error);
                            expect(false).assertTrue();
                            }
                            done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('BarometerSensorJsTest016 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_BAROMETER_JSTest_0170
     * @tc.name: BarometerSensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("BarometerSensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------BarometerSensorJsTest017--------------');
        TAG = "BarometerSensorJsTest017";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info('BarometerSensorJsTest017 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': null });
                    setTimeout(() => {
                        console.info('----------------------BarometerSensorJsTest017 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER);
                        } catch (error) {
                        console.info("BarometerSensorJsTest017 error:" + error);
                        expect(false).assertTrue();
                        }
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info("BarometerSensorJsTest017 Device does not support! ");
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_BAROMETER_JSTest_0180
     * @tc.name: BarometerSensorJsTest018
     * @tc.desc: Once Normal Subscription Scenario Use Case
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("BarometerSensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "BarometerSensorJsTest018";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info('BarometerSensorJsTest018 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': 100000000 });
                    try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': 100000000 });
                        } catch(error){
                            console.info("BarometerSensorJsTest018 catch error:" + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------BarometerSensorJsTest018 off in--------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER);
                            } catch (error) {
                        console.info("BarometerSensorJsTest018 error:" + error);
                            expect(false).assertTrue();
                            }
                        console.info('----------------------BarometerSensorJsTest018 off end--------------');
                            done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info("BarometerSensorJsTest018 Device does not support! ");
            done();
        }
    })
})}
