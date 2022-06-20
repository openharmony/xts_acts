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

describe("SensorJsTest_sensor_28", function () {
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
     * @tc.name:subscribeCompass_SensorJsTest001
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeCompass_SensorJsTest001", 0, function (done) {
        console.info('----------------------subscribeCompass_SensorJsTest001---------------------------');
        sensor.subscribeCompass({
            success: function (data) {
                console.info("subscribeCompass_SensorJsTest001 success:" + JSON.stringify(data));
                expect(typeof (data.direction)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeCompass_SensorJsTest001 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
        setTimeout(() => {
            try {
                sensor.unsubscribeCompass();
            } catch (error) {
                console.info('subscribeCompass_SensorJsTest001_unsubscribeCompass error' + error);
                expect(false).assertTrue();
            }
            setTimeout(() => {
                expect(true).assertTrue();
                done();
            }, 500);
        }, 1000);
    })

    /*
     * @tc.name:subscribeCompass_SensorJsTest002
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeCompass_SensorJsTest002", 0, function (done) {
        console.info('----------------------subscribeCompass_SensorJsTest002---------------------------');
        try {
            sensor.subscribeCompass({
                success: function (data) {
                    console.info("subscribeCompass_SensorJsTest002 success:" + JSON.stringify(data));
                    expect(typeof (data.direction)).assertEqual("number");
                },
                fail: function (data, code) {
                    console.error('subscribeCompass_SensorJsTest002 failed. Code: ' + code + '; Data: ' + data);
                    expect(false).assertTrue();
                },
            }, 25);
        } catch (error) {
            errMessage = error.toString().slice(19, 56);
            console.info('subscribeCompass_SensorJsTest002 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
    * @tc.name:subscribeCompass_SensorJsTest003
    * @tc.desc:verify app info is not null
    * @tc.type: FUNC
    * @tc.require: SR000H0ALK, AR000H0ALM
    */
    it("subscribeCompass_SensorJsTest003", 0, function (done) {
        console.info('----------------------subscribeCompass_SensorJsTest003---------------------------');
        sensor.subscribeCompass({
            success: function (data) {
                console.info("subscribeCompass_SensorJsTest003 success:" + JSON.stringify(data));
                expect(typeof (data.direction)).assertEqual("number");
            },
        });
        setTimeout(() => {
            try {
                sensor.unsubscribeCompass();
            } catch (error) {
                console.info('subscribeCompass_SensorJsTest003_unsubscribeLight error' + error);
                expect(false).assertTrue();
            }
            setTimeout(() => {
                expect(true).assertTrue();
                done();
            }, 500);
        }, 1000);
    })

    /*
     * @tc.name:subscribeCompass_SensorJsTest004
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeCompass_SensorJsTest004", 0, function (done) {
        console.info('----------------------subscribeCompass_SensorJsTest004---------------------------');
        try {
            sensor.subscribeCompass({
                success: function (data) {
                    console.info("subscribeCompass_SensorJsTest004 success:" + JSON.stringify(data));
                    expect(typeof (data.direction)).assertEqual("number");
                },
                fail: function (data, code) {
                    console.error('subscribeCompass_SensorJsTest004 failed. Code: ' + code + '; Data: ' + data);
                    expect(false).assertTrue();
                },
            }, function () {
            }, 25);
        } catch (error) {
            errMessage = error.toString().slice(19, 56);
            console.info('subscribeCompass_SensorJsTest004 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
     * @tc.name:subscribeCompass_SensorJsTest005
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeCompass_SensorJsTest005", 0, async function (done) {
        console.info('----------------------subscribeCompass_SensorJsTest005---------------------------');
        try {
            sensor.unsubscribeCompass('xxx');
        } catch (error) {
            errMessage = error.toString().slice(21, 58);
            console.info('subscribeCompass_SensorJsTest005 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
     * @tc.name:subscribeCompass_SensorJsTest006
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeCompass_SensorJsTest006", 0, async function (done) {
        console.info('----------------------subscribeCompass_SensorJsTest006---------------------------');
        try {
            sensor.subscribeCompass();
        } catch (error) {
            errMessage = error.toString().slice(19, 56);
            console.info('subscribeCompass_SensorJsTest006 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
     * @tc.name:subscribeCompass_SensorJsTest007
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeCompass_SensorJsTest007", 0, async function (done) {
        console.info('----------------------subscribeCompass_SensorJsTest007---------------------------');
        try {
            sensor.subscribeCompass('xxx');
        } catch (error) {
            errMessage = error.toString().slice(19, 56);
            console.info('subscribeCompass_SensorJsTest007 error:' + error);
            expect(errMessage).assertEqual(errMessages[2]);
            done();
        }
    })

    /*
     * @tc.name:subscribeCompass_SensorJsTest008
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeCompass_SensorJsTest008", 0, function (done) {
        console.info('----------------------subscribeCompass_SensorJsTest008---------------------------');
        sensor.subscribeCompass({
            success: function (data) {
                console.info("subscribeCompass_SensorJsTest008 success:" + JSON.stringify(data));
                expect(typeof (data.direction)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeCompass_SensorJsTest008 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
        sensor.subscribeCompass({
            success: function (data) {
                console.info("subscribeCompass_SensorJsTest008_1 success:" + JSON.stringify(data));
                expect(typeof (data.direction)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeCompass_SensorJsTest008_1 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
        setTimeout(() => {
            try {
                sensor.unsubscribeCompass();
            } catch (error) {
                console.info('subscribeCompass_SensorJsTest008_unsubscribeCompass error' + error);
                expect(false).assertTrue();
            }
            setTimeout(() => {
                expect(true).assertTrue();
                done();
            }, 500);
        }, 1000);
    })

    /*
     * @tc.name:subscribeCompass_SensorJsTest009
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeCompass_SensorJsTest009", 0, async function (done) {
        console.info('----------------------subscribeCompass_SensorJsTest009---------------------------');
        try {
            sensor.unsubscribeCompass();
        } catch (error) {
            errMessage = error.toString().slice(21, 45);
            console.info('subscribeCompass_SensorJsTest009 error:' + error);
            expect(errMessage).assertEqual(errMessages[1]);
            done();
        }
    })

    /*
     * @tc.name:subscribeCompass_SensorJsTest010
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeCompass_SensorJsTest010", 0, function (done) {
        console.info('----------------------subscribeCompass_SensorJsTest010---------------------------');
        sensor.subscribeCompass({
            success: function (data) {
                console.info("subscribeCompass_SensorJsTest010 success:" + JSON.stringify(data));
                expect(typeof (data.direction)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeCompass_SensorJsTest010 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
        try {
            sensor.unsubscribeCompass();
        } catch (error) {
            console.info('subscribeLight_SensorJsTest010_unsubscribeLight error' + error);
        }
        setTimeout(() => {
            expect(true).assertTrue();
            done();
        }, 500);
    })
})

    