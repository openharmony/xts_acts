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

export default function SensorJsTest_sensor_62(){
describe("SensorJsTest_sensor_62", function () {
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
        expect(typeof(data.absorptionRatio)).assertEqual("number");
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
        expect(typeof(data.absorptionRatio)).assertEqual("number");
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
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0010
    * @tc.name: newSarSensorJsTest001
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 0
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newSarSensorJsTest001--------------');
        TAG = 'newSarSensorJsTest001'
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
                if (error) {
                    console.info(TAG +' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.SAR, callback);
                        setTimeout(()=>{
                            sensor.off(sensor.SensorId.SAR);
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
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0020
    * @tc.name: newSarSensorJsTest002
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newSarSensorJsTest002--------------');
        TAG = 'newSarSensorJsTest002'
        function onSensorCallback(data) {
            console.info(TAG + ' callback in');
            expect(false).assertTrue();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
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
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0030
    * @tc.name: newSarSensorJsTest003
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newSarSensorJsTest003--------------');
        TAG = 'newSarSensorJsTest003 '
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
                if (error) {
                    console.info(TAG +' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    try {
                        sensor.off(sensor.SensorId.SAR, 5);
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
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0040
    * @tc.name: newSarSensorJsTest004
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newSarSensorJsTest004--------------');
        TAG = 'newSarSensorJsTest004 '
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.SAR, callback, {'interval': 100000000});
                    setTimeout(()=>{
                        console.info('---------newSarSensorJsTest004 off in--------------');
                        sensor.off(sensor.SensorId.SAR);
                        console.info('---------newSarSensorJsTest004 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0050
    * @tc.name: newSarSensorJsTest005
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newSarSensorJsTest005--------------');
        TAG = 'newSarSensorJsTest005 '
        function onSensorCallback(data) {
            console.info(TAG + 'callback in,data:' + data);
            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                sensor.SensorAccuracy.ACCURACY_HIGH) {
                console.info('callback accuracy verified' + JSON.stringify(data));
                expect(true).assertTrue();
            } else {
                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                expect(false).assertTrue();
            }
            expect(typeof(data.absorptionRatio)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.SAR, onSensorCallback, {'interval': 100000000}, 5);
                    setTimeout(()=>{
                        console.info('---------newSarSensorJsTest005 off in--------------');
                        sensor.off(sensor.SensorId.SAR);
                        console.info('---------newSarSensorJsTest005 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0060
    * @tc.name: newSarSensorJsTest006
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newSarSensorJsTest006 '
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.once(sensor.SensorId.SAR, callback);
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
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0070
    * @tc.name: newSarSensorJsTest007
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newSarSensorJsTest007 '
        function onceSensorCallback(data) {
            console.info(TAG + 'callback in');
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
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
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0080
    * @tc.name: newSarSensorJsTest008
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newSarSensorJsTest008 '
        function onceSensorCallback(data) {
            console.info(TAG + 'callback in,data:' + data);
            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                sensor.SensorAccuracy.ACCURACY_HIGH) {
                console.info('callback accuracy verified' + JSON.stringify(data));
                expect(true).assertTrue();
            } else {
                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                expect(false).assertTrue();
            }
            expect(typeof(data.absorptionRatio)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.once(sensor.SensorId.SAR, onceSensorCallback, 5);
                }
            })
        } catch (error) {
            console.info(TAG + "error:" +error);
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0090
    * @tc.name: newSarSensorJsTest009
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newSarSensorJsTest009'
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
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
            console.info(TAG + "error:" +error);
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0100
    * @tc.name: newSarSensorJsTest010
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newSarSensorJsTest010 '
        function onSensorCallback(data) {
            console.info(TAG + 'callback in,data:' + data);
            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                sensor.SensorAccuracy.ACCURACY_HIGH) {
                console.info('callback accuracy verified' + JSON.stringify(data));
                expect(true).assertTrue();
            } else {
                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                expect(false).assertTrue();
            }
            expect(typeof(data.absorptionRatio)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:'+error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.SAR, onSensorCallback);
                    setTimeout(()=>{
                        sensor.off(sensor.SensorId.SAR, onSensorCallback);
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info("newSarSensorJsTest010 error:" +error);
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0110
    * @tc.name: newSarSensorJsTest011
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newSarSensorJsTest011'
        function onSensorCallback(data) {
            console.info(TAG + 'on error');
            expect(false).assertTrue();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
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
            console.info("newSarSensorJsTest010 error:" +error);
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0120
    * @tc.name: newSarSensorJsTest012
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newSarSensorJsTest012 '
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.SAR, (data)=>{
                        console.info(TAG + 'callback in,data:' + data);
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof(data.absorptionRatio)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    sensor.on(sensor.SensorId.SAR, (data)=>{
                        console.info(TAG + 'callback2 in,data:' + data);
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof(data.absorptionRatio)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    setTimeout(()=>{
                        console.info('---------newSarSensorJsTest012 off in--------------');
                        sensor.off(sensor.SensorId.SAR);
                        console.info('---------newSarSensorJsTest012 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0130
    * @tc.name: newSarSensorJsTest013
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        TAG = 'newSarSensorJsTest013 '
        console.info('---------newSarSensorJsTest013--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.SAR, callback, { 'interval': undefined });
                    sensor.on(sensor.SensorId.SAR, callback2, { 'interval': undefined });
                    setTimeout(() => {
                        console.info('----------------------newSarSensorJsTest013 off in--------------');
                        try {
                        sensor.off(sensor.SensorId.SAR, callback);
                        sensor.off(sensor.SensorId.SAR, callback2);
                        } catch (error) {
                        console.info("newSarSensorJsTest013 error:" + error);
                        expect(false).assertTrue();
                        }
                        console.info('----------------------newSarSensorJsTest013 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0140
    * @tc.name: newSarSensorJsTest014
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newSarSensorJsTest014 '
        console.info('---------newSarSensorJsTest014--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.SAR, (data)=>{
                        console.info(TAG + 'callback in,data:' + data);
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof(data.absorptionRatio)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    sensor.once(sensor.SensorId.SAR, (data)=>{
                        console.info(TAG + 'callback2 in,data:' + data);
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof(data.absorptionRatio)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    setTimeout(()=>{
                        console.info('---------newSarSensorJsTest014 off in--------------');
                        sensor.off(sensor.SensorId.SAR);
                        console.info('---------newSarSensorJsTest014 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0150
    * @tc.name: newSarSensorJsTest015
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newSarSensorJsTest015 '
        console.info('---------newSarSensorJsTest015--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.SAR, (data)=>{
                        console.info(TAG + 'callback in,data:' + data);
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof(data.absorptionRatio)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    sensor.on(sensor.SensorId.SAR, (data)=>{
                        console.info(TAG + 'callback2 in,data:' + data);
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof(data.absorptionRatio)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    setTimeout(()=>{
                        console.info('---------newSarSensorJsTest015 off in--------------');
                        sensor.off(sensor.SensorId.SAR);
                        console.info('---------newSarSensorJsTest015 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0160
    * @tc.name: newSarSensorJsTest016
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newSarSensorJsTest016 '
        console.info('---------newSarSensorJsTest016--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error：'+ error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.SAR, callback, { 'interval': 100000000 });
                    try{
                        sensor.on(sensor.SensorId.SAR, callback, { 'interval': 100000000 });
                        } catch(error){
                            console.info(TAG + 'catch error：' + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------newSarSensorJsTest016 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.SAR);
                            } catch (error) {
                        console.info(TAG + " catch error:" + error);
                            expect(false).assertTrue();
                            }
                        console.info('----------------------newSarSensorJsTest016 off end--------------');
                            done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + "Device does not support! ");
            done();
        }
    })

    /*
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0170
    * @tc.name: newSarSensorJsTest017
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newSarSensorJsTest017'
        console.info('----------------------newSarSensorJsTest017--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
                if (error) {
                    console.info(TAG + "error:" + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.SAR, callback);
                    sensor.on(sensor.SensorId.SAR, callback2);
                    setTimeout(() => {
                        console.info('----------------------newSarSensorJsTest017 off in--------------');
                        try {
                        sensor.off(sensor.SensorId.SAR, callback);
                        } catch (error) {
                            console.info(TAG + "catch error:" +error);
                        }
                        console.info('----------------------newSarSensorJsTest017 off end--------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------newSarSensorJsTest017 off in--------------');
                        sensor.off(sensor.SensorId.SAR, callback2);
                        console.info('----------------------newSarSensorJsTest017 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0180
    * @tc.name: newSarSensorJsTest018
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newSarSensorJsTest018'
        console.info('----------------------newSarSensorJsTest018--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
                if (error) {
                    console.info(TAG + "error:" + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.SAR, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorId.SAR, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------newSarSensorJsTest018 off in--------------');
                        try {
                        sensor.off(sensor.SensorId.SAR, callback);
                        } catch (error) {
                            console.info(TAG + "catch error:" + error);
                        }
                        console.info('----------------------newSarSensorJsTest018 off end--------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------newSarSensorJsTest018_2 off in--------------');
                        sensor.off(sensor.SensorId.SAR, callback2);
                        console.info('----------------------newSarSensorJsTest018_2 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0190
    * @tc.name: newSarSensorJsTest019
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newSarSensorJsTest019 '
        console.info('----------------------newSarSensorJsTest019--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error：'+ error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    console.info('----------------------newSarSensorJsTest019 off in--------------');
                    try{
                        sensor.off(-1, callback);
                        console.info('----------------------newSarSensorJsTest019 off end--------------');
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
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0200
    * @tc.name: newSarSensorJsTest020
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newSarSensorJsTest020'
        console.info('----------------------newSarSensorJsTest020--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error：'+ error);
                    done();
                } else {
                    try {
                        sensor.on(sensor.SensorId.SAR, callback, {'interval': -100000000});
                        console.info('----------------------newSarSensorJsTest020 off in---------------------------');
                        sensor.off(sensor.SensorId.SAR);
                        console.info('----------------------newSarSensorJsTest020 off end---------------------------');
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
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0210
    * @tc.name: newSarSensorJsTest021
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        TAG = 'newSarSensorJsTest021 '
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error：'+ error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.SAR, callback, undefined);
                    try{
                    sensor.on(sensor.SensorId.SAR, callback, { 'interval': undefined });
                    } catch(error){
                        console.info(TAG + 'Repeat subscription' + error);
                    }
                    setTimeout(() => {
                        console.info('----------------------newSarSensorJsTest021 off in--------------');
                        try {
                        sensor.off(sensor.SensorId.SAR);
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
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0220
    * @tc.name: newSarSensorJsTest022
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newSarSensorJsTest022'
        console.info('---------newSarSensorJsTest022--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error：'+ error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.SAR, callback, { 'interval': null });
                    setTimeout(() => {
                        console.info('----------------------newSarSensorJsTest022 off in--------------');
                        try {
                        sensor.off(sensor.SensorId.SAR);
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
    * @tc.number:SUB_SensorsSystem_NEWSAR_JsTest_0230
    * @tc.name: newSarSensorJsTest023
    * @tc.desc: Functional Use Cases
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("newSarSensorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newSarSensorJsTest023 '
        console.info('---------newSarSensorJsTest023--------------');
        try{
           sensor.getSingleSensor(sensor.SensorId.SAR,(error, data) => {
                if (error) {
                    console.info(TAG + 'error：'+ error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorId.SAR, callback, null);
                    try{
                        sensor.on(sensor.SensorId.SAR, callback, { 'interval': null });
                        } catch(error){
                            console.info(TAG + 'Repeat subscription'+error);
                        }
                    setTimeout(() => {
                        console.info('----------------------newSarSensorJsTest023 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.SAR);
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
})}
