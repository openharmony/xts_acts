/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

export default function SensorJsTest_sensor_17() {

let PermissionFlag = {
    PERMISSION_USER_SET:1,
    PERMISSION_USER_FIXED:2,
    PERMISSION_SYSTEM_FIXED:4
}

const PERMISSION_DENIED_CODE = 201
const PARAMETER_ERROR_CODE = 401
const SERVICE_EXCEPTION_CODE = 14500101
const SERVICE_EXCEPTION_MSG = 'Service exception.'
const PARAMETER_ERROR_MSG = 'The parameter invalid.'
const PERMISSION_DENIED_MSG = 'Permission denied.'
let tokenID = undefined
let permissionNameUser = 'ohos.permission.ACTIVITY_MOTION'
    async function grantPerm(){
        try {
            let accountManager = osAccount.getAccountManager();
            let userId = await accountManager.getOsAccountLocalIdFromProcess();
            console.info("SensorJsTest_sensor_17 userId:"+userId)
            console.info("============SensorJsTest_sensor_17 grant Permission start ============")
            var appInfo = await bundle.getApplicationInfo('ohos.acts.sensors.sensor.function', 0, userId);
            tokenID = appInfo.accessTokenId;
            console.log('SensorJsTest_sensor_17 accessTokenId:' + appInfo.accessTokenId + ', name:' + appInfo.name +
            ' ,bundleName:' + appInfo.process)
            var atManager = abilityAccessCtrl.createAtManager();
            var result = await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
            PermissionFlag.PERMISSION_SYSTEM_FIXED)
            console.info('SensorJsTest_sensor_17 successful. result: ' + JSON.stringify(result));
            console.info("============SensorJsTest_sensor_17 grant Permission end ============")
        } catch(error) {
            console.error('SensorJsTest_sensor_17 exception in, msg:' + JSON.stringify(error))
        }
    }
