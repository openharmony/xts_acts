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
import vibrator from '@ohos.vibrator'
import deviceInfo from '@ohos.deviceInfo'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function VibratorJsTest_misc_6() {
let isAvailable; 
const ABILITYJUDGMENT = canIUse('SystemCapability.Sensors.MiscDevice');       
describe("VibratorJsTest_misc_6", function () {
    var g_execute = true;
    let EFFECT_ID = "haptic.clock.timer";
    let INVALID_EFFECT_ID = "xxx";
    beforeAll(async function (done) {
        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll called')   
        console.info('VibratorJsTest_misc_6 Device type = ' + deviceInfo.deviceType);    
        console.info('VibratorJsTest_misc_6 isAvailable = ' + isAvailable);    
        try {
            if (deviceInfo.deviceType === '2in1' || ABILITYJUDGMENT === false) {
                isAvailable = false;
                console.info('VibratorJsTest_misc_6 isAvailable ' + isAvailable);
                done() 
            }else {
                isAvailable = true;
                console.info('VibratorJsTest_misc_6 isAvailable ' + isAvailable);
                done() 
            }
        } catch(error) {
            console.error('VibratorJsTest_misc_6 exception :' + JSON.stringify(error))
            done() 
        }        
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

    const OPERATION_FAIL_CODE = 14600101;
    const PERMISSION_ERROR_CODE = 201;
    const PARAMETER_ERROR_CODE = 401;

    const OPERATION_FAIL_MSG = 'Device operation failed.'
    const PERMISSION_ERROR_MSG = 'Permission denied.'
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    let TAG = ""

    /*
     * @tc.name:VibratorJsTest069
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0790
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("VibratorJsTest069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        TAG = "VibratorJsTest069"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.isSupportEffect(INVALID_EFFECT_ID, (error, state) => {
                if (error) {
                    console.info('VibratorJsTest069 error');
                    expect(false).assertTrue();
                } else {
                    console.info('VibratorJsTest069 success');
                    expect(!state).assertTrue();
                    done();
                }
            });
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:VibratorJsTest070
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0800
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("VibratorJsTest070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest070"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            let isSupport = false;
            function vibratePromise() {
                return new Promise((resolve, reject) => {
                    if (isSupport) {
                        vibrator.startVibration({
                            type: "preset",
                            effectId: EFFECT_ID,
                            count: 1,
                        }, {
                            usage: "unknown"
                        }, (error)=>{
                            if (error) {
                                expect(false).assertTrue();
                                reject(error);
                            } else {
                                expect(true).assertTrue();
                                resolve();
                            }
                        });
                    } else {
                        resolve();
                    }
                })
            }

            function stopPromise() {
                return new Promise((resolve, reject) => {
                    if (isSupport) {
                        vibrator.stopVibration((error) => {
                            if (error) {
                                expect(false).assertTrue();
                                reject(error);
                            } else {
                                expect(true).assertTrue();
                                resolve();
                            }
                        });
                    } else {
                        resolve();
                    }
                })
            }

            let isSupportPromise = new Promise((resolve, reject) => {
                vibrator.isSupportEffect(EFFECT_ID, (error, state) => {
                    if (error) {
                        expect(false).assertTrue();
                        reject(error);
                    } else {
                        expect(true).assertTrue();
                        isSupport = state;
                        resolve();
                    }
                });
            })

            await isSupportPromise.then(() =>{
                return vibratePromise();
            }).then(() =>{
                return stopPromise();
            }).catch((error)=>{
                expect(false).assertTrue();
            })
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:VibratorJsTest071
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0810
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("VibratorJsTest071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest071"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                vibrator.isSupportEffect(123, (error, state) => {
                    if(error){
                        console.info("VibratorJsTest071 error");
                        done();
                    }
                    console.info("VibratorJsTest071 should not in this method");
                    expect(false).assertTrue();
                    done();
                });
            } catch (error) {
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:VibratorJsTest072
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0820
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("VibratorJsTest072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest072"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                vibrator.isSupportEffect();
            } catch (error) {
                console.info("VibratorJsTest072 error in ：" + error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:VibratorJsTest073
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0830
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("VibratorJsTest073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest073"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
        let isSupport = false;
            function vibratePromise() {
                return new Promise((resolve, reject) => {
                    if (isSupport) {
                        vibrator.startVibration({
                            type: "preset",
                            effectId: EFFECT_ID,
                            count: 1,
                        }, {
                            usage: "unknown"
                        }, (error)=>{
                            if (error) {
                                expect(false).assertTrue();
                                reject(error);
                            } else {
                                expect(true).assertTrue();
                                resolve();
                            }
                        });
                    } else {
                        resolve();
                    }
                })
            }

            function stopPromise() {
                return new Promise((resolve, reject) => {
                    if (isSupport) {
                        vibrator.stopVibration((error) => {
                            if (error) {
                                expect(false).assertTrue();
                                reject(error);
                            } else {
                                expect(true).assertTrue();
                                resolve();
                            }
                        });
                    } else {
                        resolve();
                    }
                })
            }

            let isSupportPromise = new Promise((resolve, reject) => {
                vibrator.isSupportEffect(EFFECT_ID).then((state) => {
                    expect(true).assertTrue();
                    isSupport = state;
                    resolve();
                }, (error) => {
                    expect(false).assertTrue();
                    reject(error);
                });
            })

            await isSupportPromise.then(() =>{
                return vibratePromise();
            }).then(() =>{
                return stopPromise();
            }).catch((error)=>{
                expect(false).assertTrue();
            })
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:VibratorJsTest074
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0840
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("VibratorJsTest074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest074"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                vibrator.isSupportEffect(123).then((state) => {
                    expect(false).assertTrue();
                    done();
                }, (error) => {
                    expect(false).assertTrue();
                    done();
                });
            } catch (error) {
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:VibratorJsTest075
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0850
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("VibratorJsTest075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest075"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                vibrator.isSupportEffect().then((state) => {
                    expect(false).assertTrue();
                }, (error) => {
                    expect(true).assertTrue();
                    done()
                });
            } catch (error) {
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
     * @tc.name:VibratorJsTest076
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0830
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("VibratorJsTest076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest076"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            await vibrator.isSupportEffect(INVALID_EFFECT_ID).then((state) => {
                expect(!state).assertTrue();
            }, (error) => {
                expect(false).assertTrue();
            });
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })
    })}
