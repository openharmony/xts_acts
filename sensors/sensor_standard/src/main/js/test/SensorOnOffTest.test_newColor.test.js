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

export default function SensorJsTest_sensor_61(){
describe("SensorJsTest_sensor_61", function () {
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
        expect(typeof(data.lightIntensity)).assertEqual("number");
        expect(typeof(data.colorTemperature)).assertEqual("number");
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
        expect(typeof(data.lightIntensity)).assertEqual("number");
        expect(typeof(data.colorTemperature)).assertEqual("number");
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
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0010
    * @tc.name: newColorSensorJsTest001
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 0
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newColorSensorJsTest001--------------');
        TAG = 'newColorSensorJsTest001'
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG +' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.COLOR, callback);
                        setTimeout(()=>{
                            sensor.off(sensor.SensorId.COLOR);
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
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0020
    * @tc.name: newColorSensorJsTest002
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newColorSensorJsTest002--------------');
        TAG = 'newColorSensorJsTest002'
        function onSensorCallback(data) {
            console.info(TAG + ' callback in');
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG +' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    try {
                        sensor.on(invalid, onSensorCallback);
                    } catch (error) {
                        console.info(TAG + ' illegal parameter!');
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
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0030
    * @tc.name: newColorSensorJsTest003
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newColorSensorJsTest003--------------');
        TAG = 'newColorSensorJsTest003 '
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG +' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    try {
                        sensor.off(sensor.SensorId.COLOR, 5);
                    } catch (error) {
                        console.info(TAG + 'illegal parameter!');
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
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0040
    * @tc.name: newColorSensorJsTest004
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newColorSensorJsTest004--------------');
        TAG = 'newColorSensorJsTest004 '
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.COLOR, callback, {'interval': 100000000});
                    setTimeout(()=>{
                        console.info('---------newColorSensorJsTest004 off in--------------');
                        sensor.off(sensor.SensorId.COLOR);
                        console.info('---------newColorSensorJsTest004 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0050
    * @tc.name: newColorSensorJsTest005
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newColorSensorJsTest005--------------');
        TAG = 'newColorSensorJsTest005 '
        function onSensorCallback(data) {
            console.info(TAG + 'callback in,data:' + data);
            expect(typeof(data.lightIntensity)).assertEqual("number");
            expect(typeof(data.colorTemperature)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.COLOR, onSensorCallback, {'interval': 100000000}, 5);
                    setTimeout(()=>{
                        console.info('---------newColorSensorJsTest005 off in--------------');
                        sensor.off(sensor.SensorId.COLOR);
                        console.info('---------newColorSensorJsTest005 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0060
    * @tc.name: newColorSensorJsTest006
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newColorSensorJsTest006 '
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.once(sensor.SensorId.COLOR, callback);
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
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0070
    * @tc.name: newColorSensorJsTest007
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newColorSensorJsTest007 '
        function onceSensorCallback(data) {
            console.info(TAG + 'callback in');
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    try {
                        sensor.once(invalid, onceSensorCallback);
                    } catch (error) {
                        console.info(TAG + ' illegal parameter!');
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
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0080
    * @tc.name: newColorSensorJsTest008
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newColorSensorJsTest008 '
        function onceSensorCallback(data) {
            console.info(TAG + 'callback in');
            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                sensor.SensorAccuracy.ACCURACY_HIGH) {
                console.info('callback accuracy verified' + JSON.stringify(data));
                expect(true).assertTrue();
            } else {
                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                expect(false).assertTrue();
            }
            expect(typeof(data.lightIntensity)).assertEqual("number");
            expect(typeof(data.colorTemperature)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.once(sensor.SensorId.COLOR, onceSensorCallback, 5);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0090
    * @tc.name: newColorSensorJsTest009
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newColorSensorJsTest009'
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    try {
                        sensor.off(invalid, callback);
                    } catch (error) {
                        console.info(TAG + ' illegal parameter!');
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
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0100
    * @tc.name: newColorSensorJsTest010
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newColorSensorJsTest010 '
        function onSensorCallback(data) {
            console.info(TAG + 'callback in');
            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                sensor.SensorAccuracy.ACCURACY_HIGH) {
                console.info('callback accuracy verified' + JSON.stringify(data));
                expect(true).assertTrue();
            } else {
                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                expect(false).assertTrue();
            }
            expect(typeof(data.lightIntensity)).assertEqual("number");
            expect(typeof(data.colorTemperature)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:'+error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.COLOR, onSensorCallback);
                    setTimeout(()=>{
                        sensor.off(sensor.SensorId.COLOR, onSensorCallback);
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
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0110
    * @tc.name: newColorSensorJsTest011
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newColorSensorJsTest011'
        function onSensorCallback(data) {
            console.info(TAG + 'on error');
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:'+error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    try {
                        sensor.off(1000000, onSensorCallback);
                    } catch (error) {
                        console.info(TAG + "error:" +error);
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
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0120
    * @tc.name: newColorSensorJsTest012
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newColorSensorJsTest012 '
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.COLOR, (data)=>{
                        console.info(TAG + "callback: " + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof(data.lightIntensity)).assertEqual("number");
                        expect(typeof(data.colorTemperature)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    sensor.on(sensor.SensorId.COLOR, (data)=>{
                        console.info(TAG + "callback2: " + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof(data.lightIntensity)).assertEqual("number");
                        expect(typeof(data.colorTemperature)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    setTimeout(()=>{
                        console.info('---------newColorSensorJsTest012 off in--------------');
                        sensor.off(sensor.SensorId.COLOR);
                        console.info('---------newColorSensorJsTest012 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + "Device does not support! ");
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0130
    * @tc.name: newColorSensorJsTest013
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        TAG = 'newColorSensorJsTest013 '
        console.info('---------newColorSensorJsTest013--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.COLOR, callback, { 'interval': undefined });
                    sensor.on(sensor.SensorId.COLOR, callback2, { 'interval': undefined });
                    setTimeout(() => {
                        console.info('----------------------newColorSensorJsTest013 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.COLOR, callback);
                            sensor.off(sensor.SensorId.COLOR, callback2);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                            expect(false).assertTrue();
                        }
                        console.info('----------------------newColorSensorJsTest013 off end--------------');
                        done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + 'Device does not support! ');
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0140
    * @tc.name: newColorSensorJsTest014
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newColorSensorJsTest014 '
        console.info('---------newColorSensorJsTest014--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.COLOR, (data)=>{
                        console.info(TAG + "callback: " + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof(data.lightIntensity)).assertEqual("number");
                        expect(typeof(data.colorTemperature)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    sensor.once(sensor.SensorId.COLOR, (data)=>{
                        console.info(TAG + "callback2: " + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof(data.lightIntensity)).assertEqual("number");
                        expect(typeof(data.colorTemperature)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    setTimeout(()=>{
                        console.info('---------newColorSensorJsTest014 off in--------------');
                        sensor.off(sensor.SensorId.COLOR);
                        console.info('---------newColorSensorJsTest014 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + "Device does not support! ");
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0150
    * @tc.name: newColorSensorJsTest015
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newColorSensorJsTest015 '
        console.info('---------newColorSensorJsTest015--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.COLOR, (data)=>{
                        console.info(TAG + "callback: " + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof(data.lightIntensity)).assertEqual("number");
                        expect(typeof(data.colorTemperature)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    sensor.on(sensor.SensorId.COLOR, (data)=>{
                        console.info(TAG + "callback2: " + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof(data.lightIntensity)).assertEqual("number");
                        expect(typeof(data.colorTemperature)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    setTimeout(()=>{
                        console.info('---------newColorSensorJsTest015 off in--------------');
                        sensor.off(sensor.SensorId.COLOR);
                        console.info('---------newColorSensorJsTest015 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + "Device does not support! ");
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0160
    * @tc.name: newColorSensorJsTest016
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newColorSensorJsTest016 '
        console.info('---------newColorSensorJsTest016--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    try {
                        sensor.on();
                    } catch (error) {
                        console.info(TAG + "error:" +error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                    try {
                        sensor.once();
                    } catch (error) {
                        console.info(TAG + "once error:" +error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                    try {
                        sensor.off();
                    } catch (error) {
                        console.info(TAG + "off error:" +error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + 'Device does not support! ');
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0170
    * @tc.name: newColorSensorJsTest017
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newColorSensorJsTest017'
        console.info('----------------------newColorSensorJsTest017--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + "error:" +error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.COLOR, callback);
                    sensor.on(sensor.SensorId.COLOR, callback2);
                    setTimeout(() => {
                        console.info('----------------------newColorSensorJsTest017 off in--------------');
                        try {
                        sensor.off(sensor.SensorId.COLOR, callback);
                        } catch (error) {
                            console.info(TAG + "catch error:" +error);
                        }
                        console.info('----------------------newColorSensorJsTest017 off end--------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------newColorSensorJsTest017 off in--------------');
                        sensor.off(sensor.SensorId.COLOR, callback2);
                        console.info('----------------------newColorSensorJsTest017 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + "Device does not support! ");
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0180
    * @tc.name: newColorSensorJsTest018
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newColorSensorJsTest018'
        console.info('----------------------newColorSensorJsTest018--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + "error:" +error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.COLOR, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorId.COLOR, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------newColorSensorJsTest018 off in--------------');
                        try {
                        sensor.off(sensor.SensorId.COLOR, callback);
                        } catch (error) {
                            console.info(TAG + "catch error:" +error);
                        }
                        console.info('----------------------newColorSensorJsTest018 off end--------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------newColorSensorJsTest018_2 off in--------------');
                        sensor.off(sensor.SensorId.COLOR, callback2);
                        console.info('----------------------newColorSensorJsTest018_2 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + "Device does not support! ");
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0190
    * @tc.name: newColorSensorJsTest019
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newColorSensorJsTest019 '
        console.info('----------------------newColorSensorJsTest019--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error：'+ error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    console.info('----------------------newColorSensorJsTest019 off in--------------');
                    try{
                        sensor.off(-1, callback);
                        console.info('----------------------newColorSensorJsTest019 off end--------------');
                    } catch (error) {
                        console.info(TAG + "catch error:" + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + "Device does not support! ");
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0200
    * @tc.name: newColorSensorJsTest020
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newColorSensorJsTest020'
        console.info('----------------------newColorSensorJsTest020--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error：'+ error);
                    done();
                } else {
                    try {
                        sensor.on(sensor.SensorId.COLOR, callback, {'interval': -100000000});
                        console.info('----------------------newColorSensorJsTest020 off in---------------------------');
                        sensor.off(sensor.SensorId.COLOR);
                        console.info('----------------------newColorSensorJsTest020 off end---------------------------');
                        done();
                    } catch (error) {
                        console.info(TAG + 'On fail, errCode:' + error.code + ' ,msg:' + error.message);
                        expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                        expect(error.message).assertEqual(SERVICE_EXCEPTION_MSG);
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + "Device does not support! ");
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0210
    * @tc.name: newColorSensorJsTest021
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        TAG = 'newColorSensorJsTest021 '
        console.info('---------newColorSensorJsTest021--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error：'+ error);
                    done();
                } else {
                    sensor.on(sensor.SensorId.COLOR, callback);
                    setTimeout(()=>{
                        sensor.off(sensor.SensorId.COLOR);
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info(TAG + 'Device does not support! ');
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0220
    * @tc.name: newColorSensorJsTest022
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newColorSensorJsTest022'
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error：' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.COLOR, callback, undefined);
                    try{
                    sensor.on(sensor.SensorId.COLOR, callback, { 'interval': undefined });
                    } catch(error){
                        console.info(TAG + 'Repeat subscription' + error);
                    }
                    setTimeout(() => {
                        console.info('----------------------newColorSensorJsTest022 off in--------------');
                        try {
                        sensor.off(sensor.SensorId.COLOR);
                        } catch (error) {
                            console.info(TAG + 'catch error：' + error);
                        expect(false).assertTrue();
                        }
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + 'Device does not support! ');
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0230
    * @tc.name: newColorSensorJsTest023
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newColorSensorJsTest023 '
        console.info('---------newColorSensorJsTest023--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error：'+ error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.COLOR, callback, null);
                    try{
                        sensor.on(sensor.SensorId.COLOR, callback, { 'interval': null });
                        } catch(error){
                            console.info(TAG + 'Repeat subscription'+error);
                        }
                    setTimeout(() => {
                        console.info('----------------------newColorSensorJsTest023 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.COLOR);
                            } catch (error) {
                                console.info(TAG + 'catch error：' + error);
                            expect(false).assertTrue();
                            }
                            done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + "Device does not support! ");
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0240
    * @tc.name: newColorSensorJsTest024
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newColorSensorJsTest024'
        console.info('---------newColorSensorJsTest024--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error：'+ error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.COLOR, callback, { 'interval': null });
                    setTimeout(() => {
                        console.info('----------------------newColorSensorJsTest024 off in--------------');
                        try {
                        sensor.off(sensor.SensorId.COLOR);
                        } catch (error) {
                            console.info(TAG + 'catch error：' + error);
                            expect(false).assertTrue();
                        }
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info(TAG + "Device does not support! ");
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0250
    * @tc.name: newColorSensorJsTest025
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newColorSensorJsTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newColorSensorJsTest025'
        try{
           sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error：'+ error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.COLOR, callback, { 'interval': 100000000 });
                    try{
                        sensor.on(sensor.SensorId.COLOR, callback, { 'interval': 100000000 });
                        } catch(error){
                            console.info(TAG + 'catch error：' + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------newColorSensorJsTest025 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.COLOR);
                            } catch (error) {
                        console.info(TAG + " catch error:" + error);
                            expect(false).assertTrue();
                            }
                        console.info('----------------------newColorSensorJsTest025 off end--------------');
                            done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + "Device does not support! ");
            done();
        }
    })
})}
