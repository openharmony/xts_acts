/*
 * Copyright (C) 2021-2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import sensor from '@ohos.sensor'

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

    let testNullSensorId = -1;
    let errCode = 401
    let errMessage = 'The parameter invalid.'
    let TAG  = '';

   /**
   * @tc.number:SUB_SENSORS_Sensor_JSTest_0010
   * @tc.name:testRegisterSensortest001
   * @tc.desc:test get sensor data by wrong sensor id.
   * @tc.level:Level 3
   * @tc.type:Function
   * @tc.size:MediumTest
   */
    it('testRegisterSensortest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'testRegisterSensortest001'
        console.info(TAG + ' in');
        function onSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(testNullSensorId,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                        sensor.on(testNullSensorId, onSensorCallback);
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(error.code).assertEqual(errCode)
                        expect(error.message).assertEqual(errMessage)
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
        console.info(TAG + ' end');
    })

   /**
   * @tc.number:SUB_SENSORS_Sensor_JSTest_0020
   * @tc.name:testRegisterSensortest002
   * @tc.desc:test precision
   * @tc.level:Level 3
   * @tc.type:Function
   * @tc.size:MediumTest
   */
    it('testRegisterSensortest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'testRegisterSensortest002'
        console.info(TAG + ' in');
        function onSensorCallback(data) {
          if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
            sensor.SensorAccuracy.ACCURACY_HIGH) {
            console.info('accuracy verified' + JSON.stringify(data));
           if (data.accuracy = sensor.SensorAccuracy.ACCURACY_LOW || data.accuracy <=
            sensor.SensorAccuracy.ACCURACY_MEDIUM) {
                console.info('Precision in the middle two terms:' + JSON.stringify(data));
            }
            expect(true).assertTrue();
          } else {
            console.info('invalid accuracy encountered' + JSON.stringify(data));
            expect(false).assertTrue();
          }
        console.info(TAG + ' Callback in!' + JSON.stringify(data));
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorId.ACCELEROMETER, onSensorCallback);
                    setTimeout(()=>{
                        sensor.off(sensor.SensorId.ACCELEROMETER);
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
        console.info(TAG + ' end');
    })
})}
