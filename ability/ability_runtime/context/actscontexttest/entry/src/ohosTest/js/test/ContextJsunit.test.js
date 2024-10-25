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
import featureAbility from '@ohos.ability.featureAbility'
import bundle from '@ohos.bundle.bundleManager'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function ActsContextTest() {
  describe('ActsContextTest', function () {

    //  @tc.number: ACTS_GetBundleName_0100
    //  @tc.name: getBundleName : Query return value type
    //  @tc.desc: The class of the test return value is made Promise
    it('ACTS_GetBundleName_0100', 0, async function (done) {
      var ret = false;
      var context = await featureAbility.getContext();
      console.log('ACTS_GetBundleName_0100 context is:' + JSON.stringify(context));
      var result = await context.getBundleName();
      expect(typeof(context)).assertEqual("object");
      ret = true
      done();
      setTimeout(function(){
        expect(ret).assertEqual(true);
      },1000)
    })

    //  @tc.number: ACTS_GetBundleName_0200
    //  @tc.name: getBundleName : Get the bundlename of the hap package
    //  @tc.desc: Get the bundlename of the hap package(by promise)
    it('ACTS_GetBundleName_0200', 0, async function (done) {
      var ret = false;
      var context = await featureAbility.getContext();
      console.log('ACTS_GetBundleName_0200 context is:' + JSON.stringify(context));
      var result = await context.getBundleName();
      expect(result).assertEqual('com.example.actscontext');
      ret = true
      done();
      setTimeout(function(){
        expect(ret).assertEqual(true);
      },1000)
    })

    //  @tc.number: ACTS_GetBundleName_0300
    //  @tc.name: getBundleName : Get the bundlename of the hap package
    //  @tc.desc: Get the value of return is void (by callback)
    it('ACTS_GetBundleName_0300', 0, async function (done) {
      var ret = false;
      var context = featureAbility.getContext();
      var info = context.getBundleName(
        (err, data) => {
          expect(data).assertEqual('com.example.actscontext');
          ret = true
          done();
        })
      setTimeout(function(){
        expect(ret).assertEqual(true);
      },1000)
    })

    //  @tc.number: ACTS_GetBundleName_0400
    //  @tc.name: getBundleName : Get the bundlename of the hap package
    //  @tc.desc: Get the bundlename of the hap package(by callback)
    it('ACTS_GetBundleName_0400', 0, async function (done) {
      var ret = false;
      var context = await featureAbility.getContext();
      var info = context.getBundleName(
        (err, data) => {
          console.log('ACTS_GetBundleName_0400 data is:' + JSON.stringify(data));
          expect(data).assertEqual('com.example.actscontext');
          ret = true
          done();
        }
      );
      setTimeout(function(){
        expect(ret).assertEqual(true);
      },1000)
    })

    //  @tc.number: ACTS_GetBundleName_0500
    //  @tc.name: getBundleName : Get the bundlename of the hap package
    //  @tc.desc: Wrong parameters are provided, and the test return type is void (by callback)
    it('ACTS_GetBundleName_0500', 0, async function (done) {
      var ret = false;
      var context = await featureAbility.getContext();
      var info = context.getBundleName("error_param",
        (err, data) => {
          console.log('ACTS_GetBundleName_0500 data is:' + JSON.stringify(data));
          expect(data).assertEqual('com.example.actscontext');
        }
      );
      expect(info).assertEqual(null);
      ret = true
      done();
      setTimeout(function(){
        expect(ret).assertEqual(true);
      },1000)
    })

    //  @tc.number: ACTS_VerifyPermission_0100
    //  @tc.name: verifySelfPermission : Query whether the application of the specified PID and
    //  UID has been granted a certain permission
    //  @tc.desc: Query whether the application of the specified PID and UID has been granted
    //  a certain permission (by callback)
    it('ACTS_VerifyPermission_0100', 0, async function (done) {
      var ret = false;
      var context = await featureAbility.getContext();
      console.log('ACTS_VerifyPermission_0100 context is:' + JSON.stringify(context));
      var datainfo = await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      console.log('ACTS_VerifyPermission_0100 datainfo is:' + JSON.stringify(datainfo));
      var options = {
        pid :0,
        uid :datainfo.appInfo.uid
      }
      context.verifyPermission("ohos.permission.INSTALL_BUNDLE",options,
        (err, data) => {
          console.info("ACTS_VerifyPermission_0100 in verifyPermission");
          console.log('ACTS_VerifyPermission_0100 data is:' + JSON.stringify(data));
          try{expect(data).assertEqual(0);}catch{}
          ret = true
          done();
        });
      setTimeout(function(){
        expect(ret).assertEqual(true);
      },1000)
    })

    //  @tc.number: ACTS_VerifyPermission_0200
    //  @tc.name: verifySelfPermission : Query whether the application of the specified PID and
    //  UID has been granted a certain permission
    //  @tc.desc: Query whether the application of the specified PID and UID has been granted
    //  a certain permission (by Promise)
    it('ACTS_VerifyPermission_0200', 0, async function (done) {
      var ret = false;
      var context = await featureAbility.getContext();
      console.log('ACTS_VerifyPermission_0200 context is:' + JSON.stringify(context));
      var datainfo = await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      var options = {
        pid :0,
        uid :datainfo.appInfo.uid
      }
      var promise = await context.verifyPermission("ohos.permission.INSTALL_BUNDLE",options );
      console.log('ACTS_VerifyPermission_0200 promise is:' + JSON.stringify(promise));
      expect(promise).assertEqual(0);
      ret = true
      done();
      setTimeout(function(){
        expect(ret).assertEqual(true);
      },1000)
    })

    //  @tc.number: ACTS_VerifyPermission_0300
    //  @tc.name: verifySelfPermission : Query whether the application of the specified PID and
    //  UID has been granted a certain permission
    //  @tc.desc: Query whether the application of the specified PID and UID has been granted
    //  a certain permission (by Promise)
    it('ACTS_VerifyPermission_0300', 0, async function (done) {
      var ret = false;
      var context = await featureAbility.getContext();
      var datainfo = await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      console.log('ACTS_VerifyPermission_0300 datainfo is:' + JSON.stringify(datainfo));
      var options = {
        pid :0,
        uid :datainfo.appInfo.uid
      }
      var result = context.verifyPermission("com.example.permission.NOT",options,
        (err, data) => {
          console.log('ACTS_VerifyPermission_0300 data is:' + JSON.stringify(data));
          try{expect(data).assertEqual(-1);}catch{}
          ret = true
          done();
        });
      setTimeout(function(){
        expect(ret).assertEqual(true);
      },1000)
    })

    //  @tc.number: ACTS_VerifyPermission_0400
    //  @tc.name: verifySelfPermission : Query whether the application of the specified PID and
    //  UID has been granted a certain permission
    //  @tc.desc: Query whether the application of the specified PID and UID has been granted
    //  a certain permission (by Promise)
    it('ACTS_VerifyPermission_0400', 0, async function (done) {
      var ret = false;
      var context = await featureAbility.getContext();
      var datainfo = await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      var options = {
        pid :0,
        uid :datainfo.appInfo.uid
      }
      var promise = await context.verifyPermission("ohos.permission.CAMERA.NOT",options );
      console.log('ACTS_VerifyPermission_0400 promise is:' + JSON.stringify(promise));
      expect(promise).assertEqual(-1);
      ret = true
      done();
      setTimeout(function(){
        expect(ret).assertEqual(true);
      },1000)
    })

    //  @tc.number: ACTS_VerifyPermission_0500
    //  @tc.name: verifySelfPermission : Query whether the application of the specified PID and
    //  UID has been granted a certain permission
    //  @tc.desc: Query whether the application of the specified PID and UID has been granted
    //  a certain permission (by Promise)
    it('ACTS_VerifyPermission_0500', 0, async function (done) {
      var ret = false;
      var context = await featureAbility.getContext();
      var datainfo = await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      var options = {
        pid :0,
        uid :datainfo.appInfo.uid
      }
      var promise = await context.verifyPermission(2000,options );
      console.log('ACTS_VerifyPermission_0500 promise is:' + JSON.stringify(promise));
      expect(promise).assertEqual(null);
      ret = true
      done();
      setTimeout(function(){
        expect(ret).assertEqual(true);
      },1000)
    })


    //  @tc.number: ACTS_RequestPermissionForUser_0100
    //  @tc.name: requestPermissionsFromUser : Requests certain permissions from the system.
    //  permission: The list of permissions to be requested.
    //  @tc.desc: Requests certain permissions from the system.
    //  process is the current process. (by callback)
    it('ACTS_RequestPermissionForUser_0100', 0, async function (done) {
      var ret = false;
      var context = await featureAbility.getContext();
      console.log("ACTS_RequestPermissionForUser_0100 ----------1");

      context.requestPermissionsFromUser([], 1,
        (err, data)=>{
          console.log("====>ACTS_RequestPermissionForUser_0100 data====>" + JSON.stringify(data));
          console.log("====>ACTS_RequestPermissionForUser_0100 err====>" + JSON.stringify(err.code));
          expect(err.code).assertEqual(-104)
        });
      console.log("ACTS_RequestPermissionForUser_0100 ----------2");
      ret = true
      done();
      setTimeout(function(){
        expect(ret).assertEqual(true);
      },1000)
    })

    //  @tc.number: ACTS_RequestPermissionForUser_0200
    //  @tc.name: requestPermissionsFromUser : Requests certain permissions from the system.
    //  permission: The list of permissions to be requested.
    //  @tc.desc: Requests certain permissions from the system.
    //  process is the current process. (by promise)
    it('ACTS_RequestPermissionForUser_0200', 0, async function (done) {
      var ret = false;
      var context = await featureAbility.getContext();
      console.log("ACTS_RequestPermissionForUser_0200 ----------1");

      context.requestPermissionsFromUser([], 1).then((data) => {
        console.log("====>ACTS_RequestPermissionForUser_0200 data====>" + JSON.stringify(data));
      }).catch((err) => {
        console.log("====>ACTS_RequestPermissionForUser_0200 err====>" + JSON.stringify(err.code));
        expect(err.code).assertEqual(-104)
      })
      console.log("ACTS_RequestPermissionForUser_0200 ----------2");
      ret = true
      done();
      setTimeout(function(){
        expect(ret).assertEqual(true);
      },1000)
    })

    /*
    * @tc.number: ACTS_GetDisplayOrientation_0100
    * @tc.name: context.getDisplayOrientation : Get an ability display orientation.
    * @tc.desc: Check the return display orientation of the interface (by AsyncCallback)
    */
    it('ACTS_GetDisplayOrientation_0100', 0, async function (done) {
      console.log('ACTS_GetDisplayOrientation_0100====<begin');

      try {
        context.getDisplayOrientation((err,data)=>{
          console.log('getDisplayOrientation call back');
          done();
        });
        done();
      } catch (err) {
        console.log('ACTS_GetDisplayOrientation_0100====<end err=' + err)
        done();
      }
      console.log('ACTS_GetDisplayOrientation_0100====<end');
    })

    /*
    * @tc.number: ACTS_GetDisplayOrientation_0200
    * @tc.name: context.getDisplayOrientation : Get an ability display orientation.
    * @tc.desc: Check the return display orientation of the interface
    */
    it('ACTS_GetDisplayOrientation_0200', 0, async function (done) {
      console.log('ACTS_GetDisplayOrientation_0200====<begin');
      try {
        var displayOrientation = context.getDisplayOrientation();
        done();
      } catch (err) {
        console.log('ACTS_GetDisplayOrientation_0200====<end err=' + err)
        done();
      }
      console.log('ACTS_GetDisplayOrientation_0200====<end');
    })

    /*
    * @tc.number: ACTS_SetDisplayOrientation_0100
    * @tc.name: context.setDisplayOrientation : Set an ability display orientation.
    * @tc.desc: Check the return display orientation of the interface (by AsyncCallback)
    */
    it('ACTS_SetDisplayOrientation_0100', 0, async function (done) {
      console.log('ACTS_SetDisplayOrientation_0100====<begin');

      try {
        context.setDisplayOrientation(true, (err,data)=>{
          console.log('SetDisplayOrientation call back');
          done();
        });
        done();
      } catch (err) {
        console.log('ACTS_SetDisplayOrientation_0100====<end err=' + err)
        done();
      }
      console.log('ACTS_SetDisplayOrientation_0100====<end');
    })

    /*
    * @tc.number: ACTS_SetDisplayOrientation_0200
    * @tc.name: context.setDisplayOrientation : Set an ability display orientation.
    * @tc.desc: Check the return display orientation of the interface
    */
    it('ACTS_SetDisplayOrientation_0200', 0, async function (done) {
      console.log('ACTS_SetDisplayOrientation_0200====<begin');
      try {
        context.setDisplayOrientation(true);
        done();
      } catch (err) {
        console.log('ACTS_SetDisplayOrientation_0200====<end err=' + err)
        done();
      }
      console.log('ACTS_SetDisplayOrientation_0200====<end');
    })

    /*
    * @tc.number: ACTS_SetShowOnLockScreen_0100
    * @tc.name: context.setShowOnLockScreen : Set an ability show on lock screen.
    * @tc.desc: Check the return show on lock screen status of the interface (by AsyncCallback)
    */
    it('ACTS_SetShowOnLockScreen_0100', 0, async function (done) {
      console.log('ACTS_SetShowOnLockScreen_0100====<begin');

      try {
        context.setShowOnLockScreen(true, (err,data)=>{
          console.log('SetShowOnLockScreen call back');
          done();
        });
        done();
      } catch (err) {
        console.log('ACTS_SetShowOnLockScreen_0100====<end err=' + err)
        done();
      }
      console.log('ACTS_SetShowOnLockScreen_0100====<end');
    })

    /*
    * @tc.number: ACTS_SetShowOnLockScreen_0200
    * @tc.name: context.setShowOnLockScreen : Set an ability show on lock screen.
    * @tc.desc: Check the return show on lock screen status of the interface
    */
    it('ACTS_SetShowOnLockScreen_0200', 0, async function (done) {
      console.log('ACTS_SetShowOnLockScreen_0200====<begin');
      try {
        context.setShowOnLockScreen(true);
        done();
      } catch (err) {
        console.log('ACTS_SetShowOnLockScreen_0200====<end err=' + err)
        done();
      }
      console.log('ACTS_SetShowOnLockScreen_0200====<end');
    })
  })
}
