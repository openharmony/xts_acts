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

export default function SensorJsTest_sensor_4() {
describe("SensorJsTest_sensor_4", function () {
    function callback(data) {
        console.info("old callback" + JSON.stringify(data));
        expect(typeof (data.intensity)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        console.info("old callback2" + JSON.stringify(data));
        expect(typeof (data.intensity)).assertEqual("number");
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
     * @tc.number:SUB_SensorsSystem_Ambient_Light_JSTest_0010
     * @tc.name: AmbientLightSensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("AmbientLightSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------AmbientLightSensorJsTest001---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    console.info( ' AmbientLightSensorJsTest error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback);
                    setTimeout(() => {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT);
                        done();
                    }, 500);
                }
           })
        } catch (error) {
            console.info('AmbientLightSensorJsTest001 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Ambient_Light_JSTest_0020
     * @tc.name: AmbientLightSensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("AmbientLightSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------AmbientLightSensorJsTest002---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    console.info( ' AmbientLightSensorJsTest error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------AmbientLightSensorJsTest002 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT);
                        console.info('----------------------AmbientLightSensorJsTest002 off end---------------------------');
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info('AmbientLightSensorJsTest002 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Ambient_Light_JSTest_0030
     * @tc.name: AmbientLightSensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("AmbientLightSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------AmbientLightSensorJsTest003---------------------------');
        function onSensorCallback(data) {
            console.info('AmbientLightSensorJsTest003  on error');
            expect(typeof (data.intensity)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    console.info( ' AmbientLightSensorJsTest error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, onSensorCallback, { 'interval': 100000000 }, 5);
                }
            })
        } catch (error) {
            console.info('AmbientLightSensorJsTest003 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Ambient_Light_JSTest_0040
     * @tc.name: AmbientLightSensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("AmbientLightSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------AmbientLightSensorJsTest004---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    console.info( ' AmbientLightSensorJsTest error:' + error);
                    done();
                } else {
                    sensor.once(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback);
                    setTimeout(() => {
                        expect(true).assertTrue();
                        done();
                    }, 500);
                }
           })
        } catch (error) {
            console.info('AmbientLightSensorJsTest004 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Ambient_Light_JSTest_0050
     * @tc.name: AmbientLightSensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("AmbientLightSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------AmbientLightSensorJsTest005---------------------------');
        function onceSensorCallback(data) {
            console.info('AmbientLightSensorJsTest005  on error');
            expect(typeof (data.intensity)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    console.info( ' AmbientLightSensorJsTest error:' + error);
                    done();
                } else {
                    try {
                        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, onceSensorCallback, 5);
                    } catch (error) {
                        console.info("AmbientLightSensorJsTest005 error:" + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                    }
                }
            })
        } catch (error) {
            console.info('AmbientLightSensorJsTest005 Device does not support! ');
            done();
        }
    })

   /*
     * @tc.number: SUB_SensorsSystem_Ambient_Light_JSTest_0060
     * @tc.name: AmbientLightSensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("AmbientLightSensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------AmbientLightSensorJsTest006---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    console.info( ' AmbientLightSensorJsTest error:' + error);
                    done();
                } else {
                   try {
                        sensor.off(string, "");
                    } catch (error) {
                        console.info("AmbientLightSensorJsTest006 error:" + error);
                        errMessage = error.toString().slice(16, 40);
                        expect(errMessage).assertEqual(errMessages[0]);
                        done();
                    }
                }
          })
        } catch (error) {
            console.info('AmbientLightSensorJsTest006 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Ambient_Light_JSTest_0070
     * @tc.name: AmbientLightSensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("AmbientLightSensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------AmbientLightSensorJsTest007---------------------------');
        function onSensorCallback(data) {
            console.info('AmbientLightSensorJsTest007  on error');
            expect(typeof (data.intensity)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    console.info( ' AmbientLightSensorJsTest error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, onSensorCallback);
                    setTimeout(() => {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, onSensorCallback);
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info('AmbientLightSensorJsTest007 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Ambient_Light_JSTest_0080
     * @tc.name: AmbientLightSensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("AmbientLightSensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------AmbientLightSensorJsTest008---------------------------');
        function onSensorCallback(data) {
            console.info('AmbientLightSensorJsTest008  on error');
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    console.info( ' AmbientLightSensorJsTest error:' + error);
                    done();
                } else {
                    try {
                        sensor.off(1000000, onSensorCallback);
                    } catch (error) {
                        console.info("AmbientLightSensorJsTest008 error:" + error);
                        errMessage = error.toString().slice(7, 28);
                        expect(errMessage).assertEqual(errMessages[1]);
                        done();
                    }
                }
            })
        } catch (error) {
            console.info('AmbientLightSensorJsTest008 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Ambient_Light_JSTest_0090
     * @tc.name: AmbientLightSensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("AmbientLightSensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------AmbientLightSensorJsTest009---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    console.info( ' AmbientLightSensorJsTest error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback);
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback2);
                    setTimeout(() => {
                        console.info('----------------------AmbientLightSensorJsTest009 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT);
                        console.info('----------------------AmbientLightSensorJsTest009 off end---------------------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('AmbientLightSensorJsTest009 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Ambient_Light_JSTest_0100
     * @tc.name: AmbientLightSensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("AmbientLightSensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------AmbientLightSensorJsTest010---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    console.info( ' AmbientLightSensorJsTest error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback);
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback2);
                    setTimeout(() => {
                        console.info('----------------------AmbientLightSensorJsTest010 off in---------------------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback);
                        } catch (error) {
                        console.info("AmbientLightSensorJsTest010 error:" + error);
                        }
                        console.info('----------------------AmbientLightSensorJsTest010 off end---------------------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------AmbientLightSensorJsTest010 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback2);
                        console.info('----------------------AmbientLightSensorJsTest010 off end---------------------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('AmbientLightSensorJsTest010 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Ambient_Light_JSTest_0110
     * @tc.name: AmbientLightSensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("AmbientLightSensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------AmbientLightSensorJsTest011---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    console.info( ' AmbientLightSensorJsTest error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback, { 'interval': 100000000 });
                    sensor.once(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback2);
                    setTimeout(() => {
                        console.info('----------------------AmbientLightSensorJsTest011 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT);
                        console.info('----------------------AmbientLightSensorJsTest011 off end---------------------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('AmbientLightSensorJsTest011 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Ambient_Light_JSTest_0120
     * @tc.name:AmbientLightSensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("AmbientLightSensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------AmbientLightSensorJsTest012---------------------------');
         try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    console.info( ' AmbientLightSensorJsTest error:' + error);
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------AmbientLightSensorJsTest012 off in---------------------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback);
                        } catch (error) {
                        console.info("AmbientLightSensorJsTest012 error:" + error);
                        }
                        console.info('----------------------AmbientLightSensorJsTest012 off end---------------------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------AmbientLightSensorJsTest012 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback2);
                        console.info('----------------------AmbientLightSensorJsTest012 off end---------------------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('AmbientLightSensorJsTest012 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Ambient_Light_JSTest_0130
     * @tc.name:AmbientLightSensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("AmbientLightSensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------AmbientLightSensorJsTest013---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    console.info( ' AmbientLightSensorJsTest error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------AmbientLightSensorJsTest013 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT);
                        console.info('----------------------AmbientLightSensorJsTest013 off end---------------------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('AmbientLightSensorJsTest013 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Ambient_Light_JSTest_0140
     * @tc.name: AmbientLightSensorJsTest014
     * @tc.desc: Functional Use Cases
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("AmbientLightSensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------AmbientLightSensorJsTest014--------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    console.info('AmbientLightSensorJsTest014 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback, { 'interval': undefined });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback2, { 'interval': undefined });
                    setTimeout(() => {
                        console.info('----------------------AmbientLightSensorJsTest014 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback);
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback2);
                        } catch (error) {
                        console.info("AmbientLightSensorJsTest014 error:" + error);
                        expect(false).assertTrue();
                        }
                        console.info('----------------------AmbientLightSensorJsTest014 off end--------------');
                        done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('AmbientLightSensorJsTest014 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Ambient_Light_JSTest_0150
     * @tc.name: AmbientLightSensorJsTest015
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("AmbientLightSensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    console.info('AmbientLightSensorJsTest015 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback, undefined);
                    try{
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback, { 'interval': undefined });
                    } catch(error){
                        console.info('AmbientLightSensorJsTest015 Repeat subscription'+error);
                    }
                    setTimeout(() => {
                        console.info('----------------------AmbientLightSensorJsTest015 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT);
                        } catch (error) {
                        console.info("AmbientLightSensorJsTest015 error:" + error);
                        expect(false).assertTrue();
                        }
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('AmbientLightSensorJsTest015 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Ambient_Light_JSTest_0160
     * @tc.name: AmbientLightSensorJsTest016
     * @tc.desc: For normal scenarios
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("AmbientLightSensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------AmbientLightSensorJsTest016--------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    console.info('AmbientLightSensorJsTest016 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback, null);
                    try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback, { 'interval': null });
                        } catch(error){
                            console.info('AmbientLightSensorJsTest016 Repeat subscription'+error);
                        }
                    setTimeout(() => {
                        console.info('----------------------AmbientLightSensorJsTest016 off in--------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT);
                            } catch (error) {
                        console.info("AmbientLightSensorJsTest016 error:" + error);
                            expect(false).assertTrue();
                            }
                            done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('AmbientLightSensorJsTest016 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Ambient_Light_JSTest_0170
     * @tc.name: AmbientLightSensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("AmbientLightSensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------AmbientLightSensorJsTest017--------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    console.info('AmbientLightSensorJsTest017 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback, { 'interval': null });
                    setTimeout(() => {
                        console.info('----------------------AmbientLightSensorJsTest017 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT);
                        } catch (error) {
                        console.info("AmbientLightSensorJsTest017 error:" + error);
                        expect(false).assertTrue();
                        }
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info("AmbientLightSensorJsTest017 Device does not support! ");
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Ambient_Light_JSTest_0180
     * @tc.name: AmbientLightSensorJsTest018
     * @tc.desc: Once Normal Subscription Scenario Use Case
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("AmbientLightSensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    console.info('AmbientLightSensorJsTest018 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback, { 'interval': 100000000 });
                    try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT, callback, { 'interval': 100000000 });
                        } catch(error){
                            console.info("AmbientLightSensorJsTest018 catch error:" + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------AmbientLightSensorJsTest018 off in--------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT);
                            } catch (error) {
                        console.info("AmbientLightSensorJsTest018 error:" + error);
                            expect(false).assertTrue();
                            }
                        console.info('----------------------AmbientLightSensorJsTest018 off end--------------');
                            done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info("AmbientLightSensorJsTest018 Device does not support! ");
            done();
        }
    })
})}
