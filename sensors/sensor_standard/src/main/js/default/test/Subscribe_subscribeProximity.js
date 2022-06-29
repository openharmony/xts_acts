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
import sensor from '@system.sensor'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

describe("SensorJsTest_sensor_33", function () {
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
    })

    let errMessages = ['The number of parameters is not valid', 'UnsubscribeSensor failed',
    'Wrong argument type, should be object'];

    let errMessage;

    /*
    * @tc.name:subscribeProximity_SensorJsTest001
    * @tc.desc:verify app info is not null
    * @tc.type: FUNC
    * @tc.require: SR000H0ALK, AR000H0ALM
    */
    it("subscribeProximity_SensorJsTest001", 0, async function (done) {
        console.info('----------------------subscribeProximity_SensorJsTest001---------------------------');
        sensor.subscribeProximity({
            success: function (data) {
                console.info("subscribeProximity_SensorJsTest001 success" + JSON.stringify(data));
                expect(typeof (data.distance)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeProximity_SensorJsTest001 failed. Code: ' + code + '; Data: ' + data);
                expect(code).assertEqual(1001);
            },
        });
        setTimeout(() => {
            try {
                sensor.unsubscribeProximity();
            } catch (error) {
                console.info(error);
            }
            setTimeout(() => {
                expect(true).assertTrue();
                done();
            }, 500);
        }, 1000);
    })

    /*
     * @tc.name:subscribeProximity_SensorJsTest002
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeProximity_SensorJsTest002", 0, function (done) {
        console.info('----------------------subscribeProximity_SensorJsTest002---------------------------');
        try {
            sensor.subscribeProximity({
                success: function (data) {
                    console.info("subscribeProximity_SensorJsTest002 success:" + JSON.stringify(data));
                    expect(typeof (data.distance)).assertEqual("number");
                },
                fail: function (data, code) {
                    console.error('subscribeProximity_SensorJsTest002 failed. Code: ' + code + '; Data: ' + data);
                    expect(code).assertEqual(1001);
                },
            }, 25);
        } catch (error) {
            errMessage = error.toString().slice(19, 56);
            console.info('subscribeProximity_SensorJsTest002 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
     * @tc.name:subscribeProximity_SensorJsTest003
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeProximity_SensorJsTest003", 0, function (done) {
        console.info('----------------------subscribeProximity_SensorJsTest003---------------------------');
        try {
            sensor.subscribeProximity({
                success: function (data) {
                    console.info("subscribeProximity_SensorJsTest003 success:" + JSON.stringify(data));
                    expect(typeof (data.distance)).assertEqual("number");
                },
                fail: function (data, code) {
                    console.error('subscribeProximity_SensorJsTest003 failed. Code: ' + code + '; Data: ' + data);
                    expect(code).assertEqual(1001);
                },
            }, function () {
            }, 25);
        } catch (error) {
            errMessage = error.toString().slice(19, 56);
            console.info('subscribeProximity_SensorJsTest003 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
     * @tc.name:subscribeProximity_SensorJsTest004
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeProximity_SensorJsTest004", 0, async function (done) {
        console.info('----------------------subscribeProximity_SensorJsTest004---------------------------');
        try {
            sensor.unsubscribeProximity('xxx');
        } catch (error) {
            errMessage = error.toString().slice(21, 58);
            console.info('subscribeProximity_SensorJsTest004 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
     * @tc.name:subscribeProximity_SensorJsTest005
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeProximity_SensorJsTest005", 0, async function (done) {
        console.info('----------------------subscribeProximity_SensorJsTest005---------------------------');
        try {
            sensor.subscribeProximity();
        } catch (error) {
            errMessage = error.toString().slice(19, 56);
            console.info('subscribeProximity_SensorJsTest005 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
     * @tc.name:subscribeProximity_SensorJsTest006
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeProximity_SensorJsTest006", 0, async function (done) {
        console.info('----------------------subscribeProximity_SensorJsTest006---------------------------');
        try {
            sensor.subscribeProximity('xxx');
        } catch (error) {
            errMessage = error.toString().slice(19, 56);
            console.info('subscribeProximity_SensorJsTest006 error:' + error);
            expect(errMessage).assertEqual(errMessages[2]);
            done();
        }
    })

    /*
     * @tc.name:subscribeProximity_SensorJsTest007
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeProximity_SensorJsTest007", 0, function (done) {
        console.info('----------------------subscribeProximity_SensorJsTest007---------------------------');
        sensor.subscribeProximity({
            success: function (data) {
                console.info("subscribeProximity_SensorJsTest007 success:" + JSON.stringify(data));
                expect(typeof (data.distance)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeProximity_SensorJsTest007 failed. Code: ' + code + '; Data: ' + data);
                expect(code).assertEqual(1001);
            },
        });
        sensor.subscribeProximity({
            success: function (data) {
                console.info("subscribeProximity_SensorJsTest007_1 success:" + JSON.stringify(data));
                expect(typeof (data.distance)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeProximity_SensorJsTest007_1 failed. Code: ' + code + '; Data: ' + data);
                expect(code).assertEqual(1001);
            },
        });
        setTimeout(() => {
            try {
                sensor.unsubscribeProximity();
            } catch (error) {
                console.info('subscribeProximity_SensorJsTest007_unsubscribeProximity error' + error);
            }
            setTimeout(() => {
                expect(true).assertTrue();
                done();
            }, 500);
        }, 1000);
    })

    /*
     * @tc.name:subscribeProximity_SensorJsTest008
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeProximity_SensorJsTest008", 0, async function (done) {
        console.info('----------------------subscribeProximity_SensorJsTest008---------------------------');
        try {
            sensor.unsubscribeProximity();
        } catch (error) {
            errMessage = error.toString().slice(21, 45);
            console.info('subscribeProximity_SensorJsTest008 error:' + error);
            expect(errMessage).assertEqual(errMessages[1]);
            done();
        }
    })

    /*
     * @tc.name:subscribeProximity_SensorJsTest009
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeProximity_SensorJsTest009", 0, function (done) {
        console.info('----------------------subscribeProximity_SensorJsTest009---------------------------');
        sensor.subscribeProximity({
            success: function (data) {
                console.info("subscribeProximity_SensorJsTest009 success:" + JSON.stringify(data));
                expect(typeof (data.distance)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeProximity_SensorJsTest009 failed. Code: ' + code + '; Data: ' + data);
                expect(code).assertEqual(1001);
            },
        });
        try {
            sensor.unsubscribeProximity();
        } catch (error) {
            console.info('subscribeProximity_SensorJsTest009_unsubscribeProximity error' + error);
        }
        setTimeout(() => {
            expect(true).assertTrue();
            done();
        }, 500);
    })
})

    