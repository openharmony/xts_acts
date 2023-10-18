/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import bundleManager from '@ohos.bundle.bundleManager';
import osAccount from '@ohos.account.osAccount'
import deviceInfo from '@ohos.deviceInfo'

const GrantStatus = abilityAccessCtrl.GrantStatus;

const TIMEOUT = 5000;
const ERR_PARAM_INVALID = 12100001;

var permissionNameUser = "ohos.permission.DISTRIBUTED_DATASYNC";
var permissionNameSystem = "ohos.permission.GET_BUNDLE_INFO";
var tokenID = 11;

export default function AccessTokenTest() {
  describe('AccessTokenTest', function () {
    beforeAll(async function (done) {
      var accountManager = osAccount.getAccountManager();
      var userId = await accountManager.getOsAccountLocalIdFromProcess();
      try {
        let productModelInfo = deviceInfo.productModel;
        if (productModelInfo == "ohos") {
          let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
          var buddleInfo = await bundleManager.getBundleInfoForSelf(bundleFlags);
          console.log('getBundleInfoForSelf ok')
          var appInfo = buddleInfo.appInfo;
          console.log('getBundleInfoForSelf ok2')
          tokenID = appInfo.accessTokenId;
          console.log('getBundleInfoForSelf ok3'+tokenID)
          console.info("AccessTokenTest accessTokenId:" + appInfo.accessTokenId + ", name:" + appInfo.name
          + ", bundleName:" + 'com.example.myapplication')

          console.info("sleep begin");
          sleep(TIMEOUT);
          console.info("sleep end");
          done();
        }else{
          tokenID = 11;
        }
      } catch (err) {
        console.log('beforeAll error' + JSON.stringify(err));
        done();
      }

    })
    beforeEach(function () {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(function () {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    function sleep(delay) {
      var start = (new Date()).getTime();
      var next = (new Date()).getTime();
      while (next - start < delay) {
        next = (new Date()).getTime();
      }
    }

    /**
     *@tc.number    : TEST_CHECK_ACCESS_TOKEN_001
     *@tc.name      : testCheckAccessToken001
     *@tc.desc      : After the installation, user_grant permission is not granted by default(Promise).
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('testCheckAccessToken001', 0, async function(done){
      console.info("Test_checkAccessToken_001 start");
      var atManager = abilityAccessCtrl.createAtManager();
      try {
        var result = await atManager.checkAccessToken(tokenID,permissionNameUser);
        console.info("Test_checkAccessToken_001 tokenID" + tokenID + "-" + result)
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch(error) {
        console.info("Test_checkAccessToken_001 tokenID" + JSON.stringify(error))
      }
      done();
    })

    /**
     *@tc.number    : TEST_CHECK_ACCESS_TOKEN_002
     *@tc.name      : testCheckAccessToken002
     *@tc.desc      : After the installation, system_grant permission is granted by default(Promise).
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('testCheckAccessToken002', 0, async function(done){
      console.info("Test_checkAccessToken_002 start");
      var atManager = abilityAccessCtrl.createAtManager();
      try {
        var result = await atManager.checkAccessToken(tokenID,permissionNameSystem);
        console.info("Test_checkAccessToken_002 tokenID" + tokenID + "-" + result)
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch(error) {
        console.info("Test_checkAccessToken_002 error code" + error.code + "error message" + error.message);
      }
    })

    /**
     *@tc.number    : TEST_CHECK_ACCESS_TOKEN_003
     *@tc.name      : testCheckAccessToken003
     *@tc.desc      : Test invalid permission(empty)(Promise).
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('testCheckAccessToken003', 0, async function(done){
      console.info("Test_checkAccessToken_003 start");
      var atManager = abilityAccessCtrl.createAtManager();
      try {
        atManager.checkAccessToken(tokenID, "").then((data) => {
          console.log(`Test_checkAccessToken_003 , data->${JSON.stringify(data)}`);
        }).catch((err) => {
          console.log(`Test_checkAccessToken_003 err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(ERR_PARAM_INVALID)
          done();
        });
      }catch(err) {
        console.log(`catch err->${JSON.stringify(err)}`);
      }
    })

    /**
     *@tc.number    : TEST_CHECK_ACCESS_TOKEN_004
     *@tc.name      : testCheckAccessToken004
     *@tc.desc      : Test invalid tokenId(Promise).
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('testCheckAccessToken004', 0, async function(done){
      console.info("Test_checkAccessToken_004 start");
      var atManager = abilityAccessCtrl.createAtManager();
      try {
        atManager.checkAccessToken(11, permissionNameUser).then((data) => {
          console.log(`Test_checkAccessToken_004 data->${JSON.stringify(data)}`);
          expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
          done();
        }).catch((err) => {
          console.log(`Test_checkAccessToken_004 err->${JSON.stringify(err)}`);
        });
      }catch(err) {
        console.log(`catch err->${JSON.stringify(err)}`);
      }
    })

    /**
     *@tc.number    : TEST_CHECK_ACCESS_TOKEN_005
     *@tc.name      : testCheckAccessToken005
     *@tc.desc      : Test invalid permission(length exceeds 256)(Promise).
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('testCheckAccessToken005', 0, async function(done){
      console.info("Test_checkAccessToken_005 start");
      var atManager = abilityAccessCtrl.createAtManager();
      var permissionName = "ohos.permission.testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
      + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
      + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest";
      try {
        atManager.checkAccessToken(tokenID, permissionName).then((data) => {
          console.log(`Test_checkAccessToken_005 success, data->${JSON.stringify(data)}`);
        }).catch((err) => {
          console.log(`Test_checkAccessToken_005 err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(ERR_PARAM_INVALID)
          done();
        });
      }catch(err) {
        console.log(`catch err->${JSON.stringify(err)}`);
      }
    })

    /**
     *@tc.number    : TEST_CHECK_ACCESS_TOKEN_SYNC_001
     *@tc.name      : testCheckAccessTokenSync001
     *@tc.desc      : After the installation, user_grant permission is not granted by default(Promise).
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('testCheckAccessTokenSync001', 0, async function(done){
      console.info("Test_checkAccessTokenSync_001 start");
      var atManager = abilityAccessCtrl.createAtManager();
      try {
        var result = await atManager.checkAccessTokenSync(tokenID,permissionNameUser);
        console.info("Test_checkAccessTokenSync_001 tokenID" + tokenID + "-" + result)
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch(error) {
        console.info("Test_checkAccessTokenSync_001 tokenID" + JSON.stringify(error))
      }
    })

    /**
     *@tc.number    : TEST_CHECK_ACCESS_TOKEN_SYNC_002
     *@tc.name      : testCheckAccessTokenSync002
     *@tc.desc      : After the installation, system_grant permission is granted by default(Promise).
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('testCheckAccessTokenSync002', 0, async function(done){
      console.info("Test_checkAccessTokenSync_002 start");
      var atManager = abilityAccessCtrl.createAtManager();
      try {
        var result = await atManager.checkAccessTokenSync(tokenID,permissionNameSystem);
        console.info("Test_checkAccessTokenSync_002 tokenID" + tokenID + "-" + result)
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch(error) {
        console.info("Test_checkAccessTokenSync_002 error code" + error.code + "error message" + error.message);
      }
    })

    /**
     *@tc.number    : TEST_CHECK_ACCESS_TOKEN_SYNC_003
     *@tc.name      : testCheckAccessTokenSync003
     *@tc.desc      : Test invalid permission(empty)(Promise).
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('testCheckAccessTokenSync003', 0, async function(done){
      console.info("Test_checkAccessTokenSync_003 start");
      var atManager = abilityAccessCtrl.createAtManager();
      try {
        var result = await atManager.checkAccessTokenSync(tokenID,"");
      } catch(error) {
        console.info("Test_checkAccessTokenSync_003 error code" + error.code + "error message" + error.message);
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     *@tc.number    : TEST_CHECK_ACCESS_TOKEN_SYNC_004
     *@tc.name      : testCheckAccessTokenSync004
     *@tc.desc      : Test invalid tokenId(Promise).
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('testCheckAccessTokenSync004', 0, async function(done){
      console.info("Test_checkAccessTokenSync_004 start");
      var atManager = abilityAccessCtrl.createAtManager();
      try {
        var result = await atManager.checkAccessTokenSync(11,permissionNameSystem);
        console.info("Test_checkAccessTokenSync_004 tokenID" + tokenID + "-" + result)
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch(error) {
        console.info("Test_checkAccessTokenSync_004 error code" + error.code + "error message" + error.message);
      }
    })

    /**
     *@tc.number    : TEST_CHECK_ACCESS_TOKEN_SYNC_005
     *@tc.name      : testCheckAccessTokenSync005
     *@tc.desc      : Test invalid permission(length exceeds 256)(Promise).
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('testCheckAccessTokenSync005', 0, async function(done){
      console.info("Test_checkAccessTokenSync_005 start");
      var atManager = abilityAccessCtrl.createAtManager();
      var permissionName = "ohos.permission.testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
      + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
      + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest";
      try {
        var result = await atManager.checkAccessTokenSync(tokenID,permissionName);
      } catch(error) {
        console.info("Test_checkAccessTokenSync_005 error code" + error.code + "error message" + error.message);
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     *@tc.number    : TEST_REQUEST_PERMISSION_FROM_USER_001
     *@tc.name      : testRequestPermissionFromUser001
     *@tc.desc      : Exception scenario use case(Promise).
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it("testRequestPermissionFromUser001", 0, async function (done) {
      console.info("Test_requestPermissionsFromUser_001 start");
      var atManager = abilityAccessCtrl.createAtManager();
      try {
        atManager
          .requestPermissionsFromUser(globalThis.abilityContext, ["ohos.permission.CAMERA"])
          .then((data) => {
            try {
              console.info("Test_requestPermissionsFromUser_001 data:" + JSON.stringify(data));
              console.info("Test_requestPermissionsFromUser_001 data permissions:" + data.permissions);
              console.info("Test_requestPermissionsFromUser_001 data authResults:" + data.authResults);
              expect(data.permissions[0] == "ohos.permission.CAMERA").assertTrue();
              expect(data.authResults[0] == 2).assertTrue();
              done();
            } catch (err) {
              console.info("testRequestPermissionFromUser001 meet error:" + JSON.stringify(err));
              done();
            }
          })
          .catch((err) => {
            console.info("data:" + JSON.stringify(err));
            done();
          });
      } catch (err) {
        console.log(`Test_requestPermissionsFromUser_001 catch err->${JSON.stringify(err)}`);
        done();
      }
    });

    /**
     *@tc.number    : TEST_REQUEST_PERMISSION_FROM_USER_002
     *@tc.name      : testRequestPermissionFromUser002
     *@tc.desc      : Exception scenario use case(Promise).
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it("testRequestPermissionFromUser002", 0, async function (done) {
      console.info("Test_requestPermissionsFromUser_002 start");
      var atManager = abilityAccessCtrl.createAtManager();
      console.info("Test_requestPermissionsFromUser_002 start");
      try {
        var result = atManager
          .requestPermissionsFromUser(globalThis.abilityContext, ["abc"])
          .then((data) => {
            console.info("Test_requestPermissionsFromUser_002 data:" + JSON.stringify(data));
            console.info("Test_requestPermissionsFromUser_002 data permissions:" + data.permissions);
            console.info("Test_requestPermissionsFromUser_002 data authResults:" + data.authResults);
            done();
          })
          .catch((err) => {
            console.info("Test_requestPermissionsFromUser_002 data:" + JSON.stringify(err));
            done();
          });
      } catch (err) {
        console.log("Test_requestPermissionsFromUser_002 catch err" + err.code + "message" + err.message);
        expect(result).assertEqual(undefined);
        done();
      }
    });

    /**
     *@tc.number    : TEST_REQUEST_PERMISSION_FROM_USER_003
     *@tc.name      : testRequestPermissionFromUser003
     *@tc.desc      : RequestPermissionsFromUser normal scenario(callback).
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it("testRequestPermissionFromUser003", 0, async function (done) {
      console.info("Test_requestPermissionsFromUser_003 start");
      var atManager = abilityAccessCtrl.createAtManager();
      try {
        atManager.requestPermissionsFromUser(globalThis.abilityContext, ["ohos.permission.CAMERA"], (err, data) => {
          console.info("Test_requestPermissionsFromUser_003 data:" + JSON.stringify(data));
          console.info("Test_requestPermissionsFromUser_003 data permissions:" + data.permissions);
          console.info("Test_requestPermissionsFromUser_003 data authResults:" + data.authResults);
          expect(data.permissions[0] == "ohos.permission.CAMERA").assertTrue();
          expect(data.authResults[0] == 2).assertTrue();
          done();
        });
      } catch (err) {
        console.log(`Test_requestPermissionsFromUser_003 catch err->${JSON.stringify(err)}`);
        done();
      }
    });

    /**
     *@tc.number    : TEST_REQUEST_PERMISSION_FROM_USER_004
     *@tc.name      : testRequestPermissionFromUser004
     *@tc.desc      : Exception scenario use case(callback).
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it("testRequestPermissionFromUser004", 0, async function (done) {
      console.info("Test_requestPermissionsFromUser_004 start ");
      var atManager = abilityAccessCtrl.createAtManager();
      try {
        var result = atManager.requestPermissionsFromUser(globalThis.abilityContext, ["a"], (err, data) => {
          console.info("Test_requestPermissionsFromUser_004 data:" + JSON.stringify(data));
          console.info("Test_requestPermissionsFromUser_004 data permissions:" + data.permissions);
          console.info("Test_requestPermissionsFromUser_004 data authResults:" + data.authResults);
          done();
        });
      } catch (err) {
        console.log(`Test_requestPermissionsFromUser_004 catch err->${JSON.stringify(err)}`);
        expect(result).assertEqual(undefined);
        done();
      }
    });

    /**
     *@tc.number    : TEST_GRANT_STATUS_001
     *@tc.name      : testGrantStatus001
     *@tc.desc      : Test enum.
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it("testGrantStatus001", 0, function () {
      try {
        expect(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertEqual(-1);
      } catch (err) {
        console.info("testGrantStatus001 meet an error: " + err);
      }
    });

    /**
     *@tc.number    : TEST_GRANT_STATUS_002
     *@tc.name      : testGrantStatus002
     *@tc.desc      : Test enum.
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it("testGrantStatus002", 0, function () {
      try {
        expect(abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED).assertEqual(0);
      } catch (err) {
        console.info("testGrantStatus002 meet an error: " + err);
      }
    });
  })
}
