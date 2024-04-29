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

export default function SensorJsTest_sensor_7() {
describe("SensorJsTest_sensor_7", function () {
    function callback(data) {
        console.info("old callback" + JSON.stringify(data));
        expect(typeof (data.status)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        console.info("old callback2" + JSON.stringify(data));
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
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_CODE = 14500101
    const SERVICE_EXCEPTION_MSG = 'Service exception.'
    let errMessages = ['string is not defined','The parameter invalid'];
    let errMessage;

    /*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0010
     * @tc.name: HallSensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("HallSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------HallSensorJsTest001---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    console.info('HallSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback);
                setTimeout(() => {
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL);
                    done();
                }, 500);
                }
          })
        } catch (error) {
            console.info('HallSensorJsTest001 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_HALL_JSTest_0020
     * @tc.name: HallSensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("HallSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------HallSensorJsTest002---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    console.info('HallSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback, { 'interval': 100000000 });
                setTimeout(() => {
                    console.info('----------------------HallSensorJsTest002 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL);
                    console.info('----------------------HallSensorJsTest002 off end---------------------------');
                    done();
                }, 500);
                }
            })
        } catch (error) {
            console.info('HallSensorJsTest002 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_HALL_JSTest_0030
     * @tc.name: HallSensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("HallSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------HallSensorJsTest003---------------------------');
        function onSensorCallback(data) {
            console.info('HallSensorJsTest003  on error');
            expect(typeof (data.status)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    console.info('HallSensorJsTest018 error');
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, onSensorCallback, { 'interval': 100000000 }, 5);
                }
            })
        } catch (error) {
            console.info('HallSensorJsTest003 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_HALL_JSTest_0040
     * @tc.name: HallSensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("HallSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------HallSensorJsTest004---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    console.info('HallSensorJsTest018 error');
                    done();
                } else {
                sensor.once(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback);
                setTimeout(() => {
                    expect(true).assertTrue();
                    done();
                }, 500);
                }
            })
        } catch (error) {
            console.info('HallSensorJsTest004 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_HALL_JSTest_0050
     * @tc.name: HallSensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("HallSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------HallSensorJsTest005---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    console.info('HallSensorJsTest018 error');
                    done();
                } else {
                try {
                    sensor.once(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback, 5);
                    setTimeout(() => {
                    expect(true).assertTrue();
                    done();
                }, 500);
                } catch (error) {
                    console.info("HallSensorJsTest005 error:" + error);
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                }
                }
            })
        } catch (error) {
            console.info('HallSensorJsTest005 Device does not support! ');
            done();
        }
    })

   /*
     * @tc.number: SUB_SensorsSystem_HALL_JSTest_0060
     * @tc.name: HallSensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("HallSensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------HallSensorJsTest006---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    console.info('HallSensorJsTest018 error');
                    done();
                } else {
                   try {
                        sensor.off(string, "");
                    } catch (error) {
                        console.info("HallSensorJsTest006 error:" + error);
                        errMessage = error.toString().slice(16, 40);
                        expect(errMessage).assertEqual(errMessages[0]);
                        done();
                    }
                }
           })
        } catch (error) {
            console.info('HallSensorJsTest006 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_HALL_JSTest_0070
     * @tc.name: HallSensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("HallSensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------HallSensorJsTest007---------------------------');
        function onSensorCallback(data) {
            console.info('HallSensorJsTest007  on error');
            expect(typeof (data.status)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    console.info('HallSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, onSensorCallback);
                setTimeout(() => {
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL, onSensorCallback);
                    done();
                }, 500);
                }
            })
        } catch (error) {
            console.info('HallSensorJsTest007 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_HALL_JSTest_0080
     * @tc.name: HallSensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("HallSensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------HallSensorJsTest008---------------------------');
        function onSensorCallback(data) {
            console.info('HallSensorJsTest008  on error');
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    console.info('HallSensorJsTest018 error');
                    done();
                } else {
                try {
                    sensor.off(1000000, onSensorCallback);
                } catch (error) {
                    console.info("HallSensorJsTest008 error:" + error);
                    errMessage = error.toString().slice(7, 28);
                    expect(errMessage).assertEqual(errMessages[1]);
                    done();
                }
                }
            })
        } catch (error) {
            console.info('HallSensorJsTest008 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_HALL_JSTest_0090
     * @tc.name: HallSensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("HallSensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------HallSensorJsTest009---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    console.info('HallSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback);
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback2);
                setTimeout(() => {
                    console.info('----------------------HallSensorJsTest009 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL);
                    console.info('----------------------HallSensorJsTest009 off end---------------------------');
                    done();
                }, 1000);
                }
            })
        } catch (error) {
            console.info('HallSensorJsTest009 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_HALL_JSTest_0100
     * @tc.name: HallSensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("HallSensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------HallSensorJsTest010---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    console.info('HallSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback);
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback2);
                setTimeout(() => {
                    console.info('----------------------HallSensorJsTest010 off in---------------------------');
                    try {
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback);
                    } catch (error) {
                    console.info("HallSensorJsTest010 error:" + error);
                    }
                    console.info('----------------------HallSensorJsTest010 off end---------------------------');
                }, 500);
                setTimeout(() => {
                    console.info('----------------------HallSensorJsTest010 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback2);
                    console.info('----------------------HallSensorJsTest010 off end---------------------------');
                    done();
                }, 1000);
                }
            })
        } catch (error) {
            console.info('HallSensorJsTest010 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_HALL_JSTest_0110
     * @tc.name: HallSensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("HallSensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------HallSensorJsTest011---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    console.info('HallSensorJsTest018 error');
                    done();
                } else {
               sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback, { 'interval': 100000000 });
                sensor.once(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback2);
                setTimeout(() => {
                    console.info('----------------------HallSensorJsTest011 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL);
                    console.info('----------------------HallSensorJsTest011 off end---------------------------');
                    done();
                }, 1000);
                }
            })
        } catch (error) {
            console.info('HallSensorJsTest011 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_HALL_JSTest_0120
     * @tc.name:HallSensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("HallSensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------HallSensorJsTest012---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    console.info('HallSensorJsTest018 error');
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------HallSensorJsTest012 off in---------------------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback);
                        } catch (error) {
                        console.info("HallSensorJsTest012 error:" + error);
                        }
                        console.info('----------------------HallSensorJsTest012 off end---------------------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------HallSensorJsTest012 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback2);
                        console.info('----------------------HallSensorJsTest012 off end---------------------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('HallSensorJsTest012 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_HALL_JSTest_0130
     * @tc.name:HallSensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("HallSensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------HallSensorJsTest013---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    console.info('HallSensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback, { 'interval': 100000000 });
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback2, { 'interval': 100000000 });
                setTimeout(() => {
                    console.info('----------------------HallSensorJsTest013 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL);
                    console.info('----------------------HallSensorJsTest013 off end---------------------------');
                    done();
                }, 1000);
                }
            })
        } catch (error) {
            console.info('HallSensorJsTest013 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0140
     * @tc.name: HallSensorJsTest014
     * @tc.desc: Functional Use Cases
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("HallSensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------HallSensorJsTest014--------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    console.info('HallSensorJsTest014 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback, { 'interval': undefined });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback2, { 'interval': undefined });
                    setTimeout(() => {
                        console.info('----------------------HallSensorJsTest014 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback);
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback2);
                        } catch (error) {
                        console.info("HallSensorJsTest014 error:" + error);
                        expect(false).assertTrue();
                        }
                        console.info('----------------------HallSensorJsTest014 off end--------------');
                        done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('HallSensorJsTest014 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0150
     * @tc.name: HallSensorJsTest015
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("HallSensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    console.info('HallSensorJsTest015 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback, undefined);
                    try{
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback, { 'interval': undefined });
                    } catch(error){
                        console.info('HallSensorJsTest015 Repeat subscription'+error);
                    }
                    setTimeout(() => {
                        console.info('----------------------HallSensorJsTest015 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL);
                        } catch (error) {
                        console.info("HallSensorJsTest015 error:" + error);
                        expect(false).assertTrue();
                        }
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('HallSensorJsTest015 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0160
     * @tc.name: HallSensorJsTest016
     * @tc.desc: For normal scenarios
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("HallSensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------HallSensorJsTest016--------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    console.info('HallSensorJsTest016 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback, null);
                    try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback, { 'interval': null });
                        } catch(error){
                            console.info('HallSensorJsTest016 Repeat subscription'+error);
                        }
                    setTimeout(() => {
                        console.info('----------------------HallSensorJsTest016 off in--------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL);
                            } catch (error) {
                        console.info("HallSensorJsTest016 error:" + error);
                            expect(false).assertTrue();
                            }
                            done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('HallSensorJsTest016 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0170
     * @tc.name: HallSensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("HallSensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------HallSensorJsTest017--------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    console.info('HallSensorJsTest017 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback, { 'interval': null });
                    setTimeout(() => {
                        console.info('----------------------HallSensorJsTest017 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL);
                        } catch (error) {
                        console.info("HallSensorJsTest017 error:" + error);
                        expect(false).assertTrue();
                        }
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info("HallSensorJsTest017 Device does not support! ");
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0180
     * @tc.name: HallSensorJsTest018
     * @tc.desc: Once Normal Subscription Scenario Use Case
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("HallSensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    console.info('HallSensorJsTest018 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback, { 'interval': 100000000 });
                    try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback, { 'interval': 100000000 });
                        } catch(error){
                            console.info("HallSensorJsTest018 catch error:" + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------HallSensorJsTest018 off in--------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL);
                            } catch (error) {
                        console.info("HallSensorJsTest018 error:" + error);
                            expect(false).assertTrue();
                            }
                        console.info('----------------------HallSensorJsTest018 off end--------------');
                            done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info("HallSensorJsTest018 Device does not support! ");
            done();
        }
    })
})}
