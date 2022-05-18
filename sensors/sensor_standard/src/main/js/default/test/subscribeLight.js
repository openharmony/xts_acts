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

describe("SensorJsTest", function () {
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

    var errMessages = ['The number of parameters is not valid', 'UnsubscribeSensor failed', 
						'Wrong argument type, should be object'];

    /*
     * @tc.name:subscribeLight_SensorJsTest001
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeLight_SensorJsTest001", 0, function (done) {
		console.info('----------------------subscribeLight_SensorJsTest001---------------------------');
        sensor.subscribeLight({
            success: function (data) {
                console.info("subscribeLight_SensorJsTest001 success:" + JSON.stringify(data));
                expect(typeof (data.intensity)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeLight_SensorJsTest001 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });

        setTimeout(() => {
            try {
                sensor.unsubscribeLight();
            } catch (error) {
                console.info('subscribeLight_SensorJsTest001_unsubscribeLight error' + error);
                expect(false).assertTrue();
            }
            setTimeout(() => {
                expect(true).assertTrue();
                done();
            }, 500);
        }, 1000);
    })

    /*
     * @tc.name:subscribeLight_SensorJsTest002
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeLight_SensorJsTest002", 0, function (done) {
		console.info('----------------------subscribeLight_SensorJsTest002---------------------------');
        try {
            sensor.subscribeLight({
                success: function (data) {
                    console.info("subscribeLight_SensorJsTest002 success:" + JSON.stringify(data));
                    expect(typeof (data.intensity)).assertEqual("number");
                },
                fail: function (data, code) {
                    console.error('subscribeLight_SensorJsTest002 failed. Code: ' + code + '; Data: ' + data);
                    expect(false).assertTrue();
                },
            }, 25);
        } catch (error) {
            var errMessage = error.toString().slice(19, 56);
            console.info('subscribeLight_SensorJsTest002 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

     /*
     * @tc.name:subscribeLight_SensorJsTest003
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeLight_SensorJsTest003", 0, function (done) {
		console.info('----------------------subscribeLight_SensorJsTest003---------------------------');
        sensor.subscribeLight({
            success: function (data) {
                console.info("subscribeLight_SensorJsTest003 success:" + JSON.stringify(data));
                expect(typeof (data.intensity)).assertEqual("number");
            },
        });

        setTimeout(() => {
            try {
                sensor.unsubscribeLight();
            } catch (error) {
                console.info('subscribeLight_SensorJsTest003_unsubscribeLight error' + error);
                expect(false).assertTrue();
            }
            setTimeout(() => {
                expect(true).assertTrue();
                done();
            }, 500);
        }, 1000);
    })

    /*
     * @tc.name:subscribeLight_SensorJsTest004
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeLight_SensorJsTest004", 0, function (done) {
		console.info('----------------------subscribeLight_SensorJsTest004---------------------------');
        try {
            sensor.subscribeLight({
                success: function (data) {
                    console.info("subscribeLight_SensorJsTest004 success:" + JSON.stringify(data));
                    expect(typeof (data.intensity)).assertEqual("number");
                },
                fail: function (data, code) {
                    console.error('subscribeLight_SensorJsTest004 failed. Code: ' + code + '; Data: ' + data);
                    expect(false).assertTrue();
                },
            }, function () {
            }, 25);
        } catch (error) {
            var errMessage = error.toString().slice(19, 56);
            console.info('subscribeLight_SensorJsTest004 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
     * @tc.name:subscribeLight_SensorJsTest005
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeLight_SensorJsTest005", 0, async function (done) {
        console.info('----------------------subscribeLight_SensorJsTest005---------------------------');
        try {
            sensor.unsubscribeLight('xxx');
        } catch (error) {
            var errMessage = error.toString().slice(21, 58);
            console.info('subscribeLight_SensorJsTest005 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
     * @tc.name:subscribeLight_SensorJsTest006
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeLight_SensorJsTest006", 0, async function (done) {
        console.info('----------------------subscribeLight_SensorJsTest006---------------------------');
        try {
            sensor.subscribeLight();
        } catch (error) {
            var errMessage = error.toString().slice(19, 56);
            console.info('subscribeLight_SensorJsTest006 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
     * @tc.name:subscribeLight_SensorJsTest007
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeLight_SensorJsTest007", 0, async function (done) {
        console.info('----------------------subscribeLight_SensorJsTest007---------------------------');
        try {
            sensor.subscribeLight('xxx');
        } catch (error) {
            var errMessage = error.toString().slice(19, 56);
            console.info('subscribeLight_SensorJsTest007 error:' + error);
            expect(errMessage).assertEqual(errMessages[2]);
            done();
        }
    })

    /*
     * @tc.name:subscribeLight_SensorJsTest008
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeLight_SensorJsTest008", 0, function (done) {
		console.info('----------------------subscribeLight_SensorJsTest008---------------------------');
        sensor.subscribeLight({
            success: function (data) {
                console.info("subscribeLight_SensorJsTest008 success:" + JSON.stringify(data));
                expect(typeof (data.intensity)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeLight_SensorJsTest008 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
        sensor.subscribeLight({
            success: function (data) {
                console.info("subscribeLight_SensorJsTest008_1 success:" + JSON.stringify(data));
                expect(typeof (data.intensity)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeLight_SensorJsTest008_1 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });

        setTimeout(() => {
            try {
                sensor.unsubscribeLight();
            } catch (error) {
                console.info('subscribeLight_SensorJsTest008_unsubscribeLight error' + error);
                expect(false).assertTrue();
            }
            setTimeout(() => {
                expect(true).assertTrue();
                done();
            }, 500);
        }, 1000);
    })

    /*
     * @tc.name:subscribeLight_SensorJsTest009
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeLight_SensorJsTest009", 0, async function (done) {
        console.info('----------------------subscribeLight_SensorJsTest009---------------------------');
        try {
            sensor.unsubscribeLight();
        } catch (error) {
            var errMessage = error.toString().slice(21,45);
            console.info('subscribeLight_SensorJsTest009 error:' + error);
            expect(errMessage).assertEqual(errMessages[1]);
            done();
        }
    })

    /*
     * @tc.name:subscribeLight_SensorJsTest010
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("subscribeLight_SensorJsTest010", 0, function (done) {
		console.info('----------------------subscribeLight_SensorJsTest010---------------------------');
        sensor.subscribeLight({
            success: function (data) {
                console.info("subscribeLight_SensorJsTest010 success:" + JSON.stringify(data));
                expect(typeof (data.intensity)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeLight_SensorJsTest010 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });

        try {
            sensor.unsubscribeLight();
        } catch (error) {
            console.info('subscribeLight_SensorJsTest008_unsubscribeLight error' + error);
            expect(true).assertTrue();
        }
        setTimeout(() => {
            expect(true).assertTrue();
            done();
        }, 500);
    })
})

    