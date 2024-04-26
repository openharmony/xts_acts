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

export default function SensorJsTest_sensor_31() {
describe("SensorJsTest_sensor_31", function () {
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

    let LightId = 5

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeLight_JSTest_0010
     * @tc.name: subscribeLightSensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLightSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLightSensorJsTest001 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'game',
                        success: function (data) {
                            console.info("subscribeLightSensorJsTest001 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeLightSensorJsTest001 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeLight();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeLightSensorJsTest001 Device does not support! ');
            done();
        }
    })

   /*
     * @tc.number:SUB_SensorsSystem_SubscribeLight_JSTest_0020
     * @tc.name: subscribeLightSensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLightSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLightSensorJsTest002 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'ui',
                        success: function (data) {
                            console.info("subscribeLightSensorJsTest002 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeLightSensorJsTest002 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeLight();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeLightSensorJsTest002 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeLight_JSTest_0030
     * @tc.name: subscribeLightSensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLightSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeLightSensorJsTest003---------------------------');
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLightSensorJsTest003 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeLightSensorJsTest003 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeLightSensorJsTest003 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeLight();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeLightSensorJsTest003 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeLight_JSTest_0040
     * @tc.name: subscribeLightSensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLightSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLightSensorJsTest004 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeLightSensorJsTest004 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeLightSensorJsTest004 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });

                    sensor.subscribeLight({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeLightSensorJsTest004_1 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeLightSensorJsTest004_1 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                    sensor.unsubscribeLight();
                    done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeLightSensorJsTest004 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeLight_JSTest_0050
     * @tc.name: subscribeLightSensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLightSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLightSensorJsTest005 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'xxx',
                        success: function (data) {
                            console.info("subscribeLightSensorJsTest005 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                            done();
                        },
                        fail: function (data, code) {
                            console.log("subscribeLightSensorJsTest005 is failed, data: " + data + ", code: " + code);
                            expect(code).assertEqual(202);
                            done();
                        },
                    });
                }
            })
        } catch (error) {
            console.info('subscribeLightSensorJsTest005 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeLight_JSTest_0060
     * @tc.name: subscribeLightSensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLightSensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLightSensorJsTest006 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeLightSensorJsTest006 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                            done();
                        },
                    });
                }
            })
        } catch (error) {
            console.info('subscribeLightSensorJsTest006 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeLight_JSTest_0070
     * @tc.name: subscribeLightSensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLightSensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeLightSensorJsTest007---------------------------');
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLightSensorJsTest007 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'game',
                        success: function (data) {
                            console.info("subscribeLightSensorJsTest007 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                        },
                        fail: null,
                    });
                    setTimeout(() => {
                    sensor.unsubscribeLight();
                    done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeLightSensorJsTest007 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeLight_JSTest_0080
     * @tc.name: subscribeLightSensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLightSensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeLightSensorJsTest008---------------');
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLightSensorJsTest008 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'game',
                        success: function (data) {
                            console.info("subscribeLightSensorJsTest008 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                        sensor.unsubscribeLight();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeLightSensorJsTest008 Device does not support! ');
            done();
        }
    })

   /*
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0090
     * @tc.name: subscribeLightSensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLightSensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLightSensorJsTest009 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'ui',
                        success: function (data) {
                            console.info("subscribeLightSensorJsTest009 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                        sensor.unsubscribeLight();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeLightSensorJsTest009 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0100
     * @tc.name: subscribeLightSensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLightSensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeLightSensorJsTest010---------------------------');
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLightSensorJsTest010 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeLightSensorJsTest010 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                        sensor.unsubscribeLight();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeLightSensorJsTest010 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0110
     * @tc.name: subscribeLightSensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLightSensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeLightSensorJsTest011---------------------------');
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLightSensorJsTest011 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeLightSensorJsTest011 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                        },
                        fail: undefined,
                    });

                    sensor.subscribeLight({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeLightSensorJsTest011_1 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                        },
                        fail: null,
                    });
                    setTimeout(() => {
                    sensor.unsubscribeLight();
                    done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeLightSensorJsTest011 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0120
     * @tc.name: subscribeLightSensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLightSensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeLightSensorJsTest012---------------------------');
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLightSensorJsTest012 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'xxx',
                        success: function (data) {
                            console.info("subscribeLightSensorJsTest012 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                    done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info('subscribeLightSensorJsTest012 Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0130
     * @tc.name: subscribeLightSensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLightSensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeLightSensorJsTest013---------------------------');
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLightSensorJsTest013 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'xxx',
                        success: function (data) {
                            console.info("subscribeLightSensorJsTest013 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                        },
                        fail: null,
                    });
                    setTimeout(() => {
                    sensor.unsubscribeLight();
                    done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('subscribeLightSensorJsTest013 Device does not support! ');
            done();
        }
    })
})}
