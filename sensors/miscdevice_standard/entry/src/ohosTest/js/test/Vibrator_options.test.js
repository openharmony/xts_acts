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
import systemVibrator from '@system.vibrator'
import deviceInfo from '@ohos.deviceInfo'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function VibratorJsTest_misc_7() {
let isAvailable;
const ABILITYJUDGMENT = canIUse('SystemCapability.Sensors.MiscDevice');
describe("VibratorJsTest_misc_7", function () {
    let EFFECT_ID = "haptic.clock.timer";
    let INVALID_EFFECT_ID = "haptic.xxx.yyy";
    beforeAll(async function (done) {
        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll called')
        console.info('VibratorJsTest_misc_7 Device type = ' + deviceInfo.deviceType);
        console.info('VibratorJsTest_misc_7 isAvailable = ' + isAvailable);
        try {
            if (deviceInfo.deviceType === '2in1' || ABILITYJUDGMENT === false) {
                isAvailable = false;
                console.info('VibratorJsTest_misc_7 isAvailable ' + isAvailable);
                done()
            }else {
                isAvailable = true;
                console.info('VibratorJsTest_misc_7 isAvailable ' + isAvailable);
                done()
            }
        } catch(error) {
            console.error('VibratorJsTest_misc_7 exception :' + JSON.stringify(error))
            done()
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
    })

    const OPERATION_FAIL_CODE = 14600101;
    const PERMISSION_ERROR_CODE = 201;
    const PARAMETER_ERROR_CODE = 401;

    const OPERATION_FAIL_MSG = 'Device operation failed.'
    const PERMISSION_ERROR_MSG = 'Permission denied.'
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    let TAG = ""
    let INVALID = -1;    
    
    /*
    * @tc.name:VibratorJsTest076
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0860
    * @tc.level:Level 0
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        TAG = "VibratorJsTest076"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.vibrate(1000, undefined).then(() => {
                console.log("VibratorJsTest076 vibrate success");
                expect(true).assertTrue();
                setTimeout(() => {
                    done();
                }, 500);
            }, (error) => {
                expect(false).assertTrue();
                console.log("VibratorJsTest076 vibrate error");
                setTimeout(() => {
                    done();
                }, 500);
            });
            await vibrator.stopVibration();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest077
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0870
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest077"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.vibrate(1000, null).then(() => {
                console.log("VibratorJsTest077 vibrate success");
                expect(true).assertTrue();
                setTimeout(() => {
                    done();
                }, 500);
            }, (error) => {
                expect(false).assertTrue();
                console.log("VibratorJsTest077 vibrate error");
                setTimeout(() => {
                    done();
                }, 500);
            });
            await vibrator.stopVibration();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest078
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0880
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest078"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.vibrate(1000, "abc").then(() => {
                console.log("VibratorJsTest078 vibrate success");
                expect(true).assertTrue();
                setTimeout(() => {
                    done();
                }, 500);
            }, (error) => {
                expect(false).assertTrue();
                console.log("VibratorJsTest078 vibrate error");
                setTimeout(() => {
                    done();
                }, 500);
            });
            await vibrator.stopVibration();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest079
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0890
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest079"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            let isSupport = false;
            function vibratePromise() {
                return new Promise((resolve, reject) => {
                    if (isSupport) {
                        vibrator.vibrate(EFFECT_ID, undefined).then(() => {
                            console.log("VibratorJsTest079 vibrate success");
                            expect(true).assertTrue();
                            setTimeout(() => {
                                done();
                            }, 500);
                        }, (error) => {
                            expect(false).assertTrue();
                            console.log("VibratorJsTest079 vibrate error");
                            setTimeout(() => {
                                done();
                            }, 500);
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
                        isSupport = state;
                        resolve();
                    }
                });
            })

            await isSupportPromise.then(() =>{
                return vibratePromise();
            }).catch((error)=>{
                expect(false).assertTrue();
            })
            try{
                await vibrator.stopVibration();
            } catch (error){
                console.log("VibratorJsTest079 vibrator.stopVibration failed："+error);
            }
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest080
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0900
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest080"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            let isSupport = false;
            function vibratePromise() {
                return new Promise((resolve, reject) => {
                    if (isSupport) {
                        vibrator.vibrate(EFFECT_ID, null).then(() => {
                            console.log("VibratorJsTest080 vibrate success");
                            expect(true).assertTrue();
                            setTimeout(() => {
                                done();
                            }, 500);
                        }, (error) => {
                            expect(false).assertTrue();
                            console.log("VibratorJsTest080 vibrate error");
                            setTimeout(() => {
                                done();
                            }, 500);
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
                        isSupport = state;
                        resolve();
                    }
                });
            })

            await isSupportPromise.then(() =>{
                return vibratePromise();
            }).catch((error)=>{
                expect(false).assertTrue();
            })
            try{
                await vibrator.stopVibration();
            } catch (error){
                console.log("VibratorJsTest079 vibrator.stopVibration failed："+error);
            }
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest081
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0910
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest081"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            let isSupport = false;
            function vibratePromise() {
                return new Promise((resolve, reject) => {
                    if (isSupport) {
                        vibrator.vibrate(EFFECT_ID, "abc").then(() => {
                            console.log("VibratorJsTest081 vibrate success");
                            expect(true).assertTrue();
                            setTimeout(() => {
                                done();
                            }, 500);
                        }, (error) => {
                            expect(false).assertTrue();
                            console.log("VibratorJsTest081 vibrate error");
                            setTimeout(() => {
                                done();
                            }, 500);
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
                        isSupport = state;
                        resolve();
                    }
                });
            })

            await isSupportPromise.then(() =>{
                return vibratePromise();
            }).catch((error)=>{
                expect(false).assertTrue();
            })
            try{
                await vibrator.stopVibration();
            } catch (error){
                console.log("VibratorJsTest079 vibrator.stopVibration failed："+error);
            }
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest082
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0920
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest082"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            systemVibrator.vibrate(undefined);
            setTimeout(() => {
                expect(true).assertTrue();
                done();
            }, 500);
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest083
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0930
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest083"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            systemVibrator.vibrate(null);
            setTimeout(() => {
                expect(true).assertTrue();
                done();
            }, 500);
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest084
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0940
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest084"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            systemVibrator.vibrate("abc");
            setTimeout(() => {
                expect(true).assertTrue();
                done();
            }, 500);
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest085
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0950
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest085"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            systemVibrator.vibrate({
                mode: undefined,
                success: function() {
                expect(true).assertTrue();
                console.log('VibratorJsTest085 vibrate is successful');
                done();
                },
                fail: undefined,
                complete: undefined
            });
            await vibrator.stopVibration();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest086
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0960
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest086"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            systemVibrator.vibrate({
                mode: null,
                success: function() {
                expect(true).assertTrue();
                console.log('VibratorJsTest086 vibrate is successful');
                done();
                },
                fail: null,
                complete: null
            });
            await vibrator.stopVibration();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest087
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0970‘
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest087"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            systemVibrator.vibrate({
                mode: 123,
                success: function() {
                expect(true).assertTrue();
                console.log('VibratorJsTest087 vibrate is successful');
                done();
                },
                fail: 123,
                complete: 123
            });
            await vibrator.stopVibration();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest088
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0980
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest088"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            let isSupport = false;
            function vibratePromise() {
                return new Promise((resolve, reject) => {
                    if (isSupport) {
                        vibrator.vibrate(EFFECT_ID).then(() => {
                            console.log("VibratorJsTest088 vibrate success");
                            expect(true).assertTrue();
                            resolve();
                        }, (error) => {
                            expect(false).assertTrue();
                            console.log("VibratorJsTest088 vibrate error");
                            reject();
                        });
                    } else {
                        resolve();
                    }
                })
            }

            function stopPromise() {
                return new Promise((resolve, reject) => {
                    if (isSupport) {
                        vibrator.stop("preset", undefined).then(() => {
                            console.log("VibratorJsTest088 off success");
                            expect(true).assertTrue();
                            setTimeout(() => {
                                resolve();
                            }, 500);
                        }, (error) => {
                            expect(false).assertTrue();
                            console.log("VibratorJsTest088 off error");
                            setTimeout(() => {
                                reject();
                            }, 500);
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
    * @tc.name:VibratorJsTest089
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0990
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest089"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            let isSupport = false;
            function vibratePromise() {
                return new Promise((resolve, reject) => {
                    if (isSupport) {
                        vibrator.vibrate(EFFECT_ID).then(() => {
                            console.log("VibratorJsTest089 vibrate success");
                            expect(true).assertTrue();
                            resolve();
                        }, (error) => {
                            expect(false).assertTrue();
                            console.log("VibratorJsTest089 vibrate error");
                            reject();
                        });
                    } else {
                        resolve();
                    }
                })
            }

            function stopPromise() {
                return new Promise((resolve, reject) => {
                    if (isSupport) {
                        vibrator.stop("preset", null).then(() => {
                            console.log("VibratorJsTest089 off success");
                            expect(true).assertTrue();
                            setTimeout(() => {
                                resolve();
                            }, 500);
                        }, (error) => {
                            expect(false).assertTrue();
                            console.log("VibratorJsTest089 off error");
                            setTimeout(() => {
                                reject();
                            }, 500);
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
    * @tc.name:VibratorJsTest090
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1000
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest090"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            let isSupport = false;
            function vibratePromise() {
                return new Promise((resolve, reject) => {
                    if (isSupport) {
                        vibrator.vibrate(EFFECT_ID).then(() => {
                            console.log("VibratorJsTest090 vibrate success");
                            expect(true).assertTrue();
                            resolve();
                        }, (error) => {
                            expect(false).assertTrue();
                            console.log("VibratorJsTest090 vibrate error");
                            reject();
                        });
                    } else {
                        resolve();
                    }
                })
            }

            function stopPromise() {
                return new Promise((resolve, reject) => {
                    if (isSupport) {
                        vibrator.stop("preset", "abc").then(() => {
                            console.log("VibratorJsTest090 off success");
                            expect(true).assertTrue();
                            setTimeout(() => {
                                resolve();
                            }, 500);
                        }, (error) => {
                            expect(false).assertTrue();
                            console.log("VibratorJsTest090 off error");
                            setTimeout(() => {
                                reject();
                            }, 500);
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
    * @tc.name:VibratorJsTest091
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1010
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest091"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                vibrator.stopVibration("").then(() => {
                    console.log("VibratorJsTest091 stop error");
                    expect(false).assertTrue();
                    setTimeout(() => {
                        done();
                    }, 500);
                }, (error) => {
                    expect(false).assertTrue();
                    console.log("VibratorJsTest091 stop error");
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
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest092
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1020
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest092"
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
                        }, (error) => {
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
                        isSupport = state;
                        resolve();
                    }
                });
            })

            await isSupportPromise.then(() => {
                return vibratePromise();
            }).then(() => {
                return stopPromise();
            }).catch((error) => {
                expect(false).assertTrue();
            })
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest093
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1030
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest093"
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
                            usage: "notification"
                        }, (error) => {
                            if (error) {
                                expect(false).assertTrue();
                                reject();
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
                        vibrator.stopVibration("preset", undefined).then(() => {
                            console.log("VibratorJsTest093 off success");
                            expect(true).assertTrue();
                            setTimeout(() => {
                                resolve();
                            }, 500);
                        }, (error) => {
                            expect(false).assertTrue();
                            console.log("VibratorJsTest093 off error");
                            setTimeout(() => {
                                reject();
                            }, 500);
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
    * @tc.name:VibratorJsTest094
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1040
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest094"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            let isSupport = false;
            function vibratePromise() {
                return new Promise((resolve, reject) => {
                    if (isSupport) {
                        vibrator.startVibration({
                            type: "preset",
                            effectId: EFFECT_ID,
                            count: 3,
                        }, {
                            usage: "notification"
                        }, (error) => {
                            if (error) {
                                expect(false).assertTrue();
                                reject();
                            } else {
                                console.log("VibratorJsTest094 vibrator success");
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
                        vibrator.stopVibration("preset", null).then(() => {
                            console.log("VibratorJsTest094 off success");
                            expect(true).assertTrue();
                            setTimeout(() => {
                                resolve();
                            }, 500);
                        }, (error) => {
                            expect(true).assertTrue();
                            console.log("VibratorJsTest094 off error");
                            setTimeout(() => {
                                reject();
                            }, 500);
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
    * @tc.name:VibratorJsTest095
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1050
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest095"
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
                        }, (error) => {
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
                vibrator.isSupportEffect(EFFECT_ID, "abc").then((state) => {
                    expect(true).assertTrue();
                    isSupport = state;
                    resolve();
                }, (error) => {
                    expect(false).assertTrue();
                    reject(error);
                });
            })

            await isSupportPromise.then(() => {
                return vibratePromise();
            }).then(() => {
                return stopPromise();
            }).catch((error) => {
                expect(false).assertTrue();
            })
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest096
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1060
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest096"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            function stopPromise() {
                return new Promise((resolve, reject) => {
                    vibrator.stopVibration(undefined).then(() => {
                        expect(true).assertTrue();
                        resolve();
                    }, (error) => {
                        expect(false).assertTrue();
                        reject(error);
                    });
                })
            }

            let promise = new Promise((resolve, reject) => {
                vibrator.vibrate(2000, (error) => {
                    if (error) {
                        expect(false).assertTrue();
                        reject(error);
                    } else {
                        expect(true).assertTrue();
                        resolve();
                    }
                });
            })

            await promise.then(() => {
                return stopPromise();
            }).catch((error) => {
                expect(false).assertTrue();
            })
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest097
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1070
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest097"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            function stopPromise() {
                return new Promise((resolve, reject) => {
                    vibrator.stopVibration(null).then(() => {
                        expect(true).assertTrue();
                        resolve();
                    }, (error) => {
                        expect(false).assertTrue();
                        reject(error);
                    });
                })
            }

            let promise = new Promise((resolve, reject) => {
                vibrator.vibrate(2000, (error) => {
                    if (error) {
                        expect(false).assertTrue();
                        reject(error);
                    } else {
                        expect(true).assertTrue();
                        resolve();
                    }
                });
            })

            await promise.then(() => {
                return stopPromise();
            }).catch((error) => {
                expect(false).assertTrue();
            })
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest098
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1080
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest098"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            function stopPromise() {
                return new Promise((resolve, reject) => {
                    vibrator.stopVibration(123).then(() => {
                        expect(true).assertTrue();
                        resolve();
                    }, (error) => {
                        expect(false).assertTrue();
                        reject(error);
                    });
                })
            }

            let promise = new Promise((resolve, reject) => {
                vibrator.vibrate(2000, (error) => {
                    if (error) {
                        expect(false).assertTrue();
                        reject(error);
                    } else {
                        expect(true).assertTrue();
                        resolve();
                    }
                });
            })

            await promise.then(() => {
                return stopPromise();
            }).catch((error) => {
                expect(false).assertTrue();
            })
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest099
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1090
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest099"
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
                        }, (error) => {
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
                vibrator.isSupportEffect(EFFECT_ID, undefined).then((state) => {
                    expect(true).assertTrue();
                    isSupport = state;
                    resolve();
                }, (error) => {
                    expect(false).assertTrue();
                    reject(error);
                });
            })

            await isSupportPromise.then(() => {
                return vibratePromise();
            }).then(() => {
                return stopPromise();
            }).catch((error) => {
                expect(false).assertTrue();
            })
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest100
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1100
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest100"
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
                        }, (error) => {
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
                vibrator.isSupportEffect(EFFECT_ID, null).then((state) => {
                    expect(true).assertTrue();
                    isSupport = state;
                    resolve();
                }, (error) => {
                    expect(false).assertTrue();
                    reject(error);
                });
            })

            await isSupportPromise.then(() => {
                return vibratePromise();
            }).then(() => {
                return stopPromise();
            }).catch((error) => {
                expect(false).assertTrue();
            })
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest101
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1110
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        TAG = "VibratorJsTest101"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            await vibrator.vibrate({
                mode: 'long',
                success: function () {
                    console.info(TAG + " success");
                },
                fail: function (data, code) {
                    console.log(TAG + " is failed, data: " + data + ", code: " + code);
                    expect(false).assertTrue();
                },
                complete: function () {
                    console.log(TAG + ' is completed');
                }
            });
            await vibrator.startVibration({
                type: "time",
                duration: 500
            }, {
                usage: "alarm"
            }, (error) => {
                if (error) {
                    console.info(TAG + " startVibration error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done()
                } else {
                    console.info(TAG + " startVibration success");
                    expect(true).assertTrue();
                }
            });        
            setTimeout(() => {
                try {
                    vibrator.stopVibrationSync();
                    console.info(TAG + " stopVibrationSync success");
                    expect(true).assertTrue();
                    done()
                } catch (error) {
                    console.info(TAG + " stopVibrationSync error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done()
                } 
            }, 200);                
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    }) 
    
    /*
    * @tc.name:VibratorJsTest102
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1120
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest102"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                expect(typeof(vibrator.isHdHapticSupported())).assertEqual("boolean");
                done()
            } catch (error) {
                console.info(TAG + " exception in, err:" + error);
                expect(true).assertEqual(false);
                done()
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest103
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1130
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest103"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                let isSupport = vibrator.isHdHapticSupported()
                expect(typeof(isSupport)).assertEqual("boolean");
                done()
            } catch (error) {
                console.info(TAG + " exception in, err:" + error);
                expect(true).assertEqual(false);
                done()
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest104
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1130
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest104"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                let isSupport = vibrator.isHdHapticSupported(INVALID)
                expect(typeof(isSupport)).assertEqual("boolean");
                done()
            } catch (error) {
                console.info(TAG + " exception in, error:" + error);
                expect(false).assertTrue();
                done()
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })
    
    /*
    * @tc.name:VibratorJsTest105
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1130
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest105"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                let isSupport = vibrator.isHdHapticSupported('xxx')
                console.info(TAG + " isSupport:" + isSupport);
                expect(typeof(isSupport)).assertEqual("boolean");
                done()
            } catch (error) {
                console.info(TAG + " exception in, err:" + error);
                expect(false).assertTrue();
                done()
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })
    
    /*
    * @tc.name:VibratorJsTest106
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1150
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest106"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                let ret = vibrator.isSupportEffectSync(INVALID_EFFECT_ID);
                console.info(TAG + " ret: " + JSON.stringify(ret));
                expect(typeof(ret)).assertEqual("boolean");
                done()
            } catch (error) {
                console.info(TAG + " isSupportEffectSync error: " + JSON.stringify(error));
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                done()
            }
            console.info(TAG + " end");
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest107
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1150
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest107"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                let ret = vibrator.isSupportEffectSync(INVALID);
                expect(typeof(ret)).assertEqual("boolean");
                done()
            } catch (error) {
                console.info(TAG + " isSupportEffectSync error: " + JSON.stringify(error));
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                done()
            }
            console.info(TAG + " end");
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })
    
    /*
    * @tc.name:VibratorJsTest108
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1160
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        TAG = "VibratorJsTest108"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                let ret = vibrator.isSupportEffectSync(EFFECT_ID);
                console.info(TAG + " isSupportEffectSync ret: " + ret);
                expect(typeof(ret)).assertEqual("boolean");
                done()
            } catch (error) {
                console.info(TAG + " isSupportEffectSync error: " + JSON.stringify(error));
                expect(false).assertTrue();
                done()
            }
            console.info(TAG + " end");
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })
    
    /*
    * @tc.name:VibratorJsTest109
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1140
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest109"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            await vibrator.startVibration({
                type: "time",
                duration: 500
            }, {
                usage: "alarm"
            }, (error) => {
                if (error) {
                    console.info(TAG + " startVibration error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done()
                } else {
                    console.info(TAG + " startVibration success");
                }
            });
            setTimeout(() => {
                try {
                    vibrator.stopVibrationSync();
                    console.info(TAG + " stopVibrationSync success");
                    done()
                } catch (error) {
                    console.info(TAG + " stopVibrationSync error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done()
                } 
            }, 200);    
            console.info(TAG + " end");
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })    
})}