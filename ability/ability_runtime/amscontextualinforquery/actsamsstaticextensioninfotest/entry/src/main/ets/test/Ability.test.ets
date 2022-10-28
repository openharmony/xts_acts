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

import commonEvent from "@ohos.commonEvent"
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"

const START_ABILITY_TIMEOUT = 5000;
var subscriberInfoStartAbility_0100 = {
  events: ["ACTS_ConnectAbility_0100_CommonEvent"],
};
var subscriberInfoStartAbility_0200 = {
  events: ["ACTS_ConnectAbility_0200_CommonEvent"],
};

export default function abilityTest() {

  describe('ActsExtensionAbilityTest', function () {

    /*
    * @tc.number: ACTS_getExtensionInfo_0100
    * @tc.name: Start the system permission application to query static information about Extension
    * @tc.desc: Enable application ras to query the Extension static information. Verify the query information.
     Enable application ras to connect to serviceAbility
    */
    it('ACTS_getExtensionInfo_0100', 0, async function (done) {
      console.log('ACTS_getExtensionInfo_0100  gyq ====<begin');
      console.log('========ACTS_getExtensionInfo_0100_StartConnect called');
      var subscriber;
      let id;
      var connId;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_getExtensionInfo_0100_Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "ACTS_ConnectAbility_0100_CommonEvent") {
            clearTimeout(id);
            checkHapModuleInfo(JSON.parse(data.parameters['hapModuleInfo']))
            checkApplicationInfo(JSON.parse(data.parameters['applicationInfo']))
            expect(data.event).assertEqual("ACTS_ConnectAbility_0100_CommonEvent");
            commonEvent.unsubscribe(subscriber, unSubscribeCallback)
            done();
        }
      }
      commonEvent.createSubscriber(subscriberInfoStartAbility_0100).then(async (data) => {
        console.debug("====>ACTS_getExtensionInfo_0100_Create Subscriber====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack);
        connId = await globalThis.abilityContext.connectAbility(
          {
            bundleName: "com.example.staticextensioninfo",
            abilityName: "com.example.staticextensioninfo.ServiceAbility",
            action: "getExtensionInfo"
          }
        );
        console.log('ACTS_getExtensionInfo_0100 ConnectAbility connId : ' + connId);
      })

      function unSubscribeCallback() {
        console.debug("====>ACTS_getExtensionInfo_0100_UnSubscribe CallBack====>");
        done();
      }

      function timeout() {
        expect().assertFail();
        console.debug('ACTS_ConnectAbility_0100 timeout');
        done();
      }

      id = setTimeout(timeout, START_ABILITY_TIMEOUT);


      function checkHapModuleInfo(data) {
        console.log("checkHapModuleInfo start  " + data);
        console.log("checkHapModuleInfo name : " + data.name);
        console.log("checkHapModuleInfo description : " + data.description);
        console.log("checkHapModuleInfo descriptionId : " + data.descriptionId);
        console.log("checkHapModuleInfo icon : " + data.icon);
        console.log("checkHapModuleInfo label : " + data.label);
        console.log("checkHapModuleInfo labelId : " + data.labelId);
        console.log("checkHapModuleInfo iconId : " + data.iconId);
        console.log("checkHapModuleInfo backgroundImg : " + data.backgroundImg);
        console.log("checkHapModuleInfo supportedModes : " + data.supportedModes);
        console.log("checkHapModuleInfo reqCapabilities length : " + data.reqCapabilities.length);
        for (var j = 0; j < data.reqCapabilities.length; j++) {
          console.log("checkHapModuleInfo data.reqCapabilities[" + j + "] : " + data.reqCapabilities[j]);
        }
        console.log("checkHapModuleInfo  deviceTypes length : " + data.deviceTypes.length);
        for (var j = 0; j < data.deviceTypes.length; j++) {
          console.log("checkHapModuleInfo data.deviceTypes[" + j + "] : " + data.deviceTypes[j]);
        }
        console.log("checkHapModuleInfo moduleName : " + data.moduleName);
        console.log("checkHapModuleInfo mainAbilityName : " + data.mainAbilityName);
        console.log("checkHapModuleInfo installationFree : " + data.installationFree);

        expect(typeof (data)).assertEqual("object");
        expect(typeof (data.name)).assertEqual("string");
        expect(typeof (data.description)).assertEqual("string");
        expect(typeof (data.icon)).assertEqual("string");
        expect(typeof (data.label)).assertEqual("string");
        expect(typeof (data.backgroundImg)).assertEqual("string");
        expect(typeof (data.supportedModes)).assertEqual("number");
        expect(Array.isArray(data.reqCapabilities)).assertEqual(true);
        expect(Array.isArray(data.deviceTypes)).assertEqual(true);
        expect(Array.isArray(data.abilityInfo)).assertEqual(true);
        expect(typeof (data.moduleName)).assertEqual("string");
        expect(typeof (data.mainAbilityName)).assertEqual("string");
        console.log("checkHapModuleInfo_expect_typeof_end")
        expect(data.name).assertEqual("phone");
        expect(data.description).assertEqual("$string:phone_entry_dsc");
        expect(data.descriptionId).assertEqual(16777221);
        expect(data.icon).assertEqual("$media:icon");
        expect(data.label).assertEqual("$string:entry_label");
        expect(data.labelId).assertEqual(16777219);
        expect(data.iconId).assertEqual(16777224);
        expect(data.backgroundImg).assertEqual("");
        expect(data.supportedModes).assertEqual(0);
        expect(data.reqCapabilities.length).assertEqual(0);
        expect(data.deviceTypes.length).assertEqual(2);
        expect(data.deviceTypes[0]).assertEqual("default");
        expect(data.moduleName).assertEqual("phone")
        expect(data.mainAbilityName).assertEqual("com.example.staticextensioninfo.MainAbility");
        expect(data.installationFree).assertEqual(false);
        expect(data.mainElementName).assertEqual('com.example.staticextensioninfo.MainAbility');
        expect(data.hashValue).assertEqual('');
        console.log("checkHapModuleInfo end  " + data);
      }
      function checkApplicationInfo(data) {
        console.log("checkApplicationInfo start  " + data);
        console.log("checkApplicationInfo name : " + data.name);
        console.log("checkApplicationInfo description : " + data.description);
        console.log("checkApplicationInfo descriptionId : " + data.descriptionId);
        console.log("checkApplicationInfo systemApp : " + data.systemApp);
        console.log("checkApplicationInfo enabled : " + data.enabled);
        console.log("checkApplicationInfo label : " + data.label)
        console.log("checkApplicationInfo labelId : " + data.labelId);
        console.log("checkApplicationInfo icon : " + data.icon);
        console.log("checkApplicationInfo iconId : " + data.iconId);
        console.log("checkApplicationInfo process : " + data.process);
        console.log("checkApplicationInfo supportedModes : " + data.supportedModes);
        console.log("checkApplicationInfo moduleSourceDirs length : " + data.moduleSourceDirs.length);
        for (var j = 0; j < data.moduleSourceDirs.length; j++) {
          console.log("checkApplicationInfo data.moduleSourceDirs[" + j + "] : " + data.moduleSourceDirs[j]);
        }
        console.log("checkApplicationInfo permissions length : " + data.permissions.length);
        for (var j = 0; j < data.permissions.length; j++) {
          console.log("checkApplicationInfo data.permissions[" + j + "] : " + data.permissions[j]);
        }
        console.log("checkApplicationInfo moduleInfos length : " + data.moduleInfos.length);
        for (var j = 0; j < data.moduleInfos.length; j++) {
          console.log("checkApplicationInfo data.moduleInfos[" + j + "].moduleName : " + data.moduleInfos[j].moduleName);
          console.log("checkApplicationInfo data.moduleInfos[" + j + "].moduleSourceDir:" +
          data.moduleInfos[j].moduleSourceDir);
        }
        console.log("checkApplicationInfo entryDir : " + data.entryDir);
        console.log("checkApplicationInfo codePath : " + data.codePath);
        console.log("checkApplicationInfo removable: " + data.removable);

        expect(typeof (data)).assertEqual("object");
        expect(typeof (data.name)).assertEqual("string");
        expect(typeof (data.description)).assertEqual("string");
        expect(typeof (data.descriptionId)).assertEqual("number");
        expect(typeof (data.systemApp)).assertEqual("boolean");
        expect(typeof (data.enabled)).assertEqual("boolean");
        expect(typeof (data.label)).assertEqual("string");
        expect(typeof (data.labelId)).assertEqual("string");
        expect(typeof (data.icon)).assertEqual("string");
        expect(typeof (data.iconId)).assertEqual("string");
        expect(typeof (data.process)).assertEqual("string");
        expect(typeof (data.supportedModes)).assertEqual("number");
        expect(Array.isArray(data.moduleSourceDirs)).assertEqual(true);
        expect(Array.isArray(data.permissions)).assertEqual(true);
        expect(Array.isArray(data.moduleInfos)).assertEqual(true);
        expect(typeof (data.entryDir)).assertEqual("string");
        expect(typeof (data.codePath)).assertEqual("string");
        expect(typeof (data.removable)).assertEqual("boolean");
        console.log("checkApplicationInfo_expect_typeof_end")
        expect(data.name).assertEqual("com.example.staticextensioninfo");
        expect(data.description).assertEqual("$string:description_application");
        expect(data.descriptionId).assertLarger(0);
        expect(data.systemApp).assertEqual(true);
        expect(data.enabled).assertEqual(true);
        expect(data.label).assertEqual("$string:app_name");
        expect(data.labelId).assertEqual("16777216");
        expect(data.icon).assertEqual("$media:icon");
        expect(data.iconId).assertEqual("16777224");
        expect(data.process).assertEqual("com.example.staticextensioninfo");
        expect(data.supportedModes).assertEqual(0);
        expect(data.moduleSourceDirs.length).assertEqual(1);
        expect(data.moduleSourceDirs[0]).assertEqual("/data/app/el1/bundle/public/" +
        "com.example.staticextensioninfo/phone");
        expect(data.moduleInfos.length).assertEqual(1);
        expect(data.moduleInfos[0].moduleName).assertEqual("phone");
        expect(data.moduleInfos[0].moduleSourceDir).assertEqual("/data/app/el1/bundle/public/" +
        "com.example.staticextensioninfo/phone");
        expect(data.entryDir).assertEqual("/data/app/el1/bundle/public/com.example.staticextensioninfo" +
        "/phone");
        expect(data.codePath).assertEqual("/data/app/el1/bundle/public/com.example.staticextensioninfo");
        expect(data.removable).assertEqual(true);
        console.log("checkApplicationInfo end  " + data);
      }
    })

    /*
    * @tc.number: ACTS_getExtensionInfo_0200
    * @tc.name: Apply StaticExtensionInfo. Connect to StaticExtensionInfoTest to query static information
    about an Extension
    * @tc.desc: Enabling an application to connect to StaticExtensionInfo. Connecting to StaticExtensionInfoTest
    To query static information about an Extension. Verifying the query information
    */
    it('ACTS_getExtensionInfo_0200', 0, async function (done) {
      console.log('ACTS_getExtensionInfo_0200====<begin');
      console.log('========ACTS_getExtensionInfo_0200_StartConnect called');
      var subscriber;
      let id;
      var connId;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_getExtensionInfo_0200_Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "ACTS_ConnectAbility_0200_CommonEvent") {
            clearTimeout(id);
            checkHapModuleInfo_0200(JSON.parse(data.parameters['hapModuleInfo2']))
            checkApplicationInfo_0200(JSON.parse(data.parameters['applicationInfo2']))
            expect(data.event).assertEqual("ACTS_ConnectAbility_0200_CommonEvent");
            commonEvent.unsubscribe(subscriber, unSubscribeCallback)
          }
      }
      commonEvent.createSubscriber(subscriberInfoStartAbility_0200).then(async (data) => {
        console.debug("====>ACTS_getExtensionInfo_0200_Create Subscriber====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack);
        connId = await globalThis.abilityContext.connectAbility(
          {
            bundleName: "com.example.staticextensioninfotest",
            abilityName: "com.example.staticextensioninfotest.ServiceAbility",
            action: "getExtensionInfoTest"
          }
        );
        console.log('ACTS_getExtensionInfo_0200 ConnectAbility connId : ' + connId);
      })

      function unSubscribeCallback() {
        console.debug("====>ACTS_getExtensionInfo_0200_UnSubscribe CallBack====>");
        done();
      }

      function timeout() {
        expect().assertFail();
        console.debug('ACTS_ConnectAbility_0200 timeout');
      }

      id = setTimeout(timeout, START_ABILITY_TIMEOUT);


      function checkHapModuleInfo_0200(data) {
        console.log("checkHapModuleInfo2 start  " + data);
        console.log("checkHapModuleInfo2 name : " + data.name);
        console.log("checkHapModuleInfo2 description : " + data.description);
        console.log("checkHapModuleInfo2 descriptionId : " + data.descriptionId);
        console.log("checkHapModuleInfo2 icon : " + data.icon);
        console.log("checkHapModuleInfo2 label : " + data.label);
        console.log("checkHapModuleInfo2 labelId : " + data.labelId);
        console.log("checkHapModuleInfo2 iconId : " + data.iconId);
        console.log("checkHapModuleInfo2 backgroundImg : " + data.backgroundImg);
        console.log("checkHapModuleInfo2 supportedModes : " + data.supportedModes);
        console.log("checkHapModuleInfo2 reqCapabilities length : " + data.reqCapabilities.length);
        for (var j = 0; j < data.reqCapabilities.length; j++) {
          console.log("checkHapModuleInfo2 data.reqCapabilities[" + j + "] : " + data.reqCapabilities[j]);
        }
        console.log("checkHapModuleInfo2  deviceTypes length : " + data.deviceTypes.length);
        for (var j = 0; j < data.deviceTypes.length; j++) {
          console.log("checkHapModuleInfo2 data.deviceTypes[" + j + "] : " + data.deviceTypes[j]);
        }
        console.log("checkHapModuleInfo2 moduleName : " + data.moduleName);
        console.log("checkHapModuleInfo2 mainAbilityName : " + data.mainAbilityName);
        console.log("checkHapModuleInfo2 installationFree : " + data.installationFree);

        expect(typeof (data)).assertEqual("object");
        expect(typeof (data.name)).assertEqual("string");
        expect(typeof (data.description)).assertEqual("string");
        expect(typeof (data.icon)).assertEqual("string");
        expect(typeof (data.label)).assertEqual("string");
        expect(typeof (data.backgroundImg)).assertEqual("string");
        expect(typeof (data.supportedModes)).assertEqual("number");
        expect(Array.isArray(data.reqCapabilities)).assertEqual(true);
        expect(Array.isArray(data.deviceTypes)).assertEqual(true);
        expect(Array.isArray(data.abilityInfo)).assertEqual(true);
        expect(typeof (data.moduleName)).assertEqual("string");
        expect(typeof (data.mainAbilityName)).assertEqual("string");
        console.log("checkHapModuleInfo_expect_typeof_end")
        expect(data.name).assertEqual("phone");
        expect(data.description).assertEqual("$string:phone_entry_dsc");
        expect(data.descriptionId).assertEqual(16777221);
        expect(data.icon).assertEqual("$media:icon");
        expect(data.label).assertEqual("$string:entry_label");
        expect(data.labelId).assertEqual(16777219);
        expect(data.iconId).assertEqual(16777224);
        expect(data.backgroundImg).assertEqual("");
        expect(data.supportedModes).assertEqual(0);
        expect(data.reqCapabilities.length).assertEqual(0);
        expect(data.deviceTypes.length).assertEqual(2);
        expect(data.deviceTypes[0]).assertEqual("default");
        expect(data.moduleName).assertEqual("phone")
        expect(data.mainAbilityName).assertEqual("com.example.staticextensioninfotest.MainAbility");
        expect(data.installationFree).assertEqual(false);
        expect(data.mainElementName).assertEqual('com.example.staticextensioninfotest.MainAbility');
        expect(data.hashValue).assertEqual('');
        console.log("checkHapModuleInfo end  " + data);
      }
      function checkApplicationInfo_0200(data) {
        console.log("checkApplicationInfo2 start  " + data);
        console.log("checkApplicationInfo2 name : " + data.name);
        console.log("checkApplicationInfo2 description : " + data.description);
        console.log("checkApplicationInfo2 descriptionId : " + data.descriptionId);
        console.log("checkApplicationInfo2 systemApp : " + data.systemApp);
        console.log("checkApplicationInfo2 enabled : " + data.enabled);
        console.log("checkApplicationInfo2 label : " + data.label)
        console.log("checkApplicationInfo2 labelId : " + data.labelId);
        console.log("checkApplicationInfo2 icon : " + data.icon);
        console.log("checkApplicationInfo2 iconId : " + data.iconId);
        console.log("checkApplicationInfo2 process : " + data.process);
        console.log("checkApplicationInfo2 supportedModes : " + data.supportedModes);
        console.log("checkApplicationInfo2 moduleSourceDirs length : " + data.moduleSourceDirs.length);
        for (var j = 0; j < data.moduleSourceDirs.length; j++) {
          console.log("checkApplicationInfo2 data.moduleSourceDirs[" + j + "] : " + data.moduleSourceDirs[j]);
        }
        console.log("checkApplicationInfo2 permissions length : " + data.permissions.length);
        for (var j = 0; j < data.permissions.length; j++) {
          console.log("checkApplicationInfo2 data.permissions[" + j + "] : " + data.permissions[j]);
        }
        console.log("checkApplicationInfo2 moduleInfos length : " + data.moduleInfos.length);
        for (var j = 0; j < data.moduleInfos.length; j++) {
          console.log("checkApplicationInfo2 data.moduleInfos[" + j + "].moduleName : " + data.moduleInfos[j].moduleName);
          console.log("checkApplicationInfo2 data.moduleInfos[" + j + "].moduleSourceDir:" +
          data.moduleInfos[j].moduleSourceDir);
        }
        console.log("checkApplicationInfo2 entryDir : " + data.entryDir);
        console.log("checkApplicationInfo2 codePath : " + data.codePath);
        console.log("checkApplicationInfo2 removable: " + data.removable);

        expect(typeof (data)).assertEqual("object");
        expect(typeof (data.name)).assertEqual("string");
        expect(typeof (data.description)).assertEqual("string");
        expect(typeof (data.descriptionId)).assertEqual("number");
        expect(typeof (data.systemApp)).assertEqual("boolean");
        expect(typeof (data.enabled)).assertEqual("boolean");
        expect(typeof (data.label)).assertEqual("string");
        expect(typeof (data.labelId)).assertEqual("string");
        expect(typeof (data.icon)).assertEqual("string");
        expect(typeof (data.iconId)).assertEqual("string");
        expect(typeof (data.process)).assertEqual("string");
        expect(typeof (data.supportedModes)).assertEqual("number");
        expect(Array.isArray(data.moduleSourceDirs)).assertEqual(true);
        expect(Array.isArray(data.permissions)).assertEqual(true);
        expect(Array.isArray(data.moduleInfos)).assertEqual(true);
        expect(typeof (data.entryDir)).assertEqual("string");
        expect(typeof (data.codePath)).assertEqual("string");
        expect(typeof (data.removable)).assertEqual("boolean");
        console.log("checkApplicationInfo_expect_typeof_end")
        expect(data.name).assertEqual("com.example.staticextensioninfotest");
        expect(data.description).assertEqual("$string:description_application");
        expect(data.descriptionId).assertLarger(0);
        expect(data.systemApp).assertEqual(true);
        expect(data.enabled).assertEqual(true);
        expect(data.label).assertEqual("$string:app_name");
        expect(data.labelId.length).assertLarger(0);
        expect(data.icon).assertEqual("$media:icon");
        expect(data.iconId.length).assertLarger(0);
        expect(data.process).assertEqual("com.example.staticextensioninfotest");
        expect(data.supportedModes).assertEqual(0);
        expect(data.moduleSourceDirs.length).assertEqual(1);
        expect(data.moduleSourceDirs[0]).assertEqual("/data/app/el1/bundle/public/" +
        "com.example.staticextensioninfotest/phone");
        expect(data.moduleInfos.length).assertEqual(1);
        expect(data.moduleInfos[0].moduleName).assertEqual("phone");
        expect(data.moduleInfos[0].moduleSourceDir).assertEqual("/data/app/el1/bundle/public/" +
        "com.example.staticextensioninfotest/phone");
        expect(data.entryDir).assertEqual("/data/app/el1/bundle/public/com.example.staticextensioninfotest" +
        "/phone");
        expect(data.codePath).assertEqual("/data/app/el1/bundle/public/com.example.staticextensioninfotest");
        expect(data.removable).assertEqual(true);
        console.log("checkApplicationInfo end  " + data);
      }
    })

    /*
    * @tc.number: ACTS_getExtensionInfo_0300
    * @tc.name: Apply StaticExtensionInfo. Connect to StaticExtensionInfoTest to query static information
    about an Extension
    * @tc.desc: Verify configuration module.json connect service application query property information
    */
    it('ACTS_getExtensionInfo_0300', 0, async function (done) {
      console.log('ACTS_getExtensionInfo_0300====<begin');
      console.log('========ACTS_getExtensionInfo_0300_StartConnect called');
      var subscriber;
      let id;
      var connId;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_getExtensionInfo_0300_Subscribe CallBack data:====>" + JSON.stringify(data));
        if (data.event == "ACTS_ConnectAbility_0100_CommonEvent") {
          clearTimeout(id);
          checkExtensionAbilityInfo(JSON.parse(data.parameters['extensionAbilityInfo']))
          expect(data.event).assertEqual("ACTS_ConnectAbility_0100_CommonEvent");
          commonEvent.unsubscribe(subscriber, unSubscribeCallback)
          done();
        }
      }
      commonEvent.createSubscriber(subscriberInfoStartAbility_0100).then(async (data) => {
        console.debug("====>ACTS_getExtensionInfo_0300_Create Subscriber====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, subscribeCallBack);
              connId = await globalThis.abilityContext.connectAbility(
        {
          bundleName: "com.example.extensionmodule",
          abilityName: "ServiceExtAbility",
        }
      );
      console.log('ACTS_getExtensionInfo_0300 ConnectAbility connId : ' + connId);
      })

      function unSubscribeCallback() {
        console.debug("====>ACTS_getExtensionInfo_0300_UnSubscribe CallBack====>");
      }

      function timeout() {
        expect().assertFail();
        globalThis.abilityContext.disconnectAbility(
          connId,
          (error, data) => {
            console.log('DisconnectAbility_0300 result errCode : ' + error.code + " data: " + data)
            done();
          },
        );
        console.debug('ACTS_ConnectAbility_0300 timeout');
        done();
      }

      id = setTimeout(timeout, START_ABILITY_TIMEOUT);


      function checkExtensionAbilityInfo(data) {
        console.log("checkHapModuleInfo_expect_typeof_end3")
        console.log("checkAbilityInfo metadata length : " + data.metadata.length);
        console.log("checkAbilityInfo metadata length : " + data.metadata[0].name);
        expect(data.metadata[0].name).assertEqual("ohos.extension.form");
        expect(data.metadata[0].value).assertEqual("MainAbility");
        expect(data.metadata[0].resource).assertEqual("@profile:form_config");
        expect(data.bundleName).assertEqual("com.example.extensionmodule");
        expect(data.moduleName).assertEqual("phone");
        expect(data.name).assertEqual("ServiceExtAbility");
        expect(data.permissions.length).assertEqual(1);
        expect(data.permissions[0]).assertEqual("ohos.permission.USE_BLUETOOTH");
        expect(data.isVisible).assertEqual(true);
        expect(data.extensionAbilityType).assertLarger(0);
        expect(data.readPermission).assertEqual("");
        expect(data.writePermission).assertEqual("");
        expect(data.enabled).assertEqual(true)
        console.log("checkExtensionAbilityInfo3 end  " + data);
      }
    })
  })
}