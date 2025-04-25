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

export default function SensorJsTest_sensor_58() {
describe("SensorJsTest_sensor_58", function () {
    function callback(data) {
        console.info("callback" + JSON.stringify(data));
		expect(typeof (data.temperature)).assertEqual("number");
    }

    function callback2(data) {
        console.info("callback2" + JSON.stringify(data));
		expect(typeof (data.temperature)).assertEqual("number");
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
	let errMessages = ['ReferenceError: string is not defined','TypeError: is not callable',
						'ReferenceError: xxx is not defined']
	let errMessage
	
     /*
     * @tc.number:SUB_SensorsSystem_Ambient_Temperature_JSTest_0120
     * @tc.name: newAmbient_Temperature_SensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAmbient_Temperature_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('--------newAmbient_Temperature_SensorJsTest012--------');
		try {
            sensor.on(sensor.SensorId.AMBIENT_TEMPERATURE, callback);
        } catch (error) {
            console.info("newAmbient_Temperature_SensorJsTest012 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
		 setTimeout(() => {
            expect(true).assertTrue();
            done();
        }, 500);
    })

    /*
     * @tc.number: SUB_SensorsSystem_Ambient_Temperature_JSTest_0130
     * @tc.name: newAmbient_Temperature_SensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAmbient_Temperature_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newAmbient_Temperature_SensorJsTest013--------');
		try {
            sensor.on(sensor.SensorId.AMBIENT_TEMPERATURE ,callback, { 'interval': 100000000 });
        } catch (error) {
            console.info("newAmbient_Temperature_SensorJsTest013 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Ambient_Temperature_JSTest_0140
     * @tc.name: newAmbient_Temperature_SensorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAmbient_Temperature_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newAmbient_Temperature_SensorJsTest014--------');
        function onSensorCallback(data) {
            console.info('newAmbient_Temperature_SensorJsTest014  on error');
            expect(typeof (data.temperature)).assertEqual("number");
        }
        try {
            sensor.on(sensor.SensorId.AMBIENT_TEMPERATURE, 
			onSensorCallback, { 'interval': 100000000 }, 5);
        } catch (error) {
            console.info("newAmbient_Temperature_SensorJsTest014 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Ambient_Temperature_JSTest_0150
     * @tc.name: newAmbient_Temperature_SensorJsTest015
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAmbient_Temperature_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newAmbient_Temperature_SensorJsTest015--------');
        try{
		sensor.once(sensor.SensorId.AMBIENT_TEMPERATURE, callback);
		} catch (error) {
            console.info("newAmbient_Temperature_SensorJsTest015 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
			done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Ambient_Temperature_JSTest_0160
     * @tc.name: newAmbient_Temperature_SensorJsTest016
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAmbient_Temperature_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newAmbient_Temperature_SensorJsTest016--------');
        function onceSensorCallback(data) {
            console.info('newAmbient_Temperature_SensorJsTest016 on error');
            expect(typeof (data.temperature)).assertEqual("number");
        }
        try {
            sensor.once(sensor.SensorId.AMBIENT_TEMPERATURE, onceSensorCallback, 5);
        } catch (error) {
            console.info("newAmbient_Temperature_SensorJsTest016 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

   /*
     * @tc.number: SUB_SensorsSystem_Ambient_Temperature_JSTest_0170
     * @tc.name: newAmbient_Temperature_SensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAmbient_Temperature_SensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newAmbient_Temperature_SensorJsTest017--------');
        try {
            sensor.off(string, "");
        } catch (error) {
			errMessage 
            console.info("newAmbient_Temperature_SensorJsTest017 error:" + error);
			errMessage = error.toString();
			expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

   /*
     * @tc.number: SUB_SensorsSystem_Ambient_Temperature_JSTest_0180
     * @tc.name: newAmbient_Temperature_SensorJsTest018
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAmbient_Temperature_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newAmbient_Temperature_SensorJsTest018--------');
        function onSensorCallback(data) {
            console.info('newAmbient_Temperature_SensorJsTest018  on error');
            expect(typeof (data.temperature)).assertEqual("number");
        }
       try {
		   sensor.on(sensor.SensorId.AMBIENT_TEMPERATURE, onSensorCallback);
           sensor.off(sensor.SensorId.AMBIENT_TEMPERATURE);
            } catch (error) {
            console.info("newAmbient_Temperature_SensorJsTest018 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Ambient_Temperature_JSTest_0190
     * @tc.name: newAmbient_Temperature_SensorJsTest019
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAmbient_Temperature_SensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newAmbient_Temperature_SensorJsTest019--------');
        function onSensorCallback(data) {
            console.info('newAmbient_Temperature_SensorJsTest019  on error');
            expect(typeof (data.temperature)).assertEqual("number");
        }
        try {
            sensor.off(1000000, onSensorCallback);
        } catch (error) {
            console.info("newAmbient_Temperature_SensorJsTest019 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })
	
	 /*
     * @tc.number: SUB_SensorsSystem_Ambient_Temperature_JSTest_0200
     * @tc.name: newAmbient_Temperature_SensorJsTest020
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAmbient_Temperature_SensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newAmbient_Temperature_SensorJsTest020--------');
        function onSensorCallback(data) {
            console.info('newAmbient_Temperature_SensorJsTest020  on error');
            expect(typeof (data.temperature)).assertEqual("number");
        }
        try {
            sensor.off(invalid, onSensorCallback);
        } catch (error) {
            console.info("newAmbient_Temperature_SensorJsTest020 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })
	
	/*
     * @tc.number: SUB_SensorsSystem_Ambient_Temperature_JSTest_0210
     * @tc.name: newAmbient_Temperature_SensorJsTest021
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAmbient_Temperature_SensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newAmbient_Temperature_SensorJsTest021--------');
        function onSensorCallback(data) {
            console.info('newAmbient_Temperature_SensorJsTest021  on error');
            expect(typeof (data.temperature)).assertEqual("number");
        }
        try {
            sensor.xxx(sensor.SensorId.AMBIENT_TEMPERATURE, onSensorCallback);
        } catch (error) {
            console.info("newAmbient_Temperature_SensorJsTest021 error:" + error);
            errMessage = error.toString();
            expect(errMessage).assertEqual(errMessages[1]);
            done();
        }
    })
	
	/*
     * @tc.number: SUB_SensorsSystem_Ambient_Temperature_JSTest_0220
     * @tc.name: newAmbient_Temperature_SensorJsTest022
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAmbient_Temperature_SensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newAmbient_Temperature_SensorJsTest022--------');
        function onSensorCallback(data) {
            console.info('newAmbient_Temperature_SensorJsTest022  on error');
            expect(typeof (data.temperature)).assertEqual("number");
        }
        try {
            xxx.on(sensor.SensorId.AMBIENT_TEMPERATURE, onSensorCallback);
        } catch (error) {
            console.info("newAmbient_Temperature_SensorJsTest022 error:" + error);
            errMessage = error.toString();
            expect(errMessage).assertEqual(errMessages[2]);
            done();
        }
    })
})
}
