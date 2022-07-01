/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

describe("SensorJsTest_sensor_36", function () {
    beforeAll(function () {

        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll caled')
    })

    afterAll(function () {

        /*
         * @tc.teardown: teardown invoked after all testcases
         */
        console.info('afterAll caled')
    })

    beforeEach(function () {

        /*
         * @tc.setup: setup invoked before each testcases
         */
        console.info('beforeEach caled')
    })

    afterEach(function () {

        /*
         * @tc.teardown: teardown invoked after each testcases
         */
        console.info('afterEach caled')
    })

    let errMessage;

    let invild;

    let testNullSensorId = -1;
	
	let errMessages = ['Wrong argument type, get number fail', 'The number of parameters is not valid',
    'xxx is not defined','[object Object]'];

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0010
    * @tc.name: GetSingleSensor_JSTest_001
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    */
    it('GetSingleSensor_JSTest_0010', FUNCTION|MEDIUMTEST|LEVEL0, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_001-------------------------");
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER,
                    (error, data) => {
                        if (error) {
                            console.info('GetSingleSensor_JSTest_001 failed');
                            expect(false).assertTrue();
                            setTimeout((err) => {
                                reject(err)
                            }, 500)
                        } else {
                            console.info("GetSingleSensor_JSTest_001 " + JSON.stringify(data));
                            expect(typeof (data.sensorName)).assertEqual("string");
                            expect(typeof (data.vendorName)).assertEqual("string");
                            expect(typeof (data.firmwareVersion)).assertEqual("string");
                            expect(typeof (data.hardwareVersion)).assertEqual("string");
                            expect(typeof (data.sensorTypeId)).assertEqual("number");
                            expect(typeof (data.maxRange)).assertEqual("number");
                            expect(typeof (data.precision)).assertEqual("number");
                            expect(typeof (data.power)).assertEqual("number");
                            setTimeout(() => {
                                done();
                            }, 500)
                        }
                    })
    })


    /**
     * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0020
     * @tc.name: GetSingleSensor_JSTest_002
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
     it('GetSingleSensor_JSTest_002', FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_002-------------------------");
        try {
            sensor.getSingleSensor()
        } catch (error) {
            errMessage = error.toString().slice(25, 62);
            console.info('GetSingleSensor_JSTest_002 error:' + error);
            console.info('GetSingleSensor_JSTest_002 errMessage:' + errMessage);
            expect(errMessage).assertEqual(errMessages[1]);
            done();
        }
    })

    /**
     * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0030
     * @tc.name: GetSingleSensor_JSTest_003
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
     it('GetSingleSensor_JSTest_003', FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_003-------------------------");
        try {
            sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER,
                (error, data) => {
                    if (error) {
                        console.info('GetSingleSensor_JSTest_003 failed');
                        expect(false).assertTrue();
                        setTimeout((err) => {
                            reject(err)
                        }, 500)
                    } else {
                        console.info("GetSingleSensor_JSTest_003 " + JSON.stringify(data));
                        setTimeout(() => {
                            done();
                        }, 500)
                    }
                },255)
        } catch (error) {
            errMessage = error.toString().slice(25, 62);
            console.info('GetSingleSensor_JSTest_003 error:' + error);
            expect(errMessage).assertEqual(errMessages[1]);
            done();
        }
    })

     /**
     * @tc.number: SUB_SensorsSystem_GetSingleSensor_JSTest_0040
     * @tc.name: GetSingleSensor_JSTest_004
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
      it('GetSingleSensor_JSTest_004', FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_004-------------------------");
        try {
            sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER,
                (error, data) => {
                    if (error) {
                        console.info('GetSingleSensor_JSTest_004 failed');
                        expect(false).assertTrue();
                        setTimeout((err) => {
                            reject(err)
                        }, 500)
                    } else {
                        console.info("GetSingleSensor_JSTest_004 " + JSON.stringify(data));
                        setTimeout(() => {
                            done();
                        }, 500)
                    }
                },invild)
        } catch (error) {
            errMessage = error.toString().slice(25,62);
            console.info('GetSingleSensor_JSTest_004 error:' + error);
            expect(errMessage).assertEqual(errMessages[1]);
            done();
        }
    })

     /**
     * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0050
     * @tc.name: GetSingleSensor_JSTest_005
	 * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
      it('GetSingleSensor_JSTest_005', FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_005-------------------------");
        try {
            sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER,
                (error, data) => {
                    if (error) {
                        console.info('GetSingleSensor_JSTest_005 failed');
                        expect(false).assertTrue();
                        setTimeout((err) => {
                            reject(err)
                        }, 500)
                    } else {
                        console.info("GetSingleSensor_JSTest_005 " + JSON.stringify(data));
                        setTimeout(() => {
                            done();
                        }, 500)
                    }
                },testNullSensorId)
        } catch (error) {
            errMessage = error.toString().slice(25,62);
            console.info('GetSingleSensor_JSTest_005 error:' + error);
            expect(errMessage).assertEqual(errMessages[1]);
            done();
        }
    })

     /**
     * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0060
     * @tc.name: GetSingleSensor_JSTest_006
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
     it('GetSingleSensor_JSTest_006', FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_006-------------------------");
        try {
            sensor.getSingleSensor(xxx)
        } catch (error) {
            errMessage = error.toString().slice(16, 35);
            console.info('GetSingleSensor_JSTest_006 error:' + error);
            expect(errMessage).assertEqual(errMessages[2]);
            done();
        }
    })

    /**
     * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0070
     * @tc.name: GetSingleSensor_JSTest_007
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
     it('GetSingleSensor_JSTest_007', FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_007-------------------------");
        try {
            sensor.getSingleSensor(
                (error, data) => {
                    if (error) {
                        console.info('GetSingleSensor_JSTest_007 failed');
                        expect(false).assertTrue();
                        setTimeout((err) => {
                            reject(err)
                        }, 500)
                    } else {
                        console.info("GetSingleSensor_JSTest_007 " + JSON.stringify(data));
                        expect(typeof (data.sensorName)).assertEqual("string");
                        expect(typeof (data.vendorName)).assertEqual("string");
                        expect(typeof (data.firmwareVersion)).assertEqual("string");
                        expect(typeof (data.hardwareVersion)).assertEqual("string");
                        expect(typeof (data.sensorTypeId)).assertEqual("number");
                        expect(typeof (data.maxRange)).assertEqual("number");
                        expect(typeof (data.precision)).assertEqual("number");
                        expect(typeof (data.power)).assertEqual("number");
                        setTimeout(() => {
                            done();
                        }, 500)
                    }
                })
        } catch (error) {
            errMessage = error.toString().slice(25,61);
            console.info('GetSingleSensor_JSTest_007 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

	/**
     * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0080
     * @tc.name: GetSingleSensor_JSTest_008
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
it("GetSingleSensor_JSTest_008", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
    console.info("------------------------GetSingleSensor_JSTest_008------------------");
    sensor.getSingleSensor(testNullSensorId, (error, data) => {
        if (error) {
            console.info('GetSingleSensor_JSTest_008 error' + error);
            expect(true).assertTrue();
            done()
        } else {
            console.info("GetSingleSensor_JSTest_008 " + JSON.stringify(data));
            expect(false).assertTrue();
        }
    });
})

	/**
     * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0090
     * @tc.name: GetSingleSensor_JSTest_009
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
it("GetSingleSensor_JSTest_009", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
    console.info("-------------------GetSingleSensor_JSTest_009----------------------");
    sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER).then((data) => {
        console.info("GetSingleSensor_JSTest_009 success " + JSON.stringify(data));
        expect(typeof (data.sensorName)).assertEqual("string");
        expect(typeof (data.vendorName)).assertEqual("string");
        expect(typeof (data.firmwareVersion)).assertEqual("string");
        expect(typeof (data.hardwareVersion)).assertEqual("string");
        expect(typeof (data.sensorTypeId)).assertEqual("number");
        expect(typeof (data.maxRange)).assertEqual("number");
        expect(typeof (data.precision)).assertEqual("number");
        expect(typeof (data.power)).assertEqual("number");
        done()
    }, (error)=>{
        console.info('GetSingleSensor_JSTest_009 failed');
        expect(false).assertTrue();
    });
})

	/**
     * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0100
     * @tc.name: GetSingleSensor_JSTest_010
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
it("GetSingleSensor_JSTest_010", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
    console.info("----------------GetSingleSensor_JSTest_010-----------------------");
    sensor.getSingleSensor(testNullSensorId).then((data) => {
        console.info("GetSingleSensor_JSTest_010 success" + JSON.stringify(data));
        expect(false).assertTrue();
        done()
    }, (error)=>{
        errMessage = error.toString();
        console.info('GetSingleSensor_JSTest_010 error:' + error);
        expect(errMessage).assertEqual(errMessages[3]);
        done();
    });
})

	/**
     * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0110
     * @tc.name: GetSingleSensor_JSTest_011
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
 it("GetSingleSensor_JSTest_011", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
    console.info("-------------------GetSingleSensor_JSTest_011----------------------");
    sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER).then((data) => {
        console.info("GetSingleSensor_JSTest_011 success " + JSON.stringify(data));
        expect(typeof (data.sensorName)).assertEqual("string");
        expect(typeof (data.vendorName)).assertEqual("string");
        expect(typeof (data.firmwareVersion)).assertEqual("string");
        expect(typeof (data.hardwareVersion)).assertEqual("string");
        expect(typeof (data.sensorTypeId)).assertEqual("number");
        expect(typeof (data.maxRange)).assertEqual("number");
        expect(typeof (data.precision)).assertEqual("number");
        expect(typeof (data.power)).assertEqual("number");
        done()
    }, (error)=>{
        console.info('GetSingleSensor_JSTest_011 failed');
        expect(false).assertTrue();
    });
})

	/**
     * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0120
     * @tc.name: GetSingleSensor_JSTest_012
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
 it("GetSingleSensor_JSTest_012", FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
    console.info("-------------------GetSingleSensor_JSTest_012----------------------");
    sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER).then((data) => {
        console.info("GetSingleSensor_JSTest_012 success " + JSON.stringify(data));
        expect(typeof (data.sensorName)).assertEqual("string");
        expect(typeof (data.vendorName)).assertEqual("string");
        expect(typeof (data.firmwareVersion)).assertEqual("string");
        expect(typeof (data.hardwareVersion)).assertEqual("string");
        expect(typeof (data.sensorTypeId)).assertEqual("number");
        expect(typeof (data.maxRange)).assertEqual("number");
        expect(typeof (data.precision)).assertEqual("number");
        expect(typeof (data.power)).assertEqual("number");
        done()
    }, (error)=>{
        console.info('GetSingleSensor_JSTest_012 failed');
        expect(false).assertTrue();
    });
})

	/**
     * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0130
     * @tc.name: GetSingleSensor_JSTest_013
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
 it('GetSingleSensor_JSTest_013', FUNCTION|MEDIUMTEST|LEVEL3, async function (done) {
    console.info("------------------GetSingleSensor_JSTest_013-------------------------");
    try {
        sensor.getSingleSensor(null)
    } catch (error) {
        errMessage = error.toString().slice(25,61);
        console.info('GetSingleSensor_JSTest_013 error:' + error);
        expect(errMessage).assertEqual(errMessages[0]);
        done();
    }
})
})
