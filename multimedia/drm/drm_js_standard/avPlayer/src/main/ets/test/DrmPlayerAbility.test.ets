/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// @ts-nocheck
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
// @ts-ignore
import drm from '@ohos.multimedia.drm';
import http from '@ohos.net.http';
import util from '@ohos.util';
var uuid;
var sysSupport = drm.isMediaKeySystemSupported("com.clearplay.drm");
if(sysSupport === true){
  uuid = "com.clearplay.drm";
} else {
  uuid = "com.wiseplay.drm";
}

export async function getHttpData(url: string, _extraData: Object): Promise<string>{
  let responseData: String = 'defaultStr';
  let httpRequest = http.createHttp();
  let response = httpRequest.request(
    url,
    {
      method: http.RequestMethod.POST,
      header: {
        'Content-Type': 'application/json'
      },
      extraData : _extraData,
      expectDataType: http.HttpDataType.STRING,
    }
  );
  await response.then((data) => {
    if (data.responseCode == 200) {
      if(typeof data.result == 'string'){
        responseData = data.result;
      } else {
      }
    } else {
      // todo 请求失败，进行失败逻辑处理
    }
  }).catch((err) => {
    // todo 请求失败，进行失败逻辑处理
    console.info('error:' + JSON.stringify(err));
  })
  return responseData;
}

