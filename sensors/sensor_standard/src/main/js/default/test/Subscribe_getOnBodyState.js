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
import sensor from '@system.sensor';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

describe("SensorJsTest_sensor_24", function () {
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

    let errMessages = ['The number of parameters is not valid', 'Wrong argument type, function expected',
    'Wrong argument type, should be object']

    let errMessage;

    /*
    * @tc.name:getOnBodyState_SensorJsTest001
    * @tc.desc:verify app info is not null
    * @tc.type: FUNC
    * @tc.require: SR000H0ALK, AR000H0ALM
    */
    it("getOnBodyState_SensorJsTest001", 0, async function (done) {
        console.info('----------------------getOnBodyState_SensorJsTest001---------------------------');
        try {
            sensor.getOnBodyState();
        } catch (error) {
            console.info('getOnBodyState_SensorJsTest001 error' + error);
            errMessage = error.toString().slice(22, 59);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
    * @tc.name:getOnBodyState_SensorJsTest002
    * @tc.desc:verify app info is not null
    * @tc.type: FUNC
    * @tc.require: SR000H0ALK, AR000H0ALM
    */
    it("getOnBodyState_SensorJsTest002", 0, async function (done) {
        console.info('----------------------getOnBodyState_SensorJsTest002---------------------------');
        try {
            sensor.getOnBodyState({
                success: function (data) {
                    console.info("getOnBodyState_SensorJsTest002 success:" + JSON.stringify(data));
                    expect(typeof (data.value)).assertEqual("boolean");
                    done();
                }
            });
        } catch (error) {
            console.info('getOnBodyState_SensorJsTest002 error' + error);
            expect(false).assertTrue();
            done();
        }
    })

    /*
     * @tc.name:getOnBodyState_SensorJsTest003
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("getOnBodyState_SensorJsTest003", 0, async function (done) {
        console.info('----------------------getOnBodyState_SensorJsTest003---------------------------');
        sensor.getOnBodyState({
            success: function (data) {
                console.info("getOnBodyState_SensorJsTest003 success:" + JSON.stringify(data));
                expect(typeof (data.value)).assertEqual("boolean");
                done();
            },
            fail: function (data, code) {
                console.log("getOnBodyState_SensorJsTest003 is failed, data: " + data + ", code: " + code);
                expect(false).assertTrue();
            },
            complete: function () {
                console.log('getOnBodyState_SensorJsTest003 is completed');
            }
        });
    })

    /*
    * @tc.name:getOnBodyState_SensorJsTest004
    * @tc.desc:verify app info is not null
    * @tc.type: FUNC
    * @tc.require: SR000H0ALK, AR000H0ALM
    */
    it("getOnBodyState_SensorJsTest004", 0, async function (done) {
        console.info('----------------------getOnBodyState_SensorJsTest004---------------------------');
        sensor.getOnBodyState({
            success: function (data) {
                console.info("getOnBodyState_SensorJsTest004 success:" + JSON.stringify(data));
                expect(typeof (data.value)).assertEqual("boolean");
                done();
            },
        });
    })

    /*
     * @tc.name:getOnBodyState_SensorJsTest005
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("getOnBodyState_SensorJsTest005", 0, async function (done) {
        console.info('----------------------getOnBodyState_SensorJsTest005---------------------------');
        sensor.getOnBodyState({
            success: function (data) {
                console.info("getOnBodyState_SensorJsTest005 success:" + JSON.stringify(data));
                expect(typeof (data.value)).assertEqual("boolean");
                done();
            },
            fail: function (data, code) {
                console.error('getOnBodyState_SensorJsTest005 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
    })

    /*
     * @tc.name:getOnBodyState_SensorJsTest006
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("getOnBodyState_SensorJsTest006", 0, async function (done) {
        console.info('----------------------getOnBodyState_SensorJsTest006---------------------------');
        sensor.getOnBodyState({
            inInvalid: 2,
            success: function (data) {
                console.info("getOnBodyState_SensorJsTest006 success:" + JSON.stringify(data));
                expect(typeof (data.value)).assertEqual("boolean");
                done();
            },
            fail: function (data, code) {
                console.error('getOnBodyState_SensorJsTest006 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
    })

    /*
     * @tc.name:getOnBodyState_SensorJsTest007
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("getOnBodyState_SensorJsTest007", 0, async function (done) {
        console.info('----------------------getOnBodyState_SensorJsTest007---------------------------');
        try {
            sensor.getOnBodyState({
                success: function (data) {
                    console.info("getOnBodyState_SensorJsTest007 success:" + JSON.stringify(data));
                    expect(typeof (data.value)).assertEqual("boolean");
                },
            }, 25);
        } catch (error) {
            errMessage = error.toString().slice(22, 59);
            console.info('getOnBodyState_SensorJsTest007 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
     * @tc.name:getOnBodyState_SensorJsTest008
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("getOnBodyState_SensorJsTest008", 0, async function (done) {
        console.info('----------------------getOnBodyState_SensorJsTest008---------------------------');
        sensor.getOnBodyState({
            success: function (data) {
                console.info("getOnBodyState_SensorJsTest008 success:" + JSON.stringify(data));
                expect(typeof (data.value)).assertEqual("boolean");
            },
            fail: function (data, code) {
                console.error('getOnBodyState_SensorJsTest008 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
        sensor.getOnBodyState({
            success: function (data) {
                console.info("getOnBodyState_SensorJsTest008 success:" + JSON.stringify(data));
                expect(typeof (data.value)).assertEqual("boolean");
            },
            fail: function (data, code) {
                console.error('getOnBodyState_SensorJsTest008_1 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
        setTimeout(() => {
            done();
        }, 500);
    })

    /*
     * @tc.name:getOnBodyState_SensorJsTest009
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("getOnBodyState_SensorJsTest009", 0, async function (done) {
        console.info('----------------------getOnBodyState_SensorJsTest009---------------------------');
        try {
            sensor.getOnBodyState('xxx');
        } catch (error) {
            console.info('getOnBodyState_SensorJsTest009 error：' + error);
            errMessage = error.toString().slice(22, 59);
            console.info('getOnBodyState_SensorJsTest009 errMessage：' + errMessage);
            expect(errMessage).assertEqual(errMessages[2]);
            done();
        }
    })

    /*
     * @tc.name:getOnBodyState_SensorJsTest010
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("getOnBodyState_SensorJsTest010", 0, async function (done) {
        console.info('----------------------getOnBodyState_SensorJsTest010---------------------------');
        try {
            sensor.getOnBodyState();
        } catch (error) {
            errMessage = error.toString().slice(22, 59);
            console.info('getOnBodyState_SensorJsTest010 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
     * @tc.name:getOnBodyState_SensorJsTest011
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("getOnBodyState_SensorJsTest011", 0, async function (done) {
        console.info('----------------------getOnBodyState_SensorJsTest011---------------------------');
        try {
            sensor.getOnBodyState({
                success: function (data) {
                    console.info("getOnBodyState_SensorJsTest011 success:" + JSON.stringify(data));
                    expect(typeof (data.value)).assertEqual("boolean");
                    done();
                },
            }, function () {
            }, 25);
        } catch (error) {
            errMessage = error.toString().slice(22, 59);
            console.info('getOnBodyState_SensorJsTest011 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
    * @tc.name:getOnBodyState_SensorJsTest012
    * @tc.desc:verify app info is not null
    * @tc.type: FUNC
    * @tc.require: SR000H0ALK, AR000H0ALM
    */
    it("getOnBodyState_SensorJsTest012", 0, async function (done) {
        console.info('----------------------getOnBodyState_SensorJsTest012---------------------------');
        sensor.getOnBodyState({
            success: function (data) {
                console.info("getOnBodyState_SensorJsTest012 success:" + JSON.stringify(data));
                expect(typeof (data.value)).assertEqual("boolean");
                done();
            },
            fail: function (data, code) {
                console.error('getOnBodyState_SensorJsTest012 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
                done();
            },
        });
    })
})
	
	