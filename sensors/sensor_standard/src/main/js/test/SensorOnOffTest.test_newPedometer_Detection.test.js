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

describe("SensorJsTest_sensor_57", function () {
    function callback(data) {
        console.info('callback success' + JSON.stringify(data));
        expect(typeof(data.scalar)).assertEqual('number');
    }

    function callback2(data) {
        console.info('callback2 sucess' + JSON.stringify(data));
        expect(typeof(data.scalar)).assertEqual('number');
    }
 
    beforeAll(async function() {
        /*
         * @tc.setup: setup invoked before all testcases
         */
         console.info('beforeAll called')
         try {
            let accountManager = osAccount.getAccountManager();
            let userId = await accountManager.getOsAccountLocalIdFromProcess();
            let appInfo = await bundle.getApplicationInfo('ohos.acts.sensors.sensor.function', 0, userId);
            tokenID = appInfo.accessTokenId;
            console.log('AccessTokenId accessTokenId:' + appInfo.accessTokenId + ', name:' + appInfo.name +
                ' ,bundleName:' + appInfo.process)
			console.info('successful. Data: ' + JSON.stringify(appInfo));
         } catch(error) {
            console.error('exception in, msg:' + JSON.stringify(error))
         }
    })

    afterAll(function() {
        /*
         * @tc.teardown: teardown invoked after all testcases
         */
         console.info('afterAll called')
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
        let atManager = abilityAccessCtrl.createAtManager();
        atManager.revokeUserGrantedPermission(tokenID, permissionNameUser,
            PermissionFlag.PERMISSION_SYSTEM_FIXED)
        .catch((error) => {
            console.info('error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERR_NOT_HAVE_PERMISSION);
        })
    })

     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0010
     * @tc.name: newPedometerDetection_SensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newPedometerDetection_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------newPedometerDetection_SensorJsTest001---------------------------');
        let atManager = abilityAccessCtrl.createAtManager();
        await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
            PermissionFlag.PERMISSION_SYSTEM_FIXED)
        .then(() => {
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetection_SensorJsTest001 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetection_SensorJsTest001 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('newPedometerDetection_SensorJsTest001 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })
        .catch ((error) => {
            console.error('newPedometerDetection_SensorJsTest001 error:' + JSON.stringify(error));
            done();
        })
    })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0020
     * @tc.name: newPedometerDetection_SensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newPedometerDetection_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetection_SensorJsTest002---------------------------');
        let atManager = abilityAccessCtrl.createAtManager();
        await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
            PermissionFlag.PERMISSION_SYSTEM_FIXED)
        .then(() => {
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetection_SensorJsTest002 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, 5);
                    } catch (error) {
                        console.error('newPedometerDetection_SensorJsTest002 On fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                });
            } catch (error) {
                console.error('newPedometerDetection_SensorJsTest002 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })
        .catch ((error) => {
            console.error('newPedometerDetection_SensorJsTest002 error:' + JSON.stringify(error));
            done();
        })
    })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0030
     * @tc.name: newPedometerDetection_SensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newPedometerDetection_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetection_SensorJsTest003---------------------------');
        let atManager = abilityAccessCtrl.createAtManager();
        await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
            PermissionFlag.PERMISSION_SYSTEM_FIXED)
        .then(() => {
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetection_SensorJsTest003 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.once(sensor.SensorId.PEDOMETER_DETECTION, callback);
                        setTimeout(() => {
                            expect(true).assertTrue();
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetection_SensorJsTest003 Once fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('newPedometerDetection_SensorJsTest003 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })
        .catch ((error) => {
            console.error('newPedometerDetection_SensorJsTest003 error:' + JSON.stringify(error));
            done();
        })
    })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0040
     * @tc.name: newPedometerDetection_SensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newPedometerDetection_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetection_SensorJsTest004---------------------------');
        let atManager = abilityAccessCtrl.createAtManager();
        await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
            PermissionFlag.PERMISSION_SYSTEM_FIXED)
        .then(() => {
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetection_SensorJsTest004 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.once(sensor.SensorId.PEDOMETER_DETECTION, callback, 5);
                        setTimeout(() => {
                            expect(true).assertTrue();
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetection_SensorJsTest004 Once fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('newPedometerDetection_SensorJsTest004 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })
        .catch ((error) => {
            console.error('newPedometerDetection_SensorJsTest004 error:' + JSON.stringify(error));
            done();
        })
    })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0050
     * @tc.name: newPedometerDetection_SensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newPedometerDetection_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetection_SensorJsTest005---------------------------');
        let atManager = abilityAccessCtrl.createAtManager();
        await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
            PermissionFlag.PERMISSION_SYSTEM_FIXED)
        .then(() => {
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetection_SensorJsTest005 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.once(sensor.SensorId.PEDOMETER_DETECTION, 5);
                    } catch (error) {
                        console.error('newPedometerDetection_SensorJsTest005 On fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                });
            } catch (error) {
                console.error('newPedometerDetection_SensorJsTest005 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })
        .catch ((error) => {
            console.error('newPedometerDetection_SensorJsTest005 error:' + JSON.stringify(error));
            done();
        })
    })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0060
     * @tc.name: newPedometerDetection_SensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newPedometerDetection_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetection_SensorJsTest006---------------------------');
        let atManager = abilityAccessCtrl.createAtManager();
        await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
            PermissionFlag.PERMISSION_SYSTEM_FIXED)
        .then(() => {
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetection_SensorJsTest006 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.off(-1, callback);
                    } catch (error) {
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                });
            } catch (error) {
                console.error('newPedometerDetection_SensorJsTest006 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })
        .catch ((error) => {
            console.error('newPedometerDetection_SensorJsTest006 error:' + JSON.stringify(error));
            done();
        })
    })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0070
     * @tc.name: newPedometerDetection_SensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newPedometerDetection_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetection_SensorJsTest007---------------------------');
        let atManager = abilityAccessCtrl.createAtManager();
        await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
            PermissionFlag.PERMISSION_SYSTEM_FIXED)
        .then(() => {
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetection_SensorJsTest007 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback);
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback2);
                        setTimeout(()=>{
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetection_SensorJsTest007 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('newPedometerDetection_SensorJsTest007 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })
        .catch ((error) => {
            console.error('newPedometerDetection_SensorJsTest007 error:' + JSON.stringify(error));
            done();
        })
    })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0080
     * @tc.name: newPedometerDetection_SensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newPedometerDetection_SensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetection_SensorJsTest008---------------------------');
        let atManager = abilityAccessCtrl.createAtManager();
        await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
            PermissionFlag.PERMISSION_SYSTEM_FIXED)
        .then(() => {
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetection_SensorJsTest008 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
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
                        console.error('newPedometerDetection_SensorJsTest008 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('newPedometerDetection_SensorJsTest008 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })
        .catch ((error) => {
            console.error('newPedometerDetection_SensorJsTest008 error:' + JSON.stringify(error));
            done();
        })
    })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0090
     * @tc.name: newPedometerDetection_SensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newPedometerDetection_SensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetection_SensorJsTest009---------------------------');
        let atManager = abilityAccessCtrl.createAtManager();
        await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
            PermissionFlag.PERMISSION_SYSTEM_FIXED)
        .then(() => {
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetection_SensorJsTest009 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback);
                        sensor.once(sensor.SensorId.PEDOMETER_DETECTION, callback2);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetection_SensorJsTest009 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('newPedometerDetection_SensorJsTest009 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })
        .catch ((error) => {
            console.error('newPedometerDetection_SensorJsTest009 error:' + JSON.stringify(error));
            done();
        })
    })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0100
     * @tc.name: newPedometerDetection_SensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newPedometerDetection_SensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerDetection_SensorJsTest010---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                if (error) {
                    console.error('newPedometerDetection_SensorJsTest010 getSingleSensor fail:' +JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
                try {
                    sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback);					
                } catch (error) {
                    console.error('newPedometerDetection_SensorJsTest010 On fail, errorCode:' +JSON.stringify(error));
                    expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                    expect(error.message).assertEqual(PERMISSION_DENIED_MSG);
                    done();
                }
            });
        } catch (error) {
            console.error('newPedometerDetection_SensorJsTest010 Sensor is not support');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })
	
	/*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0110
     * @tc.name: newPedometerDetection_SensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newPedometerDetection_SensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometerDetection_SensorJsTest011--------');
		let errorMessage = ""
		let errorMessages = "ReferenceError: xxx is not defined"
        let atManager = abilityAccessCtrl.createAtManager();
        await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
            PermissionFlag.PERMISSION_SYSTEM_FIXED)
        .then(() => {
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetection_SensorJsTest011 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {       
						function onSensorCallback(data) {
							console.info('newPedometerDetection_SensorJsTest011  on error');
							expect(typeof (data.scalar)).assertEqual("number");
						}
						try {
							xxx.on(sensor.SensorId.PEDOMETER_DETECTION, onSensorCallback);
						} catch (error) {
							console.info("newPedometerDetection_SensorJsTest011 error:" + error);
							errorMessage = error.toString();
							expect(errorMessage).assertEqual(errorMessages);
							done();
						}
                    } catch (error) {
                        console.error('newPedometerDetection_SensorJsTest011 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('newPedometerDetection_SensorJsTest011 Sensor is not support'+error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })
        .catch ((error) => {
            console.error('newPedometerDetection_SensorJsTest011 error:' + JSON.stringify(error));
            done();
        })
    })	
     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0120
     * @tc.name: newPedometerDetection_SensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newPedometerDetection_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometerDetection_SensorJsTest012--------');
        let atManager = abilityAccessCtrl.createAtManager();
        await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
            PermissionFlag.PERMISSION_SYSTEM_FIXED)
        .then(() => {
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetection_SensorJsTest012 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback, {'interval': 100000000});
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetection_SensorJsTest012 catch error:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('newPedometerDetection_SensorJsTest012 Sensor is not support'+error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })
        .catch ((error) => {
            console.error('newPedometerDetection_SensorJsTest012 error:' + JSON.stringify(error));
            done();
        })
    })	
	
     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0130
     * @tc.name: newPedometerDetection_SensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newPedometerDetection_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometerDetection_SensorJsTest013--------');
        let atManager = abilityAccessCtrl.createAtManager();
        await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
            PermissionFlag.PERMISSION_SYSTEM_FIXED)
        .then(() => {
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetection_SensorJsTest013 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, callback, {'interval': 100000000}, 5);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetection_SensorJsTest013 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('newPedometerDetection_SensorJsTest013 Sensor is not support'+error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })
        .catch ((error) => {
            console.error('newPedometerDetection_SensorJsTest013 error:' + JSON.stringify(error));
            done();
        })
    })	
	
     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0140
     * @tc.name: newPedometerDetection_SensorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newPedometerDetection_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometerDetection_SensorJsTest014--------');
        let atManager = abilityAccessCtrl.createAtManager();
        await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
            PermissionFlag.PERMISSION_SYSTEM_FIXED)
        .then(() => {
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetection_SensorJsTest014 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
						function onSensorCallback(data) {
							console.info('newPedometerDetection_SensorJsTest014 on error');
							expect(typeof(data.scalar)).assertEqual('number');
						}						
                        sensor.on(sensor.SensorId.PEDOMETER_DETECTION, onSensorCallback, {'interval': 100000000});
                        sensor.off(sensor.SensorId.PEDOMETER_DETECTION);
						setTimeout(() => {
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerDetection_SensorJsTest014 On fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('newPedometerDetection_SensorJsTest014 Sensor is not support'+error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })
        .catch ((error) => {
            console.error('newPedometerDetection_SensorJsTest014 error:' + JSON.stringify(error));
            done();
        })
    })		
	
     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0150
     * @tc.name: newPedometerDetection_SensorJsTest015
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newPedometerDetection_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometerDetection_SensorJsTest015--------');
        let atManager = abilityAccessCtrl.createAtManager();
        await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
            PermissionFlag.PERMISSION_SYSTEM_FIXED)
        .then(() => {
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetection_SensorJsTest015 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.off(sensor.SensorId.PEDOMETER_DETECTION,5);
                    } catch (error) {
                        console.error('newPedometerDetection_SensorJsTest015 Off fail, errorCode:' +JSON.stringify(error));
						expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
						expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
						done();
                    }
                });
            } catch (error) {
                console.error('newPedometerDetection_SensorJsTest015 Sensor is not support'+error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })
        .catch ((error) => {
            console.error('newPedometerDetection_SensorJsTest015 error:' + JSON.stringify(error));
            done();
        })
    })	

     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0160
     * @tc.name: newPedometerDetection_SensorJsTest016
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newPedometerDetection_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometerDetection_SensorJsTest016--------');
        let atManager = abilityAccessCtrl.createAtManager();
        await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
            PermissionFlag.PERMISSION_SYSTEM_FIXED)
        .then(() => {
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetection_SensorJsTest016 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
						sensor.on(sensor.SensorId.PEDOMETER_DETECTION, (data)=>{
							console.info("newPedometerDetection_SensorJsTest016 callback: " + JSON.stringify(data));
							expect(typeof(data.scalar)).assertEqual('number');
							expect(typeof (data.timestamp)).assertEqual("number");
						}, {'interval': 100000000});
						sensor.on(sensor.SensorId.PEDOMETER_DETECTION, (data)=>{
							console.info("newPedometerDetection_SensorJsTest016 callback2: " + JSON.stringify(data));
							expect(typeof(data.scalar)).assertEqual('number');
							expect(typeof (data.timestamp)).assertEqual("number");
						});
						setTimeout(()=>{
							sensor.off(sensor.SensorId.PEDOMETER_DETECTION);
							done();
						}, 4000);						
                    } catch (error) {
                        console.error('newPedometerDetection_SensorJsTest016 Off fail, errorCode:' +JSON.stringify(error));
						expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
						expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
						done();
                    }
                });
            } catch (error) {
                console.error('newPedometerDetection_SensorJsTest016 Sensor is not support'+error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })
        .catch ((error) => {
            console.error('newPedometerDetection_SensorJsTest016 error:' + JSON.stringify(error));
            done();
        })
    })	

     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_DETECTION_JSTest_0170
     * @tc.name: newPedometerDetection_SensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newPedometerDetection_SensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometerDetection_SensorJsTest017--------');
        let atManager = abilityAccessCtrl.createAtManager();
        await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
            PermissionFlag.PERMISSION_SYSTEM_FIXED)
        .then(() => {
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('newPedometerDetection_SensorJsTest017 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
						sensor.on(sensor.SensorId.PEDOMETER_DETECTION, (data)=>{
							console.info("newPedometerDetection_SensorJsTest017 callback: " + JSON.stringify(data));
							expect(typeof(data.scalar)).assertEqual('number');
							expect(typeof (data.timestamp)).assertEqual("number");
						}, {'interval': -100000000});					
                    } catch (error) {
                        console.error('newPedometerDetection_SensorJsTest017 On fail, errorCode:' +JSON.stringify(error));
						expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
						expect(error.message).assertEqual(SERVICE_EXCEPTION_MSG);
						done();
                    }
                });
            } catch (error) {
                console.error('newPedometerDetection_SensorJsTest017 Sensor is not support'+error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })
        .catch ((error) => {
            console.error('newPedometerDetection_SensorJsTest017 error:' + JSON.stringify(error));
            done();
        })
    })		
})}
