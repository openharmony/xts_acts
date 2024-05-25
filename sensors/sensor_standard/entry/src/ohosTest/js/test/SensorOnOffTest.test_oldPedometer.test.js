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

export default function SensorJsTest_sensor_18() {
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
        console.info("SensorJsTest_sensor_18 userId:"+userId)
        console.info("============SensorJsTest_sensor_18 grant Permission start ============")
        var appInfo = await bundle.getApplicationInfo('ohos.acts.sensors.sensor.function', 0, userId);
        tokenID = appInfo.accessTokenId;
        console.log('SensorJsTest_sensor_18 accessTokenId:' + appInfo.accessTokenId + ', name:' + appInfo.name +
        ' ,bundleName:' + appInfo.process)
        var atManager = abilityAccessCtrl.createAtManager();
        var result = await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
        PermissionFlag.PERMISSION_SYSTEM_FIXED)
        console.info('SensorJsTest_sensor_18 successful. result: ' + JSON.stringify(result));
        console.info("============SensorJsTest_sensor_18 grant Permission end ============")
    } catch(error) {
        console.error('SensorJsTest_sensor_18 exception in, msg:' + JSON.stringify(error))
    }
}
describe("SensorJsTest_sensor_18", function () {
    function callback(data) {
        console.info("SensorJsTest_sensor_18 callback" + JSON.stringify(data));
        expect(typeof (data.steps)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        console.info("SensorJsTest_sensor_18 callback2" + JSON.stringify(data));
        expect(typeof (data.steps)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
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
                console.info('SensorJsTest_sensor_18 error:' + JSON.stringify(error));
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

    const PARAMETER_ERROR_CODE = 401
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_CODE = 14500101
    const SERVICE_EXCEPTION_MSG = 'Service exception.'
    let invalid  = -1;
    let errMessages = ['ReferenceError: string is not defined','TypeError: is not callable','ReferenceError: xxx is not defined']
    let errMessage

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_JSTest_0010
     * @tc.name: PedometerSensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------PedometerSensorJsTest001---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest001 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerSensorJsTest001 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest001 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0020
     * @tc.name: PedometerSensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerSensorJsTest002---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest002 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, 5);
                    } catch (error) {
                        console.error('PedometerSensorJsTest002 On fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest002 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0030
     * @tc.name: PedometerSensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerSensorJsTest003---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest003 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                        setTimeout(() => {
                            expect(true).assertTrue();
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerSensorJsTest003 Once fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest003 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0040
     * @tc.name: PedometerSensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerSensorJsTest004---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest004 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback, 5);
                        setTimeout(() => {
                            expect(true).assertTrue();
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerSensorJsTest004 Once fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest004 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0050
     * @tc.name: PedometerSensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerSensorJsTest005---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest005 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, 5);
                    } catch (error) {
                        console.error('PedometerSensorJsTest005 On fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest005 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0060
     * @tc.name: PedometerSensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerSensorJsTest006---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest006 getSingleSensor fail:' +JSON.stringify(error));
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
                console.error('PedometerSensorJsTest006 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0070
     * @tc.name: PedometerSensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerSensorJsTest007---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest007 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback2);
                        setTimeout(()=>{
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerSensorJsTest007 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest007 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0080
     * @tc.name: PedometerSensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerSensorJsTest008---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest008 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback2);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                        }, 4000);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback2);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerSensorJsTest008 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest008 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0090
     * @tc.name: PedometerSensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerSensorJsTest009---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest009 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback2);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerSensorJsTest009 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest009 Sensor is not support');
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0100
     * @tc.name: PedometerSensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerSensorJsTest010---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                if (error) {
                    console.error('PedometerSensorJsTest010 getSingleSensor fail:' +JSON.stringify(error));
                    done();
                } else {
                try {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                    setTimeout(() => {
                        done();
                    }, 4000);
                } catch (error) {
                    console.error('PedometerSensorJsTest010 On fail, errorCode:' +JSON.stringify(error));
                    expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                    expect(error.message).assertEqual(PERMISSION_DENIED_MSG);
                    done();
                }
                }
            });
        } catch (error) {
            console.error('PedometerSensorJsTest010 Sensor is not support');
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0110
     * @tc.name: PedometerSensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------PedometerSensorJsTest011--------');
        let errorMessage = ""
        let errorMessages = "ReferenceError: xxx is not defined"
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest011 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        function onSensorCallback(data) {
                            console.info('PedometerSensorJsTest011  on error');
                            expect(typeof (data.steps)).assertEqual("number");
                        }
                        try {
                            xxx.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, onSensorCallback);
                        } catch (error) {
                            console.info("PedometerSensorJsTest011 error:" + error);
                            errorMessage = error.toString();
                            expect(errorMessage).assertEqual(errorMessages);
                            done();
                        }
                    } catch (error) {
                        console.error('PedometerSensorJsTest011 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest011 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_JSTest_0120
     * @tc.name: PedometerSensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------PedometerSensorJsTest012--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest012 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback, {'interval': 100000000});
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerSensorJsTest012 catch error:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest012 Sensor is not support'+error);
                done();
            }
        })

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_JSTest_0130
     * @tc.name: PedometerSensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------PedometerSensorJsTest013--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest013 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback, {'interval': 100000000}, 5);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerSensorJsTest013 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest013 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_JSTest_0140
     * @tc.name: PedometerSensorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------PedometerSensorJsTest014--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest014 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        function onSensorCallback(data) {
                            console.info('PedometerSensorJsTest014 callback:'+JSON.stringify(data));
                            expect(typeof(data.steps)).assertEqual('number');
                        }
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, onSensorCallback, {'interval': 100000000});
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerSensorJsTest014 On fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest014 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_JSTest_0150
     * @tc.name: PedometerSensorJsTest015
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
     it("PedometerSensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerSensorJsTest015---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest015 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER,5);
                    } catch (error) {
                        console.error('PedometerSensorJsTest015 Off fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest015 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_JSTest_0160
     * @tc.name: PedometerSensorJsTest016
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------PedometerSensorJsTest016--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest016 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (data)=>{
                            console.info("PedometerSensorJsTest016 callback: " + JSON.stringify(data));
                            expect(typeof(data.steps)).assertEqual('number');
                            expect(typeof (data.timestamp)).assertEqual("number");
                        }, {'interval': 100000000});
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (data)=>{
                            console.info("PedometerSensorJsTest016 callback2: " + JSON.stringify(data));
                            expect(typeof(data.steps)).assertEqual('number');
                            expect(typeof (data.timestamp)).assertEqual("number");
                        });
                        setTimeout(()=>{
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerSensorJsTest016 Off fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest016 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_JSTest_0170
     * @tc.name: PedometerSensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------PedometerSensorJsTest017--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest017 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (data)=>{
                            console.info("PedometerSensorJsTest017 callback: " + JSON.stringify(data));
                            expect(typeof(data.steps)).assertEqual('number');
                            expect(typeof (data.timestamp)).assertEqual("number");
                        }, {'interval': -100000000});
                    } catch (error) {
                        console.error('PedometerSensorJsTest017 On fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                        expect(error.message).assertEqual(SERVICE_EXCEPTION_MSG);
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest017 Sensor is not support'+error);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_JSTest_0180
     * @tc.name: PedometerSensorJsTest018
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------PedometerSensorJsTest018---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest018 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback, { 'interval': undefined });
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerSensorJsTest018 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest018 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0190
     * @tc.name: PedometerSensorJsTest019
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerSensorJsTest019---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest019 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback, { 'interval': undefined });
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback2, { 'interval': undefined });
                        setTimeout(()=>{
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerSensorJsTest019 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest019 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0200
     * @tc.name: PedometerSensorJsTest020
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerSensorJsTest020---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest020 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback, { 'interval': null });
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback2, { 'interval': null });
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                        }, 4000);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback2);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerSensorJsTest020 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest020 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0210
     * @tc.name: PedometerSensorJsTest021
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerSensorJsTest021---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest021 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                        try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback, undefined);
                        } catch(error){
                            console.info('PedometerSensorJsTest021 Repeat subscription'+error);
                        }
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerSensorJsTest021 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest021 Sensor is not support');
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0220
     * @tc.name: PedometerSensorJsTest022
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerSensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('PedometerSensorJsTest022 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, null);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerSensorJsTest022 catch error:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.error('PedometerSensorJsTest022 Sensor is not support' +error);
                done();
            }
    })
})}
