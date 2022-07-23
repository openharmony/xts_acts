/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// @ts-nocheck

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import sensor from '@ohos.sensor'

function sleep(NumberMillis) {
    let now = new Date()
    let exitTime = now.getTime() + NumberMillis
    while (true) {
        now = new Date()
        if (now.getTime > exitTime) {
            return
        }
    }
}

export default function SystemParameterTest() {
describe('SystemParameterTest', function () {
    beforeAll(function () {
        console.info('beforeAll caled')
    })

    afterAll(function () {
        console.info('afterAll caled')
    })

    beforeEach(function () {
        console.info('beforeEach caled')
    })

    afterEach(function () {
        console.info('afterEach caled')
    })

    let testSensorId = 0;
    let testNullSensorId = -1;

   /**
   * @tc.number SUB_SENSORS_Sensor_JSTest_0020
   * @tc.name   testRegisterSensortest002
   * @tc.desc   test get sensor data by wrong sensor id.
   */
    it('SUB_SENSORS_Sensor_JSTest_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('SUB_SENSORS_Sensor_JSTest_0020 start');

        function onSensorCallback(data) {
            console.info('SensorJsTest002  on error');
            expect(false).assertTrue();
            done();
        }

        try {
            sensor.on(testNullSensorId, onSensorCallback);
        } catch (error) {
            console.info(error);
            expect(true).assertTrue();
            done();
        }
        console.info('SUB_SENSORS_Sensor_JSTest_0020 end');
    })
})}
