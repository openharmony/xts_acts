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
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import osAccount from '@ohos.account.osAccount'
import sensor from '@ohos.sensor'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_56() {
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
        console.info("SensorJsTest_sensor_56 userId:"+userId)
        console.info("============SensorJsTest_sensor_56 grant Permission start ============")
        var appInfo = await bundle.getApplicationInfo('ohos.acts.sensors.sensor.function', 0, userId);
        tokenID = appInfo.accessTokenId;
        console.log('SensorJsTest_sensor_56 accessTokenId:' + appInfo.accessTokenId + ', name:' + appInfo.name +
        ' ,bundleName:' + appInfo.process)
        var atManager = abilityAccessCtrl.createAtManager();
        var result = await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
        PermissionFlag.PERMISSION_SYSTEM_FIXED)
        console.info('SensorJsTest_sensor_56 successful. result: ' + JSON.stringify(result));
        console.info("============SensorJsTest_sensor_56 grant Permission end ============")
    } catch(error) {
        console.error('SensorJsTest_sensor_56 exception in, msg:' + JSON.stringify(error))
    }
}
describe("SensorJsTest_sensor_56", function () {
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
                console.info('SensorJsTest_sensor_56 error:' + JSON.stringify(error));
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
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_JSTest_0010
     * @tc.name: newPedometerSensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------newPedometerSensorJsTest001---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest001 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerSensorJsTest001 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest001 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_JSTest_0020
     * @tc.name: newPedometerSensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerSensorJsTest002---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest002 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, 5);
                    } catch (error) {
                        console.error('newPedometerSensorJsTest002 On fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest002 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_JSTest_0030
     * @tc.name: newPedometerSensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerSensorJsTest003---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest003 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.once(sensor.SensorId.PEDOMETER, callback);
                        setTimeout(() => {
                            expect(true).assertTrue();
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerSensorJsTest003 Once fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest003 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_JSTest_0040
     * @tc.name: newPedometerSensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerSensorJsTest004---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest004 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.once(sensor.SensorId.PEDOMETER, callback, 5);
                        setTimeout(() => {
                            expect(true).assertTrue();
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerSensorJsTest004 Once fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest004 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_JSTest_0050
     * @tc.name: newPedometerSensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerSensorJsTest005---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest005 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.once(sensor.SensorId.PEDOMETER, 5);
                    } catch (error) {
                        console.error('newPedometerSensorJsTest005 On fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest005 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_JSTest_0060
     * @tc.name: newPedometerSensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerSensorJsTest006---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest006 getSingleSensor fail:' +JSON.stringify(error));
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
                console.error('newPedometerSensorJsTest006 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_JSTest_0070
     * @tc.name: newPedometerSensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerSensorJsTest007---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest007 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else{
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback);
                        sensor.on(sensor.SensorId.PEDOMETER, callback2);
                        setTimeout(()=>{
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerSensorJsTest007 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest007 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_JSTest_0080
     * @tc.name: newPedometerSensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerSensorJsTest008---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest008 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback);
                        sensor.on(sensor.SensorId.PEDOMETER, callback2);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER, callback);
                        }, 4000);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER, callback2);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerSensorJsTest008 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest008 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_JSTest_0090
     * @tc.name: newPedometerSensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerSensorJsTest009---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest009 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback);
                        sensor.once(sensor.SensorId.PEDOMETER, callback2);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerSensorJsTest009 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest009 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_JSTest_0100
     * @tc.name: newPedometerSensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerSensorJsTest010---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                if (error) {
                    console.error('newPedometerSensorJsTest010 getSingleSensor fail:' +JSON.stringify(error));
                    done();
                } else {
                try {
                    sensor.on(sensor.SensorId.PEDOMETER, callback);
                    setTimeout(() => {
                        done();
                    }, 4000);
                } catch (error) {
                    console.error('newPedometerSensorJsTest010 On fail, errorCode:' +JSON.stringify(error));
                    expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                    expect(error.message).assertEqual(PERMISSION_DENIED_MSG);
                    done();
                }
                }
            });
        } catch (error) {
            console.error('newPedometerSensorJsTest010 Sensor is not support');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_JSTest_0110
     * @tc.name: newPedometerSensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometerSensorJsTest011--------');
        let errorMessage = ""
        let errorMessages = "ReferenceError: xxx is not defined"
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest011 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        function onSensorCallback(data) {
                            console.info('newPedometerSensorJsTest011  on error');
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
                        try {
                            xxx.on(sensor.SensorId.PEDOMETER, onSensorCallback);
                        } catch (error) {
                            console.info("newPedometerSensorJsTest011 error:" + error);
                            errorMessage = error.toString();
                            expect(errorMessage).assertEqual(errorMessages);
                            done();
                        }
                    } catch (error) {
                        console.error('newPedometerSensorJsTest011 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest011 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_JSTest_0120
     * @tc.name: newPedometerSensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometerSensorJsTest012--------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest012 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback, {'interval': 100000000});
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerSensorJsTest012 catch error:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest012 Sensor is not support'+error);
                done();
            }
        })

     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_JSTest_0130
     * @tc.name: newPedometerSensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometerSensorJsTest013--------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest013 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback, {'interval': 100000000}, 5);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerSensorJsTest013 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest013 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_JSTest_0140
     * @tc.name: newPedometerSensorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometerSensorJsTest014--------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest014 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        function onSensorCallback(data) {
                            console.info('newPedometerSensorJsTest014 callback:'+JSON.stringify(data));
                            expect(typeof(data.steps)).assertEqual('number');
                        }
                        sensor.on(sensor.SensorId.PEDOMETER, onSensorCallback, {'interval': 100000000});
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerSensorJsTest014 On fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest014 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_JSTest_0150
     * @tc.name: newPedometerSensorJsTest015
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
     it("newPedometerSensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerSensorJsTest015---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest015 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.off(sensor.SensorId.PEDOMETER,5);
                    } catch (error) {
                        console.error('newPedometerSensorJsTest015 Off fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest015 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_JSTest_0160
     * @tc.name: newPedometerSensorJsTest016
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometerSensorJsTest016--------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest016 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, (data)=>{
                            console.info("newPedometerSensorJsTest016 callback: " + JSON.stringify(data));
                            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                                sensor.SensorAccuracy.ACCURACY_HIGH) {
                                console.info('callback accuracy verified' + JSON.stringify(data));
                                expect(true).assertTrue();
                            } else {
                                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                                expect(false).assertTrue();
                            }
                            expect(typeof(data.steps)).assertEqual('number');
                            expect(typeof (data.timestamp)).assertEqual("number");
                        }, {'interval': 100000000});
                        sensor.on(sensor.SensorId.PEDOMETER, (data)=>{
                            console.info("newPedometerSensorJsTest016 callback2: " + JSON.stringify(data));
                            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                                sensor.SensorAccuracy.ACCURACY_HIGH) {
                                console.info('callback accuracy verified' + JSON.stringify(data));
                                expect(true).assertTrue();
                            } else {
                                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                                expect(false).assertTrue();
                            }
                            expect(typeof(data.steps)).assertEqual('number');
                            expect(typeof (data.timestamp)).assertEqual("number");
                        });
                        setTimeout(()=>{
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerSensorJsTest016 Off fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest016 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_JSTest_0170
     * @tc.name: newPedometerSensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometerSensorJsTest017--------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest017 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, (data)=>{
                            console.info("newPedometerSensorJsTest017 callback: " + JSON.stringify(data));
                            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                                sensor.SensorAccuracy.ACCURACY_HIGH) {
                                console.info('callback accuracy verified' + JSON.stringify(data));
                                expect(true).assertTrue();
                            } else {
                                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                                expect(false).assertTrue();
                            }
                            expect(typeof(data.steps)).assertEqual('number');
                            expect(typeof (data.timestamp)).assertEqual("number");
                        }, {'interval': -100000000});
                    } catch (error) {
                        console.error('newPedometerSensorJsTest017 On fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                        expect(error.message).assertEqual(SERVICE_EXCEPTION_MSG);
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest017 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_NEWPEDOMETER_JSTest_0180
     * @tc.name: newPedometerSensorJsTest018
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerSensorJsTest018---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest018 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback, { 'interval': undefined });
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerSensorJsTest018 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest018 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_JSTest_0190
     * @tc.name: newPedometerSensorJsTest019
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerSensorJsTest019---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest019 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback, { 'interval': undefined });
                        sensor.on(sensor.SensorId.PEDOMETER, callback2, { 'interval': undefined });
                        setTimeout(()=>{
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerSensorJsTest019 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest019 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_JSTest_0200
     * @tc.name: newPedometerSensorJsTest020
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerSensorJsTest020---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest020 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback, { 'interval': null });
                        sensor.on(sensor.SensorId.PEDOMETER, callback2, { 'interval': null });
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER, callback);
                        }, 4000);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER, callback2);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerSensorJsTest020 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest020 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_JSTest_0210
     * @tc.name: newPedometerSensorJsTest021
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometerSensorJsTest021---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest021 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback);
                        try{
                        sensor.on(sensor.SensorId.PEDOMETER, callback, undefined);
                        } catch(error){
                            console.info('newPedometerSensorJsTest021 Repeat subscription'+error);
                        }
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerSensorJsTest021 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest021 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_NEWPEDOMETER_JSTest_0220
     * @tc.name: newPedometerSensorJsTest022
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newPedometerSensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometerSensorJsTest022 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER, null);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometerSensorJsTest022 catch error:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('newPedometerSensorJsTest022 Sensor is not support'+error);
                done();
            }
    })
})}
