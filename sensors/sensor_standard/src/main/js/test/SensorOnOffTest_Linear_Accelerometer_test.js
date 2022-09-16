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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_37() {
describe("SensorJsTest_sensor_37", function () {
    function callback(data) {
        console.info("callback" + JSON.stringify(data));
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
		expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        console.info("callback2" + JSON.stringify(data));
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
		expect(typeof (data.timestamp)).assertEqual("number");
    }

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

    let errMessages = ['The number of parameters is not valid', 'Should subscribe first',
    'string is not defined'];

    let errMessage;

     /*
     * @tc.number:SUB_SensorsSystem_Linear_Accelerometer_JSTest_0010
     * @tc.name: SensorLinearAccelerometerJSTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SensorLinearAccelerometerJSTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('-----------SensorLinearAccelerometerJSTest001----------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, callback);
        setTimeout(() => {
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER);
            done();
        }, 500);
    })

    /*
     * @tc.number: SUB_SensorsSystem_Linear_Accelerometer_JSTest_0020
     * @tc.name: SensorLinearAccelerometerJSTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SensorLinearAccelerometerJSTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('-----------SensorLinearAccelerometerJSTest002----------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, callback, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('-----------SensorLinearAccelerometerJSTest002 off in----------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER);
            console.info('-----------SensorLinearAccelerometerJSTest002 off end----------------');
            done();
        }, 500);
    })

    /*
     * @tc.number: SUB_SensorsSystem_Linear_Accelerometer_JSTest_0030
     * @tc.name: SensorLinearAccelerometerJSTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SensorLinearAccelerometerJSTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('-----------SensorLinearAccelerometerJSTest003----------------');
        function onSensorCallback(data) {
            console.info('SensorLinearAccelerometerJSTest003  on error');
            expect(false).assertTrue();
            done();
        }
        try {
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, 
			onSensorCallback, { 'interval': 100000000 }, 5);
        } catch (error) {
            console.info("SensorLinearAccelerometerJSTest003 error:" + error);
            errMessage = error.toString().slice(12, 49);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Linear_Accelerometer_JSTest_0040
     * @tc.name: SensorLinearAccelerometerJSTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SensorLinearAccelerometerJSTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('-----------SensorLinearAccelerometerJSTest004----------------');
        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, callback);
        setTimeout(() => {
            expect(true).assertTrue();
            done();
        }, 500);
    })

    /*
     * @tc.number: SUB_SensorsSystem_Linear_Accelerometer_JSTest_0050
     * @tc.name: SensorLinearAccelerometerJSTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SensorLinearAccelerometerJSTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('-----------SensorLinearAccelerometerJSTest005----------------');
        function onceSensorCallback(data) {
            console.info('SensorLinearAccelerometerJSTest005  on error');
            expect(false).assertTrue();
            done();
        }
        try {
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, onceSensorCallback, 5);
        } catch (error) {
            console.info("SensorLinearAccelerometerJSTest005 error:" + error);
            errMessage = error.toString().slice(14, 51);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

   /*
     * @tc.number: SUB_SensorsSystem_Linear_Accelerometer_JSTest_0060
     * @tc.name: SensorLinearAccelerometerJSTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SensorLinearAccelerometerJSTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('-----------SensorLinearAccelerometerJSTest006----------------');
        try {
            sensor.off(string, "");
        } catch (error) {
            console.info("SensorLinearAccelerometerJSTest006 error:" + error);
            errMessage = error.toString().slice(16, 40);
            expect(errMessage).assertEqual(errMessages[2]);
            done();
        }
    })

   /*
     * @tc.number: SUB_SensorsSystem_Linear_Accelerometer_JSTest_0070
     * @tc.name: SensorLinearAccelerometerJSTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SensorLinearAccelerometerJSTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('-----------SensorLinearAccelerometerJSTest007----------------');
        function onSensorCallback(data) {
            console.info('SensorLinearAccelerometerJSTest007  on error');
            expect(false).assertTrue();
            done();
        }
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, onSensorCallback);
        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, onSensorCallback);
        setTimeout(() => {
            expect(true).assertTrue();
            done();
        }, 500);
    })

    /*
     * @tc.number: SUB_SensorsSystem_Linear_Accelerometer_JSTest_0080
     * @tc.name: SensorLinearAccelerometerJSTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SensorLinearAccelerometerJSTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('-----------SensorLinearAccelerometerJSTest008----------------');
        function onSensorCallback(data) {
            console.info('SensorLinearAccelerometerJSTest008  on error');
            expect(false).assertTrue();
            done();
        }
        try {
            sensor.off(1000000, onSensorCallback);
        } catch (error) {
            console.info("SensorLinearAccelerometerJSTest008 error:" + error);
            errMessage = error.toString().slice(13, 35);
            expect(errMessage).assertEqual(errMessages[1]);
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Linear_Accelerometer_JSTest_0090
     * @tc.name: SensorLinearAccelerometerJSTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SensorLinearAccelerometerJSTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('-----------SensorLinearAccelerometerJSTest009----------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, callback);
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, callback2);
        setTimeout(() => {
            console.info('-----------SensorLinearAccelerometerJSTest009 off in----------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER);
            console.info('-----------SensorLinearAccelerometerJSTest009 off end----------------');
            done();
        }, 1000);
    })

    /*
     * @tc.number: SUB_SensorsSystem_Linear_Accelerometer_JSTest_0100
     * @tc.name: SensorLinearAccelerometerJSTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SensorLinearAccelerometerJSTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('-----------SensorLinearAccelerometerJSTest010----------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, callback);
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, callback2);
        setTimeout(() => {
            console.info('-----------SensorLinearAccelerometerJSTest010 off in----------------');
            try {
			sensor.off(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, callback);
			} catch (error) {
            console.info("SensorLinearAccelerometerJSTest010 error:" + error);
			}
            console.info('-----------SensorLinearAccelerometerJSTest010 off end----------------');
        }, 500);
        setTimeout(() => {
            console.info('-----------SensorLinearAccelerometerJSTest010 off in----------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, callback2);
            console.info('-----------SensorLinearAccelerometerJSTest010 off end----------------');
            done();
        }, 1000);
    })

    /*
     * @tc.number: SUB_SensorsSystem_Linear_Accelerometer_JSTest_0110
     * @tc.name: SensorLinearAccelerometerJSTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SensorLinearAccelerometerJSTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('-----------SensorLinearAccelerometerJSTest011----------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, callback, { 'interval': 100000000 });
        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, callback2);
        setTimeout(() => {
            console.info('-----------SensorLinearAccelerometerJSTest011 off in----------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER);
            console.info('-----------SensorLinearAccelerometerJSTest011 off end----------------');
            done();
        }, 1000);
    })

    /*
     * @tc.number: SUB_SensorsSystem_Linear_Accelerometer_JSTest_0120
     * @tc.name: SensorLinearAccelerometerJSTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SensorLinearAccelerometerJSTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('-----------SensorLinearAccelerometerJSTest012----------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, callback, { 'interval': 100000000 });
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, callback2, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('-----------SensorLinearAccelerometerJSTest012 off in----------------');
            try {
			sensor.off(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, callback);
			} catch (error) {
            console.info("SensorLinearAccelerometerJSTest012 error:" + error);
			}
            console.info('-----------SensorLinearAccelerometerJSTest012 off end----------------');
        }, 500);
        setTimeout(() => {
            console.info('-----------SensorLinearAccelerometerJSTest012 off in----------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, callback2);
            console.info('-----------SensorLinearAccelerometerJSTest012 off end----------------');
            done();
        }, 1000);
    })

    /*
     * @tc.number: SUB_SensorsSystem_Linear_Accelerometer_JSTest_0130
     * @tc.name: SensorLinearAccelerometerJSTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SensorLinearAccelerometerJSTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('-----------SensorLinearAccelerometerJSTest013----------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, callback, { 'interval': 100000000 });
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER, callback2, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('-----------SensorLinearAccelerometerJSTest013 off in----------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELEROMETER);
            console.info('-----------SensorLinearAccelerometerJSTest013 off end----------------');
            done();
        }, 1000);
    })
})}
