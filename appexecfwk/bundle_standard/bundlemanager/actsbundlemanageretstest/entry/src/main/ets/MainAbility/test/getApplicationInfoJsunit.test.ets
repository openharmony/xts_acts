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
import Bundle from '@ohos.bundle';

const TAG_TEST_0100_001 = ' bundle_getApplicationInfo_test_0100_001 ';
const TAG_TEST_0100_002 = ' bundle_getApplicationInfo_test_0100_002 ';
const TAG_TEST_0100_003 = ' bundle_getApplicationInfo_test_0100_003 ';
const TAG_TEST_0200_001 = ' bundle_getApplicationInfo_test_0200_004 ';
const TAG_TEST_0200_002 = ' bundle_getApplicationInfo_test_0200_005 ';
const TAG_TEST_0200_003 = ' bundle_getApplicationInfo_test_0200_006 ';
const TAG_TEST_0300_001 = ' bundle_getApplicationInfo_test_0300_007 ';
const TAG_TEST_0400_001 = ' bundle_getApplicationInfo_test_0400_008 ';
const TAG_TEST_0500_001 = ' bundle_getApplicationInfo_test_0500_009 ';
const TAG_TEST_0500_002 = ' bundle_getApplicationInfo_test_0500_0010 ';
const TAG_TEST_0600_001 = ' bundle_getApplicationInfo_test_0600_0011 ';
const TAG_TEST_0600_002 = ' bundle_getApplicationInfo_test_0600_0012 ';
const TAG_TEST_0600_003 = ' bundle_getApplicationInfo_test_0600_0013 ';
const BUNDLE_NAME = 'com.open.harmony.packagemag';
const BUNDLE_NAME_OTHER = 'com.ohos.acepackage';
const USER_ID_100 = 100;
const SLEEP_TIME_1000 = 1000;
const SLEEP_TIME_2000 = 2000;

