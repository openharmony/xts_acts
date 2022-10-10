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

export default function VibratorJsTest_misc_3() {
describe("VibratorJsTest_misc_3", function () {
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
        console.info('afterEach caled')
		vibrator.stop("preset");
        vibrator.stop("time");
        console.info('afterEach called')
    })

    const OPERATION_FAIL_CODE = 14600101; 
    const PERMISSION_ERROR_CODE = 201;
    const PARAMETER_ERROR_CODE = 401;
    
    const OPERATION_FAIL_MSG = 'Device operation failed.'
    const PERMISSION_ERROR_MSG = 'Permission denied.'
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
	
    /*
     * @tc.name:VibratorJsTest019
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0290
     */
    it("VibratorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        vibrator.vibrate({
            type: "time",
            duration: 1000
        }, {
            usage: "unknown"
        }, (error)=>{
            if (error) {
                console.info('VibratorJsTest019 vibrator error');
                expect(false).assertTrue();
            } else {
                console.info('VibratorJsTest019 vibrator success');
                expect(true).assertTrue();
            }
            setTimeout(()=>{
                done();
            }, 500);
        });
    })

    /*
     * @tc.name:VibratorJsTest020
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0300
     */
    it("VibratorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            vibrator.vibrate({
                type: "",
                duration: 1000
            }, {
                usage: "unknown"
            }, (error)=>{
                if (error) {
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
                setTimeout(()=>{
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
     * @tc.name:VibratorJsTest021
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0310
     */
    it("VibratorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        vibrator.vibrate({
            type: "preset",
            effectId: "haptic.clock.timer",
            count: 1,
        }, {
            usage: "unknown"
        }, (error)=>{
            if (error) {
                console.info('VibratorJsTest021 vibrator error');
                expect(false).assertTrue();
            } else {
                console.info('VibratorJsTest021 vibrator success');
                expect(true).assertTrue();
            }
            setTimeout(()=>{
                done();
            }, 500);
        });
    })

    /*
     * @tc.name:VibratorJsTest022
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0320
     */
    it("VibratorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            vibrator.vibrate({
                type: "preset",
                effectId: "",
                count: 3,
            }, {
                usage: "unknown"
            }, (error)=>{
                if (error) {
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
                setTimeout(()=>{
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
     * @tc.name:VibratorJsTest023
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0330
     */
    it("VibratorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            vibrator.vibrate({
                type: "preset",
                effectId: "haptic.clock.timer",
                count: 3,
            }, {
                usage: ""
            }, (error)=>{
                if (error) {
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
                setTimeout(()=>{
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
     * @tc.name:VibratorJsTest024
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0340
     */
    it("VibratorJsTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            vibrator.vibrate(null, null);
        } catch (error) {
            console.info(error);
            expect(true).assertTrue();
            done();
        }
    })

    /*
     * @tc.name:VibratorJsTest025
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0350
     */
    it("VibratorJsTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        await vibrator.vibrate({
            type: "time",
            duration: 1000,
        }, {
            usage: "unknown"
        }).then(()=>{
            expect(true).assertTrue();
        }).catch((error)=>{
            expect(false).assertTrue();
        });
        done();
    })

    /*
     * @tc.name:VibratorJsTest026
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0360
     */
    it("VibratorJsTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            await vibrator.vibrate({
                type: "",
                duration: 1000
            }, {
                usage: "unknown"
            }).then(()=>{
                expect(false).assertTrue();
            }).catch((error)=>{
                expect(true).assertTrue();
            });
            done();
        } catch (error) {
            console.info(error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.name:VibratorJsTest027
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0370
     */
    it("VibratorJsTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        await vibrator.vibrate({
            type: "preset",
            effectId: "haptic.clock.timer",
            count: 1,
        }, {
            usage: "unknown"
        }).then(()=>{
            expect(true).assertTrue();
        }).catch((error)=>{
            expect(false).assertTrue();
        });
        done();
    })

    /*
     * @tc.name:VibratorJsTest028
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0380
     */
    it("VibratorJsTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            vibrator.vibrate({
                type: "preset",
                effectId: "",
                count: 3,
            }, {
                usage: "unknown"
            }).then(()=>{
                expect(false).assertTrue();
                done();
            }).catch((error)=>{
                expect(true).assertTrue();
                done();
            });
        } catch (error) {
            console.info(error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.name:VibratorJsTest029
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0390
     */
    it("VibratorJsTest029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            vibrator.vibrate({
                type: "preset",
                effectId: "haptic.clock.timer",
                count: 3,
            }, {
                usage: ""
            }).then(()=>{
                expect(false).assertTrue();
                done();
            }).catch((error)=>{
                expect(true).assertTrue();
                done();
            });
        } catch (error) {
            console.info(error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.name:VibratorJsTest030
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0400
     */
    it("VibratorJsTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            vibrator.vibrate({
                type: 1,
                count: 3,
            }, {
                usage: ""
            })
        } catch (error) {
            console.info(error);
            expect(true).assertTrue();
            done();
        }
    })

    /*
     * @tc.name:VibratorJsTest031
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0410
     */
    it("VibratorJsTest031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function vibratePromise() {
            return new Promise((resolve, reject) => {
                vibrator.vibrate({
                    type: "time",
                    duration: 100
                }, {
                    usage: "unknown"
                }, (error)=>{
                    if (error) {
                        expect(false).assertTrue();
                    } else {
                        expect(true).assertTrue();
                    }
                    setTimeout(()=>{
                        done();
                    }, 500);
                });
            })
        }

        let promise = new Promise((resolve, reject) => {
            vibrator.vibrate({
                type: "time",
                duration: 100
            }, {
                usage: "unknown"
            }, (error)=>{
                if (error) {
                    expect(false).assertTrue();
                    reject();
                } else {
                    expect(true).assertTrue();
                    resolve();
                }
            });
        })

        await promise.then(() =>{
            return vibratePromise();
        }, ()=>{
            console.info("VibratorJsTest031 reject");
        })
        done();
    })

    /*
     * @tc.name:VibratorJsTest032
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0420
     */
    it("VibratorJsTest032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function vibratePromise() {
            return new Promise((resolve, reject) => {
                vibrator.vibrate({
                    type: "preset",
                    effectId: "haptic.clock.timer",
                    count: 1,
                }, {
                    usage: "unknown"
                }, (error)=>{
                    if (error) {
                        expect(true).assertTrue();
                    } else {
                        expect(false).assertTrue();
                    }
                    setTimeout(()=>{
                        done();
                    }, 500);
                });
            })
        }

        let promise = new Promise((resolve, reject) => {
            vibrator.vibrate({
                type: "time",
                duration: 100
            }, {
                usage: "alarm"
            }, (error)=>{
                if (error) {
                    expect(false).assertTrue();
                    reject();
                } else {
                    expect(true).assertTrue();
                    resolve();
                }
            });
        })

        await promise.then(() =>{
            return vibratePromise();
        }, ()=>{
            console.info("VibratorJsTest032 reject");
        })
        done();
    })

    /*
     * @tc.name:VibratorJsTest033
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0430
     */
    it("VibratorJsTest033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function vibratePromise() {
            return new Promise((resolve, reject) => {
                vibrator.vibrate({
                    type: "preset",
                    effectId: "haptic.clock.timer",
                    count: 3,
                }, {
                    usage: "unknown",
                }, (error)=>{
                    if (error) {
                        console.info("VibratorJsTest033 success");
                        expect(false).assertTrue();
                    } else {
                        expect(true).assertTrue();
                    }
                    setTimeout(()=>{
                        done();
                    }, 500);
                });
            })
        }

        let promise = new Promise((resolve, reject) => {
            vibrator.vibrate({
                type: "time",
                duration: 10000
            }, {
                usage: "alarm"
            }, (error)=>{
                if (error) {
                    expect(false).assertTrue();
                    reject();
                } else {
                    expect(true).assertTrue();
                    resolve();
                }
            });
        })
        await promise.then(() =>{
            return vibratePromise();
        }, ()=>{
            console.info("VibratorJsTest033 reject");
        })
        done();
    })

    /*
     * @tc.name:VibratorJsTest034
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0440
     */
    it("VibratorJsTest034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function vibratePromise() {
            return new Promise((resolve, reject) => {
                vibrator.vibrate({
                    type: "preset",
                    effectId: "haptic.clock.timer",
                    count: 1,
                }, {
                    usage: "unknown",
                }, (error)=>{
                    if (error) {
                        expect(true).assertTrue();
                    } else {
                        expect(false).assertTrue();
                    }
                    setTimeout(()=>{
                        done();
                    }, 500);
                });
            })
        }

        let promise = new Promise((resolve, reject) => {
            vibrator.vibrate({
                type: "preset",
                effectId: "haptic.clock.timer",
                count: 3,
            }, {
                usage: "unknown",
            }, (error)=>{
                if (error) {
                    expect(false).assertTrue();
                    reject();
                } else {
                    expect(true).assertTrue();
                    resolve();
                }
            });
        })

        await promise.then(() =>{
            return vibratePromise();
        }, ()=>{
            console.info("VibratorJsTest034 reject");
        })
        done();
    })

    /*
     * @tc.name:VibratorJsTest035
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0450
     */
    it("VibratorJsTest035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function vibratePromise() {
            return new Promise((resolve, reject) => {
                vibrator.vibrate({
                    type: "time",
                    duration: 3000,
                }, {
                    usage: "alarm"
                }, (error)=>{
                    if (error) {
                        expect(true).assertTrue();
                    } else {
                        expect(false).assertTrue();
                    }
                    setTimeout(()=>{
                        done();
                    }, 500);
                });
            })
        }

        let promise = new Promise((resolve, reject) => {
            vibrator.vibrate({
                type: "preset",
                effectId: "haptic.clock.timer",
                count: 3,
            }, {
                usage: "unknown"
            }, (error)=>{
                if (error) {
                    expect(false).assertTrue();
                    reject();
                } else {
                    expect(true).assertTrue();
                    resolve();
                }
            });
        })

        await promise.then(() =>{
            return vibratePromise();
        }, ()=>{
            console.info("VibratorJsTest035 reject");
        })
        done();
    })

    /*
     * @tc.name:VibratorJsTest036
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0460
     */
    it("VibratorJsTest036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function vibratePromise() {
            return new Promise((resolve, reject) => {
                vibrator.vibrate({
                    type: "time",
                    duration: 3000,
                }, {
                    usage: "alarm"
                }, (error)=>{
                    if (error) {
                        expect(false).assertTrue();
                    } else {
                        expect(true).assertTrue();
                    }
                    setTimeout(()=>{
                        done();
                    }, 500);
                });
            })
        }

        let promise = new Promise((resolve, reject) => {
            vibrator.vibrate({
                type: "preset",
                effectId: "haptic.clock.timer",
                count: 1,
            }, {
                usage: "unknown"
            }, (error)=>{
                if (error) {
                    expect(false).assertTrue();
                    reject();
                } else {
                    expect(true).assertTrue();
                    resolve();
                }
            });
        })

        await promise.then(() =>{
            return vibratePromise();
        }, ()=>{
            console.info("VibratorJsTest036 reject");
        })
        done();
    })

    /*
     * @tc.name:VibratorJsTest037
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0470
     */
    it("VibratorJsTest037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function vibratePromise() {
            return new Promise((resolve, reject) => {
                vibrator.vibrate({
                    type: "preset",
                    effectId: "haptic.clock.timer",
                    count: 3,
                }, {
                    usage: "unknown"
                }, (error)=>{
                    if (error) {
                        expect(false).assertTrue();
                    } else {
                        expect(true).assertTrue();
                    }
                    setTimeout(()=>{
                        done();
                    }, 500);
                });
            })
        }

        let promise = new Promise((resolve, reject) => {
            vibrator.vibrate({
                type: "preset",
                effectId: "haptic.clock.timer",
                count: 3,
            }, {
                usage: "unknown"
            }, (error)=>{
                if (error) {
                    expect(false).assertTrue();
                    reject();
                } else {
                    expect(true).assertTrue();
                    resolve();
                }
            });
        })

        await promise.then(() =>{
            return vibratePromise();
        }, ()=>{
            console.info("VibratorJsTest037 reject");
        })
        done();
    })

    /*
     * @tc.name:VibratorJsTest038
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0480
     */
    it("VibratorJsTest038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function vibratePromise() {
            return new Promise((resolve, reject) => {
                vibrator.vibrate({
                    type: "preset",
                    effectId: "haptic.clock.timer",
                    count: 1,
                }, {
                    usage: "ring"
                }, (error)=>{
                    if (error) {
                        expect(false).assertTrue();
                    } else {
                        expect(true).assertTrue();
                    }
                    setTimeout(()=>{
                        done();
                    }, 500);
                });
            })
        }

        let promise = new Promise((resolve, reject) => {
            vibrator.vibrate({
                type: "preset",
                effectId: "haptic.clock.timer",
                count: 1,
            }, {
                usage: "notification"
            }, (error)=>{
                if (error) {
                    expect(false).assertTrue();
                    reject();
                } else {
                    expect(true).assertTrue();
                    resolve();
                }
            });
        })

        await promise.then(() =>{
            return vibratePromise();
        }, ()=>{
            console.info("VibratorJsTest038 reject");
        })
        done();
    })

    /*
     * @tc.name:VibratorJsTest039
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0490
     */
    it("VibratorJsTest039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function vibratePromise() {
            return new Promise((resolve, reject) => {
                vibrator.vibrate({
                    type: "preset",
                    effectId: "haptic.clock.timer",
                    count: 1,
                }, {
                    usage: "unknown"
                }, (error)=>{
                    if (error) {
                        expect(true).assertTrue();
                    } else {
                        expect(false).assertTrue();
                    }
                    setTimeout(()=>{
                        done();
                    }, 500);
                });
            })
        }

        let promise = new Promise((resolve, reject) => {
            vibrator.vibrate({
                type: "preset",
                effectId: "haptic.clock.timer",
                count: 1,
            }, {
                usage: "notification"
            }, (error)=>{
                if (error) {
                    expect(false).assertTrue();
                    reject();
                } else {
                    expect(true).assertTrue();
                    resolve();
                }
            });
        })

        await promise.then(() =>{
            return vibratePromise();
        }, ()=>{
            console.info("VibratorJsTest039 reject");
        })
        done();
    })
	    /*
     * @tc.name:VibratorJsTest040
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0500
     */
    it("VibratorJsTest040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        vibrator.vibrate({
            type: "time",
            duration: 1000
        }, {
			id:0,
            usage: "unknown"
        }, (error)=>{
            if (error) {
                console.info('VibratorJsTest040 vibrator error');
                expect(false).assertTrue();
            } else {
                console.info('VibratorJsTest040 vibrator success');
                expect(true).assertTrue();
            }
            setTimeout(()=>{
                done();
            }, 500);
        });
    })

    /*
     * @tc.name:VibratorJsTest041
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0510
     */
    it("VibratorJsTest041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            vibrator.vibrate({
                type: "",
                duration: 1000
            }, {
                id:1,
                usage: "unknown"
            }, (error)=>{
                if (error) {
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
                setTimeout(()=>{
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
     * @tc.name:VibratorJsTest042
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0520
     */
    it("VibratorJsTest042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        vibrator.vibrate({
            type: "preset",
            effectId: "haptic.clock.timer",
            count: 1,
        }, {
			id:"xxx",
            usage: "unknown"
        }, (error)=>{
            if (error) {
                console.info('VibratorJsTest042 vibrator error');
                expect(false).assertTrue();
            } else {
                console.info('VibratorJsTest042 vibrator success');
                expect(true).assertTrue();
            }
            setTimeout(()=>{
                done();
            }, 500);
        });
    })

    /*
     * @tc.name:VibratorJsTest043
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0530
     */
    it("VibratorJsTest043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            vibrator.vibrate({
                type: "preset",
                effectId: "",
                count: 3,
            }, {
                id:null,
                usage: "unknown"
            }, (error)=>{
                if (error) {
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
                setTimeout(()=>{
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
    })
	}
