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

export default function SensorJsTest_sensor_22() {
describe("SensorJsTest_sensor_22", function () {
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

    /*
     * @tc.number: SUB_SensorsSystem_Ambient_Temperature_JSTest_0010
     * @tc.name: SensorAmbientTemperatureJSTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SUB_SensorsSystem_Ambient_Temperature_JSTest_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('--------------------SUB_SensorsSystem_Ambient_Temperature_JSTest_0010-------------------------');
        function offPromise() {
            return new Promise((resolve, reject) => {
                sensor.off(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_TEMPERATURE, (error) => {
                    if (error) {
                        console.info('SensorAmbientTemperatureJSTest001  off error');
                        expect(false).assertTrue();
                        console.info('setTimeout ..start')
                        setTimeout((err) => {
                            reject(err);
                        }, 500);
                    } else {
                        console.info('SensorAmbientTemperatureJSTest001  off success');
                        expect(true).assertTrue();
                        setTimeout(() => {
                            resolve();
                        }, 500);
                    }
                }, 1000)
            })
        }

        let promise = new Promise((resolve, reject) => {
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_TEMPERATURE, function (error, data) {
                if (error) {
                    console.info('SensorAmbientTemperatureJSTest001  on error');
                    expect(false).assertTrue();
                    setTimeout((err) => {
                        reject(err);
                    }, 500);
                } else {
                    console.info('SensorAmbientTemperatureJSTest001  once success temperature: ' + data.temperature);
                    expect(typeof (data.temperature)).assertEqual("number");
                    setTimeout(() => {
                        resolve();
                    }, 500);
                }
            });
        })

        await promise.then(() => {
            return offPromise();
        }, () => {
            console.info("SensorAmbientTemperatureJSTest001 reject");
        })
        done();
    })

    /*
     * @tc.number: SUB_SensorsSystem_Ambient_Temperature_JSTest_0020
     * @tc.name: SensorAmbientTemperatureJSTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SensorAmbientTemperatureJSTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onceSensorCallback(error, data) {
            if (error) {
                console.info('SensorAmbientTemperatureJSTest002  once error');
                expect(false).assertTrue();
            } else {
                console.info('SensorAmbientTemperatureJSTest002s  once success temperature: ' + data.temperature);
                expect(typeof (data.temperature)).assertEqual("number");
            }
            setTimeout(() => {
                done();
            }, 500);
        }
        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_TEMPERATURE, onceSensorCallback);
    })
})
}
