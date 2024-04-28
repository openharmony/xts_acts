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

export default function SensorJsTest_sensor_57() {

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
        console.info("SensorJsTest_sensor_57 userId:"+userId)
        console.info("============SensorJsTest_sensor_57 grant Permission start ============")
        var appInfo = await bundle.getApplicationInfo('ohos.acts.sensors.sensor.function', 0, userId);
        tokenID = appInfo.accessTokenId;
        console.log('SensorJsTest_sensor_57 accessTokenId:' + appInfo.accessTokenId + ', name:' + appInfo.name +
        ' ,bundleName:' + appInfo.process)
        var atManager = abilityAccessCtrl.createAtManager();
        var result = await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
        PermissionFlag.PERMISSION_SYSTEM_FIXED)
        console.info('SensorJsTest_sensor_57 successful. result: ' + JSON.stringify(result));
        console.info("============SensorJsTest_sensor_57 grant Permission end ============")
    } catch(error) {
        console.error('SensorJsTest_sensor_57 exception in, msg:' + JSON.stringify(error))
    }
}
describe("SensorJsTest_sensor_57", function () {
    function callback(data) {
        console.info('callback success' + JSON.stringify(data));
        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
            sensor.SensorAccuracy.ACCURACY_HIGH) {
            console.info('callback accuracy verified' + JSON.stringify(data));
            expect(true).assertTrue();
        } else {
            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
            expect(false).assertTrue();
        }
        expect(typeof(data.scalar)).assertEqual('number');
    }

    function callback2(data) {
        console.info('callback2 sucess' + JSON.stringify(data));
        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
            sensor.SensorAccuracy.ACCURACY_HIGH) {
            console.info('callback accuracy verified' + JSON.stringify(data));
            expect(true).assertTrue();
        } else {
            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
            expect(false).assertTrue();
        }
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
                console.info('SensorJsTest_sensor_57 error:' + JSON.stringify(error));
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
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0010
     * @tc.name: newPedometerDetectionSensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------newPedometerDetectionSensorJsTest001---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest001 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest001 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest001 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0020
     * @tc.name: newPedometerDetectionSensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetectionSensorJsTest002---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest002 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, 5);
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest002 On fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest002 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0030
     * @tc.name: newPedometerDetectionSensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetectionSensorJsTest003---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest003 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.once(sensor.SensorId.PEDOMETER_DETECTION, callback);
                        setTimeout(() => {
                            expect(true).assertTrue();
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest003 Once fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest003 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0040
     * @tc.name: newPedometerDetectionSensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetectionSensorJsTest004---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest004 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.once(sensor.SensorId.PEDOMETER_DETECTION, callback, 5);
                        setTimeout(() => {
                            expect(true).assertTrue();
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest004 Once fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest004 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0050
     * @tc.name: newPedometerDetectionSensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetectionSensorJsTest005---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest005 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.once(sensor.SensorId.PEDOMETER_DETECTION, 5);
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest005 On fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest005 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0060
     * @tc.name: newPedometerDetectionSensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetectionSensorJsTest006---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest006 getSingleSensor fail:' +JSON.stringify(error));
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
                console.error('newPedometerDetectionSensorJsTest006 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0070
     * @tc.name: newPedometerDetectionSensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetectionSensorJsTest007---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest007 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback);
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback2);
                        setTimeout(()=>{
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest007 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest007 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0080
     * @tc.name: newPedometerDetectionSensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetectionSensorJsTest008---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest008 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback);
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback2);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION, callback);
                        }, 4000);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION, callback2);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest008 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest008 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0090
     * @tc.name: newPedometerDetectionSensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetectionSensorJsTest009---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest009 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback);
                        sensor.once(sensor.SensorId.PEDOMETER_DETECTION, callback2);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest009 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest009 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0100
     * @tc.name: newPedometerDetectionSensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetectionSensorJsTest010---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                if (error) {
                    console.error('newPedometerDetectionSensorJsTest010 getSingleSensor fail:' +JSON.stringify(error));
                    done();
                } else {
                try {
                    sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback);
                    setTimeout(() => {
                        done();
                    }, 4000);
                } catch (error) {
                    console.error('newPedometerDetectionSensorJsTest010 On fail, errorCode:' +JSON.stringify(error));
                    expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                    expect(error.message).assertEqual(PERMISSION_DENIED_MSG);
                    done();
                }
                }
            });
        } catch (error) {
            console.error('newPedometerDetectionSensorJsTest010 Sensor is not support');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0110
     * @tc.name: newPedometerDetectionSensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometerDetectionSensorJsTest011--------');
        let errorMessage = ""
        let errorMessages = "ReferenceError: xxx is not defined"
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest011 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        function onSensorCallback(data) {
                            console.info('newPedometerDetectionSensorJsTest011  on error');
                            expect(typeof (data.scalar)).assertEqual("number");
                        }
                        try {
                            xxx.on(sensor.SensorId.PEDOMETER_DETECTION, onSensorCallback);
                        } catch (error) {
                            console.info("newPedometerDetectionSensorJsTest011 error:" + error);
                            errorMessage = error.toString();
                            expect(errorMessage).assertEqual(errorMessages);
                            done();
                        }
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest011 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest011 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0120
     * @tc.name: newPedometerDetectionSensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometerDetectionSensorJsTest012--------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest012 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback, {'interval': 100000000});
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest012 catch error:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest012 Sensor is not support'+error);
                done();
            }
        })

     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0130
     * @tc.name: newPedometerDetectionSensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometerDetectionSensorJsTest013--------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest013 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback, {'interval': 100000000}, 5);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest013 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest013 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0140
     * @tc.name: newPedometerDetectionSensorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometerDetectionSensorJsTest014--------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest014 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        function onSensorCallback(data) {
                            console.info('newPedometerDetectionSensorJsTest014 callback:'+JSON.stringify(data));
                            expect(typeof(data.scalar)).assertEqual('number');
                        }
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, onSensorCallback, {'interval': 100000000});
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest014 On fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest014 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0150
     * @tc.name: newPedometerDetectionSensorJsTest015
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
     it("newPedometerDetectionSensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetectionSensorJsTest015---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest015 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.off(sensor.SensorId.PEDOMETER_DETECTION,5);
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest015 Off fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest015 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0160
     * @tc.name: newPedometerDetectionSensorJsTest016
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometerDetectionSensorJsTest016--------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest016 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, (data)=>{
                            console.info("newPedometerDetectionSensorJsTest016 callback: " + JSON.stringify(data));
                            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                                sensor.SensorAccuracy.ACCURACY_HIGH) {
                                console.info('callback accuracy verified' + JSON.stringify(data));
                                expect(true).assertTrue();
                            } else {
                                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                                expect(false).assertTrue();
                            }
                            expect(typeof(data.scalar)).assertEqual('number');
                            expect(typeof (data.timestamp)).assertEqual("number");
                        }, {'interval': 100000000});
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, (data)=>{
                            console.info("newPedometerDetectionSensorJsTest016 callback2: " + JSON.stringify(data));
                            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                                sensor.SensorAccuracy.ACCURACY_HIGH) {
                                console.info('callback accuracy verified' + JSON.stringify(data));
                                expect(true).assertTrue();
                            } else {
                                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                                expect(false).assertTrue();
                            }
                            expect(typeof(data.scalar)).assertEqual('number');
                            expect(typeof (data.timestamp)).assertEqual("number");
                        });
                        setTimeout(()=>{
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest016 Off fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest016 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0170
     * @tc.name: newPedometerDetectionSensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometerDetectionSensorJsTest017--------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest017 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, (data)=>{
                            console.info("newPedometerDetectionSensorJsTest017 callback: " + JSON.stringify(data));
                            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                                sensor.SensorAccuracy.ACCURACY_HIGH) {
                                console.info('callback accuracy verified' + JSON.stringify(data));
                                expect(true).assertTrue();
                            } else {
                                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                                expect(false).assertTrue();
                            }
                            expect(typeof(data.scalar)).assertEqual('number');
                            expect(typeof (data.timestamp)).assertEqual("number");
                        }, {'interval': -100000000});
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest017 On fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                        expect(error.message).assertEqual(SERVICE_EXCEPTION_MSG);
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest017 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0180
     * @tc.name: newPedometerDetectionSensorJsTest018
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------newPedometerDetectionSensorJsTest018---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest018 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback, { 'interval': undefined });
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest018 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest018 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0190
     * @tc.name: newPedometerDetectionSensorJsTest019
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetectionSensorJsTest019---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest019 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback, { 'interval': undefined });
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback2, { 'interval': undefined });
                        setTimeout(()=>{
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest019 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest019 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0200
     * @tc.name: newPedometerDetectionSensorJsTest020
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetectionSensorJsTest020---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest020 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback, { 'interval': null });
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback2, { 'interval': null });
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION, callback);
                        }, 4000);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION, callback2);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest020 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest020 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0210
     * @tc.name: newPedometerDetectionSensorJsTest021
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetectionSensorJsTest021---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest021 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback);
                        try{
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback, undefined);
                        } catch(error){
                            console.info('newPedometerDetectionSensorJsTest021 Repeat subscription'+error);
                        }
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest021 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest021 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0220
     * @tc.name: newPedometerDetectionSensorJsTest022
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerDetectionSensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetectionSensorJsTest022 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION, null);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetectionSensorJsTest022 catch error:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerDetectionSensorJsTest022 Sensor is not support'+error);
                done();
            }
    })
})}
