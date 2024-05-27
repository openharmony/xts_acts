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

export default function SensorJsTest_sensor_35() {
describe("SensorJsTest_sensor_35", function () {
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

    let errMessage;
    let invild = -1;
    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = 'Service exception.'
    let TAG  = ''

   /**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0010
     * @tc.name: getSensorListsSensorJsTest001
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("getSensorListsSensorJsTest001",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        TAG = 'getSensorListsSensorJsTest001';
        try{
            sensor.getSensorList().then((data) => {
            for (let i = 0; i < data.length; i++) {
                console.info(TAG + ' Callback in!' + JSON.stringify(data[i]));
            }
            done();
            }, (error)=>{
                console.info(TAG + ' error:' + error);
                done();
            });
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0020
     * @tc.name: getSensorListsSensorJsTest002
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("getSensorListsSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'getSensorListsSensorJsTest002';
        try{
            sensor.getSensorList((error, data) => {
            if (error) {
                console.info(TAG + ' error:' + error);
                done();
            } else {
                for (let i =0; i < data.length; i++) {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data[i]));
                }
                done();
            }
            });
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0030
     * @tc.name: getSensorListsSensorJsTest003
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("getSensorListsSensorJsTest003", 0, async function (done) {
        TAG = 'getSensorListsSensorJsTest003';
        try{
            sensor.getSensorList(null).then(data => {
                for (let i = 0; i < data.length; i++) {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data[i]));
                }
                expect(true).assertTrue();
                done();
            }, (error) => {
                console.info(TAG + ' error:' + error);
                done();
            });
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

/**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0040
     * @tc.name: getSensorListsSensorJsTest004
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
it("getSensorListsSensorJsTest004", 0, async function (done) {
    TAG = 'getSensorListsSensorJsTest004';
    try{
        sensor.getSensorList(errMessage).then(data => {
            for (let i = 0; i < data.length; i++) {
                console.info(TAG + ' Callback in!' + JSON.stringify(data[i]));
            }
            expect(true).assertTrue();
            done();
        }, (error) => {
            console.info(TAG + ' error:' + error);
            done();
        });
    } catch (error) {
        console.info(TAG + ' Device does not support! ');
        done();
    }
})

/**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0050
     * @tc.name: getSensorListsSensorJsTest005
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
it("getSensorListsSensorJsTest005", 0, async function (done) {
    TAG = 'getSensorListsSensorJsTest005';
    try{
        sensor.getSensorList('xxx').then(data => {
            console.info("--getSensorListsSensorJsTest005 callback in--" + data.length);
            for (let i = 0; i < data.length; i++) {
                console.info(TAG + ' Callback in!' + JSON.stringify(data[i]));
            }
            expect(true).assertTrue();
            done();
        }, (error) => {
            console.info(TAG + ' error:' + error);
            done();
        });
    } catch (error) {
        console.info(TAG + ' Device does not support! ');
        done();
    }
})

    /**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0060
     * @tc.name: getSensorListsSensorJsTest006
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("getSensorListsSensorJsTest006", 0, async function (done) {
        TAG = 'getSensorListsSensorJsTest006';
        try{
            sensor.getSensorList(invild).then(data => {
                console.info("--getSensorListsSensorJsTest006 callback in--" + data.length);
                for (let i = 0; i < data.length; i++) {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data[i]));
                }
                expect(true).assertTrue();
                done();
            }, (error) => {
                console.info(TAG + ' error:' + error);
                done();
            });
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0070
     * @tc.name: getSensorListsSensorJsTest007
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("getSensorListsSensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'getSensorListsSensorJsTest007';
        try{
            sensor.getSensorList(xxx).then(data => {
                console.info("--getSensorListsSensorJsTest007 callback in--" + data.length);
                for (let i = 0; i < data.length; i++) {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data[i]));
                }
                expect(true).assertTrue();
                done();
            }, (error) => {
                console.info(TAG + ' error:' + error);
                done();
            });
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0080
     * @tc.name: getSensorListsSensorJsTest008
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("getSensorListsSensorJsTest008", 0, async function (done) {
        TAG = 'getSensorListsSensorJsTest008';
        try{
            sensor.getSensorList(undefined).then((data) => {
                for (let i = 0; i < data.length; i++) {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data[i]));
                }
                expect(true).assertTrue();
                done();
            }, (error) => {
                console.info(TAG + ' error:' + error);
                done();
            });
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0090
     * @tc.name: getSensorListsSensorJsTest009
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("getSensorListsSensorJsTest009", 0, async function (done) {
        TAG = 'getSensorListsSensorJsTest009';
        try{
            sensor.getSensorList(null).then((data) => {
                for (let i = 0; i < data.length; i++) {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data[i]));
                }
                expect(true).assertTrue();
                done();
            }, (error) => {
                console.info(TAG + ' error:' + error);
                done();
            });
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })
})}