export default function applicationBundleJsunit() {
  describe('appInfoTest', function () {
    beforeEach(async function (done) {
      console.info('applicationBundle before each called');
      done()
    });

    afterEach(async function () {
      await Utils.sleep(SLEEP_TIME_2000);
      console.info('applicationBundle after each called');
    });

    /**
     * @tc.number: bundle_getApplicationInfo_test_0100_001
     * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level 0
     */
    it(TAG_TEST_0100_001, 0, async function (done) {
      console.info(TAG_TEST_0100_001 + 'promise START');
      await Utils.sleep(SLEEP_TIME_1000);
      let errors;
      var startTime = await Utils.getNowTime();
      let data = await Bundle.getApplicationInfo(BUNDLE_NAME, Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION,
        USER_ID_100)
        .catch((error) => {
          console.info(TAG_TEST_0100_001 + 'UserId promise error is: ' + error);
          errors = error;
        });
      var endTime = Utils.getNowTime();
      Utils.getDurationTime(TAG_TEST_0100_001, startTime, endTime);
      console.info(TAG_TEST_0100_001 + ' UserId promise data is: ' + JSON.stringify(data));
      if (1 === errors) {
        expect(errors).assertEqual(1);
      } else {
        commonTest(TAG_TEST_0100_001, data);
        getApplicationInfoSuccess(TAG_TEST_0100_001, data);
      }
      done();
      console.log('------------------ ' + TAG_TEST_0100_001 + ' end -------------------');
    });

    /**
     * @tc.number: bundle_getApplicationInfo_test_0100_002
     * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level 0
     */
    it(TAG_TEST_0100_002, 0, async function (done) {
      console.info(TAG_TEST_0100_002 + 'promise START');
      await Utils.sleep(SLEEP_TIME_1000);
      let errors;
      var startTime = await Utils.getNowTime();
      let data = await Bundle.getApplicationInfo(BUNDLE_NAME, Bundle.BundleFlag.GET_ALL_APPLICATION_INFO, USER_ID_100)
        .catch((error) => {
          console.info(TAG_TEST_0100_002 + 'UserId promise error is: ' + error);
          errors = error;
        });
      var endTime = Utils.getNowTime();
      Utils.getDurationTime(TAG_TEST_0100_002, startTime, endTime);
      console.info(TAG_TEST_0100_002 + ' UserId promise data is: ' + JSON.stringify(data));
      if (1 === errors) {
        expect(errors).assertEqual(1);
      } else {
        commonTest(TAG_TEST_0100_002, data);
        getApplicationInfoSuccess(TAG_TEST_0100_002, data);
      }
      done();
      console.log('------------------ ' + TAG_TEST_0100_002 + ' end -------------------');
    });

    /**
     * @tc.number: bundle_getApplicationInfo_test_0100_003
     * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level 0
     */
    it(TAG_TEST_0100_003, 0, async function (done) {
      console.info(TAG_TEST_0100_003 + 'promise START');
      await Utils.sleep(SLEEP_TIME_1000);
      let errors;
      var startTime = await Utils.getNowTime();
      let data = await Bundle.getApplicationInfo(BUNDLE_NAME, Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_DISABLE,
        USER_ID_100)
        .catch((error) => {
          console.info(TAG_TEST_0100_003 + 'UserId promise error is: ' + error);
          errors = error;
        });
      var endTime = Utils.getNowTime();
      Utils.getDurationTime(TAG_TEST_0100_003, startTime, endTime);
      console.info(TAG_TEST_0100_003 + ' UserId promise data is: ' + JSON.stringify(data));
      if (1 === errors) {
        expect(errors).assertEqual(1);
      } else {
        commonTest(TAG_TEST_0100_003, data);
        if ('' === data.name) {
          getApplicationInfoFial(TAG_TEST_0100_003, data);
        } else {
          getApplicationInfoSuccess(TAG_TEST_0100_003, data);
        }
      }
      done();
      console.log('------------------ ' + TAG_TEST_0100_003 + ' end -------------------');
    });


    /**
     * @tc.number: bundle_getApplicationInfo_test_0200_004
     * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level 0
     */
    it(TAG_TEST_0200_001, 0, async function (done) {
      console.info(TAG_TEST_0200_001 + 'promise START');
      let errors;
      await Utils.sleep(SLEEP_TIME_1000);
      var startTime = await Utils.getNowTime();
      let data = await Bundle.getApplicationInfo(BUNDLE_NAME, Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION)
        .catch((error) => {
          console.info(TAG_TEST_0200_001 + 'onUserId promise error is: ' + error);
          errors = error;
        });
      var endTime = Utils.getNowTime();
      Utils.getDurationTime(TAG_TEST_0200_001, startTime, endTime);
      console.info(TAG_TEST_0200_001 + ' onUserId promise data is: ' + JSON.stringify(data));
      if (1 === errors) {
        expect(errors).assertEqual(1);
      } else {
        commonTest(TAG_TEST_0200_001, data);
        getApplicationInfoSuccess(TAG_TEST_0200_001, data);
      }
      done();
      console.log('------------------ ' + TAG_TEST_0200_001 + ' end -------------------');
    });

    /**
     * @tc.number: bundle_getApplicationInfo_test_0200_005
     * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level 0
     */
    it(TAG_TEST_0200_002, 0, async function (done) {
      console.info(TAG_TEST_0200_002 + 'promise START');
      await Utils.sleep(SLEEP_TIME_1000);
      let errors;
      var startTime = await Utils.getNowTime();
      let data = await Bundle.getApplicationInfo(BUNDLE_NAME, Bundle.BundleFlag.GET_ALL_APPLICATION_INFO)
        .catch((error) => {
          console.info(TAG_TEST_0200_002 + 'onUserId promise error is: ' + error);
          errors = error;
        });
      var endTime = Utils.getNowTime();
      Utils.getDurationTime(TAG_TEST_0200_002, startTime, endTime);
      console.info(TAG_TEST_0200_002 + ' onUserId promise data is: ' + JSON.stringify(data));
      if (1 === errors) {
        expect(errors).assertEqual(1);
      } else {
        commonTest(TAG_TEST_0200_002, data);
        getApplicationInfoSuccess(TAG_TEST_0200_002, data);
      }
      done();
      console.log('------------------ ' + TAG_TEST_0200_002 + ' end -------------------');
    });

    /**
     * @tc.number: bundle_getApplicationInfo_test_0200_006
     * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level 0
     */
    it(TAG_TEST_0200_003, 0, async function (done) {
      console.info(TAG_TEST_0200_003 + 'promise START');
      await Utils.sleep(SLEEP_TIME_1000);
      let errors;
      var startTime = await Utils.getNowTime();
      let data = await Bundle.getApplicationInfo(BUNDLE_NAME, Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_DISABLE)
        .catch((error) => {
          console.info(TAG_TEST_0200_003 + 'onUserId promise error is: ' + error);
          errors = error;
        });
      var endTime = Utils.getNowTime();
      Utils.getDurationTime(TAG_TEST_0200_003, startTime, endTime);
      console.info(TAG_TEST_0200_003 + ' onUserId promise data is: ' + JSON.stringify(data));
      if (1 === errors) {
        expect(errors).assertEqual(1);
      } else {
        commonTest(TAG_TEST_0200_003, data);
        getApplicationInfoSuccess(TAG_TEST_0200_003, data);
      }
      done();
      console.log('------------------ ' + TAG_TEST_0200_003 + ' end -------------------');
    });

    /**
     * @tc.number: bundle_getApplicationInfo_test_0300_007
     * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
     * @tc.desc: Check the return value of the interface (by callBack)
     * @tc.level 0
     */
    it(TAG_TEST_0300_001, 0, async function (done) {
      console.info(TAG_TEST_0300_001 + 'callBack START');
      await Utils.sleep(SLEEP_TIME_1000);
      let errors;
      let datas;
      var startTime = await Utils.getNowTime();
      Bundle.getApplicationInfo(BUNDLE_NAME, Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION,
        USER_ID_100, (error, data) => {
          var endTime = Utils.getNowTime();
          Utils.getDurationTime(TAG_TEST_0300_001, startTime, endTime);
          console.info(TAG_TEST_0300_001 + 'UserId callBack in');
          console.info(TAG_TEST_0300_001 + 'UserId callBack error: ' + error);
          errors = error;
          console.info(TAG_TEST_0300_001 + 'UserId callBack data is:' + JSON.stringify(data));
          datas = data;
        });
      await Utils.sleep(2000);
      console.info(TAG_TEST_0300_001 + 'UserId callBack data is: ' + JSON.stringify(datas));
      if (1 === errors) {
        expect(errors).assertEqual(1);
      } else {
        commonTest(TAG_TEST_0300_001, datas);
        getApplicationInfoSuccess(TAG_TEST_0300_001, datas);
      }
      done();
      console.log('------------------ ' + TAG_TEST_0300_001 + ' end -------------------');
    });

    /**
     * @tc.number: bundle_getApplicationInfo_test_0400_008
     * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
     * @tc.desc: Check the return value of the interface (by callBack)
     * @tc.level 0
     */
    it(TAG_TEST_0400_001, 0, async function (done) {
      console.info(TAG_TEST_0400_001 + 'callBack START');
      let errors;
      let datas;
      var startTime = await Utils.getNowTime();
      Bundle.getApplicationInfo(BUNDLE_NAME, Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, (error, data) => {
        var endTime = Utils.getNowTime();
        Utils.getDurationTime(TAG_TEST_0400_001, startTime, endTime);
        console.info(TAG_TEST_0400_001 + 'noUserId callBack in');
        console.info(TAG_TEST_0400_001 + 'noUserId callBack error: ' + error);
        errors = error;
        console.info(TAG_TEST_0400_001 + 'noUserId callBack data is:' + JSON.stringify(data));
        datas = data;
      });
      await Utils.sleep(2000);
      console.info(TAG_TEST_0400_001 + 'noUserId callBack data is: ' + JSON.stringify(datas));
      if (1 === errors) {
        expect(errors).assertEqual(1);
      } else {
        commonTest(TAG_TEST_0400_001, datas);
        getApplicationInfoSuccess(TAG_TEST_0400_001, datas);
      }
      done();
      console.log('------------------ ' + TAG_TEST_0400_001 + ' end -------------------');
    });

    /**
     * @tc.number: bundle_getApplicationInfo_test_0500_009
     * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level 0
     */
    it(TAG_TEST_0500_001, 0, async function (done) {
      console.info(TAG_TEST_0500_001 + 'promise START');
      await Utils.sleep(SLEEP_TIME_1000);
      let errors;
      var startTime = await Utils.getNowTime();
      let data = await Bundle.getApplicationInfo('', 0)
        .catch((error) => {
          console.info(TAG_TEST_0500_001 + 'noUserId promise error is: ' + error);
          errors = error;
        });
      var endTime = Utils.getNowTime();
      Utils.getDurationTime(TAG_TEST_0500_001, startTime, endTime);
      console.info(TAG_TEST_0500_001 + ' noUserId promise data is: ' + JSON.stringify(data));
      if (1 === errors) {
        expect(errors).assertEqual(1);
      }
      done();
      console.log('------------------ ' + TAG_TEST_0500_001 + ' end -------------------');
    });

    /**
     * @tc.number: bundle_getApplicationInfo_test_0500_0010
     * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level 0
     */
    it(TAG_TEST_0500_002, 0, async function (done) {
      console.info(TAG_TEST_0500_002 + 'promise START');
      await Utils.sleep(SLEEP_TIME_1000);
      let errors;
      var startTime = await Utils.getNowTime();
      let data = await Bundle.getApplicationInfo('', '0', USER_ID_100)
        .catch((error) => {
          console.info(TAG_TEST_0500_002 + 'UserId promise error is: ' + error);
          errors = error;
        });
      var endTime = Utils.getNowTime();
      Utils.getDurationTime(TAG_TEST_0500_002, startTime, endTime);
      console.info(TAG_TEST_0500_002 + ' UserId promise data is: ' + JSON.stringify(data));
      if (1 === errors) {
        expect(errors).assertEqual(1);
      }
      done();
      console.log('------------------ ' + TAG_TEST_0500_002 + ' end -------------------');
    });

    /**
     * @tc.number: bundle_getApplicationInfo_test_0600_0011
     * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level 0
     */
    it(TAG_TEST_0600_001, 0, async function (done) {
      console.info(TAG_TEST_0600_001 + 'promise START');
      await Utils.sleep(SLEEP_TIME_1000);
      let errors;
      var startTime = await Utils.getNowTime();
      let data = await Bundle.getApplicationInfo(BUNDLE_NAME_OTHER,
        Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION)
        .catch((error) => {
          console.info(TAG_TEST_0600_001 + 'other bundleName noUserId promise error is: ' + error);
          errors = error;
        });
      console.info(TAG_TEST_0600_001 + ' other bundleName noUserId promise errors is: ' + JSON.stringify(errors));
      console.info(TAG_TEST_0600_001 + ' other bundleName noUserId promise data is: ' + JSON.stringify(data));
      var endTime = Utils.getNowTime();
      Utils.getDurationTime(TAG_TEST_0600_001, startTime, endTime);
      if (1 === errors) {
        expect(errors).assertEqual(1);
      } else {
        commonTest(TAG_TEST_0600_001, data);
        getApplicationInfoOtherSuccess(TAG_TEST_0600_001, data);
      }
      done();
      console.log('------------------ ' + TAG_TEST_0600_001 + ' end -------------------');
    });

    /**
     * @tc.number: bundle_getApplicationInfo_test_0600_0012
     * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level 0
     */
    it(TAG_TEST_0600_002, 0, async function (done) {
      console.info(TAG_TEST_0600_002 + 'promise START');
      await Utils.sleep(SLEEP_TIME_1000);
      let errors;
      var startTime = await Utils.getNowTime();
      let data =
        await Bundle.getApplicationInfo(BUNDLE_NAME_OTHER, Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION,
          USER_ID_100)
          .catch((error) => {
            console.info(TAG_TEST_0600_002 + 'other bundleName UserId promise error is: ' + error);
            errors = error;
          });
      var endTime = Utils.getNowTime();
      Utils.getDurationTime(TAG_TEST_0600_002, startTime, endTime);
      console.info(TAG_TEST_0600_002 + ' other bundleName UserId promise errors is: ' + JSON.stringify(errors));
      console.info(TAG_TEST_0600_002 + ' other bundleName UserId promise data is: ' + JSON.stringify(data));
      if (1 === errors) {
        expect(errors).assertEqual(1);
      } else {
        commonTest(TAG_TEST_0600_002, data);
        getApplicationInfoOtherSuccess(TAG_TEST_0600_002, data);
      }
      done();
      console.log('------------------ ' + TAG_TEST_0600_002 + ' end -------------------');
    });

    /**
     * @tc.number: bundle_getApplicationInfo_test_0500_009
     * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level 0
     */
    it(TAG_TEST_0600_003, 0, async function (done) {
      console.info(TAG_TEST_0600_003 + 'promise START');
      await Utils.sleep(SLEEP_TIME_1000);
      let errors;
      var startTime = await Utils.getNowTime();
      let data = await Bundle.getApplicationInfo(BUNDLE_NAME, 0)
        .catch((error) => {
          console.info(TAG_TEST_0600_003 + 'noUserId promise error is: ' + error);
          errors = error;
        });
      var endTime = Utils.getNowTime();
      Utils.getDurationTime(TAG_TEST_0600_003, startTime, endTime);
      console.info(TAG_TEST_0600_003 + ' noUserId promise data is: ' + JSON.stringify(data));
      if (1 === errors) {
        expect(errors).assertEqual(1);
      } else {
        commonTest(TAG_TEST_0600_003, data);
        getApplicationInfoSuccess(TAG_TEST_0600_003, data);
      }
      done();
      console.log('------------------ ' + TAG_TEST_0600_003 + ' end -------------------');
    });

    /**
     * 打印单和expect个属性
     * @param msg log信息
     * @param data 数据源
     */
    function commonTest(msg, data) {
      console.log(msg + ' commonTest start  ' + JSON.stringify(data));
      console.log(msg + ' name : ' + data.name);
      console.log(msg + ' codePath : ' + data.codePath);
      console.log(msg + ' accessTokenId : ' + data.accessTokenId);
      console.log(msg + ' description : ' + data.description);
      console.log(msg + ' descriptionId : ' + data.descriptionId);
      console.log(msg + ' icon : ' + data.icon);
      console.log(msg + ' iconId : ' + data.iconId);
      console.log(msg + ' label : ' + data.label);
      console.log(msg + ' labelId : ' + data.labelId);
      console.log(msg + ' systemApp : ' + data.systemApp);
      console.log(msg + ' supportedModes : ' + data.supportedModes);
      console.log(msg + ' entryDir : ' + data.entryDir);
      console.log(msg + ' metaData : ' + data.metaData);
      console.log(msg + ' metadata : ' + data.metadata);
      console.log(msg + ' enabled : ' + data.enabled);
      console.log(msg + ' flags : ' + data.flags);
      console.log(msg + ' uid : ' + data.uid);
      console.log(msg + ' removable : ' + data.removable);
      console.log(msg + ' permissions length : ' + data.permissions.length);
      for (var j = 0; j < data.permissions.length; j++) {
        console.log('getApplicationInfo0001 data.permissions[' + j + '] : ' + data.permissions[j]);
      }
      console.log(msg + ' moduleSourceDirs length : ' + data.moduleSourceDirs.length);
      for (var i = 0; i < data.moduleSourceDirs.length; i++) {
        console.log('getApplicationInfo0001 data.moduleSourceDirs[' + i + '] : ' + data.moduleSourceDirs[i]);
      }
      console.log(msg + ' moduleInfos length : ' + data.moduleInfos.length);
      for (var k = 0; k < data.moduleInfos.length; k++) {
        console.log('getApplicationInfo0001 data.moduleInfos[' + k + '] : ' + data.moduleInfos[k].moduleName);
        console.log('getApplicationInfo0001 data.moduleInfos[' + k + '] : ' + data.moduleInfos[k].moduleSourceDir);
      }
      expectData(msg, data);
    }

    /**
     * expect属性
     * @param msg log信息
     * @param data 数据源
     */
    function expectData(msg, data) {
      expect(typeof (data)).assertEqual('object');
      expect(typeof (data.name)).assertEqual('string');
      expect(typeof (data.codePath)).assertEqual('string');
      expect(typeof (data.accessTokenId)).assertEqual('number');
      expect(typeof (data.description)).assertEqual('string');
      expect(typeof (data.descriptionId)).assertEqual('number');
      expect(typeof (data.icon)).assertEqual('string');
      expect(typeof (data.iconId)).assertEqual('number');
      expect(typeof (data.label)).assertEqual('string');
      expect(typeof (data.labelId)).assertEqual('number');
      expect(typeof (data.systemApp)).assertEqual('boolean')
      expect(typeof (data.supportedModes)).assertEqual('number');
      expect(typeof (data.entryDir)).assertEqual('string');
      expect(typeof (data.metaData)).assertEqual('object');
      expect(typeof (data.metadata)).assertEqual('object');
      expect(typeof (data.enabled)).assertEqual('boolean');
      expect(typeof (data.flags)).assertEqual('number');
      expect(typeof (data.uid)).assertEqual('number');
      expect(typeof (data.entityType)).assertEqual('string');
      expect(typeof (data.removable)).assertEqual('boolean');
      expect(Array.isArray(data.permissions)).assertEqual(true);
      expect(Array.isArray(data.moduleSourceDirs)).assertEqual(true);
      expect(Array.isArray(data.moduleInfos)).assertEqual(true);
    }

    /**
     * expect属性值
     * @param msg log信息
     * @param data 数据源
     */
    function getApplicationInfoSuccess(msg, data) {
      expect(data.name).assertEqual('com.open.harmony.packagemag');
      expect(data.codePath).assertEqual('/data/app/el1/bundle/public/com.open.harmony.packagemag');
      expect(data.description).assertEqual('$string:mainability_description');
      expect(data.descriptionId).assertEqual(16777217);
      expect(data.icon).assertEqual('$media:icon');
      expect(data.iconId).assertEqual(16777218);
      expect(data.label).assertEqual('$string:entry_MainAbility');
      expect(data.labelId).assertEqual(16777216);
      expect(data.systemApp).assertEqual(true);
      expect(data.supportedModes).assertEqual(0);
      expect(data.entryDir).assertEqual('/data/app/el1/bundle/public/com.open.harmony.packagemag' +
      '/com.open.harmony.packagemag');
      expect(data.enabled).assertEqual(true);
      expect(data.entityType).assertEqual('unspecified');
      expect(data.removable).assertEqual(true);
      expect(data.moduleInfos[0].moduleName).assertEqual('entry');
      expect(data.moduleInfos[0].moduleSourceDir).assertEqual('/data/app/el1/bundle/public/' +
      'com.open.harmony.packagemag/com.open.harmony.packagemag');
      expect(data.moduleSourceDirs[0]).assertEqual('/data/app/el1/bundle/public/' +
      'com.open.harmony.packagemag/com.open.harmony.packagemag');
      console.log(msg + ' end  ' + JSON.stringify(data));
    }

    /**
     * expect属性值
     * @param msg log信息
     * @param data 数据源
     */
    function getApplicationInfoFial(msg, data) {
      expect(data.name).assertEqual('');
      expect(data.codePath).assertEqual('');
      expect(data.description).assertEqual('');
      expect(data.descriptionId).assertEqual(0);
      expect(data.icon).assertEqual('');
      expect(data.iconId).assertEqual(0);
      expect(data.label).assertEqual('');
      expect(data.labelId).assertEqual(0);
      expect(data.systemApp).assertEqual(false);
      expect(data.supportedModes).assertEqual(0);
      expect(data.entryDir).assertEqual('');
      expect(data.enabled).assertEqual(false);
      expect(data.entityType).assertEqual('');
      expect(data.removable).assertEqual(true);
      console.log(msg + ' end  ' + JSON.stringify(data));
    }


    /**
     * expect属性值
     * @param msg log信息
     * @param data 数据源
     */
    function getApplicationInfoOtherSuccess(msg, data) {
      expect(data.name).assertEqual('com.ohos.acepackage');
      expect(data.codePath).assertEqual('/data/app/el1/bundle/public/com.ohos.acepackage');
      expect(data.description).assertEqual('$string:description_mainability');
      expect(data.descriptionId).assertEqual(16777216);
      expect(data.icon).assertEqual('$media:icon');
      expect(data.iconId).assertEqual(16777218);
      expect(data.label).assertEqual('$string:entry_MainAbility');
      expect(data.labelId).assertEqual(16777217);
      expect(data.systemApp).assertEqual(true);
      expect(data.supportedModes).assertEqual(0);
      expect(data.entryDir).assertEqual('/data/app/el1/bundle/public/com.ohos.acepackage' +
      '/com.ohos.acepackage');
      expect(data.enabled).assertEqual(true);
      expect(data.entityType).assertEqual('unspecified');
      expect(data.removable).assertEqual(true);
      expect(data.moduleInfos[0].moduleName).assertEqual('entry');
      expect(data.moduleInfos[0].moduleSourceDir).assertEqual('/data/app/el1/bundle/public/' +
      'com.ohos.acepackage/com.ohos.acepackage');
      expect(data.moduleSourceDirs[0]).assertEqual('/data/app/el1/bundle/public/' +
      'com.ohos.acepackage/com.ohos.acepackage');
      console.log(msg + ' end  ' + JSON.stringify(data));
    }
  });
}