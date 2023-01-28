/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium'
import appManager from "@ohos.app.ability.appManager"

let ERROR_CODE = 202;
export default function appManagerTest() {
  describe('appManagerTest', function () {

    /**
     * @tc.number: System_API_Test_App_Manager_0100
     * @tc.name: appManager.on system interface interception test
     * @tc.desc:  Test the third-party application call appManager.on will be blocked
     * @tc.level   3
     */
    it('System_API_Test_App_Manager_0100',0, function (done) {
      let TAG = 'System_API_Test_App_Manager_0100';
      let applicationStateObserver = {
        onForegroundApplicationChanged(appStateData) {
          console.log(TAG + '------------ onForegroundApplicationChanged -----------', appStateData);
        },
        onAbilityStateChanged(abilityStateData) {
          console.log(TAG + '------------ onAbilityStateChanged -----------', abilityStateData);
        },
        onProcessCreated(processData) {
          console.log(TAG + '------------ onProcessCreated -----------', processData);
        },
        onProcessDied(processData) {
          console.log(TAG + '------------ onProcessDied -----------', processData);
        },
        onProcessStateChanged(processData) {
          console.log(TAG + '------------ onProcessStateChanged -----------', processData);
        }
      }
      try {
        const observerCode = appManager.on("applicationState", applicationStateObserver);
        console.log('-------- observerCode: ---------', observerCode);
      } catch (err) {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_App_Manager_0200
     * @tc.name: Multi-parameter appManager.on system interface interception test
     * @tc.desc:  Test the third-party application call appManager.on will be blocked
     * @tc.level   3
     */
    it('System_API_Test_App_Manager_0200',0, function (done) {
      let TAG = 'System_API_Test_App_Manager_0200';
      let applicationStateObserver = {
        onForegroundApplicationChanged(appStateData) {
          console.log(TAG + '------------ onForegroundApplicationChanged -----------', appStateData);
        },
        onAbilityStateChanged(abilityStateData) {
          console.log(TAG + '------------ onAbilityStateChanged -----------', abilityStateData);
        },
        onProcessCreated(processData) {
          console.log(TAG + '------------ onProcessCreated -----------', processData);
        },
        onProcessDied(processData) {
          console.log(TAG + '------------ onProcessDied -----------', processData);
        },
        onProcessStateChanged(processData) {
          console.log(TAG + '------------ onProcessStateChanged -----------', processData);
        }
      }
      let bundleNameList = ['bundleName1', 'bundleName2'];
      try {
        const observerCode = appManager.on("applicationState", applicationStateObserver, bundleNameList);
        console.log('-------- observerCode: ---------', observerCode);
      } catch (err) {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_App_Manager_0300
     * @tc.name: callback form getForegroundApplications system interface interception test
     * @tc.desc:  Test the third-party application call getForegroundApplications will be blocked
     * @tc.level   3
     */
    it('System_API_Test_App_Manager_0300',0, function (done) {
      let TAG = 'System_API_Test_App_Manager_0300';
      appManager.getForegroundApplications((err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_App_Manager_0400
     * @tc.name: promise form getForegroundApplications system interface interception test
     * @tc.desc:  Test the third-party application call getForegroundApplications will be blocked
     * @tc.level   3
     */
    it('System_API_Test_App_Manager_0400',0, function (done) {
      let TAG = 'System_API_Test_App_Manager_0400';
      appManager.getForegroundApplications()
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_App_Manager_0500
     * @tc.name: callback form killProcessWithAccount system interface interception test
     * @tc.desc:  Test the third-party application call killProcessWithAccount will be blocked
     * @tc.level   3
     */
    it('System_API_Test_App_Manager_0500',0, function (done) {
      let TAG = 'System_API_Test_App_Manager_0500';
      let bundleName = "com.ohos.application";
      let accountId = 100;
      appManager.killProcessWithAccount(bundleName, accountId, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_App_Manager_0600
     * @tc.name: promise form killProcessWithAccount system interface interception test
     * @tc.desc:  Test the third-party application call killProcessWithAccount will be blocked
     * @tc.level   3
     */
    it('System_API_Test_App_Manager_0600',0, function (done) {
      let TAG = 'System_API_Test_App_Manager_0600';
      let bundleName = "com.ohos.application";
      let accountId = 100;
      appManager.killProcessWithAccount(bundleName, accountId)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_App_Manager_0700
     * @tc.name: callback form killProcessesByBundleName system interface interception test
     * @tc.desc:  Test the third-party application call killProcessesByBundleName will be blocked
     * @tc.level   3
     */
    it('System_API_Test_App_Manager_0700',0, function (done) {
      let TAG = 'System_API_Test_App_Manager_0700';
      let bundleName = "com.ohos.application";
      appManager.killProcessesByBundleName(bundleName, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_App_Manager_0800
     * @tc.name: promise form killProcessesByBundleName system interface interception test
     * @tc.desc:  Test the third-party application call killProcessesByBundleName will be blocked
     * @tc.level   3
     */
    it('System_API_Test_App_Manager_0800',0, function (done) {
      let TAG = 'System_API_Test_App_Manager_0800';
      let bundleName = "com.ohos.application";
      appManager.killProcessesByBundleName(bundleName)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_App_Manager_0900
     * @tc.name: callback form clearUpApplicationData system interface interception test
     * @tc.desc:  Test the third-party application call clearUpApplicationData will be blocked
     * @tc.level   3
     */
    it('System_API_Test_App_Manager_0900',0, function (done) {
      let TAG = 'System_API_Test_App_Manager_0900';
      let bundleName = "com.ohos.application";
      appManager.clearUpApplicationData(bundleName, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_App_Manager_1000
     * @tc.name: promise form clearUpApplicationData system interface interception test
     * @tc.desc:  Test the third-party application call clearUpApplicationData will be blocked
     * @tc.level   3
     */
    it('System_API_Test_App_Manager_1000',0, function (done) {
      let TAG = 'System_API_Test_App_Manager_1000';
      let bundleName = "com.ohos.application";
      appManager.clearUpApplicationData(bundleName)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })
  })
}