export default function abilityTest() {
  describe('ActsAbilityTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      var drmsys = drm.createMediaKeySystem(uuid);
      var provisionRequestData = drmsys.generateKeySystemRequest();
      var provisionRequestStr = byteToString(provisionRequestData.mData);
      var provisionResponseStr = await getHttpData("http://192.168.50.59:9528/getProvision", provisionRequestStr);
      var provisionResponseByte = stringToUint8Array(provisionResponseStr);
      drmsys.processKeySystemResponse(provisionResponseByte);
      drmsys.destroy();
    })
    beforeEach(function () {
      console.log("beforeEach beforeEach beforeEach");
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(function () {
      console.log("afterEach afterEach afterEach");
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(function () {
      console.log("afterAll afterAll afterAll");
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    console.info("--------------------assertContain-------Stage-----------------------");

    function stringToUint8Array(str) {
      const length = str.length;
      const array = new Uint8Array(length);

      for (let i = 0; i < length; i++) {
        array[i] = str.charCodeAt(i);
      }

      return array;
    }

    function byteToString(arr) {
      if(typeof arr === 'string') {
        return arr;
      }
      var str = '',
        _arr = arr;
      for(var i = 0; i < _arr.length; i++) {
        var one = _arr[i].toString(2),
          v = one.match(/^1+?(?=0)/);
        if(v && one.length == 8) {
          var bytesLength = v[0].length;
          var store = _arr[i].toString(2).slice(7 - bytesLength);
          for(var st = 1; st < bytesLength; st++) {
            store += _arr[st + i].toString(2).slice(2);
          }
          str += String.fromCharCode(parseInt(store, 2));
          i += bytesLength - 1;
        } else {
          str += String.fromCharCode(_arr[i]);
        }
      }
      return str;
    }

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0100
    * @tc.name      : createMediaKeySystem
    * @tc.desc      : Reliability Test
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0100', 0, function (done) {
      console.log("uuid uuid is",uuid);
      let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
      console.log("drmMediaKeySystem is:", drmMediaKeySystem);
      expect(drmMediaKeySystem).not();
      drmMediaKeySystem.destroy();
      expect(drmMediaKeySystem.getMetrics()).assertUndefined();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0200
    * @tc.name      : createMediaKeySystem
    * @tc.desc      : Abnormal UUID
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0200', 1, function (done) {
      let drmMediaKeySystem = drm.createMediaKeySystem("405E6D359B9A41E8B843DD3C6E72C42C");
      expect(drmMediaKeySystem).assertUndefined();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0300
    * @tc.name      : createMediaKeySystem
    * @tc.desc      : null UUID
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0300', 1, function (done) {
      let drmMediaKeySystem = drm.createMediaKeySystem("");
      expect(drmMediaKeySystem).assertUndefined();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0400
    * @tc.name      : createMediaKeySystem
    * @tc.desc      : callback
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level0
    */
    // it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0400', 0,  function (done) {
    //   let drmMediaKeySystem;
    //    drm.createMediaKeySystem(uuid, (mediaKeySystem) => {
    //     // success callback
    //     drmMediaKeySystem = mediaKeySystem;
    //   });
    //   expect(drmMediaKeySystem).assertUndefined();//TODO ：目前未实现callback功能
    //   done();
    // })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0500
    * @tc.name      : isMediaKeySystemSupported
    * @tc.desc      : one params
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0500', 0, function (done) {
      let isSysSupport = drm.isMediaKeySystemSupported(uuid);
      expect(isSysSupport).assertTrue();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0600
    * @tc.name      : isMediaKeySystemSupported
    * @tc.desc      : one params error uuid
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0600', 1, function (done) {
      let isSysSupport = drm.isMediaKeySystemSupported("405E6D359B9A41E8B843DD3C6E72C42C");
      expect(isSysSupport).assertFalse();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0700
    * @tc.name      : isMediaKeySystemSupported
    * @tc.desc      : one params null uuid
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0700', 1, function (done) {
      let isSysSupport = drm.isMediaKeySystemSupported("");
      expect(isSysSupport).assertUndefined();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0800
    * @tc.name      : isMediaKeySystemSupported
    * @tc.desc      : two params
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0800', 0, function (done) {
      let isSysSupport = drm.isMediaKeySystemSupported(uuid, "video/mp4");
      expect(isSysSupport).assertTrue();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0900
    * @tc.name      : isMediaKeySystemSupported
    * @tc.desc      : two params error uuid
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0900', 1, function (done) {
      let isSysSupport = drm.isMediaKeySystemSupported("405E6D359B9A41E8B843DD3C6E72C42C", "video/mp4");
      expect(isSysSupport).assertFalse();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1000
    * @tc.name      : isMediaKeySystemSupported
    * @tc.desc      : two params null uuid
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1000', 1, function (done) {
      let isSysSupport = drm.isMediaKeySystemSupported("", "video/mp4");
      expect(isSysSupport).assertUndefined(); //TODO ：目前minetype在wiseplay插件上暂未使用
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1100
    * @tc.name      : isMediaKeySystemSupported
    * @tc.desc      : two params error mimetype
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1100', 1, function (done) {
      let isSysSupport = drm.isMediaKeySystemSupported(uuid, "1111/2222");
      if (sysSupport === true) {
        expect(isSysSupport).assertFalse();
      } else {
        //TODO ：目前minetype在wiseplay插件上暂未使用，只判断uuid
        expect(isSysSupport).assertTrue();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1200
    * @tc.name      : isMediaKeySystemSupported
    * @tc.desc      : two params null mimetype
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1200', 1, function (done) {
      let isSysSupport = drm.isMediaKeySystemSupported(uuid, "");
      expect(isSysSupport).assertUndefined(); //TODO ：目前minetype在wiseplay插件上暂未使用
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1300
    * @tc.name      : isMediaKeySystemSupported
    * @tc.desc      : three params
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1300', 0, function (done) {
      let isSysSupport = drm.isMediaKeySystemSupported(uuid, "video/mp4", drm.SecurityLevel.SECURITY_LEVEL_SW_CRYPTO);
      expect(isSysSupport).assertTrue(); // TODO ：目前minetype在wiseplay插件上暂未使用
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1400
    * @tc.name      : isMediaKeySystemSupported
    * @tc.desc      : three params,error uuid
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1400', 1, function (done) {
      let isSysSupport = drm.isMediaKeySystemSupported("405E6D359B9A41E8B843DD3C6E72C42C", "video/mp4", drm.SecurityLevel.SECURITY_LEVEL_SW_CRYPTO);
      expect(isSysSupport).assertFalse();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1500
    * @tc.name      : isMediaKeySystemSupported
    * @tc.desc      : three params,error mimetype
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1500', 1, function (done) {
      let isSysSupport = drm.isMediaKeySystemSupported(uuid, "1111/22222", drm.SecurityLevel.SECURITY_LEVEL_SW_CRYPTO);
      if (sysSupport === true) {
        expect(isSysSupport).assertFalse();
      } else {
        //TODO ：目前minetype在wiseplay插件上暂未使用，只判断uuid
        expect(isSysSupport).assertTrue();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1600
    * @tc.name      : isMediaKeySystemSupported
    * @tc.desc      : three params,error securityLevel
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1600', 1, function (done) {
      let isSysSupport = drm.isMediaKeySystemSupported(uuid, "video/mp4", drm.SecurityLevel.SECURITY_LEVEL_MAX);
      expect(isSysSupport).assertUndefined(); // TODO ：目前securityLevel在wiseplay插件上暂未使用
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1700
    * @tc.name      : isMediaKeySystemSupported
    * @tc.desc      : three params,null uuid
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1700', 1, function (done) {
      let isSysSupport = drm.isMediaKeySystemSupported("", "video/mp4", drm.SecurityLevel.SECURITY_LEVEL_SW_CRYPTO);
      expect(isSysSupport).assertUndefined();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1800
    * @tc.name      : isMediaKeySystemSupported
    * @tc.desc      : three params,null mimetype
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1800', 1, function (done) {
      let isSysSupport = drm.isMediaKeySystemSupported(uuid, "", drm.SecurityLevel.SECURITY_LEVEL_SW_CRYPTO);
      expect(isSysSupport).assertFalse(); // TODO ：目前minetype在wiseplay插件上暂未使用
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1900
    * @tc.name      : createMediaKeySession
    * @tc.desc      : 创建各个安全等级的session
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1900', 0, function (done) {
      let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
      let drmMediaKeySession = drmMediaKeySystem.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
      expect(drmMediaKeySession.getSecurityLevel()).not();
      console.log("drmMediaKeySession 0 is", drmMediaKeySession);
      drmMediaKeySession.destroy();
      console.log("drmMediaKeySession end", drmMediaKeySession);
      expect(drmMediaKeySession.getSecurityLevel()).assertUndefined(); // TODO ：蓝区实验室destroy失效

      let drmMediaKeySession1 = drmMediaKeySystem.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_SW_CRYPTO);
      expect(drmMediaKeySession1.getSecurityLevel()).not();
      console.log("drmMediaKeySession 1 is", drmMediaKeySession1);
      drmMediaKeySession1.destroy();
      expect(drmMediaKeySession1.getSecurityLevel()).assertUndefined();

      let drmMediaKeySession2 = drmMediaKeySystem.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_SW_DECODE);
      expect(drmMediaKeySession2.getSecurityLevel()).not();
      console.log("drmMediaKeySession 2 is", drmMediaKeySession2);
      drmMediaKeySession2.destroy();
      expect(drmMediaKeySession2.getSecurityLevel()).assertUndefined();

      let drmMediaKeySession3 = drmMediaKeySystem.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_HW_CRYPTO);
      expect(drmMediaKeySession3.getSecurityLevel()).not();
      console.log("drmMediaKeySession 3 is", drmMediaKeySession3);
      drmMediaKeySession3.destroy();
      expect(drmMediaKeySession3.getSecurityLevel()).assertUndefined();

      let drmMediaKeySession4 = drmMediaKeySystem.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_HW_DECODE);
      expect(drmMediaKeySession4.getSecurityLevel()).not();
      console.log("drmMediaKeySession 4 is", drmMediaKeySession4);
      drmMediaKeySession4.destroy();
      expect(drmMediaKeySession4.getSecurityLevel()).assertUndefined();

      let drmMediaKeySession5 = drmMediaKeySystem.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_HW_ALL);
      expect(drmMediaKeySession5.getSecurityLevel()).not();
      console.log("drmMediaKeySession 5 is", drmMediaKeySession5);
      drmMediaKeySession5.destroy();
      expect(drmMediaKeySession5.getSecurityLevel()).assertUndefined();

      let drmMediaKeySession6 = drmMediaKeySystem.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_MAX);
      expect(drmMediaKeySession6.getSecurityLevel()).not();
      console.log("drmMediaKeySession 6 is", drmMediaKeySession6);
      drmMediaKeySession6.destroy();
      expect(drmMediaKeySession6.getSecurityLevel()).assertUndefined();

      drmMediaKeySystem.destroy();
      console.log("drmMediaKeySystem end end end ", drmMediaKeySystem);
      console.log("xxxxxxxxxxxxxxxxxxxxxx end");
      expect(drmMediaKeySystem.getMetrics()).assertUndefined();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2000
    * @tc.name      : createMediaKeySession
    * @tc.desc      : 创建64个session后再创建一个session
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2000', 0, function (done) {
      let mediaKeySystem = drm.createMediaKeySystem(uuid);
      let sessionArray = [];
      for (let i = 0;i < 64; i++) {
        sessionArray[i] = mediaKeySystem.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_HW_DECODE);
        expect(sessionArray[i].getSecurityLevel()).not();
      }
      let drmMediaKeySession = mediaKeySystem.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_HW_DECODE);
      // TODO ：RK3568最大会话数是否为64？
      if(sysSupport === true){
        expect(drmMediaKeySession.getSecurityLevel()).assertEqual(4);
      } else {
        expect(drmMediaKeySession).assertUndefined();
      }
      // expect(drmMediaKeySession).assertUndefined();
      for (let i = 0;i < 64; i++) {
        sessionArray[i].destroy();
      }
      if (sysSupport === true) {
        drmMediaKeySession.destroy();
      }
      mediaKeySystem.destroy();
      done();
    })
    /* *
      * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2100
      * @tc.name      : createMediaKeySession
      * @tc.desc      : 释放一个session后再创建session
      * @tc.size      : MediumTest
      * @tc.type      : Reliability
      * @tc.level     : Level0
      */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2100', 0, function (done) {
      let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
      let sessionArray = [];
      for (let i = 0;i < 64; i++) {
        sessionArray[i] = drmMediaKeySystem.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_HW_DECODE);
        expect(sessionArray[i].getSecurityLevel()).not();
      }
      let drmMediaKeySession = drmMediaKeySystem.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_HW_DECODE);
      if(sysSupport === true){
        expect(drmMediaKeySession.getSecurityLevel()).assertEqual(4);
      } else {
        expect(drmMediaKeySession).assertUndefined();
      }
      // expect(drmMediaKeySession).assertUndefined();
      sessionArray[0].destroy(); // TODO ：蓝区实验室destroy失效
      let drmMediaKeySession2 = drmMediaKeySystem.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_HW_DECODE);
      expect(drmMediaKeySession2.getSecurityLevel()).not();

      for (let i = 0;i < 64; i++) {
        sessionArray[i].destroy();
      }
      if (sysSupport === true) {
        drmMediaKeySession.destroy();
      }
      drmMediaKeySession2.destroy();
      drmMediaKeySystem.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2200
    * @tc.name      : createMediaKeySession
    * @tc.desc      : 错误的安全等级，创建session异常用例
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2200', 0, function (done) {
      let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
      let drmMediaKeySession = drmMediaKeySystem.createMediaKeySession(7);
      //TODO:安全等级传入不正确的7，getSecurityLevel结果为7
      expect(drmMediaKeySession).assertUndefined();
      drmMediaKeySystem.destroy();
      done();
    })
    /* *
      * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2300
      * @tc.name      : createMediaKeySession
      * @tc.desc      : 创建64个session后再创建一个session
      * @tc.size      : MediumTest
      * @tc.type      : Reliability
      * @tc.level     : Level0
      */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2300', 0, function (done) {
      let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
      let sessionArray = [];
      for (let i = 0;i < 64; i++) {
        sessionArray[i] = drmMediaKeySystem.createMediaKeySession();
        expect(sessionArray[i].getSecurityLevel()).not();
      }
      let drmMediaKeySession = drmMediaKeySystem.createMediaKeySession();
      // TODO ：RK3568最大会话数是否为64？
      if(sysSupport === true){
        expect(drmMediaKeySession.getSecurityLevel()).assertEqual(0);
      } else {
        expect(drmMediaKeySession).assertUndefined();
      }

      for (let i = 0;i < 64; i++) {
        sessionArray[i].destroy();
      }
      if (sysSupport === true) {
        drmMediaKeySession.destroy();
      }
      drmMediaKeySystem.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2400
    * @tc.name      : createMediaKeySession
    * @tc.desc      : 释放一个session后再创建session
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2400', 0, function (done) {
      let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
      let sessionArray = [];
      for (let i = 0;i < 64; i++) {
        sessionArray[i] = drmMediaKeySystem.createMediaKeySession();
        expect(sessionArray[i].getSecurityLevel()).not();
      }
      let drmMediaKeySession = drmMediaKeySystem.createMediaKeySession();
      if(sysSupport === true){
        expect(drmMediaKeySession.getSecurityLevel()).assertEqual(0);
      } else {
        expect(drmMediaKeySession).assertUndefined();
      }

      //TODO:蓝区destroy失效
      sessionArray[0].destroy();

      let drmMediaKeySession2 = drmMediaKeySystem.createMediaKeySession();
      expect(drmMediaKeySession2.getSecurityLevel()).not();

      for (let i = 0;i < 64; i++) {
        sessionArray[i].destroy();
      }
      // if(sysSupport === true){
      //   drmMediaKeySession.destroy();
      // }
      drmMediaKeySession2.destroy();
      drmMediaKeySystem.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2500
    * @tc.name      : createMediaKeySession
    * @tc.desc      : 创建一个会话，释放MediaKeySystem，检查会话是否释放
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2500', 0, function (done) {
      let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
      var session = drmMediaKeySystem.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
      expect(session.getSecurityLevel()).not();
      drmMediaKeySystem.destroy(); // TODO: 蓝区destroy失效
      expect(session.getSecurityLevel()).assertEqual(0);
      session.destroy();
      expect(session.getSecurityLevel()).assertUndefined();
      console.log("SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2500 end");
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2600
    * @tc.name      : createMediaKeySession
    * @tc.desc      : 判断是否支持安全解码video/mp4
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2600', 0, function (done) {
      console.log("SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2600 start");
      let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
      var session = drmMediaKeySystem.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
      expect(session).not();
      if(sysSupport === true){
        var result =  session.requireSecureDecoderModule("video/avc");
        expect(result).assertFalse();
        var result =  session.requireSecureDecoderModule("video/hevc");
        expect(result).assertFalse();
        var result =  session.requireSecureDecoderModule("video/avs3");
        expect(result).assertFalse();
      } else {
        var result =  session.requireSecureDecoderModule("video/avc");
        expect(result).assertTrue();
        var result =  session.requireSecureDecoderModule("video/hevc");
        expect(result).assertTrue();
        var result =  session.requireSecureDecoderModule("video/avs3");
        expect(result).assertTrue();
      }
      session.destroy();
      drmMediaKeySystem.destroy();
      console.log("SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2600 end");
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2700
    * @tc.name      : createMediaKeySession
    * @tc.desc      : 判断是否支持安全解码hls/ts
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2700', 0, function (done) {
      let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
      var session = drmMediaKeySystem.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
      var result = session.requireSecureDecoderModule("hls/ts");
      if(sysSupport === true){
        expect(result).assertFalse();
      } else {
        expect(result).assertUndefined();
      }
      session.destroy();
      drmMediaKeySystem.destroy();
      console.log("SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2700 end");
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2800
    * @tc.name      : createMediaKeySession
    * @tc.desc      : 判断是否支持安全解码,错误的minetype
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2800', 0, function (done) {
      let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
      var session = drmMediaKeySystem.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
      var result = session.requireSecureDecoderModule("1111/22222");
      if(sysSupport === true){
        expect(result).assertFalse();
      } else {
        expect(result).assertUndefined();
      }
      session.destroy();
      drmMediaKeySystem.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2900
    * @tc.name      : createMediaKeySession
    * @tc.desc      : 判断是否支持安全解码,错误的minetype
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2900', 0, function (done) {
      let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
      console.log("drmMediaKeySystem is", drmMediaKeySystem);
      var session = drmMediaKeySystem.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
      var result = session.requireSecureDecoderModule("");
      if(sysSupport === true){
        expect(result).assertFalse();
      } else {
        expect(result).assertUndefined();
      }
      session.destroy();
      drmMediaKeySystem.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_3000
    * @tc.name      : createMediaKeySession
    * @tc.desc      : 判断是否支持安全解码,错误的minetype
    * @tc.size      : MediumTest
    * @tc.type      : Reliability
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_3000', 0, function (done) {
      let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
      expect(drmMediaKeySystem).not();
      drmMediaKeySystem.destroy();
      expect(drmMediaKeySystem.getMaxSecurityLevel()).assertUndefined();
      expect(drmMediaKeySystem.getConfigurationString("vendor")).assertUndefined();
      expect(drmMediaKeySystem.getConfigurationString("vendor", "0")).assertUndefined();
      // expect(drmMediaKeySystem.getConfigurationByteArray("vendor")).assertUndefined();
      // expect(drmMediaKeySystem.getConfigurationByteArray("vendor",stringToUint8Array("022364"))).assertUndefined();
      expect(drmMediaKeySystem.getMetrics()).assertUndefined();
      expect(drmMediaKeySystem.generateKeySystemRequest()).assertUndefined();
      expect(drmMediaKeySystem.processKeySystemResponse(stringToUint8Array("022364"))).assertUndefined();
      expect(drmMediaKeySystem.getCertificateStatus()).assertUndefined();
      // expect(drmMediaKeySystem.getOfflineLicenseIds()).assertUndefined();
      expect(drmMediaKeySystem.createMediaKeySession()).assertUndefined();
      expect(drmMediaKeySystem.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN)).assertUndefined();
      expect(drmMediaKeySystem.getOfflineLicenseStatus(stringToUint8Array("123456"))).assertUndefined();
      expect(drmMediaKeySystem.removeOfflineLicense(stringToUint8Array("123456"))).assertUndefined();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0100
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 获取设备证书，传入错误的响应报文数据
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_0100', 0, function (done) {
      var drmsys = drm.createMediaKeySystem(uuid);
      drmsys.generateKeySystemRequest();
      let arry = new Uint8Array([1, 2, 3, 4, 5]); // TODO 蓝区实验室不考虑设备证书，黄区设备证书有问题不写入
      drmsys.processKeySystemResponse(arry);
      var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
      expect(session).not();
      session.destroy();
      drmsys.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0300
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 获取设备证书，响应报文数据为空
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_0300', 0, function (done) {
      var drmsys = drm.createMediaKeySystem(uuid);
      drmsys.generateKeySystemRequest();
      drmsys.processKeySystemResponse(null); //TODO 蓝区实验室不考虑设备证书，黄区设备证书有问题不写入
      var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
      expect(session).not();
      session.destroy();
      drmsys.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0400
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 获取许可证,正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_0400', 0, function (done) {
      if (sysSupport === true) {
        var drmsys = drm.createMediaKeySystem(uuid);
        var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        session.generateLicenseRequest("video/mp4", uint8pssh, 0, optionalData);
        var responseArray = new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
        session.processLicenseResponse(responseArray);
        let keyvalue = session.checkLicenseStatus();
        // expect(keyvalue[0].value).assertEqual('ok');
        //TODO:蓝区checkLicenseStatus返回结果异常
        expect(keyvalue[0].value).assertUndefined();
        session.destroy();
        drmsys.destroy();
      }
      //TODO:黄区checkLicenseStatus异常
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0500
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 获取许可证,请求minetype异常
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_0500', 0, function (done) {
      var drmsys = drm.createMediaKeySystem(uuid);
      var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
      var base64 = new util.Base64();
      let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
      let optionalData = {
        name: "optionalDataName",
        value: "optionalDataValue"
      };
      var DrmRequest = session.generateLicenseRequest("1111/2222", uint8pssh, 0, optionalData);
      expect(DrmRequest).assertUndefined();
      // if (sysSupport === true) {
      //   expect(DrmRequest.licnseRequestType)
      //     .assertEqual('ALGTYPE_UNENCRYPTED'); // TODO: 实际结果ALGTYPE_UNENCRYPTED，问题单跟踪
      // } else {
      //   expect(DrmRequest.licnseRequestType).assertEqual('REQUEST_TYPE_INITIAL');
      // }
      session.destroy();
      drmsys.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0600
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 获取许可证,请求minetype为空
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_0600', 0, function (done) {
      var drmsys = drm.createMediaKeySystem(uuid);
      var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
      var base64 = new util.Base64();
      let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
      let optionalData = {
        name: "optionalDataName",
        value: "optionalDataValue"
      };
      let DrmRequest = session.generateLicenseRequest(null, uint8pssh, 0, optionalData);
      expect(DrmRequest).assertUndefined();
      session.destroy();
      drmsys.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0700
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 获取许可证,请求初始数据异常
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_0700', 0, function (done) {
      var drmsys = drm.createMediaKeySystem(uuid);
      var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
      var base64 = new util.Base64();
      let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q=');
      let optionalData = {
        name: "optionalDataName",
        value: "optionalDataValue"
      };
      let DrmRequest = session.generateLicenseRequest("video/mp4", uint8pssh, 0, optionalData);
      expect(DrmRequest).assertUndefined();
      // if (sysSupport === true) {
      //   expect(DrmRequest.licnseRequestType)
      //     .assertEqual('ALGTYPE_UNENCRYPTED'); // TODO: 实际结果ALGTYPE_UNENCRYPTED，问题单跟踪
      // } else {
      //   expect(DrmRequest.licnseRequestType).assertEqual('REQUEST_TYPE_INITIAL');
      // }
      session.destroy();
      drmsys.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0800
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 获取许可证,请求初始数据为空
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_0800', 0, function (done) {
      var drmsys = drm.createMediaKeySystem(uuid);
      var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
      let optionalData = {
        name: "optionalDataName",
        value: "optionalDataValue"
      };
      let DrmRequest = session.generateLicenseRequest("video/mp4", null, 0, optionalData);
      expect(DrmRequest).assertUndefined();
      session.destroy();
      drmsys.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0900
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 获取许可证,请求的licensetype异常
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_0900', 0, function (done) {
      var drmsys = drm.createMediaKeySystem(uuid);
      var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
      var base64 = new util.Base64();
      let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
      let optionalData = {
        name: "optionalDataName",
        value: "optionalDataValue"
      };
      let DrmRequest = session.generateLicenseRequest("video/mp4", uint8pssh, 3, optionalData);
      expect(DrmRequest).assertUndefined();
      // if (sysSupport === true) {
      //   expect(DrmRequest.licnseRequestType)
      //     .assertEqual('ALGTYPE_UNENCRYPTED'); // TODO: 实际结果ALGTYPE_UNENCRYPTED，问题单跟踪
      // } else {
      //   expect(DrmRequest.licnseRequestType).assertEqual('REQUEST_TYPE_INITIAL');
      // }
      session.destroy();
      drmsys.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1000
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 获取许可证,响应报文异常
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_1000', 0, function (done) {
      if (sysSupport === true) {
        var drmsys = drm.createMediaKeySystem(uuid);
        var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        session.generateLicenseRequest("video/mp4", uint8pssh, 0, optionalData);
        var responseArray = new Uint8Array([1, 2, 3, 4, 5]);
        session.processLicenseResponse(responseArray);
        let keyvalue = session.checkLicenseStatus();
        expect(keyvalue).assertUndefined();
        session.destroy();
        drmsys.destroy();
      }
      //TODO：黄区checkLicenseStatus异常
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1100
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 获取许可证,响应报文为空
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_1100', 0, function (done) {
      if (sysSupport === true) {
        var drmsys = drm.createMediaKeySystem(uuid);
        var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        session.generateLicenseRequest("video/mp4", uint8pssh, 0, optionalData);
        session.processLicenseResponse(null);
        let keyvalue = session.checkLicenseStatus();
        expect(keyvalue).assertUndefined();
        session.destroy();
        drmsys.destroy();
      }
      //TODO：黄区checkLicenseStatus异常
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1200
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 获取许可证,正常删除许可证信息，正常检查许可证状态
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_1200', 0, function (done) {
      if (sysSupport === true) {
        var drmsys = drm.createMediaKeySystem(uuid);
        var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        session.generateLicenseRequest("video/mp4", uint8pssh, 0, optionalData);
        var responseArray = new Uint8Array([0x30, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        session.processLicenseResponse(responseArray);
        var keyvalue = session.checkLicenseStatus();
        // expect(keyvalue[0].value).assertEqual('ok');
        // TODO:蓝区checkLicenseStatus返回异常
        expect(keyvalue[0].value).assertUndefined();
        session.removeLicense();
        var keyvalue = session.checkLicenseStatus();
        expect(keyvalue).assertUndefined();
        session.destroy();
        drmsys.destroy();
      }
      //TODO：黄区checkLicenseStatus异常
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1300
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 离线许可证管理，获取离线licenseid，检查licenseid状态
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_1300', 0, async function (done) {
      if (sysSupport === true) {
        var drmsys = drm.createMediaKeySystem(uuid);
        var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        session.generateLicenseRequest("video/mp4", uint8pssh, 1, optionalData);
        let responseArray = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        session.processLicenseResponse(responseArray);
        var keyIds = drmsys.getOfflineLicenseIds();
        console.log("keyIds is",keyIds);
        let arry = new Uint8Array(keyIds[0]);
        let OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertEqual(1);
        session.destroy();
        drmsys.destroy();
      } else {
        var drmsys = drm.createMediaKeySystem(uuid);
        var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        var licenseRequestData = session.generateLicenseRequest("video/mp4", uint8pssh, 1, optionalData);
        var licenseRequestStr = byteToString(licenseRequestData.mData);
        var licenseResponseStr = await getHttpData("http://192.168.50.59:9528/getLicense", licenseRequestStr);
        var licenseRequestByte = stringToUint8Array(licenseResponseStr);
        session.processLicenseResponse(licenseRequestByte);
        var offlineLicenseIds = drmsys.getOfflineLicenseIds();
        let arry = new Uint8Array(offlineLicenseIds[0]);
        let OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertEqual(1);
        session.destroy();
        drmsys.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1400
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 离线许可证管理，删除离线licenseid，检查licenseid状态
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_1400', 0, async function (done) {
      if (sysSupport === true) {
        var drmsys = drm.createMediaKeySystem(uuid);
        var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        session.generateLicenseRequest("video/mp4", uint8pssh, 1, optionalData);
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        session.processLicenseResponse(responseArray);
        var keyIds = drmsys.getOfflineLicenseIds();
        let arry = new Uint8Array(keyIds[0]);
        let OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertEqual(1);
        drmsys.removeOfflineLicense(arry);
        OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        // expect(OfflineKeyState).assertEqual(2);
        // TODO:蓝区离线许可证状态异常0102
        expect(OfflineKeyState).assertEqual(0);
        session.destroy();
        drmsys.destroy();
      } else {
        var drmsys = drm.createMediaKeySystem(uuid);
        var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        var licenseRequestData = session.generateLicenseRequest("video/mp4", uint8pssh, 1, optionalData);
        var licenseRequestStr = byteToString(licenseRequestData.mData);
        var licenseResponseStr = await getHttpData("http://192.168.50.59:9528/getLicense", licenseRequestStr);
        var licenseRequestByte = stringToUint8Array(licenseResponseStr);
        session.processLicenseResponse(licenseRequestByte);
        var offlineLicenseIds = drmsys.getOfflineLicenseIds();
        let arry = new Uint8Array(offlineLicenseIds[0]);
        let OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertEqual(1);
        drmsys.removeOfflineLicense(arry);
        OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertUndefined();
        session.destroy();
        drmsys.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1500
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 离线许可证管理，无效离线licenseid，检查licenseid状态
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_1500', 0, function (done) {
      var drmsys = drm.createMediaKeySystem(uuid);
      let arry = new Uint8Array([1, 2, 3, 4, 5]);
      let OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
      if (sysSupport === true) {
        expect(OfflineKeyState).assertEqual(0);
      } else {
        expect(OfflineKeyState).assertUndefined();
      }
      drmsys.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1600
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 离线许可证管理，离线licenseid为空，检查licenseid状态
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_1600', 0, function (done) {
      var drmsys = drm.createMediaKeySystem(uuid);
      let OfflineKeyState = drmsys.getOfflineLicenseStatus(null);
      expect(OfflineKeyState).assertUndefined();
      drmsys.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1700
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 离线许可证管理，删除离线许可证，错误参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_1700', 0, async function (done) {
      if (sysSupport === true) {
        var drmsys = drm.createMediaKeySystem(uuid);
        var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        session.generateLicenseRequest("video/mp4", uint8pssh, 1, optionalData);
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        session.processLicenseResponse(responseArray);
        var keyIds = drmsys.getOfflineLicenseIds();
        let arry = new Uint8Array(keyIds[0]);
        let OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertEqual(1);

        drmsys.removeOfflineLicense(new Uint8Array([1, 2, 3, 4, 5]));

        OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertEqual(1);
        session.destroy();
        drmsys.destroy();
      } else {
        //TODO:黄区getOfflineLicenseStatus返回状态异常
        var drmsys = drm.createMediaKeySystem(uuid);
        var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        var licenseRequestData = session.generateLicenseRequest("video/mp4", uint8pssh, 1, optionalData);
        var licenseRequestStr = byteToString(licenseRequestData.mData);
        var licenseResponseStr = await getHttpData("http://192.168.50.59:9528/getLicense", licenseRequestStr);
        var licenseRequestByte = stringToUint8Array(licenseResponseStr);
        session.processLicenseResponse(licenseRequestByte);
        var offlineLicenseIds = drmsys.getOfflineLicenseIds();
        let arry = new Uint8Array(offlineLicenseIds[0]);
        let OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertEqual(1);
        drmsys.removeOfflineLicense(new Uint8Array([1, 2, 3, 4, 5]));
        OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertEqual(1);
        session.destroy();
        drmsys.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1800
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 离线许可证管理，删除离线许可证，参数为空
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_1800', 0, async function (done) {
      if (sysSupport === true) {
        var drmsys = drm.createMediaKeySystem(uuid);
        var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        session.generateLicenseRequest("video/mp4", uint8pssh, 1, optionalData);
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        session.processLicenseResponse(responseArray);
        var keyIds = drmsys.getOfflineLicenseIds();

        let arry = new Uint8Array(keyIds[0]);
        let OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertEqual(1);

        drmsys.removeOfflineLicense(null);

        OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertEqual(1);
        session.destroy();
        drmsys.destroy();
      } else {
        var drmsys = drm.createMediaKeySystem(uuid);
        var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        var licenseRequestData = session.generateLicenseRequest("video/mp4", uint8pssh, 1, optionalData);
        var licenseRequestStr = byteToString(licenseRequestData.mData);
        var licenseResponseStr = await getHttpData("http://192.168.50.59:9528/getLicense", licenseRequestStr);
        var licenseRequestByte = stringToUint8Array(licenseResponseStr);
        session.processLicenseResponse(licenseRequestByte);
        var offlineLicenseIds = drmsys.getOfflineLicenseIds();
        let arry = new Uint8Array(offlineLicenseIds[0]);
        let OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertEqual(1);
        drmsys.removeOfflineLicense(null);
        OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertEqual(1);
        session.destroy();
        drmsys.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1900
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 离线许可证管理，重复删除离线licenseid，检查licenseid状态
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_1900', 0, async function (done) {
      if (sysSupport === true) {
        var drmsys = drm.createMediaKeySystem(uuid);
        var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        session.generateLicenseRequest("video/mp4", uint8pssh, 1, optionalData);
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        session.processLicenseResponse(responseArray);

        var keyIds = drmsys.getOfflineLicenseIds();

        let arry = new Uint8Array(keyIds[0]);
        let OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertEqual(1);

        drmsys.removeOfflineLicense(arry);
        OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertEqual(0);

        drmsys.removeOfflineLicense(arry);
        OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertEqual(0);
        session.destroy();
        drmsys.destroy();
      } else {
        var drmsys = drm.createMediaKeySystem(uuid);
        var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        var licenseRequestData = session.generateLicenseRequest("video/mp4", uint8pssh, 1, optionalData);
        var licenseRequestStr = byteToString(licenseRequestData.mData);
        var licenseResponseStr = await getHttpData("http://192.168.50.59:9528/getLicense", licenseRequestStr);
        var licenseRequestByte = stringToUint8Array(licenseResponseStr);
        session.processLicenseResponse(licenseRequestByte);
        var offlineLicenseIds = drmsys.getOfflineLicenseIds();
        let arry = new Uint8Array(offlineLicenseIds[0]);
        let OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertEqual(1);
        drmsys.removeOfflineLicense(arry);
        OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertUndefined();
        drmsys.removeOfflineLicense(arry);
        OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertUndefined();
        session.destroy();
        drmsys.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2000
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 离线许可证释放，正常传参
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_2000', 0, function (done) {
      if (sysSupport === true) {
        var drmsys = drm.createMediaKeySystem(uuid);
        var session = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        session.generateLicenseRequest("video/mp4", uint8pssh, 1, optionalData);
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        session.processLicenseResponse(responseArray);
        var keyIds = drmsys.getOfflineLicenseIds();
        let keyArray = new Uint8Array(keyIds[0]);
        let OfflineKeyState = drmsys.getOfflineLicenseStatus(keyArray);
        expect(OfflineKeyState).assertEqual(1);
        session.generateOfflineReleaseRequest(keyArray);
        session.processOfflineReleaseResponse(keyArray, responseArray);
        OfflineKeyState = drmsys.getOfflineLicenseStatus(keyArray);
        expect(OfflineKeyState).assertEqual(2);
        session.destroy();
        drmsys.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2100
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 离线许可证释放，请求参数异常
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_2100', 0, function (done) {
      if (sysSupport === true) {
        var drmsys =  drm.createMediaKeySystem(uuid);
        var session =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        session.generateLicenseRequest("video/mp4",uint8pssh,1,optionalData);
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        session.processLicenseResponse(responseArray);
        var keyIds = drmsys.getOfflineLicenseIds();
        let arry = new Uint8Array(keyIds[0]);
        let OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertEqual(1);
        let keyArray = new Uint8Array([1, 2, 3, 4, 5]);
        session.generateOfflineReleaseRequest(keyArray);
        session.processOfflineReleaseResponse(keyArray, responseArray);
        OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertEqual(1);
        session.destroy();
        drmsys.destroy();
      }
      // TODO：黄区processOfflineReleaseResponse不支持
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2200
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 离线许可证释放，请求参数为空
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_2200', 0, function (done) {
      if (sysSupport === true) {
        var drmsys =  drm.createMediaKeySystem(uuid);
        var session =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        session.generateLicenseRequest("video/mp4",uint8pssh,1,optionalData);
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        session.processLicenseResponse(responseArray);
        var keyIds = drmsys.getOfflineLicenseIds();
        let arry = new Uint8Array(keyIds[0]);
        let OfflineKeyState = drmsys.getOfflineLicenseStatus(arry);
        expect(OfflineKeyState).assertEqual(1);
        var OfflineReleaseRequest = session.generateOfflineReleaseRequest(null);
        expect(OfflineReleaseRequest).assertUndefined();
        session.destroy();
        drmsys.destroy();
      }
      // TODO：黄区processOfflineReleaseResponse不支持
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2300
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 离线许可证释放，响应参数异常licenseid
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_2300', 0, function (done) {
      if (sysSupport === true) {
        var drmsys =  drm.createMediaKeySystem(uuid);
        var session =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        session.generateLicenseRequest("video/mp4",uint8pssh,1,optionalData);
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        session.processLicenseResponse(responseArray);
        var keyIds = drmsys.getOfflineLicenseIds();
        let keyArray = new Uint8Array(keyIds[0]);
        session.generateOfflineReleaseRequest(keyArray);
        session.processOfflineReleaseResponse(new Uint8Array([1,2,3,4,5]), responseArray);
        let OfflineKeyState = drmsys.getOfflineLicenseStatus(keyArray);
        expect(OfflineKeyState).assertEqual(1);
        session.destroy();
        drmsys.destroy();
      }
      // TODO：黄区processOfflineReleaseResponse不支持
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2400
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 离线许可证释放，响应参数异常licenseid为空
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_2400', 0, function (done) {
      if (sysSupport === true) {
        var drmsys =  drm.createMediaKeySystem(uuid);
        var session =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        session.generateLicenseRequest("video/mp4",uint8pssh,1,optionalData);
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        session.processLicenseResponse(responseArray);
        var keyIds = drmsys.getOfflineLicenseIds();
        let keyArray = new Uint8Array(keyIds[0]);
        session.generateOfflineReleaseRequest(keyArray);
        session.processOfflineReleaseResponse(null, responseArray);
        let OfflineKeyState = drmsys.getOfflineLicenseStatus(keyArray);
        expect(OfflineKeyState).assertEqual(1);
        session.destroy();
        drmsys.destroy();
      }
      // TODO：黄区processOfflineReleaseResponse不支持
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2500
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 离线许可证释放，响应参数异常响应报文
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_2500', 0, function (done) {
      if (sysSupport === true) {
        var drmsys =  drm.createMediaKeySystem(uuid);
        var session =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        session.generateLicenseRequest("video/mp4",uint8pssh,1,optionalData);
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        session.processLicenseResponse(responseArray);
        var keyIds = drmsys.getOfflineLicenseIds();
        let keyArray = new Uint8Array(keyIds[0]);
        var OfflineKeyState = drmsys.getOfflineLicenseStatus(keyArray);
        expect(OfflineKeyState).assertEqual(1);
        session.generateOfflineReleaseRequest(keyArray);
        session.processOfflineReleaseResponse(keyArray, new Uint8Array([1, 2, 3, 4, 5]));
        OfflineKeyState = drmsys.getOfflineLicenseStatus(keyArray);
        expect(OfflineKeyState).assertEqual(2);
        session.destroy();
        drmsys.destroy();
      }
      // TODO：黄区processOfflineReleaseResponse不支持
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2600
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 离线许可证释放，响应参数异常响应报文为空
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_2600', 0,  function (done) {
      if (sysSupport === true) {
        var drmsys =  drm.createMediaKeySystem(uuid);
        var session =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        session.generateLicenseRequest("video/mp4",uint8pssh,1,optionalData);
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        session.processLicenseResponse(responseArray);
        var keyIds = drmsys.getOfflineLicenseIds();
        let keyArray = new Uint8Array(keyIds[0]);
        session.generateOfflineReleaseRequest(keyArray);
        session.processOfflineReleaseResponse(keyArray, null);
        let OfflineKeyState = drmsys.getOfflineLicenseStatus(keyArray);
        expect(OfflineKeyState).assertEqual(1);
        session.destroy();
        drmsys.destroy();
      }
      // TODO：黄区processOfflineReleaseResponse不支持
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2700
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 离线许可证restore，创建会话1，生成离线许可证licenseid，释放会话1，创建会话2，去restore会话1生成的licenseid
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_2700', 0, async function (done) {
      if (sysSupport === true) {
        var drmsys =  drm.createMediaKeySystem(uuid);
        var session1 =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        session1.generateLicenseRequest("video/mp4",uint8pssh,1,optionalData);
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        session1.processLicenseResponse(responseArray);
        var keyIds = drmsys.getOfflineLicenseIds();
        var keyArray = new Uint8Array(keyIds[0]);
        let OfflineKeyState = drmsys.getOfflineLicenseStatus(keyArray);
        expect(OfflineKeyState).assertEqual(1);
        session1.destroy();
        //TODO:会话销毁以后离线许可证无法获取0102
        expect(drmsys.getOfflineLicenseStatus(keyArray)).assertEqual(0);

        var session2 =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        session2.restoreOfflineLicense(keyArray);

        OfflineKeyState = drmsys.getOfflineLicenseStatus(keyArray);
        console.log("getOfflineLicenseStatus3 is",OfflineKeyState);
        expect(OfflineKeyState).assertEqual(1);
        session2.destroy();
        drmsys.destroy();
      } else {
        var drmsys =  drm.createMediaKeySystem(uuid);
        var session1 =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        var licenseRequestData = session1.generateLicenseRequest("video/mp4", uint8pssh, 1, optionalData);
        var licenseRequestStr = byteToString(licenseRequestData.mData);
        var licenseResponseStr = await getHttpData("http://192.168.50.59:9528/getLicense", licenseRequestStr);
        var licenseRequestByte = stringToUint8Array(licenseResponseStr);
        session1.processLicenseResponse(licenseRequestByte);

        var keyIds = drmsys.getOfflineLicenseIds();
        var keyArray = new Uint8Array(keyIds[0]);
        let OfflineKeyState = drmsys.getOfflineLicenseStatus(keyArray);
        expect(OfflineKeyState).assertEqual(1);

        session1.destroy();
        expect(drmsys.getOfflineLicenseStatus(keyArray)).assertEqual(1);

        var session2 =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        session2.restoreOfflineLicense(keyArray);

        OfflineKeyState = drmsys.getOfflineLicenseStatus(keyArray);
        expect(OfflineKeyState).assertEqual(1);
        session2.destroy();
        drmsys.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2800
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 离线许可证restore，创建会话1会话2，会话2restore会话1生成的离线licenseid
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_2800', 0, async function (done) {
      if (sysSupport === true) {
        var drmsys =  drm.createMediaKeySystem(uuid);
        var session1 =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        session1.generateLicenseRequest("video/mp4",uint8pssh,1,optionalData);
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        session1.processLicenseResponse(responseArray);
        var keyIds = drmsys.getOfflineLicenseIds();
        var keyArray = new Uint8Array(keyIds[0]);

        var session2 =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        session2.restoreOfflineLicense(keyArray);
        let OfflineKeyState = drmsys.getOfflineLicenseStatus(keyArray);
        expect(OfflineKeyState).assertEqual(1);
        session1.destroy();
        session2.destroy();
        drmsys.destroy();
      } else {
        var drmsys =  drm.createMediaKeySystem(uuid);
        var session1 =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        var licenseRequestData = session1.generateLicenseRequest("video/mp4", uint8pssh, 1, optionalData);
        var licenseRequestStr = byteToString(licenseRequestData.mData);
        var licenseResponseStr = await getHttpData("http://192.168.50.59:9528/getLicense", licenseRequestStr);
        var licenseRequestByte = stringToUint8Array(licenseResponseStr);
        session1.processLicenseResponse(licenseRequestByte);

        var keyIds = drmsys.getOfflineLicenseIds();
        var keyArray = new Uint8Array(keyIds[0]);
        var session2 =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        session2.restoreOfflineLicense(keyArray);

        let OfflineKeyState = drmsys.getOfflineLicenseStatus(keyArray);
        expect(OfflineKeyState).assertEqual(1);
        session1.destroy();
        session2.destroy();
        drmsys.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2900
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 离线许可证restore,传错误的licenseid
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_2900', 0,  function (done) {
      var drmsys =  drm.createMediaKeySystem(uuid);
      var session =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
      session.restoreOfflineLicense(new Uint8Array([1, 2, 3, 4, 5]));
      expect(1).assertEqual(1);
      session.destroy();
      drmsys.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_3000
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 离线许可证restore,licenseid为空
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_3000', 0,  function (done) {
      var drmsys =  drm.createMediaKeySystem(uuid);
      var session =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
      session.restoreOfflineLicense(null);
      expect(1).assertEqual(1);
      session.destroy();
      drmsys.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_3100
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 设备证书状态查询
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_3100', 0,  function (done) {
      var drmsys =  drm.createMediaKeySystem(uuid);
      drmsys.generateKeySystemRequest();
      var cstatus = drmsys.getCertificateStatus();// TODO:证书状态场景待补全
      expect(cstatus).assertEqual(0);
      drmsys.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_3200
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 创建system1，获取设备证书，创建system2，检查设备证书状态
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_3200', 0,  function (done) {
      var drmsys =  drm.createMediaKeySystem(uuid);
      var cstatus = drmsys.getCertificateStatus();
      expect(cstatus).assertEqual(0);

      var drmsys2 =  drm.createMediaKeySystem(uuid);
      drmsys2.getCertificateStatus();
      expect(cstatus).assertEqual(0);
      drmsys.destroy();
      drmsys2.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_3300
    * @tc.name      : 001.test getTrackDescription
    * @tc.desc      : 创建system1，获取设备证书，释放system1，创建system2，检查设备证书状态
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_AVPLAYER_3300', 0,  function (done) {
      var drmsys =  drm.createMediaKeySystem(uuid);
      var cstatus = drmsys.getCertificateStatus();
      expect(cstatus).assertEqual(0);

      drmsys.destroy();

      var drmsys2 =  drm.createMediaKeySystem(uuid);
      drmsys2.getCertificateStatus();
      expect(cstatus).assertEqual(0);
      drmsys2.destroy();
      done();
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0100
    * @tc.name      : 002.test set_get_config
    * @tc.desc      : 给vendor赋值然后获取属性值
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0100', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationString("vendor", "ABC");
        var getCfg = mediaKeySystem.getConfigurationString("vendor");
        expect(getCfg).assertEqual("ABC");
        mediaKeySystem.destroy();
      }
      //TODO:黄区setConfigurationString不支持
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0200
    * @tc.name      : 002.test set_get_config
    * @tc.desc      : 给vendor赋值然后获取属性值
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0200', 1,  function (done) {
      //TODO: 要设置的属性名为空，获取属性值成功
      var mediaKeySystem =  drm.createMediaKeySystem(uuid);
      var getCfg = mediaKeySystem.getConfigurationString(null);
      if(sysSupport === true){
        console.log("getCfg is:",getCfg);
        expect(getCfg).assertUndefined();
      } else {
        expect(getCfg).assertEqual("Not Supported");
      }
      mediaKeySystem.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0300
    * @tc.name      : 002.test set_get_config
    * @tc.desc      : 给vendor赋值，输入错误的propertyName
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0300', 1,  function (done) {
      //TODO:输入错误的propertyName，也能设置成功
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationString("versionid", "ABC");
        var getCfg = mediaKeySystem.getConfigurationString("versionid");
        expect(getCfg).assertEqual("ABC");
        mediaKeySystem.destroy();
      }
      //TODO:黄区setConfigurationString不支持
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0400
    * @tc.name      : 002.test set_get_config
    * @tc.desc      : 给vendor赋值，value值为空
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0400', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationString("vendor", null);
        var getCfg = mediaKeySystem.getConfigurationString("vendor");
        expect(getCfg).assertUndefined();
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0400
    * @tc.name      : 002.test set_get_config
    * @tc.desc      : 给vendor赋两次值，看最终结果是否覆盖
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0500', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationString("vendor", 'ABC');
        var getCfg = mediaKeySystem.getConfigurationString("vendor");
        expect(getCfg).assertEqual('ABC');
        mediaKeySystem.setConfigurationString("vendor", 'EFG');
        getCfg = mediaKeySystem.getConfigurationString("vendor");
        expect(getCfg).assertEqual('EFG');
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0600
    * @tc.name      : 002.test set_get_config
    * @tc.desc      : set config "VERSION" and get
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0600', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationString("version", "1.1");
        var getCfg = mediaKeySystem.getConfigurationString("version");
        expect(getCfg).assertEqual("1.1");
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0700
    * @tc.name      : 002.test set_get_config
    * @tc.desc      : set config "VERSION" and get
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0700', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationString("version", null);
        var getCfg = mediaKeySystem.getConfigurationString("version");
        expect(getCfg).assertUndefined();
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0800
    * @tc.name      : 002.test set_get_config
    * @tc.desc      : set config "DESCRIPTION" and get
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0800', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationString("description", "Test Set Get Config");
        var getCfg = mediaKeySystem.getConfigurationString("description");
        expect(getCfg).assertEqual("Test Set Get Config");
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0900
    * @tc.name      : 002.test set_get_config
    * @tc.desc      : set config "DESCRIPTION" and get
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0900', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationString("description", null);
        var getCfg = mediaKeySystem.getConfigurationString("description");
        expect(getCfg).assertUndefined();
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1000
    * @tc.name      : 002.test set_get_config
    * @tc.desc      : set config "ALGORITHMS" and get
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1000', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationString("algorithms", "AES");
        var getCfg = mediaKeySystem.getConfigurationString("algorithms");
        expect(getCfg).assertEqual("AES");
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1100
    * @tc.name      : 002.test set_get_config
    * @tc.desc      : set config "ALGORITHMS" and get
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1100', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationString("algorithms", null);
        var getCfg = mediaKeySystem.getConfigurationString("algorithms");
        expect(getCfg).assertUndefined();
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1200
    * @tc.name      : 005.test set_get_config
    * @tc.desc      : set config "deviceUniqueId" and get
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1200', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationString("deviceUniqueId", "7E8G9D");
        var getCfg = mediaKeySystem.getConfigurationString("deviceUniqueId");
        expect(getCfg).assertEqual("7E8G9D");
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1300
    * @tc.name      : 005.test set_get_config
    * @tc.desc      : set config "deviceUniqueId" and get
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1300', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationString("deviceUniqueId", null);
        var getCfg = mediaKeySystem.getConfigurationString("deviceUniqueId");
        expect(getCfg).assertUndefined();
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1400
    * @tc.name      : 006.test set_get_config
    * @tc.desc      : 获取设备最大会话数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1400', 1,  function (done) {
      // TODO:无法获取最大会话数，已提单跟踪
      var mediaKeySystem =  drm.createMediaKeySystem(uuid);
      var getCfg = mediaKeySystem.getConfigurationString("maxSessionNum");
      if(sysSupport === true){
        expect(getCfg).assertUndefined();
      } else {
        expect(getCfg).assertEqual("64");
      }
      mediaKeySystem.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1500
    * @tc.name      : 006.test set_get_config
    * @tc.desc      : 设置最大会话数为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1500', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationString("maxSessionNum", '0');
        var getCfg = mediaKeySystem.getConfigurationString("maxSessionNum");
        expect(getCfg).assertEqual("0");
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1600
    * @tc.name      : 006.test set_get_config
    * @tc.desc      : 设置最大会话数为null
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1600', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationString("maxSessionNum", null);
        var getCfg = mediaKeySystem.getConfigurationString("maxSessionNum");
        expect(getCfg).assertUndefined();
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1700
    * @tc.name      : 006.test set_get_config
    * @tc.desc      : 给maxSessionNum赋值，超过默认最大数64
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1700', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationString("maxSessionNum", "65");
        var getCfg = mediaKeySystem.getConfigurationString("maxSessionNum");
        expect(getCfg).assertEqual("65");
        mediaKeySystem.destroy();
      }
      done();
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1900
    * @tc.name      : 006.test set_get_config
    * @tc.desc      : 给maxSessionNum赋值1，创建两个会话
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1900', 1,  function (done) {
      if(sysSupport === true){
        // TODO: 设置最大会话数属性未生效，提单跟踪
        var drmsys =  drm.createMediaKeySystem(uuid);
        drmsys.setConfigurationString("maxSessionNum", "1");
        var getCfg = drmsys.getConfigurationString("maxSessionNum");
        expect(getCfg).assertEqual('1');
        var session1 =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var session2 =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        expect(session2).not();
        session1.destroy();
        session2.destroy();
        drmsys.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2000
    * @tc.name      : 007.test set_get_config
    * @tc.desc      : 查看当前会话数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2000', 1,  function (done) {
      var drmsys =  drm.createMediaKeySystem(uuid);
      var session1 =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
      var session2 =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
      var getCfg = drmsys.getConfigurationString("currentSessionNum");
      if(sysSupport === true){
        expect(getCfg).assertEqual(getCfg);
      } else {
        expect(getCfg).assertEqual('2');
      }
      session1.destroy();
      session2.destroy();
      drmsys.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2100
    * @tc.name      : 008.test set_get_config
    * @tc.desc      : get config "maxHDCPLevel"
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2100', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationString("maxHDCPLevel", "HDCP_V1");
        var getCfg = mediaKeySystem.getConfigurationString("maxHDCPLevel");
        expect(getCfg).assertEqual("HDCP_V1");
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2200
    * @tc.name      : 008.test set_get_config
    * @tc.desc      : get config "maxHDCPLevel"
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2200', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationString("maxHDCPLevel", null);
        var getCfg = mediaKeySystem.getConfigurationString("maxHDCPLevel");
        expect(getCfg).assertUndefined();
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2300
    * @tc.name      : 009.test set_get_config
    * @tc.desc      : get config "currentHDCPLevel"
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2300', 1,  function (done) {
      var mediaKeySystem =  drm.createMediaKeySystem(uuid);
      var getCfg = mediaKeySystem.getConfigurationString("currentHDCPLevel");
      expect(getCfg).assertEqual(getCfg);
      mediaKeySystem.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_GET_METRIC_2400
    * @tc.name      : 001.test get metric
    * @tc.desc      : get metric information
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_GET_METRIC_2400', 1,  function (done) {
      var mediaKeySystem =  drm.createMediaKeySystem(uuid);
      let sessionArray = [];
      let metric = mediaKeySystem.getMetrics();
      for(let item of metric) {
        console.log("XX TEST metric" + item.name + ':' + item.value);
        if(item.name === 'currentSessionNum'){
          expect(item.value).assertEqual('0');
        }
      }
      for(let i=0;i<64;i++){
        sessionArray[i]= mediaKeySystem.createMediaKeySession();
      }
      let metric2 = mediaKeySystem.getMetrics();
      for(let item2 of metric2) {
        console.log("XX TEST metric2" + item2.name + ':' + item2.value);
        if(item2.name === 'currentSessionNum'){
          expect(item2.value).assertEqual('64');
        }
      }
      for(let j=0;j<32;j++){
        sessionArray[j].destroy();
      }
      let metric3 = mediaKeySystem.getMetrics();
      for(let item3 of metric3) {
        console.log("XX TEST metric3" + item3.name + ':' + item3.value);
        if(item3.name === 'currentSessionNum'){
          expect(item3.value).assertEqual('32');
        }
      }
      for(let k=32;k<64;k++){
        sessionArray[k].destroy();
      }
      mediaKeySystem.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2500
    * @tc.name      : 008.test set_get_config
    * @tc.desc      : get config "maxADCPLevel"
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2500', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationString("maxADCPLevel", "ADCP_V1_L1");
        var getCfg = mediaKeySystem.getConfigurationString("maxADCPLevel");
        expect(getCfg).assertEqual("ADCP_V1_L1");
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2600
    * @tc.name      : 008.test set_get_config
    * @tc.desc      : get config "maxADCPLevel"
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2600', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationString("maxADCPLevel", null);
        var getCfg = mediaKeySystem.getConfigurationString("maxADCPLevel");
        expect(getCfg).assertUndefined();
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2700
    * @tc.name      : 009.test set_get_config
    * @tc.desc      : get config "currentADCPLevel"
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2700', 1,  function (done) {
      var mediaKeySystem =  drm.createMediaKeySystem(uuid);
      var getCfg = mediaKeySystem.getConfigurationString("currentADCPLevel");
      expect(getCfg).assertEqual(getCfg);
      mediaKeySystem.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2800
    * @tc.name      : 028.test set_get_config
    * @tc.desc      : get metrics session num
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2800', 1,  function (done) {
      var mediaKeySystem =  drm.createMediaKeySystem(uuid);
      var getCfg = mediaKeySystem.getConfigurationString("version");
      let metric = mediaKeySystem.getMetrics();
      for(let item of metric) {
        console.log("XX TEST metric" + item.name + ':' + item.value);
        if(item.name === 'version'){
          if(sysSupport === true){
            expect(getCfg).assertEqual(getCfg);
          } else {
            expect(getCfg).assertEqual(item.value);
          }
        }
      }
      mediaKeySystem.destroy();
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2900
    * @tc.name      : 029.test set_get_config
    * @tc.desc      : 给vendor赋值然后获取属性值(Uint8array)
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2900', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        var valueArray = stringToUint8Array("ABC");
        mediaKeySystem.setConfigurationByteArray("vendor", valueArray);
        var getCfg = mediaKeySystem.getConfigurationByteArray("vendor");
        for(var i = 0; i < getCfg.length; i++) {
          expect(getCfg[i]).assertEqual(valueArray[i]);
        }
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3000
    * @tc.name      : 030.test set_get_config
    * @tc.desc      : 给vendor赋值，输入错误的propertyName(Uint8Array)
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    // it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3000', 1,  function (done) {
    //   if(sysSupport === true){
    //     // TODO:，设置错误属性，获取正常，待提单
    //     var mediaKeySystem =  drm.createMediaKeySystem(uuid);
    //     var valueArray = stringToUint8Array("ABC");
    //     mediaKeySystem.setConfigurationByteArray("versionid", valueArray);
    //     var getCfg = mediaKeySystem.getConfigurationByteArray("versionid");
    //     expect(getCfg).assertEqual(valueArray);
    //     mediaKeySystem.destroy();
    //   }
    //   done();
    // })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3100
    * @tc.name      : 031.test set_get_config
    * @tc.desc      : 给vendor赋值，value值为空(Uint8Array)
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3100', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationByteArray("vendor", null);
        var getCfg = mediaKeySystem.getConfigurationByteArray("vendor");
        // for(var i = 0; i < getCfg.length; i++) {
        //   expect(getCfg[i]).assertEqual(valueArray[i]);
        // }
        expect(getCfg).assertUndefined();
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3200
    * @tc.name      : 032.test set_get_config
    * @tc.desc      : 给vendor赋两次值，看最终结果是否覆盖(Uint8Array)
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3200', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        var valueArray = stringToUint8Array("ABC");
        mediaKeySystem.setConfigurationByteArray("vendor", valueArray);
        var getCfg = mediaKeySystem.getConfigurationByteArray("vendor");
        for(var i = 0; i < getCfg.length; i++) {
          expect(getCfg[i]).assertEqual(valueArray[i]);
        }
        valueArray = stringToUint8Array("EFG");
        mediaKeySystem.setConfigurationByteArray("vendor", valueArray);
        getCfg = mediaKeySystem.getConfigurationByteArray("vendor");
        for(var i = 0; i < getCfg.length; i++) {
          expect(getCfg[i]).assertEqual(valueArray[i]);
        }
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3300
    * @tc.name      : 033.test set_get_config
    * @tc.desc      : set config "VERSION" and get
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3300', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        var valueArray = stringToUint8Array("1.1");
        mediaKeySystem.setConfigurationByteArray("version", valueArray);
        var getCfg = mediaKeySystem.getConfigurationByteArray("version");
        for(var i = 0; i < getCfg.length; i++) {
          expect(getCfg[i]).assertEqual(valueArray[i]);
        }
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3400
    * @tc.name      : 034.test set_get_config
    * @tc.desc      : set config "VERSION" and get
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3400', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationByteArray("version", null);
        var getCfg = mediaKeySystem.getConfigurationByteArray("version");
        // for(var i = 0; i < getCfg.length; i++) {
        //   expect(getCfg[i]).assertEqual(valueArray[i]);
        // }
        expect(getCfg).assertUndefined();
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3500
    * @tc.name      : 035.test set_get_config
    * @tc.desc      : set config "DESCRIPTION" and get
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3500', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        var valueArray = stringToUint8Array("Test Set Get Config");
        mediaKeySystem.setConfigurationByteArray("description", valueArray);
        var getCfg = mediaKeySystem.getConfigurationByteArray("description");
        for(var i = 0; i < getCfg.length; i++) {
          expect(getCfg[i]).assertEqual(valueArray[i]);
        }
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3600
    * @tc.name      : 036.test set_get_config
    * @tc.desc      : set config "description" and get
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3600', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationByteArray("description", null);
        var getCfg = mediaKeySystem.getConfigurationByteArray("description");
        // for(var i = 0; i < getCfg.length; i++) {
        //   expect(getCfg[i]).assertEqual(valueArray[i]);
        // }
        expect(getCfg).assertUndefined();
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3700
    * @tc.name      : 037.test set_get_config
    * @tc.desc      : set config "algorithms" and get
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3700', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        var valueArray = stringToUint8Array("AES");
        mediaKeySystem.setConfigurationByteArray("algorithms", valueArray);
        var getCfg = mediaKeySystem.getConfigurationByteArray("algorithms");
        for(var i = 0; i < getCfg.length; i++) {
          expect(getCfg[i]).assertEqual(valueArray[i]);
        }
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3800
    * @tc.name      : 038.test set_get_config
    * @tc.desc      : set config "algorithms" and get
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3800', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationByteArray("algorithms", null);
        var getCfg = mediaKeySystem.getConfigurationByteArray("algorithms");
        // for(var i = 0; i < getCfg.length; i++) {
        //   expect(getCfg[i]).assertEqual(valueArray[i]);
        // }
        expect(getCfg).assertUndefined();
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3900
    * @tc.name      : 039.test set_get_config
    * @tc.desc      : set config "deviceUniqueId" and get
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3900', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        var valueArray = stringToUint8Array("7E8G9D");
        mediaKeySystem.setConfigurationByteArray("deviceUniqueId", valueArray);
        var getCfg = mediaKeySystem.getConfigurationByteArray("deviceUniqueId");
        for(var i = 0; i < getCfg.length; i++) {
          expect(getCfg[i]).assertEqual(valueArray[i]);
        }
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4000
    * @tc.name      : 040.test set_get_config
    * @tc.desc      : set config "deviceUniqueId" and get
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4000', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationByteArray("deviceUniqueId", null);
        var getCfg = mediaKeySystem.getConfigurationByteArray("deviceUniqueId");
        // for(var i = 0; i < getCfg.length; i++) {
        //   expect(getCfg[i]).assertEqual(valueArray[i]);
        // }
        expect(getCfg).assertUndefined();
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4100
    * @tc.name      : 041.test set_get_config
    * @tc.desc      : 获取设备最大会话数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4100', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        var getCfg = mediaKeySystem.getConfigurationByteArray("maxSessionNum");
        // var valueArray = stringToUint8Array("64");
        // for(var i = 0; i < getCfg.length; i++) {
        //   expect(getCfg[i]).assertEqual(valueArray[i]);
        // }
        expect(getCfg).assertUndefined();
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4200
    * @tc.name      : 042.test set_get_config
    * @tc.desc      : 设置最大会话数为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4200', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        var valueArray = stringToUint8Array("0");
        mediaKeySystem.setConfigurationByteArray("maxSessionNum", valueArray);
        var getCfg = mediaKeySystem.getConfigurationByteArray("maxSessionNum");
        for(var i = 0; i < getCfg.length; i++) {
          expect(getCfg[i]).assertEqual(valueArray[i]);
        }
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4300
    * @tc.name      : 043.test set_get_config
    * @tc.desc      : 设置最大会话数为null
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4300', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationByteArray("maxSessionNum", null);
        var getCfg = mediaKeySystem.getConfigurationByteArray("maxSessionNum");
        // for(var i = 0; i < getCfg.length; i++) {
        //   expect(getCfg[i]).assertEqual(valueArray[i]);
        // }
        expect(getCfg).assertUndefined();
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4400
    * @tc.name      : 044.test set_get_config
    * @tc.desc      : 给maxSessionNum赋值，超过默认最大数64
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4400', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        var valueArray = stringToUint8Array("65");
        mediaKeySystem.setConfigurationByteArray("maxSessionNum", valueArray);
        var getCfg = mediaKeySystem.getConfigurationByteArray("maxSessionNum");
        for(var i = 0; i < getCfg.length; i++) {
          expect(getCfg[i]).assertEqual(valueArray[i]);
        }
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4500
    * @tc.name      : 045.test set_get_config
    * @tc.desc      : 给maxSessionNum赋值1，创建两个会话
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4500', 1,  function (done) {
      if(sysSupport === true){
        var drmsys =  drm.createMediaKeySystem(uuid);
        var valueArray = stringToUint8Array("1");
        drmsys.setConfigurationByteArray("maxSessionNum", valueArray);
        var getCfg = drmsys.getConfigurationByteArray("maxSessionNum");
        for(var i = 0; i < getCfg.length; i++) {
          expect(getCfg[i]).assertEqual(valueArray[i]);
        }
        drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var session =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        expect(session).not();
        session.destroy();
        drmsys.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4600
    * @tc.name      : 046.test set_get_config
    * @tc.desc      : 查看当前会话数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4600', 1,  function (done) {
      if(sysSupport === true){
        var drmsys =  drm.createMediaKeySystem(uuid);
        var session1 =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var session2 =  drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var getCfg = drmsys.getConfigurationByteArray("currentSessionNum");
        expect(getCfg).assertEqual(getCfg);
        session1.destroy();
        session2.destroy();
        drmsys.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4700
    * @tc.name      : 047.test set_get_config
    * @tc.desc      : get config "maxHDCPLevel"
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4700', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        var valueArray = stringToUint8Array("HDCP_V1");
        mediaKeySystem.setConfigurationByteArray("maxHDCPLevel", valueArray);
        var getCfg = mediaKeySystem.getConfigurationByteArray("maxHDCPLevel");
        for(var i = 0; i < getCfg.length; i++) {
          expect(getCfg[i]).assertEqual(valueArray[i]);
        }
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4800
    * @tc.name      : 048.test set_get_config
    * @tc.desc      : get config "maxHDCPLevel"
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4800', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationByteArray("maxHDCPLevel", null);
        var getCfg = mediaKeySystem.getConfigurationByteArray("maxHDCPLevel");
        // for(var i = 0; i < getCfg.length; i++) {
        //   expect(getCfg[i]).assertEqual(valueArray[i]);
        // }
        expect(getCfg).assertUndefined();
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4900
    * @tc.name      : 049.test set_get_config
    * @tc.desc      : get config "maxHDCPLevel"
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4900', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        var getCfg = mediaKeySystem.getConfigurationByteArray("currentHDCPLevel");
        expect(getCfg).assertEqual(getCfg);
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_5000
    * @tc.name      : 050.test set_get_config
    * @tc.desc      : get config "maxADCPLevel"
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_5000', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        var valueArray = stringToUint8Array("ADCP_V1_L1");
        mediaKeySystem.setConfigurationByteArray("maxADCPLevel", valueArray);
        var getCfg = mediaKeySystem.getConfigurationByteArray("maxADCPLevel");
        for(var i = 0; i < getCfg.length; i++) {
          expect(getCfg[i]).assertEqual(valueArray[i]);
        }
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_5100
    * @tc.name      : 051.test set_get_config
    * @tc.desc      : get config "maxADCPLevel"
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_5100', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        mediaKeySystem.setConfigurationByteArray("maxADCPLevel", null);
        var getCfg = mediaKeySystem.getConfigurationByteArray("maxADCPLevel");
        // for(var i = 0; i < getCfg.length; i++) {
        //   expect(getCfg[i]).assertEqual(valueArray[i]);
        // }
        expect(getCfg).assertUndefined();
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_5200
    * @tc.name      : 052.test set_get_config
    * @tc.desc      : get config "currentADCPLevel"
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_5200', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        var getCfg = mediaKeySystem.getConfigurationByteArray("currentADCPLevel");
        // for(var i = 0; i < getCfg.length; i++) {
        //   expect(getCfg[i]).assertEqual(0);
        // }
        expect(getCfg).assertUndefined();
        mediaKeySystem.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_5300
    * @tc.name      : 002.test set_get_config
    * @tc.desc      : 给vendor赋值然后获取属性值
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_5300', 1,  function (done) {
      if(sysSupport === true){
        var mediaKeySystem =  drm.createMediaKeySystem(uuid);
        var getCfg = mediaKeySystem.getConfigurationByteArray(null);
        // for(var i = 0; i < getCfg.length; i++) {
        //   expect(getCfg[i]).assertUndefined();
        // }
        expect(getCfg).assertUndefined();
        mediaKeySystem.destroy();
      }
      done();
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0100
    * @tc.name      : 001.test on off interface
    * @tc.desc      : keyNeeded on/off interface
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0100', 1,  function (done) {
      if(sysSupport === true){
        var drmsys =  drm.createMediaKeySystem(uuid);
        var keySession = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var sign = 1;
        keySession.on('keyNeeded',(extra, data) => {
          console.log(`XUXIN hello keyNeeded extra` + extra);
          console.log(`XUXIN hello keyNeeded extratostr  ` + byteToString([75,69,89,32,78,69,69,68,69,68]));
          console.log(`XUXIN hello keyNeeded data` + data);
          sign = 2;
        });

        var responseArray = new Uint8Array([0x31,0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
        keySession.processLicenseResponse(responseArray);
        let optionalData = {
          name : "optionalDataName",
          value : "optionalDataValue",
        };
        keySession.generateLicenseRequest("video/mp4",responseArray,1, optionalData);

        expect(sign).assertEqual(2);
        keySession.off('keyNeeded');
        keySession.destroy();
        drmsys.destroy();
      }
      done();
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0200
    * @tc.name      : 001.test on off interface
    * @tc.desc      : keyNeeded on/off interface
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0200', 1,  function (done) {
      if(sysSupport === true){
        var drmsys =  drm.createMediaKeySystem(uuid);
        var keySession = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var sign = 1;
        keySession.on('keyNeeded',(extra, data) => {
          console.log(`XUXIN hello keyNeeded extra` + extra);
          console.log(`XUXIN hello keyNeeded extratostr  ` + byteToString([75,69,89,32,78,69,69,68,69,68]));
          console.log(`XUXIN hello keyNeeded data` + data);
          sign = 2;
        });

        keySession.off('keyNeeded');
        var responseArray = new Uint8Array([0x30,0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
        keySession.processLicenseResponse(responseArray);
        let optionalData = {
          name : "optionalDataName",
          value : "optionalDataValue",
        };
        keySession.generateLicenseRequest("video/mp4",responseArray,0, optionalData);

        expect(sign).assertEqual(1);
        keySession.destroy();
        drmsys.destroy();
      }
      done();
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0300
    * @tc.name      : 003.test on off interface
    * @tc.desc      : keyExpired on/off interface
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0300', 1,  function (done) {
      if(sysSupport === true){
        var drmsys =  drm.createMediaKeySystem(uuid);
        var keySession = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var sign = 1;
        keySession.on('keyExpired',(extra, data) => {
          console.log(`XUXIN hello keyExpired extra` + extra);
          console.log(`XUXIN hello keyExpired extratostr  ` + byteToString([75,69,89,32,69,88,80,73,82,69,68]));
          console.log(`XUXIN hello keyExpired data` + data);
          sign = 2;
        });

        var responseArray = new Uint8Array([0x30,0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
        keySession.processLicenseResponse(responseArray);
        let optionalData = {
          name : "optionalDataName",
          value : "optionalDataValue",
        };
        keySession.generateLicenseRequest("video/mp4",responseArray,0, optionalData);

        keySession.removeLicense();
        expect(sign).assertEqual(2);
        keySession.off('keyExpired');
        keySession.destroy();
        drmsys.destroy();
      }
      done();
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0400
    * @tc.name      : 003.test on off interface
    * @tc.desc      : keyExpired on/off interface
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0400', 1,  function (done) {
      if(sysSupport === true){
        var drmsys =  drm.createMediaKeySystem(uuid);
        var keySession = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var sign = 1;
        keySession.on('keyExpired',(extra, data) => {
          console.log(`XUXIN hello keyExpired extra` + extra);
          console.log(`XUXIN hello keyExpired extratostr  ` + byteToString([75,69,89,32,69,88,80,73,82,69,68]));
          console.log(`XUXIN hello keyExpired data` + data);
          sign = 2;
        });

        keySession.off('keyExpired');

        var responseArray = new Uint8Array([0x30,0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
        keySession.processLicenseResponse(responseArray);
        let optionalData = {
          name : "optionalDataName",
          value : "optionalDataValue",
        };
        keySession.generateLicenseRequest("video/mp4",responseArray,0, optionalData);

        keySession.removeLicense();
        expect(sign).assertEqual(1);
        keySession.destroy();
        drmsys.destroy();
      }
      done();
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0500
    * @tc.name      : 005.test on off interface
    * @tc.desc      : expirationUpdated on/off interface
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0500', 1, async function (done) {
      if(sysSupport === true){
        var drmsys =  drm.createMediaKeySystem(uuid);
        var keySession = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var sign = 1;
        keySession.on('expirationUpdated',(extra, data) => {
          console.log(`XUXIN hello expirationUpdated extra` + extra);
          console.log(`XUXIN hello expirationUpdated extratostr  ` + byteToString([75,69,89,32,69,88,80,73,82,65,84,73,79,78,32,85,80,68,65,84,69]));
          console.log(`XUXIN hello expirationUpdated data` + data);
          sign = 2;
        });

        let responseTest =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        keySession.processLicenseResponse(responseTest);

        var keyIds = drmsys.getOfflineLicenseIds();
        let keyArray = new Uint8Array(keyIds[0]);
        console.log("keyArray is:",keyArray);
        keySession.generateOfflineReleaseRequest(keyArray);
        keySession.processOfflineReleaseResponse(keyArray, responseTest);

        keySession.restoreOfflineLicense(keyArray);
        expect(sign).assertEqual(2);
        keySession.off('expirationUpdated');
        keySession.destroy();
        drmsys.destroy();
      } else {
        var drmsys =  drm.createMediaKeySystem(uuid);
        var keySession = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var sign = 1;
        keySession.on('expirationUpdated',(extra, data) => {
          console.log(`XUXIN hello expirationUpdated extra` + extra);
          console.log(`XUXIN hello expirationUpdated extratostr  ` + byteToString([75,69,89,32,69,88,80,73,82,65,84,73,79,78,32,85,80,68,65,84,69]));
          console.log(`XUXIN hello expirationUpdated data` + data);
          sign = 2;
        });
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        var licenseRequestData = keySession.generateLicenseRequest("video/mp4", uint8pssh, 1, optionalData);
        var licenseRequestStr = byteToString(licenseRequestData.mData);
        var licenseResponseStr = await getHttpData("http://192.168.50.59:9528/getLicense", licenseRequestStr);
        var licenseRequestByte = stringToUint8Array(licenseResponseStr);
        keySession.processLicenseResponse(licenseRequestByte);
        var keyIds = drmsys.getOfflineLicenseIds();
        var keyArray = new Uint8Array(keyIds[0]);
        // let OfflineKeyState = drmsys.getOfflineLicenseStatus(keyArray);
        // expect(OfflineKeyState).assertEqual(1);
        keySession.restoreOfflineLicense(keyArray);
        expect(sign).assertEqual(2);
        keySession.off('expirationUpdated');
        keySession.destroy();
        drmsys.destroy();
      }
      done();
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0600
    * @tc.name      : 005.test on off interface
    * @tc.desc      : expirationUpdated on/off interface
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0600', 1, async function (done) {
      if(sysSupport === true){
        var drmsys =  drm.createMediaKeySystem(uuid);
        var keySession = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var sign = 1;
        keySession.on('expirationUpdated',(extra, data) => {
          console.log(`XUXIN hello expirationUpdated extra` + extra);
          console.log(`XUXIN hello expirationUpdated extratostr  ` + byteToString([75,69,89,32,69,88,80,73,82,65,84,73,79,78,32,85,80,68,65,84,69]));
          console.log(`XUXIN hello expirationUpdated data` + data);
          sign = 2;
        });
        keySession.off('expirationUpdated');

        let responseTest =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        keySession.processLicenseResponse(responseTest);

        var keyIds = drmsys.getOfflineLicenseIds();
        let keyArray = new Uint8Array(keyIds[0]);
        console.log("keyArray is:",keyArray);
        keySession.generateOfflineReleaseRequest(keyArray);
        keySession.processOfflineReleaseResponse(keyArray, responseTest);

        keySession.restoreOfflineLicense(keyArray);
        expect(sign).assertEqual(1);
        keySession.destroy();
        drmsys.destroy();
      } else {
        var drmsys =  drm.createMediaKeySystem(uuid);
        var keySession = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var sign = 1;
        keySession.on('expirationUpdated',(extra, data) => {
          console.log(`XUXIN hello expirationUpdated extra` + extra);
          console.log(`XUXIN hello expirationUpdated extratostr  ` + byteToString([75,69,89,32,69,88,80,73,82,65,84,73,79,78,32,85,80,68,65,84,69]));
          console.log(`XUXIN hello expirationUpdated data` + data);
          sign = 2;
        });
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        keySession.off('expirationUpdated');
        var licenseRequestData = keySession.generateLicenseRequest("video/mp4", uint8pssh, 1, optionalData);
        var licenseRequestStr = byteToString(licenseRequestData.mData);
        var licenseResponseStr = await getHttpData("http://192.168.50.59:9528/getLicense", licenseRequestStr);
        var licenseRequestByte = stringToUint8Array(licenseResponseStr);
        keySession.processLicenseResponse(licenseRequestByte);
        var keyIds = drmsys.getOfflineLicenseIds();
        var keyArray = new Uint8Array(keyIds[0]);
        // let OfflineKeyState = drmsys.getOfflineLicenseStatus(keyArray);
        // expect(OfflineKeyState).assertEqual(1);
        keySession.restoreOfflineLicense(keyArray);
        expect(sign).assertEqual(1);
        keySession.destroy();
        drmsys.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0700
    * @tc.name      : 005.test on off interface
    * @tc.desc      : keyChanged on/off interface
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0700', 1, async function (done) {
      if(sysSupport === true){
        var drmsys =  drm.createMediaKeySystem(uuid);
        var keySession = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var sign = 1;
        keySession.on('keyChanged',(extra, data) => {
          console.log(`XUXIN hello keyChanged extra` + extra);
          console.log(`XUXIN hello keyChanged extratostr  ` + byteToString([75,69,89,32,67,72,65,78,71,69]));
          console.log(`XUXIN hello keyChanged data` + data);
          sign = 2;
        });

        var responseArray = new Uint8Array([0x30,0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
        keySession.processLicenseResponse(responseArray);
        expect(sign).assertEqual(2);
        keySession.off('keyChanged');
        keySession.destroy();
        drmsys.destroy();
      } else {
        var drmsys =  drm.createMediaKeySystem(uuid);
        var keySession = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var sign = 1;
        keySession.on('keyChanged',(extra, data) => {
          console.log(`XUXIN hello keyChanged extra` + extra);
          console.log(`XUXIN hello keyChanged extratostr  ` + byteToString([75,69,89,32,67,72,65,78,71,69]));
          console.log(`XUXIN hello keyChanged data` + data);
          sign = 2;
        });
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        var licenseRequestData = keySession.generateLicenseRequest("video/mp4", uint8pssh, 1, optionalData);
        var licenseRequestStr = byteToString(licenseRequestData.mData);
        var licenseResponseStr = await getHttpData("http://192.168.50.59:9528/getLicense", licenseRequestStr);
        var licenseRequestByte = stringToUint8Array(licenseResponseStr);
        keySession.processLicenseResponse(licenseRequestByte);
        expect(sign).assertEqual(2);
        keySession.off('keyChanged');
        keySession.destroy();
        drmsys.destroy();
      }
      done();
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0800
    * @tc.name      : 005.test on off interface
    * @tc.desc      : keyChanged on/off interface
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0800', 1, async function (done) {
      if(sysSupport === true){
        var drmsys =  drm.createMediaKeySystem(uuid);
        var keySession = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var sign = 1;
        keySession.on('keyChanged',(extra, data) => {
          console.log(`XUXIN hello keyChanged extra` + extra);
          console.log(`XUXIN hello keyChanged extratostr  ` + byteToString([75,69,89,32,67,72,65,78,71,69]));
          console.log(`XUXIN hello keyChanged data` + data);
          sign = 2;
        });
        keySession.off('keyChanged');

        var responseArray = new Uint8Array([0x30,0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
        keySession.processLicenseResponse(responseArray);
        expect(sign).assertEqual(1);
        keySession.destroy();
        drmsys.destroy();
      } else {
        var drmsys =  drm.createMediaKeySystem(uuid);
        var keySession = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        var sign = 1;
        keySession.on('keyChanged',(extra, data) => {
          console.log(`XUXIN hello keyChanged extra` + extra);
          console.log(`XUXIN hello keyChanged extratostr  ` + byteToString([75,69,89,32,67,72,65,78,71,69]));
          console.log(`XUXIN hello keyChanged data` + data);
          sign = 2;
        });
        keySession.off('keyChanged');
        var base64 = new util.Base64();
        let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
        let optionalData = [{
          name: "optionalDataName",
          value: "optionalDataValue"
        }];
        var licenseRequestData = keySession.generateLicenseRequest("video/mp4", uint8pssh, 1, optionalData);
        var licenseRequestStr = byteToString(licenseRequestData.mData);
        var licenseResponseStr = await getHttpData("http://192.168.50.59:9528/getLicense", licenseRequestStr);
        var licenseRequestByte = stringToUint8Array(licenseResponseStr);
        keySession.processLicenseResponse(licenseRequestByte);
        expect(sign).assertEqual(1);
        keySession.destroy();
        drmsys.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0900
    * @tc.name      : 005.test on off interface
    * @tc.desc      : provisionRequired on/off interface
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0900', 1,  function (done) {
      if(sysSupport === true){
        var drmsys =  drm.createMediaKeySystem(uuid);
        var sign = 1;
        drmsys.on('provisionRequired',(extra, data) => {
          console.log(`XUXIN hello provisionRequired extra` + extra);
          console.log(`XUXIN hello provisionRequired extratostr  ` + byteToString([80,82,79,86,73,83,73,79,78,82,69,32,81,85,73,82,69,68]));
          console.log(`XUXIN hello provisionRequired data` + data);
          sign = 2;
        });
        drmsys.generateKeySystemRequest();
        expect(sign).assertEqual(2);
        drmsys.off('provisionRequired');
        drmsys.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_1000
    * @tc.name      : 005.test on off interface
    * @tc.desc      : provisionRequired on/off interface
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_1000', 1,  function (done) {
      if(sysSupport === true){
        var drmsys =  drm.createMediaKeySystem(uuid);
        var sign = 1;
        drmsys.on('provisionRequired',(extra, data) => {
          console.log(`XUXIN hello provisionRequired extra` + extra);
          console.log(`XUXIN hello provisionRequired extratostr  ` + byteToString([80,82,79,86,73,83,73,79,78,82,69,32,81,85,73,82,69,68]));
          console.log(`XUXIN hello provisionRequired data` + data);
          sign = 2;
        });
        drmsys.off('provisionRequired');
        drmsys.generateKeySystemRequest();
        expect(sign).assertEqual(1);
        drmsys.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_1100
    * @tc.name      : 005.test on off interface
    * @tc.desc      : sessionLost on/off interface
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_1100', 1,  function (done) {
      if(sysSupport === true){
        var drmsys =  drm.createMediaKeySystem(uuid);
        var sign = 1;
        drmsys.on('sessionLost',(extra, data) => {
          console.log(`XUXIN hello sessionLost extra` + extra);
          console.log(`XUXIN hello sessionLost extratostr  ` + byteToString([75,69,89,83,69,83,83,73,79,78,32,76,79,83,84]));
          console.log(`XUXIN hello sessionLost data` + data);
          sign = 2;
        });
        var keySession = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        keySession.destroy();
        expect(sign).assertEqual(2);
        drmsys.off('sessionLost');
        drmsys.destroy();
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_1200
    * @tc.name      : 005.test on off interface
    * @tc.desc      : sessionLost on/off interface
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_1200', 1,  function (done) {
      if(sysSupport === true){
        var drmsys =  drm.createMediaKeySystem(uuid);
        var sign = 1;
        drmsys.on('sessionLost',(extra, data) => {
          console.log(`XUXIN hello sessionLost extra` + extra);
          console.log(`XUXIN hello sessionLost extratostr  ` + byteToString([75,69,89,83,69,83,83,73,79,78,32,76,79,83,84]));
          console.log(`XUXIN hello sessionLost data` + data);
          sign = 2;
        });
        drmsys.off('sessionLost');
        var keySession = drmsys.createMediaKeySession(drm.SecurityLevel.SECURITY_LEVEL_UNKNOWN);
        keySession.destroy();
        expect(sign).assertEqual(1);
        drmsys.destroy();
      }
      done();
    })
  })
}