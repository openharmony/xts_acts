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
import featureAbility from '@ohos.ability.featureability'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('ActsContextTest', function () {
    //  @tc.number: ACTS_VerifySelfPermission_0100
    //  @tc.name: verifySelfPermission : Check specific permissions
    //  @tc.desc: Check the return type of the interface (by Promise)
    it('ACTS_VerifySelfPermission_0100', 0, async function (done) {
        var context = featureAbility.getContext().then(
            data=> {
                var promise = data.verifySelfPermission("ohos.permission.CAMERA");
                expect(typeof(promise)).assertEqual("object");
            }
        ).catch(error =>
            console.log("getContext promise::catch : " + error)
        );
        expect(typeof(context)).assertEqual("object");
        done();
    })

    //  @tc.number: ACTS_VerifySelfPermission_0200
    //  @tc.name: verifySelfPermission : Check the status of the specified permission
    //  @tc.desc: Check the status of the specified permission and return the authorized status (by Promise)
    it('ACTS_VerifySelfPermission_0200', 0, async function (done) {
        var context = await featureAbility.getContext();
        var result = await context.verifySelfPermission("ohos.permission.CAMERA");
        expect(result).assertEqual(0);
        done();
    })

    //  @tc.number: ACTS_VerifySelfPermission_0300
    //  @tc.name: verifySelfPermission : Check the status of the specified permission
    //  @tc.desc: Check the status of the specified permission and return the unauthorized status (by Promise)
    it('ACTS_VerifySelfPermission_0300', 0, async function (done) {
        var context = await featureAbility.getContext();
        var result = await context.verifySelfPermission("com.myability.permission.MYPERMISSION_NOT");
        expect(result).assertEqual(-1);
        done();
    })

    //  @tc.number: ACTS_VerifySelfPermission_0400
    //  @tc.name: verifySelfPermission : Check the status of the specified permission
    //  @tc.desc: Check the status of the specified permission and return the authorized status (by callback)
    it('ACTS_VerifySelfPermission_0400', 0, async function (done) {
        var context = featureAbility.getContext(
            (errContext, dataContext) => {
                var info = dataContext.verifySelfPermission("ohos.permission.CAMERA",
                    (err, data) => {
                        expect(data).assertEqual(0);
                        done();
                    }
                );
            }
        );
    })

    //  @tc.number: ACTS_VerifySelfPermission_0500
    //  @tc.name: verifySelfPermission : Check the status of the specified permission
    //  @tc.desc: Check the status of the specified permission and return the unauthorized status (by callback)
    it('ACTS_VerifySelfPermission_0500', 0, async function (done) {
        var context = featureAbility.getContext(
            (errContext, dataContext) => {
                var info = dataContext.verifySelfPermission("com.myability.permission.MYPERMISSION",
                    (err, data) => {
                        console.log("ACTS_VerifySelfPermission_0500>>>err=" + err.code);
                        console.log("ACTS_VerifySelfPermission_0500>>>data=" + data);
                        expect(err.code).assertEqual(-100);
                        expect(data).assertEqual(-1);
                        done();
                    }
                );
            }
        );
    })

    //  @tc.number: ACTS_GetBundleName_0100
    //  @tc.name: getBundleName : Query return value type
    //  @tc.desc: The class of the test return value is made Promise
    it('ACTS_GetBundleName_0100', 0, async function (done) {
        var context = await featureAbility.getContext();
        var result = await context.getBundleName();
        expect(typeof(context)).assertEqual("object");
        done();
    })

    //  @tc.number: ACTS_GetBundleName_0200
    //  @tc.name: getBundleName : Get the bundlename of the hap package
    //  @tc.desc: Get the bundlename of the hap package(by promise)
    it('ACTS_GetBundleName_0200', 0, async function (done) {
        var context = await featureAbility.getContext();
        var result = await context.getBundleName();
        expect(result).assertEqual('com.context.test');
        done();
    })

    //  @tc.number: ACTS_GetBundleName_0300
    //  @tc.name: getBundleName : Get the bundlename of the hap package
    //  @tc.desc: Get the value of return is void (by callback)
    it('ACTS_GetBundleName_0300', 0, async function (done) {
        var context = featureAbility.getContext(
            (errContext, dataContext) => {
                var info = dataContext.getBundleName(
                    (err, data) => {
                        expect(err.code).assertEqual(0);
                        expect(data).assertEqual('com.context.test');
                        done();
                    }
                )
            }
        );
    })

    //  @tc.number: ACTS_GetBundleName_0400
    //  @tc.name: getBundleName : Get the bundlename of the hap package
    //  @tc.desc: Get the bundlename of the hap package(by callback)
    it('ACTS_GetBundleName_0400', 0, async function (done) {
        var context = await featureAbility.getContext();
        var info = context.getBundleName(
            (err, data) => {
                expect(data).assertEqual('com.context.test');
                done();
            }
        );
    })

    //  @tc.number: ACTS_GetBundleName_0500
    //  @tc.name: getBundleName : Get the bundlename of the hap package
    //  @tc.desc: Wrong parameters are provided, and the test return type is void (by callback)
    it('ACTS_GetBundleName_0500', 0, async function (done) {
        var context = await featureAbility.getContext();
        var info = context.getBundleName("error_param",
            (err, data) => {
                expect(data).assertEqual('com.context.test');
                done();
            }
        );
        expect(info).assertEqual(null);
        done();
    })
})
