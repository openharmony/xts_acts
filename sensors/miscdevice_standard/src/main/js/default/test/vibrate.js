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
import vibrator from '@system.vibrator';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

describe("VibratorJsTest", function () {
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

    var errMessages = ['Param number is invalid', 'Wrong argument type. function expected', 
						'Wrong argument type', 'Wrong argument number']
	
    /*
     * @tc.name:VibratorJsTest0001
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("VibratorJsTest0001", 0, async function (done) {
        console.info('----------------------VibratorJsTest0001---------------------------');
        vibrator.vibrate({
            mode: 'long',
            success: function () {
                console.info("VibratorJsTest0001 success");
                expect(true).assertTrue();
                done();
            },
            fail: function (data, code) {
                console.log("VibratorJsTest0001 is failed, data: " + data + ", code: " + code);
                expect(false).assertTrue();
            },
            complete: function () {
                console.log('VibratorJsTest0001 is completed');
            }
        });
    })

    /*
     * @tc.name:VibratorJsTest0002
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("VibratorJsTest0002", 0, async function (done) {
        console.info('----------------------VibratorJsTest0002---------------------------');
        vibrator.vibrate({
            mode: 'short',
            success: function () {
                console.info("VibratorJsTest0002 success");
                expect(true).assertTrue();
                done();
            },
            fail: function (data, code) {
                console.log("VibratorJsTest0002 is failed, data: " + data + ", code: " + code);
                expect(false).assertTrue();
            },
            complete: function () {
                console.log('VibratorJsTest0002 is completed');
            }
        });
    })

    /*
    * @tc.name:VibratorJsTest0003
    * @tc.desc:verify app info is not null
    * @tc.type: FUNC
    * @tc.require: SR000H0ALK, AR000H0ALM
    */
    it("VibratorJsTest0003", 0, async function (done) {
        console.info('----------------------VibratorJsTest0003---------------------------');
        vibrator.vibrate({
            mode: 'short',
            success: function () {
                console.info("VibratorJsTest0003 success");
                expect(true).assertTrue();
                done();
            },
            fail: function (data, code) {
                console.error('VibratorJsTest0003 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
    })

    /*
    * @tc.name:VibratorJsTest0004
    * @tc.desc:verify app info is not null
    * @tc.type: FUNC
    * @tc.require: SR000H0ALK, AR000H0ALM
    */
    it("VibratorJsTest0004", 0, async function (done) {
        console.info('----------------------VibratorJsTest0004---------------------------');
        vibrator.vibrate({
            mode: 'short',
            success: function () {
                console.info("VibratorJsTest0004 success");
                expect(true).assertTrue();
                done();
            },
        });
    })

    /*
     * @tc.name:VibratorJsTest0005
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("VibratorJsTest0005", 0, async function (done) {
        console.info('----------------------VibratorJsTest0005---------------------------');
        vibrator.vibrate({
            success: function () {
                console.info("VibratorJsTest0005 success");
                expect(true).assertTrue();
                done();
            },
            fail: function (data, code) {
                console.error('VibratorJsTest0005 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
    })

    /*
     * @tc.name:VibratorJsTest0006
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("VibratorJsTest0006", 0, async function (done) {
        console.info('----------------------VibratorJsTest0006---------------------------');
        vibrator.vibrate({
            mode: 'long',
            inInvalid: 2,
            success: function () {
                console.info("VibratorJsTest0006 success");
                expect(true).assertTrue();
                done();
            },
            fail: function (data, code) {
                console.error('VibratorJsTest0006 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
    })

    /*
     * @tc.name:VibratorJsTest0007
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("VibratorJsTest0007", 0, async function (done) {
        console.info('----------------------VibratorJsTest0007---------------------------');
        try {
            vibrator.vibrate({
                mode: 'short',
                success: function () {
                    console.info("VibratorJsTest0007 success");
                    expect(false).assertTrue();
                    done();
                },
            }, 25);
        } catch (error) {
            var errMessage = error.toString().slice(39);
            console.info('VibratorJsTest0007 error:' + error);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /*
     * @tc.name:VibratorJsTest0008
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("VibratorJsTest0008", 0, async function (done) {
        console.info('----------------------VibratorJsTest0008---------------------------');
        vibrator.vibrate({
            mode: 'short',
            success: function () {
                console.info("VibratorJsTest0008 success");
                expect(true).assertTrue();
            },
            fail: function (data, code) {
                console.error('VibratorJsTest0008 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });

        vibrator.vibrate({
            mode: 'short',
            success: function () {
                console.info("VibratorJsTest0008_1 success");
                expect(true).assertTrue();
            },
            fail: function (data, code) {
                console.error('VibratorJsTest0008_1 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });

        setTimeout(() => {
            done();
        }, 500);
    })

    /*
     * @tc.name:VibratorJsTest0009
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("VibratorJsTest0009", 0, async function (done) {
        console.info('----------------------VibratorJsTest0009---------------------------');
        try {
            vibrator.vibrate('xxx', done);
        } catch (error) {
            console.info('VibratorJsTest0009 error：' + error);
            var errMessage = error.toString().slice(68);
            expect(errMessage).assertEqual(errMessages[1]);
            done();
        }
    })

    /*
     * @tc.name:VibratorJsTest0010
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("VibratorJsTest0010", 0, async function (done) {
        console.info('----------------------VibratorJsTest0010---------------------------');
        try {
            vibrator.vibrate(done);
        } catch (error) {
            var errMessage = error.toString().slice(7);
            console.info('VibratorJsTest0010 error:' + error);
            expect(errMessage).assertEqual(errMessages[2]);
            done();
        }
    })

    /*
     * @tc.name:VibratorJsTest0011
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: SR000H0ALK, AR000H0ALM
     */
    it("VibratorJsTest0011", 0, async function (done) {
        console.info('----------------------VibratorJsTest0011---------------------------');
        try {
            vibrator.vibrate({
                mode: 'short',
                success: function () {
                    console.info("VibratorJsTest0011 success");
                    expect(false).assertTrue();
                    done();
                },
            }, function () {
            }, 25);
        } catch (error) {
            var errMessage = error.toString().slice(39);
            console.info('VibratorJsTest0011 error:' + error);
            expect(errMessage).assertEqual(errMessages[3]);
            done();
        }
    })
})
	
	