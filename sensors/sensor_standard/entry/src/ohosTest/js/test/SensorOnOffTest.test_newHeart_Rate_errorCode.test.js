/*
 * Copyright (C) 2023-2024 Huawei Device Co., Ltd.
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
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import osAccount from '@ohos.account.osAccount'
import sensor from '@ohos.sensor'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_58() {
let PermissionFlag = {
    PERMISSION_USER_SET:1,
    PERMISSION_USER_FIXED:2,
    PERMISSION_SYSTEM_FIXED:4
}

const PERMISSION_DENIED_CODE = 201
    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const SENSOR_NO_SUPPORT_CODE = 14500102
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = "Service exception.Possible causes:" +
        "1. Sensor hdf service exception;2. Sensor service ipc exception;3. Sensor data channel exception."
const PERMISSION_DENIED_MSG = 'Permission denied.'
let tokenID = undefined
let permissionNameUser = 'ohos.permission.READ_HEALTH_DATA'
async function grantPerm(){
    try {
        let accountManager = osAccount.getAccountManager();
        let userId = await accountManager.getOsAccountLocalIdFromProcess();
        console.info("SensorJsTest_sensor_58 userId:"+userId)
        console.info("============SensorJsTest_sensor_58 grant Permission start ============")
        var appInfo = await bundle.getApplicationInfo('ohos.acts.sensors.sensor.function', 0, userId);
        tokenID = appInfo.accessTokenId;
        console.log('SensorJsTest_sensor_58 accessTokenId:' + appInfo.accessTokenId + ', name:' + appInfo.name +
        ' ,bundleName:' + appInfo.process)
        var atManager = abilityAccessCtrl.createAtManager();
        var result = await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
        PermissionFlag.PERMISSION_SYSTEM_FIXED)
        console.info('SensorJsTest_sensor_58 successful. result: ' + JSON.stringify(result));
        console.info("============SensorJsTest_sensor_58 grant Permission end ============")
    } catch(error) {
        console.error('SensorJsTest_sensor_58 exception in, msg:' + JSON.stringify(error))
    }
}
describe("SensorJsTest_sensor_58", function () {
    function callback(data) {
        console.info("callback" + JSON.stringify(data));
        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
            sensor.SensorAccuracy.ACCURACY_HIGH) {
            console.info('callback accuracy verified' + JSON.stringify(data));
            expect(true).assertTrue();
        } else {
            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
            expect(false).assertTrue();
        }
        expect(typeof (data.steps)).assertEqual("number");
    }

    function callback2(data) {
        console.info("callback2" + JSON.stringify(data));
        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
            sensor.SensorAccuracy.ACCURACY_HIGH) {
            console.info('callback2 accuracy verified' + JSON.stringify(data));
            expect(true).assertTrue();
        } else {
            console.info('callback2 invalid accuracy encountered' + JSON.stringify(data));
            expect(false).assertTrue();
        }
        expect(typeof (data.steps)).assertEqual("number");
    }

    beforeAll(async function(done) {
        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll called')
        await grantPerm();
        done();
    })

    afterAll(function () {

        /*
         * @tc.teardown: teardown invoked after all testcases
         */
        console.info('afterAll called')
        let atManager = abilityAccessCtrl.createAtManager();
        atManager.revokeUserGrantedPermission(tokenID, permissionNameUser,
        PermissionFlag.PERMISSION_SYSTEM_FIXED)
            .catch((error) => {
                console.info('SensorJsTest_sensor_58 error:' + JSON.stringify(error));
                expect(error.code).assertEqual(ERR_NOT_HAVE_PERMISSION);
            })
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

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0023
    * @tc.name: SensorOnOff_ErrCode_Test_0023
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
            sensor.getSingleSensor(sensor.SensorId.HEART_RATE,(error, data) => {
                if (error) {
                    console.error('SensorOnOff_ErrCode_Test_0023 getSingleSensor fail:' +JSON.stringify(error));
                    done();
                } else {
                    try {
                        expect(typeof(data)).assertEqual("object");
                        sensor.once(sensor.SensorId.HEART_RATE, callback, {'interval': -100000000});
                        done();
                    } catch (error) {
                        console.error('SensorOnOff_ErrCode_Test_0023 catch error:' +JSON.stringify(error));
                        expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                        done();
                    }
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })
})}
