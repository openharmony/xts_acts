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
    let PROPERTY_MAX_VALUE = 'a';
    for (let i = 0; i < 127; i++) {
        PROPERTY_MAX_VALUE = 'a' + PROPERTY_MAX_VALUE;
    }

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0100
     * @tc.name      testSet0100
     * @tc.desc      Set the value for the given key with parameter callback.
     */
    it('system_parameter_test_0100', 0, async function (done) {
        console.info('system_parameter_test_0100 start');
        let ret = false;
        try {
            systemparameter.set('hw_sc.build.os.version', '10.20.30.4', function (err) {
                if (err == undefined) {
                    ret = true;
                    console.info('system_parameter_test_0100 set callback hw_sc.build.os.version value success ');
                    expect(ret).assertTrue();
                } else {
                    console.info('system_parameter_test_0100 set callback hw_sc.build.os.version value err:'
                    + err.code);
                }
            });
            done();
        } catch (err) {
            console.info('system_parameter_test_0100 set callback hw_sc.build.os.version unexpect err:' + err);
        }
        console.info('system_parameter_test_0100 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0110
     * @tc.name      testSet0110
     * @tc.desc      Set a value that is not a string to the property value
     */
    it('system_parameter_test_0110', 0, async function (done) {
        console.info('system_parameter_test_0110 start');
        let ret = false;
        try {
            systemparameter.set('hw_sc.build.os.version', 111, function (err) {
                if (err == undefined) {
                    console.info('system_parameter_test_0110 set callback hw_sc.build.os.version value success');
                } else {
                    console.info('system_parameter_test_0110 set callback hw_sc.build.os.version value err:'
                    + err.code)
                }
            });

        } catch (err) {
            ret = true;
            console.info('system_parameter_test_0110 set callback hw_sc.build.os.version unexpect err:' + err);
            expect(ret).assertTrue();
            done();
        }
        console.info('system_parameter_test_0110 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0120
     * @tc.name      testSet0120
     * @tc.desc      Set the property value to an extra long string
     */
    it('system_parameter_test_0120', 0, async function (done) {
        console.info('system_parameter_test_0120 start');
        let ret = false;
        try {
            systemparameter.set('hw_sc.build.os.version', PROPERTY_MAX_VALUE, function (err) {
                if (err == undefined) {
                    console.info('system_parameter_test_0120 set callback hw_sc.build.os.version value success');
                } else {
                    ret = true;
                    console.info('system_parameter_test_0120 set callback hw_sc.build.os.version value err:' +
                    err.code);
                    expect(ret).assertTrue();
                    done();
                }
            });

        } catch (err) {
            console.info('system_parameter_test_0120 set callback hw_sc.build.os.version unexpect err:' + err);
        }
        console.info('system_parameter_test_0120 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0200
     * @tc.name      testSet0200
     * @tc.desc      Set the value for the given key.
     */
    it('system_parameter_test_0200', 0, async function (done) {
        console.info('system_parameter_test_0200 start');
        let parameterInfo = systemparameter.set('hw_sc.build.os.version', '1.5.3.6');
        let ret = false;
        try {
            parameterInfo.then(function (value) {
                console.info('system_parameter_test_0200 promise  set hw_sc.build.os.version success: ' + value);
                ret = true;
                expect(ret).assertTrue();
                done();
            }).catch(function (err) {
                console.info('system_parameter_test_0200 promise  set hw_sc.build.os.version error: ' + err.code);
            });
        } catch (err) {
            console.info('system_parameter_test_0200 set callback hw_sc.build.os.version unexpect err:' + err)
        }
        console.info('system_parameter_test_0200 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0220
     * @tc.name      testSet0220
     * @tc.desc      Set the property value to an extra long string
     */
    it('system_parameter_test_0220', 0, async function (done) {
        console.info('system_parameter_test_0220 start');
        let ret = false;
        try {
            let parameterInfo = systemparameter.set('hw_sc.build.os.version', PROPERTY_MAX_VALUE);
            parameterInfo.then(function (value) {
                console.info('system_parameter_test_0220 promise  set hw_sc.build.os.version success: ' + value);
            }).catch(function (err) {
                ret = true;
                console.info('system_parameter_test_0220 promise  set hw_sc.build.os.version error: ' + err.code);
                expect(ret).assertTrue();
                done();
            });
        } catch (err) {
            console.info('system_parameter_test_0220 set callback hw_sc.build.os.version unexpect err:' + err);
        }
        console.info('system_parameter_test_0220 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0230
     * @tc.name      testSet0230
     * @tc.desc      Set a value that is not a string to the property value
     */
    it('system_parameter_test_0230', 0, async function (done) {
        console.info('system_parameter_test_0230 start');
        let ret = false;
        try {
            let parameterInfo = systemparameter.set('hw_sc.build.os.version', 111);
            parameterInfo.then(function (value) {
                console.info('system_parameter_test_0230 promise  set hw_sc.build.os.version success: ' + value);
            }).catch(function (err) {
                console.info('system_parameter_test_0230 promise  set hw_sc.build.os.version error: ' + err.code);
            });
        } catch (err) {
            ret = true;
            console.info('system_parameter_test_0230 set callback hw_sc.build.os.version unexpect err:' + err);
            expect(ret).assertTrue();
            done();
        }
        console.info('system_parameter_test_0230 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0300
     * @tc.name      testSetSync0300
     * @tc.desc      Set the value for the given key.
     */
    it('system_parameter_test_0300', 0, function () {
        console.info('system_parameter_test_0300 start');
        let ret = false;
        try {
            systemparameter.setSync('hw_sc.build.os.version', '2.5.3.10');
            console.info('system_parameter_test_0300 promise  setSync hw_sc.build.os.version success');
            ret = true;
        } catch (err) {
            console.info('system_parameter_test_0300 promise  setSync hw_sc.build.os.version: ' + err);
        }
        expect(ret).assertTrue();
        console.info('system_parameter_test_0300 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0310
     * @tc.name      testSetSync0310
     * @tc.desc      Set the property value to an extra long string
     */
    it('system_parameter_test_0310', 0, async function (done) {
        console.info('system_parameter_test_0310 start');
        let ret = false;
        let sysValue = null;
        try {
            systemparameter.setSync('hw_sc.build.os.version', PROPERTY_MAX_VALUE);
            let parameterInfo = systemparameter.get('hw_sc.build.os.version');
            parameterInfo.then(function (value) {
                ret = true;
                console.info(' get testcast0310 system version : ' + value);
                sysValue = value;
                if (sysValue === PROPERTY_MAX_VALUE) {
                    console.info('system_parameter_test_0310 promise  setSynchw_sc.build.os.version failed :'
                    + sysValue);
                } else {
                    console.info('system_parameter_test_0310 promise  setSync hw_sc.build.os.version: ' + sysValue);
                    ret = true;
                    expect(ret).assertTrue();
                    done();
                }
            })
        } catch (err) {
            console.info('system_parameter_test_0310 promise  setSync hw_sc.build.os.version: ' + err);
        }
        console.info('system_parameter_test_0310 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0320
     * @tc.name      testSetSync0320
     * @tc.desc      Set a value that is not a string to the property value
     */
    it('system_parameter_test_0320', 0, function () {
        console.info('system_parameter_test_0320 start');
        let ret = false;
        try {
            systemparameter.setSync('hw_sc.build.os.version', 111);
            console.info('system_parameter_test_0320 promise  setSync hw_sc.build.os.version success: ');

        } catch (err) {
            console.info('system_parameter_test_0320 promise  setSync hw_sc.build.os.version error: ' + err);
            ret = true;
        }
        expect(ret).assertTrue();
        console.info('system_parameter_test_0320 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0340
     * @tc.name      testSetSync0340
     * @tc.desc      Set parameter value ' '
     */
    it('system_parameter_test_0340', 0, async function (done) {
        console.info('system_parameter_test_0340 start');
        let ret = false;
        let sysValue = 0;
        try {
            systemparameter.setSync('hw_sc.build.os.version', ' ');
            let parameterInfo = systemparameter.get('hw_sc.build.os.version');
            parameterInfo.then(function (value) {
                ret = true;
                console.info(' get testcast0340 system version : ' + value);
                sysValue = value;
                if (sysValue === ' ') {
                    console.info('system_parameter_test_0340 promise  get rhw_sc.build.os.version :' + sysValue);
                    ret = true;
                    expect(ret).assertTrue();
                    done();
                } else {
                    console.info('system_parameter_test_0340 promise  get hw_sc.build.os.version: ' + sysValue);
                }
            })
        } catch (err) {
            ret = true;
            console.info('promise  get hw_sc.build.os.version: ' + err);
        }
        console.info('system_parameter_test_0340 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0400
     * @tc.name      testGet0400
     * @tc.desc      get systemparameter value
     */
    it('system_parameter_test_0400', 0, async function (done) {
        console.info('system_parameter_test_0400 start');
        let ret = false;
        try {
            let parameterInfo = systemparameter.get('hw_sc.build.os.version');
            parameterInfo.then(function (value) {
                ret = true;
                console.info(' system_parameter_test_0400 promise get hw_sc.build.os.version success: ' + value);
                    expect(ret).assertTrue();
                done();
            }).catch(function (err) {
                console.info(' system_parameter_test_0400 promise get hw_sc.build.os.version error: ' + err.code);
            });
        } catch (err) {
            console.info('system_parameter_test_0400 promise  setSync hw_sc.build.os.version error: ' + err);
        }

        console.info('system_parameter_test_0400 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0410
     * @tc.name      testGet0410
     * @tc.desc      Get an attribute key that successfully sets value
     */
    it('system_parameter_test_0410', 0, async function (done) {
        console.info('system_parameter_test_0410 start');
        let ret = false;
        try {
            systemparameter.set('hw_sc.build.os.version', '1.1.1.1').then((data, err) => {
                if (err == undefined) {
                    console.info('system_parameter_test_0410 set sucess :' + data);
                } else {
                    console.info('system_parameter_test_0410 set failed :' + err.code());
                }
                return p;
            })
            setTimeout(function(){
                let parameterInfo = systemparameter.get('hw_sc.build.os.version');
                parameterInfo.then(function (value) {
                    if (value === '1.1.1.1') {
                        console.info('promise get hw_sc.build.os.version success: ' + value);
                        ret = true;
                        expect(ret).assertTrue();
                        done();
                    }
                }).catch(function (err) {
                    console.info('promise get hw_sc.build.os.version error: ' + err.code);
                });
            }, '1000');
        } catch (err) {
            console.info('system_parameter_test_0400 promise  get shw_sc.build.os.version error: ' + err);
        }
        console.info('system_parameter_test_0400 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0420
     * @tc.name      testGet0420
     * @tc.desc      Get an attribute key value that sets the qualified value
     */
    it('system_parameter_test_0420', 0, async function (done) {
        console.info('system_parameter_test_0420 start');
        let ret = false;
        let sysValue = 0;
        try {
            systemparameter.set('hw_sc.build.os.version', '1.1.1.1').then((data, err) => {
                if (err == undefined) {
                    console.info('system_parameter_test_0420 set sucess :' + data);
                } else {
                    console.info('system_parameter_test_0420 set failed :' + err.code());
                }
            })
            let parameter = systemparameter.get('hw_sc.build.os.version', '10.3.4.5.63');
            parameter.then(function (value) {
                sysValue = value;
                if (sysValue === '1.1.1.1') {
                    ret = true;
                    console.info(' system_parameter_test_0420 promise get hw_sc.build.os.version success: ' + value);
                    expect(ret).assertTrue();
                    done();
                } else {
                    console.info(' system_parameter_test_0420 promise get hw_sc.build.os.version faile ' + value);
                }
            }).catch(function (err) {
                console.info(' system_parameter_test_0420 promise get hw_sc.build.os.version error: ' + err.code);
            });
        } catch (err) {
            console.info('system_parameter_test_0420 promise  get hw_sc.build.os.version error: ' + err);
        }
        console.info('system_parameter_test_0420 : end');
    })

    /**
    * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0430
    * @tc.name      testGet0430
    * @tc.desc      Get a value without attribute key
    */
    it('system_parameter_test_0430', 0, async function (done) {
        console.info('system_parameter_test_0430 start');
        let ret = false;
        try {
            systemparameter.get(' ', '0.0.0.0').then((data, err) => {
                if (err == undefined) {
                    console.info('system_parameter_test_0430 promise  success: ' + data);
                    ret = true;
                    expect(ret).assertTrue();
                } else {
                    console.info(' system_parameter_test_0430 promise get  faile ' + err);
                }
            })

        } catch (err) {
            console.info('system_parameter_test_0430 promise  catch get failed ' + err);
        }
        setTimeout(function(){
            expect(ret).assertTrue();
            done();
        }, '1000');
        console.info('system_parameter_test_0430 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0440
     * @tc.name      testGet0440
     * @tc.desc      Directly obtain the key value of a normal setting attribute
     */
    it('system_parameter_test_0440', 0, async function (done) {
        console.info('system_parameter_test_0440 start');
        let ret = false;
        try {
            let parameter = systemparameter.get('c.c.c.c', '10.3.4.5.63');
            parameter.then(function (value) {
                ret = true;
                console.info(' system_parameter_test_0440 promise get hw_sc.build.os.version success: ' + value);
                expect(ret).assertTrue();
            }).catch(function (err) {
                console.info(' system_parameter_test_0440 promise get hw_sc.build.os.version error: ' + err.code);
            });
        } catch (err) {
            console.info('system_parameter_test_0440 promise  setSync hw_sc.build.os.version: ' + err);
        }
        setTimeout(function(){
            expect(ret).assertTrue();
            done();
        }, '1000');
        console.info('system_parameter_test_0440 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0450
     * @tc.name      testGet0450
     * @tc.desc      Set the property value to an extra long string
     */
    it('system_parameter_test_0450', 0, async function (done) {
        console.info('system_parameter_test_0450 start');
        let ret = false;
        try {
            let parameter = systemparameter.get('a.b.b.c', PROPERTY_MAX_VALUE);
            parameter.then(function (value) {
                console.info(' system_parameter_test_0450 promise get a.b.b.c success: ' + value);
            }).catch(function (err) {
                ret = true;
                console.info(' system_parameter_test_0450 promise get a.b.b.c error: ' + err.code);
                expect(ret).assertTrue();
            });
        } catch (err) {
            console.info('system_parameter_test_0450 promise  setSync a.b.b.c error: ' + err);
        }
        setTimeout(function(){
            expect(ret).assertTrue();
            done();
        }, '1000');
        console.info('system_parameter_test_0450 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0500
     * @tc.name      testGet0500
     * @tc.desc      Get a property key value
     */
    it('system_parameter_test_0500', 0, async function (done) {
        console.info('system_parameter_test_0500 start');
        let ret = false;
        try {
            systemparameter.get('hw_sc.build.os.version', (err, data) => {
                if (err == undefined) {
                    console.log('system_parameter_test_0500 get test.parameter.key value success:' + data);
                    ret = true;
                    expect(ret).assertTrue();
                } else {
                    console.log('system_parameter_test_0500  get test.parameter.key value err:' + err.code)
                }
            });
        } catch (err) {
            console.log('system_parameter_test_0500 get unexpected error: ' + err);
        }
        setTimeout(function(){
            expect(ret).assertTrue();
            done();
        }, '1000');
        console.info('system_parameter_test_0500 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0510
     * @tc.name      testGet0510
     * @tc.desc      Get a set successful attribute key value
     */
    it('system_parameter_test_0510', 0, async function (done) {
        let ret = false;
        try {
            systemparameter.set('aaaaaa', '2.2.2.2').then((data, err) => {
                if (err == undefined) {
                    console.info('system_parameter_test_0510 set aaaaa sucess :' + data);
                } else {
                    console.info('system_parameter_test_0510 set aaaaa failed :' + err);
                }
            })
            systemparameter.get('aaaaaa', (err, data) => {
                if (err == undefined) {
                    console.info('system_parameter_test_0510 get aaaaa sucess :' + data);
                    ret = true;
                    expect(ret).assertTrue();
                } else {
                    console.info('system_parameter_test_0510 get aaaaa failed :' + err.code);
                }
            })
        } catch (err) {
            console.info('system_parameter_test_0510 promise get input error: ' + err);
        }
        setTimeout(function(){
            expect(ret).assertTrue();
            done();
        }, '1000');
        console.info('system_parameter_test_0510 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0520
     * @tc.name      testGet0520
     * @tc.desc      Get a property key value directly
     */
    it('system_parameter_test_0520', 0, async function (done) {
        console.info('system_parameter_test_0520 start');
        let ret = false;
        try {
            systemparameter.get('a.a.a.a ', (err, data) => {
                if (err == undefined) {
                    console.info('system_parameter_test_0520 get systemparameter sucess: ' + data);
                    ret = true;
                    expect(ret).assertTrue();
                } else {
                    console.info('system_parameter_test_0520 get systemparameter sucess: ' + err.code);
                }
            })
        } catch (err) {
            console.info('system_parameter_test_0520 promise get input error: ' + err);
        }
        setTimeout(function(){
            expect(ret).assertTrue();
            done();
        }, '1000');
        console.info('system_parameter_test_0520 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0530
     * @tc.name      testGet0530
     * @tc.desc      Gets the value of an empty string
     */
    it('system_parameter_test_0530', 0, async function (done) {
        console.info('system_parameter_test_0530 start');
        let ret = false;
        try {
            systemparameter.get(' ', (err, data) => {
                if (err == undefined) {
                    console.info('system_parameter_test_0530 get systemparameter sucess: ' + data);
                    ret = true;
                    expect(ret).assertTrue();
                } else {
                    console.info('system_parameter_test_0530 get systemparameter sucess: ' + err.code);
                }
            })
        } catch (err) {
            console.info('system_parameter_test_0530 promise get input error: ' + err);
        }
        setTimeout(function(){
            expect(ret).assertTrue();
            done();
        }, '1000');
        console.info('system_parameter_test_0530 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0600
     * @tc.name      testGet0600
     * @tc.desc      Set the value for the given key.
     */
    it('system_parameter_test_0600', 0, function (done) {
        console.info('system_parameter_test_0600 start');
        let ret = false;
        try {
            systemparameter.get('hw_sc.build.os.version', '1.1.1.1', async (err, data) => {
                if (err == undefined && data === '1.1.1.1') {
                    ret = true;
                    console.info('system_parameter_test_0600 get systemparameter hw_sc.build.os.version sucess: '
                    + data);
                    expect(ret).assertTrue();
                } else {
                    console.info('system_parameter_test_0600 get systemparameter hw_sc.build.os.version failed: '
                    + err.code);
                }
            })
        } catch (err) {
            console.info('system_parameter_test_0600 get systemparameter hw_sc.build.os.version abnormal: ', err);
        }
        setTimeout(function(){
            expect(ret).assertTrue();
            done();
        }, '1000');
        console.info('system_parameter_test_0610 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0610
     * @tc.name      testGet0610
     * @tc.desc      Gets an attribute key value whose value is not a string
     */
    it('system_parameter_test_0610', 0, async function (done) {
        console.info('system_parameter_test_0610 start');
        let ret = false;
        try {
            systemparameter.get('hw_sc.build.os.version', 111, (err, data) => {
                if (err == undefined && data === 111) {
                    console.info('system_parameter_test_0610 get systemparameter hw_sc.build.os.version sucess: '
                    + data);
                } else {
                    console.info('system_parameter_test_0610 get systemparameter hw_sc.build.os.version failed: '
                    + err.code);
                }
            })
        } catch (err) {
            ret = true;
            console.info('system_parameter_test_0610 get systemparameter hw_sc.build.os.version abnormal: ', err);
            done();
            setTimeout(function(){
                expect(ret).assertTrue();
            }, '1000');
        }
        console.info('system_parameter_test_0610 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0620
     * @tc.name      testGet0620
     * @tc.desc      Get an attribute key value whose value is empty
     */
    it('system_parameter_test_0620', 0, async function (done) {
        console.info('system_parameter_test_0620 start');
        let ret = false;
        try {
            systemparameter.get('hw_sc.build.os.version', '  ', (err, data) => {
                if (err == undefined) {
                    ret = true;
                    console.info('system_parameter_test_0620 get systemparameter hw_sc.build.os.version sucess: '
                    + data);
                } else {
                    console.info('system_parameter_test_0620 get systemparameter hw_sc.build.os.version failed: '
                    + err.code);
                }
            })
        } catch (err) {
            console.info('system_parameter_test_0620 get systemparameter hw_sc.build.os.version abnormal: ', err);
        }
        setTimeout(function(){
            expect(ret).assertTrue();
            done();
        }, '1000');
        console.info('system_parameter_test_0620 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0640
     * @tc.name      testGet0640
     * @tc.desc      Set the property value to an extra long string
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('system_parameter_test_0640', 0, async function (done) {
        console.info('system_parameter_test_0640 start');
        let ret = false;
        try {
            systemparameter.get('b.b.b.b.b', PROPERTY_MAX_VALUE, (err, data) => {
                if (err == undefined) {
                    console.info('system_parameter_test_0640 get systemparameter b.b.b.b.b sucess: '
                    + data);
                } else {
                    ret = true;
                    console.info('system_parameter_test_0640 get systemparameter b.b.b.b.b failed: ' + err.code);
                }
            })
        } catch (err) {
            console.info('system_parameter_test_0640 get systemparameter b.b.b.b.b abnormal: ', err);
        }
        setTimeout(function(){
            expect(ret).assertTrue();
            done();
        }, '1000');
        console.info('system_parameter_test_0640 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0700
     * @tc.name      testGetSync0700
     * @tc.desc      Gets an attribute key value whose attribute value is not a string
     */
    it('system_parameter_test_0700', 0, function (done) {
        console.info('system_parameter_test_0700 start');
        let ret = false;
        try {
            let parameterInfo = systemparameter.getSync('hw_sc.build.os.version', 496);
            console.info(JSON.stringify(parameterInfo));
        } catch (err) {
            ret = true;
            console.info('system_parameter_test_0700 promise get input error: ' + err);
            done();
        }
        expect(ret).assertTrue();
        console.info('system_parameter_test_0700 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0710
     * @tc.name      testGetSync0710
     * @tc.desc      Get a property key value that sets the correct value
     */
    it('system_parameter_test_0710', 0, function (done) {
        console.info('system_parameter_test_0710 start');
        let ret = false;
        try {
            let parameterInfo = systemparameter.getSync('hw_sc.build.os.version', '0.0.0.0');
            ret = true;
            console.info('system_parameter_test_0710 promise get input sucess: ', parameterInfo);
            done();
        } catch (err) {
            console.info('system_parameter_test_0710 promise get input error: ' + err);
        }
        expect(ret).assertTrue();
        console.info('system_parameter_test_0710 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0720
     * @tc.name      testGetSync0720
     * @tc.desc      Get the value of the attribute key directly
     */
    it('system_parameter_test_0720', 0, function (done) {
        console.info('system_parameter_test_0720 start');
        let ret = false;
        try {
            let parameterInfo = systemparameter.getSync('hw_sc.build.os.version');
            ret = true;
            console.info('system_parameter_test_0720 promise get input sucess: ', parameterInfo);
            done();
        } catch (err) {
            console.info('system_parameter_test_0720 promise get input error: ' + err);
        }
        expect(ret).assertTrue();
        console.info('system_parameter_test_0720: end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0730
     * @tc.name      testGetSync0730
     * @tc.desc      Get the value of the attribute key directly
     */
    it('system_parameter_test_0730', 0, function (done) {
        console.info('system_parameter_test_0730 start');
        let ret = false;
        try {
            let parameterInfo = systemparameter.getSync('a.b.c.d.1.2.3.4', '1.2.3.4');
            console.info('system_parameter_test_0730 get parameter = ', parameterInfo);
            ret = true;
            console.info('system_parameter_test_0730 promise get input sucess: ', parameterInfo);
            done();
        } catch (err) {
            console.info('system_parameter_test_0730 promise get input error: ' + err);
        }
        expect(ret).assertTrue();
        console.info('system_parameter_test_0730: end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0740
     * @tc.name      testGetSync0740
     * @tc.desc      Gets the value of the attribute with the specified key.
     */
    it('system_parameter_test_0740', 0, function (done) {
        console.info('system_parameter_test_0740 start');
        let ret = false;
        try {
            systemparameter.setSync('hw_sc.build.os.version', '9.8.7.6');
            let parameterInfo = systemparameter.getSync('hw_sc.build.os.version', '0.0.0.0');
            ret = true;
            console.info('system_parameter_test_0740 promise get input sucess: ', parameterInfo);
            done();
        } catch (err) {
            console.info('system_parameter_test_0740 promise get input error: ' + err);
        }
        expect(ret).assertTrue();
        console.info('system_parameter_test_0740 : end');
    })

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
    it('system_parameter_test_0801', 0, async function (done) {
        console.info('system_parameter_test_0801 start');
        var ret = false;
        try {
            var parameterInfo = systemparameter.wait("test.wait_param.101", "100", 1);
            parameterInfo.then(function (result) { // timeout
                console.info("system_parameter_test_0801 test.wait_param.101 success: " + result);
                expect(ret).assertTrue();
            }).catch(function (err) {
                ret = true;
                console.info("system_parameter_test_0801 test.wait_param.101 error: " + err.code);
                expect(ret).assertTrue();
                done();
            });
        } catch (e) {
            expect(ret).assertTrue();
            console.info("promise get input error: " + e);
        }
        console.info('system_parameter_test_0801 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0802
     * @tc.name      testWaitPromise02
     * @tc.desc      Waits the value of the attribute with the specified key.
     */
    it('system_parameter_test_0802', 0, async function (done) {
        console.info('system_parameter_test_0802 start');
        var ret = false;
        try {
            var parameterInfo = systemparameter.wait("test.wait_param.102", "", 1);
            parameterInfo.then(function (result) {  // timeout
                console.info("system_parameter_test_0802 test.wait_param.102 success: ");
                expect(ret).assertTrue();
                done();
            }).catch(function (err) {
                ret = true;
                console.info("system_parameter_test_0802 test.wait_param.102 error: " + err.code);
                expect(ret).assertTrue();
                done();
            });
        } catch (e) {
            expect(ret).assertTrue();
            console.info("promise get input error: " + e);
        }
        console.info('system_parameter_test_0802 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0803
     * @tc.name      testWaitPromise03
     * @tc.desc      Waits the value of the attribute with the specified key.
     */
    it('system_parameter_test_0803', 0, async function (done) {
        console.info('system_parameter_test_0803 start');
        var ret = false;
        SetParameter("test.wait_param.103", "103");
        try {
            var parameterInfo = systemparameter.wait("test.wait_param.103", "103", 1);
            parameterInfo.then(function (result) { // ok
                ret = true;
                console.info("system_parameter_test_0803 test.wait_param.103 success: ");
                expect(ret).assertTrue();
                done();
            }).catch(function (err) {
                expect(ret).assertTrue();
                console.info("system_parameter_test_0803 test.wait_param.103 error: " + err.code);
            });
        } catch (e) {
            expect(ret).assertTrue();
            console.info("promise get input error: " + e);
        }
        console.info('system_parameter_test_0803 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0804
     * @tc.name      testWaitPromise04
     * @tc.desc      Waits the value of the attribute with the specified key.
     */
    it('system_parameter_test_0804', 0, async function (done) {
        console.info('system_parameter_test_0804 start');
        var ret = false;
        SetParameter("test.wait_param.104", "104");
        try {
            var parameterInfo = systemparameter.wait("test.wait_param.104", "*", 1);
            parameterInfo.then(function (result) { // ok
                ret = true;
                console.info("system_parameter_test_0804 test.wait_param.104 success" );
                expect(ret).assertTrue();
                done();
            }).catch(function (err) {
                console.info("system_parameter_test_0804 test.wait_param.104 error: " + err.code);
                expect(ret).assertTrue();
            });
        } catch (e) {
            expect(ret).assertTrue();
            console.info("promise get input error: " + e);
        }
        console.info('system_parameter_test_0804 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0805
     * @tc.name      testWaitPromise05
     * @tc.desc      Waits the value of the attribute with the specified key.
     */
    it('system_parameter_test_0805', 0, async function (done) {
        console.info('system_parameter_test_0805 start');
        var ret = false;
        SetParameter("test.wait_param.105", "105");
        try {
            var parameterInfo = systemparameter.wait("test.wait_param.105", "*", -1);
            parameterInfo.then(function (result) {
                ret = true;
                console.info("system_parameter_test_0805 test.wait_param.105 success" );
                expect(ret).assertTrue();
                done();
            }).catch(function (err) {
                console.info("system_parameter_test_0805 test.wait_param.105 error: " + err.code);
                expect(ret).assertTrue();
            });
        } catch (e) {
            expect(ret).assertTrue();
            console.info("promise get input error: " + e);
        }
        console.info('system_parameter_test_0805 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0806
     * @tc.name      testWait01
     * @tc.desc      Waits the value of the attribute with the specified key.
     */
    it('system_parameter_test_0806', 0, async function (done) {
        console.info('system_parameter_test_0806 start');
        var ret = false;
        try {
            systemparameter.wait("test.wait_param.201", "100", 1, function (err, data) {
                if (err == undefined || err.code === 0) {
                    console.info("system_parameter_test_0806 test.wait_param.201 success")
                } else {
                    ret = true; // wait timeout
                    console.info("system_parameter_test_0806 test.wait_param.201 err:" + err.code);
                    expect(ret).assertTrue();
                }
            });
        } catch (e) {
            expect(ret).assertTrue();
            console.info("system_parameter_test_0806 get input error: " + e);
        }
        setTimeout(function(){
            expect(ret).assertTrue();
            done();
        }, '2000');
        console.info('system_parameter_test_0806 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0807
     * @tc.name      testWait02
     * @tc.desc      Waits the value of the attribute with the specified key.
     */
    it('system_parameter_test_0807', 0, async function (done) {
        console.info('system_parameter_test_0807 start');
        var ret = false;
        try {
            ret = true;
            systemparameter.wait("test.wait_param.202", "", 1, function (err, data) {
                if (err == undefined || err.code === 0) { // timeout
                    ret = false;
                    console.info("system_parameter_test_0807 test.wait_param.202 success");
                } else {
                    console.info("system_parameter_test_0807 callback test.wait_param.202 err:" + err.code);
                }
                expect(ret).assertTrue();
                done();
            });
        } catch (e) {
            ret = true;
            console.info("get input error: " + e);
        }
        expect(ret).assertTrue();
        console.info('system_parameter_test_0807 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0808
     * @tc.name      testWait03
     * @tc.desc      Waits the value of the attribute with the specified key.
     */
    it('system_parameter_test_0808', 0, async function (done) {
        console.info('system_parameter_test_0808 start');
        var ret = false;
        SetParameter("test.wait_param.203", "103");
        try {
            systemparameter.wait("test.wait_param.203", "103", 1, function (err, data) {
                if (err == undefined || err.code === 0) {
                    ret = true;
                    console.info("system_parameter_test_0808 test.wait_param.203 success")
                } else {
                    console.info("system_parameter_test_0808 test.wait_param.203 err:" + err.code)
                }
                expect(ret).assertTrue();
            });
        } catch (e) {
            expect(ret).assertTrue();
            console.info("get input error: " + e);
        }
        setTimeout(function(){
            expect(ret).assertTrue();
            done();
        }, '1000');
        console.info('system_parameter_test_0808 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0809
     * @tc.name      testWait04
     * @tc.desc      Waits the value of the attribute with the specified key.
     */
    it('system_parameter_test_0809', 0, async function (done) {
        console.info('system_parameter_test_0809 start');
        var ret = false;
        SetParameter("test.wait_param.204", "104");
        try {
            systemparameter.wait("test.wait_param.204", "*", 1, function (err, data) {
                if (err == undefined || err.code === 0) {
                    ret = true;
                    console.info("system_parameter_test_0809 test.wait_param.204 success")
                } else {
                    ret = false;
                    console.info("system_parameter_test_0809 callback test.wait_param.204 err:" + err.code)
                }
                expect(ret).assertTrue();
            });
        } catch (e) {
            expect(ret).assertTrue();
            console.info("promise get input error: " + e);
        }
        setTimeout(function(){
            expect(ret).assertTrue();
            done();
        }, '1000');
        console.info('system_parameter_test_0809 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0810
     * @tc.name      testWait05
     * @tc.desc      Waits the value of the attribute with the specified key.
     */
    it('system_parameter_test_0810', 0, async function (done) {
        console.info('system_parameter_test_0810 start');
        var ret = false;
        SetParameter("test.wait_param.205", "105");
        try {
            systemparameter.wait("test.wait_param.205", "*", 1, function (err, data) {
                if (err == undefined || err.code === 0) {
                    ret = true;
                    console.info("system_parameter_test_0810 test.wait_param.205 success:" + data)
                } else {
                    console.info("system_parameter_test_0810 test.wait_param.205 err:" + err.code)
                }
                expect(ret).assertTrue();
            });
        } catch (e) {
            ret = false;
            console.info("promise get input error: " + e);
        }
        setTimeout(function(){
            expect(ret).assertTrue();
            done();
        }, '1000');
        console.info('system_parameter_test_0810 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0811
     * @tc.name      testWatcher01
     * @tc.desc      Watch the value of the attribute with the specified key.
     */
    it('system_parameter_test_0811', 0, function () {
        console.info('system_parameter_test_0811 start');
        var ret = true;
        try {
            let watcher = systemparameter.getWatcher("test.watcher_param.205");
            console.info('system_parameter_test_0811 watcher' + watcher);
            if (watcher === undefined) {
                ret = false;
            }
        } catch (e) {
            ret = false;
            console.info("input error: " + e);
        }
        expect(ret).assertTrue();
        console.info('system_parameter_test_0811 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0812
     * @tc.name      testWatcher02
     * @tc.desc      Watch the value of the attribute with the specified key.
     */
    it('system_parameter_test_0812', 0, function () {
        console.info('system_parameter_test_0812 start');
        var ret = true;
        try {
            let watcher = systemparameter.getWatcher("test.watch_param.205", -1);
            console.info('system_parameter_test_0812 watcher' + watcher);
            if (watcher === undefined) {
                ret = false;
            }
        } catch (e) {
            ret = false;
            console.info("input error: " + e);
        }
        expect(ret).assertTrue();
        console.info('system_parameter_test_0812 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0813
     * @tc.name      testWatcher03
     * @tc.desc      Watch the value of the attribute with the specified key.
     */
    it('system_parameter_test_0813', 0, function () {
        console.info('system_parameter_test_0813 start');
        var ret = false;
        try {
            ret = true;
            let watcher = systemparameter.getWatcher("");
            if (watcher === undefined) {
                ret = false;
            }
        } catch (e) {
            ret = true;
            console.info("input error: " + e);
        }
        expect(ret).assertTrue();
        console.info('system_parameter_test_0813 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0814
     * @tc.name      testWatcher04
     * @tc.desc      Watch the value of the attribute with the specified key.
     */
    it('system_parameter_test_0814', 0, function () {
        console.info('system_parameter_test_0814 start');
        var ret = false;
        try {
            ret = true;
            let watcher = systemparameter.getWatcher("test.watcher.304^^^^");
            if (watcher === undefined) {
                ret = false;
            }
        } catch (e) {
            ret = true;
            console.info("input error: " + e);
        }
        expect(ret).assertTrue();
        console.info('system_parameter_test_0814 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0815
     * @tc.name      testWatcher05
     * @tc.desc      Watch the value of the attribute with the specified key.
     */
    it('system_parameter_test_0815', 0, function () {
        console.info('system_parameter_test_0815 start');
        var ret = true;
        try {
            let watcher = systemparameter.getWatcher("test.watcher.304");
            console.info('system_parameter_test_0815 start watcher ' + watcher);
            if (watcher === undefined) {
                ret = false;
            }
        } catch (e) {
            ret = false;
            console.info("input error: " + e);
        }
        expect(ret).assertTrue();
        console.info('system_parameter_test_0815 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0816
     * @tc.name      testWatcherOn01
     * @tc.desc      Watch the value of the attribute with the specified key.
     */
    it('system_parameter_test_0816', 0, function () {
        console.info('system_parameter_test_0816 start');
        var ret = true;
        let key = "test.watcher.401";
        try {
            let watcher = systemparameter.getWatcher(key);
            if (watcher === undefined) {
                ret = false;
                expect(ret).assertTrue();
            } else {
                watcher.on("valueChange", function (key, value) {
                    ret = true;
                    console.info("system_parameter_test_0816 callback key: " + key);
                    console.info("system_parameter_test_0816 callback value: " + value);
                });
                SetParameter(key);
            }
        } catch (e) {
            ret = true;
            console.info("input error: " + e);
        }
        expect(ret).assertTrue();
        console.info('system_parameter_test_0816 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0817
     * @tc.name      testWatcherOn02
     * @tc.desc      Watch the value of the attribute with the specified key.
     */
    it('system_parameter_test_0817', 0, async function (done) {
        console.info('system_parameter_test_0817 start');
        var ret = true;
        let key = "test.watcher.402";
        try {
            let watcher = systemparameter.getWatcher(key);
            if (watcher === undefined) {
                ret = false;
            } else {
                watcher.on("valueChange", function (key, value) { // no callback
                    ret = true;
                    console.info("system_parameter_test_0817 callback key: " + key);
                    console.info("system_parameter_test_0817 callback value: " + value);
                });
            }
        } catch (e) {
            ret = false;
            console.info("input error: " + e);
        }
        expect(ret).assertTrue();
        done();
        console.info('system_parameter_test_0817 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0818
     * @tc.name      testWatcherOn03
     * @tc.desc      Watch the value of the attribute with the specified key.
     */
    it('system_parameter_test_0818', 0, function () {
        console.info('system_parameter_test_0818 start');
        var ret = true;
        let key = "test.watcher.403";
        try {
            let watcher = systemparameter.getWatcher(key + "*");
            if (watcher === undefined) {
                ret = false;
            } else {
                watcher.on("valueChange", function (key, value) {
                    ret = true;
                    console.info("system_parameter_test_0818 callback key: " + key);
                    console.info("system_parameter_test_0818 callback value: " + value);
                });
                SetParameter("test.watcher.403.404");
            }
        } catch (e) {
            ret = false;
            console.info("input error: " + e);
        }
        expect(ret).assertTrue();
        console.info('system_parameter_test_0818 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0819
     * @tc.name      testWatcherOn04
     * @tc.desc      Watch the value of the attribute with the specified key.
     */
    it('system_parameter_test_0819', 0, async function (done) {
        console.info('system_parameter_test_0819 start');
        var ret = false;
        try {
            let watcher = systemparameter.getWatcher("*");
            if (watcher != undefined) {
                let code = watcher.on("valueChange", function (key, value) { // fail
                    ret = true;
                    console.info("system_parameter_test_0819 callback key: " + key);
                    console.info("system_parameter_test_0819 callback value: " + value);
                });
                console.info("system_parameter_test_0819 code: " + code);
                ret = true;
            }
        } catch (e) {
            ret = true;
            console.info("system_parameter_test_0819 error: " + e);
        }
        expect(ret).assertTrue();
        done();
        console.info('system_parameter_test_0819 end');
    })

    function callback1 (key, value) {
        console.info("callback1 Watch callback key: " + key);
        console.info("callback1 Watch callback value: " + value);
    }

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0820
     * @tc.name      testWatcherOn05
     * @tc.desc      Watch the value of the attribute with the specified key.
     */
    it('system_parameter_test_0820', 0, async function (done) {
        console.info('system_parameter_test_0820 start');
        var ret = true;
        let key = "test.watcher.405";
        try {
            let watcher = systemparameter.getWatcher(key);
            if (watcher === undefined) {
                ret = false;
            } else {
                ret = false;
                let code = watcher.on("valueChange", callback1);
                if (code === 0) {
                    ret = true;
                }
                code = watcher.on("valueChange", callback1);
                if (code === 0) {
                    ret = true;
                }
            }
        } catch (e) {
            ret = true;
            console.info("system_parameter_test_0820 input error: " + e);
        }
        expect(ret).assertTrue();
        done();
        console.info('system_parameter_test_0820 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0821
     * @tc.name      testWatcherOff01
     * @tc.desc      Watch the value of the attribute with the specified key.
     */
    it('system_parameter_test_0821', 0, async function (done) {
        console.info('system_parameter_test_0821 start');
        var ret = false;
        let key = "test.watcher.501";
        try {
            let watcher = systemparameter.getWatcher(key);
            if (watcher === undefined) {
                ret = false;
            } else {
                ret = true;
                let code = watcher.on("valueChange", callback1);
                SetParameter(key);
                code = watcher.off("valueChange", callback1);
                if (code === 0) {
                    ret = true;
                }
            }
        } catch (e) {
            ret = false;
            console.info("input error: " + e);
        }
        expect(ret).assertTrue();
        done();
        console.info('system_parameter_test_0821 end ');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0822
     * @tc.name      testWatcherOff02
     * @tc.desc      Watch the value of the attribute with the specified key.
     */
    it('system_parameter_test_0822', 0, function () {
        console.info('system_parameter_test_0822 start');
        var ret = true;
        let key = "test.watcher.502";
        try {
            let watcher = systemparameter.getWatcher(key);
            if (watcher === undefined) {
                ret = false;
            } else {
                let code = watcher.on("valueChange222", callback1);
                if (code === 0) {
                    ret = false;
                }
                code = watcher.off("valueChange222", callback1);
                if (code === 0) {
                    ret = false;
                }
            }
        } catch (e) {
            ret = false;
            console.info("input error: " + e);
        }
        expect(ret).assertTrue();
        console.info('system_parameter_test_0822 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0823
     * @tc.name      testWatcherOff03
     * @tc.desc      Watch the value of the attribute with the specified key.
     */
    it('system_parameter_test_0823', 0, function () {
        console.info('system_parameter_test_0823 start');
        var ret = false;
        let key = "test.watcher.503";
        try {
            let watcher = systemparameter.getWatcher(key);
            if (watcher === undefined) {
                ret = false;
            } else {
                ret = false;
                let code = watcher.on("valueChange", function (key, value) {
                    console.info("system_parameter_test_0823 callback key: " + key);
                    console.info("system_parameter_test_0823 callback value: " + value);
                    let code = watcher.off("valueChange");
                    if (code === 0) {
                        ret = true;
                    }
                });
                if (code === 0) {
                    ret = true;
                }
                SetParameter(key);
            }
        } catch (e) {
            ret = false;
            console.info("input error: " + e);
        }
        expect(ret).assertTrue();
        console.info('system_parameter_test_0823 end');
    })

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0824
     * @tc.name      testWatcherOff04
     * @tc.desc      Watch the value of the attribute with the specified key.
     */
    it('system_parameter_test_0824', 0, function () {
        console.info('system_parameter_test_0824 start');
        var ret = false;
        let key = "test.watcher.504";
        try {
            let watcher = systemparameter.getWatcher(key);
            if (watcher === undefined) {
                ret = false;
            } else {
                ret = false;
                let code = watcher.on("valueChange", callback1);
                if (code === 0) {
                    ret = true;
                }
                code = watcher.off("valueChange", callback1);
                console.info("system_parameter_test_0824 " + code);
                if (code === 0) {
                    ret = true;
                }
                code = watcher.off("valueChange", callback1);
                console.info("system_parameter_test_0824 " + code);
                if (code != 0) {
                    ret = true;
                }
            }
        } catch (e) {
            ret = false;
            console.info("input error: " + e);
        }
        expect(ret).assertTrue();
        console.info('system_parameter_test_0824 end');
    })

    function callback3(key, value) {
        console.info("system_parameter_test_0825 callback key: " + key);
        console.info("system_parameter_test_0825 callback value: " + value);
    }

    /**
     * @tc.number    SUB_STARTUP_JS_SYSTEM_PARAMETER_0825
     * @tc.name      testWatcherOff05
     * @tc.desc      Watch the value of the attribute with the specified key.
     */
    it('system_parameter_test_0825', 0, async function (done) {
        console.info('system_parameter_test_0825 start');
        var ret = false;
        let key = "test.watcher.505";
        try {
            let watcher = systemparameter.getWatcher(key);
            if (watcher === undefined) {
                ret = false;
            } else {
                ret = false;
                let code = watcher.on("valueChange", callback3);
                if (code === 0) {
                    ret = true;
                }
                SetParameter(key);
            }
        } catch (e) {
            ret = false;
            console.info("input error: " + e);
        }
        expect(ret).assertTrue();
        done();
        console.info('system_parameter_test_0825 end');
    })
})