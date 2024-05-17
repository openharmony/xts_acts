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
import sensor from '@system.sensor'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_29() {
describe("SensorJsTest_sensor_29", function () {
    beforeAll(function () {

        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll called')
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

    let GyroscopeId = 2

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0010
     * @tc.name: subscribeGyroscopeSensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscopeSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------subscribeGyroscopeSensorJsTest001---------------');
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscopeSensorJsTest002 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'game',
                        success: function (data) {
                            console.info("subscribeGyroscopeSensorJsTest002 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeGyroscopeSensorJsTest002 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeGyroscope();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeGyroscopeSensorJsTest002 Device does not support! ');
            done();
        }
    })

   /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0020
     * @tc.name: subscribeGyroscopeSensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscopeSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscopeSensorJsTest002 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'ui',
                        success: function (data) {
                            console.info("subscribeGyroscopeSensorJsTest002 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeGyroscopeSensorJsTest002 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeGyroscope();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeGyroscopeSensorJsTest002 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0030
     * @tc.name: subscribeGyroscopeSensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscopeSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscopeSensorJsTest003 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeGyroscopeSensorJsTest003 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeGyroscopeSensorJsTest003 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeGyroscope();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeGyroscopeSensorJsTest003 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0040
     * @tc.name: subscribeGyroscopeSensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscopeSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscopeSensorJsTest004 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeGyroscopeSensorJsTest004 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeGyroscopeSensorJsTest004 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });

                    sensor.subscribeGyroscope({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeGyroscopeSensorJsTest004_1 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeGyroscopeSensorJsTest004_1 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                    sensor.unsubscribeGyroscope();
                    done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeGyroscopeSensorJsTest004 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0050
     * @tc.name: subscribeGyroscopeSensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscopeSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscopeSensorJsTest005 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'xxx',
                        success: function (data) {
                            console.info("subscribeGyroscopeSensorJsTest005 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeGyroscopeSensorJsTest005 is failed, data: " + data + ", code: " + code);
                            expect(code).assertEqual(202);
                            done();
                        },
                    });
                }
            })
        } catch (error) {
            console.info('subscribeGyroscopeSensorJsTest005 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0060
     * @tc.name: subscribeGyroscopeSensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscopeSensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeGyroscopeSensorJsTest006---------------');
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscopeSensorJsTest006 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeGyroscopeSensorJsTest006 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                            done();
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeGyroscope();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeGyroscopeSensorJsTest006 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0070
     * @tc.name: subscribeGyroscopeSensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscopeSensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeGyroscopeSensorJsTest007---------------');
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscopeSensorJsTest008 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                            interval: 'normal',
                            success: function (data) {
                                console.info("subscribeGyroscopeSensorJsTest007 success" + JSON.stringify(data));
                                expect(typeof (data.x)).assertEqual("number");
                                expect(typeof (data.y)).assertEqual("number");
                                expect(typeof (data.z)).assertEqual("number");
                                done();
                            },
                            fail: function (data, code) {
                                console.log("subscribeGyroscopeSensorJsTest007 is failed, data: " + data + ", code: " + code);
                                expect(false).assertTrue();
                            },
                        });
                    setTimeout(() => {
                        sensor.unsubscribeGyroscope();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeGyroscopeSensorJsTest007 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0080
     * @tc.name: subscribeGyroscopeSensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscopeSensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------subscribeGyroscopeSensorJsTest008---------------');
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscopeSensorJsTest008 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'game',
                        success: function (data) {
                            console.info("subscribeGyroscopeSensorJsTest008 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                        sensor.unsubscribeGyroscope();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeGyroscopeSensorJsTest008 Device does not support! ');
            done();
        }
    })

   /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0090
     * @tc.name: subscribeGyroscopeSensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscopeSensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscopeSensorJsTest009 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'ui',
                        success: function (data) {
                            console.info("subscribeGyroscopeSensorJsTest009 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                        sensor.unsubscribeGyroscope();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeGyroscopeSensorJsTest009 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0100
     * @tc.name: subscribeGyroscopeSensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscopeSensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeGyroscopeSensorJsTest010---------------------------');
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscopeSensorJsTest010 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeGyroscopeSensorJsTest010 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                        sensor.unsubscribeGyroscope();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeGyroscopeSensorJsTest010 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0110
     * @tc.name: subscribeGyroscopeSensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscopeSensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeGyroscopeSensorJsTest011---------------------------');
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscopeSensorJsTest011 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeGyroscopeSensorJsTest011 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: undefined,
                    });

                    sensor.subscribeGyroscope({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeGyroscopeSensorJsTest011_1 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: null,
                    });
                    setTimeout(() => {
                    sensor.unsubscribeGyroscope();
                    done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeGyroscopeSensorJsTest011 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0120
     * @tc.name: subscribeGyroscopeSensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscopeSensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeGyroscopeSensorJsTest012---------------------------');
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscopeSensorJsTest012 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'xxx',
                        success: function (data) {
                            console.info("subscribeGyroscopeSensorJsTest012 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                    done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info('subscribeGyroscopeSensorJsTest012 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0130
     * @tc.name: subscribeGyroscopeSensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscopeSensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeGyroscopeSensorJsTest013---------------------------');
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscopeSensorJsTest013 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'xxx',
                        success: function (data) {
                            console.info("subscribeGyroscopeSensorJsTest013 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: null,
                    });
                    setTimeout(() => {
                    sensor.unsubscribeGyroscope();
                    done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeGyroscopeSensorJsTest013 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0140
     * @tc.name: subscribeGyroscopeSensorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscopeSensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeGyroscopeSensorJsTest014---------------------------');
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscopeSensorJsTest014 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'game',
                        success: function (data) {
                            console.info("subscribeGyroscopeSensorJsTest014 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: null,
                    });
                    setTimeout(() => {
                    sensor.unsubscribeGyroscope();
                    done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeGyroscopeSensorJsTest014 Device does not support! ');
            done();
        }
    })
})}
