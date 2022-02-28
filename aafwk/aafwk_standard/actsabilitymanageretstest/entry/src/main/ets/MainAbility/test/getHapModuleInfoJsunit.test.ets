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
import {describe, it, expect} from "deccjsunit/index.ets";
import Utils from './Utils';
import ability_featureAbility from '@ohos.ability.featureAbility';

export default function getHapModuleInfoJsunit() {
  describe('appInfoTest', function () {
    /**
     * @tc.number: context_getHapModuleInfo_test_0100
     * @tc.name: getHapModuleInfo:Obtains the HapModuleInfo object of the application.
     * @tc.desc: Check the return type of the interface (by Promise)
     * @tc.level  0
     */
    it('context_getHapModuleInfo_test_0100', 0, async function (done) {
      console.info('[context_getHapModuleInfo_test_0100] START');
      await Utils.sleep(1000);
      var timeOldStamp = await Utils.getNowTime();
      var context = ability_featureAbility.getContext();
      context.getHapModuleInfo()
        .then((data) => {
          var timeNewStamp = Utils.getNowTime();
          Utils.getDurationTime('context_getHapModuleInfo_test_0100', timeOldStamp, timeNewStamp);
          console.info('[context_getHapModuleInfo_test_0100] data is:' + JSON.stringify(data));
          expect(typeof (data)).assertEqual("object");
        })
        .catch((error) => {
          console.error('[context_getHapModuleInfo_test_0100] failed:' + JSON.stringify(error));
        })
      var promise = await context.getHapModuleInfo();
      console.info('---[context_getHapModuleInfo_test_0100] check---');
      checkHapModuleInfo('context_getHapModuleInfo_test_0100', promise);
      console.info('[context_getHapModuleInfo_test_0100] FINISH');
      done();
    });

    /**
     * @tc.number: context_getHapModuleInfo_test_0200
     * @tc.name: getHapModuleInfo:Obtains the HapModuleInfo object of the application.
     * @tc.desc: Check the return type of the interface (by Callback)
     * @tc.level  0
     */
    it('context_getHapModuleInfo_test_0200', 0, async function (done) {
      try {
        console.info('[context_getHapModuleInfo_test_0200] START');

        var timeOldStamp = await Utils.getNowTime();
        var context = ability_featureAbility.getContext();
        context.getHapModuleInfo((error, data) => {
          var timeNewStamp = Utils.getNowTime();
          Utils.getDurationTime('context_getHapModuleInfo_test_0200', timeOldStamp, timeNewStamp);
          console.info('[context_getHapModuleInfo_test_0200] data is:' + JSON.stringify(data));
          expect(typeof (data)).assertEqual("object");
        });
      } catch (error) {
        console.error('[context_getHapModuleInfo_test_0200] failed: ' + JSON.stringify(error));
      }
      var callback = await context.getHapModuleInfo();
      console.info('---[context_getHapModuleInfo_test_0200] check---');
      checkHapModuleInfo('context_getHapModuleInfo_test_0200', callback);
      console.info('[context_getHapModuleInfo_test_0200] FINISH');
      done();
    });

    function checkHapModuleInfo(msg, data) {
      console.log(msg + "checkHapModuleInfo start  " + JSON.stringify(data));
      console.log(msg + "checkHapModuleInfo name : " + data.name);
      console.log(msg + "checkHapModuleInfo description : " + data.description);
      console.log(msg + "checkHapModuleInfo descriptionId : " + data.descriptionId);
      console.log(msg + "checkHapModuleInfo icon : " + data.icon);
      console.log(msg + "checkHapModuleInfo label : " + data.label);
      console.log(msg + "checkHapModuleInfo labelId : " + data.labelId);
      console.log(msg + "checkHapModuleInfo iconId : " + data.iconId);
      console.log(msg + "checkHapModuleInfo backgroundImg : " + data.backgroundImg);
      console.log(msg + "checkHapModuleInfo supportedModes : " + data.supportedModes);
      console.log(msg + "checkHapModuleInfo  reqCapabilities length : " + data.reqCapabilities.length);
      for (var j = 0; j < data.reqCapabilities.length; j++) {
        console.log(msg + "getHapModuleInfo data.reqCapabilities[" + j + "] : " + data.reqCapabilities[j]);
      }
      console.log(msg + "checkHapModuleInfo  deviceTypes length : " + data.deviceTypes.length);
      for (var k = 0; k < data.deviceTypes.length; k++) {
        console.log(msg + "getHapModuleInfo data.deviceTypes[" + k + "] : " + data.deviceTypes[k]);
      }
      console.log(msg + "checkHapModuleInfo abilityInfos length : " + data.abilityInfos.length);
      console.log(msg + "checkHapModuleInfo moduleName : " + data.moduleName);
      console.log(msg + "checkHapModuleInfo mainAbilityName : " + data.mainAbilityName);
      console.log(msg + "checkHapModuleInfo installationFree : " + data.installationFree);
      expect(typeof (data)).assertEqual("object");
      expect(typeof (data.name)).assertEqual("string");
      expect(typeof (data.description)).assertEqual("string");
      expect(typeof (data.descriptionId)).assertEqual("number");
      expect(typeof (data.icon)).assertEqual("string");
      expect(typeof (data.label)).assertEqual("string");
      expect(typeof (data.labelId)).assertEqual("number");
      expect(typeof (data.iconId)).assertEqual("number");
      expect(typeof (data.backgroundImg)).assertEqual("string");
      expect(typeof (data.supportedModes)).assertEqual("number");
      expect(Array.isArray(data.reqCapabilities)).assertEqual(true);
      expect(Array.isArray(data.deviceTypes)).assertEqual(true);
      expect(Array.isArray(data.abilityInfos)).assertEqual(true);
      expect(typeof (data.moduleName)).assertEqual("string");
      expect(typeof (data.mainAbilityName)).assertEqual("string");
      expect(typeof (data.installationFree)).assertEqual("boolean");
      expect(data.name).assertEqual("com.ohos.acecollaboration");
      expect(data.description).assertEqual("");
      expect(data.descriptionId).assertEqual(0);
      expect(data.icon).assertEqual("$media:icon");
      expect(data.label).assertEqual("$string:entry_MainAbility");
      expect(data.labelId).assertEqual(0);
      expect(data.iconId).assertEqual(0);
      expect(data.backgroundImg).assertEqual("");
      expect(data.supportedModes).assertEqual(0);
      expect(data.deviceTypes[0]).assertEqual("phone");
      expect(data.moduleName).assertEqual("entry")
      expect(data.mainAbilityName).assertEqual("");
      expect(data.installationFree).assertEqual(false);
      console.log(msg + "---checkHapModuleInfo End---");
    }
  })
}