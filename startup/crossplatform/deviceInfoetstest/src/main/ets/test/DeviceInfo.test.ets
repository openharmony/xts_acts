/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import deviceinfo from "@ohos.deviceInfo";

export default function DeviceInfoTest() {
  describe("DeviceInfoTest", function () {
    const MAX_CHARACTERS_NUM_ONE = 33;
    const MAX_CHARACTERS_NUM_TWO = 65;
    const MAX_CHARACTERS_NUM = 0;

    beforeAll(function () {
      console.info("beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.");
    });

    beforeEach(function () {
      console.info("beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.");
    });
    afterEach(function () {
      console.info("afterEach: Test case-level clearance conditions, which are executed after each test case is executed.");
    });
    afterAll(function () {
      console.info("afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed");
    });

    console.info("start################################start");

    /**
     * @tc.number    DEVICE_INFO_TEST_001
     * @tc.name      deviceInfoTest001
     * @tc.desc      Get a string representing the device type.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest001", 0, function () {
      console.info("device_info_test_001 start");
      let ret = false;
      let deviceTypeInfo = deviceinfo.deviceType;
      console.info("the value of the deviceType is :" + deviceTypeInfo);

      expect(deviceTypeInfo).assertInstanceOf("String");
      if (deviceTypeInfo != "" && deviceTypeInfo != null && deviceTypeInfo != undefined) {
        ret = true;
      }
      expect(ret).assertTrue();
      console.info("device_info_test_001 : end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_002
     * @tc.name     deviceInfoTest002
     * @tc.desc      Get the manufacture name represented by a string.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest002", 0, function () {
      console.info("device_info_test_002 start");

      let manufactureInfo = deviceinfo.manufacture;
      console.info("the value of the manufactureInfo is :" + manufactureInfo);
      expect(manufactureInfo).assertInstanceOf("String");
      if (manufactureInfo != "" && manufactureInfo != null && manufactureInfo != undefined) {
        let str = /[\w-\.\(\)]/g;
        let arr = manufactureInfo.match(str);
        let bufferstr = arr.join("");
        console.info("the value of the bufferstr is :" + bufferstr);
        expect(manufactureInfo).assertEqual(bufferstr);
      } else {
        console.info("the return value is null or incorrect.");
        expect(false).assertFalse();
      }

      console.info("device_info_test_002 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_003
     * @tc.name     deviceInfoTest003
     * @tc.desc      Get the device brand represented by a string and the return value is not null.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest003", 0, function () {
      console.info("testGetDeviceBrand01 start");

      let brandInfo = deviceinfo.brand;
      console.info("the value of the device brand is :" + brandInfo);

      expect(brandInfo).assertInstanceOf("String");
      if (brandInfo != "" && brandInfo != null && brandInfo != undefined) {
        let str = /[\w-\.\(\)]/g;
        let arr = brandInfo.match(str);
        let bufferstr = arr.join("");
        console.info("the value of the bufferstr is :" + bufferstr);
        expect(brandInfo).assertEqual(bufferstr);
      } else {
        console.info("the return value is null or incorrect.");
        expect(false).assertFalse();
      }

      console.info("testGetDeviceBrand01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_004
     * @tc.name     deviceInfoTest004
     * @tc.desc      Get the external product family name represented by a string and the return value is not null.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest004", 0, function () {
      console.info("testGetMarketName01 start");
      let ret = false;
      let marketNameInfo = deviceinfo.marketName;
      console.info("the value of the deviceinfo marketName is :" + marketNameInfo);

      expect(marketNameInfo).assertInstanceOf("String");
      if (marketNameInfo != "" && marketNameInfo != null && marketNameInfo != undefined) {
        ret = true;
      }
      expect(ret).assertTrue();
      console.info("testGetMarketName01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_005
     * @tc.name     deviceInfoTest005
     * @tc.desc      Get the product series represented by a string and the return value is not null.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest005", 0, function () {
      console.info("testGetProductSeries01 start");

      let productSeriesInfo = deviceinfo.productSeries;
      console.info("the value of the deviceinfo productSeries is :" + productSeriesInfo);

      expect(productSeriesInfo).assertInstanceOf("String");
      if (productSeriesInfo != "" && productSeriesInfo != null && productSeriesInfo != undefined) {
        let str = /[\w-\.\(\)\s:;~/]/g;
        let arr = productSeriesInfo.match(str);
        let bufferstr = arr.join("");
        console.info("the value of the bufferstr is :" + bufferstr);
        expect(productSeriesInfo).assertEqual(bufferstr);
      } else {
        console.info("the return value is null or incorrect.");
        expect(false).assertFalse();
      }

      console.info("testGetProductSeries01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_006
     * @tc.name     deviceInfoTest006
     * @tc.desc      Get the internal software sub-model represented by a string and the return value is not null.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest006", 0, function () {
      console.info("testGetProductModel01 start");
      let ret = false;
      let productModelInfo = deviceinfo.productModel;
      console.info("the value of the deviceinfo productModel is :" + productModelInfo);

      expect(productModelInfo).assertInstanceOf("String");
      if (productModelInfo != "" && productModelInfo != null && productModelInfo != undefined) {
        ret = true;
      }
      expect(ret).assertTrue();
      console.info("testGetProductModel01 : end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_007
     * @tc.name     deviceInfoTest007
     * @tc.desc      Get the internal software sub-model represented by a string and the return value is not null.
     * @tc.size      : MediumTest
     * @tc.type      : const
     * @tc.level     : Level 0
     */
    it("deviceInfoTest007", 0, function () {
      console.info("testGetSoftwareModel01 start");

      let softwareModelInfo = deviceinfo.softwareModel;
      console.info("the value of the deviceinfo softwareModel is :" + softwareModelInfo);

      expect(softwareModelInfo).assertInstanceOf("String");
      if (softwareModelInfo != "" && softwareModelInfo != null && softwareModelInfo != undefined) {
        let str = /[\w-\.\(\)\s]/g;
        let arr = softwareModelInfo.match(str);
        let bufferstr = arr.join("");
        console.info("the value of the bufferstr is :" + bufferstr);
        expect(softwareModelInfo).assertEqual(bufferstr);
      } else {
        console.info("the return value is null or incorrect.");
        expect(false).assertFalse();
      }

      console.info("testGetSoftwareModel01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_008
     * @tc.name     deviceInfoTest008
     * @tc.desc      Get the hardware version represented by a string and the return value is not null.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest008", 0, function () {
      console.info("testGetHardWareModel01 start");

      let hardwareModelInfo = deviceinfo.hardwareModel;
      console.info("the value of the deviceinfo hardwareModel is :" + hardwareModelInfo);

      expect(hardwareModelInfo).assertInstanceOf("String");
      if (hardwareModelInfo != "" && hardwareModelInfo != null && hardwareModelInfo != undefined) {
        let str = /[\w-\.\(\)]/g;
        let arr = hardwareModelInfo.match(str);
        let bufferstr = arr.join("");
        console.info("the value of the bufferstr is :" + bufferstr);
        expect(hardwareModelInfo).assertEqual(bufferstr);
      } else {
        console.info("the return value is null or incorrect.");
        expect(false).assertFalse();
      }

      console.info("testGetHardWareModel01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_009
     * @tc.name     deviceInfoTest009
     * @tc.desc      Get the bootloader version number represented by a string and the return value is not null.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest009", 0, function () {
      console.info("testGetBootLoaderVersion01 start");

      let bootloaderVersionInfo = deviceinfo.bootloaderVersion;
      console.info("the value of the deviceinfo bootloaderVersion is :" + bootloaderVersionInfo);

      expect(bootloaderVersionInfo).assertInstanceOf("String");
      if (bootloaderVersionInfo != "" && bootloaderVersionInfo != null && bootloaderVersionInfo != undefined) {
        let str = /[\w-\.\(\)]/g;
        let arr = bootloaderVersionInfo.match(str);
        let bufferstr = arr.join("");
        console.info("the value of the bufferstr is :" + bufferstr);
        expect(bootloaderVersionInfo).assertEqual(bufferstr);
      } else {
        console.info("the return value is null or incorrect.");
        expect(false).assertFalse();
      }

      console.info("testGetBootLoaderVersion01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_010
     * @tc.name     deviceInfoTest010
     * @tc.desc      Get the instruction set supported by the system and the return value is not null.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest010", 0, function () {
      console.info("testGetabiList01 start");

      let abiListInfo = deviceinfo.abiList;
      console.info("the value of the deviceinfo abiList is :" + abiListInfo);

      expect(abiListInfo).assertInstanceOf("String");
      if (abiListInfo != "" && abiListInfo != null && abiListInfo != undefined) {
        let str = /[\w-\.\(\)\,]/g;
        let arr = abiListInfo.match(str);
        let bufferstr = arr.join("");
        console.info("the value of the bufferstr is :" + bufferstr);
        expect(abiListInfo).assertEqual(bufferstr);
      } else {
        console.info("the return value is null or incorrect.");
        expect(false).assertFalse();
      }

      console.info("testGetabiList01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_011
     * @tc.name     deviceInfoTest011
     * @tc.desc      Get the security patch level represented by a string and the return value is not null.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest011", 0, function () {
      console.info("testGetSecurityPatchTag01 start");

      let securityPatchTagInfo = deviceinfo.securityPatchTag;
      console.info("the value of the deviceinfo securityPatchTag is :" + securityPatchTagInfo);

      expect(securityPatchTagInfo).assertInstanceOf("String");
      if (securityPatchTagInfo != "" && securityPatchTagInfo != null && securityPatchTagInfo != undefined) {
        let str = /[\w\/\.\(\)]/g;
        let arr = securityPatchTagInfo.match(str);
        let bufferstr = arr.join("");
        console.info("the value of the bufferstr is :" + bufferstr);
        expect(securityPatchTagInfo).assertEqual(bufferstr);
      } else {
        console.info("the return value is null or incorrect.");
        expect(false).assertFalse();
      }

      console.info("testGetSecurityPatchTag01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_012
     * @tc.name     deviceInfoTest012
     * @tc.desc      Get the product version represented by a string and the return value is not null.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest012", 0, function () {
      console.info("testGetDisplayVersion01 start");
      let ret = false;
      let displayVersionInfo = deviceinfo.displayVersion;
      console.info("the value of the deviceinfo displayVersion is :" + displayVersionInfo);

      expect(displayVersionInfo).assertInstanceOf("String");
      if (displayVersionInfo != "" && displayVersionInfo != null && displayVersionInfo != undefined) {
        ret = true;
      }
      expect(ret).assertTrue();
      console.info("testGetDisplayVersion01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_013
     * @tc.name     deviceInfoTest013
     * @tc.desc      Get the incremental version represented by a string and the return value is not null.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest013", 0, function () {
      console.info("testGetIncrementalVersion01 start");

      let incrementalVersionInfo = deviceinfo.incrementalVersion;
      console.info("the value of the deviceinfo incrementalVersion is :" + incrementalVersionInfo);

      expect(incrementalVersionInfo).assertInstanceOf("String");
      if (incrementalVersionInfo != "" && incrementalVersionInfo != null && incrementalVersionInfo != undefined) {
        let str = /[\w-\.\(\)]/g;
        let arr = incrementalVersionInfo.match(str);
        let bufferstr = arr.join("");
        console.info("the value of the bufferstr is :" + bufferstr);
        expect(incrementalVersionInfo).assertEqual(bufferstr);
      } else {
        console.info("the return value is null or incorrect.");
        expect(false).assertFalse();
      }

      console.info("testGetIncrementalVersion01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_014
     * @tc.name     deviceInfoTest014
     * @tc.desc      Get the OS release type represented by a string and the return value is not null.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest014", 0, function () {
      console.info("testGetOSReleaserType01 start");

      let osReleaseTypeInfo = deviceinfo.osReleaseType;
      console.info("the value of the deviceinfo osReleaseType is :" + osReleaseTypeInfo);

      expect(osReleaseTypeInfo).assertInstanceOf("String");
      if (osReleaseTypeInfo != "" && osReleaseTypeInfo != null && osReleaseTypeInfo != undefined) {
        let str = /[\w-\.\(\)]/g;
        let arr = osReleaseTypeInfo.match(str);
        let bufferstr = arr.join("");
        console.info("the value of the bufferstr is :" + bufferstr);
        expect(osReleaseTypeInfo).assertEqual(bufferstr);
      } else {
        console.info("the return value is null or incorrect.");
        expect(false).assertFalse();
      }

      console.info("testGetOSReleaserType01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_015
     * @tc.name     deviceInfoTest015
     * @tc.desc      Get the operating system full name and the return value is not null.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest015", 0, function () {
      console.info("testGetOSFullName01 start");

      let osFullNameInfo = deviceinfo.osFullName;
      console.info("the value of the deviceinfo osFullName is :" + osFullNameInfo);

      expect(osFullNameInfo).assertInstanceOf("String");
      if (osFullNameInfo != "" && osFullNameInfo != null && osFullNameInfo != undefined) {
        let str = /[\w-\.\(\)\s]/g;
        let arr = osFullNameInfo.match(str);
        let bufferstr = arr.join("");
        console.info("the value of the bufferstr is :" + bufferstr);
        expect(osFullNameInfo).assertEqual(bufferstr);
      } else {
        console.info("the return value is null or incorrect.");
        expect(false).assertFalse();
      }

      console.info("testGetOSFullName01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_016
     * @tc.name     deviceInfoTest016
     * @tc.desc      Get the major (M) version number which the return value is greater than 0.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest016", 0, function () {
      console.info("testGetMajorVersion01 start");

      let majorVersionInfo = deviceinfo.majorVersion;
      console.info("the value of the deviceinfo majorVersion is :" + majorVersionInfo);

      expect(majorVersionInfo).assertInstanceOf("Number");
      if (majorVersionInfo >= 1 && majorVersionInfo <= 99) {
        let str = /[\w-\.\(\)]/g;
        let arr = majorVersionInfo.toString().match(str);
        let substr = arr.join("");
        let numstr = parseInt(substr);
        console.info("the value of the bufferstr is :" + numstr);
        expect(majorVersionInfo).assertEqual(numstr);
      } else {
        console.info("the return value is null or incorrect.");
        expect(false).assertFalse();
      }

      console.info("testGetMajorVersion01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_017
     * @tc.name     deviceInfoTest017
     * @tc.desc      Get the senior version number and the return value is greater than 0.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest017", 0, function () {
      console.info("testGetSeniorVersion01 start");

      let seniorVersionInfo = deviceinfo.seniorVersion;
      console.info("the value of the deviceinfo seniorVersion is :" + seniorVersionInfo);

      expect(seniorVersionInfo).assertInstanceOf("Number");
      if (seniorVersionInfo >= 0 && seniorVersionInfo <= 99) {
        let str = /[\w-\.\(\)]/g;
        let arr = seniorVersionInfo.toString().match(str);
        let substr = arr.join("");
        let numstr = parseInt(substr);
        console.info("the value of the bufferstr is :" + numstr);
        expect(seniorVersionInfo).assertEqual(numstr);
      } else {
        console.info("the return value is null or incorrect.");
        expect(false).assertFalse();
      }

      console.info("testGetSeniorVersion01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_018
     * @tc.name     deviceInfoTest018
     * @tc.desc      Get the feature (F) version number which the return value is greater than 0.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest018", 0, function () {
      console.info("testGetFeatureVersion01 start");

      let featureVersionInfo = deviceinfo.featureVersion;
      console.info("the value of the deviceinfo featureVersion is :" + featureVersionInfo);

      expect(featureVersionInfo).assertInstanceOf("Number");
      if ((featureVersionInfo >= 1 && featureVersionInfo <= 99) || featureVersionInfo == 0) {
        let str = /[\w-\.\(\)]/g;
        let arr = featureVersionInfo.toString().match(str);
        let substr = arr.join("");
        let numstr = parseInt(substr);
        console.info("the value of the bufferstr is :" + numstr);
        expect(featureVersionInfo).assertEqual(numstr);
      } else {
        console.info("the return value is null or incorrect.");
        expect(false).assertFalse();
      }

      console.info("testGetFeatureVersion01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_019
     * @tc.name     deviceInfoTest019
     * @tc.desc      Get the build (B) version number which the return value is greater than 0.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest019", 0, function () {
      console.info("testGetBuildVersion01 start");

      let buildVersionInfo = deviceinfo.buildVersion;
      console.info("the value of the deviceinfo buildVersion is :" + buildVersionInfo);

      expect(buildVersionInfo).assertInstanceOf("Number");
      if (buildVersionInfo == 0 || (buildVersionInfo >= 1 && buildVersionInfo <= 999)) {
        let str = /[\w-\.\(\)]/g;
        let arr = buildVersionInfo.toString().match(str);
        let substr = arr.join("");
        let numstr = parseInt(substr);
        console.info("the value of the bufferstr is :" + numstr);
        expect(buildVersionInfo).assertEqual(numstr);
      } else {
        console.info("the return value is null or incorrect.");
        expect(false).assertFalse();
      }

      console.info("testGetBuildVersion01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_020
     * @tc.name     deviceInfoTest020
     * @tc.desc    Get the API version number, which return value type is number and return value is greater than 0.
     * @tc.size    : MediumTest
     * @tc.type    : Constant
     * @tc.level   : Level 0
     */
    it("deviceInfoTest020", 0, function () {
      console.info("testGetSdkApiVersion01 start");
      let ret = false;
      let sdkApiVersionInfo = deviceinfo.sdkApiVersion;
      console.info("the value of the deviceinfo sdkApiVersion is :" + sdkApiVersionInfo);

      expect(sdkApiVersionInfo).assertInstanceOf("Number");
      if (sdkApiVersionInfo >= 0) {
        ret = true;
      }
      expect(ret).assertTrue();

      let str = /[\w-\.\(\)]/g;
      let arr = sdkApiVersionInfo.toString().match(str);
      let substr = arr.join("");
      let numstr = parseInt(substr);
      console.info("the value of the bufferstr is :" + numstr);
      expect(sdkApiVersionInfo).assertEqual(numstr);

      console.info("testGetSdkApiVersion01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_021
     * @tc.name     deviceInfoTest021
     * @tc.desc      Get the first API version number which the return value is greater than 0.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest021", 0, function () {
      console.info("testGetFirstApiVersion01 start");
      let ret = true;
      let firstApiVersionInfo = deviceinfo.firstApiVersion;
      console.info("the value of the deviceinfo firstApiVersion is :" + firstApiVersionInfo);

      expect(firstApiVersionInfo).assertInstanceOf("Number");
      if (firstApiVersionInfo >= 0) {
        ret = true;
      }
      expect(ret).assertTrue();

      let str = /[\w-\.\(\)]/g;
      let arr = firstApiVersionInfo.toString().match(str);
      let substr = arr.join("");
      let numstr = parseInt(substr);
      console.info("the value of the bufferstr is :" + numstr);
      expect(firstApiVersionInfo).assertEqual(numstr);

      console.info("testGetFirstApiVersion01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_022
     * @tc.name     deviceInfoTest022
     * @tc.desc      Get the version ID number by a string which the return value is not null.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest022", 0, function () {
      console.info("testGetVersionId01 start");
      let ret = false;
      let versionIdInfo = deviceinfo.versionId;
      console.info("the value of the deviceinfo versionId is :" + versionIdInfo);

      expect(versionIdInfo).assertInstanceOf("String");
      if (versionIdInfo != "" && versionIdInfo != null && versionIdInfo != undefined) {
        ret = true;
      }
      expect(ret).assertTrue();
      console.info("testGetVersionId01 end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_023
     * @tc.name     deviceInfoTest023
     * @tc.desc      Get the different build types of the same baseline code which the return value is not null.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest023", 0, function () {
      console.info("testGetBuildType01 start");

      let buildTypeInfo = deviceinfo.buildType;
      console.info("the value of the deviceinfo buildType is :" + buildTypeInfo);

      expect(buildTypeInfo).assertInstanceOf("String");
      if (buildTypeInfo != "" && buildTypeInfo != null && buildTypeInfo != undefined) {
        let str = /[\w-\.\(\)\:]/g;
        let arr = buildTypeInfo.match(str);
        let bufferstr = arr.join("");
        console.info("the value of the bufferstr is :" + bufferstr);
        expect(buildTypeInfo).assertEqual(bufferstr);
      } else {
        console.info("the return value is null or incorrect.");
        expect(false).assertFalse();
      }

      console.info("testGetBuildType01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_024
     * @tc.name     deviceInfoTest024
     * @tc.desc      Get the different build user by a string which the return value is not null.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest024", 0, function () {
      console.info("testGetBuildUser01 start");
      let ret = true;
      let buildUserInfo = deviceinfo.buildUser;
      console.info("the value of the deviceinfo buildUser is :" + buildUserInfo);

      expect(buildUserInfo).assertInstanceOf("String");
      if (buildUserInfo != "" && buildUserInfo != null && buildUserInfo != undefined) {
        ret = true;
      }
      expect(ret).assertTrue();
      console.info("testGetBuildUser01 ：end");
    });

    /**
     * @tc.number   DEVICE_INFO_TEST_025
     * @tc.name    deviceInfoTest025
     * @tc.desc    Get the build host of the same baseline code by a string and the return value is not null.
     * @tc.size    : MediumTest
     * @tc.type    : Constant
     * @tc.level   : Level 0
     */
    it("deviceInfoTest025", 0, function () {
      console.info("testGetBuildHost01 start");
      let ret = false;
      let buildHostInfo = deviceinfo.buildHost;
      console.info("the value of the deviceinfo buildHost is :" + buildHostInfo);

      expect(buildHostInfo).assertInstanceOf("String");
      if (buildHostInfo != "" && buildHostInfo != null && buildHostInfo != undefined) {
        ret = true;
      }
      expect(ret).assertTrue();
      console.info("testGetBuildHost01 ：end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_026
     * @tc.name     deviceInfoTest026
     * @tc.desc      Get the version build time by a string and the return value is not null.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest026", 0, function () {
      console.info("testGetBuildTime01 start");
      let ret = false;
      let buildTimeInfo = deviceinfo.buildTime;
      console.info("the value of the deviceinfo buildTime is :" + buildTimeInfo);

      expect(buildTimeInfo).assertInstanceOf("String");
      if (buildTimeInfo != "" && buildTimeInfo != null && buildTimeInfo != undefined) {
        ret = true;
      }
      expect(ret).assertTrue();
      console.info("testGetBuildTime01 : end");
    });

    /**
     * @tc.number    DEVICE_INFO_TEST_027
     * @tc.name     deviceInfoTest027
     * @tc.desc      Get the version hash by a string and the return value is not null.
     * @tc.size      : MediumTest
     * @tc.type      : Constant
     * @tc.level     : Level 0
     */
    it("deviceInfoTest027", 0, function () {
      console.info("testGetBuildRootHash01 start");

      let buildRootHashInfo = deviceinfo.buildRootHash;
      console.info("the value of the deviceinfo buildRootHash is :" + buildRootHashInfo);

      expect(buildRootHashInfo).assertInstanceOf("String");
      if (buildRootHashInfo != "" && buildRootHashInfo != null && buildRootHashInfo != undefined) {
        let str = /[\w-\.\(\)]/g;
        let arr = buildRootHashInfo.match(str);
        let bufferstr = arr.join("");
        console.info("the value of the bufferstr is :" + bufferstr);
        expect(buildRootHashInfo).assertEqual(bufferstr);
      } else {
        console.info("the return value is null or incorrect.");
        expect(false).assertFalse();
      }

      console.info("testGetBuildRootHash01 ：end");
    });
  });
}
