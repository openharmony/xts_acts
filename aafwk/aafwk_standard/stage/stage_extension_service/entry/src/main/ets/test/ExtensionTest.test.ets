/**
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index"

export default function ExtensionTest(abilityContext) {
  describe('ServiceExtensionTest', function () {

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_6600
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_6600', 0, async function (done){
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_6600";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function() {
        await globalThis.extensionContext.startAbility({
          deviceId: undefined,
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function() {
          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000)
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_6700
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_6700', 0, async function (done){
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_6700";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function() {
        await globalThis.extensionContext.startAbility({
          uri: "abcdefxxxx",
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function() {
          var actualValue = globalThis.serviceWant2.uri;
          checkParametersValue(actualValue, "abcdefxxxx", TAG);

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000)
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_6800
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_6800', 0, async function (done){
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_6800";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function() {
        await globalThis.extensionContext.startAbility({
          flags: 0x0001,
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function() {
          var actualValue = globalThis.serviceWant2.flags;
          checkParametersValue(actualValue, 1, TAG);

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000)
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_6900
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_6900', 0, async function (done){
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_6900";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function() {
        await globalThis.extensionContext.startAbility({
          flags: 0x0001|0x0002,
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function() {
          var actualValue = globalThis.serviceWant2.flags;
          checkParametersValue(actualValue, 3, TAG);

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000)
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_7000
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_7000', 0, async function (done){
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_7000";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function() {
        await globalThis.extensionContext.startAbility({
          flags: 1.33,
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function() {
          var actualValue = globalThis.serviceWant2.flags;
          checkParametersValue(actualValue, 1, TAG);

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000)
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_7100
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_7100', 0, async function (done){
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_7100";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function() {
        await globalThis.extensionContext.startAbility({
          flags: "2",
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function() {
          var actualValue = globalThis.serviceWant2.flags;
          checkParametersValue(actualValue, 0, TAG);

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000)
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_7200
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_7200', 0, async function (done){
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_7200";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function() {
        await globalThis.extensionContext.startAbility({
          flags: "aa",
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function() {
          var actualValue = globalThis.serviceWant2.flags;
          checkParametersValue(actualValue, 0, TAG);

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000)
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_7300
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_7300', 0, async function (done){
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_7300";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function() {
        await globalThis.extensionContext.startAbility({
          parameters: {
            "test": 666
          },
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function() {
          var actualValue = globalThis.serviceWant2.parameters.test;
          checkParametersValue(actualValue, 666, TAG);

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000)
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_7400
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_7400', 0, async function (done){
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_7400";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function() {
        await globalThis.extensionContext.startAbility({
          parameters: {
            "test": 1231564215648115648203065413
          },
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function() {
          var actualValue = globalThis.serviceWant2.parameters.test
          checkParametersValue(actualValue, 1.2315642156481157e+27, TAG);

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000)
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_7500
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_7500', 0, async function (done){
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_7500";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function() {
        await globalThis.extensionContext.startAbility({
          parameters: {
            "test": 66.66
          },
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function() {
          var actualValue = globalThis.serviceWant2.parameters.test;
          checkParametersValue(actualValue, 66.66, TAG);

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000)
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_7600
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_7600', 0, async function (done){
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_7600";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function() {
        await globalThis.extensionContext.startAbility({
          parameters: {
            "test": 66.66666666666666
          },
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function() {
          var actualValue = globalThis.serviceWant2.parameters.test;
          checkParametersValue(actualValue, 66.66666666666666, TAG);

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000)
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_7700
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_7700', 0, async function (done){
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_7700";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function() {
        await globalThis.extensionContext.startAbility({
          parameters: {
            "test": 66.66666666666666666
          },
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function() {
          var actualValue = globalThis.serviceWant2.parameters.test;
          checkParametersValue(actualValue, 66.66666666666667, TAG);

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000)
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_7800
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_7800', 0, async function (done){
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_7800";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function() {
        await globalThis.extensionContext.startAbility({
          parameters: {
            "test": 9223372036854776088
          },
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function() {
          var actualValue = globalThis.serviceWant2.parameters.test;
          checkParametersValue(actualValue, 9223372036854776000, TAG);

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000)
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_7900
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_7900', 0, async function (done){
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_7900";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function() {
        await globalThis.extensionContext.startAbility({
          parameters: {
            "test": "testString"
          },
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function() {
          var actualValue = globalThis.serviceWant2.parameters.test;
          checkParametersValue(actualValue, "testString", TAG);

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000);
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_8000
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_8000', 0, async function (done){
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_8000";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function() {
        await globalThis.extensionContext.startAbility({
          parameters: {
            "test": true
          },
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function() {
          var expectValue = globalThis.serviceWant2.parameters.test;
          console.log(TAG + " expectValue = " + JSON.stringify(expectValue));
          expect(expectValue).assertTrue();

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000);
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_8100
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_8100', 0, async function (done) {
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_8100";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function () {
        var testStr = [1, 2, 3];
        await globalThis.extensionContext.startAbility({
          parameters: {
            "test": testStr
          },
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function () {
          var actualValue = globalThis.serviceWant2.parameters.test;
          checkParametersArrayValue(actualValue, testStr, TAG);

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000);
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_8200
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_8200', 0, async function (done) {
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_8200";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function () {
        const testStr = ["string1", "string2"];
        await globalThis.extensionContext.startAbility({
          parameters: {
            "test": testStr
          },
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function () {
          var actualValue = globalThis.serviceWant2.parameters.test;
          checkParametersArrayValue(actualValue, testStr, TAG);

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000);
      }, 2000);
    });



    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_8400
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_8400', 0, async function (done) {
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_8400";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function () {
        await globalThis.extensionContext.startAbility({
          parameters: {
            "test": 'a'
          },
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function () {
          var actualValue = globalThis.serviceWant2.parameters.test;
          checkParametersValue(actualValue, 'a', TAG);

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000);
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_8500
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_8500', 0, async function (done) {
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_8500";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function () {
        await globalThis.extensionContext.startAbility({
          parameters: {
            "test": {"testjson":"testjsonvalue"}
          },
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function () {
          var actualValue = globalThis.serviceWant2.parameters.test.testjson;
          checkParametersValue(actualValue, 'testjsonvalue', TAG);

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000);
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_8600
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_8600', 0, async function (done) {
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_8600";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function () {
        await globalThis.extensionContext.startAbility({
          parameters: {
            "ability.want.params.TITLE" : "test"
          },
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function () {
          var actualValue = globalThis.serviceWant2.parameters["ability.want.params.TITLE"];
          checkParametersValue(actualValue, "test", TAG)

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000);
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_8700
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_8700', 0, async function (done) {
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_8700";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function () {
        await globalThis.extensionContext.startAbility({
          parameters: {
            "ability.want.params.TITLE" : {"key": "one", "value": "test"}
          },
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function () {
          var actualValue = globalThis.serviceWant2.parameters["ability.want.params.TITLE"];
          console.log(TAG + " actualValue = " + JSON.stringify(actualValue));
          expect(actualValue.key == "one").assertTrue();
          expect(actualValue.value == "test").assertTrue();

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000);
      }, 2000);
    });

    /**
     * @tc.number: SUB_AA_Extension_ServiceExtensionContext_8800
     * @tc.name:
     * @tc.desc:
     */
    it('SUB_AA_Extension_ServiceExtensionContext_8800', 0, async function (done) {
      var TAG = "SUB_AA_Extension_ServiceExtensionContext_8800";
      console.log(TAG + " --- start");
      globalThis.lifeCycleList = [];
      console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));

      abilityContext.startAbility({
        bundleName: "com.example.serviceextension",
        abilityName: "com.example.serviceextension.ServiceAbility"
      }, (error, data) => {
        console.log(TAG + '-- startAbility(ServiceAbility): ' + JSON.stringify(error) + ", " + JSON.stringify(data));
      });
      setTimeout(async function () {
        var testStr = [1, 2, 3];
        await globalThis.extensionContext.startAbility({
          parameters: {
            "test1" : "test1",
            "test2" : 12345,
            "test3" : 'a',
            "test4" : testStr,
            "test5" : {"testjson":"testjsonvalue"}
          },
          bundleName: "com.example.serviceextension",
          abilityName: "com.example.serviceextension.ServiceAbility2"
        }, (err, data) => {
          console.log(TAG + '-- startAbility(ServiceAbility2): ' + JSON.stringify(err) + ", " + JSON.stringify(data));
        });
        setTimeout(function () {
          var actualValue1 = globalThis.serviceWant2.parameters.test1;
          checkParametersValue(actualValue1, "test1", TAG);

          var actualValue2 = globalThis.serviceWant2.parameters.test2;
          checkParametersValue(actualValue2, 12345, TAG);

          var actualValue3 = globalThis.serviceWant2.parameters.test3;
          checkParametersValue(actualValue3, 'a', TAG);

          var actualValue4 = globalThis.serviceWant2.parameters.test4;
          checkParametersArrayValue(actualValue4, testStr, TAG);

          var actualValue5 = globalThis.serviceWant2.parameters.test5.testjson;
          checkParametersValue(actualValue5, 'testjsonvalue', TAG);

          console.log(TAG + " lifeCycleList = " + JSON.stringify(globalThis.lifeCycleList));
          var findTarget = ["ServiceAbility2_onCreate", "ServiceAbility2_onRequest"];
          checkLifeCycle(globalThis.lifeCycleList, findTarget, TAG);
          done();
        }, 2000);
      }, 2000);
    });

    function checkLifeCycle(lifeCycle, findTarget, TAG) {
      var a = 0;
      console.log(TAG + " findTarget.length = " + findTarget.length);
      for(var i = 0; i < findTarget.length; i++) {
        var targetValue = findTarget[i];
        for(var j = 0; j < lifeCycle.length; j++) {
          if(lifeCycle[j] == targetValue) {
            a++;
          }
        }
      }
      console.log(TAG + " a = " + a.toString());
      expect(a == findTarget.length).assertTrue();
    }

    function checkParametersValue(actualValue, expectValue, TAG) {
      console.log(TAG + " actualValue = " + JSON.stringify(actualValue));
      expect(actualValue == expectValue).assertTrue();
    }

    function checkParametersArrayValue(actualArray, expectArray, TAG) {
      console.log(TAG + " actualArray = " + JSON.stringify(actualArray));
      for (var i = 0; i < actualArray.length; i++) {
        expect(actualArray[i] == expectArray[i]).assertTrue();
      }
    }

  })
}