describe("SensorJsTest_sensor_17", function () {
    function callback(data) {
        console.info('old callback success' + JSON.stringify(data));
        expect(typeof(data.scalar)).assertEqual('number');
    }

    function callback2(data) {
        console.info('old callback2 sucess' + JSON.stringify(data));
        expect(typeof(data.scalar)).assertEqual('number');
    }

    beforeAll(async function(done) {
        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll called')
        await grantPerm();
        done();
    })

    afterAll(function() {
        /*
         * @tc.teardown: teardown invoked after all testcases
         */
        console.info('afterAll called')
        let atManager = abilityAccessCtrl.createAtManager();
        atManager.revokeUserGrantedPermission(tokenID, permissionNameUser,
        PermissionFlag.PERMISSION_SYSTEM_FIXED)
            .catch((error) => {
                console.info('SensorJsTest_sensor_17 error:' + JSON.stringify(error));
                expect(error.code).assertEqual(ERR_NOT_HAVE_PERMISSION);
            })
    })

    beforeEach(function() {
        /*
         * @tc.setup: setup invoked before each testcases
         */
        console.info('beforeEach called')
    })

    afterEach(function() {
        /*
         * @tc.teardown: teardown invoked after each testcases
         */
        console.info('afterEach called')
    })

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0010
     * @tc.name: PedometerDetectionSensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------PedometerDetectionSensorJsTest001---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest001 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest001 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest001 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0020
     * @tc.name: PedometerDetectionSensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetectionSensorJsTest002---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest002 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, 5);
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest002 On fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest002 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0030
     * @tc.name: PedometerDetectionSensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetectionSensorJsTest003---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest003 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                        setTimeout(() => {
                            expect(true).assertTrue();
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest003 Once fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest003 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0040
     * @tc.name: PedometerDetectionSensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetectionSensorJsTest004---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest004 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback, 5);
                        setTimeout(() => {
                            expect(true).assertTrue();
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest004 Once fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest004 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0050
     * @tc.name: PedometerDetectionSensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetectionSensorJsTest005---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest005 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, 5);
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest005 On fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest005 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0060
     * @tc.name: PedometerDetectionSensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetectionSensorJsTest006---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest006 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.off(-1, callback);
                    } catch (error) {
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest006 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0070
     * @tc.name: PedometerDetectionSensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetectionSensorJsTest007---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest007 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback2);
                        setTimeout(()=>{
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest007 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest007 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0080
     * @tc.name: PedometerDetectionSensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetectionSensorJsTest008---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest008 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback2);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                        }, 4000);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback2);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest008 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest008 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0090
     * @tc.name: PedometerDetectionSensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetectionSensorJsTest009---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest009 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback2);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest009 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest009 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0100
     * @tc.name: PedometerDetectionSensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetectionSensorJsTest010---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                if (error) {
                    console.error('PedometerDetectionSensorJsTest010 getSingleSensor fail:' +JSON.stringify(error));
                    done();
                } else {
                try {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                    setTimeout(() => {
                        done();
                    }, 4000);
                } catch (error) {
                    console.error('PedometerDetectionSensorJsTest010 On fail, errorCode:' +JSON.stringify(error));
                    expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                    expect(error.message).assertEqual(PERMISSION_DENIED_MSG);
                    done();
                }
                }
            });
        } catch (error) {
            console.error('PedometerDetectionSensorJsTest010 Sensor is not support');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0110
     * @tc.name: PedometerDetectionSensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------PedometerDetectionSensorJsTest011--------');
        let errorMessage = ""
        let errorMessages = "ReferenceError: xxx is not defined"
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest011 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        function onSensorCallback(data) {
                            console.info('PedometerDetectionSensorJsTest011  on error');
                            expect(typeof (data.scalar)).assertEqual("number");
                        }
                        try {
                            xxx.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, onSensorCallback);
                        } catch (error) {
                            console.info("PedometerDetectionSensorJsTest011 error:" + error);
                            errorMessage = error.toString();
                            expect(errorMessage).assertEqual(errorMessages);
                            done();
                        }
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest011 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest011 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0120
     * @tc.name: PedometerDetectionSensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------PedometerDetectionSensorJsTest012--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest012 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback, {'interval': 100000000});
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest012 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest012 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0130
     * @tc.name: PedometerDetectionSensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------PedometerDetectionSensorJsTest013--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest013 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback, {'interval': 100000000}, 5);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest013 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest013 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0140
     * @tc.name: PedometerDetectionSensorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------PedometerDetectionSensorJsTest014--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest014 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        function onSensorCallback(data) {
                            console.info('PedometerDetectionSensorJsTest014 data:' + JSON.stringify(data));
                            expect(typeof(data.scalar)).assertEqual('number');
                        }
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, onSensorCallback, {'interval': 100000000});
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest014 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest014 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0150
     * @tc.name: PedometerDetectionSensorJsTest015
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
     it("PedometerDetectionSensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetectionSensorJsTest015---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest015 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION,5);
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest015 Off fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest015 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0160
     * @tc.name: PedometerDetectionSensorJsTest016
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------PedometerDetectionSensorJsTest016--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest016 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (data)=>{
                            console.info("PedometerDetectionSensorJsTest016 callback: " + JSON.stringify(data));
                            expect(typeof(data.scalar)).assertEqual('number');
                            expect(typeof (data.timestamp)).assertEqual("number");
                        }, {'interval': 100000000});
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (data)=>{
                            console.info("PedometerDetectionSensorJsTest016 callback2: " + JSON.stringify(data));
                            expect(typeof(data.scalar)).assertEqual('number');
                            expect(typeof (data.timestamp)).assertEqual("number");
                        });
                        setTimeout(()=>{
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest016 Off fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest016 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0170
     * @tc.name: PedometerDetectionSensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------PedometerDetectionSensorJsTest017--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest017 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (data)=>{
                            console.info("PedometerDetectionSensorJsTest017 callback: " + JSON.stringify(data));
                            expect(typeof(data.scalar)).assertEqual('number');
                            expect(typeof (data.timestamp)).assertEqual("number");
                        }, {'interval': -100000000});
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest017 On fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                        expect(error.message).assertEqual(SERVICE_EXCEPTION_MSG);
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest017 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0180
     * @tc.name: PedometerDetectionSensorJsTest018
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------PedometerDetectionSensorJsTest018---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest018 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback, { 'interval': undefined });
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest018 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest018 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0190
     * @tc.name: PedometerDetectionSensorJsTest019
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetectionSensorJsTest019---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest019 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback, { 'interval': undefined });
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback2, { 'interval': undefined });
                        setTimeout(()=>{
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest019 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest019 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0200
     * @tc.name: PedometerDetectionSensorJsTest020
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetectionSensorJsTest020---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest020 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback, { 'interval': null });
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback2, { 'interval': null });
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                        }, 4000);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback2);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest020 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest020 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0210
     * @tc.name: PedometerDetectionSensorJsTest021
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetectionSensorJsTest021---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest021 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                        try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback, undefined);
                        } catch(error){
                            console.info('PedometerDetectionSensorJsTest021 Repeat subscription'+error);
                        }
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest021 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest021 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0220
     * @tc.name: PedometerDetectionSensorJsTest022
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetectionSensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetectionSensorJsTest022 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, null);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetectionSensorJsTest022 catch error:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerDetectionSensorJsTest022 Sensor is not support'+error);
                done();
            }
    })
})}
