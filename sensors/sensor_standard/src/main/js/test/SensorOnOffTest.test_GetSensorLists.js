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

export default function SensorJsTest_sensor_35() {
describe("SensorJsTest_sensor_35", function () {
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
	
	let errMessages = ['Wrong argument type, should be function', 'The number of parameters is not valid',
    'xxx is not defined'];

   /**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0010
     * @tc.name: getSensorLists_SensorJsTest001
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
 it("getSensorLists_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    console.info("---------------------------getSensorLists_SensorJsTest001----------------------------------");
    sensor.getSensorList().then((data) => {
        for (let i = 0; i < data.length; i++) {
            console.info("getSensorLists_SensorJsTest001 " + JSON.stringify(data[i]));
        }
        done();
    }, (error)=>{
        console.info('getSensorLists_SensorJsTest001 failed');
        expect(false).assertTrue();
    });
})

/**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0020
     * @tc.name: getSensorLists_SensorJsTest002
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
it("getSensorLists_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
    console.info("---------------------------getSensorLists_SensorJsTest002----------------------------------");
    sensor.getSensorList((error, data) => {
        if (error) {
            console.info('getSensorLists_SensorJsTest002 error');
            expect(false).assertTrue();
        } else {
            for (let i = 0; i < data.length; i++) {
                console.info("getSensorLists_SensorJsTest002 " + JSON.stringify(data[i]));
            }
            done()
        }
    });
})

    /**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0030
     * @tc.name: getSensorLists_SensorJsTest003
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
 it("getSensorLists_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
    console.info("---------------------------getSensorLists_SensorJsTest003----------------------------------");
    try {
        sensor.getSensorList(null)
    } catch (error) {
        errMessage = error.toString().slice(23, 62);
        console.info('getSensorLists_SensorJsTest003 error:' + error);
        console.info('getSensorLists_SensorJsTest003 errMessage:' + errMessage);
        expect(errMessage).assertEqual(errMessages[0]);
        done();
    }
})

/**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0040
     * @tc.name: getSensorLists_SensorJsTest004
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
 it('getSensorLists_SensorJsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
    console.info("------------------getSensorLists_SensorJsTest004-------------------------");
    try {
        sensor.getSensorList(invild)
    } catch (error) {
        errMessage = error.toString().slice(23,62);
        console.info('getSensorLists_SensorJsTest004 error:' + error);
        console.info('getSensorLists_SensorJsTest004 errMessage:' + errMessage);
        expect(errMessage).assertEqual(errMessages[0]);
        done();
    }
})

/**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0050
     * @tc.name: getSensorLists_SensorJsTest005
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
 it('getSensorLists_SensorJsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
    console.info("------------------getSensorLists_SensorJsTest005-------------------------");
    try {
        sensor.getSensorList('xxx')
    } catch (error) {
        errMessage = error.toString().slice(23,62);
        console.info('getSensorLists_SensorJsTest005 error:' + error);
        console.info('getSensorLists_SensorJsTest005 errMessage:' + errMessage);
        expect(errMessage).assertEqual(errMessages[0]);
		done();
    }
})

/**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0060
     * @tc.name: getSensorLists_SensorJsTest006
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
 it("getSensorLists_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
    console.info("---------------------------getSensorLists_SensorJsTest006----------------------------------");
    sensor.getSensorList((error, data) => {
        if (error) {
            console.info('getSensorLists_SensorJsTest006 error');
            expect(true).assertTrue();
            done()
        } else {
            for (let i = 0; i < data.length; i++) {
                console.info("getSensorLists_SensorJsTest006 " + JSON.stringify(data[i]));
            }
            done()
        }
    });
    sensor.getSensorList((error, data) => {
        if (error) {
            console.info('getSensorLists_SensorJsTest006 error');
            expect(true).assertTrue();
            done()
        } else {
            for (let i = 0; i < data.length; i++) {
                console.info("getSensorLists_SensorJsTest006 " + JSON.stringify(data[i]));
            }
            done()
        }
    });
})
})
}
