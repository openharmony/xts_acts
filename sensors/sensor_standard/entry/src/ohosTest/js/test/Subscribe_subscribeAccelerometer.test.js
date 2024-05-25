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

export default function SensorJsTest_sensor_25() {
describe("SensorJsTest_sensor_25", function () {
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

    let AccelerometerId = 1;
    let TAG  = '';

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0010
     * @tc.name: subscribeAccelerometerSensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeAccelerometerSensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------subscribeAccelerometerSensorJsTest001---------------------------');
        TAG = 'subscribeAccelerometerSensorJsTest001';
        try{
            sensor.getSingleSensor(AccelerometerId ,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.subscribeAccelerometer({
                        interval: 'game',
                        success: function (data) {
                            console.info(TAG + ' Callback in!' + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.info(TAG + ' data：'+ data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeAccelerometer();
                        done();
                    }, 1000);
              }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

   /*
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0020
     * @tc.name: subscribeAccelerometerSensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeAccelerometerSensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeAccelerometerSensorJsTest002---------------------------');
        TAG = 'subscribeAccelerometerSensorJsTest002';
        try{
            sensor.getSingleSensor(AccelerometerId ,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.subscribeAccelerometer({
                        interval: 'ui',
                        success: function (data) {
                            console.info(TAG + ' Callback in!' + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.info(TAG + ' data：'+ data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeAccelerometer();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0030
     * @tc.name: subscribeAccelerometerSensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeAccelerometerSensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeAccelerometerSensorJsTest003---------------------------');
        TAG = 'subscribeAccelerometerSensorJsTest003';
        try{
            sensor.getSingleSensor(AccelerometerId ,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.subscribeAccelerometer({
                        interval: 'normal',
                        success: function (data) {
                            console.info(TAG + ' Callback in!' + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.info(TAG + ' data：'+ data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeAccelerometer();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0040
     * @tc.name: subscribeAccelerometerSensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeAccelerometerSensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeAccelerometerSensorJsTest004---------------------------');
        TAG = 'subscribeAccelerometerSensorJsTest004';
        try{
            sensor.getSingleSensor(AccelerometerId ,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.subscribeAccelerometer({
                        interval: 'normal',
                        success: function (data) {
                            console.info(TAG + ' Callback in!' + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.info(TAG + ' data：'+ data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });

                    sensor.subscribeAccelerometer({
                        interval: 'normal',
                        success: function (data) {
                            console.info(TAG + ' Callback in!' + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.info(TAG + ' data1：'+ data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                    sensor.unsubscribeAccelerometer();
                    done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0050
     * @tc.name: subscribeAccelerometerSensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeAccelerometerSensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeAccelerometerSensorJsTest005---------------------------');
        TAG = 'subscribeAccelerometerSensorJsTest005';
        try{
            sensor.getSingleSensor(AccelerometerId ,(error, data) => {
               if (error) {
                   console.info(TAG + ' error:' + error);
                   done();
               } else {
                   sensor.subscribeAccelerometer({
                       interval: 'xxx',
                       success: function (data) {
                           console.info(TAG + ' Callback in!' + JSON.stringify(data));
                           expect(typeof (data.x)).assertEqual("number");
                           expect(typeof (data.y)).assertEqual("number");
                           expect(typeof (data.z)).assertEqual("number");
                       },
                       fail: function (data, code) {
                           console.info(TAG + ' data：'+ data + ", code: " + code);
                           expect(code).assertEqual(202);
                           done();
                       },
                   });
               }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0060
     * @tc.name: subscribeAccelerometerSensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeAccelerometerSensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeAccelerometerSensorJsTest006---------------------------');
        TAG = 'subscribeAccelerometerSensorJsTest006';
        try{
            sensor.getSingleSensor(AccelerometerId ,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.subscribeAccelerometer({
                        interval: 'normal',
                        success: function (data) {
                            console.info(TAG + ' Callback in!' + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeAccelerometer();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0070
     * @tc.name: subscribeAccelerometerSensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeAccelerometerSensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeAccelerometerSensorJsTest007---------------------------');
        TAG = 'subscribeAccelerometerSensorJsTest007';
        try{
            sensor.getSingleSensor(AccelerometerId ,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.subscribeAccelerometer({
                        interval: 'game',
                        success: function (data) {
                            console.info(TAG + ' Callback in!' + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.info(TAG + ' data：!'+ data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });

                    sensor.subscribeAccelerometer({
                        interval: 'normal',
                        success: function (data) {
                            console.info(TAG + ' Callback2 in!' + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeAccelerometerSensorJsTest007_1 is failed, data: " + data + ", code: " + code);
                            console.info(TAG + ' data1：'+ data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeAccelerometer();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0080
     * @tc.name: subscribeAccelerometerSensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeAccelerometerSensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------subscribeAccelerometerSensorJsTest008---------------------------');
        TAG = 'subscribeAccelerometerSensorJsTest008';
        try{
            sensor.getSingleSensor(AccelerometerId ,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                } else {
                    sensor.subscribeAccelerometer({
                        interval: 'game',
                        success: function (data) {
                            console.info(TAG + ' Callback in!' + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                        sensor.unsubscribeAccelerometer();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
        }
        done();
    })

   /*
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0090
     * @tc.name: subscribeAccelerometerSensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeAccelerometerSensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeAccelerometerSensorJsTest009---------------------------');
        TAG = 'subscribeAccelerometerSensorJsTest009';
        try{
            sensor.getSingleSensor(AccelerometerId ,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                } else {
                    sensor.subscribeAccelerometer({
                        interval: 'ui',
                        success: function (data) {
                            console.info(TAG + ' Callback in!' + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                        sensor.unsubscribeAccelerometer();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
        }
        done();
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0100
     * @tc.name: subscribeAccelerometerSensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeAccelerometerSensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeAccelerometerSensorJsTest010---------------------------');
        TAG = 'subscribeAccelerometerSensorJsTest010';
        try{
            sensor.getSingleSensor(AccelerometerId ,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                } else {
                    sensor.subscribeAccelerometer({
                        interval: 'normal',
                        success: function (data) {
                            console.info(TAG + ' Callback in!' + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                        sensor.unsubscribeAccelerometer();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
        }
        done();
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0110
     * @tc.name: subscribeAccelerometerSensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeAccelerometerSensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeAccelerometerSensorJsTest011---------------------------');
        TAG = 'subscribeAccelerometerSensorJsTest011';
        try{
            sensor.getSingleSensor(AccelerometerId ,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                } else {
                    sensor.subscribeAccelerometer({
                        interval: 'normal',
                        success: function (data) {
                            console.info(TAG + ' Callback in!' + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: undefined,
                    });

                    sensor.subscribeAccelerometer({
                        interval: 'normal',
                        success: function (data) {
                            console.info(TAG + ' Callback in!' + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: null,
                    });
                    setTimeout(() => {
                        sensor.unsubscribeAccelerometer();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
        }
        done();
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0120
     * @tc.name: subscribeAccelerometerSensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeAccelerometerSensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeAccelerometerSensorJsTest012---------------------------');
        TAG = 'subscribeAccelerometerSensorJsTest012';
        try{
            sensor.getSingleSensor(AccelerometerId ,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                } else {
                    sensor.subscribeAccelerometer({
                        interval: 'xxx',
                        success: function (data) {
                            console.info(TAG + ' Callback in!' + JSON.stringify(data));
                            expect(false).assertTrue();
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
        }
        done();
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0130
     * @tc.name: subscribeAccelerometerSensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeAccelerometerSensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeAccelerometerSensorJsTest013---------------------------');
        TAG = 'subscribeAccelerometerSensorJsTest013';
        try{
            sensor.getSingleSensor(AccelerometerId ,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                } else {
                    sensor.subscribeAccelerometer({
                        interval: 'xxx',
                        success: function (data) {
                            console.info(TAG + ' Callback in!' + JSON.stringify(data));
                            expect(false).assertTrue();
                        },
                        fail: null,
                    });
                    setTimeout(() => {
                        sensor.unsubscribeAccelerometer();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
        }
        done();
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0140
     * @tc.name: subscribeAccelerometerSensorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeAccelerometerSensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeAccelerometerSensorJsTest014---------------------------');
        TAG = 'subscribeAccelerometerSensorJsTest014';
        try{
            sensor.getSingleSensor(AccelerometerId ,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                } else {
                    sensor.subscribeAccelerometer({
                        interval: 'game',
                        success: function (data) {
                            console.info(TAG + ' Callback in!' + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: null,
                    });
                    setTimeout(() => {
                        sensor.unsubscribeAccelerometer();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
        }
        done();
    })
})}
