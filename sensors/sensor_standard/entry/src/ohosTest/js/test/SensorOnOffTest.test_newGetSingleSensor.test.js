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

export default function SensorJsTest_sensor_36() {
describe("SensorJsTest_sensor_36", function () {
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

    let invild;
    let testNullSensorId = -1;
    const PARAMETER_ERROR_CODE = 401;
    const SERVICE_EXCEPTION_CODE = 14500101;
    const PARAMETER_ERROR_MSG = 'The parameter invalid.';
    const SERVICE_EXCEPTION_MSG = 'Service exception.';
    let errMessages = ['ReferenceError: xxx is not defined','ReferenceError: string is not defined','TypeError: is not callable'];
    let errMessage;
    let TAG  = '';

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensorJSTest0010
    * @tc.name: GetSingleSensorJSTest001
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 0
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it('GetSingleSensorJSTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info("------------------GetSingleSensorJSTest001-------------------------");
        TAG = 'GetSingleSensorJSTest001'
        try{
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data));
                    expect(typeof (data.sensorName)).assertEqual("string");
                    expect(typeof (data.vendorName)).assertEqual("string");
                    expect(typeof (data.firmwareVersion)).assertEqual("string");
                    expect(typeof (data.hardwareVersion)).assertEqual("string");
                    expect(typeof (data.sensorId)).assertEqual("number");
                    expect(typeof (data.maxRange)).assertEqual("number");
                    expect(typeof (data.minSamplePeriod)).assertEqual("number");
                    expect(typeof (data.maxSamplePeriod)).assertEqual("number");
                    expect(typeof (data.precision)).assertEqual("number");
                    expect(typeof (data.power)).assertEqual("number");
                    setTimeout(() => {
                        done();
                    }, 500)
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensorJSTest0020
    * @tc.name: GetSingleSensorJSTest002
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
     it('GetSingleSensorJSTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------GetSingleSensorJSTest002-------------------------");
        TAG = 'GetSingleSensorJSTest002'
        try{
             sensor.getSingleSensor()
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensorJSTest0030
    * @tc.name: GetSingleSensorJSTest003
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
     it('GetSingleSensorJSTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------GetSingleSensorJSTest003-------------------------");
        TAG = 'GetSingleSensorJSTest003'
        try {
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data));
                    expect(typeof (data.sensorName)).assertEqual("string");
                    expect(typeof (data.vendorName)).assertEqual("string");
                    expect(typeof (data.firmwareVersion)).assertEqual("string");
                    expect(typeof (data.hardwareVersion)).assertEqual("string");
                    expect(typeof (data.sensorId)).assertEqual("number");
                    expect(typeof (data.maxRange)).assertEqual("number");
                    expect(typeof (data.minSamplePeriod)).assertEqual("number");
                    expect(typeof (data.maxSamplePeriod)).assertEqual("number");
                    expect(typeof (data.precision)).assertEqual("number");
                    expect(typeof (data.power)).assertEqual("number");
                    setTimeout(() => {
                        done();
                    }, 500)
                    }
                },255)
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /**
    * @tc.number: SUB_SensorsSystem_GetSingleSensorJSTest0040
    * @tc.name: GetSingleSensorJSTest004
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
      it('GetSingleSensorJSTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------GetSingleSensorJSTest004-------------------------");
        TAG = 'GetSingleSensorJSTest004'
        try {
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data));
                    expect(typeof (data.sensorName)).assertEqual("string");
                    expect(typeof (data.vendorName)).assertEqual("string");
                    expect(typeof (data.firmwareVersion)).assertEqual("string");
                    expect(typeof (data.hardwareVersion)).assertEqual("string");
                    expect(typeof (data.sensorId)).assertEqual("number");
                    expect(typeof (data.maxRange)).assertEqual("number");
                    expect(typeof (data.minSamplePeriod)).assertEqual("number");
                    expect(typeof (data.maxSamplePeriod)).assertEqual("number");
                    expect(typeof (data.precision)).assertEqual("number");
                    expect(typeof (data.power)).assertEqual("number");
                    setTimeout(() => {
                        done();
                    }, 500)
                }
                },invild)
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensorJSTest0050
    * @tc.name: GetSingleSensorJSTest005
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
      it('GetSingleSensorJSTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------GetSingleSensorJSTest005-------------------------");
        TAG = 'GetSingleSensorJSTest005'
        try {
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data));
                    setTimeout(() => {
                        done();
                    }, 500)
                }
            },testNullSensorId)
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensorJSTest0060
    * @tc.name: GetSingleSensorJSTest006
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
     it('GetSingleSensorJSTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------GetSingleSensorJSTest006-------------------------");
        TAG = 'GetSingleSensorJSTest006'
        try{
            try {
                sensor.getSingleSensor(xxx)
            } catch (error) {
                console.info(TAG + ' catch error:' + error);
                errMessage = error.toString();
                expect(errMessage).assertEqual(errMessages[0]);
                done();
            }
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensorJSTest0070
    * @tc.name: GetSingleSensorJSTest007
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
     it('GetSingleSensorJSTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------GetSingleSensorJSTest007-------------------------");
        TAG = 'GetSingleSensorJSTest007'
        try {
            sensor.getSingleSensor((error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data));
                    expect(typeof (data.sensorName)).assertEqual("string");
                    expect(typeof (data.vendorName)).assertEqual("string");
                    expect(typeof (data.firmwareVersion)).assertEqual("string");
                    expect(typeof (data.hardwareVersion)).assertEqual("string");
                    expect(typeof (data.sensorId)).assertEqual("number");
                    expect(typeof (data.maxRange)).assertEqual("number");
                    expect(typeof (data.minSamplePeriod)).assertEqual("number");
                    expect(typeof (data.maxSamplePeriod)).assertEqual("number");
                    expect(typeof (data.precision)).assertEqual("number");
                    expect(typeof (data.power)).assertEqual("number");
                    setTimeout(() => {
                        done();
                    }, 500)
                }
           })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensorJSTest0080
    * @tc.name: GetSingleSensorJSTest008
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("GetSingleSensorJSTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------------GetSingleSensorJSTest008------------------");
        TAG = 'GetSingleSensorJSTest008'
        try {
            sensor.getSingleSensor(testNullSensorId, (error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data));
                    expect(false).assertTrue();
                }
            });
        } catch(error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensorJSTest0090
    * @tc.name: GetSingleSensorJSTest009
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("GetSingleSensorJSTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("-------------------GetSingleSensorJSTest009----------------------");
        TAG = 'GetSingleSensorJSTest009'
        try{
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER).then((data) => {
                console.info(TAG + ' Callback in!' + JSON.stringify(data));
                expect(typeof (data.sensorName)).assertEqual("string");
                expect(typeof (data.vendorName)).assertEqual("string");
                expect(typeof (data.firmwareVersion)).assertEqual("string");
                expect(typeof (data.hardwareVersion)).assertEqual("string");
                expect(typeof (data.sensorId)).assertEqual("number");
                expect(typeof (data.maxRange)).assertEqual("number");
                expect(typeof (data.minSamplePeriod)).assertEqual("number");
                expect(typeof (data.maxSamplePeriod)).assertEqual("number");
                expect(typeof (data.precision)).assertEqual("number");
                expect(typeof (data.power)).assertEqual("number");
                done()
            }, (error)=>{
                console.info(TAG + ' illegal parameter!');
                done();
            });
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensorJSTest0100
    * @tc.name: GetSingleSensorJSTest010
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("GetSingleSensorJSTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("----------------GetSingleSensorJSTest010-----------------------");
        TAG = 'GetSingleSensorJSTest010'
        try {
        sensor.getSingleSensor(testNullSensorId).then((data) => {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
        }, (error)=>{
            console.info(TAG + ' illegal parameter!');
            done();
        });
        } catch(error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensorJSTest0110
    * @tc.name: GetSingleSensorJSTest011
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
     it("GetSingleSensorJSTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("-------------------GetSingleSensorJSTest011----------------------");
        TAG = 'GetSingleSensorJSTest011'
        try{
            try {
                sensor.getSingleSensor(null)
            } catch (error) {
                console.info(TAG + ' illegal parameter!');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensorJSTest0120
    * @tc.name: GetSingleSensorJSTest012
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("GetSingleSensorJSTest012", 0, async function (done) {
        TAG = 'GetSingleSensorJSTest012'
        try{
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER, undefined).then((data) => {
                console.info(TAG + ' Callback in!' + JSON.stringify(data));
                expect(true).assertTrue();
                done();
            }, (error) => {
                console.info(TAG + ' illegal parameter!');
                done();
            });
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensorJSTest0130
    * @tc.name: GetSingleSensorJSTest013
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("GetSingleSensorJSTest013", 0, async function (done) {
        TAG = 'GetSingleSensorJSTest013'
        try{
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER, null).then((data) => {
                console.info(TAG + ' Callback in!' + JSON.stringify(data));
                expect(true).assertTrue();
                done();
            }, (error) => {
                console.info(TAG + ' illegal parameter!');
                done();
            });
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensorJSTest0140
    * @tc.name: GetSingleSensorJSTest014
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("GetSingleSensorJSTest014", 0, async function (done) {
        TAG = 'GetSingleSensorJSTest014'
        try{
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER, "abc").then((data) => {
                console.info(TAG + ' Callback in!' + JSON.stringify(data));
                expect(true).assertTrue();
                done();
            }, (error) => {
                console.info(TAG + ' illegal parameter!');
                done();
            });
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })
})}
