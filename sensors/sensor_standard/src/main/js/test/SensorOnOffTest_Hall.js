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

export default function SensorJsTest_sensor_7() {
describe("SensorJsTest_sensor_7", function () {
    function callback(data) {
        console.info("callback" + JSON.stringify(data));
        expect(typeof (data.status)).assertEqual("number");
		expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        console.info("callback2" + JSON.stringify(data));
        expect(typeof (data.status)).assertEqual("number");
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
     * @tc.number:SUB_SensorsSystem_Hall_JSTest_0010
     * @tc.name: Hall_SensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("Hall_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------Hall_SensorJsTest001---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback);
        setTimeout(() => {
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL);
            done();
        }, 500);
    })

     /*
     * @tc.number:SUB_SensorsSystem_Hall_JSTest_0020
     * @tc.name: Hall_SensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("Hall_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Hall_SensorJsTest002---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('----------------------Hall_SensorJsTest002 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL);
            console.info('----------------------Hall_SensorJsTest002 off end---------------------------');
            done();
        }, 500);
    })

     /*
     * @tc.number:SUB_SensorsSystem_Hall_JSTest_0030
     * @tc.name: Hall_SensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("Hall_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Hall_SensorJsTest003---------------------------');
        function onSensorCallback(data) {
            console.info('Hall_SensorJsTest003  on error');
            expect(false).assertTrue();
            done();
        }
        try {
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, onSensorCallback, { 'interval': 100000000 }, 5);
        } catch (error) {
            console.info("Hall_SensorJsTest003 error:" + error);
            errMessage = error.toString().slice(12, 49);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

     /*
     * @tc.number:SUB_SensorsSystem_Hall_JSTest_0040
     * @tc.name: Hall_SensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("Hall_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback);
        setTimeout(() => {
            expect(true).assertTrue();
            done();
        }, 500);
    })

     /*
     * @tc.number:SUB_SensorsSystem_Hall_JSTest_0050
     * @tc.name: Hall_SensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("Hall_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onceSensorCallback(data) {
            console.info('Hall_SensorJsTest005  on error');
            expect(false).assertTrue();
            done();
        }
        try {
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_HALL, onceSensorCallback, 5);
        } catch (error) {
            console.info("Hall_SensorJsTest005 error:" + error);
            errMessage = error.toString().slice(14, 51);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

     /*
     * @tc.number:SUB_SensorsSystem_Hall_JSTest_0060
     * @tc.name: Hall_SensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("Hall_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            sensor.off(string, "");
        } catch (error) {
            console.info("Hall_SensorJsTest006 error:" + error);
            errMessage = error.toString().slice(16, 40);
            expect(errMessage).assertEqual(errMessages[2]);
            done();
        }
    })

     /*
     * @tc.number:SUB_SensorsSystem_Hall_JSTest_0070
     * @tc.name: Hall_SensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("Hall_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onSensorCallback(data) {
            console.info('Hall_SensorJsTest007  on error');
            expect(false).assertTrue();
            done();
        }
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, onSensorCallback);
        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL, onSensorCallback);
        setTimeout(() => {
            expect(true).assertTrue();
            done();
        }, 500);
    })

     /*
     * @tc.number:SUB_SensorsSystem_Hall_JSTest_0080
     * @tc.name: Hall_SensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("Hall_SensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onSensorCallback(data) {
            console.info('Hall_SensorJsTest008  on error');
            expect(false).assertTrue();
            done();
        }
        try {
            sensor.off(1000000, onSensorCallback);
        } catch (error) {
            console.info("Hall_SensorJsTest008 error:" + error);
            errMessage = error.toString().slice(13, 35);
            expect(errMessage).assertEqual(errMessages[1]);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Hall_JSTest_0090
     * @tc.name: Hall_SensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("Hall_SensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback);
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback2);
        setTimeout(() => {
            console.info('----------------------Hall_SensorJsTest009 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL);
            console.info('----------------------Hall_SensorJsTest009 off end---------------------------');
            done();
        }, 1000);
    })

     /*
     * @tc.number:SUB_SensorsSystem_Hall_JSTest_0100
     * @tc.name: Hall_SensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("Hall_SensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback);
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback2);
        setTimeout(() => {
            console.info('----------------------Hall_SensorJsTest010 off in---------------------------');
            try {
			sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback);
			} catch (error) {
            console.info("Hall_SensorJsTest010 error:" + error);
			}
            console.info('----------------------Hall_SensorJsTest010 off end---------------------------');
        }, 500);
        setTimeout(() => {
            console.info('----------------------Hall_SensorJsTest010 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback2);
            console.info('----------------------Hall_SensorJsTest010 off end---------------------------');
            done();
        }, 1000);
    })

     /*
     * @tc.number:SUB_SensorsSystem_Hall_JSTest_0110
     * @tc.name: Hall_SensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("Hall_SensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Hall_SensorJsTest011---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback, { 'interval': 100000000 });
        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback2);
        setTimeout(() => {
            console.info('----------------------Hall_SensorJsTest011 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL);
            console.info('----------------------Hall_SensorJsTest011 off end---------------------------');
            done();
        }, 1000);
    })

     /*
     * @tc.number:SUB_SensorsSystem_Hall_JSTest_0120
     * @tc.name: Hall_SensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("Hall_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Hall_SensorJsTest012---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback, { 'interval': 100000000 });
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback2, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('----------------------Hall_SensorJsTest012 off in---------------------------');
            try {
			sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback);
			} catch (error) {
            console.info("Hall_SensorJsTest012 error:" + error);
			}
            console.info('----------------------Hall_SensorJsTest012 off end---------------------------');
        }, 500);
        setTimeout(() => {
            console.info('----------------------Hall_SensorJsTest012 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback2);
            console.info('----------------------Hall_SensorJsTest012 off end---------------------------');
            done();
        }, 1000);
    })

     /*
     * @tc.number:SUB_SensorsSystem_Hall_JSTest_0130
     * @tc.name: Hall_SensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("Hall_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Hall_SensorJsTest013---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback, { 'interval': 100000000 });
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL, callback2, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('----------------------Hall_SensorJsTest013 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HALL);
            console.info('----------------------Hall_SensorJsTest013 off end---------------------------');
            done();
        }, 1000);
    })
})}
