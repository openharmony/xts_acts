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

import formManager from '@ohos.ability.formManager'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import {parameterValue, stringTest, numberTest, booleanTest, nullTest, undefinedTest, objectTest, arrayTest, functionTest} from './getParam.js'

const TIMEOUT = 2000;
describe('formFuzzTest', function () {
    console.log("formFuzzTest===start");

    /**
     * @tc.name fuzzTest
     * @tc.number FMS_fuzzTest_0200
     * @tc.desc Check whether the deleteForm interface can pass the fuzzy test (by AsyncCallback)
     */
    it('FMS_fuzzTest_0200_callback', 0, async function (done) {
       console.log("FMS_fuzzTest_0200_callback deleteForm begin");

       var formId = parameterValue();
       console.log("FMS_fuzzTest_0200_callback deleteForm formId typeof:"+ typeof(formId));

       try{
        formManager.deleteForm(
               formId, // formId: number>0 ok
               (err,data) => {
                   console.log("FMS_fuzzTest_0200_callback async::callbak return!!!")
                   console.log("FMS_fuzzTest_0200_callback async::sucess data:" + data);
                   console.log("FMS_fuzzTest_0200_callback async::error err:" + err);
                   expect(err).assertEqual(1);
                   done();
               }
           );
       } catch (e) {
           console.log("FMS_fuzzTest_0200_callback Exception caught:" + e);
           expect(0).assertEqual(0);
       }

       console.log("FMS_fuzzTest_0200_callback deleteForm end");
       done();
       setTimeout(function () {
           console.info('=====================FMS_fuzzTest_0200_callback==================end');
       }, TIMEOUT)
   })

    /**
     * @tc.name fuzzTest
     * @tc.number FMS_fuzzTest_0200
     * @tc.desc Check whether the deleteForm interface can pass the fuzzy test (by Promise)
     */
   it('FMS_fuzzTest_0200_promise', 0, async function (done) {
       console.log("FMS_fuzzTest_0200_promise deleteForm begin");

       var formId = parameterValue();
       console.log("FMS_fuzzTest_0200_promise deleteForm formId typeof:"+ typeof(formId));

       var retResult;
       try{
           retResult = await Promise.all(await formManager.deleteForm(formId)); // formId: number>0 ok
           console.log("FMS_fuzzTest_0200_promise async::sucess retResult:" + retResult);
           expect(retResult).assertEqual(1);
           done();
       } catch (e) {
           console.log("FMS_fuzzTest_0200_promise Exception caught:" + e);
           expect(0).assertEqual(0);
       }

       console.log("FMS_fuzzTest_0200_promise deleteForm end");
       done();
       setTimeout(function () {
           console.info('=====================FMS_fuzzTest_0200_promise==================end');
       }, TIMEOUT)
   })

    /**
     * @tc.name fuzzTest
     * @tc.number FMS_fuzzTest_0300
     * @tc.desc Check whether the releaseForm interface can pass the fuzzy test (by AsyncCallback)
     */
   it('FMS_fuzzTest_0300_param_01_callback', 0, async function (done) {
       console.log("FMS_fuzzTest_0300_param_01_callback releaseForm begin");

       var formId = parameterValue();
       console.log("FMS_fuzzTest_0300_param_01_callback releaseForm formId typeof:"+ typeof(formId));

       var isReleaseCache = booleanTest();
       console.log("FMS_fuzzTest_0300_param_01_callback releaseForm isReleaseCache typeof:"+ typeof(isReleaseCache));

       try{
           formManager.releaseForm(
               formId, // formId: number>0 ok
               isReleaseCache, // isReleaseCache: boolean ok
               (err,data) => {
                   console.log("FMS_fuzzTest_0300_param_01_callback async::callbak return!!!")
                   console.log("FMS_fuzzTest_0300_param_01_callback async::sucess data:" + data);
                   console.log("FMS_fuzzTest_0300_param_01_callback async::error err:" + err);
                   expect(err).assertEqual(1);
                   done();
               }
           );
       } catch (e) {
           console.log("FMS_fuzzTest_0300_param_01_callback Exception caught:" + e);
           expect(0).assertEqual(0);
       }

       console.log("FMS_fuzzTest_0300_param_01_callback releaseForm end");
       done();
       setTimeout(function () {
           console.info('=====================FMS_fuzzTest_0300_param_01_callback==================end');
       }, TIMEOUT)
   })

    /**
     * @tc.name fuzzTest
     * @tc.number FMS_fuzzTest_0300
     * @tc.desc Check whether the releaseForm interface can pass the fuzzy test (by Promise)
     */
   it('FMS_fuzzTest_0300_param_01_promise', 0, async function (done) {
       console.log("FMS_fuzzTest_0300_param_01_promise releaseForm begin");

       var formId = parameterValue();
       console.log("FMS_fuzzTest_0300_param_01_promise releaseForm formId typeof:"+ typeof(formId));

       var isReleaseCache = booleanTest();
       console.log("FMS_fuzzTest_0300_param_01_promise releaseForm isReleaseCache typeof:"+ typeof(isReleaseCache));

       var retResult;
       try{
           retResult = await Promise.all(await formManager.releaseForm(formId, isReleaseCache)); // formId: number>0 ok, isReleaseCache: boolean
           console.log("FMS_fuzzTest_0300_param_01_promise async::sucess retResult:" + retResult);
           expect(retResult).assertEqual(1);
           done();
       } catch (e) {
           console.log("FMS_fuzzTest_0300_param_01_promise Exception caught:" + e);
           expect(0).assertEqual(0);
       }

       console.log("FMS_fuzzTest_0300_param_01_promise releaseForm end");
       done();
       setTimeout(function () {
           console.info('=====================FMS_fuzzTest_0300_param_01_promise==================end');
       }, TIMEOUT)
   })

    /**
     * @tc.name fuzzTest
     * @tc.number FMS_fuzzTest_0300
     * @tc.desc Check whether the releaseForm interface can pass the fuzzy test (by AsyncCallback)
     */
   it('FMS_fuzzTest_0300_param_02_callback', 0, async function (done) {
       console.log("FMS_fuzzTest_0300_param_02_callback releaseForm begin");

       var formId = stringTest();
       console.log("FMS_fuzzTest_0300_param_02_callback releaseForm formId typeof:"+ typeof(formId) + ",formId:" + formId);

       var isReleaseCache = parameterValue();
       console.log("FMS_fuzzTest_0300_param_02_callback releaseForm isReleaseCache typeof:"+ typeof(isReleaseCache));

       try{
           formManager.releaseForm(
               formId, // formId: number>0 ok
               isReleaseCache, // isReleaseCache: boolean ok
               (err,data) => {
                   console.log("FMS_fuzzTest_0300_param_02_callback async::callbak return!!!")
                   console.log("FMS_fuzzTest_0300_param_02_callback async::sucess data:" + data);
                   console.log("FMS_fuzzTest_0300_param_02_callback async::error err:" + err);
                   expect(err).assertEqual(1);
                   done();
               }

           );
       } catch (e) {
           console.log("FMS_fuzzTest_0300_param_02_callback Exception caught:" + e);
           expect(0).assertEqual(0);
       }

       console.log("FMS_fuzzTest_0300_param_02_callback releaseForm end");
       done();
       setTimeout(function () {
           console.info('=====================FMS_fuzzTest_0300_param_02_callback==================end');
       }, TIMEOUT)
   })

    /**
     * @tc.name fuzzTest
     * @tc.number FMS_fuzzTest_0300
     * @tc.desc Check whether the releaseForm interface can pass the fuzzy test (by Promise)
     */
   it('FMS_fuzzTest_0300_param_02_promise', 0, async function (done) {
       console.log("FMS_fuzzTest_0300_param_02_promise releaseForm begin");

       var formId = stringTest();
       console.log("FMS_fuzzTest_0300_param_02_promise releaseForm formId typeof:"+ typeof(formId) + ",formId:" + formId);

       var isReleaseCache = parameterValue();
       console.log("FMS_fuzzTest_0300_param_02_promise releaseForm isReleaseCache typeof:"+ typeof(isReleaseCache));

       var retResult;
       try{
           retResult = await Promise.all(await formManager.releaseForm(formId, isReleaseCache));  // formId: number>0 ok, isReleaseCache: boolean
           console.log("FMS_fuzzTest_0300_param_02_promise async::sucess retResult:" + retResult);
           expect(retResult).assertEqual(1);
           done();
       } catch (e) {
           console.log("FMS_fuzzTest_0300_param_02_promise Exception caught:" + e);
           expect(0).assertEqual(0);
       }

       console.log("FMS_fuzzTest_0300_param_02_promise releaseForm end");
       done();
       setTimeout(function () {
           console.info('=====================FMS_fuzzTest_0300_param_02_promise==================end');
       }, TIMEOUT)
   })

    /**
     * @tc.name fuzzTest
     * @tc.number FMS_fuzzTest_1200
     * @tc.desc Check whether the getAllFormsInfo interface can pass the fuzzy test (by AsyncCallback)
     */
     it('FMS_fuzzTest_1200_callback', 0, async function (done) {
        console.log("FMS_fuzzTest_1200_callback getAllFormsInfo begin");

        var testParam = parameterValue();
        console.log("FMS_fuzzTest_1200_callback getAllFormsInfo formIds typeof:"+ typeof(testParam));

        try{
            formManager.getAllFormsInfo(
                testParam, // formIds: array ok
                (err,data) => {
                    console.log("FMS_fuzzTest_1200_callback async::callbak return!!!")
                    console.log("FMS_fuzzTest_1200_callback async::sucess data:" + data);
                    console.log("FMS_fuzzTest_1200_callback async::error err:" + err);
                    expect(err).assertEqual(1);
                    done();
                }
            );
        } catch (e) {
            console.log("FMS_fuzzTest_1200_callback Exception caught:" + e);
            expect(0).assertEqual(0);
        }

        console.log("FMS_fuzzTest_1200_callback getAllFormsInfo end");
        done();
        setTimeout(function () {
            console.info('=====================FMS_fuzzTest_1200_callback==================end');
        }, TIMEOUT)
    })

    /**
     * @tc.name fuzzTest
     * @tc.number FMS_fuzzTest_1200
     * @tc.desc Check whether the getAllFormsInfo interface can pass the fuzzy test (by Promise)
     */
    it('FMS_fuzzTest_1200_promise', 0, async function (done) {
        console.log("FMS_fuzzTest_1200_promise getAllFormsInfo begin");

        var testParam = parameterValue();
        console.log("FMS_fuzzTest_1200_promise getAllFormsInfo formIds typeof:"+ typeof(testParam));

        var retResult;
        try{
            retResult = await Promise.all(await formManager.getAllFormsInfo(testParam));
            console.log("FMS_fuzzTest_1200_promise async::sucess retResult:" + retResult);
            expect(retResult).assertEqual(1);
            done();
        } catch (e) {
            console.log("FMS_fuzzTest_1200_promise Exception caught:" + e);
            expect(0).assertEqual(0);
        }

        console.log("FMS_fuzzTest_1200_promise getAllFormsInfo end");
        done();
        setTimeout(function () {
            console.info('=====================FMS_fuzzTest_1200_promise==================end');
        }, TIMEOUT)
    })
    
    /**
     * @tc.name fuzzTest
     * @tc.number FMS_fuzzTest_1300
     * @tc.desc Check whether the form configuration information query interface of the specified package 
     * can pass the fuzzy test (by AsyncCallback)
     */
    it('FMS_fuzzTest_1300_callback', 0, async function (done) {
        console.log("FMS_fuzzTest_1300_callback getFormsInfoByApp begin");

        var bundleName = parameterValue();
        console.log("FMS_fuzzTest_1300_callback getFormsInfoByApp bundleName typeof:"+ typeof(bundleName));

        try{
            formManager.getFormsInfo(
                bundleName, // bundleName string
                (err,data) => {
                    console.log("FMS_fuzzTest_1300_callback async::callbak return!!!")
                    console.log("FMS_fuzzTest_1300_callback async::sucess data:" + data);
                    console.log("FMS_fuzzTest_1300_callback async::error err:" + err);
                    expect(err).assertEqual(1);
                    done();
                }
            );
        } catch (e) {
            console.log("FMS_fuzzTest_1300_callback Exception caught:" + e);
            expect(0).assertEqual(0);
        }

        console.log("FMS_fuzzTest_1300_callback getFormsInfoByApp end");
        done();
        setTimeout(function () {
            console.info('=====================FMS_fuzzTest_1300_callback==================end');
        }, TIMEOUT)
    })

    /**
     * @tc.name fuzzTest
     * @tc.number FMS_fuzzTest_1300
     * @tc.desc Check whether the form configuration information query interface of the specified package 
     * can pass the fuzzy test (by Promise)
     */
    it('FMS_fuzzTest_1300_promise', 0, async function (done) {
        console.log("FMS_fuzzTest_1300_promise getFormsInfoByApp begin");

        var bundleName = parameterValue();
        console.log("FMS_fuzzTest_1300_promise getFormsInfoByApp bundleName typeof:"+ typeof(bundleName));

        var retResult;
        try{
            retResult = await Promise.all(await formManager.getFormsInfo(bundleName));
            console.log("FMS_fuzzTest_1300_promise async::sucess retResult:" + retResult);
            expect(retResult).assertEqual(1);
            done();
        } catch (e) {
            console.log("FMS_fuzzTest_1300_promise Exception caught:" + e);
            expect(0).assertEqual(0);
        }

        console.log("FMS_fuzzTest_1300_promise getFormsInfoByApp end");
        done();
        setTimeout(function () {
            console.info('=====================FMS_fuzzTest_1300_promise==================end');
        }, TIMEOUT)
    })

    /**
     * @tc.name fuzzTest
     * @tc.number FMS_fuzzTest_1400
     * @tc.desc Check whether the form configuration information query interface of the specified module 
     * can pass the fuzzy test (by AsyncCallback)
     */
    it('FMS_fuzzTest_1400_param_01_callback', 0, async function (done) {
        console.log("FMS_fuzzTest_1400_param_01_callback getFormsInfoByModule begin");

        var bundleName = parameterValue();
        console.log("FMS_fuzzTest_1400_param_01_callback getFormsInfoByModule bundleName typeof:"+ typeof(bundleName));

        var moduleName = stringTest();
        console.log("FMS_fuzzTest_1400_param_01_callback getFormsInfoByModule moduleName typeof:"+ typeof(moduleName));

        try{
            formManager.getFormsInfo(
                bundleName, // bundleName string
                moduleName,// moduleName string
                (err,data) => {
                    console.log("FMS_fuzzTest_1400_param_01_callback async::callbak return!!!")
                    console.log("FMS_fuzzTest_1400_param_01_callback async::sucess data:" + data);
                    console.log("FMS_fuzzTest_1400_param_01_callback async::error err:" + err);
                    expect(err).assertEqual(1);
                    done();
                }
            );
        } catch (e) {
            console.log("FMS_fuzzTest_1400_param_01_callback Exception caught:" + e);
            expect(0).assertEqual(0);
        }

        console.log("FMS_fuzzTest_1400_param_01_callback getFormsInfoByModule end");
        done();
        setTimeout(function () {
            console.info('=====================FMS_fuzzTest_1400_param_01_callback==================end');
        }, TIMEOUT)
    })

    /**
     * @tc.name fuzzTest
     * @tc.number FMS_fuzzTest_1400
     * @tc.desc Check whether the form configuration information query interface of the specified module 
     * can pass the fuzzy test (by Promise)
     */
    it('FMS_fuzzTest_1400_param_01_promise', 0, async function (done) {
        console.log("FMS_fuzzTest_1400_param_01_promise getFormsInfoByModule begin");

        var bundleName = parameterValue();
        console.log("FMS_fuzzTest_1400_param_01_promise getFormsInfoByModule bundleName typeof:"+ typeof(bundleName));

        var moduleName = stringTest();
        console.log("FMS_fuzzTest_1400_param_01_promise getFormsInfoByModule moduleName typeof:"+ typeof(moduleName));

        var retResult;
        try{
            retResult = await Promise.all(await formManager.getFormsInfo(bundleName, moduleName));
            console.log("FMS_fuzzTest_1400_param_01_promise async::sucess retResult:" + retResult);
            expect(retResult).assertEqual(1);
            done();
        } catch (e) {
            console.log("FMS_fuzzTest_1400_param_01_promise Exception caught:" + e);
            expect(0).assertEqual(0);
        }

        console.log("FMS_fuzzTest_1400_param_01_promise getFormsInfoByModule end");
        done();
        setTimeout(function () {
            console.info('=====================FMS_fuzzTest_1400_param_01_promise==================end');
        }, TIMEOUT)
    })

    /**
     * @tc.name fuzzTest
     * @tc.number FMS_fuzzTest_1400
     * @tc.desc Check whether the form configuration information query interface of the specified module 
     * can pass the fuzzy test (by AsyncCallback)
     */
    it('FMS_fuzzTest_1400_param_02_callback', 0, async function (done) {
        console.log("FMS_fuzzTest_1400_param_02_callback getFormsInfoByModule begin");

        var bundleName = stringTest();
        console.log("FMS_fuzzTest_1400_param_02_callback getFormsInfoByModule bundleName typeof:"+ typeof(bundleName));

        var moduleName = parameterValue();
        console.log("FMS_fuzzTest_1400_param_02_callback getFormsInfoByModule moduleName typeof:"+ typeof(moduleName));

        try{
            formManager.getFormsInfo(
                bundleName, // bundleName string
                moduleName, // moduleName string
                (err,data) => {
                    console.log("FMS_fuzzTest_1400_param_02_callback async::callbak return!!!")
                    console.log("FMS_fuzzTest_1400_param_02_callback async::sucess data:" + data);
                    console.log("FMS_fuzzTest_1400_param_02_callback async::error err:" + err);
                    expect(err).assertEqual(1);
                    done();
                }
            );
        } catch (e) {
            console.log("FMS_fuzzTest_1400_param_02_callback Exception caught:" + e);
            expect(0).assertEqual(0);
        }

        console.log("FMS_fuzzTest_1400_param_02_callback getFormsInfoByModule end");
        done();
        setTimeout(function () {
            console.info('=====================FMS_fuzzTest_1400_param_02_callback==================end');
        }, TIMEOUT)
    })

    /**
     * @tc.name fuzzTest
     * @tc.number FMS_fuzzTest_1400
     * @tc.desc Check whether the form configuration information query interface of the specified module 
     * can pass the fuzzy test (by Promise)
     */
    it('FMS_fuzzTest_1400_param_02_promise', 0, async function (done) {
        console.log("FMS_fuzzTest_1400_param_02_promise getFormsInfoByModule begin");

        var bundleName = stringTest();
        console.log("FMS_fuzzTest_1400_param_02_promise getFormsInfoByModule bundleName typeof:"+ typeof(bundleName));

        var moduleName = parameterValue();
        console.log("FMS_fuzzTest_1400_param_02_promise getFormsInfoByModule moduleName typeof:"+ typeof(moduleName));

        var retResult;
        try{
            retResult = await Promise.all(await formManager.getFormsInfo(bundleName, moduleName));
            console.log("FMS_fuzzTest_1400_param_02_promise async::sucess retResult:" + retResult);
            expect(retResult).assertEqual(1);
            done();
        } catch (e) {
            console.log("FMS_fuzzTest_1400_param_02_promise Exception caught:" + e);
            expect(0).assertEqual(0);
        }

        console.log("FMS_fuzzTest_1400_param_02_promise getFormsInfoByModule end");
        done();
        setTimeout(function () {
            console.info('=====================FMS_fuzzTest_1400_param_02_promise==================end');
        }, TIMEOUT)
    })
    
})