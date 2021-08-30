/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import bundle from '@ohos.bundle'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('ActsContextTest', function () {
    //  @tc.number: ACTS_VerifySelfPermission_0100
    //  @tc.name: verifySelfPermission : Check specific permissions
    //  @tc.desc: Check the return type of the interface (by Promise)
    it('ACTS_VerifySelfPermission_0100', 0, async function (done) {
        var context = featureAbility.getContext().then(
            data=> {
                var promise = data.verifySelfPermission("com.example.permission");
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
        var result = await context.verifySelfPermission("com.example.permission");
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
                var info = dataContext.verifySelfPermission("com.example.permission",
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
                        console.log("ACTS_VerifySelfPermission_0500>>>data=" + data);
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
        expect(result).assertEqual('com.example.actscontext');
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
                        expect(data).assertEqual('com.example.actscontext');
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
                expect(data).assertEqual('com.example.actscontext');
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
                expect(data).assertEqual('com.example.actscontext');
                done();
            }
        );
        expect(info).assertEqual(null);
        done();
    })

    //  @tc.number: ACTS_VerifyPermission_0100
    //  @tc.name: verifySelfPermission : Query whether the application of the specified PID and
    //  UID has been granted a certain permission
    //  @tc.desc: Query whether the application of the specified PID and UID has been granted
    //  a certain permission (by callback)
    it('ACTS_VerifyPermission_0100', 0, async function (done) {
        var context = await featureAbility.getContext();
        var datainfo = await bundle.getBundleInfo('com.example.actscontext',1);
        var result = context.verifyPermission("com.example.permission",0,datainfo.uid,
            (err, data) => {
                expect(data).assertEqual(0);
                done();
            });
    })

    //  @tc.number: ACTS_VerifyPermission_0200
    //  @tc.name: verifySelfPermission : Query whether the application of the specified PID and
    //  UID has been granted a certain permission
    //  @tc.desc: Query whether the application of the specified PID and UID has been granted
    //  a certain permission (by Promise)
    it('ACTS_VerifyPermission_0200', 0, async function (done) {
        var context = await featureAbility.getContext();
        var datainfo = await bundle.getBundleInfo('com.example.actscontext',1);
        var promise = await context.verifyPermission("com.example.permission",0,datainfo.uid );
        expect(promise).assertEqual(0);
        done();
    })

    //  @tc.number: ACTS_VerifyPermission_0300
    //  @tc.name: verifySelfPermission : Query whether the application of the specified PID and
    //  UID has been granted a certain permission
    //  @tc.desc: Query whether the application of the specified PID and UID has been granted
    //  a certain permission (by Promise)
    it('ACTS_VerifyPermission_0300', 0, async function (done) {
        var context = await featureAbility.getContext();
        var datainfo = await bundle.getBundleInfo('com.example.actscontext',1);
        var result = context.verifyPermission("com.example.permission.NOT",0,datainfo.uid,
            (err, data) => {
                expect(data).assertEqual(-1);
                done();
            });
    })

    //  @tc.number: ACTS_VerifyPermission_0400
    //  @tc.name: verifySelfPermission : Query whether the application of the specified PID and
    //  UID has been granted a certain permission
    //  @tc.desc: Query whether the application of the specified PID and UID has been granted
    //  a certain permission (by Promise)
    it('ACTS_VerifyPermission_0400', 0, async function (done) {
        var context = await featureAbility.getContext();
        var datainfo = await bundle.getBundleInfo('com.example.actscontext',1);
        var promise = await context.verifyPermission("ohos.permission.CAMERA.NOT",0,datainfo.uid );
        expect(promise).assertEqual(-1);
        done();
    })

    //  @tc.number: ACTS_VerifyPermission_0500
    //  @tc.name: verifySelfPermission : Query whether the application of the specified PID and
    //  UID has been granted a certain permission
    //  @tc.desc: Query whether the application of the specified PID and UID has been granted
    //  a certain permission (by Promise)
    it('ACTS_VerifyPermission_0500', 0, async function (done) {
        var context = await featureAbility.getContext();
        var datainfo = await bundle.getBundleInfo('com.example.actscontext',1);
        var promise = await context.verifyPermission(2000,0,datainfo.uid );
        expect(promise).assertEqual(null);
        done();
    })

    //  @tc.number: ACTS_CanRequestPermission_0100
    //  @tc.name: CanRequestPermission : Whether to request the camera function permission to
    //  the authorization management module to have the permission
    //  @tc.desc: Whether to request the camera function permission to the authorization management
    //  module to have the permission (by CallBack)
    it('ACTS_CanRequestPermission_0100', 0, async function (done) {
        var context = await featureAbility.getContext();
        var result = context.canRequestPermission("com.example.permission.user",
            (err, data) => {
                expect(data).assertEqual(true);
                done();
            });
    })

    //  @tc.number: ACTS_CanRequestPermission_0200
    //  @tc.name: CanRequestPermission : Whether to request the camera function permission to
    //  the authorization management module to have the permission
    //  @tc.desc: Whether to request the camera function permission to the authorization management
    //  module to have the permission (by Promise)
    it('ACTS_CanRequestPermission_0200', 0, async function (done){
        var context = await featureAbility.getContext();
        var promise = await context.canRequestPermission("com.example.permission.user");
        expect(promise).assertEqual(true);
        done();
    })

    //  @tc.number: ACTS_CanRequestPermission_0300
    //  @tc.name: CanRequestPermission : Whether to request the camera function permission to
    //  the authorization management module to have the permission
    //  @tc.desc: Whether to request the camera function permission to the authorization management
    //  module to have the permission (by CallBack)
    it('ACTS_CanRequestPermission_0300', 0, async function (done) {
        var context = await featureAbility.getContext();
        var result = context.canRequestPermission("com.example.permission",
            (err, data) => {
                expect(data).assertEqual(false);
                done();
            });
    })

    //  @tc.number: ACTS_CanRequestPermission_0400
    //  @tc.name: CanRequestPermission : Whether to request the camera function permission to
    //  the authorization management module to have the permission
    //  @tc.desc: Whether to request the camera function permission to the authorization management
    //  module to have the permission (by Promise)
    it('ACTS_CanRequestPermission_0400', 0, async function (done){
        var context = await featureAbility.getContext();
        var promise = await context.canRequestPermission("com.example.permission");
        expect(promise).assertEqual(false);
        done();
    })

    //  @tc.number: ACTS_CanRequestPermission_0500
    //  @tc.name: CanRequestPermission : Whether to request the camera function permission to
    //  the authorization management module to have the permission
    //  @tc.desc: Whether to request the camera function permission to the authorization management
    //  module to have the permission (by Promise)
    it('ACTS_CanRequestPermission_0500', 0, async function (done){
        var context = await featureAbility.getContext();
        var promise = await context.canRequestPermission(1000);
        expect(promise).assertEqual(null);
        done();
    })

    //  @tc.number: ACTS_VerifyCallingPermission_0100
    //  @tc.name: verifyCallingPermission : Checks whether the calling process for inter-process communication has the given
    //  permission.The calling process is not the current process.
    //  @tc.desc: Checks whether the calling process for inter-process communication has the given permission.The calling
    //  process is not the current process. (by callback)
    it('ACTS_Calling_0100', 0, async function (done) {
        var promise = await featureAbility.startAbility(
            {
                want:{
                    deviceId: "",
                    bundleName: "com.example.actscontextcallingtest",
                    abilityName: "com.example.actscontextcallingtest.MainAbility"
                }
            });
        done();
    })

    //  @tc.number: ACTS_RequestPermissionForUser_0100
    //  @tc.name: requestPermissionsFromUser : Requests certain permissions from the system.
    //  permission: The list of permissions to be requested.
    //  @tc.desc: Requests certain permissions from the system.
    //  process is the current process. (by callback)
    it('ACTS_RequestPermissionForUser_0100', 0, async function (done) {
        var context = await featureAbility.getContext();
        console.log("RequestPermissionForUser ----------1");

        context.requestPermissionsFromUser(["com.example.permission1", "com.example.permission2", "com.example.permission3",
            "com.example.permission4", "com.example.permission5"], 1,
            (err, data)=>{
                console.log("RequestPermissionForUser ----------2 requestCode=" + data.requestCode);
                for(var j = 0; j < data.permissions.length; j++) {
                    console.log("====RequestPermissionForUser permissions : " + data.permissions[j]);
                }

                for(var j = 0; j < data.grantResults.length; j++) {
                    console.log("====RequestPermissionForUser grantResults : " + data.grantResults[j]);
                }
            });
        console.log("RequestPermissionForUser ----------3");
        done();
    })

})
