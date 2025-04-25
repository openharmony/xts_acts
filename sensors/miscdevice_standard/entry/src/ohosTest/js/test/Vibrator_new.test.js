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
import vibrator from '@ohos.vibrator'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function VibratorJsTest_misc_4() {
describe("VibratorJsTest_misc_4", function () {
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
        console.info('afterEach called')
    })

    const OPERATION_FAIL_CODE = 14600101; 
    const PERMISSION_ERROR_CODE = 201;
    const PARAMETER_ERROR_CODE = 401;
    
    const OPERATION_FAIL_MSG = 'Device operation failed.'
    const PERMISSION_ERROR_MSG = 'Permission denied.'
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'

    /*
     * @tc.name:VibratorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0010
     */
    it("VibratorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        function vibrateCallback(error) {
            if (error) {
                console.info('VibratorJsTest001  vibrator error');
                expect(false).assertTrue();
            } else {
                console.info('VibratorJsTest001  vibrator success');
                expect(true).assertTrue();
            }
            setTimeout(() => {
                done();
            }, 500);
        }
        vibrator.vibrate(10, vibrateCallback);
        await vibrator.stopVibration();
    })

    /*
     * @tc.name:VibratorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0020
     */
    it("VibratorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function vibrateCallback(error) {
            if (error) {
                console.info('VibratorJsTest002  vibrator success');
                expect(true).assertTrue();
            } else {
                console.info('VibratorJsTest002  vibrator error');
                expect(false).assertTrue();
            }
            setTimeout(() => {
                done();
            }, 500);
        }
        vibrator.vibrate(-1, vibrateCallback);
    })

    /*
     * @tc.name:VibratorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0030
     */
    it("VibratorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function vibrateCallback(error) {
            if (error) {
                console.info('VibratorJsTest003  vibrator success');
                expect(true).assertTrue();
            } else {
                console.info('VibratorJsTest003  vibrator error');
                expect(false).assertTrue();
            }
            setTimeout(() => {
                done();
            }, 500);
        }
        vibrator.vibrate(1800000 + 1, vibrateCallback);
    })

    /*
     * @tc.name:VibratorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0040
     */
    it("VibratorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function vibrateCallback(error) {
            if (error) {
                console.info('VibratorJsTest004  vibrator error');
                expect(false).assertTrue();
            } else {
                console.info('VibratorJsTest004  vibrator success');
                expect(true).assertTrue();
            }
            setTimeout(() => {
                done();
            }, 500);
        }
        vibrator.vibrate(1800000, vibrateCallback);
        await vibrator.stopVibration();
    })

    /*
     * @tc.name:VibratorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0050
     */
    it("VibratorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function vibrateCallback(error) {
            if (error) {
                console.info('VibratorJsTest005  vibrator success');
                expect(true).assertTrue();
            } else {
                console.info('VibratorJsTest005  vibrator error');
                expect(false).assertTrue();
            }
            setTimeout(() => {
                done();
            }, 500);
        }
        vibrator.vibrate("", vibrateCallback);
    })

    /*
     * @tc.name:VibratorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0060
     */
    it("VibratorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function vibrateCallback(error) {
            if (error) {
                console.info('VibratorJsTest006  vibrator success');
                expect(true).assertTrue();
            } else {
                console.info('VibratorJsTest006  vibrator error');
                expect(false).assertTrue();
            }
            setTimeout(() => {
                done();
            }, 500);
        }
        vibrator.vibrate("xxx", vibrateCallback);
    })

    /*
     * @tc.name:VibratorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0070
     */
    it("VibratorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function vibrateCallback(error) {
            if (error) {
                console.info('VibratorJsTest007  vibrator error');
                expect(false).assertTrue();
            } else {
                console.info('VibratorJsTest007  vibrator success');
                expect(true).assertTrue();
            }
            setTimeout(() => {
                done();
            }, 500);
        }
        vibrator.vibrate("haptic.clock.timer", vibrateCallback);
        await vibrator.stopVibration();
    })

    /*
     * @tc.name:VibratorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0080
     */
    it("VibratorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function vibrateCallback(error) {
            if (error) {
                console.info('VibratorJsTest008  stop error');
                expect(true).assertTrue();
            } else {
                console.info('VibratorJsTest008  stop success');
                expect(false).assertTrue();
            }
            setTimeout(() => {
                done();
            }, 500);
        }
        vibrator.stop(vibrator.VibratorStopMode.VIBRATOR_STOP_MODE_PRESET, vibrateCallback);
    })

    /*
     * @tc.name:VibratorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0090
     */
    it("VibratorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------VibratorJsTest001---------------------------');
        function stopPromise() {
            return new Promise((resolve, reject) => {
                vibrator.stop("time", (error) => {
                    if (error) {
                        console.info('VibratorJsTest009  stop error');
                        expect(false).assertTrue();
                        setTimeout((err) => {
                            reject(err);
                        }, 500);
                    } else {
                        console.info('VibratorJsTest009  stop success');
                        expect(true).assertTrue();
                        setTimeout(() => {
                            resolve();
                        }, 500);
                    }
                });
            })
        }

        let promise = new Promise((resolve, reject) => {
            vibrator.vibrate(180000, (error) => {
                if (error) {
                    console.info('VibratorJsTest009  vibrate error');
                    expect(false).assertTrue();
                    setTimeout((err) => {
                        reject(err);
                    }, 500);
                } else {
                    console.info('VibratorJsTest009  vibrate success');
                    expect(true).assertTrue();
                    setTimeout(() => {
                        resolve();
                    }, 500);
                }
            });
        })

        await promise.then(() => {
            return stopPromise();
        }, () => {
            console.info("VibratorJsTest009 reject");
        })
        done();
    })

    /*
     * @tc.name:VibratorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0100
     */
    it("VibratorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            function vibrateCallback(error) {
                if (error) {
                    console.info('VibratorJsTest010  stop success');
                    expect(true).assertTrue();
                } else {
                    console.info('VibratorJsTest010  stop off');
                    expect(false).assertTrue();
                }
                setTimeout(() => {
                    done();
                }, 500);
            }
            vibrator.stop("", vibrateCallback);
        } catch (error) {
            console.info(error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.name:VibratorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0110
     */
    it("VibratorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        vibrator.vibrate(1000).then(() => {
            console.log("VibratorJsTest011  vibrate success");
            expect(true).assertTrue();
            setTimeout(() => {
                done();
            }, 500);
        }, (error) => {
            expect(false).assertTrue();
            console.log("VibratorJsTest011  vibrate error");
            setTimeout(() => {
                done();
            }, 500);
        });
        await vibrator.stopVibration();
    })

    /*
     * @tc.name:VibratorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0120
     */
    it("VibratorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        vibrator.vibrate(-1).then(() => {
            console.log("VibratorJsTest012  vibrate error");
            expect(false).assertTrue();
            setTimeout(() => {
                done();
            }, 500);
        }, (error) => {
            expect(true).assertTrue();
            console.log("VibratorJsTest012  vibrate success");
            setTimeout(() => {
                done();
            }, 500);
        });
    })

    /*
     * @tc.name:VibratorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0130
     */
    it("VibratorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        vibrator.vibrate(1800000 + 1).then(() => {
            console.log("VibratorJsTest013  vibrate error");
            expect(false).assertTrue();
            setTimeout(() => {
                done();
            }, 500);
        }, (error) => {
            expect(true).assertTrue();
            console.log("VibratorJsTest013  vibrate success");
            setTimeout(() => {
                done();
            }, 500);
        });
    })

    /*
     * @tc.name:VibratorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0140
     */
    it("VibratorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        vibrator.vibrate(vibrator.EffectId.EFFECT_CLOCK_TIMER).then(() => {
            console.log("VibratorJsTest014  vibrate success");
            expect(true).assertTrue();
            setTimeout(() => {
                done();
            }, 500);
        }, (error) => {
            expect(false).assertTrue();
            console.log("VibratorJsTest014  vibrate error");
            setTimeout(() => {
                done();
            }, 500);
        });
        await vibrator.stopVibration();
    })

    /*
     * @tc.name:VibratorJsTest015
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0150
     */
	   it("VibratorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        vibrator.stop("preset").then(() => {
            console.log("VibratorJsTest015  off success");
            expect(false).assertTrue();
            setTimeout(() => {
                done();
            }, 500);
        }, (error) => {
            expect(true).assertTrue();
            console.log("VibratorJsTest015  off error");
            setTimeout(() => {
                done();
            }, 500);
        });
    })

    /*
     * @tc.name:VibratorJsTest016
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0160
     */
    it("VibratorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            vibrator.stop("").then(() => {
                console.log("VibratorJsTest016  stop error");
                expect(false).assertTrue();
                setTimeout(() => {
                    done();
                }, 500);
            }, (error) => {
                expect(true).assertTrue();
                console.log("VibratorJsTest016  stop success");
                setTimeout(() => {
                    done();
                }, 500);
            });
        } catch (error) {
            console.info(error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.name:VibratorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0170
     */
    it("VibratorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        vibrator.vibrate("").then(() => {
            console.log("VibratorJsTest017  vibrate error");
            expect(false).assertTrue();
            setTimeout(() => {
                done();
            }, 500);
        }, (error) => {
            expect(true).assertTrue();
            console.log("VibratorJsTest017  vibrate success");
            setTimeout(() => {
                done();
            }, 500);
        });
    })

    /*
     * @tc.name:VibratorJsTest018
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0180
     */
    it("VibratorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function stopPromise() {
            return new Promise((resolve, reject) => {
                vibrator.stop(vibrator.VibratorStopMode.VIBRATOR_STOP_MODE_TIME).then(() => {
                    console.log("VibratorJsTest018  stop success");
                    expect(true).assertTrue();
                    setTimeout(() => {
                        resolve();
                    }, 500);
                }, (error) => {
                    expect(false).assertTrue();
                    console.log("VibratorJsTest018  stop error");
                    setTimeout((err) => {
                        reject(err);
                    }, 500);
                });
            })
        }

        let promise = new Promise((resolve, reject) => {
            vibrator.vibrate(180000).then(() => {
                console.log("VibratorJsTest018  vibrate success");
                expect(true).assertTrue();
                setTimeout(() => {
                    resolve();
                }, 500);
            }, (error) => {
                expect(false).assertTrue();
                console.log("VibratorJsTest018  vibrate error");
                setTimeout((err) => {
                    reject(err);
                }, 500);
            });
        })

        await promise.then(() => {
            return stopPromise();
        }, () => {
            console.info("VibratorJsTest018 reject");
        })
        done();
    })
})
}
