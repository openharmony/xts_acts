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

import {describe, beforeEach, afterEach, it, expect} from 'deccjsunit/index.ets';
import Utils from './Utils';
import bundleManager from '@ohos.bundle';

export default function GetabilityInfo() {
  describe('GetabilityInfo', function () {
    let bundleName = "com.open.harmony.packagemag";
    let abilityName = "com.open.harmony.packagemag.MainAbility";
    let bundleName_other = "com.ohos.acecollaboration";
    let abilityName_other = "com.ohos.acecollaboration.MainAbility";
    let bundleName1 = "com.harmony.packagemag";
    let abilityName1 = "com.harmony.packagemag1.MainAbility";

    beforeEach(async function (done) {
      console.info('GetabilityInfo before each called');
      done()
    });

    afterEach(async function () {
      await Utils.sleep(2000);
      console.info('GetabilityInfo after each called');
    });

    /*
     * @tc.number: bundle_getAllApplicationInfo_test_0100
     * @tc.name: getAbilityInfo : The basic ability is enhanced to obtain the specified Ability information
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level   0
     */
    it('bundle_GetabilityInfo_test_0100', 0, async function (done) {
      console.info('[bundle_GetabilityInfo_test_0100] START');
      await Utils.sleep(1000);
      var timeOldStamp = await Utils.getNowTime();
      bundleManager.getAbilityInfo(bundleName, abilityName)
        .then((data) => {
          var timeNewStamp = Utils.getNowTime();
          Utils.getDurationTime('bundle_GetabilityInfo_test_0100', timeOldStamp, timeNewStamp)
          console.info('[bundle_GetabilityInfo_test_0100] getApplicationInfo in ');
          console.info('[bundle_GetabilityInfo_test_0100] getApplicationInfo promise data is: ' + JSON.stringify(data));
          expect(typeof (data)).assertEqual("object");
        }).catch((error) => {
        console.error('[bundle_GetabilityInfo_test_0100]Operation failed. Cause: ' + JSON.stringify(error));
      })
      var promise = await bundleManager.getAbilityInfo(bundleName, abilityName);
      checkAbilityInfo(promise);
      done();
    });

    /*
     * @tc.number: bundle_getAbilityInfo_test_0200
     * @tc.name: getAbilityInfo : The basic ability is enhanced to obtain the specified Ability information
     * @tc.desc: Check the return value of the interface (by callback)
     * @tc.level   0
     */
    it('bundle_GetabilityInfo_test_0200', 0, async function (done) {
      console.info('[bundle_GetabilityInfo_test_0200] START');
      await Utils.sleep(1000);
      var timeOldStamp = await Utils.getNowTime();
      bundleManager.getAbilityInfo(bundleName, abilityName, (err, data) => {
        var timeNewStamp = Utils.getNowTime();
        Utils.getDurationTime('bundle_GetabilityInfo_test_0200', timeOldStamp, timeNewStamp)
        if (err) {
          console.error('[bundle_GetabilityInfo_test_0200]Operation failed. Cause: ' + JSON.stringify(err));
        }
        console.info('[bundle_GetabilityInfo_test_0200]Operation successful. Data:' + JSON.stringify(data));
        console.info('[bundle_GetabilityInfo_test_0200] getApplicationInfo callback data is: ' + JSON.stringify(data));
      })
      var callback = await bundleManager.getAbilityInfo(bundleName, abilityName);
      checkAbilityInfo(callback);
      done();
    });

    /*
     * @tc.number: bundle_getAllApplicationInfo_test_0300
     * @tc.name: getAbilityInfo : The basic ability is enhanced to obtain the specified Ability information
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level   0
     */
    it('bundle_GetabilityInfo_test_0300', 0, async function (done) {
      console.info('[bundle_GetabilityInfo_test_0300] START');
      await Utils.sleep(1000);
      var timeOldStamp = await Utils.getNowTime();
      var mData;
      var mError = null;
      await bundleManager.getAbilityInfo(bundleName_other, abilityName_other)
        .then((data) => {
          var timeNewStamp = Utils.getNowTime();
          Utils.getDurationTime('bundle_GetabilityInfo_test_0300', timeOldStamp, timeNewStamp);
          mData = data;
          console.info('[bundle_GetabilityInfo_test_0300] getApplicationInfo in ');
          console.info('[bundle_GetabilityInfo_test_0300] getApplicationInfo promise data is: ' + JSON.stringify(data));
          expect(typeof (data)).assertEqual("object");
        }).catch((error) => {
          mError = error;
          console.error('[bundle_GetabilityInfo_test_0300]Operation failed. Cause: ' + JSON.stringify(error));
        })
      if (mError != null) {
        await expect(mError).assertEqual(1);
      } else {
        checkAbilityInfo_other(mData);
      }
      done();
    });


    /*
     * @tc.number: bundle_getAllApplicationInfo_test_0400
     * @tc.name: getAbilityInfo : The basic ability is enhanced to obtain the specified Ability information
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level   0
     */
    it('bundle_GetabilityInfo_test_0400', 0, async function (done) {
      console.info('[bundle_GetabilityInfo_test_0400] START');
      let error1;
      await Utils.sleep(1000);
      var timeOldStamp = await Utils.getNowTime();
      bundleManager.getAbilityInfo(bundleName1, abilityName)
        .then((data) => {
          var timeNewStamp = Utils.getNowTime();
          Utils.getDurationTime('bundle_GetabilityInfo_test_0400', timeOldStamp, timeNewStamp)
          console.info('[bundle_GetabilityInfo_test_0400] getApplicationInfo in ');
          console.info('[bundle_GetabilityInfo_test_0400] getApplicationInfo data is: ' + JSON.stringify(data));
          expect(typeof (data)).assertEqual("object");
        }).catch((error) => {
        console.error('[bundle_GetabilityInfo_test_0400]Operation failed. Cause: ' + JSON.stringify(error));
        error1 = error;
      })
      await Utils.sleep(1000);
      await expect(error1).assertEqual(1);
      done();
    });

    /*
     * @tc.number: bundle_getAllApplicationInfo_test_0500
     * @tc.name: getAbilityInfo : The basic ability is enhanced to obtain the specified Ability information
     * @tc.desc: Check the return value of the interface (by callback)
     * @tc.level   0
     */
    it('bundle_GetabilityInfo_test_0500', 0, async function (done) {
      console.info('[bundle_GetabilityInfo_test_0500] START');
      let error
      await bundleManager.getAbilityInfo(bundleName, abilityName1).then((data) => {
        console.info('[bundle_GetabilityInfo_test_0500] START' + JSON.stringify(data));
      }).catch((err) => {
        console.info('[bundle_GetabilityInfo_test_0500] err = ' + JSON.stringify(err));
        error = err
      })
      expect(error).assertEqual(1);
      done();
      console.info('[bundle_GetabilityInfo_test_0500] END');
    });

    /*
     * @tc.number: bundle_getAllApplicationInfo_test_0600
     * @tc.name: getAbilityInfo : The basic ability is enhanced to obtain the specified Ability information
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level   0
     */
    let bundleName2 = "";
    it('bundle_GetabilityInfo_test_0600', 0, async function (done) {
      console.info('[bundle_GetabilityInfo_test_0600] START');
      let error1;
      await Utils.sleep(1000);
      var timeOldStamp = await Utils.getNowTime();
      bundleManager.getAbilityInfo(bundleName2, abilityName)
        .then((data) => {
          var timeNewStamp = Utils.getNowTime();
          Utils.getDurationTime('bundle_GetabilityInfo_test_0600', timeOldStamp, timeNewStamp)
          console.info('[bundle_GetabilityInfo_test_0600] getApplicationInfo in ');
          console.info('[bundle_GetabilityInfo_test_0600] getApplicationInfo data promise is: ' + JSON.stringify(data));
          expect(typeof (data)).assertEqual("object");
        }).catch((error) => {
        console.error('[bundle_GetabilityInfo_test_0600]Operation failed. Cause: ' + JSON.stringify(error));
        error1 = error;
      })
      await Utils.sleep(1000);
      await expect(error1).assertEqual(1);
      done();
    });


    /**
     * 打印AbilityInfo属性信息
     * @param data
     */
    function checkAbilityInfo(data) {
      console.log("checkAbilityInfo start  " + JSON.stringify(data));
      console.log("checkAbilityInfo bundleName : " + data.bundleName);
      console.log("checkAbilityInfo name : " + data.name);
      console.log("checkAbilityInfo label : " + data.label);
      console.log("checkAbilityInfo description : " + data.description);
      console.log("checkAbilityInfo icon : " + data.icon);
      console.log("checkAbilityInfo descriptionId : " + data.descriptionId);
      console.log("checkAbilityInfo iconId : " + data.iconId);
      console.log("checkAbilityInfo moduleName : " + data.moduleName);
      console.log("checkAbilityInfo process : " + data.process);
      console.log("checkAbilityInfo targetAbility : " + data.targetAbility);
      console.log("checkAbilityInfo backgroundModes : " + data.backgroundModes);
      console.log("checkAbilityInfo isVisible : " + data.isVisible);
      console.log("checkAbilityInfo formEnabled : " + data.formEnabled);
      console.log("checkAbilityInfo type : " + data.type)
      console.log("checkAbilityInfo orientation : " + data.orientation);
      console.log("checkAbilityInfo launchMode : " + data.launchMode);
      console.log("checkAbilityInfo permissions length : " + data.permissions.length);
      for (var j = 0; j < data.permissions.length; j++) {
        console.log("getAbilityInfo data.permissions[" + j + "] : " + data.permissions[j]);
      }
      console.log("checkAbilityInfo deviceTypes length : " + data.deviceTypes.length);
      for (var k = 0; k < data.deviceTypes.length; k++) {
        console.log("getAbilityInfo data.deviceTypes[" + k + "] : " + data.deviceTypes[k]);
      }
      console.log("checkAbilityInfo deviceCapabilities length : " + data.deviceCapabilities.length);
      for (var i = 0; i < data.deviceCapabilities.length; i++) {
        console.log("getAbilityInfo data.deviceCapabilities[" + i + "] : " + data.deviceCapabilities[i]);
      }
      console.log("checkAbilityInfo readPermission : " + data.readPermission);
      console.log("checkAbilityInfo writePermission : " + data.writePermission);
      console.log("checkAbilityInfo defaultFormWidth : " + data.defaultFormWidth);
      console.log("checkAbilityInfo uri : " + data.uri);
      console.log("checkAbilityInfo labelId : " + data.labelId);
      console.log("checkAbilityInfo subType : " + data.subType);
      expect(typeof (data.bundleName)).assertEqual("string");
      expect(typeof (data.name)).assertEqual("string");
      expect(data.label).assertEqual("$string:entry_MainAbility");
      expect(typeof (data.label)).assertEqual("string");
      expect(data.description).assertEqual("$string:mainability_description");
      expect(typeof (data.description)).assertEqual("string");
      expect(data.icon).assertEqual("$media:icon");
      expect(typeof (data.icon)).assertEqual("string");
      expect(typeof (data.srcPath)).assertEqual("string");
      expect(data.srcLanguage).assertEqual("ets");
      expect(typeof (data.srcLanguage)).assertEqual("string");
      expect(data.isVisible).assertEqual(true);
      expect(Array.isArray(data.permissions)).assertEqual(true);
      expect(Array.isArray(data.deviceCapabilities)).assertEqual(true);
      expect(data.deviceTypes[0]).assertEqual("phone");
      expect(typeof (data.process)).assertEqual("string");
      expect(typeof (data.uri)).assertEqual("string");
      expect(data.uri).assertEqual("");
      expect(typeof (data.uri)).assertEqual("string");
      expect(data.moduleName).assertEqual("entry");
      expect(typeof (data.moduleName)).assertEqual("string");
      expect(typeof (data.applicationInfo)).assertEqual("object");
      expect(data.bundleName).assertEqual("com.open.harmony.packagemag")
      expect(data.name).assertEqual("com.open.harmony.packagemag.MainAbility");
      checkApplicationInfo(data.applicationInfo);
      console.log("---checkAbilityInfo End---  ");
    }

    /**
     * 打印ApplicationInfo属性信息
     * @param data
     */
    function checkApplicationInfo(info) {
      console.log("checkApplicationInfo getApplicationInfo : " + JSON.stringify(info));
      console.log("checkApplicationInfo name : " + info.name);
      console.log("checkApplicationInfo description : " + info.description);
      console.log("checkApplicationInfo descriptionId : " + info.descriptionId);
      console.log("checkApplicationInfo systemApp : " + info.systemApp);
      console.log("checkApplicationInfo enabled : " + info.enabled);
      console.log("checkApplicationInfo label : " + info.label);
      console.log("checkApplicationInfo labelId : " + info.labelId);
      console.log("checkApplicationInfo icon : " + info.icon);
      console.log("checkApplicationInfo process : " + info.process);
      console.log("checkApplicationInfo supportedModes : " + info.supportedModes);
      console.log("checkApplicationInfo moduleSourceDirs length : " + info.moduleSourceDirs.length);
      for (var j = 0; j < info.moduleSourceDirs.length; j++) {
        console.log("checkApplicationInfo info.moduleSourceDirs[" + j + "] : " + info.moduleSourceDirs[j]);
      }
      console.log("checkApplicationInfo permissions length : " + info.permissions.length);
      for (var j = 0; j < info.permissions.length; j++) {
        console.log("checkApplicationInfo info.permissions[" + j + "] : " + info.permissions[j]);
      }
      console.log("checkApplicationInfo moduleInfos length : " + info.moduleInfos.length);
      for (var j = 0; j < info.moduleInfos.length; j++) {
        console.log("checkApplicationInfo info.moduleInfos[" + j + "].moduleName : " + info.moduleInfos[j].moduleName);
        console.log("checkApplicationInfo info.moduleInfos[" + j + "].moduleSourceDir : " + info.moduleInfos[j].moduleSourceDir);
      }
      console.log("checkApplicationInfo entryDir : " + info.entryDir);
      expect(typeof (info)).assertEqual("object")
      expect(typeof (info.name)).assertEqual("string")
      expect(typeof (info.codePath)).assertEqual("string")
      expect(info.accessTokenId > 0).assertTrue()
      expect(typeof (info.accessTokenId)).assertEqual("number")
      expect(typeof (info.description)).assertEqual("string")
      expect(info.description).assertEqual("$string:mainability_description")
      expect(info.descriptionId > 0).assertTrue()
      expect(typeof (info.descriptionId)).assertEqual("number")
      expect(typeof (info.icon)).assertEqual("string")
      expect(info.icon).assertEqual("$media:icon")
      expect(info.iconId > 0).assertTrue()
      expect(typeof (info.iconId)).assertEqual("number")
      expect(typeof (info.label)).assertEqual("string")
      expect(info.label).assertEqual("$string:entry_MainAbility")
      expect(info.labelId > 0).assertTrue()
      expect(typeof (info.labelId)).assertEqual("number")
      expect(info.systemApp).assertEqual(true)
      expect(typeof (info.entryDir)).assertEqual("string")
      expect(info.supportedModes).assertEqual(0)
      expect(typeof (info.supportedModes)).assertEqual("number")
      expect(typeof (info.process)).assertEqual("string")
      expect(info.process).assertEqual("")
      expect(Array.isArray(info.moduleSourceDirs)).assertEqual(true);
      expect(info.entryDir)
        .assertEqual("/data/app/el1/bundle/public/com.open.harmony.packagemag/com.open.harmony.packagemag");
      expect(Array.isArray(info.permissions)).assertEqual(true);
      expect(info.codePath).assertEqual("/data/app/el1/bundle/public/com.open.harmony.packagemag");
      expect(info.moduleSourceDirs[0])
        .assertEqual("/data/app/el1/bundle/public/com.open.harmony.packagemag/com.open.harmony.packagemag");
      expect(info.enabled).assertEqual(true);
      expect(info.flags).assertEqual(0);
      expect(info.uid > 0).assertTrue()
      expect(info.entityType).assertEqual("unspecified");
      expect(info.removable).assertEqual(true);
      expect(info.accessTokenId > 0).assertTrue()
    }

    /**
     * 打印ApplicationInfo属性信息
     * @param data
     */
    function checkAbilityInfo_other(data) {
      console.log("checkAbilityInfo start  " + JSON.stringify(data));
      console.log("checkAbilityInfo bundleName : " + data.bundleName);
      console.log("checkAbilityInfo name : " + data.name);
      console.log("checkAbilityInfo label : " + data.label);
      console.log("checkAbilityInfo description : " + data.description);
      console.log("checkAbilityInfo icon : " + data.icon);
      console.log("checkAbilityInfo descriptionId : " + data.descriptionId);
      console.log("checkAbilityInfo iconId : " + data.iconId);
      console.log("checkAbilityInfo moduleName : " + data.moduleName);
      console.log("checkAbilityInfo process : " + data.process);
      console.log("checkAbilityInfo targetAbility : " + data.targetAbility);
      console.log("checkAbilityInfo backgroundModes : " + data.backgroundModes);
      console.log("checkAbilityInfo isVisible : " + data.isVisible);
      console.log("checkAbilityInfo formEnabled : " + data.formEnabled);
      console.log("checkAbilityInfo type : " + data.type)
      console.log("checkAbilityInfo orientation : " + data.orientation);
      console.log("checkAbilityInfo launchMode : " + data.launchMode);
      console.log("checkAbilityInfo permissions length : " + data.permissions.length);
      for (var j = 0; j < data.permissions.length; j++) {
        console.log("getAbilityInfo data.permissions[" + j + "] : " + data.permissions[j]);
      }
      console.log("checkAbilityInfo deviceTypes length : " + data.deviceTypes.length);
      for (var k = 0; k < data.deviceTypes.length; k++) {
        console.log("getAbilityInfo data.deviceTypes[" + k + "] : " + data.deviceTypes[k]);
      }
      console.log("checkAbilityInfo deviceCapabilities length : " + data.deviceCapabilities.length);
      for (var i = 0; i < data.deviceCapabilities.length; i++) {
        console.log("getAbilityInfo data.deviceCapabilities[" + i + "] : " + data.deviceCapabilities[i]);
      }
      console.log("checkAbilityInfo readPermission : " + data.readPermission);
      console.log("checkAbilityInfo writePermission : " + data.writePermission);
      console.log("checkAbilityInfo defaultFormWidth : " + data.defaultFormWidth);
      console.log("checkAbilityInfo uri : " + data.uri);
      console.log("checkAbilityInfo labelId : " + data.labelId);
      console.log("checkAbilityInfo subType : " + data.subType);
      expect(typeof (data.bundleName)).assertEqual("string");
      expect(typeof (data.name)).assertEqual("string");
      expect(data.label).assertEqual("$string:entry_MainAbility");
      expect(typeof (data.label)).assertEqual("string");
      expect(data.description).assertEqual("$string:mainability_description");
      expect(typeof (data.description)).assertEqual("string");
      expect(data.icon).assertEqual("$media:icon");
      expect(typeof (data.icon)).assertEqual("string");
      expect(typeof (data.srcPath)).assertEqual("string");
      expect(data.srcLanguage).assertEqual("ets");
      expect(typeof (data.srcLanguage)).assertEqual("string");
      expect(data.isVisible).assertEqual(true);
      expect(Array.isArray(data.permissions)).assertEqual(true);
      expect(Array.isArray(data.deviceCapabilities)).assertEqual(true);
      expect(data.deviceTypes[0]).assertEqual("phone");
      expect(typeof (data.process)).assertEqual("string");
      expect(typeof (data.uri)).assertEqual("string");
      expect(data.uri).assertEqual("");
      expect(typeof (data.uri)).assertEqual("string");
      expect(data.moduleName).assertEqual("entry");
      expect(typeof (data.moduleName)).assertEqual("string");
      expect(typeof (data.applicationInfo)).assertEqual("object");
      expect(data.bundleName).assertEqual("com.ohos.acecollaboration");
      expect(data.name).assertEqual("com.ohos.acecollaboration.MainAbility");
      checkApplicationInfo_other(data.applicationInfo);
      console.log("---checkAbilityInfo End---  ");
    }

    /**
     * 打印ApplicationInfo属性信息
     * @param data
     */
    function checkApplicationInfo_other(info) {
      console.log("checkApplicationInfo getApplicationInfo : " + JSON.stringify(info));
      console.log("checkApplicationInfo name : " + info.name);
      console.log("checkApplicationInfo description : " + info.description);
      console.log("checkApplicationInfo descriptionId : " + info.descriptionId);
      console.log("checkApplicationInfo systemApp : " + info.systemApp);
      console.log("checkApplicationInfo enabled : " + info.enabled);
      console.log("checkApplicationInfo label : " + info.label);
      console.log("checkApplicationInfo labelId : " + info.labelId);
      console.log("checkApplicationInfo icon : " + info.icon);
      console.log("checkApplicationInfo process : " + info.process);
      console.log("checkApplicationInfo supportedModes : " + info.supportedModes);
      console.log("checkApplicationInfo moduleSourceDirs length : " + info.moduleSourceDirs.length);
      for (var j = 0; j < info.moduleSourceDirs.length; j++) {
        console.log("checkApplicationInfo info.moduleSourceDirs[" + j + "] : " + info.moduleSourceDirs[j]);
      }
      console.log("checkApplicationInfo permissions length : " + info.permissions.length);
      for (var j = 0; j < info.permissions.length; j++) {
        console.log("checkApplicationInfo info.permissions[" + j + "] : " + info.permissions[j]);
      }
      console.log("checkApplicationInfo moduleInfos length : " + info.moduleInfos.length);
      for (var j = 0; j < info.moduleInfos.length; j++) {
        console.log("checkApplicationInfo info.moduleInfos[" + j + "].moduleName : " + info.moduleInfos[j].moduleName);
        console.log("checkApplicationInfo info.moduleInfos[" + j + "].moduleSourceDir : " + info.moduleInfos[j].moduleSourceDir);
      }
      console.log("checkApplicationInfo entryDir : " + info.entryDir);
      expect(typeof (info)).assertEqual("object")
      expect(typeof (info.name)).assertEqual("string")
      expect(typeof (info.codePath)).assertEqual("string")
      expect(info.accessTokenId > 0).assertTrue()
      expect(typeof (info.accessTokenId)).assertEqual("number")
      expect(typeof (info.description)).assertEqual("string")
      expect(info.description).assertEqual("$string:mainability_description")
      expect(info.descriptionId > 0).assertTrue()
      expect(typeof (info.descriptionId)).assertEqual("number")
      expect(typeof (info.icon)).assertEqual("string")
      expect(info.icon).assertEqual("$media:icon")
      expect(info.iconId > 0).assertTrue()
      expect(typeof (info.iconId)).assertEqual("number")
      expect(typeof (info.label)).assertEqual("string")
      expect(info.label).assertEqual("$string:entry_MainAbility")
      expect(info.labelId > 0).assertTrue()
      expect(typeof (info.labelId)).assertEqual("number")
      expect(info.systemApp).assertEqual(true)
      expect(typeof (info.entryDir)).assertEqual("string")
      expect(info.supportedModes).assertEqual(0)
      expect(typeof (info.supportedModes)).assertEqual("number")
      expect(typeof (info.process)).assertEqual("string")
      expect(info.process).assertEqual("")
      expect(Array.isArray(info.moduleSourceDirs)).assertEqual(true);
      expect(info.entryDir)
        .assertEqual("/data/app/el1/bundle/public/com.ohos.acecollaboration/com.ohos.acecollaboration");
      expect(Array.isArray(info.permissions)).assertEqual(true);
      expect(info.codePath).assertEqual("/data/app/el1/bundle/public/com.ohos.acecollaboration");
      expect(info.moduleSourceDirs[0])
        .assertEqual("/data/app/el1/bundle/public/com.ohos.acecollaboration/com.ohos.acecollaboration");
      expect(info.enabled).assertEqual(true);
      expect(info.flags).assertEqual(0);
      expect(info.uid > 0).assertTrue()
      expect(info.entityType).assertEqual("unspecified");
      expect(info.removable).assertEqual(true);
      expect(info.accessTokenId > 0).assertTrue()
    }
  });
}