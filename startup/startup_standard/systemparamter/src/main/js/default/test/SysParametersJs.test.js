/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// @ts-nocheck

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import systemparameter from '@ohos.systemParameter'

describe('SystemParameterTest', function () {

    console.info('SystemParameterTest start################################start');

    function SetParameter(key, value) {
        let tmp = value;
        if (value === "" || value === undefined) {
            let myDate = new Date();
            tmp = myDate.toLocaleString();
        }

        console.info('SetParameter key ' + key);
        console.info('SetParameter value ' + tmp);
        try {
            systemparameter.setSync(key, tmp);
        } catch (err) {
            expect(ret).assertTrue();
            console.info('SetParameter error: ' + err);
        }
        console.info('SetParameter key' + key + "  end");
    }

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0801
     * @tc.name      testWaitPromise01
     * @tc.desc      Waits the value of the attribute with the specified key.
     */
    it('testWaitPromise01', 0, async function (done) {
        console.info('testWaitPromise01 start');
        let ret = false;
        try {
            var parameterInfo = systemparameter.wait("test.wait_param.101", "100", 1);
            parameterInfo.then(function (result) { // timeout
                console.info("testWaitPromise01 test.wait_param.101 success: " + result);
                expect(ret).assertTrue();
            }).catch(function (err) {
                ret = true;
                console.info("testWaitPromise01 test.wait_param.101 error: " + err.code);
                expect(ret).assertTrue();
                done();
            });
        } catch (e) {
            expect(ret).assertTrue();
            console.info("promise get input error: " + e);
        }
        console.info('testWaitPromise01 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0802
     * @tc.name      testWaitPromise02
     * @tc.desc      Waits the value of the attribute with the specified key.
     */
    it('testWaitPromise02', 0, async function (done) {
        console.info('testWaitPromise02 start');
        let ret = false;
        try {
            var parameterInfo = systemparameter.wait("test.wait_param.102", "", 1);
            parameterInfo.then(function (result) {  // timeout
                console.info("testWaitPromise02 test.wait_param.102 success: ");
                expect(ret).assertTrue();
                done();
            }).catch(function (err) {
                ret = true;
                console.info("testWaitPromise02 test.wait_param.102 error: " + err.code);
                expect(ret).assertTrue();
                done();
            });
        } catch (e) {
            expect(ret).assertTrue();
            console.info("promise get input error: " + e);
        }
        console.info('testWaitPromise02 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0803
     * @tc.name      testWaitPromise03
     * @tc.desc      Waits the value of the attribute with the specified key.
     */
    it('testWaitPromise03', 0, async function (done) {
        console.info('testWaitPromise03 start');
        let ret = false;
        SetParameter("test.wait_param.103", "103");
        try {
            var parameterInfo = systemparameter.wait("test.wait_param.103", "103", 1);
            parameterInfo.then(function (result) { // ok
                ret = true;
                console.info("testWaitPromise03 test.wait_param.103 success: ");
                expect(ret).assertTrue();
                done();
            }).catch(function (err) {
                expect(ret).assertTrue();
                console.info("testWaitPromise03 test.wait_param.103 error: " + err.code);
            });
        } catch (e) {
            expect(ret).assertTrue();
            console.info("promise get input error: " + e);
        }
        console.info('testWaitPromise03 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0804
     * @tc.name      testWaitPromise04
     * @tc.desc      Waits the value of the attribute with the specified key.
     */
    it('testWaitPromise04', 0, async function (done) {
        console.info('testWaitPromise04 start');
        let ret = false;
        SetParameter("test.wait_param.104", "104");
        try {
            var parameterInfo = systemparameter.wait("test.wait_param.104", "*", 1);
            parameterInfo.then(function (result) { // ok
                ret = true;
                console.info("testWaitPromise04 test.wait_param.104 success");
                expect(ret).assertTrue();
                done();
            }).catch(function (err) {
                console.info("testWaitPromise04 test.wait_param.104 error: " + err.code);
                expect(ret).assertTrue();
            });
        } catch (e) {
            expect(ret).assertTrue();
            console.info("promise get input error: " + e);
        }
        console.info('testWaitPromise04 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0805
     * @tc.name      testWaitPromise05
     * @tc.desc      Waits the value of the attribute with the specified key.
     */
    it('testWaitPromise05', 0, async function (done) {
        console.info('testWaitPromise05 start');
        let ret = false;
        SetParameter("test.wait_param.105", "105");
        try {
            var parameterInfo = systemparameter.wait("test.wait_param.105", "*", -1);
            parameterInfo.then(function (result) {
                ret = true;
                console.info("testWaitPromise05 test.wait_param.105 success");
                expect(ret).assertTrue();
                done();
            }).catch(function (err) {
                console.info("testWaitPromise05 test.wait_param.105 error: " + err.code);
                expect(ret).assertTrue();
            });
        } catch (e) {
            expect(ret).assertTrue();
            console.info("promise get input error: " + e);
        }
        console.info('testWaitPromise05 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0806
     * @tc.name      testWait01
     * @tc.desc      Waits the value of the attribute with the specified key.
     */
    it('testWait01', 0, async function (done) {
        console.info('testWait01 start');
        let ret = false;
        try {
            systemparameter.wait("test.wait_param.201", "100", 1, function (err, data) {
                if (err == undefined || err.code === 0) {
                    console.info("testWait01 test.wait_param.201 success")
                } else {
                    ret = true; // wait timeout
                    console.info("testWait01 test.wait_param.201 err:" + err.code);
                    expect(ret).assertTrue();
                }
            });
        } catch (e) {
            expect(ret).assertTrue();
            console.info("testWait01 get input error: " + e);
        }
        setTimeout(function () {
            expect(ret).assertTrue();
            done();
        }, '2000');
        console.info('testWait01 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0807
     * @tc.name      testWait02
     * @tc.desc      Waits the value of the attribute with the specified key.
     */
    it('testWait02', 0, async function (done) {
        console.info('testWait02 start');
        let ret = false;
        try {
            ret = true;
            systemparameter.wait("test.wait_param.202", "", 1, function (err, data) {
                if (err == undefined || err.code === 0) { // timeout
                    ret = false;
                    console.info("testWait02 test.wait_param.202 success");
                } else {
                    console.info("testWait02 callback test.wait_param.202 err:" + err.code);
                }
                expect(ret).assertTrue();
                done();
            });
        } catch (e) {
            ret = true;
            console.info("get input error: " + e);
        }
        expect(ret).assertTrue();
        console.info('testWait02 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0808
     * @tc.name      testWait03
     * @tc.desc      Waits the value of the attribute with the specified key.
     */
    it('testWait03', 0, async function (done) {
        console.info('testWait03 start');
        let ret = false;
        SetParameter("test.wait_param.203", "103");
        try {
            systemparameter.wait("test.wait_param.203", "103", 1, function (err, data) {
                if (err == undefined || err.code === 0) {
                    ret = true;
                    console.info("testWait03 test.wait_param.203 success")
                } else {
                    console.info("testWait03 test.wait_param.203 err:" + err.code)
                }
                expect(ret).assertTrue();
            });
        } catch (e) {
            expect(ret).assertTrue();
            console.info("get input error: " + e);
        }
        setTimeout(function () {
            expect(ret).assertTrue();
            done();
        }, '1000');
        console.info('testWait03 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0809
     * @tc.name      testWait04
     * @tc.desc      Waits the value of the attribute with the specified key.
     */
    it('testWait04', 0, async function (done) {
        console.info('testWait04 start');
        let ret = false;
        SetParameter("test.wait_param.204", "104");
        try {
            systemparameter.wait("test.wait_param.204", "*", 1, function (err, data) {
                if (err == undefined || err.code === 0) {
                    ret = true;
                    console.info("testWait04 test.wait_param.204 success")
                } else {
                    ret = false;
                    console.info("testWait04 callback test.wait_param.204 err:" + err.code)
                }
                expect(ret).assertTrue();
            });
        } catch (e) {
            expect(ret).assertTrue();
            console.info("promise get input error: " + e);
        }
        setTimeout(function () {
            expect(ret).assertTrue();
            done();
        }, '1000');
        console.info('testWait04 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0810
     * @tc.name      testWait05
     * @tc.desc      Waits the value of the attribute with the specified key.
     */
    it('testWait05', 0, async function (done) {
        console.info('testWait05 start');
        let ret = false;
        SetParameter("test.wait_param.205", "105");
        try {
            systemparameter.wait("test.wait_param.205", "*", 1, function (err, data) {
                if (err == undefined || err.code === 0) {
                    ret = true;
                    console.info("testWait05 test.wait_param.205 success:" + data)
                } else {
                    console.info("testWait05 test.wait_param.205 err:" + err.code)
                }
                expect(ret).assertTrue();
            });
        } catch (e) {
            ret = false;
            console.info("promise get input error: " + e);
        }
        setTimeout(function () {
            expect(ret).assertTrue();
            done();
        }, '1000');
        console.info('testWait05 end');
    })
})